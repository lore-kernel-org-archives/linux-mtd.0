Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4W1J-0001ga-Ej
 for linux-mtd@lists.infradead.org; Tue, 08 Jul 2014 14:05:22 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] UBI: init_volumes: Ignore volumes with no LEBs
Date: Tue,  8 Jul 2014 16:04:44 +0200
Message-Id: <1404828284-32643-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI assumes that ubi_attach_info will only contain ubi_ainf_volume
structures for volumes with at least one LEB.
In scanning mode this is true because UBI can nicely create a ubi_ainf_volume
on demand while creating the EBA table.

For fastmap this is not true, the fastmap on-flash structure has a list of
all volumes, the ubi_ainf_volume structures are created from this list.
So it can happen that an empty volume ends up in init_volumes().

We can easely deal with that by looking into ->leb_count too.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/vtbl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index d77b1c1..07cac5f 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -591,7 +591,7 @@ static int init_volumes(struct ubi_device *ubi,
 
 		/* Static volumes only */
 		av = ubi_find_av(ai, i);
-		if (!av) {
+		if (!av || !av->leb_count) {
 			/*
 			 * No eraseblocks belonging to this volume found. We
 			 * don't actually know whether this static volume is
-- 
2.0.1
