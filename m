Received: from f04s07.cac.psu.edu ([128.118.141.35] helo=f04n07.cac.psu.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c6oF-0005GD-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 15:59:15 +0100
Received: from nrl1 (nrl1.cedcc.psu.edu [130.203.252.61])
	by f04n07.cac.psu.edu (8.9.3/8.9.3) with SMTP id LAA30722
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 11:05:13 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bill <wrs122@psu.edu>
Reply-To: wrs122@psu.edu
To: linux-mtd@lists.infradead.org
Subject: CVS compile error...
Date: Wed, 29 Aug 2001 11:07:21 -0400
MIME-Version: 1.0
Message-Id: <01082911072100.01354@nrl1>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I downloaded the latest CVS and I'm compiling it on kernel 2.4.9. I am 
getting a compile error when I make bzImage...

make[3]: Entering directory `/usr/src/linux/drivers/mtd/devices'
make all_targets
make[4]: Entering directory `/usr/src/linux/drivers/mtd/devices'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes 
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common 
-pipe -mpreferred-stack-boundary=2 -march=i686    -c -o doc2000.o doc2000.c
doc2000.c: In function `DoC2k_init':
doc2000.c:578: structure has no member named `lock'
doc2000.c: In function `doc_read_ecc':
doc2000.c:619: structure has no member named `lock'
doc2000.c:739: structure has no member named `lock'
doc2000.c: In function `doc_write_ecc':
doc2000.c:768: structure has no member named `lock'
doc2000.c:832: structure has no member named `lock'
doc2000.c:885: structure has no member named `lock'
doc2000.c:905: structure has no member named `lock'
doc2000.c:908: structure has no member named `lock'
doc2000.c: In function `doc_read_oob':
doc2000.c:920: structure has no member named `lock'
doc2000.c:968: structure has no member named `lock'
doc2000.c: In function `doc_write_oob':
doc2000.c:1069: structure has no member named `lock'
doc2000.c:1072: structure has no member named `lock'
doc2000.c: In function `doc_erase':
doc2000.c:1085: structure has no member named `lock'
doc2000.c:1088: structure has no member named `lock'
doc2000.c:1133: structure has no member named `lock'
make[4]: *** [doc2000.o] Error 1
make[4]: Leaving directory `/usr/src/linux/drivers/mtd/devices'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/usr/src/linux/drivers/mtd/devices'
make[2]: *** [_subdir_devices] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2

Is it me, or is it a bug? I followed the instructions and included only what 
was specified in the config. (The defaults were left except for obvious ones 
I knew I didn't use... ex. sound).

-Bill
