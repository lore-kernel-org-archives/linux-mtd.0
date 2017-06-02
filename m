Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGokT-0004wl-Cc
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 15:44:30 +0000
Received: by mail-wm0-x241.google.com with SMTP id d127so19561805wmf.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2017 08:44:04 -0700 (PDT)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 2/5] mtd: block2mtd: Add support for specifying MTD write size
 and subpage shift
Date: Fri,  2 Jun 2017 17:43:39 +0200
Message-Id: <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
In-Reply-To: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is needed for creating emulated devices suitable for using in UBI layer
and with UBIFS.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/mtd/devices/block2mtd.c |   55 ++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index ee47cdd..5ba5fad 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -3,6 +3,7 @@
  *
  * Copyright (C) 2001,2002	Simon Evans <spse@secret.org.uk>
  * Copyright (C) 2004-2006	Joern Engel <joern@wh.fh-wedel.de>
+ * Copyright (C) 2012-2017	Pali Rohár <pali.rohar@gmail.com>
  *
  * Licence: GPL
  */
@@ -218,8 +219,8 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 }
 
 
-static struct block2mtd_dev *add_device(char *devname, int erase_size,
-		int timeout)
+static struct block2mtd_dev *add_device(char *devname, uint32_t erase_size,
+		uint32_t write_size, int subpage_sft, int timeout)
 {
 #ifndef MODULE
 	int i;
@@ -279,6 +280,11 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		goto err_free_block2mtd;
 	}
 
+	if ((long)dev->blkdev->bd_inode->i_size % write_size) {
+		pr_err("writesize must be divisor of device size\n");
+		goto err_free_block2mtd;
+	}
+
 	mutex_init(&dev->write_mutex);
 
 	/* Setup the MTD structure */
@@ -291,7 +297,8 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
-	dev->mtd.writesize = 1;
+	dev->mtd.writesize = write_size;
+	dev->mtd.subpage_sft = subpage_sft;
 	dev->mtd.writebufsize = PAGE_SIZE;
 	dev->mtd.type = MTD_RAM;
 	dev->mtd.flags = MTD_CAP_RAM;
@@ -308,10 +315,12 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	}
 
 	list_add(&dev->list, &blkmtd_device_list);
-	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
+	pr_info("mtd%d: [%s] erase_size = %dKiB [%d], write_size = %dKiB [%d], subpage_sft = %d\n",
 		dev->mtd.index,
 		dev->mtd.name + strlen("block2mtd: "),
-		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
+		dev->mtd.erasesize >> 10, dev->mtd.erasesize,
+		dev->mtd.writesize >> 10, dev->mtd.writesize,
+		dev->mtd.subpage_sft);
 	return dev;
 
 err_destroy_mutex:
@@ -375,18 +384,20 @@ static inline void kill_final_newline(char *str)
 
 #ifndef MODULE
 static int block2mtd_init_called = 0;
-/* 80 for device, 12 for erase size */
-static char block2mtd_paramline[80 + 12];
+/* 80 for device, 12 for erase size, 12 for write size, 3 for subpage_sft */
+static char block2mtd_paramline[80 + 12 + 12 + 3];
 #endif
 
 static int block2mtd_setup2(const char *val)
 {
-	/* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
-	char buf[80 + 12 + 80 + 8];
+	/* 80 for name, 80 for device, 12 for erase size, 12 for write size, 3 for subpage_sft */
+	char buf[80 + 12 + 80 + 12 + 3];
 	char *str = buf;
-	char *token[2];
+	char *token[4];
 	char *name;
 	size_t erase_size = PAGE_SIZE;
+	size_t write_size = 1;
+	size_t subpage_sft = 0;
 	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
 	int i, ret;
 
@@ -398,7 +409,7 @@ static int block2mtd_setup2(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 4; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str) {
@@ -425,7 +436,23 @@ static int block2mtd_setup2(const char *val)
 		}
 	}
 
-	add_device(name, erase_size, timeout);
+	if (token[2]) {
+		ret = parse_num(&write_size, token[2]);
+		if (ret || write_size > U32_MAX) {
+			pr_err("illegal write size");
+			return 0;
+		}
+	}
+
+	if (token[3]) {
+		ret = parse_num(&subpage_sft, token[3]);
+		if (ret || subpage_sft > INT_MAX) {
+			pr_err("illegal subpage_sft");
+			return 0;
+		}
+	}
+
+	add_device(name, erase_size, write_size, subpage_sft, timeout);
 
 	return 0;
 }
@@ -459,7 +486,9 @@ static int block2mtd_setup(const char *val, struct kernel_param *kp)
 
 
 module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
-MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
+MODULE_PARM_DESC(block2mtd, "Block device, erase size (default page size), "
+	"write size (default 1), nand subpage shift (default 0) "
+	"\"block2mtd=<dev>[,<erasesize>[,<writesize>[,<subpage_sft>]]]\"");
 
 static int __init block2mtd_init(void)
 {
-- 
1.7.9.5
