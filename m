Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Xpk2-0007gv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 20:57:14 +0100
Received: from srvmail-mtl.ubisoft.qc.ca (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA16224
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 17:02:51 -0400
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403F5CC04@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: MTD <linux-mtd@lists.infradead.org>
Subject: DOC 2000 
Date: Fri, 17 Aug 2001 15:56:56 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I need some help to add DOC support to a 2.2.19 kernel. It does not compile.
I have all the latest stuff from cvs. I am able to compile CFI into the
kernel, but the DOC part does not want to go in !!!

Do I need another patch ?

/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586   -c -o doc2000.o doc2000.c
doc2000.c:1102: parse error before `cleanup_doc2000'
doc2000.c:1103: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1118: warning: control reaches end of non-void function
doc2000.c: At top level:
doc2000.c:1120: warning: initialization from incompatible pointer type
make[4]: *** [doc2000.o] Error 1
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[2]: *** [_subdir_devices] Error 2
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.18/drivers'
make: *** [_dir_drivers] Error 2





Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
