Received: from synergieinf.net1.nerim.net ([213.41.145.98]
	helo=synergie-inf.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BXEj-0000c6-BB
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 10:53:49 +0100
Received: from archie.gsi.synergie-inf.com ([10.53.2.1])
	by gateway.synergie-inf.com ([127.0.0.1])
	with SMTP (MDaemon.PRO.v6.5.1.R)
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 11:52:59 +0200
Message-ID: <515CABE7496FD111AA3300201829FCBE2FFDF9@archie.gsi.synergie-inf.com>
From: Marc Neiger <m.neiger@synergie-inf.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 2 May 2003 11:52:57 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: zlib and uClinux
Reply-To: m.neiger@synergie-inf.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I try to compile uCLinux for coldfire including mtd patch, and I can't get
the mtd utils to compile.

uclinux : uClinux-dist-20030305.tar.gz
mtd patch : mtd-snapshot-20030427.tar.bz2

compile report :

make[2]: Entering directory `/home/mn/mtd/mtd/util'
m68k-elf-gcc -Os -g -fomit-frame-pointer -m5307 -DCONFIG_COLDFIRE  -Dlinux
-D__linux__ -Dunix -D__uClinux__ -DEMBED
-I/home/mn/uClinuxwrk/lib/uClibc/include -I/home/mn/uClinuxwrk/lib/libm
-I/home/mn/uClinuxwrk/lib/libcrypt_old -I/home/mn/uClinuxwrk -fno-builtin
-msep-data -I/home/mn/uClinuxwrk/linux-2.4.x/include -I../include -O2 -Wall
-Wstrict-prototypes -Wshadow   -c -o eraseall.o eraseall.c
eraseall.c:40: zlib.h: No such file or directory
make[2]: *** [eraseall.o] Error 1
make[2]: Leaving directory `/home/mn/mtd/mtd/util'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/mn/uClinuxwrk/user'
make: *** [subdirs] Error 1

Cheers,
Marc Neiger
 
Groupe Synergie Informatique
14 rue Saint Papoul
31000 Toulouse
Tel 05 34 41 38 42 Fax: 05 34 41 38 39
