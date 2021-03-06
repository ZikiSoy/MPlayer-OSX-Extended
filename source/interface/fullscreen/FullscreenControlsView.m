/*  
 *  FullscreenControlsView.m
 *  MPlayerOSX Extended
 *  
 *  Created on 03.11.2008
 *  
 *  Description:
 *	Window used for the fullscreen controls.
 *  
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#import "FullscreenControlsView.h"
#import "Debug.h"

@implementation FullscreenControlsView

- (void)awakeFromNib
{
	
	backgroudImage = [NSImage imageNamed:@"fc_background"];
	
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)rect
{
	[[NSColor clearColor] set];
    NSRectFill([self frame]);
	
    [backgroudImage drawAtPoint:NSZeroPoint
                       fromRect:NSZeroRect
                      operation:NSCompositeSourceOver
                       fraction:1.0];
	
	[[self window] invalidateShadow];
}

@end
