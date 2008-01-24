Received: from wr-out-0506.google.com ([64.233.184.239])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JI4B0-0007f3-Jr
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 15:39:44 +0000
Received: by wr-out-0506.google.com with SMTP id 50so85944wra.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Jan 2008 07:39:37 -0800 (PST)
Message-ID: <2c8de1360801240739oae8135bg55d829ff75642048@mail.gmail.com>
Date: Thu, 24 Jan 2008 09:39:36 -0600
From: "Chase Maupin" <cem8101@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Error compiling libubi with latest mtd-utils snapshot
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

I downloaded the latest mtd-utils snapshot from
git://git.infradead.org/mtd-utils.git and did a "make clean" followed
by "make".  The snapshot I downloaded was commited Jan 24, 2008 at
11:21 with commit tag e292b5fb39de2c6907ffe751391ae3bbd5603b91.

During the compile I received the following errors:

make -C ./ubi-utils
make[1]: Entering directory
`/home/chase/projects/wiki/mtd-utils.git.new/ubi-utils'
gcc -Iinclude -Isrc -I../include -O2 -Wall -Werror -Wall src/libubi.c
-c -o libubi.o
In file included from ../include/mtd/ubi-header.h:33,
                 from include/libubi.h:29,
                 from src/libubi.c:34:
/usr/include/asm/byteorder.h:6:2: #warning using private kernel
header; include <endian.h> instead!
In file included from include/libubi.h:29,
                 from src/libubi.c:34:
../include/mtd/ubi-header.h:158: error: syntax error before "__be32"
../include/mtd/ubi-header.h:158: warning: no semicolon at end of struct or union
../include/mtd/ubi-header.h:161: error: syntax error before "ec"
../include/mtd/ubi-header.h:161: warning: type defaults to `int' in
declaration of `ec'
../include/mtd/ubi-header.h:161: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:162: error: syntax error before "vid_hdr_offset"
../include/mtd/ubi-header.h:162: warning: type defaults to `int' in
declaration of `vid_hdr_offset'
../include/mtd/ubi-header.h:162: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:163: error: syntax error before "data_offset"
../include/mtd/ubi-header.h:163: warning: type defaults to `int' in
declaration of `data_offset'
../include/mtd/ubi-header.h:163: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:165: error: syntax error before "hdr_crc"
../include/mtd/ubi-header.h:165: warning: type defaults to `int' in
declaration of `hdr_crc'
../include/mtd/ubi-header.h:165: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:166: warning: empty declaration
../include/mtd/ubi-header.h:283: error: syntax error before "__be32"
../include/mtd/ubi-header.h:283: warning: no semicolon at end of struct or union
../include/mtd/ubi-header.h:288: error: syntax error before "vol_id"
../include/mtd/ubi-header.h:288: warning: type defaults to `int' in
declaration of `vol_id'
../include/mtd/ubi-header.h:288: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:289: error: syntax error before "lnum"
../include/mtd/ubi-header.h:289: warning: type defaults to `int' in
declaration of `lnum'
../include/mtd/ubi-header.h:289: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:290: error: syntax error before "leb_ver"
../include/mtd/ubi-header.h:290: warning: type defaults to `int' in
declaration of `leb_ver'
../include/mtd/ubi-header.h:290: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:291: error: syntax error before "data_size"
../include/mtd/ubi-header.h:291: warning: type defaults to `int' in
declaration of `data_size'
../include/mtd/ubi-header.h:291: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:292: error: syntax error before "used_ebs"
../include/mtd/ubi-header.h:292: warning: type defaults to `int' in
declaration of `used_ebs'
../include/mtd/ubi-header.h:292: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:293: error: syntax error before "data_pad"
../include/mtd/ubi-header.h:293: warning: type defaults to `int' in
declaration of `data_pad'
../include/mtd/ubi-header.h:293: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:294: error: syntax error before "data_crc"
../include/mtd/ubi-header.h:294: warning: type defaults to `int' in
declaration of `data_crc'
../include/mtd/ubi-header.h:294: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:295: error: conflicting types for 'padding1'
../include/mtd/ubi-header.h:160: error: previous declaration of
'padding1' was here
../include/mtd/ubi-header.h:296: error: syntax error before "sqnum"
../include/mtd/ubi-header.h:296: warning: type defaults to `int' in
declaration of `sqnum'
../include/mtd/ubi-header.h:296: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:297: error: conflicting types for 'padding2'
../include/mtd/ubi-header.h:164: error: previous declaration of
'padding2' was here
../include/mtd/ubi-header.h:298: error: syntax error before "hdr_crc"
../include/mtd/ubi-header.h:298: warning: type defaults to `int' in
declaration of `hdr_crc'
../include/mtd/ubi-header.h:298: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:299: warning: empty declaration
../include/mtd/ubi-header.h:368: error: syntax error before "__be32"
../include/mtd/ubi-header.h:368: warning: no semicolon at end of struct or union
../include/mtd/ubi-header.h:369: warning: type defaults to `int' in
declaration of `alignment'
../include/mtd/ubi-header.h:369: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:370: error: syntax error before "data_pad"
../include/mtd/ubi-header.h:370: warning: type defaults to `int' in
declaration of `data_pad'
../include/mtd/ubi-header.h:370: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:373: error: syntax error before "name_len"
../include/mtd/ubi-header.h:373: warning: type defaults to `int' in
declaration of `name_len'
../include/mtd/ubi-header.h:373: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:377: error: syntax error before "crc"
../include/mtd/ubi-header.h:377: warning: type defaults to `int' in
declaration of `crc'
../include/mtd/ubi-header.h:377: warning: data definition has no type
or storage class
../include/mtd/ubi-header.h:378: warning: empty declaration
make[1]: *** [libubi.o] Error 1
make[1]: Leaving directory
`/home/chase/projects/wiki/mtd-utils.git.new/ubi-utils'
make: *** [all] Error 2


The type __be32 is not defined in my /usr/include directory.  I did
find it define in my kernel tree under include/linux/types.h.  Can
someone give me a pointer on how to get this utility to compile
cleanly?

Thank You,
Chase Maupin
