Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUKIb-0002Xi-SM
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 20:26:42 +0000
Received: by mail-pa0-x22a.google.com with SMTP id ho8so52064153pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 12:26:21 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Simon Arlott <simon@fire.lp0.eu>,
 Brian Norris <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: bcm63xxpart: give width specifier an 'int', not 'size_t'
Date: Fri, 12 Feb 2016 12:26:04 -0800
Message-Id: <1455308764-47289-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes this warning:

>> drivers/mtd/bcm63xxpart.c:175:4: note: in expansion of macro 'pr_err'
       pr_err("invalid rootfs address: %*ph\n",
       ^
>> include/linux/kern_levels.h:4:18: warning: field width specifier '*' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/bcm63xxpart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 26c38a107576..41d1d3149c61 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -157,7 +157,7 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 		if (kstrtouint(buf->flash_image_start, 10, &rootfsaddr) ||
 				rootfsaddr < BCM963XX_EXTENDED_SIZE) {
 			pr_err("invalid rootfs address: %*ph\n",
-				sizeof(buf->flash_image_start),
+				(int)sizeof(buf->flash_image_start),
 				buf->flash_image_start);
 			goto invalid_tag;
 		}
@@ -166,7 +166,7 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 		if (kstrtouint(buf->kernel_address, 10, &kerneladdr) ||
 				kerneladdr < BCM963XX_EXTENDED_SIZE) {
 			pr_err("invalid kernel address: %*ph\n",
-				sizeof(buf->kernel_address),
+				(int)sizeof(buf->kernel_address),
 				buf->kernel_address);
 			goto invalid_tag;
 		}
@@ -174,7 +174,7 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 		STR_NULL_TERMINATE(buf->kernel_length);
 		if (kstrtouint(buf->kernel_length, 10, &kernellen)) {
 			pr_err("invalid kernel length: %*ph\n",
-				sizeof(buf->kernel_length),
+				(int)sizeof(buf->kernel_length),
 				buf->kernel_length);
 			goto invalid_tag;
 		}
@@ -182,7 +182,7 @@ static int bcm63xx_parse_cfe_nor_partitions(struct mtd_info *master,
 		STR_NULL_TERMINATE(buf->total_length);
 		if (kstrtouint(buf->total_length, 10, &totallen)) {
 			pr_err("invalid total length: %*ph\n",
-				sizeof(buf->total_length),
+				(int)sizeof(buf->total_length),
 				buf->total_length);
 			goto invalid_tag;
 		}
-- 
2.7.0.rc3.207.g0ac5344
