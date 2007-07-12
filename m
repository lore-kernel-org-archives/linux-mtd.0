Received: from wa-out-1112.google.com ([209.85.146.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I90Ep-0003dW-15
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 11:05:52 -0400
Received: by wa-out-1112.google.com with SMTP id v33so202499wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jul 2007 08:05:50 -0700 (PDT)
Date: Thu, 12 Jul 2007 23:01:35 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
To: kirk@hpc.ee.ntu.edu.tw, dwmw2@infradead.org
Subject: [Patch] drivers/mtd/maps/tqm8xxl.c: Style cleanups
Message-ID: <20070712150135.GA4102@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: akpm@osdl.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Change C++ style comments into K&R's.
Cut long lines into pieces.

This patch is against 2.6.22.1, and can be also applied to
the last -mm tree.

Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>

---

 tqm8xxl.c |   41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

Index: linux-2.6.22.1/drivers/mtd/maps/tqm8xxl.c
===================================================================
--- a/drivers/mtd/maps/tqm8xxl.c	2007-04-26 11:08:32.000000000 +0800
+++ b/drivers/mtd/maps/tqm8xxl.c	2007-07-05 00:16:16.000000000 +0800
@@ -38,7 +38,7 @@
 #define FLASH_SIZE 0x00800000
 #define FLASH_BANK_MAX 4
 
-// trivial struct to describe partition information
+/* trivial struct to describe partition information*/
 struct mtd_part_def
 {
 	int nums;
@@ -46,7 +46,7 @@
 	struct mtd_partition* mtd_part;
 };
 
-//static struct mtd_info *mymtd;
+/*static struct mtd_info *mymtd;*/
 static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
 static struct map_info* map_banks[FLASH_BANK_MAX];
 static struct mtd_part_def part_banks[FLASH_BANK_MAX];
@@ -106,7 +106,7 @@
 	  .name = "jffs",
 	  .offset = 0x00200000,
 	  .size = 0x00200000,
-	  //.size = MTDPART_SIZ_FULL,
+	  /*.size = MTDPART_SIZ_FULL,*/
 	}
 };
 #endif
@@ -121,10 +121,11 @@
 	flash_addr = bd->bi_flashstart;
 	flash_size = bd->bi_flashsize;
 
-	//request maximum flash size address space
+	/*request maximum flash size address space*/
 	start_scan_addr = ioremap(flash_addr, flash_size);
 	if (!start_scan_addr) {
-		printk(KERN_WARNING "%s:Failed to ioremap address:0x%x\n", __FUNCTION__, flash_addr);
+		printk(KERN_WARNING "%s:Failed to ioremap address:0x%x\n",
+			__FUNCTION__, flash_addr);
 		return -EIO;
 	}
 
@@ -132,12 +133,14 @@
 		if(mtd_size >= flash_size)
 			break;
 
-		printk(KERN_INFO "%s: chip probing count %d\n", __FUNCTION__, idx);
+		printk(KERN_INFO "%s: chip probing count %d\n", __FUNCTION__,
+			idx);
 
 		map_banks[idx] = kzalloc(sizeof(struct map_info), GFP_KERNEL);
 		if(map_banks[idx] == NULL) {
 			ret = -ENOMEM;
-			/* FIXME: What if some MTD devices were probed already? */
+			/* FIXME: What if some MTD devices were probed
+			 already? */
 			goto error_mem;
 		}
 
@@ -145,7 +148,8 @@
 
 		if (!map_banks[idx]->name) {
 			ret = -ENOMEM;
-			/* FIXME: What if some MTD devices were probed already? */
+			/* FIXME: What if some MTD devices were probed
+			 already? */
 			goto error_mem;
 		}
 		sprintf(map_banks[idx]->name, "TQM8xxL%d", idx);
@@ -170,7 +174,7 @@
 			map_banks[idx]->phys += mtd_banks[idx-1]->size;
 		}
 
-		//start to probe flash chips
+		/*start to probe flash chips*/
 		mtd_banks[idx] = do_map_probe("cfi_probe", map_banks[idx]);
 
 		if (mtd_banks[idx]) {
@@ -178,7 +182,8 @@
 			mtd_size += mtd_banks[idx]->size;
 			num_banks++;
 
-			printk(KERN_INFO "%s: bank%d, name:%s, size:%dbytes \n", __FUNCTION__, num_banks,
+			printk(KERN_INFO "%s: bank%d, name:%s, size:%dbytes \n",
+				__FUNCTION__, num_banks,
 			mtd_banks[idx]->name, mtd_banks[idx]->size);
 		}
 	}
@@ -204,17 +209,21 @@
 
 	for(idx = 0; idx < num_banks ; idx++) {
 		if (part_banks[idx].nums == 0) {
-			printk(KERN_NOTICE "TQM flash%d: no partition info available, registering whole flash at once\n", idx);
+			printk(KERN_NOTICE "TQM flash%d: no partition info "
+				"available, registering whole flash at once\n",
+				idx);
 			add_mtd_device(mtd_banks[idx]);
 		} else {
-			printk(KERN_NOTICE "TQM flash%d: Using %s partition definition\n",
-					idx, part_banks[idx].type);
-			add_mtd_partitions(mtd_banks[idx], part_banks[idx].mtd_part,
-								part_banks[idx].nums);
+			printk(KERN_NOTICE "TQM flash%d: Using %s partition "
+				"definition\n",
+				idx, part_banks[idx].type);
+			add_mtd_partitions(mtd_banks[idx],
+				part_banks[idx].mtd_part, part_banks[idx].nums);
 		}
 	}
 #else
-	printk(KERN_NOTICE "TQM flash: registering %d whole flash banks at once\n", num_banks);
+	printk(KERN_NOTICE "TQM flash: registering %d whole flash banks at "
+		"once\n", num_banks);
 	for(idx = 0 ; idx < num_banks ; idx++)
 		add_mtd_device(mtd_banks[idx]);
 #endif
