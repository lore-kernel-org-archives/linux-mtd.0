Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu4Yz-0003ZD-DP
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 20:21:46 +0000
Received: by qgem9 with SMTP id m9so50227697qge.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 12:21:23 -0800 (PST)
Date: Wed, 4 Nov 2015 15:21:21 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
cc: linux-mtd@lists.infradead.org
Subject: mtd/sm_ftl.c: fix wrong do_div() usage
Message-ID: <alpine.LFD.2.20.1511041519320.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

do_div() is meant to be used with an unsigned dividend.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index c23184a47f..b096f8bb05 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -206,9 +206,10 @@ static loff_t sm_mkoffset(struct sm_ftl *ftl, int zone, int block, int boffset)
 }
 
 /* Breaks offset into parts */
-static void sm_break_offset(struct sm_ftl *ftl, loff_t offset,
+static void sm_break_offset(struct sm_ftl *ftl, loff_t loffset,
 			    int *zone, int *block, int *boffset)
 {
+	u64 offset = loffset;
 	*boffset = do_div(offset, ftl->block_size);
 	*block = do_div(offset, ftl->max_lba);
 	*zone = offset >= ftl->zone_count ? -1 : offset;
