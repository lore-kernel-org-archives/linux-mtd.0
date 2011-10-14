Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1REWLc-0004oP-QB
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 01:14:06 +0000
Received: by mail-iy0-f178.google.com with SMTP id q3so2022969iaq.9
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Oct 2011 18:14:01 -0700 (PDT)
Sender: Kevin Herbert <kevin.herbert@meraki.net>
Subject: [PATCH] ubi: Add support for UBI PEB sizes that are a multiple of the
	erase size
To: <linux-mtd@lists.infradead.org>
Message-Id: <20111014011436.2E298A1DDB@snowflake>
Date: Thu, 13 Oct 2011 18:14:36 -0700 (PDT)
From: Kevin Paul Herbert <kevin.herbert@meraki.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Add support for UBI PEB sizes that are a multiple of the erase size.
This allows for portability between UBI volumes on FLASH devices,
as long as a common multiple of the erase size is used on all FLASH
devices.

In order to implement this feature, a new field was added to the
erase block header, which must be initialized by the ubinize tool.
This new peb_size field in the ubi_ec_hdr was previously initialized
as zero, so existing PEBs with this field containing zero are assumed
to be using a PEB which is equal to the erase size. At attach time,
the first erase block without errors is scanned for, looking for a
PEB size field. If this field is non-zero, it is required to be a
multiple of the erase size, and all subsequent PEBs are required to
have the same value.

PEBs are required to be aligned on boundaries that are a multiple
of the PEB size. This means that in the case of a bad block in NAND,
rather than skipping to the next block, one must skip to the next
properly aligned block. All checks for bad blocks now consider
any bad block in the cluster to make the entire cluster bad.
Otherwise, it would be impossible to determine boundaries when
a block became bad.

