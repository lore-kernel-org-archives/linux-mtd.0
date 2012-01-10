Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkf78-0005Rm-I6
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:03:59 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH] ubi: Use UBI_LAYOUT_VOLUME_{TYPE, ALIGN}
Date: Tue, 10 Jan 2012 17:57:03 +0100
Message-Id: <1326214623-15938-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI_LAYOUT_VOLUME_TYPE and UBI_LAYOUT_VOLUME_ALIGN are currently
defined but not used.
Use them at least once. 8-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/vtbl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 9ad18da..93cb2f1 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -322,7 +322,7 @@ retry:
 		goto out_free;
 	}
 
-	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	vid_hdr->vol_type = UBI_LAYOUT_VOLUME_TYPE;
 	vid_hdr->vol_id = cpu_to_be32(UBI_LAYOUT_VOLUME_ID);
 	vid_hdr->compat = UBI_LAYOUT_VOLUME_COMPAT;
 	vid_hdr->data_size = vid_hdr->used_ebs =
@@ -632,7 +632,7 @@ static int init_volumes(struct ubi_device *ubi, const struct ubi_scan_info *si,
 		return -ENOMEM;
 
 	vol->reserved_pebs = UBI_LAYOUT_VOLUME_EBS;
-	vol->alignment = 1;
+	vol->alignment = UBI_LAYOUT_VOLUME_ALIGN;
 	vol->vol_type = UBI_DYNAMIC_VOLUME;
 	vol->name_len = sizeof(UBI_LAYOUT_VOLUME_NAME) - 1;
 	memcpy(vol->name, UBI_LAYOUT_VOLUME_NAME, vol->name_len + 1);
-- 
1.7.7.3
