Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJnaE-0000gN-Ak
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 13:02:10 +0000
Received: by fxm15 with SMTP id 15so4682958fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jun 2010 06:02:09 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dwmw2 <dwmw2@infradead.org>
Subject: [PATCH 3/4] r852: update card detect early.
Date: Wed,  2 Jun 2010 16:01:47 +0300
Message-Id: <1275483708-11929-4-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
References: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This turns out to be the reason for DMA timeouts on resume,
if card was inserted while system was suspended

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 3f219e6..bcfc851 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -712,6 +712,7 @@ void r852_card_detect_work(struct work_struct *work)
 		container_of(work, struct r852_device, card_detect_work.work);
 
 	r852_card_update_present(dev);
+	r852_update_card_detect(dev);
 	dev->card_unstable = 0;
 
 	/* False alarm */
@@ -727,7 +728,6 @@ void r852_card_detect_work(struct work_struct *work)
 	else
 		r852_unregister_nand_device(dev);
 exit:
-	/* Update detection logic */
 	r852_update_card_detect(dev);
 }
 
-- 
1.7.0.4
