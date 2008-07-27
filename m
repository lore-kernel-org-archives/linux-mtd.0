Received: from po-out-1718.google.com ([72.14.252.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMzlO-00070r-VE
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 06:29:51 +0000
Received: by po-out-1718.google.com with SMTP id b23so7863501poe.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jul 2008 23:29:50 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 6/7] [MTD] Blackfin NFC Driver: use standard dev_err() rather
	than printk()
Date: Sun, 27 Jul 2008 14:27:58 +0800
Message-Id: <1217140079-20014-7-git-send-email-cooloney@kernel.org>
In-Reply-To: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
References: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index e259a7b..6cf7fb8 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -684,8 +684,7 @@ static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "(%p)\n", pdev);
 
 	if (peripheral_request_list(bfin_nfc_pin_req, DRV_NAME)) {
-		printk(KERN_ERR DRV_NAME
-		": Requesting Peripherals failed\n");
+		dev_err(&pdev->dev, "requesting Peripherals failed\n");
 		return -EFAULT;
 	}
 
-- 
1.5.6
