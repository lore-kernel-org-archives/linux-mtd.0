Received: from bart.se.axis.com ([195.60.68.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfVda-0004c2-3I
	for linux-mtd@lists.infradead.org; Tue, 16 Sep 2008 08:10:18 +0000
Received: from bart.se.axis.com (bart.se.axis.com [127.0.0.1])
	by bart.se.axis.com (Postfix) with ESMTP id 8B1396407C
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 10:10:13 +0200 (CEST)
Received: from axis.com (edgar.se.axis.com [10.93.151.1])
	by bart.se.axis.com (Postfix) with ESMTP id 750AD63F20
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Sep 2008 10:10:13 +0200 (CEST)
Date: Tue, 16 Sep 2008 10:10:13 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@axis.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdoops at panic
Message-ID: <20080916081013.GD29650@edgar.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

While trying out the mtdoops module I ran into trouble when logging at panic.
Turns out that the mtdoops_inc_counter can sleep while preparing for the next
entry.

This small patch works fine for me.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@axis.com>

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 5a680e1..de6d151 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -208,7 +208,12 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 		printk(KERN_ERR "mtdoops: Write failure at %d (%td of %d written), err %d.\n",
 			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
 
-	mtdoops_inc_counter(cxt);
+	/*
+	 * Prepare for next log-entry. If we are in panic we'll defer this
+	 * step to after reboot because mtdoops_inc_counter might sleep.
+	 */
+	if (!panic)
+		mtdoops_inc_counter(cxt);
 }
 
