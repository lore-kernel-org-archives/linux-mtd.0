Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIJb-0003nf-Ug
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:20:03 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K008UA9KNVUA0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:19:35 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 7/8] mtd: cfi: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:19:35 +0900
Message-id: <000901cf2303$681cddb0$38569910$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, 'Huang Shijie' <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, 'Paul Parsons' <lost.distance@yahoo.com>,
 'Stefan Roese' <sr@denx.de>, 'David Woodhouse' <dwmw2@infradead.org>
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
 drivers/mtd/chips/cfi_cmdset_0001.c |    8 ++------
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++------
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 --
 drivers/mtd/chips/cfi_probe.c       |    4 +---
 drivers/mtd/chips/cfi_util.c        |    4 +---
 5 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index a19719e..5e74c86 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -434,10 +434,8 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	int i;
 
 	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
-	if (!mtd) {
-		printk(KERN_ERR "Failed to allocate memory for MTD device\n");
+	if (!mtd)
 		return NULL;
-	}
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
 
@@ -563,10 +561,8 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
 	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
 			* mtd->numeraseregions, GFP_KERNEL);
-	if (!mtd->eraseregions) {
-		printk(KERN_ERR "Failed to allocate memory for MTD erase region info\n");
+	if (!mtd->eraseregions)
 		goto setup_err;
-	}
 
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 718244d..e21fde9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -506,10 +506,8 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	int i;
 
 	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
-	if (!mtd) {
-		printk(KERN_WARNING "Failed to allocate memory for MTD device\n");
+	if (!mtd)
 		return NULL;
-	}
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
 
@@ -660,10 +658,8 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
 	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
 				    * mtd->numeraseregions, GFP_KERNEL);
-	if (!mtd->eraseregions) {
-		printk(KERN_WARNING "Failed to allocate memory for MTD erase region info\n");
+	if (!mtd->eraseregions)
 		goto setup_err;
-	}
 
 	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
 		unsigned long ernum, ersize;
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 8852942..6293855 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -175,7 +175,6 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	//printk(KERN_DEBUG "number of CFI chips: %d\n", cfi->numchips);
 
 	if (!mtd) {
-		printk(KERN_ERR "Failed to allocate memory for MTD device\n");
 		kfree(cfi->cmdset_priv);
 		return NULL;
 	}
@@ -188,7 +187,6 @@ static struct mtd_info *cfi_staa_setup(struct map_info *map)
 	mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info)
 			* mtd->numeraseregions, GFP_KERNEL);
 	if (!mtd->eraseregions) {
-		printk(KERN_ERR "Failed to allocate memory for MTD erase region info\n");
 		kfree(cfi->cmdset_priv);
 		kfree(mtd);
 		return NULL;
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index d255352..e8d0164 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -168,10 +168,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 		return 0;
 
 	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
-	if (!cfi->cfiq) {
-		printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
+	if (!cfi->cfiq)
 		return 0;
-	}
 
 	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
 
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index f992418..08049f6 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -116,10 +116,8 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
 	printk(KERN_INFO "%s Extended Query Table at 0x%4.4X\n", name, adr);
 
 	extp = kmalloc(size, GFP_KERNEL);
-	if (!extp) {
-		printk(KERN_ERR "Failed to allocate memory\n");
+	if (!extp)
 		goto out;
-	}
 
 #ifdef CONFIG_MTD_XIP
 	local_irq_disable();
-- 
1.7.10.4
