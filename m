Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVzG1-0003U7-31
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 08:46:05 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/3] UBI: ubi_eba_read_leb: Remove in vain variable assignment
Date: Mon, 22 Sep 2014 10:45:34 +0200
Message-Id: <1411375536-20067-1-git-send-email-richard@nod.at>
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

There is no need to set err, it will be overwritten in any case
later at:
        if (scrub)
                err = ubi_wl_scrub_peb(ubi, pnum);

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0e11671d..2402d3b 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -441,10 +441,9 @@ retry:
 
 	err = ubi_io_read_data(ubi, buf, pnum, offset, len);
 	if (err) {
-		if (err == UBI_IO_BITFLIPS) {
+		if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
-			err = 0;
-		} else if (mtd_is_eccerr(err)) {
+		else if (mtd_is_eccerr(err)) {
 			if (vol->vol_type == UBI_DYNAMIC_VOLUME)
 				goto out_unlock;
 			scrub = 1;
-- 
1.8.4.5
