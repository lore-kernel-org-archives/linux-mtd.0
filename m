Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsD-00060O-Ue
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:31:54 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/6] UBI: rework the on-flash format versioning logic
Date: Mon,  5 Sep 2016 17:31:23 +0200
Message-Id: <1473089487-29285-3-git-send-email-boris.brezillon@free-electrons.com>
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

Currently, the UBI implementation only supports a single on-flash format
version (version 1).

Rework the version checking/initialization logic to allow the same
implementation to support several on-flash version.

If an empty device is detected, the core picks the latest version
supported by the UBI implementation.

Note that we have moved the version validation code in its own function
so that it can be re-used by both VID and EC header validation.

We also dropped the ech->version check done in scan_peb() since it's
already done when ubi_io_read_ec_hdr() is called.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/attach.c    | 37 +++++++++++++++++++++++++++------
 drivers/mtd/ubi/build.c     |  3 +++
 drivers/mtd/ubi/io.c        | 50 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/mtd/ubi/ubi-media.h |  8 ++++++--
 drivers/mtd/ubi/ubi.h       |  1 +
 5 files changed, 86 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4f27d5..48b6f3f8eb40 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -959,6 +959,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	struct ubi_vid_hdr *vidh = ubi_get_vid_hdr(vidb);
 	long long ec;
 	int err, bitflips = 0, vol_id = -1, ec_err = 0;
+	int version = -1;
 
 	dbg_bld("scan PEB %d", pnum);
 
