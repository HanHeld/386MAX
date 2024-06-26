//  Drawline - overlay a horizontal or vertical line
//   Copyright (c) 1990  Rex C. Conn   GNU General Public License version 3
//
//  Draws a horizontal or vertical line of the specified width (single or 
//  double) using line drawing characters, starting at the specified row
//  and column of the current window and continuing for len characters.
//
//  The line can overlay what is already on the screen, so that the
//  appropriate T, cross or corner character is generated if it runs into
//  another line on the screen at right angles to itself.
//
//  The overlay algorithm is rather complicated, and involves looking at
//  adjacent character cells to determine if the character generated should
//  connect in one direction or another.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "batproc.h"


static int pascal _line(int, int, int, int, int, int);
static int pascal _get_line_char(int, int);


#define N   1
#define S   2
#define E   4
#define W   8
#define H2  16
#define V2  32


static unsigned char breakdown[] = {
	N|S,		// '�'
	N|S|W,		// '�'
	N|S|W|H2,	// '�'
	N|S|W|V2,	// '�'
	S|W|V2,		// '�'
	S|W|H2,		// '�'
	N|S|W|H2|V2,	// '�'
	N|S|V2,		// '�'
	W|S|H2|V2,	// '�'
	N|W|H2|V2,	// '�'
	N|W|V2,		// '�'
	N|W|H2,		// '�'
	W|S,		// '�'
	N|E,		// '�'
	N|W|E,		// '�'
	W|E|S,		// '�'
	N|S|E,		// '�'
	E|W,		// '�'
	N|S|E|W,	// '�'
	N|S|E|H2,	// '�'
	N|S|E|V2,	// '�'
	N|E|H2|V2,	// '�'
	E|S|H2|V2,	// '�'
	N|E|W|H2|V2,	// '�'
	E|W|S|H2|V2,	// '�'
	N|S|E|H2|V2,	// '�'
	E|W|H2,		// '�'
	N|S|E|W|H2|V2,  // '�'
	N|E|W|H2,	// '�'
	N|E|W|V2,	// '�'
	E|W|S|H2,	// '�'
	E|W|S|V2,	// '�'
	N|E|V2,		// '�'
	N|E|H2,		// '�'
	S|E|H2,		// '�'
	S|E|V2,		// '�'
	N|S|E|W|V2,	// '�'
	N|S|E|W|H2,	// '�'
	N|W,		// '�'
	E|S,		// '�'
};


static unsigned char line_chars[] = {
	' ',		// empty
	'�',		// N
	'�',		// S
	'�',		// S|N
	'�',		// E
	'�',		// E|N
	'�',		// E|S
	'�',		// E|S|N
	'�',		// W
	'�',		// W|N
	'�',		// W|S
	'�',		// W|S|N
	'�',		// W|E
	'�',		// W|E|N
	'�',		// W|E|S
	'�',		// W|E|S|N
	' ',		// H2
	'�',		// H2|N
	'�',		// H2|S
	'�',		// H2|S|N
	'�',		// H2|E
	'�',		// H2|E|N
	'�',		// H2|E|S
	'�',		// H2|E|S|N
	'�',		// H2|W
	'�',		// H2|W|N
	'�',		// H2|W|S
	'�',		// H2|W|S|N
	'�',		// H2|W|E
	'�',		// H2|W|E|N
	'�',		// H2|W|E|S
	'�',		// H2|W|E|S|N
	' ',		// V2
	'�',		// V2|N
	'�',		// V2|S
	'�',		// V2|S|N
	'�',		// V2|E
	'�',		// V2|E|N
	'�',		// V2|E|S
	'�',		// V2|E|S|N
	'�',		// V2|W
	'�',		// V2|W|N
	'�',		// V2|W|S
	'�',		// V2|W|S|N
	'�',		// V2|W|E
	'�',		// V2|W|E|N
	'�',		// V2|W|E|S
	'�',		// V2|W|E|S|N
	' ',		// V2|H2
	'�',		// V2|H2|N
	'�',		// V2|H2|S
	'�',		// V2|H2|S|N
	'�',		// V2|H2|E
	'�',		// V2|H2|E|N
	'�',		// V2|H2|E|S
	'�',		// V2|H2|E|S|N
	'�',		// V2|H2|W
	'�',		// V2|H2|W|N
	'�',		// V2|H2|W|S
	'�',		// V2|H2|W|S|N
	'�',		// V2|H2|W|E
	'�',		// V2|H2|W|E|N
	'�',		// V2|H2|W|E|S
	'�' 		// V2|H2|W|E|S|N
};


