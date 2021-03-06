--
--  Copyright (c) 2015, John Leimon <jleimon@gmail.com>
--
--  Permission to use, copy, modify, and/or distribute this software for any
--  purpose with or without fee is hereby granted, provided that the above copyright
--  notice and this permission notice appear in all copies.
--
--  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD
--  TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN
--  NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
--  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
--  PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
--  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--

pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package xlocale_h is

   type uu_locale_struct_uu_locales_array is array (0 .. 12) of System.Address;
   type uu_locale_struct_uu_names_array is array (0 .. 12) of Interfaces.C.Strings.chars_ptr;
   type uu_locale_struct is record
      uu_locales : aliased uu_locale_struct_uu_locales_array;  -- /usr/include/xlocale.h:30
      uu_ctype_b : access unsigned_short;  -- /usr/include/xlocale.h:33
      uu_ctype_tolower : access int;  -- /usr/include/xlocale.h:34
      uu_ctype_toupper : access int;  -- /usr/include/xlocale.h:35
      uu_names : aliased uu_locale_struct_uu_names_array;  -- /usr/include/xlocale.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, uu_locale_struct);  -- /usr/include/xlocale.h:27

   --  skipped empty struct uu_locale_data

   type uu_locale_t is access all uu_locale_struct;  -- /usr/include/xlocale.h:39

   subtype locale_t is uu_locale_t;  -- /usr/include/xlocale.h:42

end xlocale_h;
