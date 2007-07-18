Received: from mail.philosys.de ([193.100.254.1])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IB94o-00071x-Lf
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 08:56:24 -0400
Received: from philos.lan.philosys.de (mail.lan.philosys.de [10.100.254.1])
	by mail.philosys.de (8.11.6/8.11.6) with ESMTP id l6ICuIU17480
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2007 14:56:18 +0200
Received: from [10.100.254.83] (neo.lan.philosys.de [10.100.254.83])
	by philos.lan.philosys.de (8.13.6/8.13.6/SuSE Linux 0.8) with ESMTP id
	l6ICuB6x020244
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2007 14:56:13 +0200
Message-ID: <469E0DEB.5020102@philosys.de>
Date: Wed, 18 Jul 2007 14:56:11 +0200
From: Roland Stigge <Roland.Stigge@philosys.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers/mtd/nand/edb7312.c
Content-Type: multipart/mixed; boundary="------------000601030805010204040006"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000601030805010204040006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm attaching a fix for edb7312.c. Thomas (the author of the relevant code to 
fix) recommended to post it here.

The patch ensures that the current code (kernel 2.6.22) uses the bits like the 
code prior to the refactoring. The variable "bits" is employed in a useful way now.

Can you help integrating it into mainline or should I put it into 
bugzilla.kernel.org?

Thanks,
-- 
Roland Stigge
PHILOSYS Software GmbH
Edisonstr. 6
85716 Unterschleiﬂheim

Tel.: 089-321407-14
Fax:  089-321407-12
email: roland.stigge@philosys.de   stigge@debian.org   stigge@gnu.org
www: http://www.philosys.de/

--------------000601030805010204040006
Content-Type: text/x-patch;
 name="edb7312.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="edb7312.c.patch"

Fix refactoring of hwcontrol

Signed-off-by: Roland Stigge <stigge@antcom.de>

--- edb7312.c.orig	2007-07-18 12:55:59.000000000 +0200
+++ edb7312.c	2007-07-18 14:36:39.000000000 +0200
@@ -74,7 +74,7 @@
 /*
  *	hardware specific access to control-lines
  *
- *	NAND_NCE: bit 0 -> bit 7
+ *	NAND_NCE: bit 0 -> bit 6 (bit 7 = 1)
  *	NAND_CLE: bit 1 -> bit 4
  *	NAND_ALE: bit 2 -> bit 5
  */
@@ -83,12 +83,12 @@
 	struct nand_chip *chip = mtd->priv;
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		unsigned char bits;
+		unsigned char bits = 0x80;
 
-		bits = (ctrl & (NAND_CLE | NAND_ALE)) << 3;
-		bits = (ctrl & NAND_NCE) << 7;
+		bits |= (ctrl & (NAND_CLE | NAND_ALE)) << 3;
+		bits |= (ctrl & NAND_NCE) ? 0x00 : 0x40;
 
-		clps_writeb((clps_readb(ep7312_pxdr)  & 0xB0) | 0x10,
+		clps_writeb((clps_readb(ep7312_pxdr)  & 0xF0) | bits,
 			    ep7312_pxdr);
 	}
 	if (cmd != NAND_CMD_NONE)

--------------000601030805010204040006--
