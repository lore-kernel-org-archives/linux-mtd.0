Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSei-0003zL-Gy
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:47:18 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 18/35] UBI: Fastmap: Fix race in ubi_eba_atomic_leb_change()
Date: Wed, 29 Oct 2014 13:45:41 +0100
Message-Id: <1414586758-9972-19-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
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

For the non-fastmap care this works perfectly fine and is powercut safe.
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
index 2402d3b..04abe7f 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -842,7 +842,7 @@ write_error:
 int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len)
 {
-	int err, pnum, tries = 0, vol_id = vol->vol_id;
+	int err, pnum, old_pnum, tries = 0, vol_id = vol->vol_id;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t crc;
 
@@ -905,16 +905,17 @@ retry:
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
