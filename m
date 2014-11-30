Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv2z8-0003Vo-Qr
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 11:48:16 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 2/6] UBI: Fastmap: Fix race in ubi_eba_atomic_leb_change()
Date: Sun, 30 Nov 2014 12:47:42 +0100
Message-Id: <1417348066-7043-3-git-send-email-richard@nod.at>
In-Reply-To: <1417348066-7043-1-git-send-email-richard@nod.at>
References: <1417348066-7043-1-git-send-email-richard@nod.at>
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

This function a) requests a new PEB, b) writes data to it,
c) returns the old PEB and d) registers the new PEB in the EBA table.

For the non-fastmap case this works perfectly fine and is powercut safe.
Is fastmap enabled this can lead to issues.
If a new fastmap is written between a) and c) the freshly requested PEB
is no longer in a pool and will not be scanned upon attaching.
If now a powercut happens between c) and d) the freshly requested PEB
will not be scanned and the old one got already scheduled for erase.
After attaching the EBA table will point to a erased PEB.

Fix this issue by swapping steps c) and d).

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index a40020c..4164a5c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -843,7 +843,7 @@ write_error:
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len)
 {
-	int err, pnum, tries = 0, vol_id = vol->vol_id;
+	int err, pnum, old_pnum, tries = 0, vol_id = vol->vol_id;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t crc;
 
@@ -906,16 +906,17 @@ retry:
 		goto write_error;
 	}
 
-	if (vol->eba_tbl[lnum] >= 0) {
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, vol->eba_tbl[lnum], 0);
-		if (err)
-			goto out_leb_unlock;
-	}
-
 	down_read(&ubi->fm_sem);
+	old_pnum = vol->eba_tbl[lnum];
 	vol->eba_tbl[lnum] = pnum;
 	up_read(&ubi->fm_sem);
 
+	if (old_pnum >= 0) {
+		err = ubi_wl_put_peb(ubi, vol_id, lnum, old_pnum, 0);
+		if (err)
+			goto out_leb_unlock;
+	}
+
 out_leb_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
 out_mutex:
-- 
1.8.4.5
