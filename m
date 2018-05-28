Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNOOX-0003TZ-Nd
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 20:05:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Martinbayern@outlook.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/3] ubi: fastmap: Detect EBA mismatches on-the-fly
Date: Mon, 28 May 2018 22:04:34 +0200
Message-Id: <20180528200434.19811-3-richard@nod.at>
In-Reply-To: <20180528200434.19811-1-richard@nod.at>
References: <20180528200434.19811-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now we have the machinery to detect EBA mismatches on-the-fly
by comparing the in-memory volume ID and LEB number with the found
VID header.
This helps to detect malfunction of Fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 1ceab201a27b..edb1c8362faa 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -513,6 +513,7 @@ static int check_mapping(struct ubi_device *ubi, struct ubi_volume *vol, int lnu
 {
 	int err;
 	struct ubi_vid_io_buf *vidb;
+	struct ubi_vid_hdr *vid_hdr;
 
 	if (!ubi->fast_attach)
 		return 0;
@@ -552,6 +553,22 @@ static int check_mapping(struct ubi_device *ubi, struct ubi_volume *vol, int lnu
 			*pnum, err);
 
 		goto out_free;
+	} else {
+		int found_vol_id, found_lnum;
+
+		ubi_assert(err == 0 || err == UBI_IO_BITFLIPS);
+
+		vid_hdr = ubi_get_vid_hdr(vidb);
+		found_vol_id = be32_to_cpu(vid_hdr->vol_id);
+		found_lnum = be32_to_cpu(vid_hdr->lnum);
+
+		if (found_lnum != lnum || found_vol_id != vol->vol_id) {
+			ubi_err(ubi, "EBA mismatch! PEB %i is LEB %i:%i instead of LEB %i:%i",
+				*pnum, found_vol_id, found_lnum, vol->vol_id, lnum);
+			ubi_ro_mode(ubi);
+			err = -EINVAL;
+			goto out_free;
+		}
 	}
 
 	set_bit(lnum, vol->checkmap);
-- 
2.13.6
