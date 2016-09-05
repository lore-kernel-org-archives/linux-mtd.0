Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsD-00060W-Ug
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:31:53 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 4/6] UBI: introduce per-volume leb_size
Date: Mon,  5 Sep 2016 17:31:25 +0200
Message-Id: <1473089487-29285-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The LEB size is currently common to all volumes attached to a UBI device,
but the introduction of MLC NAND support and 'MLC safe' dynamic volumes
forces us to tweak the LEB size per volume.
In case of 'MLC safe' volumes, the LEB size should be set to

   (peb_size / bits_per_cells) - ec_and_vid_align_size

This commit only adds a leb_size field to struct ubi_volume and makes use
of it where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/eba.c  | 14 +++++++-------
 drivers/mtd/ubi/ubi.h  |  2 ++
 drivers/mtd/ubi/upd.c  |  2 +-
 drivers/mtd/ubi/vmt.c  | 21 ++++++++++++++-------
 drivers/mtd/ubi/vtbl.c |  8 +++++---
 5 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index dd270aebe9a1..71c35149175f 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1205,13 +1205,6 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 	dbg_wl("copy LEB %d:%d, PEB %d to PEB %d", vol_id, lnum, from, to);
 
-	if (vid_hdr->vol_type == UBI_VID_STATIC) {
-		data_size = be32_to_cpu(vid_hdr->data_size);
-		aldata_size = ALIGN(data_size, ubi->min_io_size);
-	} else
-		data_size = aldata_size =
-			    ubi->leb_size - be32_to_cpu(vid_hdr->data_pad);
-
 	idx = vol_id2idx(ubi, vol_id);
 	spin_lock(&ubi->volumes_lock);
 	/*
@@ -1261,6 +1254,13 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		goto out_unlock_leb;
 	}
 
+	if (vid_hdr->vol_type == UBI_VID_STATIC) {
+		data_size = be32_to_cpu(vid_hdr->data_size);
+		aldata_size = ALIGN(data_size, ubi->min_io_size);
+	} else
+		data_size = aldata_size =
+			    vol->leb_size - be32_to_cpu(vid_hdr->data_pad);
+
 	/*
 	 * OK, now the LEB is locked and we can safely start moving it. Since
 	 * this function utilizes the @ubi->peb_buf buffer which is shared
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1377e300a118..160cdfd5442f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -306,6 +306,7 @@ struct ubi_eba_leb_desc {
  *
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
+ * @leb_size: logical eraseblock size
  * @usable_leb_size: logical eraseblock size without padding
  * @used_ebs: how many logical eraseblocks in this volume contain data
  * @last_eb_bytes: how many bytes are stored in the last logical eraseblock
@@ -355,6 +356,7 @@ struct ubi_volume {
 
 	int reserved_pebs;
 	int vol_type;
+	int leb_size;
 	int usable_leb_size;
 	int used_ebs;
 	int last_eb_bytes;
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 0134ba32a057..03fd6ff912cf 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -133,7 +133,7 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 	ubi_assert(!vol->updating && !vol->changing_leb);
 	vol->updating = 1;
 
-	vol->upd_buf = vmalloc(ubi->leb_size);
+	vol->upd_buf = vmalloc(vol->leb_size);
 	if (!vol->upd_buf)
 		return -ENOMEM;
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 21b8c5aca2da..ac703d4631e1 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -207,8 +207,17 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 			goto out_unlock;
 		}
 
+	/*
+	 * Volume LEB size is currently PEB size - (size reserved for the EC
+	 * and VID headers). This will change with MLC/TLC NAND support and
+	 * the LEB consolidation concept.
+	 */
+	vol->leb_size = ubi->leb_size;
+
 	/* Calculate how many eraseblocks are requested */
-	vol->usable_leb_size = ubi->leb_size - ubi->leb_size % req->alignment;
+	vol->alignment = req->alignment;
+	vol->data_pad  = vol->leb_size % vol->alignment;
+	vol->usable_leb_size = vol->leb_size - vol->data_pad;
 	vol->reserved_pebs = div_u64(req->bytes + vol->usable_leb_size - 1,
 				     vol->usable_leb_size);
 
@@ -227,8 +236,6 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	spin_unlock(&ubi->volumes_lock);
 
 	vol->vol_id    = vol_id;
-	vol->alignment = req->alignment;
-	vol->data_pad  = ubi->leb_size % vol->alignment;
 	vol->vol_type  = req->vol_type;
 	vol->name_len  = req->name_len;
 	memcpy(vol->name, req->name, vol->name_len);
@@ -675,7 +682,7 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
 		ubi_err(ubi, "negative values");
 		goto fail;
 	}
-	if (vol->alignment > ubi->leb_size || vol->alignment == 0) {
+	if (vol->alignment > vol->leb_size || vol->alignment == 0) {
 		ubi_err(ubi, "bad alignment");
 		goto fail;
 	}
@@ -686,7 +693,7 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
 		goto fail;
 	}
 
-	n = ubi->leb_size % vol->alignment;
+	n = vol->leb_size % vol->alignment;
 	if (vol->data_pad != n) {
 		ubi_err(ubi, "bad data_pad, has to be %lld", n);
 		goto fail;
@@ -708,8 +715,8 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
 		goto fail;
 	}
 
-	n = ubi->leb_size - vol->data_pad;
-	if (vol->usable_leb_size != ubi->leb_size - vol->data_pad) {
+	n = vol->leb_size - vol->data_pad;
+	if (vol->usable_leb_size != n) {
 		ubi_err(ubi, "bad usable_leb_size, has to be %lld", n);
 		goto fail;
 	}
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 263743e7b741..4ed75a03e363 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -555,7 +555,8 @@ static int init_volumes(struct ubi_device *ubi,
 		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
 					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
 		vol->name_len = be16_to_cpu(vtbl[i].name_len);
-		vol->usable_leb_size = ubi->leb_size - vol->data_pad;
+		vol->leb_size = ubi->leb_size;
+		vol->usable_leb_size = vol->leb_size - vol->data_pad;
 		memcpy(vol->name, vtbl[i].name, vol->name_len);
 		vol->name[vol->name_len] = '\0';
 		vol->vol_id = i;
@@ -632,11 +633,12 @@ static int init_volumes(struct ubi_device *ubi,
 	vol->vol_type = UBI_DYNAMIC_VOLUME;
 	vol->name_len = sizeof(UBI_LAYOUT_VOLUME_NAME) - 1;
 	memcpy(vol->name, UBI_LAYOUT_VOLUME_NAME, vol->name_len + 1);
-	vol->usable_leb_size = ubi->leb_size;
 	vol->used_ebs = vol->reserved_pebs;
 	vol->last_eb_bytes = vol->reserved_pebs;
+	vol->leb_size = ubi->leb_size;
+	vol->usable_leb_size = vol->leb_size;
 	vol->used_bytes =
-		(long long)vol->used_ebs * (ubi->leb_size - vol->data_pad);
+		(long long)vol->used_ebs * (vol->leb_size - vol->data_pad);
 	vol->vol_id = UBI_LAYOUT_VOLUME_ID;
 	vol->ref_count = 1;
 
-- 
2.7.4
