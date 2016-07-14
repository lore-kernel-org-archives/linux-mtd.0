Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNe9V-0004kS-1M
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 10:45:57 +0000
Date: Thu, 14 Jul 2016 13:44:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Marc St-Jean <stjeanma@pmc-sierra.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [patch] mtd: pmcmsp-flash: Allocating too much in init_msp_flash()
Message-ID: <20160714104456.GG18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is a cut and paste issue here.  The bug is that we are allocating
more memory than necessary for msp_maps.  We should be allocating enough
space for a map_info struct (144 bytes) but we instead allocate enough
for an mtd_info struct (1840 bytes).  It's a small waste.

The other part of this is not harmful but when we allocated msp_flash
then we allocated enough space fro a map_info pointer instead of an
mtd_info pointer.  But since pointers are the same size it works out
fine.

Anyway, I decided to clean up all three allocations a bit to make them
a bit more consistent and clear.

Fixes: 68aa0fa87f6d ('[MTD] PMC MSP71xx flash/rootfs mappings')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested!!

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 744ca5c..f9fa3fa 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -75,15 +75,15 @@ static int __init init_msp_flash(void)
 
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
 
-	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	msp_flash = kcalloc(fcnt, sizeof(*msp_flash), GFP_KERNEL);
 	if (!msp_flash)
 		return -ENOMEM;
 
-	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	msp_parts = kcalloc(fcnt, sizeof(*msp_parts), GFP_KERNEL);
 	if (!msp_parts)
 		goto free_msp_flash;
 
-	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
+	msp_maps = kcalloc(fcnt, sizeof(*msp_maps), GFP_KERNEL);
 	if (!msp_maps)
 		goto free_msp_parts;
 
