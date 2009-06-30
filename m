Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLeaL-0005O1-5H
	for linux-mtd@lists.infradead.org; Tue, 30 Jun 2009 14:45:31 +0000
Subject: Re: Compile Error: structure has no member named lowest_vol_num
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Jun 2009 17:44:48 +0300
Message-Id: <1246373088.20721.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Biefel, Reiner \(NSN - DE/Munich\)" <reiner.biefel@nsn.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-25 at 14:12 +0200, Biefel, Reiner (NSN - DE/Munich)
wrote:
> Hello,
> 
> till snapshot a2d010f8fca904fffa3c6e5a5d148cc96a37a08a from 27.02.2009 I
> can compile the sources. Also cross-compile worked fine.
> All releases after that release I couldn't compile anymore.
> 
> I allways get the error
> ./src/libubi.c:347: error: structure has no member named
> `lowest_vol_num'
> 
> >From my try to compile git snapshot version
> mtd-utils-e4d5eea6414093fb074b19585cb8bebadc2d3e0e.tar.gz from
> 2009-06-08
> .....
> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
> -utils/pfi.o ./src/pfi.c -g
> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
> tils/old-utils/.pfi.c.dep
> gcc -I /utran/fdd/nodeb/opt/i686-pc-linux-gnu/zlib/include -I
> /utran/fdd/nodeb/opt/i686-pc-linux-gnu//lzo/include -I
> /utran/fdd/nodeb/opt/i686-pc-linux-gnu/e2fsprogs/include -I./include
> -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -Iinclude -Isrc -I../include
> -D_FILE_OFFSET_BITS=64 -I./inc -I./src -I../../include -std=gnu99
> -DPACKAGE_VERSION=\"1.0\" -D_FILE_OFFSET_BITS=64 -O2 -Wall -Wextra
> -Wwrite-strings -Wno-sign-compare -Wall -Wextra -Wwrite-strings
> -Wno-sign-compare -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o
> /utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/old
> -utils/libubi.o ./src/libubi.c -g
> -Wp,-MD,/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-u
> tils/old-utils/.libubi.c.dep
> ./src/libubi.c: In function `ubi_get_dev_info1':
> ./src/libubi.c:347: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:355: error: structure has no member named
> `highest_vol_num'
> ./src/libubi.c:356: error: structure has no member named
> `highest_vol_num'
> ./src/libubi.c:357: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:358: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:364: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:365: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:367: error: structure has no member named `avail_ebs'
> ./src/libubi.c:369: error: structure has no member named `total_ebs'
> ./src/libubi.c:373: error: structure has no member named `eb_size'
> ./src/libubi.c:384: error: structure has no member named `avail_ebs'
> ./src/libubi.c:384: error: structure has no member named `eb_size'
> ./src/libubi.c:385: error: structure has no member named `total_ebs'
> ./src/libubi.c:385: error: structure has no member named `eb_size'
> ./src/libubi.c: In function `ubi_get_vol_info1':
> ./src/libubi.c:439: error: structure has no member named `rsvd_ebs'
> ./src/libubi.c:442: error: structure has no member named `eb_size'
> ./src/libubi.c:449: error: structure has no member named `eb_size'
> ./src/libubi.c:449: error: structure has no member named `rsvd_ebs'
> ./src/libubi.c: In function `find_vol_num':
> ./src/libubi.c:894: error: structure has no member named
> `lowest_vol_num'
> ./src/libubi.c:894: error: structure has no member named
> `highest_vol_num'
> make[2]: ***
> [/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/ol
> d-utils/libubi.o] Error 1
> make[2]: Leaving directory
> `/utran/fdd/nodeb/opt/src/build/i686-pc-linux-gnu/mtd-utils/ubi-utils/ol
> d-utils'
> make[1]: *** [subdirs_old-utils_all] Error 2

Hi Mike,

this seems to be after your build system re-work. Do you have any
idea what could be wrong? I cannot reproduce this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
