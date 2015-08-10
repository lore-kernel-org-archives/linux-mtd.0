Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOkqs-0002kr-4Y
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 11:02:50 +0000
Received: by wicne3 with SMTP id ne3so131017915wic.1
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 04:02:23 -0700 (PDT)
From: Andrew Murray <amurray@embedded-bits.co.uk>
To: linux-mtd@lists.infradead.org
Cc: Andrew Murray <amurray@embedded-bits.co.uk>,
 Richard Weinberger <richard@nod.at>, trivial@kernel.org
Subject: [PATCH] UBI: Update comments to reflect UBI_METAONLY flag
Date: Mon, 10 Aug 2015 12:02:09 +0100
Message-Id: <1439204529-15440-1-git-send-email-amurray@embedded-bits.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch trivially updates code comments to reflect the addition of the
UBI_METAONLY flag - as discussed https://lkml.org/lkml/2014/10/29/764

Cc: Richard Weinberger <richard@nod.at>
Cc: trivial@kernel.org
Signed-off-by: Andrew Murray <amurray@embedded-bits.co.uk>
---
 drivers/mtd/ubi/gluebi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index b93807b..cb7c075 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -112,8 +112,8 @@ static int gluebi_get_device(struct mtd_info *mtd)
 		 * The MTD device is already referenced and this is just one
 		 * more reference. MTD allows many users to open the same
 		 * volume simultaneously and do not distinguish between
-		 * readers/writers/exclusive openers as UBI does. So we do not
-		 * open the UBI volume again - just increase the reference
+		 * readers/writers/exclusive/meta openers as UBI does. So we do
+		 * not open the UBI volume again - just increase the reference
 		 * counter and return.
 		 */
 		gluebi->refcnt += 1;
-- 
1.8.3.2
