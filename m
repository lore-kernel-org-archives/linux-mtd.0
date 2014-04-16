Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaWl2-000353-9o
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 20:48:36 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: weaken the 'exclusive' constraint when opening volumes
 to rename
Date: Wed, 16 Apr 2014 17:47:33 -0300
Message-Id: <1397681253-5203-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The UBI volume rename ioctl (UBI_IOCRNVOL) open the volumes in exclusive
mode. The volumes are opened for two reasons: to build a volume rename list,
and a volume remove list.

However, the first open constraint is excessive and can be replaced by
a 'read-write' open mode. The second open constraint is properly set as
'exclusive' given the volume is opened for removal and we don't want any
users around.

By weakening the former 'exclusive' mode, we allow 'read-only' users to keep
the volume open, while a rename is taking place. This is useful to perform
an atomic rename, in a firmware upgrade scenario, while keeping the volume
in read-only use (for instance, if a ubiblock is mounted as rootfs).

It's worth mention this is not the case of UBIFS, which keeps the volume
opened as 'read-write' despite mounted as read-write or read-only mode.

This change was suggested at least twice by Artem:
http://lists.infradead.org/pipermail/linux-mtd/2012-September/044175.html
http://permalink.gmane.org/gmane.linux.drivers.mtd/39866

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f54562a..7646220 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -731,7 +731,7 @@ static int rename_volumes(struct ubi_device *ubi,
 			goto out_free;
 		}
 
-		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_EXCLUSIVE);
+		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
 		if (IS_ERR(re->desc)) {
 			err = PTR_ERR(re->desc);
 			ubi_err("cannot open volume %d, error %d", vol_id, err);
-- 
1.9.1
