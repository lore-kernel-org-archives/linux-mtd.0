Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsZ-0006Aw-NF
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:32:23 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 6/6] UBI: add SLC mode support
Date: Mon,  5 Sep 2016 17:31:27 +0200
Message-Id: <1473089487-29285-7-git-send-email-boris.brezillon@free-electrons.com>
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

On MLC/TLC NANDs, this SLC mode support allows one to use the underlying
MTD device in SLC mode. This is not a real SLC mode, as is sometime
provided by NAND vendors, but we emulate SLC mode by programming only
one page of each pair.

This mode is optional and is selected at volume creation time.

The layout volume is automatically switched to an SLC mode volume upon
creation, since keeping it in SLC mode does not bring any advantage.

Fastmap is kept in normal modes for now.

The ubi_attach_req struct, which is exposed to userspace, is also updated,
but the previous version is still working fine, except only normal volumes
will be supported in this case.

We also update the UBI on-flash format version (switching to version 2),
and only accept SLC mode when the UBI image is set to version 2. This
way the implementation stay compatible with version 1 images.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c    | 21 +++++++++++++---
 drivers/mtd/ubi/cdev.c      |  9 +++++++
 drivers/mtd/ubi/debug.c     |  4 +++
 drivers/mtd/ubi/eba.c       | 47 ++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/io.c        | 37 ++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi-media.h | 33 ++++++++++++++++++++++---
 drivers/mtd/ubi/ubi.h       | 60 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/vmt.c       | 32 ++++++++++++++++++------
 drivers/mtd/ubi/vtbl.c      | 45 ++++++++++++++++++++++++++++++----
 include/uapi/mtd/ubi-user.h | 24 ++++++++++++++++--
 10 files changed, 281 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index aa82ff23e1d6..184da5020d37 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -149,6 +149,7 @@ static struct ubi_ainf_volume *find_or_add_av(struct ubi_attach_info *ai,
 		return ERR_PTR(-ENOMEM);
 
 	av->vol_id = vol_id;
+	av->vol_mode = -1;
 
 	if (vol_id > ai->highest_vol_id)
 		ai->highest_vol_id = vol_id;
@@ -455,6 +456,7 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 	uint32_t data_crc, crc;
 	struct ubi_vid_io_buf *vidb = NULL;
 	unsigned long long sqnum2 = be64_to_cpu(vid_hdr->sqnum);
+	enum ubi_io_mode io_mode;
 
 	if (sqnum2 == aeb->sqnum) {
 		/*
@@ -522,9 +524,10 @@ int ubi_compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 
 	len = be32_to_cpu(vid_hdr->data_size);
 
+	io_mode = ubi_io_mode_from_vid_hdr(vid_hdr);
+
 	mutex_lock(&ubi->buf_mutex);
-	err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, len,
-			       UBI_IO_MODE_NORMAL);
+	err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, len, io_mode);
 	if (err && err != UBI_IO_BITFLIPS && !mtd_is_eccerr(err))
 		goto out_unlock;
 
@@ -577,13 +580,14 @@ out_free_vidh:
 int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips)
 {
-	int err, vol_id, lnum;
+	int err, vol_id, vol_mode, lnum;
 	unsigned long long sqnum;
 	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb;
 	struct rb_node **p, *parent = NULL;
 
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
+	vol_mode = ubi_vol_mode_from_vid_hdr(vid_hdr);
 	lnum = be32_to_cpu(vid_hdr->lnum);
 	sqnum = be64_to_cpu(vid_hdr->sqnum);
 
@@ -594,6 +598,17 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 	if (IS_ERR(av))
 		return PTR_ERR(av);
 
+	/* Assign the volume mode if it's just been created. */
+	if (av->vol_mode < 0)
+		av->vol_mode = vol_mode;
+
+	/* All VID headers in a given volume should expose the same mode. */
+	if (vol_mode != av->vol_mode) {
+		ubi_err(ubi, "invalid mode detected: got %d expected %d",
+			vid_hdr->vol_mode, av->vol_mode);
+		return -EINVAL;
+	}
+
 	if (ai->max_sqnum < sqnum)
 		ai->max_sqnum = sqnum;
 
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 45c329694a5e..9dd36ffb9d1e 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -622,6 +622,15 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
 	    req->vol_type != UBI_STATIC_VOLUME)
 		goto bad;
 
+	if (req->vol_mode != UBI_VOL_MODE_NORMAL &&
+	    req->vol_mode != UBI_VOL_MODE_SLC)
+		goto bad;
+
+	/* SLC mode is only supported by UBI version 2 and later. */
+	if (req->vol_mode == UBI_VOL_MODE_SLC &&
+	    ubi->version < 2)
+		goto bad;
+
 	if (req->alignment > ubi->leb_size)
 		goto bad;
 
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index f101a4985a7c..c0c936b44928 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -85,6 +85,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
 	pr_err("\tmagic     %08x\n", be32_to_cpu(vid_hdr->magic));
 	pr_err("\tversion   %d\n",  (int)vid_hdr->version);
 	pr_err("\tvol_type  %d\n",  (int)vid_hdr->vol_type);
+	pr_err("\tvol_mode  %d\n",  (int)vid_hdr->vol_mode);
 	pr_err("\tcopy_flag %d\n",  (int)vid_hdr->copy_flag);
 	pr_err("\tcompat    %d\n",  (int)vid_hdr->compat);
 	pr_err("\tvol_id    %d\n",  be32_to_cpu(vid_hdr->vol_id));
@@ -112,6 +113,7 @@ void ubi_dump_vol_info(const struct ubi_volume *vol)
 	pr_err("\talignment       %d\n", vol->alignment);
 	pr_err("\tdata_pad        %d\n", vol->data_pad);
 	pr_err("\tvol_type        %d\n", vol->vol_type);
+	pr_err("\tvol_mode        %d\n", vol->vol_mode);
 	pr_err("\tname_len        %d\n", vol->name_len);
 	pr_err("\tusable_leb_size %d\n", vol->usable_leb_size);
 	pr_err("\tused_ebs        %d\n", vol->used_ebs);
@@ -144,6 +146,7 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 	pr_err("\talignment       %d\n", be32_to_cpu(r->alignment));
 	pr_err("\tdata_pad        %d\n", be32_to_cpu(r->data_pad));
 	pr_err("\tvol_type        %d\n", (int)r->vol_type);
+	pr_err("\tvol_mode        %d\n", (int)r->vol_mode);
 	pr_err("\tupd_marker      %d\n", (int)r->upd_marker);
 	pr_err("\tname_len        %d\n", name_len);
 
@@ -210,6 +213,7 @@ void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
 	pr_err("\talignment %d\n",   req->alignment);
 	pr_err("\tbytes     %lld\n", (long long)req->bytes);
 	pr_err("\tvol_type  %d\n",   req->vol_type);
+	pr_err("\tvol_mode  %d\n",   req->vol_mode);
 	pr_err("\tname_len  %d\n",   req->name_len);
 
 	memcpy(nm, req->name, 16);
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 4424af7ea9ac..94128dc50fd0 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -516,6 +516,7 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	struct ubi_vid_io_buf *vidb;
 	struct ubi_vid_hdr *vid_hdr;
 	uint32_t uninitialized_var(crc);
+	enum ubi_io_mode io_mode;
 
 	err = leb_read_lock(ubi, vol_id, lnum);
 	if (err)
@@ -601,8 +602,9 @@ retry:
 		ubi_free_vid_buf(vidb);
 	}
 
