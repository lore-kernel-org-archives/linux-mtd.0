Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxPOv-0002CJ-2q
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 20:55:05 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 3/7] MTD: UBI: Export next_sqnum()
Date: Tue, 14 Feb 2012 21:06:42 +0100
Message-Id: <1329250006-22944-4-git-send-email-rw@linutronix.de>
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Richard Weinberger <rw@linutronix.de>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The checkpointing subsystem needs to read the next sequence nummber
directly.

Signed-off-by: Richard Weinberger <rw@linutronix.de>
---
 drivers/mtd/ubi/eba.c |   18 +++++++++---------
 drivers/mtd/ubi/ubi.h |    1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index cd26da8..4dae50c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -57,7 +57,7 @@
  * global sequence counter value. It also increases the global sequence
  * counter.
  */
-static unsigned long long next_sqnum(struct ubi_device *ubi)
+unsigned long long ubi_next_sqnum(struct ubi_device *ubi)
 {
 	unsigned long long sqnum;
 
@@ -522,7 +522,7 @@ retry:
 		goto out_put;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
 	if (err)
 		goto write_error;
@@ -634,7 +634,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	}
 
 	vid_hdr->vol_type = UBI_VID_DYNAMIC;
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -695,7 +695,7 @@ write_error:
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -750,7 +750,7 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -815,7 +815,7 @@ write_error:
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -868,7 +868,7 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 	if (err)
 		goto out_mutex;
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -936,7 +936,7 @@ write_error:
 		goto out_leb_unlock;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -1096,7 +1096,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		vid_hdr->data_size = cpu_to_be32(data_size);
 		vid_hdr->data_crc = cpu_to_be32(crc);
 	}
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 
 	err = ubi_io_write_vid_hdr(ubi, to, vid_hdr);
 	if (err) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 4fe3638..b4dca54 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -557,6 +557,7 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr);
 int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si);
+unsigned long long ubi_next_sqnum(struct ubi_device *ubi);
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi, int dtype);
-- 
1.7.7
