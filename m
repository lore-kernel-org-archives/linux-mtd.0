Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1MG-0003Ld-P1
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:11:37 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE001EW8UO5640@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:11:12 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 13/23] mtd: pasemi_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:11:12 +0900
Message-id: <008f01cf01e8$21a7a8b0$64f6fa10$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Olof Johansson' <olof@lixom.net>, linux-mtd@lists.infradead.org,
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
 drivers/mtd/nand/pasemi_nand.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 90f871a..24cf045 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -114,8 +114,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	pasemi_nand_mtd = kzalloc(sizeof(struct mtd_info) +
 				  sizeof(struct nand_chip), GFP_KERNEL);
 	if (!pasemi_nand_mtd) {
-		printk(KERN_WARNING
-		       "Unable to allocate PASEMI NAND MTD device structure\n");
 		err = -ENOMEM;
 		goto out;
 	}
-- 
1.7.10.4
