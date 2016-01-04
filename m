Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCJr-0004uC-HA
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:05:37 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] MTD: lantiq: xway: fix invalid operator
Date: Mon,  4 Jan 2016 22:04:56 +0100
Message-Id: <1451941501-42952-2-git-send-email-blogic@openwrt.org>
In-Reply-To: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

xway_read_byte should use a logic or and not an add operator when working
out the nand address.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/nand/xway_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 3b28db4..81ec685 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -124,7 +124,7 @@ static unsigned char xway_read_byte(struct mtd_info *mtd)
 	int ret;
 
 	spin_lock_irqsave(&ebu_lock, flags);
-	ret = ltq_r8((void __iomem *)(nandaddr + NAND_READ_DATA));
+	ret = ltq_r8((void __iomem *)(nandaddr | NAND_READ_DATA));
 	spin_unlock_irqrestore(&ebu_lock, flags);
 
 	return ret;
-- 
1.7.10.4