-	err = ubi_io_read_data(ubi, buf, pnum, offset, len,
-			       UBI_IO_MODE_NORMAL);
+	io_mode = ubi_vol_mode_to_io_mode(vol->vol_mode);
+
+	err = ubi_io_read_data(ubi, buf, pnum, offset, len, io_mode);
 	if (err) {
 		if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
@@ -719,6 +721,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 	struct ubi_device *ubi = vol->ubi;
 	struct ubi_vid_hdr *vid_hdr;
 	int new_pnum, err, vol_id = vol->vol_id, data_size;
+	enum ubi_io_mode io_mode;
 	uint32_t crc;
 
 	new_pnum = ubi_wl_get_peb(ubi);
@@ -739,13 +742,15 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 
 	ubi_assert(vid_hdr->vol_type == UBI_VID_DYNAMIC);
 
+	io_mode = ubi_io_mode_from_vid_hdr(vid_hdr);
+
 	mutex_lock(&ubi->buf_mutex);
 	memset(ubi->peb_buf + offset, 0xFF, len);
 
 	/* Read everything before the area where the write failure happened */
 	if (offset > 0) {
 		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset,
-				       UBI_IO_MODE_NORMAL);
+				       io_mode);
 		if (err && err != UBI_IO_BITFLIPS)
 			goto out_unlock;
 	}
