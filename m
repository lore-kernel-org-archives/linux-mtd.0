Received: from freya.yggdrasil.com ([209.249.10.20] helo=ns1.yggdrasil.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HSOd-00027d-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jul 2001 16:47:28 +0100
From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Tue, 3 Jul 2001 08:53:00 -0700
Message-Id: <200107031553.IAA00712@baldur.yggdrasil.com>
To: sjhill@cotw.com
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols
Cc: dwmw2@redhat.com, linux-mtd@lists.infradead.org
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

>David has fixed this and it is in the MTD CVS now.
[...]
>I have filled in the #define values and placed the new 'spia.c' into
>the MTD CVS. I added comments for how those various values should be
>defined. [...]

	Sounds good.  Thanks.

	By the way, here is a hand editted patch that allows those
parameters to be modified as module or kernel arguments.  I don't
know if it's worthwhile or not.  Feel free to apply or discard as
you see fit.

Adam J. Richter     __     ______________   4880 Stevens Creek Blvd, Suite 104
adam@yggdrasil.com     \ /                  San Jose, California 95129-1034
+1 408 261-6630         | g g d r a s i l   United States of America
fax +1 408 261-6631      "Free Software For The Rest Of Us."

--- linux-2.4.6-pre9/drivers/mtd/nand/spia.c	Tue Jul  3 07:02:32 2001
+++ linux/drivers/mtd/nand/spia.c	Tue Jul  3 08:28:38 2001
@@ -22,6 +22,23 @@
 #include <linux/mtd/partitions.h>
 #include <asm/io.h>
 
+/* Replace these with sensible values if you want defaults that will
+   work without extra kernel arguments. */
+static int spia_io_base = SPIA_IO_BASE;
+static int spia_fio_base = SPIA_FIO_BASE;
+static int spia_pedr = SPIA_PEDR;
+static int spia_peddr = SPIA_PEDDR;
+
+MODULE_PARM(spia_io_base, "i");
+MODULE_PARM(spia_fio_base, "i");
+MODULE_PARM(spia_pedr, "i");
+MODULE_PARM(spia_peddr, "i");
+
+__setup("spia_io_base=",spia_io_base);
+__setup("spia_fio_base=",spia_fio_base);
+__setup("spia_pedr=",spia_pedr);
+__setup("spia_peddr=",spia_peddr);
+
 /*
  * MTD structure for SPIA board
  */
@@ -77,11 +112,11 @@
 	 * Set GPIO Port E control register so that the pins are configured
 	 * to be outputs for controlling the NAND flash.
 	 */
-	(*(volatile unsigned char *) (IO_BASE + PEDDR)) = 0x07;
+	(*(volatile unsigned char *) (spia_io_base + spia_peddr)) = 0x07;
 
 	/* Set address of NAND IO lines */
-	this->IO_ADDR = FIO_BASE;
-	this->CTRL_ADDR = IO_BASE + PEDR;
+	this->IO_ADDR = spia_fio_base;
+	this->CTRL_ADDR = spia_io_base + spia_pedr;
 	this->CLE = 0x01;
 	this->ALE = 0x02;
 	this->NCE = 0x04;
