Received: from mail.glaze.se ([212.209.188.162] helo=rocket.glaze.se)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMu1L-0006Me-Jo
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 17:08:41 -0400
Received: from IBMJP (unknown [10.42.1.6])
	by rocket.glaze.se (Postfix) with ESMTP id 1DE0737645D
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 Oct 2005 22:47:26 +0200 (CEST)
From: "Jan Pedersen" <jan.pedersen@glaze.dk>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2005 22:47:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <20051004204726.1DE0737645D@rocket.glaze.se>
Subject: [patch] cfi: prevent kernel panic with cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using the cfi (common flash interface) driver, every word written to
the flash chips is followed by a operation complete poll. This poll is
intended to have a timeout of 1 ms. However this timeout is calculated by
HZ/1000, which happends to be 0 because HZ < 1000. The result of this is
that there will be just one poll for operation complete. If this single poll
fails, the kernel panics. This patch increases this timeout to HZ (1
second). This is far more than needed, but is preferred over a panic. This
fix is well tested and completely avoids the panic.

Signed-off-by: Jan Pedersen <jp@jp-embedded.com>
---
diff -Naur linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c
linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.4.31.org/drivers/mtd/chips/cfi_cmdset_0002.c	2004-11-17
06:54:21.000000000 -0500
+++ linux-2.4.31/drivers/mtd/chips/cfi_cmdset_0002.c	2005-08-22
12:14:17.000000000 -0400
@@ -510,7 +510,7 @@
 	   or tells us why it failed. */        
 	dq6 = CMD(1<<6);
 	dq5 = CMD(1<<5);
-	timeo = jiffies + (HZ/1000); /* setting timeout to 1ms for now */
+	timeo = jiffies + (HZ); /* setting timeout to 1s for now */
 		
 	oldstatus = cfi_read(map, adr);
 	status = cfi_read(map, adr);
