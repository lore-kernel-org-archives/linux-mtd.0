Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGtuF-0004YD-Jo
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 15:52:17 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/10] UBI: Wire-up ->fm_sem
Date: Wed, 26 Sep 2012 17:51:46 +0200
Message-Id: <1348674710-102885-7-git-send-email-richard@nod.at>
In-Reply-To: <1348674710-102885-1-git-send-email-richard@nod.at>
References: <1348674710-102885-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, tim.bird@am.sony.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fastmap uses ->fm_sem to stop EBA changes while writing
a new fastmap.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index d56ae1c..0e11671 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -340,7 +340,9 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	dbg_eba("erase LEB %d:%d, PEB %d", vol_id, lnum, pnum);
 
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = UBI_LEB_UNMAPPED;
+	up_read(&ubi->fm_sem);
 	err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 0);
 
 out_unlock:
@@ -548,7 +550,9 @@ retry:
 	mutex_unlock(&ubi->buf_mutex);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = new_pnum;
+	up_read(&ubi->fm_sem);
 	ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
 
 	ubi_msg("data was successfully recovered");
@@ -665,7 +669,9 @@ retry:
 		}
 	}
 
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = pnum;
+	up_read(&ubi->fm_sem);
 
 	leb_write_unlock(ubi, vol_id, lnum);
 	ubi_free_vid_hdr(ubi, vid_hdr);
@@ -783,7 +789,9 @@ retry:
 	}
 
 	ubi_assert(vol->eba_tbl[lnum] < 0);
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = pnum;
+	up_read(&ubi->fm_sem);
 
 	leb_write_unlock(ubi, vol_id, lnum);
 	ubi_free_vid_hdr(ubi, vid_hdr);
@@ -904,7 +912,9 @@ retry:
 			goto out_leb_unlock;
 	}
 
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = pnum;
+	up_read(&ubi->fm_sem);
 
 out_leb_unlock:
 	leb_write_unlock(ubi, vol_id, lnum);
@@ -1151,7 +1161,9 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	ubi_assert(vol->eba_tbl[lnum] == from);
+	down_read(&ubi->fm_sem);
 	vol->eba_tbl[lnum] = to;
+	up_read(&ubi->fm_sem);
 
 out_unlock_buf:
 	mutex_unlock(&ubi->buf_mutex);
-- 
1.7.6.5
