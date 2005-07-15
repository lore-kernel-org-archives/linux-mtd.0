Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtGk0-0006is-2f
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 23:20:04 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id UAA08875
	for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2005 20:19:49 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j6F3Jm1n022809
	for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2005 20:19:49 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j6F3JmGj022807
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 20:19:48 -0700
Date: Thu, 14 Jul 2005 20:19:48 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050715031948.GA22659@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: NAND bbt build reads wrong oob data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The recent change to read only the bad block marker while building the
bad block table is giving me some trouble on an OMAP16xx H2, and I'm
trying to figure out where the problem lies (and I'm pretty new at NAND
flash as may become obvious).

The value read seems to be a different byte, perhaps offset 14 instead
of offset 5 as specified by the placement scheme.  The hack that seems
to fix it for me, namely to read the whole OOB area instead of the
individual byte, is below.  (I also got rid of some refs to scanlen
which is forced to zero for the ! NAND_BBT_SCANEMPTY case, and
NAND_BBT_SCAN2NDPAGE is triggering a BUG I haven't investigated yet.)

If anybody has a clue for me I'd be thankful; in any case, I'll further
educate myself on how this is supposed to work. -- Todd

Index: linux/drivers/mtd/nand/nand_bbt.c
===================================================================
--- linux.orig/drivers/mtd/nand/nand_bbt.c	2005-07-15 02:26:18.000000000 +0000
+++ linux/drivers/mtd/nand/nand_bbt.c	2005-07-15 02:42:41.000000000 +0000
@@ -300,7 +300,7 @@
 	if (!(bd->options & NAND_BBT_SCANEMPTY)) {
 		/* We need only read few bytes from the OOB area */
 		scanlen = ooblen = 0;
-		readlen = bd->len;
+		readlen = mtd->oobblock;
 	} else {
 		/* Full page content should be read */
 		scanlen	= mtd->oobblock + mtd->oobsize;
@@ -338,12 +338,13 @@
 				size_t retlen;
 				
 				/* No need to read pages fully, just read required OOB bytes */
-				ret = mtd->read_oob(mtd, from + j * mtd->oobblock + bd->offs,
-							readlen, &retlen, &buf[0]);
+				ret = mtd->read_oob(mtd, 
+						    from + j * mtd->oobblock,
+						    readlen, &retlen, &buf[0]);
 				if (ret)
 					return ret;
 
-				if (check_short_pattern (&buf[j * scanlen], scanlen, mtd->oobblock, bd)) {
+				if (check_short_pattern (&buf[bd->offs], readlen, mtd->oobblock, bd)) {
 					this->bbt[i >> 3] |= 0x03 << (i & 0x6);
 					printk (KERN_WARNING "Bad eraseblock %d at 0x%08x\n", 
 						i >> 1, (unsigned int) from);
@@ -969,7 +970,7 @@
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
 static struct nand_bbt_descr smallpage_memorybased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
+	.options = 0,
 	.offs = 5,
 	.len = 1,
 	.pattern = scan_ff_pattern