// draw a horizontal or vertical line directly to the display
int drawline(int argc, register char **argv)
{
	unsigned int row, col, len, width;
	int attrib = -1;

	if (sscanf(argv[1],"%u%u%u%u",&row,&col,&len,&width) == 4)
		set_colors(argv+5,&attrib);

	return (((attrib < 0) || (_line(row,col,len,width,(toupper(argv[0][4]) == 'V'),attrib) != 0)) ? usage(DRAWLINE_USAGE) : 0);
}


// draw a box directly to the display
int drawbox(register int argc, register char **argv)
{
	unsigned int urow, lcol, lrow, rcol, style;
	int attrib = -1, fill = -1, width = 1;

	// draw the two horizontals & the two verticals
	if (sscanf(argv[1],"%u%u%u%u%u",&urow,&lcol,&lrow,&rcol,&style) == 5) {

		*argv = set_colors(argv+6,&attrib);

		for (argc = 0; ((*argv != NULL) && (argc <= 7)); argc++) {
			// check for background fill color match
			if (strnicmp(ntharg(*argv,1),colors[argc].shade,3) == 0) {
				fill = (argc << 4);
				break;
			}
		}
	}

	if (style == 0)
		width = 0;
	else if ((style == 2) || (style == 4))
		width = 2;

	if ((attrib < 0) || (verify_row_col(urow,lcol) == 0) || (verify_row_col(lrow,rcol) == 0))
		return (usage(DRAWBOX_USAGE));

	if (fill != -1)
		window(urow,lcol,lrow,rcol,0,fill);

	_line(urow,lcol,(rcol-lcol)+1,width,0,attrib);
	_line(lrow,lcol,(rcol-lcol)+1,width,0,attrib);

	if (style == 3)
		width = 2;
	else if (style == 4)
		width = 1;

	_line(urow,rcol,(lrow-urow)+1,width,1,attrib);
	_line(urow,lcol,(lrow-urow)+1,width,1,attrib);

	return 0;
}


// draw a line, making proper connectors along the way
static int pascal _line(int row, int col, int len, int width, int direction, int attrib)
{
	register int ch, i;
	int bits, bottom, right;

	if (verify_row_col(row,col) == 0)
		return ERROR_EXIT;

	bottom = screenrows();
	right  = screencols() - 1;

	for (i = 0; (i < len); i++) {

		// Read original character - if not a line drawing char,
		//  just write over it.  Otherwise, try to make a connector
		if (width == 0)
			ch = ' ';
		else if ((ch = _get_line_char(row,col)) == 0) {

			if (width == 0)
				ch = ' ';
			else if (direction == 0)
				ch = ((width == 1) ? '�' : '�');
			else
				ch = ((width == 1) ? '�' : '�');

		} else {

			bits = (char)((direction == 0) ? (breakdown[ch-179] & ~H2) | W | E | ((width == 1) ? 0 : H2) : (breakdown[ch-179] & ~V2) | N | S | ((width == 1) ? 0 : V2));

			if ((i == 0) || (i == len - 1)) {

				if ((i == 0) || (direction)) {
					// at end look & see if connect needed
					bits &= ~W;
					if ((col > 0) && ((ch = _get_line_char(row, col-1)) != 0)) {
						if (breakdown[ch-179] & E)
							bits |= W;
					}
				}

				if ((i == len - 1) || (direction)) {
					// at end look & see if connect needed
					bits &= ~E;
					if ((col < right) && ((ch = _get_line_char(row, col+1)) != 0)) {
						if (breakdown[ch-179] & W)
							bits |= E;
					}
				}

				if ((direction == 0) || (i == 0)) {
					// at end look & see if connect needed
					bits &= ~N;
					if ((row > 0) && ((ch = _get_line_char(row-1, col)) != 0)) {
						if (breakdown[ch-179] & S)
							bits |= N;
					}
				}

				if ((direction == 0) || (i == len - 1)) {
					// at end look & see if connect needed
					bits &= ~S;
					if ((row < bottom) && ((ch = _get_line_char(row+1, col)) != 0)) {
						if (breakdown[ch-179] & N)
							bits |= S;
					}
				}
			}

			ch = line_chars[bits];
		}
		write_char(row,col,attrib,ch);

		if (direction == 0) {
			if (++col > right)
				break;
		} else {
			if (++row > bottom)
				break;
		}
	}

	return 0;
}


// Read the character at the specified cursor location
//   Return 0 if not a line drawing char, or the character if it is
static int pascal _get_line_char(int row, int col)
{
	register int ch;

	ch = read_char(row,col);

	return (((ch < 179) || (ch > 218)) ? 0 : ch);
}


// make sure the specified row & column are on the screen!
int pascal verify_row_col(unsigned int row, unsigned int col)
{
	return (((row > screenrows()) || (col > (screencols() - 1))) ? 0 : 1);
}

