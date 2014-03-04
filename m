Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKn35-0007tc-B1
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:58:11 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: block: Use ENOSYS as return value when CONFIG_UBIBLOCK=n
Date: Tue,  4 Mar 2014 07:57:43 -0300
Message-Id: <1393930663-8737-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to have a way of distinguishing an invalid ioctl from a
not supported (but otherwise valid) ioctl, this commit changes the
return value of the ioctl stubs from ENOTTY to ENOSYS.

This will be useful to report more accurate error messages from
userspace tools.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/ubi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index e76ff98..a8118f2 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -873,8 +873,8 @@ int ubiblock_del(struct ubi_volume_info *vi);
 #else
 static inline int ubiblock_init(void) { return 0; }
 static inline void ubiblock_exit(void) {}
-static inline int ubiblock_add(struct ubi_volume_info *vi) { return -ENOTTY; }
-static inline int ubiblock_del(struct ubi_volume_info *vi) { return -ENOTTY; }
+static inline int ubiblock_add(struct ubi_volume_info *vi) { return -ENOSYS; }
+static inline int ubiblock_del(struct ubi_volume_info *vi) { return -ENOSYS; }
 #endif
 
 
-- 
1.8.1.5
