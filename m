Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2awI-0008KL-Vk
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 06:56:15 +0000
Received: by mail-pa0-f41.google.com with SMTP id fb1so13945716pad.28
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 23:55:55 -0700 (PDT)
From: Terry Chia <terrycwk1994@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] Add MODULE_DESCRIPTION to various modules in drivers/mtd
Date: Thu,  3 Jul 2014 14:55:42 +0800
Message-Id: <1404370542-14357-2-git-send-email-terrycwk1994@gmail.com>
In-Reply-To: <1404370542-14357-1-git-send-email-terrycwk1994@gmail.com>
References: <1404370542-14357-1-git-send-email-terrycwk1994@gmail.com>
Cc: linux-mtd@lists.infradead.org, Terry Chia <terrycwk1994@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This starts to address
https://bugzilla.kernel.org/show_bug.cgi?id=10770

Signed-off-by: Terry Chia <terrycwk1994@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 1 +
 drivers/mtd/chips/cfi_util.c        | 1 +
 drivers/mtd/maps/map_funcs.c        | 1 +
 drivers/mtd/nand/denali.c           | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 423666b..55f3586 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -1398,3 +1398,4 @@ static void cfi_staa_destroy(struct mtd_info *mtd)
 }
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD chip driver for ST (Advanced Architecture) flash chips");
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 09c79bd..c064484 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -249,3 +249,4 @@ int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
 EXPORT_SYMBOL(cfi_varsize_frob);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MTD chip driver for generic utility functions");
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 3f26837..089906a 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,3 +41,4 @@ void simple_map_init(struct map_info *map)
 
 EXPORT_SYMBOL(simple_map_init);
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Out-of-line map I/O functions for simple maps");
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9f2012a..d373ed2 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -28,6 +28,7 @@
 #include "denali.h"
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NAND Flash Controller Device Driver");
 
 /* We define a module parameter that allows the user to override
  * the hardware and decide what timing mode should be used.
-- 
1.9.3
