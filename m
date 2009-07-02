Received: from mail-vw0-f202.google.com ([209.85.212.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MMAta-00078G-3y
	for linux-mtd@lists.infradead.org; Thu, 02 Jul 2009 01:15:32 +0000
Received: by vwj40 with SMTP id 40so685576vwj.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jul 2009 18:15:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1246373088.20721.11.camel@localhost.localdomain>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 1 Jul 2009 21:15:03 -0400
Message-ID: <8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
Subject: Re: Compile Error: structure has no member named lowest_vol_num
To: dedekind@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Biefel, Reiner \(NSN - DE/Munich\)" <reiner.biefel@nsn.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 30, 2009 at 10:44, Artem Bityutskiy wrote:
> On Thu, 2009-06-25 at 14:12 +0200, Biefel, Reiner wrote:
>>
>> till snapshot a2d010f8fca904fffa3c6e5a5d148cc96a37a08a from 27.02.2009 I
>> can compile the sources. Also cross-compile worked fine.
>> All releases after that release I couldn't compile anymore.
>>
>> I allways get the error
>> ./src/libubi.c:347: error: structure has no member named
>> `lowest_vol_num'
>>
>> >From my try to compile git snapshot version
>> mtd-utils-e4d5eea6414093fb074b19585cb8bebadc2d3e0e.tar.gz from
>> 2009-06-08
>> .....
>> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
>> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
>> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
>> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
>> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
>> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
>> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
>> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
>> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
>> -utils/pfi.o ./src/pfi.c -g
>> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
>> tils/old-utils/.pfi.c.dep
>> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
>> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
>> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
>> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
>> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
>> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
>> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
>> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
>> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
>> -utils/libubi.o ./src/libubi.c -g
>> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
>> tils/old-utils/.libubi.c.dep
>> ./src/libubi.c: In function `ubi_get_dev_info1':
>> ./src/libubi.c:347: error: structure has no member named
>> `lowest_vol_num'
>
> this seems to be after your build system re-work. Do you have any
> idea what could be wrong? I cannot reproduce this.

the CPPFLAGS in the env changes how make initializes/appends CPPFLAGS
in sub-makes.  this causes the old ubi utils to find the newer headers
at ubi-utils/include/ before the ubi-utils/old-utils/inc/.  i'd pose
the question of whether keeping old-utils makes sense anymore ?  "old"
sounds to me like "punt" ...

barring that, here is the simple fix:
--- a/ubi-utils/old-utils/Makefile
+++ b/ubi-utils/old-utils/Makefile
@@ -5,8 +5,8 @@
 KERNELHDR := ../../include

 CFLAGS ?= -O2 -g -Werror
-CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
-   -std=gnu99 -DPACKAGE_VERSION=\"1.0\"
+CPPFLAGS := -I./inc -I./src -I$(KERNELHDR) \
+   -std=gnu99 -DPACKAGE_VERSION=\"1.0\" $(CPPFLAGS)

 PERLPROGS = mkpfi ubicrc32.pl
-mike
