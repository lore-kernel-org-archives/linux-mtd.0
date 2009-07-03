Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMd6m-00018C-9l
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 07:23:02 +0000
Subject: Re: Compile Error: structure has no member named lowest_vol_num
From: Artem Bityutskiy <dedekind@infradead.org>
To: Riku Voipio <riku.voipio@iki.fi>
In-Reply-To: <8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 10:22:31 +0300
Message-Id: <1246605751.20721.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Biefel, Reiner \(NSN - DE/Munich\)" <reiner.biefel@nsn.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Riku,

I think this should fix your compilation issues which your reported
at #mtd some time ago.

On Wed, 2009-07-01 at 21:15 -0400, Mike Frysinger wrote:
> On Tue, Jun 30, 2009 at 10:44, Artem Bityutskiy wrote:
> > On Thu, 2009-06-25 at 14:12 +0200, Biefel, Reiner wrote:
> >>
> >> till snapshot a2d010f8fca904fffa3c6e5a5d148cc96a37a08a from 27.02.2009 I
> >> can compile the sources. Also cross-compile worked fine.
> >> All releases after that release I couldn't compile anymore.
> >>
> >> I allways get the error
> >> ./src/libubi.c:347: error: structure has no member named
> >> `lowest_vol_num'
> >>
> >> >From my try to compile git snapshot version
> >> mtd-utils-e4d5eea6414093fb074b19585cb8bebadc2d3e0e.tar.gz from
> >> 2009-06-08
> >> .....
> >> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
> >> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
> >> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
> >> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
> >> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
> >> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
> >> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
> >> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
> >> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
> >> -utils/pfi.o ./src/pfi.c -g
> >> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
> >> tils/old-utils/.pfi.c.dep
> >> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
> >> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
> >> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
> >> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
> >> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
> >> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
> >> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
> >> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
> >> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
> >> -utils/libubi.o ./src/libubi.c -g
> >> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
> >> tils/old-utils/.libubi.c.dep
> >> ./src/libubi.c: In function `ubi_get_dev_info1':
> >> ./src/libubi.c:347: error: structure has no member named
> >> `lowest_vol_num'
> >
> > this seems to be after your build system re-work. Do you have any
> > idea what could be wrong? I cannot reproduce this.
> 
> the CPPFLAGS in the env changes how make initializes/appends CPPFLAGS
> in sub-makes.  this causes the old ubi utils to find the newer headers
> at ubi-utils/include/ before the ubi-utils/old-utils/inc/.  i'd pose
> the question of whether keeping old-utils makes sense anymore ?  "old"
> sounds to me like "punt" ...
> 
> barring that, here is the simple fix:
> --- a/ubi-utils/old-utils/Makefile
> +++ b/ubi-utils/old-utils/Makefile
> @@ -5,8 +5,8 @@
>  KERNELHDR := ../../include
> 
>  CFLAGS ?= -O2 -g -Werror
> -CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
> -   -std=gnu99 -DPACKAGE_VERSION=\"1.0\"
> +CPPFLAGS := -I./inc -I./src -I$(KERNELHDR) \
> +   -std=gnu99 -DPACKAGE_VERSION=\"1.0\" $(CPPFLAGS)
> 
>  PERLPROGS = mkpfi ubicrc32.pl
> -mike
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
