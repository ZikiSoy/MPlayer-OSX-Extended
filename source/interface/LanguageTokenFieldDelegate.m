/*  
 *  LanguageTokenFieldDelegate.m
 *  MPlayerOSX Extended
 *  
 *  Created on 17.11.2009
 *  
 *  Description:
 *	Delegate for mapping ISO-639 codes to tokens in a NSTokenField.
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

#import "LanguageTokenFieldDelegate.h"
#import "LanguageCodes.h"

@implementation LanguageTokenFieldDelegate

- (void) awakeFromNib
{
	NSMutableCharacterSet *set = [NSMutableCharacterSet whitespaceCharacterSet];
	[set formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
	
	[audioLanguageField setTokenizingCharacterSet:set];
	[subtitleLanguageField setTokenizingCharacterSet:set];
}

- (id)tokenField:(NSTokenField *)tokenField representedObjectForEditingString:(NSString *)editingString
{
	return [[LanguageCodes sharedInstance] threeLetterCodeForToken:editingString];
}

- (NSString *)tokenField:(NSTokenField *)tokenField displayStringForRepresentedObject:(id)representedObject
{
	return [[LanguageCodes sharedInstance] nameForCode:representedObject];
}

- (NSArray *)tokenField:(NSTokenField *)tokenField shouldAddObjects:(NSArray *)tokens atIndex:(NSUInteger)index
{
	NSMutableArray *validatedTokens = [NSMutableArray array];
	
	for (NSString *code in tokens) {
		if ([code length] == 3 && [[LanguageCodes sharedInstance] nameForCode:code])
			[validatedTokens addObject:code];
	}
	
	return validatedTokens;
}

@end