Signed-off-by: Kevin Paul Herbert <kph@meraki.net>
---
 drivers/mtd/ubi/build.c     |   55 ++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/io.c        |   42 ++++++++++++++++++++++-----------
 drivers/mtd/ubi/scan.c      |   16 ++++++++++++
 drivers/mtd/ubi/ubi-media.h |    4 ++-
 4 files changed, 99 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 65626c1..98abae8 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -638,6 +638,12 @@ out_si:
  */
 static int io_init(struct ubi_device *ubi)
 {
+	struct ubi_ec_hdr ec_hdr;
+	int ret;
+	loff_t offset;
+	size_t retlen;
+	uint64_t sz, sz_temp;
+
 	if (ubi->mtd->numeraseregions != 0) {
 		/*
 		 * Some flashes have several erase regions. Different regions
@@ -656,13 +662,56 @@ static int io_init(struct ubi_device *ubi)
 		return -EINVAL;
 
 	/*
+	 * Attempt to determine the PEB size of this volume. The
+	 * default is the erase size. If the volume does not have a
+	 * size written, then it is an old volume, and it must be the
+	 * erase size. If the volume reads back FF, then it has not
+	 * been initialized, so use the erase size. Otherwise, if there
+	 * is a non-zero value, use that.
+	 */
+
+	ubi->peb_size = ubi->mtd->erasesize;
+	for (offset = 0; offset < ubi->mtd->size;
+	     offset += ubi->mtd->erasesize) {
+		if (ubi->mtd->block_isbad &&
+		    (*ubi->mtd->block_isbad)(ubi->mtd, offset))
+			continue;
+		ret = ubi->mtd->read(ubi->mtd, offset, sizeof(ec_hdr), &retlen,
+				     (uint8_t *)&ec_hdr);
+		if (ret)
+			continue;
+		if (retlen != sizeof(ec_hdr))
+			continue;
+		if (be32_to_cpu(ec_hdr.magic) != UBI_EC_HDR_MAGIC)
+			break;
+		if (ec_hdr.version > UBI_VERSION)
+			break;
+		if (!ec_hdr.peb_size)
+			break;
+		ubi->peb_size = be32_to_cpu(ec_hdr.peb_size);
+		if (ubi->peb_size % ubi->mtd->erasesize) {
+			ubi_err("peb_size %d is not a multiple of erasesize %d",
+				ubi->peb_size, ubi->mtd->erasesize);
+			return -EINVAL;
+		}
+		sz_temp = offset;
+		if (do_div(sz_temp, ubi->peb_size)) {
+			ubi_err("peb_size %d is not a multiple of offset %llu",
+				ubi->peb_size, offset);
+			return -EINVAL;
+		}
+		break;
+	}
+
+	/*
 	 * Note, in this implementation we support MTD devices with 0x7FFFFFFF
 	 * physical eraseblocks maximum.
 	 */
 
-	ubi->peb_size   = ubi->mtd->erasesize;
-	ubi->peb_count  = mtd_div_by_eb(ubi->mtd->size, ubi->mtd);
-	ubi->flash_size = ubi->mtd->size;
+	sz = ubi->mtd->size;
+	ubi->flash_size = sz;
+	do_div(sz, ubi->peb_size);
+	ubi->peb_count  = sz;
 
 	if (ubi->mtd->block_isbad && ubi->mtd->block_markbad)
 		ubi->bad_allowed = 1;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 8c1b1c7..aa3fe4c 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -629,19 +629,26 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum)
 {
 	struct mtd_info *mtd = ubi->mtd;
+	loff_t offset;
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
 	if (ubi->bad_allowed) {
-		int ret;
-
-		ret = mtd->block_isbad(mtd, (loff_t)pnum * ubi->peb_size);
-		if (ret < 0)
-			ubi_err("error %d while checking if PEB %d is bad",
-				ret, pnum);
-		else if (ret)
-			dbg_io("PEB %d is bad", pnum);
-		return ret;
+		for (offset = 0; offset < ubi->peb_size;
+		     offset += mtd->erasesize) {
+			int ret;
+
+			ret = mtd->block_isbad(mtd,
+					       (loff_t)pnum * ubi->peb_size +
+					       offset);
+			if (ret < 0)
+				ubi_err("error %d while checking if PEB %d "
+					"is bad",
+					ret, pnum);
+			else if (ret)
+				dbg_io("PEB %d is bad", pnum);
+			return ret;
+		}
 	}
 
 	return 0;
@@ -657,8 +664,9 @@ int ubi_io_is_bad(const struct ubi_device *ubi, int pnum)
  */
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum)
 {
-	int err;
+	int err, last_err = 0;
 	struct mtd_info *mtd = ubi->mtd;
+	loff_t offset;
 
 	ubi_assert(pnum >= 0 && pnum < ubi->peb_count);
 
@@ -670,10 +678,15 @@ int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum)
 	if (!ubi->bad_allowed)
 		return 0;
 
-	err = mtd->block_markbad(mtd, (loff_t)pnum * ubi->peb_size);
-	if (err)
-		ubi_err("cannot mark PEB %d bad, error %d", pnum, err);
-	return err;
+	for (offset = 0; offset < ubi->peb_size; offset += mtd->erasesize) {
+		err = mtd->block_markbad(mtd, (loff_t)pnum * ubi->peb_size +
+			offset);
+		if (err) {
+			ubi_err("cannot mark PEB %d bad, error %d", pnum, err);
+			last_err = err;
+		}
+	}
+	return last_err;
 }
 
 /**
@@ -872,6 +885,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	ec_hdr->vid_hdr_offset = cpu_to_be32(ubi->vid_hdr_offset);
 	ec_hdr->data_offset = cpu_to_be32(ubi->leb_start);
 	ec_hdr->image_seq = cpu_to_be32(ubi->image_seq);
+	ec_hdr->peb_size = cpu_to_be32(ubi->peb_size);
 	crc = crc32(UBI_CRC32_INIT, ec_hdr, UBI_EC_HDR_SIZE_CRC);
 	ec_hdr->hdr_crc = cpu_to_be32(crc);
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 2135a53..8cc1be6 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -892,6 +892,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 
 	if (!ec_err) {
 		int image_seq;
+		int peb_size;
 
 		/* Make sure UBI version is OK */
 		if (ech->version != UBI_VERSION) {
@@ -936,6 +937,21 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			ubi_dbg_dump_ec_hdr(ech);
 			return -EINVAL;
 		}
+
+		/*
+		 * Make sure that all PEBs have the same PEB size. This
+		 * is a validity check similar in function to the image
+		 * sequence number. As this field was also added after the
+		 * on-FLASH format, a value of zero is acceptable here.
+		 */
+
+		peb_size = be32_to_cpu(ech->peb_size);
+		if (peb_size && (peb_size != ubi->peb_size)) {
+			ubi_err("bad peb size %d in PEB %d, "
+				"expected %d", peb_size, pnum, ubi->peb_size);
+			ubi_dbg_dump_ec_hdr(ech);
+			return -EINVAL;
+		}
 	}
 
 	/* OK, we've done with the EC header, let's look at the VID header */
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 6fb8ec2..58bece0 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -130,6 +130,7 @@ enum {
  * @vid_hdr_offset: where the VID header starts
  * @data_offset: where the user data start
  * @image_seq: image sequence number
+ * @peb_size: size of PEB, must be multiple of erase size
  * @padding2: reserved for future, zeroes
  * @hdr_crc: erase counter header CRC checksum
  *
@@ -162,7 +163,8 @@ struct ubi_ec_hdr {
 	__be32  vid_hdr_offset;
 	__be32  data_offset;
 	__be32  image_seq;
-	__u8    padding2[32];
+	__be32	peb_size;
+	__u8    padding2[28];
 	__be32  hdr_crc;
 } __packed;
 
-- 
1.7.4.1
