Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBUkW-0006Xy-Sw
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 20:41:09 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so11133620iec.11
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 12:40:47 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] UBI: block: Configurable device major number
Date: Wed, 14 Jan 2015 12:40:43 -0800
Message-Id: <1421268043-7476-1-git-send-email-dehrenberg@chromium.org>
Cc: grundler@chromium.org, gwendal@chromium.org, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By default UBI block devices use a dynamic major number. This
config option can replace that with a static major number. Set
to the new major number, or 0 for dynamic. This is useful if
you want to use an ubiblock as the root filesystem in an
indirect way, e.g., though DM and need to refer to it before
userspace is up.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/ubi/Kconfig | 13 +++++++++++++
 drivers/mtd/ubi/block.c |  7 ++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce..5ac8d63 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -103,4 +103,17 @@ config MTD_UBI_BLOCK
 
 	   If in doubt, say "N".
 
+config MTD_UBI_BLOCK_MAJOR
+	int "Major device number for UBI block devices"
+	default 0
+	range 0 256
+	depends on MTD_UBI_BLOCK
+	help
+	   By default UBI block devices use a dynamic major number. This
+	   config option can replace that with a static major number. Set
+	   to the new major number, or 0 for dynamic. This is useful if
+	   you want to use an ubiblock as the root filesystem in an
+	   indirect way, e.g., though DM and need to refer to it before
+	   userspace is up.
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 6b6bce2..6c8333d 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -635,9 +635,14 @@ int __init ubiblock_init(void)
 {
 	int ret;
 
-	ubiblock_major = register_blkdev(0, "ubiblock");
+	ubiblock_major = register_blkdev(CONFIG_MTD_UBI_BLOCK_MAJOR,
+					 "ubiblock");
 	if (ubiblock_major < 0)
 		return ubiblock_major;
+	if (CONFIG_MTD_UBI_BLOCK_MAJOR) {
+		BUG_ON(ubiblock_major);
+		ubiblock_major = CONFIG_MTD_UBI_BLOCK_MAJOR;
+	}
 
 	/* Attach block devices from 'block=' module param */
 	ret = ubiblock_create_from_param();
-- 
2.2.0.rc0.207.ga3a616c
