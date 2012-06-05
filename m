Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbvPC-0004Fx-Gh
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 15:10:47 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/5] UBI: fastmap: kill junk newlines and add a TODO about that
Date: Tue,  5 Jun 2012 18:11:56 +0300
Message-Id: <1338909119-5188-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/fastmap.c |   45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 09629c2..b2ee872 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -751,7 +751,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	fmsb = kmalloc(sizeof(*fmsb), GFP_KERNEL);
 	if (!fmsb) {
 		ret = -ENOMEM;
-
 		goto out;
 	}
 
@@ -764,9 +763,7 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		/* TODO: what are the error codes > 0 ? Why is this check? */
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
-
 		kfree(fmsb);
-
 		goto out;
 	}
 
@@ -784,7 +781,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_err("super block magic does not match");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
-
 		goto out;
 	}
 
@@ -792,17 +788,14 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi_err("unknown fastmap format version!");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
-
 		goto out;
 	}
 
 	used_blocks = be32_to_cpu(fmsb->used_blocks);
-
 	if (used_blocks > UBI_FM_MAX_BLOCKS || used_blocks < 1) {
 		ubi_err("number of fastmap blocks is invalid");
 		ret = UBI_BAD_FASTMAP;
 		kfree(fmsb);
-
 		goto out;
 	}
 
@@ -812,7 +805,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!fm_raw) {
 		ret = -ENOMEM;
 		kfree(fmsb);
-
 		goto out;
 	}
 
@@ -820,7 +812,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (!ech) {
 		ret = -ENOMEM;
 		kfree(fmsb);
-
 		goto free_raw;
 	}
 
@@ -829,7 +820,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ret = -ENOMEM;
 		kfree(fmsb);
 		kfree(ech);
-
 		goto free_raw;
 	}
 
@@ -839,7 +829,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		if (ubi_io_is_bad(ubi, pnum)) {
 			ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
-
 			goto free_hdr;
 		}
 
@@ -850,7 +839,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
-
 			goto free_hdr;
 		}
 
@@ -860,7 +848,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		if (be32_to_cpu(ech->image_seq) != ubi->image_seq) {
 			ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
-
 			goto free_hdr;
 		}
 
@@ -871,7 +858,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
-
 			goto free_hdr;
 		}
 
@@ -886,7 +872,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (be32_to_cpu(vh->vol_id) != UBI_FM_DATA_VOLUME_ID) {
 				ret = UBI_BAD_FASTMAP;
 				kfree(fmsb);
-
 				goto free_hdr;
 			}
 		}
@@ -903,7 +888,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			if (ret > 0)
 				ret = UBI_BAD_FASTMAP;
 			kfree(fmsb);
-
 			goto free_hdr;
 		}
 	}
@@ -927,14 +911,12 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (ret) {
 		if (ret > 0)
 			ret = UBI_BAD_FASTMAP;
-
 		goto free_hdr;
 	}
 
 	ai->fm = kzalloc(sizeof(*ai->fm), GFP_KERNEL);
 	if (!ai->fm) {
 		ret = -ENOMEM;
-
 		goto free_hdr;
 	}
 
@@ -952,12 +934,11 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			kfree(ai->fm);
 			ai->fm = NULL;
 			ret = -ENOMEM;
-
 			goto free_hdr;
 		}
+
 		e->pnum = be32_to_cpu(fmsb->block_loc[i]);
 		e->ec = be32_to_cpu(fmsb->block_ec[i]);
-
 		ai->fm->e[i] = e;
 	}
 
@@ -969,7 +950,6 @@ free_raw:
 out:
 	if (ret == UBI_BAD_FASTMAP)
 		ubi_err("Attach by fastmap failed, doing a full scan!");
-
 	return ret;
 }
 
@@ -1005,6 +985,29 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	if (!fm_raw) {
 		ret = -ENOMEM;
 
+		/* TODO: nitpick, sorry for being annoying, but this should not
+		 * be difficult to fix. I find it very irritating when there
+		 * are useless blank lines like this - they only make less code
+		 * fit my screen and make large functions even larger.
+		 *
+		 * Why we use blank lines inside a single function? To make
+		 * code more readable. How we make it more readable? By
+		 * separating logically different blocks of code with a
+		 * newline.
+		 *
+		 * What is the perbose of these newlines before goto's? This is
+		 * a single piece of error-handling code - you assing the
+		 * return value and go to the further error processing. These
+		 * newlines serve no purpose just blow the lines number in the
+		 * code. Could we please kill them globally?
+		 *
+		 * I am again sorry - probably this is not completely
+		 * technical, but I gave the explanation why these newlines are
+		 * annying. And as a person who spent a lot of personal
+		 * (non-paid) time maintaining this code and who will keep
+		 * doing this - I think I have right to require to do such
+		 * cosmetic things :-) If you do not agree with my reasoning,
+		 * may be this is better - you'll keep me happier :-) */
 		goto out;
 	}
 
-- 
1.7.10
