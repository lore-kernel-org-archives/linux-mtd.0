Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1IV-0003Co-68
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:07:43 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE004VC8O9S270@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:07:21 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 09/23] mtd: diskonchip: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:07:20 +0900
Message-id: <008b01cf01e7$978b0fa0$c6a12ee0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
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
 drivers/mtd/nand/diskonchip.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index 0afafa0..fec31d7 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1058,7 +1058,6 @@ static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partitio
 
 	buf = kmalloc(mtd->writesize, GFP_KERNEL);
 	if (!buf) {
-		printk(KERN_ERR "DiskOnChip mediaheader kmalloc failed!\n");
 		return 0;
 	}
 	if (!(numheaders = find_media_headers(mtd, buf, "ANAND", 1)))
@@ -1166,7 +1165,6 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 
 	buf = kmalloc(mtd->writesize, GFP_KERNEL);
 	if (!buf) {
-		printk(KERN_ERR "DiskOnChip mediaheader kmalloc failed!\n");
 		return 0;
 	}
 
@@ -1564,7 +1562,6 @@ static int __init doc_probe(unsigned long physadr)
 	    sizeof(struct nand_chip) + sizeof(struct doc_priv) + (2 * sizeof(struct nand_bbt_descr));
 	mtd = kzalloc(len, GFP_KERNEL);
 	if (!mtd) {
-		printk(KERN_ERR "DiskOnChip kmalloc (%d bytes) failed!\n", len);
 		ret = -ENOMEM;
 		goto fail;
 	}
-- 
1.7.10.4
