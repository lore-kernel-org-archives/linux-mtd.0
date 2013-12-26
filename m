Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1N4-0003Mu-O4
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:12:27 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE002RU8W39I40@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:12:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 14/23] mtd: txx9ndfmc: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:12:03 +0900
Message-id: <009001cf01e8$4029dec0$c07d9c40$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Atsushi Nemoto' <anemo@mba.ocn.ne.jp>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/txx9ndfmc.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 235714a..c1622a5 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -319,11 +319,8 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 			continue;
 		txx9_priv = kzalloc(sizeof(struct txx9ndfmc_priv),
 				    GFP_KERNEL);
-		if (!txx9_priv) {
-			dev_err(&dev->dev, "Unable to allocate "
-				"TXx9 NDFMC MTD device structure.\n");
+		if (!txx9_priv)
 			continue;
-		}
 		chip = &txx9_priv->chip;
 		mtd = &txx9_priv->mtd;
 		mtd->owner = THIS_MODULE;
-- 
1.7.10.4
