Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtNOz-0005yb-Uf
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 15:17:10 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n91FGr7m028322
	for <linux-mtd@lists.infradead.org>; Thu, 1 Oct 2009 18:17:01 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtdoops: do not schedule work if we are going to die
Date: Thu,  1 Oct 2009 18:16:55 +0300
Message-Id: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
In-Reply-To: <>
References: <>
Cc: Artem.Bityutskiy@nokia.com, aaro.koskinen@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If panic_on_oops is set, the log should be written right away.

Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
---
 drivers/mtd/mtdoops.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1060337..ac67833 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -335,7 +335,7 @@ static void mtdoops_console_sync(void)
 	cxt->ready = 0;
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	if (mtd->panic_write && in_interrupt())
+	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
 		/* Interrupt context, we're going to panic so try and log */
 		mtdoops_write(cxt, 1);
 	else
-- 
1.5.4.3
