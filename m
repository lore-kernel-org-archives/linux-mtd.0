Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6S4L-0001BP-I7
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 10:54:21 +0100
Received: from lin01.mn-logistik.de (frdb-d9b963e9.pool.mediaWays.net
	[217.185.99.233])
	by mail05.iok.net (8.12.8/8.12.8) with ESMTP id h969qsN9011186
	for <linux-mtd@lists.infradead.org>; Mon, 6 Oct 2003 11:52:54 +0200
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id 2E7321FF60
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Oct 2003 11:21:04 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 6 Oct 2003 11:21:04 +0200
MIME-Version: 1.0
Message-Id: <200310061121.04067.h.schurig@mn-logistik.de>
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_AQTg/xJuN9VfIk+"
Subject: [PATCH] less clutter in 2.6 boot log
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_AQTg/xJuN9VfIk+
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This removes some of the clutter in the boot log when Kernel 2.6 comes up.

-- 
Try Linux 2.6 from BitKeeper for PXA2x0 CPUs at
http://www.mn-logistik.de/unsupported/linux-2.6/

--Boundary-00=_AQTg/xJuN9VfIk+
Content-Type: text/x-diff;
  charset="us-ascii";
  name="trivial-mtdprintk.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="trivial-mtdprintk.patch"

--- linux-2.6/drivers/mtd/mtdpart.c~trivial-printks
+++ linux-2.6/drivers/mtd/mtdpart.c
@@ -323,8 +323,6 @@
 	u_int32_t cur_offset = 0;
 	int i;
 
-	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
-
 	for (i = 0; i < nbparts; i++) {
 
 		/* allocate the partition structure */
@@ -411,7 +409,7 @@
 			slave->mtd.size = master->size - slave->offset;
 		cur_offset = slave->offset + slave->mtd.size;
 	
-		printk (KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset, 
+		printk (KERN_NOTICE "mtd: 0x%08x-0x%08x: \"%s\"\n", slave->offset, 
 			slave->offset + slave->mtd.size, slave->mtd.name);
 
 		/* let's do some sanity checks */
--- linux-2.6/drivers/mtd/chips/cfi_cmdset_0001.c~trivial-printks
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -183,10 +183,8 @@
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 /* Some Intel Strata Flash prior to FPO revision C has bugs in this area */ 
 			printk(KERN_WARNING "cfi_cmdset_0001: Suspend "
-			       "erase on write disabled.\n");
+			       "erase on write disabled\n");
 			extp->SuspendCmdSupport &= ~1;
-#else
-			printk(KERN_NOTICE "cfi_cmdset_0001: Erase suspend on write enabled\n");
 #endif
 		}
 		/* Install our own private info structure */
@@ -275,10 +273,10 @@
 	}
 
 	if ( cfi->cfiq->BufWriteTimeoutTyp && !FORCE_WORD_WRITE) {
-		printk(KERN_INFO "Using buffer write method\n" );
+		//printk(KERN_DEBUG "Using buffer write method\n" );
 		mtd->write = cfi_intelext_write_buffers;
 	} else {
-		printk(KERN_INFO "Using word write method\n" );
+		//printk(KERN_DEBUG "Using word write method\n" );
 		mtd->write = cfi_intelext_write_words;
 	}
 	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;

--Boundary-00=_AQTg/xJuN9VfIk+--
