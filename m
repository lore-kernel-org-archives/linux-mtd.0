Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGDRg-0001Q9-8j
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 18:31:53 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/10] UBI: Export next_sqnum()
Date: Mon, 24 Sep 2012 20:31:25 +0200
Message-Id: <1348511492-91606-4-git-send-email-richard@nod.at>
In-Reply-To: <1348511492-91606-1-git-send-email-richard@nod.at>
References: <1348511492-91606-1-git-send-email-richard@nod.at>
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

Fastmap needs next_sqnum(), rename it to ubi_next_sqnum()
and make it non-static.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index a26d7d2..0910c2c 100644
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
 
@@ -521,7 +521,7 @@ retry:
 		goto out_put;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
 	if (err)
 		goto write_error;
@@ -632,7 +632,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	}
 
 	vid_hdr->vol_type = UBI_VID_DYNAMIC;
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -692,7 +692,7 @@ write_error:
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -745,7 +745,7 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -810,7 +810,7 @@ write_error:
 		return err;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -862,7 +862,7 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 	if (err)
 		goto out_mutex;
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
 	vid_hdr->compat = ubi_get_compat(ubi, vol_id);
@@ -930,7 +930,7 @@ write_error:
 		goto out_leb_unlock;
 	}
 
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	ubi_msg("try another PEB");
 	goto retry;
 }
@@ -1089,7 +1089,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		vid_hdr->data_size = cpu_to_be32(data_size);
 		vid_hdr->data_crc = cpu_to_be32(crc);
 	}
-	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 
 	err = ubi_io_write_vid_hdr(ubi, to, vid_hdr);
 	if (err) {
-- 
1.7.6.5