@@ -1008,12 +1009,8 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (!ec_err) {
 		int image_seq;
 
-		/* Make sure UBI version is OK */
-		if (ech->version != UBI_VERSION) {
-			ubi_err(ubi, "this UBI version is %d, image version is %d",
-				UBI_VERSION, (int)ech->version);
-			return -EINVAL;
-		}
+		/* Initialize the version value to the EC header one. */
+		version = ech->version;
 
 		ec = be64_to_cpu(ech->ec);
 		if (ec > UBI_MAX_ERASECOUNTER) {
@@ -1142,6 +1139,27 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		return -EINVAL;
 	}
 
+	/*
+	 * version might be < 0 if the EC header is corrupted. In this case,
+	 * pick the version found in the VID header.
+	 */
+	if (version < 0)
+		version = vidh->version;
+
+	/* Make sure both VID header and EC header version value match. */
+	if (vidh->version != version) {
+		ubi_err(ubi,
+			"version in VID and EC headers do not match (%d %d)",
+			(int)vidh->version, (int)version);
+	}
+
+	/*
+	 * Initialize the UBI device version if it's the first valid PEB we are
+	 * scanning.
+	 */
+	if (ubi->version < 0)
+		ubi->version = version;
+
 	vol_id = be32_to_cpu(vidh->vol_id);
 	if (vol_id > UBI_MAX_VOLUMES && !vol_ignored(vol_id)) {
 		int lnum = be32_to_cpu(vidh->lnum);
@@ -1268,6 +1286,13 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			ubi_msg(ubi, "empty MTD device detected");
 			get_random_bytes(&ubi->image_seq,
 					 sizeof(ubi->image_seq));
+
+			/*
+			 * Initialize the version to the last supported
+			 * version.
+			 */
+			if (ubi->version < 0)
+				ubi->version = UBI_CURRENT_VERSION;
 		} else {
 			ubi_err(ubi, "MTD device is not UBI-formatted and possibly contains non-UBI data - refusing it");
 			return -EINVAL;
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 914fcf07b573..5b12fa92a695 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -926,6 +926,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	ubi->vid_hdr_offset = vid_hdr_offset;
 	ubi->autoresize_vol_id = -1;
 
+	/* Initialize the version to -1 to let UBI detect it at attach time. */
+	ubi->version = -1;
+
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	ubi->fm_pool.used = ubi->fm_pool.size = 0;
 	ubi->fm_wl_pool.used = ubi->fm_wl_pool.size = 0;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b6fb8f945c21..6676c21c406b 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -662,6 +662,42 @@ int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum)
 }
 
 /**
+ * validate_version - validate the version number found in the EC or VID
+ *		      header.
+ * @ubi: UBI device description object
+ * @version: version number to check
+ *
+ * This function returns zero if the version is supported by the UBI
+ * implementation and is consistent with previous version numbers found
+ * in other headers.
+ */
+static int validate_version(const struct ubi_device *ubi, int version)
+{
+	if (!UBI_VERSION_IS_SUPPORTED(version)) {
+		unsigned long supports = UBI_SUPPORTED_VERSIONS;
+		int i;
+
+		ubi_err(ubi, "node with incompatible UBI version found");
+		ubi_err(ubi, "\tversion version is %d", version);
+		ubi_err(ubi, "\tthis implementation supports:");
+		for_each_set_bit(i, &supports, 8)
+			ubi_err(ubi, "\t\t%d", i);
+
+		return -EINVAL;
+	}
+
+	if (ubi->version >= 0 && version != ubi->version) {
+		ubi_err(ubi, "node with inconsistent UBI version found");
+		ubi_err(ubi, "\tdevice version is %d", ubi->version);
+		ubi_err(ubi, "\theader version is %d", version);
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
  * validate_ec_hdr - validate an erase counter header.
  * @ubi: UBI device description object
  * @ec_hdr: the erase counter header to check
@@ -679,9 +715,8 @@ static int validate_ec_hdr(const struct ubi_device *ubi,
 	vid_hdr_offset = be32_to_cpu(ec_hdr->vid_hdr_offset);
 	leb_start = be32_to_cpu(ec_hdr->data_offset);
 
-	if (ec_hdr->version != UBI_VERSION) {
-		ubi_err(ubi, "node with incompatible UBI version found: this UBI version is %d, image version is %d",
-			UBI_VERSION, (int)ec_hdr->version);
+	if (validate_version(ubi, ec_hdr->version)) {
+		ubi_err(ubi, "bad version in EC header");
 		goto bad;
 	}
 
@@ -852,7 +887,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
 
 	ec_hdr->magic = cpu_to_be32(UBI_EC_HDR_MAGIC);
-	ec_hdr->version = UBI_VERSION;
+	ec_hdr->version = ubi->version;
 	ec_hdr->vid_hdr_offset = cpu_to_be32(ubi->vid_hdr_offset);
 	ec_hdr->data_offset = cpu_to_be32(ubi->leb_start);
 	ec_hdr->image_seq = cpu_to_be32(ubi->image_seq);
@@ -892,6 +927,11 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 	int data_crc = be32_to_cpu(vid_hdr->data_crc);
 	int usable_leb_size = ubi->leb_size - data_pad;
 
+	if (validate_version(ubi, vid_hdr->version)) {
+		ubi_err(ubi, "bad version in VID header");
+		goto bad;
+	}
+
 	if (copy_flag != 0 && copy_flag != 1) {
 		ubi_err(ubi, "bad copy_flag");
 		goto bad;
@@ -1110,7 +1150,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 		return err;
 
 	vid_hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
-	vid_hdr->version = UBI_VERSION;
+	vid_hdr->version = ubi->version;
 	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
 	vid_hdr->hdr_crc = cpu_to_be32(crc);
 
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 22ed3f627506..a536e482b954 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -33,7 +33,10 @@
 #include <asm/byteorder.h>
 
 /* The version of UBI images supported by this implementation */
-#define UBI_VERSION 1
+#define UBI_CURRENT_VERSION		1
+#define UBI_SUPPORTS_VERSION(x)		BIT(x)
+#define UBI_SUPPORTED_VERSIONS		(UBI_SUPPORTS_VERSION(1))
+#define UBI_VERSION_IS_SUPPORTED(x)	(BIT((x)) & UBI_SUPPORTED_VERSIONS)
 
 /* The highest erase counter value supported by this implementation */
 #define UBI_MAX_ERASECOUNTER 0x7FFFFFFF
@@ -170,7 +173,8 @@ struct ubi_ec_hdr {
  * struct ubi_vid_hdr - on-flash UBI volume identifier header.
  * @magic: volume identifier header magic number (%UBI_VID_HDR_MAGIC)
  * @version: UBI implementation version which is supposed to accept this UBI
- *           image (%UBI_VERSION)
+ *           image (see %UBI_SUPPORTED_VERSIONS for the currently supported
+ *           versions)
  * @vol_type: volume type (%UBI_VID_DYNAMIC or %UBI_VID_STATIC)
  * @copy_flag: if this logical eraseblock was copied from another physical
  *             eraseblock (for wear-leveling reasons)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a5c509434061..1377e300a118 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -567,6 +567,7 @@ struct ubi_device {
 	spinlock_t volumes_lock;
 	int ref_count;
 	int image_seq;
+	int version;
 
 	int rsvd_pebs;
 	int avail_pebs;
-- 
2.7.4
