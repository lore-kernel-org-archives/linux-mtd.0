Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIEj-0003Zb-8K
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:14:59 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00GYO9CAQYB0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:14:34 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 5/8] mtd: lpddr: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:14:33 +0900
Message-id: <000701cf2302$b477a380$1d66ea80$%han@samsung.com>
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
 drivers/mtd/lpddr/lpddr_cmds.c  |    4 +---
 drivers/mtd/lpddr/qinfo_probe.c |    5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index d38b646..018c75f 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -55,10 +55,8 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	int i, j;
 
 	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
-	if (!mtd) {
-		printk(KERN_ERR "Failed to allocate memory for MTD device\n");
+	if (!mtd)
 		return NULL;
-	}
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
 
diff --git a/drivers/mtd/lpddr/qinfo_probe.c b/drivers/mtd/lpddr/qinfo_probe.c
index 45abed6..69f2112 100644
--- a/drivers/mtd/lpddr/qinfo_probe.c
+++ b/drivers/mtd/lpddr/qinfo_probe.c
@@ -135,11 +135,8 @@ static int lpddr_chip_setup(struct map_info *map, struct lpddr_private *lpddr)
 {
 
 	lpddr->qinfo = kzalloc(sizeof(struct qinfo_chip), GFP_KERNEL);
-	if (!lpddr->qinfo) {
-		printk(KERN_WARNING "%s: no memory for LPDDR qinfo structure\n",
-				map->name);
+	if (!lpddr->qinfo)
 		return 0;
-	}
 
 	/* Get the ManuID */
 	lpddr->ManufactId = CMDVAL(map_read(map, map->pfow_base + PFOW_MANUFACTURER_ID));
-- 
1.7.10.4
