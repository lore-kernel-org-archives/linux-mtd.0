Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b2fW-0000uo-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 15:49:34 +0000
Message-ID: <3AA7AAEE.FB7E4DC1@inventel.fr>
Date: Thu, 08 Mar 2001 16:53:18 +0100
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: mtd with 2.0.4-test6
References: <3AA3A2FF.9E25407A@inventel.fr> <31161.983802881@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,
I build the utilities for arm and almost all of these have been build without
any problem.
I got just one problem with the compr_zlib.c

In fact, I was compelled to explicitly give the zlib.h path. Should it be in my
glibc ?
Another point is that zalloc and zfree are defined as nozalloc and nozfree in
the 2.4.0 kernel headers. Do I have just to rename those two fields in
comp_zlib.c ?

Xavier.


arm-linux-gcc -O -Wall -I/usr/arm-linux -I../include
-I/home/xde/arm_linux/linux_2.4/linux/fs/cramfs/inflate   -c compr_zlib.c -o
compr_zlib.o
In file included from
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/stdio.h:40,
                 from compr_zlib.c:47:
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/bits/types.h:95:
warning: `__NFDBITS' redefined
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/linux/posix_types.h:22:
warning: this is the location of the previous definition
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/bits/types.h:97:
warning: `__FDMASK' redefined
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/linux/posix_types.h:34:
warning: this is the location of the previous definition
In file included from compr_zlib.c:47:
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/stdio.h:477:
warning: redefinition of `off_t'
/usr/lib/gcc-lib/arm-linux/2.95.2/../../../../arm-linux/include/linux/types.h:18:
warning: `off_t' previously declared here
compr_zlib.c: In function `zlib_compress':
compr_zlib.c:73: structure has no member named `zalloc'
compr_zlib.c:74: structure has no member named `zfree'
compr_zlib.c: In function `zlib_decompress':
compr_zlib.c:132: structure has no member named `zalloc'
compr_zlib.c:133: structure has no member named `zfree'
compr_zlib.c:136: warning: implicit declaration of function `inflateInit'
compr_zlib.c:148: warning: implicit declaration of function `inflate'
compr_zlib.c:153: warning: implicit declaration of function `inflateEnd'
make: *** [compr_zlib.o] Error 1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
