Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeVaD-0001hJ-JM
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 21:58:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] UBI: Validate data_size
Date: Tue, 22 Sep 2015 23:58:07 +0200
Message-Id: <1442959087-9820-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make sure that data_size is less than LEB size.
Otherwise a handcrafted UBI image is able to trigger
an out of bounds memory access in ubi_compare_lebs().

Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/io.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 5bbd1f0..1fc23e4 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -926,6 +926,11 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 		goto bad;
 	}
 
+	if (data_size > ubi->leb_size) {
+		ubi_err(ubi, "bad data_size");
+		goto bad;
+	}
+
 	if (vol_type == UBI_VID_STATIC) {
 		/*
 		 * Although from high-level point of view static volumes may
-- 
1.8.4.5
