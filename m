Received: from lorien.elatec.si ([193.77.58.106] helo=lorien.ee.elatec.si)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fsyeq-0003CO-5D
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 05:06:17 -0400
Received: from [192.168.0.3] (telperion.ee.elatec.si [192.168.0.3])
	by lorien.ee.elatec.si (8.12.11.20060308/8.12.11) with ESMTP id
	k5L8T8DX024458
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2006 10:29:08 +0200
Message-ID: <44990E2B.1030009@epico.si>
Date: Wed, 21 Jun 2006 11:15:23 +0200
From: Savin Zlobec <savin@epico.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND
Content-Type: multipart/mixed; boundary="------------020405070409000109090707"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020405070409000109090707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

this patch fixes nand status handling in nand_write_oob_std and
nand busy wait in nand_do_read_oob.

savin

--------------020405070409000109090707
Content-Type: text/x-patch;
 name="nand_base.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand_base.diff"

--- drivers/mtd/nand/nand_base.c.orig	2006-06-21 10:48:00.000000000 +0200
+++ drivers/mtd/nand/nand_base.c	2006-06-21 11:10:38.000000000 +0200
@@ -1174,11 +1174,11 @@
 	/* Send command to program the OOB data */
 	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 
 	status = chip->waitfunc(mtd, chip);
 
-	return status;
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 /**
  * nand_write_oob_syndrome - [REPLACABLE] OOB data write function for HW ECC
  *			     with syndrome - only for large page flash !
@@ -1269,14 +1269,10 @@
 
 	while(1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
 		buf = nand_transfer_oob(chip, buf, ops);
 
-		readlen -= ops->ooblen;
-		if (!readlen)
-			break;
-
 		if (!(chip->options & NAND_NO_READRDY)) {
 			/*
 			 * Apply delay or wait for ready/busy pin. Do this
 			 * before the AUTOINCR check, so no problems arise if a
 			 * chip which does auto increment is marked as
@@ -1286,10 +1282,14 @@
 				udelay(chip->chip_delay);
 			else
 				nand_wait_ready(mtd);
 		}
 
+		readlen -= ops->ooblen;
+		if (!readlen)
+			break;
+
 		/* Increment page address */
 		realpage++;
 
 		page = realpage & chip->pagemask;
 		/* Check, if we cross a chip boundary */

--------------020405070409000109090707--
