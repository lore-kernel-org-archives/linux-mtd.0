Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BA6d6-0003rX-M7
	for linux-mtd@lists.infradead.org; Sun, 04 Apr 2004 13:21:36 +0100
Received: from kiire.colleduc.ee (localhost [127.0.0.1])
	by kiire.colleduc.ee (8.12.10/8.12.10) with ESMTP id i34CLYDS012252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sun, 4 Apr 2004 15:21:34 +0300
Received: from localhost (kalev@localhost)i34CLYIC012248
	for <linux-mtd@lists.infradead.org>; Sun, 4 Apr 2004 15:21:34 +0300
Date: Sun, 4 Apr 2004 15:21:34 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: CVS compile errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just wanted to notify that current CVS code as of 04/04/04 does not 
compile. Last snapshot that does compile is mtd-snapshot-20040327.

You probably know that, but I am reporting anyhow.

I have set the following options:
CONFIG_MTD=y
CONFIG_INFTL=y
CONFIG_MTD_DOC2001PLUS=y
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADDRESS=0
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y

Linux kernel version is 2.6.4.
Output from make is:

make -f scripts/Makefile.build obj=drivers/mtd/devices
  gcc -Wp,-MD,drivers/mtd/devices/.doc2001plus.o.d -nostdinc -iwithprefix 
include -D__KERNEL__ -Iinclude  -D__KERNEL__ -Iin
clude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing 
-fno-common -pipe -mpreferred-stack-boundary=2  -march
=pentium-mmx -Iinclude/asm-i386/mach-default -O2 -fomit-frame-pointer 
-Wdeclaration-after-statement    -DKBUILD_BASENAME=do
c2001plus -DKBUILD_MODNAME=doc2001plus -c -o 
drivers/mtd/devices/doc2001plus.o drivers/mtd/devices/doc2001plus.c
drivers/mtd/devices/doc2001plus.c: In function `DoC_IdentChip':
drivers/mtd/devices/doc2001plus.c:339: error: structure has no member 
named `chipshift'
make[3]: *** [drivers/mtd/devices/doc2001plus.o] Error 1
make[2]: *** [drivers/mtd/devices] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

And indeed, there is no member named chipshift in nand.h.

-- 
Best regards,
Kalev Lember
