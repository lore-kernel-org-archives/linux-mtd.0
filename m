Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjUcD-0006Eb-DQ
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 14:52:50 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/2] UBI: rename_volumes: Use UBI_METAONLY
Date: Wed, 29 Oct 2014 15:52:18 +0100
Message-Id: <1414594338-14695-2-git-send-email-richard@nod.at>
In-Reply-To: <1414594338-14695-1-git-send-email-richard@nod.at>
References: <1414594338-14695-1-git-send-email-richard@nod.at>
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
index 5f01edd..fcdf7b9 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -735,7 +735,7 @@ static int rename_volumes(struct ubi_device *ubi,
 			goto out_free;
 		}
 
-		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
+		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_METAONLY);
 		if (IS_ERR(re->desc)) {
 			err = PTR_ERR(re->desc);
 			ubi_err("cannot open volume %d, error %d", vol_id, err);
-- 
1.8.4.5