@@ -763,7 +768,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 		goto out_unlock;
 
 	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size,
-				UBI_IO_MODE_NORMAL);
+				io_mode);
 
 out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
@@ -848,8 +853,10 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 				  struct ubi_vid_io_buf *vidb, const void *buf,
 				  int offset, int len)
 {
+	struct ubi_vid_hdr *vid_hdr = ubi_get_vid_hdr(vidb);
 	struct ubi_device *ubi = vol->ubi;
 	int pnum, opnum, err, vol_id = vol->vol_id;
+	enum ubi_io_mode io_mode;
 
 	pnum = ubi_wl_get_peb(ubi);
 	if (pnum < 0) {
@@ -862,6 +869,8 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
 
+	io_mode = ubi_io_mode_from_vid_hdr(vid_hdr);
+
 	err = ubi_io_write_vid_hdr(ubi, pnum, vidb);
 	if (err) {
 		ubi_warn(ubi, "failed to write VID header to LEB %d:%d, PEB %d",
@@ -871,7 +880,7 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 
 	if (len) {
 		err = ubi_io_write_data(ubi, buf, pnum, offset, len,
-					UBI_IO_MODE_NORMAL);
+					io_mode);
 		if (err) {
 			ubi_warn(ubi,
 				 "failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
@@ -914,10 +923,13 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	int err, pnum, tries, vol_id = vol->vol_id;
 	struct ubi_vid_io_buf *vidb;
 	struct ubi_vid_hdr *vid_hdr;
+	enum ubi_io_mode io_mode;
 
 	if (ubi->ro_mode)
 		return -EROFS;
 
+	io_mode = ubi_vol_mode_to_io_mode(vol->vol_mode);
+
 	err = leb_write_lock(ubi, vol_id, lnum);
 	if (err)
 		return err;
@@ -927,8 +939,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);
 
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len,
-					UBI_IO_MODE_NORMAL);
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len, io_mode);
 		if (err) {
 			ubi_warn(ubi, "failed to write data to PEB %d", pnum);
 			if (err == -EIO && ubi->bad_allowed)
@@ -952,6 +963,10 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	vid_hdr = ubi_get_vid_hdr(vidb);
 
 	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+	if (vol->vol_mode == UBI_VOL_MODE_SLC)
+		vid_hdr->vol_mode = UBI_VID_MODE_SLC;
+	else
+		vid_hdr->vol_mode = UBI_VID_MODE_NORMAL;
 	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
 	vid_hdr->vol_id = cpu_to_be32(vol_id);
 	vid_hdr->lnum = cpu_to_be32(lnum);
@@ -1041,6 +1056,11 @@ int ubi_eba_write_leb_st(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	crc = crc32(UBI_CRC32_INIT, buf, data_size);
 	vid_hdr->vol_type = UBI_VID_STATIC;
+	if (vol->vol_mode == UBI_VOL_MODE_SLC)
+		vid_hdr->vol_mode = UBI_VID_MODE_SLC;
+	else
+		vid_hdr->vol_mode = UBI_VID_MODE_NORMAL;
+
 	vid_hdr->data_size = cpu_to_be32(data_size);
 	vid_hdr->used_ebs = cpu_to_be32(used_ebs);
 	vid_hdr->data_crc = cpu_to_be32(crc);
@@ -1125,6 +1145,12 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	crc = crc32(UBI_CRC32_INIT, buf, len);
 	vid_hdr->vol_type = UBI_VID_DYNAMIC;
+
+	if (vol->vol_mode == UBI_VOL_MODE_SLC)
+		vid_hdr->vol_mode = UBI_VID_MODE_SLC;
+	else
+		vid_hdr->vol_mode = UBI_VID_MODE_NORMAL;
+
 	vid_hdr->data_size = cpu_to_be32(len);
 	vid_hdr->copy_flag = 1;
 	vid_hdr->data_crc = cpu_to_be32(crc);
@@ -1203,6 +1229,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	int err, vol_id, lnum, data_size, aldata_size, idx;
 	struct ubi_vid_hdr *vid_hdr = ubi_get_vid_hdr(vidb);
 	struct ubi_volume *vol;
+	enum ubi_io_mode io_mode;
 	uint32_t crc;
 
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
@@ -1266,6 +1293,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		data_size = aldata_size =
 			    vol->leb_size - be32_to_cpu(vid_hdr->data_pad);
 
+	io_mode = ubi_vol_mode_to_io_mode(vol->vol_mode);
+
 	/*
 	 * OK, now the LEB is locked and we can safely start moving it. Since
 	 * this function utilizes the @ubi->peb_buf buffer which is shared
@@ -1275,7 +1304,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	mutex_lock(&ubi->buf_mutex);
 	dbg_wl("read %d bytes of data", aldata_size);
 	err = ubi_io_read_data(ubi, ubi->peb_buf, from, 0, aldata_size,
-			       UBI_IO_MODE_NORMAL);
+			       io_mode);
 	if (err && err != UBI_IO_BITFLIPS) {
 		ubi_warn(ubi, "error %d while reading data from PEB %d",
 			 err, from);
@@ -1338,7 +1367,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 	if (data_size > 0) {
 		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size,
-					UBI_IO_MODE_NORMAL);
+					io_mode);
 		if (err) {
 			if (err == -EIO)
 				err = MOVE_TARGET_WR_ERR;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 329ad430473b..4a33b7a8d887 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1058,6 +1058,40 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 }
 
 /**
+ * validate_mode - validate a volume mode.
+ * @ubi: UBI device description object
+ * @vid_hdr: the volume identifier header to check
+ *
+ * This function checks that the volume mode stored in the volume identifier
+ * header @vid_hdr is correct. Returns zero if the VID header is OK and %1
+ * if not.
+ */
+static int validate_mode(const struct ubi_device *ubi,
+			 const struct ubi_vid_hdr *vid_hdr)
+{
+	/* All versions of UBI support normal mode. */
+	if (vid_hdr->vol_mode == UBI_VID_MODE_NORMAL)
+		return 0;
+
+	/* Version 1 only supports normal mode. */
+	if (vid_hdr->version == 1)
+		goto err;
+
+	/* Version 2 supports normal and SLC mode. */
+	if (vid_hdr->version == 2 &&
+	    vid_hdr->vol_mode != UBI_VID_MODE_SLC)
+		goto err;
+
+	return 0;
+
+err:
+	ubi_err(ubi, "mode %d not supported by UBI version %d",
+		vid_hdr->vol_mode, vid_hdr->version);
+
+	return -EINVAL;
+}
+
+/**
  * validate_vid_hdr - validate a volume identifier header.
  * @ubi: UBI device description object
  * @vid_hdr: the volume identifier header to check
@@ -1084,6 +1118,9 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 		goto bad;
 	}
 
+	if (validate_mode(ubi, vid_hdr))
+		goto bad;
+
 	if (copy_flag != 0 && copy_flag != 1) {
 		ubi_err(ubi, "bad copy_flag");
 		goto bad;
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index a536e482b954..94fa0d414db6 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -33,9 +33,10 @@
 #include <asm/byteorder.h>
 
 /* The version of UBI images supported by this implementation */
-#define UBI_CURRENT_VERSION		1
+#define UBI_CURRENT_VERSION		2
 #define UBI_SUPPORTS_VERSION(x)		BIT(x)
-#define UBI_SUPPORTED_VERSIONS		(UBI_SUPPORTS_VERSION(1))
+#define UBI_SUPPORTED_VERSIONS		(UBI_SUPPORTS_VERSION(1) |	\
+					 UBI_SUPPORTS_VERSION(2))
 #define UBI_VERSION_IS_SUPPORTED(x)	(BIT((x)) & UBI_SUPPORTED_VERSIONS)
 
 /* The highest erase counter value supported by this implementation */
@@ -115,6 +116,26 @@ enum {
 	UBI_COMPAT_REJECT   = 5
 };
 
+/*
+ * Mode constants used by internal volumes.
+ *
+ * @UBI_VID_MODE_NORMAL: eraseblocks are used as is. All pages within a block
+ *			 are written. Safe to be used on all devices except
+ *			 MLC/TLC NANDs
+ * @UBI_VID_MODE_SLC: eraseblocks are used in SLC mode (this is a software
+ *		      emulation of an SLC NAND, not the hardware SLC mode
+ *		      which is sometime provided by NAND vendors). Only the
+ *		      first write-unit/page of each pair of pages is used,
+ *		      which makes this mode robust against 'paired page'
+ *		      corruption.
+ *		      In the other hand, this means UBI will only expose half
+ *		      the capacity of the NAND.
+ */
+enum {
+	UBI_VID_MODE_NORMAL,
+	UBI_VID_MODE_SLC,
+};
+
 /* Sizes of UBI headers */
 #define UBI_EC_HDR_SIZE  sizeof(struct ubi_ec_hdr)
 #define UBI_VID_HDR_SIZE sizeof(struct ubi_vid_hdr)
@@ -182,6 +203,7 @@ struct ubi_ec_hdr {
  *          %UBI_COMPAT_IGNORE, %UBI_COMPAT_PRESERVE, or %UBI_COMPAT_REJECT)
  * @vol_id: ID of this volume
  * @lnum: logical eraseblock number
+ * @vol_mode: mode of this volume (%UBI_VID_MODE_NORMAL or %UBI_VID_MODE_SLC)
  * @padding1: reserved for future, zeroes
  * @data_size: how many bytes of data this logical eraseblock contains
  * @used_ebs: total number of used logical eraseblocks in this volume
@@ -287,7 +309,8 @@ struct ubi_vid_hdr {
 	__u8    compat;
 	__be32  vol_id;
 	__be32  lnum;
-	__u8    padding1[4];
+	__u8	vol_mode;
+	__u8    padding1[3];
 	__be32  data_size;
 	__be32  used_ebs;
 	__be32  data_pad;
@@ -339,6 +362,7 @@ struct ubi_vid_hdr {
  * @name_len: volume name length
  * @name: the volume name
  * @flags: volume flags (%UBI_VTBL_AUTORESIZE_FLG)
+ * @vol_mode: volume mode (%UBI_VID_MODE_NORMAL or %UBI_VID_MODE_SLC)
  * @padding: reserved, zeroes
  * @crc: a CRC32 checksum of the record
  *
@@ -375,7 +399,8 @@ struct ubi_vtbl_record {
 	__be16  name_len;
 	__u8    name[UBI_VOL_NAME_MAX+1];
 	__u8    flags;
-	__u8    padding[23];
+	__u8	vol_mode;
+	__u8    padding[22];
 	__be32  crc;
 } __packed;
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index de4c65cb8f7a..e667bf4f4b67 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -324,6 +324,7 @@ struct ubi_eba_leb_desc {
  *
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
+ * @vol_mode: volume mode (%UBI_VOL_MODE_NORMAL or %UBI_VOL_MODE_SLC)
  * @leb_size: logical eraseblock size
  * @usable_leb_size: logical eraseblock size without padding
  * @used_ebs: how many logical eraseblocks in this volume contain data
@@ -374,6 +375,7 @@ struct ubi_volume {
 
 	int reserved_pebs;
 	int vol_type;
+	int vol_mode;
 	int leb_size;
 	int usable_leb_size;
 	int used_ebs;
@@ -718,6 +720,7 @@ struct ubi_ainf_peb {
  * @highest_lnum: highest logical eraseblock number in this volume
  * @leb_count: number of logical eraseblocks in this volume
  * @vol_type: volume type
+ * @vol_mode: volume mode (%UBI_VOL_MODE_NORMAL or %UBI_VOL_MODE_SLC)
  * @used_ebs: number of used logical eraseblocks in this volume (only for
  *            static volumes)
  * @last_data_size: amount of data in the last logical eraseblock of this
@@ -726,6 +729,7 @@ struct ubi_ainf_peb {
  * @data_pad: how many bytes at the end of logical eraseblocks of this volume
  *            are not used (due to volume alignment)
  * @compat: compatibility flags of this volume
+ * @mode: volume mode (see %UBI_NORMAL_MODE and %UBI_NORMAL_MODE)
  * @rb: link in the volume RB-tree
  * @root: root of the RB-tree containing all the eraseblock belonging to this
  *        volume (&struct ubi_ainf_peb objects)
@@ -738,6 +742,7 @@ struct ubi_ainf_volume {
 	int highest_lnum;
 	int leb_count;
 	int vol_type;
+	int vol_mode;
 	int used_ebs;
 	int last_data_size;
 	int data_pad;
@@ -1172,6 +1177,61 @@ static inline int ubi_io_write_data(struct ubi_device *ubi, const void *buf,
 }
 
 /**
+ * ubi_io_mode_from_vid_hdr - Extract the I/O mode from VID header information.
+ * @vid_hdr: VID header to extract information from
+ */
+static inline int ubi_io_mode_from_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
+{
+	switch (vid_hdr->vol_mode) {
+	case UBI_VID_MODE_NORMAL:
+		return UBI_IO_MODE_NORMAL;
+	case UBI_VID_MODE_SLC:
+		return UBI_IO_MODE_SLC;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * ubi_vol_mode_from_vid_hdr - Extract the volume mode from VID header
+ *			       information.
+ * @vid_hdr: VID header to extract information from
+ */
+static inline int ubi_vol_mode_from_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
+{
+	switch (vid_hdr->vol_mode) {
+	case UBI_VID_MODE_NORMAL:
+		return UBI_VOL_MODE_NORMAL;
+	case UBI_VID_MODE_SLC:
+		return UBI_VOL_MODE_SLC;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * ubi_vol_mode_to_io_mode - Convert volume mode into I/O mode.
+ * @vol_mode: volume mode (%UBI_VOL_MODE_NORMAL or %UBI_VOL_MODE_SLC)
+ */
+static inline int ubi_vol_mode_to_io_mode(int vol_mode)
+{
+	switch (vol_mode) {
+	case UBI_VOL_MODE_NORMAL:
+		return UBI_IO_MODE_NORMAL;
+	case UBI_VOL_MODE_SLC:
+		return UBI_IO_MODE_SLC;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+/**
  * ubi_ro_mode - switch to read-only mode.
  * @ubi: UBI device description object
  */
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index ac703d4631e1..b85f0ab4a2b3 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -39,6 +39,8 @@ static struct device_attribute attr_vol_reserved_ebs =
 	__ATTR(reserved_ebs, S_IRUGO, vol_attribute_show, NULL);
 static struct device_attribute attr_vol_type =
 	__ATTR(type, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute attr_vol_mode =
+	__ATTR(mode, S_IRUGO, vol_attribute_show, NULL);
 static struct device_attribute attr_vol_name =
 	__ATTR(name, S_IRUGO, vol_attribute_show, NULL);
 static struct device_attribute attr_vol_corrupted =
@@ -95,6 +97,14 @@ static ssize_t vol_attribute_show(struct device *dev,
 		else
 			tp = "static";
 		ret = sprintf(buf, "%s\n", tp);
+	} else if (attr == &attr_vol_mode) {
+		const char *mode;
+
+		if (vol->vol_mode == UBI_VOL_MODE_SLC)
+			mode = "slc";
+		else
+			mode = "normal";
+		ret = sprintf(buf, "%s\n", mode);
 	} else if (attr == &attr_vol_name)
 		ret = sprintf(buf, "%s\n", vol->name);
 	else if (attr == &attr_vol_corrupted)
@@ -123,6 +133,7 @@ static ssize_t vol_attribute_show(struct device *dev,
 static struct attribute *volume_dev_attrs[] = {
 	&attr_vol_reserved_ebs.attr,
 	&attr_vol_type.attr,
+	&attr_vol_mode.attr,
 	&attr_vol_name.attr,
 	&attr_vol_corrupted.attr,
 	&attr_vol_alignment.attr,
@@ -186,9 +197,9 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		req->vol_id = vol_id;
 	}
 
-	dbg_gen("create device %d, volume %d, %llu bytes, type %d, name %s",
+	dbg_gen("create device %d, volume %d, %llu bytes, type %d, mode %d, name %s",
 		ubi->ubi_num, vol_id, (unsigned long long)req->bytes,
-		(int)req->vol_type, req->name);
+		(int)req->vol_type, (int)req->vol_mode, req->name);
 
 	/* Ensure that this volume does not exist */
 	err = -EEXIST;
@@ -207,12 +218,12 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 			goto out_unlock;
 		}
 
-	/*
-	 * Volume LEB size is currently PEB size - (size reserved for the EC
-	 * and VID headers). This will change with MLC/TLC NAND support and
-	 * the LEB consolidation concept.
-	 */
-	vol->leb_size = ubi->leb_size;
+	/* LEB size is adapted when SLC mode is requested. */
+	if (req->vol_mode == UBI_VOL_MODE_SLC)
+		vol->leb_size = (ubi->peb_size / ubi->max_lebs_per_peb) -
+				ubi->leb_start;
+	else
+		vol->leb_size = ubi->leb_size;
 
 	/* Calculate how many eraseblocks are requested */
 	vol->alignment = req->alignment;
@@ -237,6 +248,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 
 	vol->vol_id    = vol_id;
 	vol->vol_type  = req->vol_type;
+	vol->vol_mode  = req->vol_mode;
 	vol->name_len  = req->name_len;
 	memcpy(vol->name, req->name, vol->name_len);
 	vol->ubi = ubi;
@@ -305,6 +317,10 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		vtbl_rec.vol_type = UBI_VID_DYNAMIC;
 	else
 		vtbl_rec.vol_type = UBI_VID_STATIC;
+	if (vol->vol_mode == UBI_VOL_MODE_SLC)
+		vtbl_rec.vol_mode = UBI_VID_MODE_SLC;
+	else
+		vtbl_rec.vol_mode = UBI_VID_MODE_NORMAL;
 	memcpy(vtbl_rec.name, vol->name, vol->name_len);
 
 	err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 8f4abecdae59..ca5e45bc0ce1 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -171,7 +171,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 		      const struct ubi_vtbl_record *vtbl)
 {
 	int i, n, reserved_pebs, alignment, data_pad, vol_type, name_len;
-	int upd_marker, err;
+	int vol_mode, upd_marker, err;
 	uint32_t crc;
 	const char *name;
 
@@ -183,6 +183,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 		data_pad = be32_to_cpu(vtbl[i].data_pad);
 		upd_marker = vtbl[i].upd_marker;
 		vol_type = vtbl[i].vol_type;
+		vol_mode = vtbl[i].vol_mode;
 		name_len = be16_to_cpu(vtbl[i].name_len);
 		name = &vtbl[i].name[0];
 
@@ -258,6 +259,12 @@ static int vtbl_check(const struct ubi_device *ubi,
 			err = 12;
 			goto bad;
 		}
+
+		if (vol_mode != UBI_VID_MODE_NORMAL &&
+		    vol_mode != UBI_VID_MODE_SLC) {
+			err = 13;
+			goto bad;
+		}
 	}
 
 	/* Checks that all names are unique */
@@ -302,6 +309,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	struct ubi_vid_io_buf *vidb;
 	struct ubi_vid_hdr *vid_hdr;
 	struct ubi_ainf_peb *new_aeb;
+	enum ubi_io_mode io_mode;
 
 	dbg_gen("create volume table (copy #%d)", copy + 1);
 
@@ -318,6 +326,14 @@ retry:
 		goto out_free;
 	}
 
+	if (ubi->version > 1 && ubi->max_lebs_per_peb) {
+		vid_hdr->vol_mode = UBI_VID_MODE_SLC;
+		io_mode = UBI_IO_MODE_SLC;
+	} else {
+		vid_hdr->vol_mode = UBI_VID_MODE_NORMAL;
+		io_mode = UBI_IO_MODE_NORMAL;
+	}
+
 	vid_hdr->vol_type = UBI_LAYOUT_VOLUME_TYPE;
 	vid_hdr->vol_id = cpu_to_be32(UBI_LAYOUT_VOLUME_ID);
 	vid_hdr->compat = UBI_LAYOUT_VOLUME_COMPAT;
@@ -333,7 +349,7 @@ retry:
 
 	/* Write the layout volume contents */
 	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size,
-				UBI_IO_MODE_NORMAL);
+				io_mode);
 	if (err)
 		goto write_error;
 
@@ -381,6 +397,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 	struct ubi_ainf_peb *aeb;
 	struct ubi_vtbl_record *leb[UBI_LAYOUT_VOLUME_EBS] = { NULL, NULL };
 	int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] = {1, 1};
+	enum ubi_io_mode io_mode;
 
 	/*
 	 * UBI goes through the following steps when it changes the layout
@@ -407,6 +424,8 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 	 *    to LEB 0.
 	 */
 
+	io_mode = ubi_vol_mode_to_io_mode(av->vol_mode);
+
 	dbg_gen("check layout volume");
 
 	/* Read both LEB 0 and LEB 1 into memory */
@@ -418,7 +437,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 		}
 
 		err = ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum,
-				       0, ubi->vtbl_size, UBI_IO_MODE_NORMAL);
+				       0, ubi->vtbl_size, io_mode);
 		if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err))
 			/*
 			 * Scrub the PEB later. Note, -EBADMSG indicates an
@@ -555,8 +574,16 @@ static int init_volumes(struct ubi_device *ubi,
 		vol->upd_marker = vtbl[i].upd_marker;
 		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
 					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
+		if (vtbl[i].vol_mode == UBI_VID_MODE_SLC) {
+			vol->vol_mode = UBI_VOL_MODE_SLC;
+			vol->leb_size = (ubi->peb_size /
+					 ubi->max_lebs_per_peb) -
+					ubi->leb_start;
+		} else {
+			vol->vol_mode = UBI_VOL_MODE_NORMAL;
+			vol->leb_size = ubi->leb_size;
+		}
 		vol->name_len = be16_to_cpu(vtbl[i].name_len);
-		vol->leb_size = ubi->leb_size;
 		vol->usable_leb_size = vol->leb_size - vol->data_pad;
 		memcpy(vol->name, vtbl[i].name, vol->name_len);
 		vol->name[vol->name_len] = '\0';
@@ -629,14 +656,22 @@ static int init_volumes(struct ubi_device *ubi,
 	if (!vol)
 		return -ENOMEM;
 
+	av = ubi_find_av(ai, UBI_LAYOUT_VOLUME_ID);
+	ubi_assert(av);
+
 	vol->reserved_pebs = UBI_LAYOUT_VOLUME_EBS;
 	vol->alignment = UBI_LAYOUT_VOLUME_ALIGN;
 	vol->vol_type = UBI_DYNAMIC_VOLUME;
+	vol->vol_mode = av->vol_mode;
+	if (vol->vol_mode == UBI_VOL_MODE_SLC)
+		vol->leb_size = (ubi->peb_size / ubi->max_lebs_per_peb) -
+				ubi->leb_start;
+	else
+		vol->leb_size = ubi->leb_size;
 	vol->name_len = sizeof(UBI_LAYOUT_VOLUME_NAME) - 1;
 	memcpy(vol->name, UBI_LAYOUT_VOLUME_NAME, vol->name_len + 1);
 	vol->used_ebs = vol->reserved_pebs;
 	vol->last_eb_bytes = vol->reserved_pebs;
-	vol->leb_size = ubi->leb_size;
 	vol->usable_leb_size = vol->leb_size;
 	vol->used_bytes =
 		(long long)vol->used_ebs * (vol->leb_size - vol->data_pad);
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 1927b0d78a99..2acf4a753c65 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -224,6 +224,26 @@ enum {
 };
 
 /*
+ * UBI volume mode constants.
+ *
+ * @UBI_VOL_MODE_NORMAL: eraseblocks are used as is. All pages within a block
+ *			 are written. Safe to be used on all devices except
+ *			 MLC/TLC NANDs
+ * @UBI_VOL_MODE_SLC: eraseblocks are used in SLC mode (this is a software
+ *		      emulation of an SLC NAND, not the hardware SLC mode
+ *		      which is sometime provided by NAND vendors). Only the
+ *		      first write-unit/page of each pair of pages is used,
+ *		      which makes this mode robust against 'paired page'
+ *		      corruption.
+ *		      In the other hand, this means UBI will only expose half
+ *		      the capacity of the NAND.
+ */
+enum {
+	UBI_VOL_MODE_NORMAL,
+	UBI_VOL_MODE_SLC,
+};
+
+/*
  * UBI set volume property ioctl constants.
  *
  * @UBI_VOL_PROP_DIRECT_WRITE: allow (any non-zero value) or disallow (value 0)
@@ -291,7 +311,7 @@ struct ubi_attach_req {
  * @alignment: volume alignment
  * @bytes: volume size in bytes
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved for future, not used, has to be zeroed
+ * @vol_mode: volume mode (%UBI_VOL_MODE_NORMAL or %UBI_VOL_MODE_SLC)
  * @name_len: volume name length
  * @padding2: reserved for future, not used, has to be zeroed
  * @name: volume name
@@ -320,7 +340,7 @@ struct ubi_mkvol_req {
 	__s32 alignment;
 	__s64 bytes;
 	__s8 vol_type;
-	__s8 padding1;
+	__s8 vol_mode;
 	__s16 name_len;
 	__s8 padding2[4];
 	char name[UBI_MAX_VOLUME_NAME + 1];
-- 
2.7.4
