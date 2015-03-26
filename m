Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbEd1-0003yf-Bw
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 20:43:48 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: Fastmap: Fall back to scanning mode after ECC error
Date: Thu, 26 Mar 2015 21:43:16 +0100
Message-Id: <1427402596-28081-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we encounter an uncorrectable ECC error while scanning for the fastmap
UBI must not fail hard. Instead fall back to scanning mode.

Reported-by: Alexander Block <Alexander.Block@continental-corporation.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 9bc70eb..c1039d9 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1419,7 +1419,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		err = scan_all(ubi, ai, 0);
 	else {
 		err = scan_fast(ubi, &ai);
-		if (err > 0) {
+		if (err > 0 || mtd_is_eccerr(err)) {
 			if (err != UBI_NO_FASTMAP) {
 				destroy_ai(ai);
 				ai = alloc_ai();
-- 
1.8.4.5
