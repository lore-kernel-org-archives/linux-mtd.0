Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1Hx-0003BE-3F
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:07:10 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0089A8NAA820@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:06:46 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 08/23] mtd: cs553x_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:06:46 +0900
Message-id: <008a01cf01e7$82e1e830$88a5b890$%han@samsung.com>
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
 drivers/mtd/nand/cs553x_nand.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index d469a9a..88109d3 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -199,7 +199,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	/* Allocate memory for MTD device structure and private data */
 	new_mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
 	if (!new_mtd) {
-		printk(KERN_WARNING "Unable to allocate CS553X NAND MTD device structure.\n");
 		err = -ENOMEM;
 		goto out;
 	}
-- 
1.7.10.4
