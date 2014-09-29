Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYjJo-0002bK-IN
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 22:21:22 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/4] UBI: Fastmap: Calc fastmap size correctly
Date: Tue, 30 Sep 2014 00:20:46 +0200
Message-Id: <1412029248-22454-3-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-1-git-send-email-richard@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need to add fm_sb too.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 0431b46..2b0d8d6 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -24,7 +24,8 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
 {
 	size_t size;
 
-	size = sizeof(struct ubi_fm_hdr) + \
+	size = sizeof(struct ubi_fm_sb) + \
+		sizeof(struct ubi_fm_hdr) + \
 		sizeof(struct ubi_fm_scan_pool) + \
 		sizeof(struct ubi_fm_scan_pool) + \
 		(ubi->peb_count * sizeof(struct ubi_fm_ec)) + \
-- 
2.1.0
