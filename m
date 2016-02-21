Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXQhs-0000xQ-Jr
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2016 09:53:37 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH] ubi: Fix out of bounds write in volume update code
Date: Sun, 21 Feb 2016 10:53:03 +0100
Message-Id: <1456048383-27344-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_start_leb_change() alloctes too few bytes.
ubi_more_leb_change_data() will write up to req->upd_bytes +
ubi->min_io_size bytes.

Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/upd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index cfeaf0f..b7901ce 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -193,7 +193,7 @@ int ubi_start_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 	vol->changing_leb = 1;
 	vol->ch_lnum = req->lnum;
 
-	vol->upd_buf = vmalloc(req->bytes);
+	vol->upd_buf = vmalloc(ALIGN((int)req->bytes, ubi->min_io_size));
 	if (!vol->upd_buf)
 		return -ENOMEM;
 
-- 
1.8.4.5
