Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cN0ls-0007Ag-Ra
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2016 17:15:14 +0000
Received: by mail-lf0-x244.google.com with SMTP id t196so18325651lff.3
 for <linux-mtd@lists.infradead.org>; Fri, 30 Dec 2016 09:14:52 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC 2/2] ubi: add support for UBI_EC_FLAG_ERASE_FROM_HERE
Date: Fri, 30 Dec 2016 18:11:51 +0100
Message-Id: <20161230171151.13448-2-zajec5@gmail.com>
In-Reply-To: <20161230171151.13448-1-zajec5@gmail.com>
References: <20161230171151.13448-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

This flag can be used to mark block that should start erasing process
(including that block itself).
This can be useful for devices that don't support UBI natively (in a
bootloader or original firmware). In such cases we need to flash
ubinized image which is usually created with autoresize flag. In such
cases only few blocks of the whole ubi partition are programmed and the
rest of them should be formatted when attaching.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
Hi,

This patch is my attempt of getting upstream solution of problem we were
solving locally in OpenWrt/LEDE projects.

There are a lot of home routers with original firmware and bootloaders
not supporting UBI in any way. This is where we use ubinize tool to
prepare images with UBI. Unfortunately flashing such an image to the
firmware partition writes only few blocks (as many as were created by
ubinize). We need some way of formatting remainig blocks of the firmware
(ubi) partition.

This is RFC and I'd really like to hear your comments.

First of all using a global erase_all_next_pebs is a pretty bad idea. I
mean to store this information in struct ubi_attach_info but there goes
my question:
1) Should I pass "struct ubi_attach_info" to the ubi_io_read_ec_hdr to
   let this function set some interfnal flah that all next blocks should
   be erased?
OR
2) Should I introduce UBI_IO_ERASE (or similar) and add support for this
   new "error" in the scan_peb?

Second question: I wasn't sure what's the better solution:
1) Create empty block with UBI_EC_FLAG_ERASE_FROM_HERE
OR
2) Set UBI_EC_FLAG_ERASE_BEYOND in the last block

Third question: what impact this change can have? I'm pretty sure I'll
need to adjust ubiformat tool. We don't want to format ubi with writing
image at the same time, just to trigger erasing blocks on the next
attach attempt. I guess ubiformat shouldn't copy/write this flag when
writing an image (--flash-image=<file> option). What else should I
consider?
---
 drivers/mtd/ubi/attach.c    |  4 ++++
 drivers/mtd/ubi/io.c        | 16 ++++++++++++++++
 drivers/mtd/ubi/ubi-media.h |  3 +++
 drivers/mtd/ubi/ubi.h       |  3 +++
 4 files changed, 26 insertions(+)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4..b01e932 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -95,6 +95,8 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
 #define AV_ADD		BIT(1)
 #define AV_FIND_OR_ADD	(AV_FIND | AV_ADD)
 
+bool erase_all_next_pebs;
+
 /**
  * find_or_add_av - internal function to find a volume, add a volume or do
  *		    both (find and add if missing).
@@ -1573,6 +1575,8 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (!ai)
 		return -ENOMEM;
 
+	erase_all_next_pebs = false;
+
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	/* On small flash devices we disable fastmap in any case. */
 	if ((int)mtd_div_by_eb(ubi->mtd->size, ubi->mtd) <= UBI_FM_MAX_START) {
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b6fb8f9..c2a8ce6 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -758,6 +758,13 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 		 */
 	}
 
+	if (erase_all_next_pebs) {
+		if (!read_err)
+			return UBI_IO_FF;
+		else
+			return UBI_IO_FF_BITFLIPS;
+	}
+
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
 		if (mtd_is_eccerr(read_err))
@@ -813,6 +820,15 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			return UBI_IO_BAD_HDR_EBADMSG;
 	}
 
+	if (ec_hdr->flags1 & UBI_EC_FLAG_ERASE_FROM_HERE) {
+		ubi_msg(ubi, "erasing all PEBs starting from %d", pnum);
+		erase_all_next_pebs = true;
+		if (!read_err)
+			return UBI_IO_FF;
+		else
+			return UBI_IO_FF_BITFLIPS;
+	}
+
 	/* And of course validate what has just been read from the media */
 	err = validate_ec_hdr(ubi, ec_hdr);
 	if (err) {
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 58065ef..0e8cace 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -35,6 +35,9 @@
 /* The version of UBI images supported by this implementation */
 #define UBI_VERSION 1
 
+/* The version of UBI images supported by this implementation */
+#define UBI_EC_FLAG_ERASE_FROM_HERE	(1 << 0)
+
 /* The highest erase counter value supported by this implementation */
 #define UBI_MAX_ERASECOUNTER 0x7FFFFFFF
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 697dbcb..45a2cf3 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -779,6 +779,7 @@ struct ubi_attach_info {
 	int mean_ec;
 	uint64_t ec_sum;
 	int ec_count;
+	int erase_all_next_pebs;
 	struct kmem_cache *aeb_slab_cache;
 	struct ubi_ec_hdr *ech;
 	struct ubi_vid_io_buf *vidb;
@@ -821,6 +822,8 @@ extern struct class ubi_class;
 extern struct mutex ubi_devices_mutex;
 extern struct blocking_notifier_head ubi_notifiers;
 
+extern bool erase_all_next_pebs;
+
 /* attach.c */
 struct ubi_ainf_peb *ubi_alloc_aeb(struct ubi_attach_info *ai, int pnum,
 				   int ec);
-- 
2.10.1
