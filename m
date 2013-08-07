Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6xtR-00060w-2V
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 07:10:51 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR500HIJFX9IL70@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 16:10:22 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 1/7] mtd: sm_ftl: Staticize local symbols
Date: Wed, 07 Aug 2013 16:10:21 +0900
Message-id: <004001ce933d$2e2c5af0$8a8510d0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These local symbols are used only in this file.
Fix the following sparse warnings:

drivers/mtd/sm_ftl.c:25:25: warning: symbol 'cache_flush_workqueue' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:44:9: warning: symbol 'sm_attr_show' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:57:24: warning: symbol 'sm_create_sysfs_attributes' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:110:6: warning: symbol 'sm_delete_sysfs_attributes' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:574:5: warning: symbol 'sm_get_media_info' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:881:17: warning: symbol 'sm_get_zone' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:902:6: warning: symbol 'sm_cache_init' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:912:6: warning: symbol 'sm_cache_put' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:920:5: warning: symbol 'sm_cache_get' was not declared. Should it be static?
drivers/mtd/sm_ftl.c:931:5: warning: symbol 'sm_cache_flush' was not declared. Should it be static?

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/sm_ftl.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index f9d5615..32dbb1c 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -22,7 +22,7 @@
 
 
 
-struct workqueue_struct *cache_flush_workqueue;
+static struct workqueue_struct *cache_flush_workqueue;
 
 static int cache_timeout = 1000;
 module_param(cache_timeout, int, S_IRUGO);
@@ -41,7 +41,7 @@ struct sm_sysfs_attribute {
 	int len;
 };
 
-ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
+static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
 {
 	struct sm_sysfs_attribute *sm_attr =
@@ -54,7 +54,7 @@ ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 
 #define NUM_ATTRIBUTES 1
 #define SM_CIS_VENDOR_OFFSET 0x59
-struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
+static struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 {
 	struct attribute_group *attr_group;
 	struct attribute **attributes;
@@ -107,7 +107,7 @@ error1:
 	return NULL;
 }
 
-void sm_delete_sysfs_attributes(struct sm_ftl *ftl)
+static void sm_delete_sysfs_attributes(struct sm_ftl *ftl)
 {
 	struct attribute **attributes = ftl->disk_attributes->attrs;
 	int i;
@@ -571,7 +571,7 @@ static const uint8_t cis_signature[] = {
 };
 /* Find out media parameters.
  * This ideally has to be based on nand id, but for now device size is enough */
-int sm_get_media_info(struct sm_ftl *ftl, struct mtd_info *mtd)
+static int sm_get_media_info(struct sm_ftl *ftl, struct mtd_info *mtd)
 {
 	int i;
 	int size_in_megs = mtd->size / (1024 * 1024);
@@ -878,7 +878,7 @@ static int sm_init_zone(struct sm_ftl *ftl, int zone_num)
 }
 
 /* Get and automatically initialize an FTL mapping for one zone */
-struct ftl_zone *sm_get_zone(struct sm_ftl *ftl, int zone_num)
+static struct ftl_zone *sm_get_zone(struct sm_ftl *ftl, int zone_num)
 {
 	struct ftl_zone *zone;
 	int error;
@@ -899,7 +899,7 @@ struct ftl_zone *sm_get_zone(struct sm_ftl *ftl, int zone_num)
 /* ----------------- cache handling ------------------------------------------*/
 
 /* Initialize the one block cache */
-void sm_cache_init(struct sm_ftl *ftl)
+static void sm_cache_init(struct sm_ftl *ftl)
 {
 	ftl->cache_data_invalid_bitmap = 0xFFFFFFFF;
 	ftl->cache_clean = 1;
@@ -909,7 +909,7 @@ void sm_cache_init(struct sm_ftl *ftl)
 }
 
 /* Put sector in one block cache */
-void sm_cache_put(struct sm_ftl *ftl, char *buffer, int boffset)
+static void sm_cache_put(struct sm_ftl *ftl, char *buffer, int boffset)
 {
 	memcpy(ftl->cache_data + boffset, buffer, SM_SECTOR_SIZE);
 	clear_bit(boffset / SM_SECTOR_SIZE, &ftl->cache_data_invalid_bitmap);
@@ -917,7 +917,7 @@ void sm_cache_put(struct sm_ftl *ftl, char *buffer, int boffset)
 }
 
 /* Read a sector from the cache */
-int sm_cache_get(struct sm_ftl *ftl, char *buffer, int boffset)
+static int sm_cache_get(struct sm_ftl *ftl, char *buffer, int boffset)
 {
 	if (test_bit(boffset / SM_SECTOR_SIZE,
 		&ftl->cache_data_invalid_bitmap))
@@ -928,7 +928,7 @@ int sm_cache_get(struct sm_ftl *ftl, char *buffer, int boffset)
 }
 
 /* Write the cache to hardware */
-int sm_cache_flush(struct sm_ftl *ftl)
+static int sm_cache_flush(struct sm_ftl *ftl)
 {
 	struct ftl_zone *zone;
 
-- 
1.7.10.4
