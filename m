Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBXaN-0000O3-SA
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 23:42:52 +0000
Received: by mail-ig0-f173.google.com with SMTP id r10so12184829igi.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 15:42:29 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] UBI: block: Export ubiblock major number
Date: Wed, 14 Jan 2015 15:42:07 -0800
Message-Id: <1421278927-3237-1-git-send-email-dehrenberg@chromium.org>
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

This patch exports the ubiblock major number so that it is usable from
other pieces of kernel code. This is useful, for example, if you have
another piece of kernel code which wants to determine whether a block
device is an ubiblock device or not.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/ubi/block.c | 3 ++-
 include/linux/mtd/ubi.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 6c8333d..faf35d4 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -94,7 +94,8 @@ struct ubiblock {
 /* Linked list of all ubiblock instances */
 static LIST_HEAD(ubiblock_devices);
 static DEFINE_MUTEX(devices_mutex);
-static int ubiblock_major;
+int ubiblock_major;
+EXPORT_SYMBOL(ubiblock_major);
 
 static int __init ubiblock_set_param(const char *val,
 				     const struct kernel_param *kp)
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index c3918a0..8603d87 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -230,4 +230,6 @@ static inline int ubi_read(struct ubi_volume_desc *desc, int lnum, char *buf,
 {
 	return ubi_leb_read(desc, lnum, buf, offset, len, 0);
 }
+
+extern int ubiblock_major;
 #endif /* !__LINUX_UBI_H__ */
-- 
2.2.0.rc0.207.ga3a616c
