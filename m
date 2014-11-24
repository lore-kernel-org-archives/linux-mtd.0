Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt1DV-00045N-6j
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 21:30:42 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBI: rename_volumes: Use UBI_METAONLY
Date: Mon, 24 Nov 2014 22:30:10 +0100
Message-Id: <1416864610-5751-2-git-send-email-richard@nod.at>
In-Reply-To: <1416864610-5751-1-git-send-email-richard@nod.at>
References: <1416864610-5751-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>,
 Andrew Murray <amurray@embedded-bits.co.uk>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By using UBI_METAONLY in rename_volumes() it is now possible to rename
an UBI volume atomically while it is mounted.
This is useful for firmware upgrades.

Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Andrew Murray <amurray@embedded-bits.co.uk>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f5c715c..286383c 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -736,7 +736,7 @@ static int rename_volumes(struct ubi_device *ubi,
 			goto out_free;
 		}
 
-		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
+		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_METAONLY);
 		if (IS_ERR(re->desc)) {
 			err = PTR_ERR(re->desc);
 			ubi_err(ubi, "cannot open volume %d, error %d",
-- 
1.8.4.5
