Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNTxq-0006KB-4X
 for linux-mtd@lists.infradead.org; Fri, 29 Aug 2014 21:44:10 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] UBI: Dispatch update notification if the volume is updated
Date: Fri, 29 Aug 2014 18:42:30 -0300
Message-Id: <1409348550-27768-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The UBI_IOCVOLUP ioctl is used to start an update and also to
truncate a volume. In the first case, a "volume updated" notification
is dispatched when the update is done.

This commit adds the "volume updated" notification to be also sent when
the volume is truncated. This is required for UBI block and gluebi to get
notified about the new volume size.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/cdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7646220..20aeb27 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -425,8 +425,10 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 			break;
 
 		err = ubi_start_update(ubi, vol, bytes);
-		if (bytes == 0)
+		if (bytes == 0) {
+			ubi_volume_notify(ubi, vol, UBI_VOLUME_UPDATED);
 			revoke_exclusive(desc, UBI_READWRITE);
+		}
 		break;
 	}
 
-- 
2.0.1
