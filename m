Received: from nwd2mail10.analog.com ([137.71.25.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK9Gz-0007wH-0F
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 09:30:32 +0000
From: Bryan Wu <bryan.wu@analog.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] [MTD/NAND] Blackfin NFC driver: Fix bug - remove wrong
	operation in PM function of the BF54x NFC driver
Date: Wed, 30 Jan 2008 17:18:17 +0800
Message-Id: <1201684698-26936-3-git-send-email-bryan.wu@analog.com>
In-Reply-To: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
References: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
Cc: Bryan Wu <bryan.wu@analog.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no suspend/resume operation in NFC driver at all, currently.

Signed-off-by: Bryan Wu <bryan.wu@analog.com>
---
 drivers/mtd/nand/bf5xx_nand.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 542850c..2fe9678 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -760,9 +760,6 @@ static int bf5xx_nand_resume(struct platform_device *dev)
 {
 	struct bf5xx_nand_info *info = platform_get_drvdata(dev);
 
-	if (info)
-		bf5xx_nand_hw_init(info);
-
 	return 0;
 }
 
-- 
1.5.3.4
