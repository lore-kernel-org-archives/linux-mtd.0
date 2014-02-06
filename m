Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIKV-0003xg-FN
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:20:58 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00GGD9M7QYC0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:20:31 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 8/8] mtd: gen_probe: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:20:31 +0900
Message-id: <000a01cf2303$893c2cd0$9bb48670$%han@samsung.com>
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
 drivers/mtd/chips/gen_probe.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index ffb36ba..b57ceea 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -114,7 +114,6 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 	mapsize = sizeof(long) * DIV_ROUND_UP(max_chips, BITS_PER_LONG);
 	chip_map = kzalloc(mapsize, GFP_KERNEL);
 	if (!chip_map) {
-		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", map->name);
 		kfree(cfi.cfiq);
 		return NULL;
 	}
@@ -139,7 +138,6 @@ static struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chi
 	retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * sizeof(struct flchip), GFP_KERNEL);
 
 	if (!retcfi) {
-		printk(KERN_WARNING "%s: kmalloc failed for CFI private structure\n", map->name);
 		kfree(cfi.cfiq);
 		kfree(chip_map);
 		return NULL;
-- 
1.7.10.4
