Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1FFZ-0007gP-6m
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:44:13 +0000
Received: by pwj4 with SMTP id 4so490491pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:44:07 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:38 +0530
Message-ID: <i2x6b5362aa1004120136gc9fd527en6b5ef4aeae0d7c6a@mail.gmail.com>
Subject: PATCH 7/7] ubi: logging feature for ubi
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, rohit.dongre@samsung.com,
	brijesh.s.singh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Note: changes in current file for logging feature

Signed-off-by: brijesh singh <brij.singh@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/io.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/io.c	2010-04-09 21:54:02.645580870 +0530
@@ -373,6 +373,7 @@
 	return 0;
 }

+#ifndef CONFIG_MTD_UBI_LOGGED
 /**
  * check_pattern - check if buffer contains only a certain byte pattern.
  * @buf: buffer to check
@@ -391,10 +392,124 @@
 			return 0;
 	return 1;
 }
+#endif

 /* Patterns to write to a physical eraseblock when torturing it */
 static uint8_t patterns[] = {0xa5, 0x5a, 0x0};

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * validate_node_hdr- validate node header
+ * @ubi: ubi descriptor
+ * @node: node to be verified
+ * read_err: read error during node read
+ *
+ * This function validates node header. Even if there was a read error (ECC)
+ * during mtd_read, this function verifies it's own crc, to verify if node is
+ * free of errors.
+ * Returns 0 on success, error code otherwise.
+ */
+static int validate_node_hdr(struct ubi_device *ubi,
+					struct node_t *node, int read_err)
+{
+	int magic, crc, stored_crc;
+
+	magic = be32_to_cpu(node->magic);
+
+	if (magic != UBIL_NODE_MAGIC) {
+		/*
+		 * Wrong magic. If there was no error during read,
+		 * lets check if the node has all 0xFF.It means node is empty.
+		 * But if there was a read error, we do not test it for all
+		 * 0xFFs. Even if it does contain all 0xFFs, this error
+		 * indicates that something is still wrong with this physical
+		 * eraseblock and we anyway cannot treat it as empty.
+		 */
+		if (read_err != -EBADMSG &&
+			check_pattern(node, 0xFF, ubi->node_size)) {
+			/* The physical eraseblock is supposedly empty */
+			return UBIL_NODE_EMPTY;
+		}
+		/*
+		 * This is not a valid RECORD.
+		 */
+		ubi_err("bad Magic in node");
+		return UBIL_NODE_BAD_HDR;
+	}
+
+	/* Check for Header CRC */
+	stored_crc = be32_to_cpu(node->hdr_crc);
+	crc = crc32(UBI_CRC32_INIT, node, UBIL_NODE_SIZE_CRC);
+
+	if (stored_crc != crc) {
+		ubi_err("header CRC error stored %d calculated %d",
+							stored_crc, crc);
+		return UBIL_NODE_BAD_HDR;
+	}
+	return 0;
+}
+
+/**
+ * ubi_read_node: read generic node type node_t from media
+ * @ubi: ubi descriptor
+ * @node: node, where to read
+ * @pnum: pnum from where to read
+ * @offset: offset where to read
+ * @len: length to be read
+ * This function reads the node in generic node type.
+ * @Returns 0 on success, error code other wise.
+ */
+int ubi_read_node(struct ubi_device *ubi, struct node_t *node,
+					int pnum, int offset, int len)
+{
+	int err, read_err = 0;
+
+	dbg_io("reading node entry PEB %d offset %d len %d", pnum, offset, len);
+	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
+
+	err = ubi_io_read(ubi, node, pnum, offset, len);
+	if (err) {
+		if (err == UBI_IO_BITFLIPS ||  err == -EBADMSG) {
+			read_err = err;
+		} else {
+			ubi_ro_mode(ubi);
+			dump_stack();
+		}
+	}
+
+	err = validate_node_hdr(ubi, node, read_err);
+	return err;
+}
+
+/**
+ * ubi_write_node: read generic node type node_t from media
+ * @ubi: ubi descriptor
+ * @node: node, where to read
+ * @pnum: pnum from where to read
+ * @offset: offset where to read
+ * @len: length to be read
+ *
+ * This function write the generic type node to flash.
+ * @Returns 0 on success, error code other wise.
+ */
+int ubi_write_node(struct ubi_device *ubi, struct node_t *node,
+					int pnum, int offset, int len)
+{
+
+	int crc, err;
+	dbg_io("writing Node Entry PEB %d Offset %d Len %d", peb, offset, len);
+	ubi_assert(pnum >= 0 &&  pnum < ubi->peb_count);
+
+	node->magic = cpu_to_be32(UBIL_NODE_MAGIC);
+	/* calculate the header CRC */
+	crc = crc32(UBI_CRC32_INIT, node, UBIL_NODE_SIZE_CRC);
+	node->hdr_crc = cpu_to_be32(crc);
+
+	err = ubi_io_write(ubi, node, pnum, offset, len);
+	return err;
+}
+#endif
+
 /**
  * torture_peb - test a supposedly bad physical eraseblock.
  * @ubi: UBI device description object
@@ -469,6 +584,7 @@
 	return err;
 }

+#ifndef CONFIG_MTD_UBI_LOGGED
 /**
  * nor_erase_prepare - prepare a NOR flash PEB for erasure.
  * @ubi: UBI device description object
@@ -532,6 +648,7 @@
 	ubi_dbg_dump_flash(ubi, pnum, 0, ubi->peb_size);
 	return -EIO;
 }
+#endif

 /**
  * ubi_io_sync_erase - synchronously erase a physical eraseblock.
@@ -563,13 +680,17 @@
 		ubi_err("read-only mode");
 		return -EROFS;
 	}
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	/**
+	 *  FIXME: when ubi has logged, this might not be needed.
+	 */
+#else
 	if (ubi->nor_flash) {
 		err = nor_erase_prepare(ubi, pnum);
 		if (err)
 			return err;
 	}
-
+#endif
 	if (torture) {
 		ret = torture_peb(ubi, pnum);
 		if (ret < 0)
@@ -641,6 +762,7 @@
 	return err;
 }

+#ifndef CONFIG_MTD_UBI_LOGGED
 /**
  * validate_ec_hdr - validate an erase counter header.
  * @ubi: UBI device description object
@@ -1114,6 +1236,7 @@
 			   ubi->vid_hdr_alsize);
 	return err;
 }
+#endif

 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID

--- ubi_old/drivers/mtd/ubi/eba.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/eba.c	2010-04-09 21:54:02.635580892 +0530
@@ -311,6 +311,30 @@
 	spin_unlock(&ubi->ltree_lock);
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * ubi_eba_leb_to_peb: return peb for the leb.
+ * @ubi: ubi descriptor
+ * @val: valume of leb
+ * @leb: leb for which peb is returned.
+ *
+ * This function rturns peb for the leb of given volume.
+ * TODO: Remove this. vtbl is using this function, in much needed hack.
+ */
+int ubi_eba_leb_to_peb(struct ubi_device *ubi, struct ubi_volume *vol,
+		      int lnum)
+{
+	int pnum, err;
+	err = leb_read_lock(ubi, vol->vol_id, lnum);
+	if (err)
+		return err;
+	pnum = vol->eba_tbl[lnum];
+
+	leb_read_unlock(ubi, vol->vol_id, lnum);
+	return pnum;
+}
+#endif
+
 /**
  * ubi_eba_unmap_leb - un-map logical eraseblock.
  * @ubi: UBI device description object
@@ -406,7 +430,13 @@
 			err = -ENOMEM;
 			goto out_unlock;
 		}
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+		err = ubi_el_read_vid_hdr(ubi, pnum, vid_hdr, 1);
+		if (err != UBIL_PEB_USED) {
+			err = -EIO;
+			goto out_free;
+		}
+#else
 		err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
 		if (err && err != UBI_IO_BITFLIPS) {
 			if (err > 0) {
@@ -420,7 +450,7 @@
 				 */
 				if (err == UBI_IO_BAD_VID_HDR) {
 					ubi_warn("corrupted VID header at PEB "
-						 "%d, LEB %d:%d", pnum, vol_id,
+						"%d, LEB %d:%d", pnum, vol_id,
 						 lnum);
 					err = -EBADMSG;
 				} else
@@ -429,7 +459,7 @@
 			goto out_free;
 		} else if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
-
+#endif
 		ubi_assert(lnum < be32_to_cpu(vid_hdr->used_ebs));
 		ubi_assert(len == be32_to_cpu(vid_hdr->data_size));

@@ -513,16 +543,31 @@
 	}

 	ubi_msg("recover PEB %d, move data to PEB %d", pnum, new_pnum);
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_read_vid_hdr(ubi, pnum, vid_hdr, 1);
+	if (err == UBIL_PEB_USED_SP) {
+		ubi_err("can not recover special block");
+		ubi_wl_put_peb(ubi, new_pnum, 1);
+		ubi_free_vid_hdr(ubi, vid_hdr);
+		BUG();
+	} else if (err != UBIL_PEB_USED) {
+		err = -EIO;
+		goto out_put;
+	}
+#else
 	err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
 	if (err && err != UBI_IO_BITFLIPS) {
 		if (err > 0)
 			err = -EIO;
 		goto out_put;
 	}
-
+#endif
 	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err =  ubi_el_write_vid_hdr(ubi, new_pnum, vid_hdr);
+#else
 	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
+#endif
 	if (err)
 		goto write_error;

@@ -649,8 +694,11 @@

 	dbg_eba("write VID hdr and %d bytes at offset %d of LEB %d:%d, PEB %d",
 		len, offset, vol_id, lnum, pnum);
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_write_vid_hdr(ubi, pnum, vid_hdr);
+#else
 	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+#endif
 	if (err) {
 		ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
 			 vol_id, lnum, pnum);
@@ -772,7 +820,11 @@
 	dbg_eba("write VID hdr and %d bytes at LEB %d:%d, PEB %d, used_ebs %d",
 		len, vol_id, lnum, pnum, used_ebs);

+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_write_vid_hdr(ubi, pnum, vid_hdr);
+#else
 	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+#endif
 	if (err) {
 		ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
 			 vol_id, lnum, pnum);
@@ -889,7 +941,11 @@
 	dbg_eba("change LEB %d:%d, PEB %d, write VID hdr to PEB %d",
 		vol_id, lnum, vol->eba_tbl[lnum], pnum);

+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_write_vid_hdr(ubi, pnum, vid_hdr);
+#else
 	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
+#endif
 	if (err) {
 		ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
 			 vol_id, lnum, pnum);
@@ -1094,8 +1150,11 @@
 		vid_hdr->data_crc = cpu_to_be32(crc);
 	}
 	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_write_vid_hdr(ubi, to, vid_hdr);
+#else
 	err = ubi_io_write_vid_hdr(ubi, to, vid_hdr);
+#endif
 	if (err) {
 		if (err == -EIO)
 			err = MOVE_TARGET_WR_ERR;
@@ -1105,6 +1164,15 @@
 	cond_resched();

 	/* Read the VID header back and check if it was written correctly */
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_read_vid_hdr(ubi, to, vid_hdr, 1);
+	if (err != UBIL_PEB_USED) {
+		ubi_err("can not copy unused block");
+		ubi_ro_mode(ubi);
+		err = -EIO;
+		goto out_unlock_buf;
+	}
+#else
 	err = ubi_io_read_vid_hdr(ubi, to, vid_hdr, 1);
 	if (err) {
 		if (err != UBI_IO_BITFLIPS) {
@@ -1116,7 +1184,7 @@
 			err = MOVE_CANCEL_BITFLIPS;
 		goto out_unlock_buf;
 	}
-
+#endif
 	if (data_size > 0) {
 		err = ubi_io_write_data(ubi, ubi->peb_buf1, to, 0, aldata_size);
 		if (err) {
--- ubi_old/drivers/mtd/ubi/scan.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/scan.c	2010-04-09 21:54:02.645580870 +0530
@@ -51,8 +51,10 @@
 #define paranoid_check_si(ubi, si) 0
 #endif

+#ifndef CONFIG_MTD_UBI_LOGGED
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
+#endif
 static struct ubi_vid_hdr *vidh;

 /**
@@ -75,6 +77,10 @@
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
 	else if (list == &si->erase)
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	else if (list == &si->resvd)
+		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
+#endif
 	else if (list == &si->corr) {
 		dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 		si->corr_count += 1;
@@ -286,6 +292,13 @@
 		if (!vh)
 			return -ENOMEM;

+#ifdef CONFIG_MTD_UBI_LOGGED
+		/**
+		 * ubi_el_read_vid_hdr does not return any
+		 * bitflips or hardware error
+		 */
+		ubi_el_read_vid_hdr(ubi, pnum, vh, 0);
+#else
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err) {
 			if (err == UBI_IO_BITFLIPS)
@@ -299,7 +312,7 @@
 				goto out_free_vidh;
 			}
 		}
-
+#endif
 		if (!vh->copy_flag) {
 			/* It is not a copy, so it is newer */
 			dbg_bld("first PEB %d is newer, copy_flag is unset",
@@ -617,7 +630,9 @@
 		       int pnum, int ec)
 {
 	int err;
+#ifndef CONFIG_MTD_UBI_LOGGED
 	struct ubi_ec_hdr *ec_hdr;
+#endif

 	if ((long long)ec >= UBI_MAX_ERASECOUNTER) {
 		/*
@@ -628,20 +643,26 @@
 		return -EINVAL;
 	}

+#ifndef CONFIG_MTD_UBI_LOGGED
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ec_hdr)
 		return -ENOMEM;

 	ec_hdr->ec = cpu_to_be64(ec);
-
+#endif
 	err = ubi_io_sync_erase(ubi, pnum, 0);
 	if (err < 0)
 		goto out_free;
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_el_write_ec_hdr(ubi, pnum, cpu_to_be64(ec));
+#else
 	err = ubi_io_write_ec_hdr(ubi, pnum, ec_hdr);
+#endif

 out_free:
+#ifndef CONFIG_MTD_UBI_LOGGED
 	kfree(ec_hdr);
+#endif
 	return err;
 }

@@ -706,6 +727,7 @@
 	return ERR_PTR(-ENOSPC);
 }

+#ifndef CONFIG_MTD_UBI_LOGGED
 /**
  * process_eb - read, check UBI headers, and add them to scanning information.
  * @ubi: UBI device description object
@@ -883,6 +905,148 @@

 	return 0;
 }
+#else
+/**
+ * process_eb - read, check UBI headers, and add them to scanning information.
+ * @ubi: UBI device description object
+ * @si: scanning information
+ * @pnum: the physical eraseblock number
+ *
+ * This function returns a zero if the physical eraseblock was successfully
+ * handled and a negative error code in case of failure.
+ */
+static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
+		      int pnum)
+{
+	long long uninitialized_var(ec);
+	int err, bitflips = 0, vol_id, ec_corr = 0;
+
+	dbg_bld("scan PEB %d", pnum);
+
+	/* Skip bad physical eraseblocks */
+	err = ubi_io_is_bad(ubi, pnum);
+	if (err < 0)
+		return err;
+	else if (err) {
+		/*
+		 * FIXME: this is actually duty of the I/O sub-system to
+		 * initialize this, but MTD does not provide enough
+		 * information.
+		 */
+		si->bad_peb_count += 1;
+		return 0;
+	}
+
+	si->is_empty = 0;
+
+	ec = ubi_el_read_ec_hdr(ubi, pnum);
+	ec = be64_to_cpu(ec);
+	if (ec < 0 || ec > UBI_MAX_ERASECOUNTER) {
+			/*
+			 * Erase counter overflow. The EC headers have 64 bits
+			 * reserved, but we anyway make use of only 31 bit
+			 * values, as this seems to be enough for any existing
+			 * flash. Upgrade UBI and use 64-bit erase counters
+			 * internally.
+			 */
+			ubi_err("erase counter overflow, max is %d, pnum %d",
+				UBI_MAX_ERASECOUNTER, pnum);
+			return -EINVAL;
+	}
+
+	/* OK, we've done with the EC header, let's look at the VID header */
+	err = ubi_el_read_vid_hdr(ubi, pnum, vidh, 0);
+	if (err == UBIL_PEB_USED_SP) {
+		err = add_to_list(si, pnum, ec, &si->resvd);
+		if (err)
+			return err;
+		goto adjust_mean_ec;
+	} else if (paronoid_check_special(ubi, pnum)) {
+			ubi_err("special bud not special Status %d", err);
+			dump_stack();
+			BUG();
+	}
+	if (err == UBIL_PEB_BAD) {
+		si->bad_peb_count += 1;
+		return 0;
+	} else if (err == UBIL_PEB_CORR) {
+		/* VID header is corrupted */
+		err = add_to_list(si, pnum, ec, &si->corr);
+		if (err)
+			return err;
+		goto adjust_mean_ec;
+	} else if (err == UBIL_PEB_FREE) {
+		/* No VID header - the physical eraseblock is free */
+		err = add_to_list(si, pnum, ec, &si->free);
+		if (err)
+			return err;
+		goto adjust_mean_ec;
+	} else if (err == UBIL_PEB_ERASE_PENDING) {
+		err = add_to_list(si, pnum, ec, &si->erase);
+		if (err)
+			return err;
+		goto adjust_mean_ec;
+
+	} else if (err != UBIL_PEB_USED) {
+		ubi_err("unknown status of pnum %d", pnum);
+		return -EBADMSG;
+	}
+
+	vol_id = be32_to_cpu(vidh->vol_id);
+	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
+		int lnum = be32_to_cpu(vidh->lnum);
+
+		/* Unsupported internal volume */
+		switch (vidh->compat) {
+		case UBI_COMPAT_DELETE:
+			ubi_msg("\"delete\" compatible internal volume %d:%d"
+				" found, remove it", vol_id, lnum);
+			err = add_to_list(si, pnum, ec, &si->corr);
+			if (err)
+				return err;
+			break;
+
+		case UBI_COMPAT_RO:
+			ubi_msg("read-only compatible internal volume %d:%d"
+				" found, switch to read-only mode",
+				vol_id, lnum);
+			ubi->ro_mode = 1;
+			break;
+
+		case UBI_COMPAT_PRESERVE:
+			ubi_msg("\"preserve\" compatible internal volume %d:%d"
+				" found", vol_id, lnum);
+			err = add_to_list(si, pnum, ec, &si->alien);
+			if (err)
+				return err;
+			si->alien_peb_count += 1;
+			return 0;
+
+		case UBI_COMPAT_REJECT:
+			ubi_err("incompatible internal volume %d:%d found",
+				vol_id, lnum);
+			return -EINVAL;
+		}
+	}
+
+	/* Both UBI headers seem to be fine */
+	err = ubi_scan_add_used(ubi, si, pnum, ec, vidh, bitflips);
+	if (err)
+		return err;
+
+adjust_mean_ec:
+	if (!ec_corr) {
+		si->ec_sum += ec;
+		si->ec_count += 1;
+		if (ec > si->max_ec)
+			si->max_ec = ec;
+		if (ec < si->min_ec)
+			si->min_ec = ec;
+	}
+
+	return 0;
+}
+#endif

 /**
  * ubi_scan - scan an MTD device.
@@ -906,14 +1070,20 @@
 	INIT_LIST_HEAD(&si->corr);
 	INIT_LIST_HEAD(&si->free);
 	INIT_LIST_HEAD(&si->erase);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	INIT_LIST_HEAD(&si->resvd);
+#endif
+
 	INIT_LIST_HEAD(&si->alien);
 	si->volumes = RB_ROOT;
 	si->is_empty = 1;

 	err = -ENOMEM;
+#ifndef CONFIG_MTD_UBI_LOGGED
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
 		goto out_si;
+#endif

 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -973,20 +1143,35 @@
 		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
 			seb->ec = si->mean_ec;

+#ifdef CONFIG_MTD_UBI_LOGGED_DEBUG
+#ifdef CONFIG_MTD_UBI_LOGGED
+	dbg_bld("resvd blks after scan");
+	list_for_each_entry(seb, &si->resvd, u.list) {
+		dbg_bld("pnum %d", seb->pnum);
+		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
+			seb->ec = si->mean_ec;
+	}
+	dbg_bld("\n");
+#endif
+#endif
+
 	err = paranoid_check_si(ubi, si);
 	if (err)
 		goto out_vidh;

 	ubi_free_vid_hdr(ubi, vidh);
+#ifndef CONFIG_MTD_UBI_LOGGED
 	kfree(ech);
-
+#endif
 	return si;

 out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
+#ifndef CONFIG_MTD_UBI_LOGGED
 	kfree(ech);
 out_si:
+#endif
 	ubi_scan_destroy_si(si);
 	return ERR_PTR(err);
 }
@@ -1046,6 +1231,13 @@
 		list_del(&seb->u.list);
 		kfree(seb);
 	}
+#ifdef CONFIG_MTD_UBI_LOGGED
+	list_for_each_entry_safe(seb, seb_tmp, &si->resvd, u.list) {
+		list_del(&seb->u.list);
+		kfree(seb);
+	}
+#endif
+
 	list_for_each_entry_safe(seb, seb_tmp, &si->free, u.list) {
 		list_del(&seb->u.list);
 		kfree(seb);
--- ubi_old/drivers/mtd/ubi/vtbl.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/vtbl.c	2010-04-09 21:54:02.645580870 +0530
@@ -70,6 +70,29 @@
 /* Empty volume table record */
 static struct ubi_vtbl_record empty_vtbl_record;

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * ubi_vtbl_fill_sb - modify vtbl in in ram sb.
+ * @ubi: UBI device description object
+ *
+ * This function gets ubi->sb. It then modifies the vtbl buds in sb.
+ * Note: sb node must be released after calling this function.
+ */
+inline void ubi_vtbl_fill_sb(struct ubi_device *ubi)
+{
+	int copy, pnum;
+	struct ubi_volume *layout_vol;
+	struct ubi_sb *sb;
+
+	sb = ubi_sb_get_node(ubi);
+	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
+	for (copy = 0; copy < UBI_LAYOUT_VOLUME_EBS; copy++) {
+		pnum = ubi_eba_leb_to_peb(ubi, layout_vol, copy);
+		sb->vtbl_peb[copy] = cpu_to_be32(pnum);
+	}
+}
+#endif
+
 /**
  * ubi_change_vtbl_record - change volume table record.
  * @ubi: UBI device description object
@@ -110,6 +133,17 @@
 			return err;
 	}

+#ifdef CONFIG_MTD_UBI_LOGGED
+	/*
+	 * logged UBIL can find vtbl buds without scanning.
+	 * this can be used for future versions
+	 */
+	ubi_vtbl_fill_sb(ubi);
+	err = ubi_sb_sync_node(ubi);
+	ubi_sb_put_node(ubi);
+	if (err)
+		return err;
+#endif
 	paranoid_vtbl_check(ubi);
 	return 0;
 }
@@ -291,6 +325,37 @@
 	return -EINVAL;
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * ubi_vtbl_create_dflt_image - create default image of volume table.
+ * @ubi: UBI device description object
+ * @copy: number of the volume table copy
+ * @pnum: where vtbl copy is to be written
+ *
+ * This function creates default image of vtbl on given peb.present
+ * implementation of UBI requires default volume to be created when
+ * flash is ubinized.
+ */
+int ubi_vtbl_create_dflt_image(struct ubi_device *ubi, int copy, int pnum)
+{
+	int err, tries = 0;
+	ubi_msg("create volume table (copy #%d)", copy + 1);
+retry:
+	/* Write the layout volume contents */
+	err = ubi_io_write_data(ubi, ubi->vtbl, pnum, 0, ubi->vtbl_size);
+	if (err)
+		goto write_error;
+
+	ubi->sb_node->vtbl_peb[copy] = cpu_to_be32(pnum);
+	return err;
+
+write_error:
+	if (err == -EIO && ++tries <= 5)
+		goto retry;
+	return err;
+}
+#endif
+
 /**
  * create_vtbl - create a copy of volume table.
  * @ubi: UBI device description object
@@ -339,11 +404,17 @@
 	vid_hdr->lnum = cpu_to_be32(copy);
 	vid_hdr->sqnum = cpu_to_be64(++si->max_sqnum);

+#ifdef CONFIG_MTD_UBI_LOGGED
+	/* The EC header is already there, write the VID header */
+	err = ubi_el_write_vid_hdr(ubi, new_seb->pnum, vid_hdr);
+	if (err)
+		goto write_error;
+#else
 	/* The EC header is already there, write the VID header */
 	err = ubi_io_write_vid_hdr(ubi, new_seb->pnum, vid_hdr);
 	if (err)
 		goto write_error;
-
+#endif
 	/* Write the layout volume contents */
 	err = ubi_io_write_data(ubi, vtbl, new_seb->pnum, 0, ubi->vtbl_size);
 	if (err)
@@ -501,6 +572,31 @@
 	return ERR_PTR(err);
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * empty_lvol - create empty layout volume.
+ * @ubi: UBI device description object
+ *
+ * This function returns empty volume table contents in case of success and a
+ * negative error code in case of failure.
+ */
+static struct ubi_vtbl_record *empty_lvol(struct ubi_device *ubi)
+{
+	int i;
+	struct ubi_vtbl_record *vtbl;
+
+	vtbl = vmalloc(ubi->vtbl_size);
+	if (!vtbl)
+		return ERR_PTR(-ENOMEM);
+	memset(vtbl, 0, ubi->vtbl_size);
+
+	for (i = 0; i < ubi->vtbl_slots; i++)
+		memcpy(&vtbl[i], &empty_vtbl_record, UBI_VTBL_RECORD_SIZE);
+
+	return vtbl;
+}
+#endif
+
 /**
  * create_empty_lvol - create empty layout volume.
  * @ubi: UBI device description object
@@ -778,6 +874,36 @@
 	return 0;
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+/**
+ * ubi_vtbl_create_dflt_volume_table - read the volume table.
+ * @ubi: UBI device description object
+ *
+ * This function creates default/empty volume table in ubi->vtbl.
+ * Returns 0 for success error code otherwise.
+ */
+int ubi_vtbl_create_dflt_volume_table(struct ubi_device *ubi)
+{
+	empty_vtbl_record.crc = cpu_to_be32(0xf116c36b);
+
+	/*
+	 * The number of supported volumes is limited by the eraseblock size
+	 * and by the UBI_MAX_VOLUMES constant.
+	 */
+	ubi->vtbl_slots = ubi->leb_size / UBI_VTBL_RECORD_SIZE;
+	if (ubi->vtbl_slots > UBI_MAX_VOLUMES)
+		ubi->vtbl_slots = UBI_MAX_VOLUMES;
+
+	ubi->vtbl_size = ubi->vtbl_slots * UBI_VTBL_RECORD_SIZE;
+	ubi->vtbl_size = ALIGN(ubi->vtbl_size, ubi->min_io_size);
+
+	ubi->vtbl = empty_lvol(ubi);
+	if (IS_ERR(ubi->vtbl))
+			return PTR_ERR(ubi->vtbl);
+	return 0;
+}
+#endif
+
 /**
  * ubi_read_volume_table - read the volume table.
  * @ubi: UBI device description object
--- ubi_old/drivers/mtd/ubi/wl.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/wl.c	2010-04-09 21:54:02.645580870 +0530
@@ -390,7 +390,10 @@
 	struct ubi_wl_entry *e, *first, *last;

 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
-		   dtype == UBI_UNKNOWN);
+#ifdef CONFIG_MTD_UBI_LOGGED
+			dtype == UBIL_RESVD ||
+#endif
+			dtype == UBI_UNKNOWN);

 retry:
 	spin_lock(&ubi->wl_lock);
@@ -438,6 +441,9 @@
 			e = find_wl_entry(&ubi->free, medium_ec);
 		}
 		break;
+#ifdef CONFIG_MTD_UBI_LOGGED
+	case UBIL_RESVD:
+#endif
 	case UBI_SHORTTERM:
 		/*
 		 * For short term data we pick a physical eraseblock with the
@@ -457,7 +463,15 @@
 	 */
 	rb_erase(&e->u.rb, &ubi->free);
 	dbg_wl("PEB %d EC %d", e->pnum, e->ec);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	/* Do not add reserved block to prot tree. */
+	if (dtype == UBIL_RESVD)
+		wl_tree_add(e, &ubi->resvd);
+	else
+		prot_queue_add(ubi, e);
+#else
 	prot_queue_add(ubi, e);
+#endif
 	spin_unlock(&ubi->wl_lock);

 	err = ubi_dbg_check_all_ff(ubi, e->pnum, ubi->vid_hdr_aloffset,
@@ -507,7 +521,9 @@
 		      int torture)
 {
 	int err;
+#ifndef CONFIG_MTD_UBI_LOGGED
 	struct ubi_ec_hdr *ec_hdr;
+#endif
 	unsigned long long ec = e->ec;

 	dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
@@ -515,10 +531,12 @@
 	err = paranoid_check_ec(ubi, e->pnum, e->ec);
 	if (err)
 		return -EINVAL;
-
+#ifndef CONFIG_MTD_UBI_LOGGED
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
 	if (!ec_hdr)
 		return -ENOMEM;
+#endif
+

 	err = ubi_io_sync_erase(ubi, e->pnum, torture);
 	if (err < 0)
@@ -538,9 +556,16 @@

 	dbg_wl("erased PEB %d, new EC %llu", e->pnum, ec);

+#ifdef CONFIG_MTD_UBI_LOGGED
+	if (ubi->c_status == C_STARTED)
+		err = ubi_el_write_ec_hdr(ubi, e->pnum, cpu_to_be64(ec));
+	else
+		err = ubi_el_write_ec_hdr_no_sync(ubi, e->pnum,
+							 cpu_to_be64(ec));
+#else
 	ec_hdr->ec = cpu_to_be64(ec);
-
 	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
+#endif
 	if (err)
 		goto out_free;

@@ -551,7 +576,9 @@
 	spin_unlock(&ubi->wl_lock);

 out_free:
+#ifndef CONFIG_MTD_UBI_LOGGED
 	kfree(ec_hdr);
+#endif
 	return err;
 }

@@ -646,6 +673,11 @@
 	wl_wrk->e = e;
 	wl_wrk->torture = torture;

+#ifdef CONFIG_MTD_UBI_LOGGED
+	/* mark the peb as pending. This may get synced when grp is written. */
+	ubi_el_mark_pending(ubi, e->pnum);
+#endif
+
 	schedule_ubi_work(ubi, wl_wrk);
 	return 0;
 }
@@ -743,6 +775,8 @@
 	 * which is being moved was unmapped.
 	 */

+#ifndef CONFIG_MTD_UBI_LOGGED
+
 	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
 	if (err && err != UBI_IO_BITFLIPS) {
 		if (err == UBI_IO_PEB_FREE) {
@@ -765,6 +799,31 @@
 			err, e1->pnum);
 		goto out_error;
 	}
+#else
+	err = ubi_el_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
+	if (err != UBIL_PEB_USED) {
+		if (err == UBIL_PEB_FREE) {
+			/*
+			 * We are trying to move PEB without a VID header. UBI
+			 * always write VID headers shortly after the PEB was
+			 * given, so we have a situation when it has not yet
+			 * had a chance to write it, because it was preempted.
+			 * So add this PEB to the protection queue so far,
+			 * because presumably more data will be written there
+			 * (including the missing VID header), and then we'll
+			 * move it.
+			 */
+			dbg_wl("PEB %d has no VID header", e1->pnum);
+			protect = 1;
+			goto out_not_moved;
+		}
+
+		ubi_err("error %d while reading VID header from PEB %d",
+				err, e1->pnum);
+			goto out_error;
+	}
+#endif
+

 	vol_id = be32_to_cpu(vid_hdr->vol_id);
 	lnum = be32_to_cpu(vid_hdr->lnum);
@@ -1161,7 +1220,14 @@
 		if (in_wl_tree(e, &ubi->used)) {
 			paranoid_check_in_wl_tree(e, &ubi->used);
 			rb_erase(&e->u.rb, &ubi->used);
-		} else if (in_wl_tree(e, &ubi->scrub)) {
+		}
+#ifdef CONFIG_MTD_UBI_LOGGED
+		else if (in_wl_tree(e, &ubi->resvd)) {
+			paranoid_check_in_wl_tree(e, &ubi->resvd);
+			rb_erase(&e->u.rb, &ubi->resvd);
+		}
+#endif
+		else if (in_wl_tree(e, &ubi->scrub)) {
 			paranoid_check_in_wl_tree(e, &ubi->scrub);
 			rb_erase(&e->u.rb, &ubi->scrub);
 		} else if (in_wl_tree(e, &ubi->erroneous)) {
@@ -1186,6 +1252,10 @@
 	err = schedule_erase(ubi, e, torture);
 	if (err) {
 		spin_lock(&ubi->wl_lock);
+		/**
+		 *  FIXME:
+		 * peb is moving from any tree to used tree on failure
+		 */
 		wl_tree_add(e, &ubi->used);
 		spin_unlock(&ubi->wl_lock);
 	}
@@ -1420,6 +1490,10 @@
 	struct ubi_wl_entry *e;

 	ubi->used = ubi->erroneous = ubi->free = ubi->scrub = RB_ROOT;
+#ifdef CONFIG_MTD_UBI_LOGGED
+	ubi->resvd = RB_ROOT;
+#endif
+
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
@@ -1467,6 +1541,22 @@
 		ubi->lookuptbl[e->pnum] = e;
 	}

+#ifdef CONFIG_MTD_UBI_LOGGED
+	list_for_each_entry(seb, &si->resvd, u.list) {
+		cond_resched();
+
+		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
+		if (!e)
+			goto out_free;
+
+		e->pnum = seb->pnum;
+		e->ec = seb->ec;
+		ubi_assert(e->ec >= 0);
+		wl_tree_add(e, &ubi->resvd);
+		ubi->lookuptbl[e->pnum] = e;
+	}
+#endif
+
 	list_for_each_entry(seb, &si->corr, u.list) {
 		cond_resched();

@@ -1525,6 +1615,10 @@
 	cancel_pending(ubi);
 	tree_destroy(&ubi->used);
 	tree_destroy(&ubi->free);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	tree_destroy(&ubi->resvd);
+#endif
+
 	tree_destroy(&ubi->scrub);
 	kfree(ubi->lookuptbl);
 	return err;
@@ -1558,6 +1652,10 @@
 	protection_queue_destroy(ubi);
 	tree_destroy(&ubi->used);
 	tree_destroy(&ubi->erroneous);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	tree_destroy(&ubi->resvd);
+#endif
+
 	tree_destroy(&ubi->free);
 	tree_destroy(&ubi->scrub);
 	kfree(ubi->lookuptbl);
--- ubi_old/drivers/mtd/ubi/cdev.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/cdev.c	2010-04-09 21:54:02.655580865 +0530
@@ -1007,7 +1007,11 @@
 		 * 'ubi_attach_mtd_dev()'.
 		 */
 		mutex_lock(&ubi_devices_mutex);
+#ifdef CONFIG_MTD_UBI_LOGGED
+		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.ubinize);
+#else
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset);
+#endif
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
--- ubi_old/drivers/mtd/ubi/build.c	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/build.c	2010-04-09 21:54:02.645580870 +0530
@@ -57,6 +57,9 @@
  */
 struct mtd_dev_param {
 	char name[MTD_PARAM_LEN_MAX];
+#ifdef CONFIG_MTD_UBI_LOGGED
+	int ubinize;
+#endif
 	int vid_hdr_offs;
 };

@@ -644,9 +647,10 @@
 		return -EINVAL;
 	}

+#ifndef CONFIG_MTD_UBI_LOGGED
 	if (ubi->vid_hdr_offset < 0)
 		return -EINVAL;
-
+#endif
 	/*
 	 * Note, in this implementation we support MTD devices with 0x7FFFFFFF
 	 * physical eraseblocks maximum.
@@ -682,12 +686,18 @@
 	ubi_assert(ubi->hdrs_min_io_size <= ubi->min_io_size);
 	ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size == 0);

+#ifndef CONFIG_MTD_UBI_LOGGED
 	/* Calculate default aligned sizes of EC and VID headers */
 	ubi->ec_hdr_alsize = ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
 	ubi->vid_hdr_alsize = ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
-
+#endif
 	dbg_msg("min_io_size      %d", ubi->min_io_size);
 	dbg_msg("hdrs_min_io_size %d", ubi->hdrs_min_io_size);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	ubi->leb_start = 0;
+	dbg_msg("peb_info size    %d", sizeof(struct peb_info));
+	dbg_msg("leb_start        %d", ubi->leb_start);
+#else
 	dbg_msg("ec_hdr_alsize    %d", ubi->ec_hdr_alsize);
 	dbg_msg("vid_hdr_alsize   %d", ubi->vid_hdr_alsize);

@@ -727,7 +737,7 @@
 			ubi->vid_hdr_offset, ubi->leb_start);
 		return -EINVAL;
 	}
-
+#endif
 	/*
 	 * Set maximum amount of physical erroneous eraseblocks to be 10%.
 	 * Erroneous PEB are those which have read errors.
@@ -742,11 +752,13 @@
 	 * I/O unit. In this case we can only accept this UBI image in
 	 * read-only mode.
 	 */
+#ifndef CONFIG_MTD_UBI_LOGGED
 	if (ubi->vid_hdr_offset + UBI_VID_HDR_SIZE <= ubi->hdrs_min_io_size) {
 		ubi_warn("EC and VID headers are in the same minimal I/O unit, "
 			 "switch to read-only mode");
 		ubi->ro_mode = 1;
 	}
+#endif

 	ubi->leb_size = ubi->peb_size - ubi->leb_start;

@@ -763,9 +775,11 @@
 	if (ubi->hdrs_min_io_size != ubi->min_io_size)
 		ubi_msg("sub-page size:              %d",
 			ubi->hdrs_min_io_size);
+#ifndef CONFIG_MTD_UBI_LOGGED
 	ubi_msg("VID header offset:          %d (aligned %d)",
 		ubi->vid_hdr_offset, ubi->vid_hdr_aloffset);
 	ubi_msg("data offset:                %d", ubi->leb_start);
+#endif

 	/*
 	 * Note, ideally, we have to initialize ubi->bad_peb_count here. But
@@ -778,12 +792,487 @@
 	return 0;
 }

+#ifdef CONFIG_MTD_UBI_LOGGED
+
+/**
+ * ubi_lookup_init- init the lookup buffer for cmt
+ * @ubi: ubi descriptor
+ *
+ * this function initializes the lookup buffer
+ * @returns 0 for success error code otherwise.
+ */
+
+static inline int ubi_lookup_init(struct ubi_device *ubi, int ubinize)
+{
+	int size, pnum;
+	/* allocate the array with one entry for each peb */
+	size = sizeof(struct peb_info) * ubi->peb_count;
+	ubi->peb_lookup = (struct peb_info *)vmalloc(size);
+	if (!ubi->peb_lookup) {
+		ubi_err("out of memory allocating %d bytes to eba array", size);
+		return -ENOMEM;
+	}
+	memset(ubi->peb_lookup, 0xFFFF, size);
+	if (!ubinize)
+		return 0;
+
+	/**
+	 * create default eba map. this will help in one time cmt instead of
+	 * logging in ubinize instance
+	 */
+	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
+		ubi->peb_lookup[pnum].status = UBIL_PEB_FREE;
+		ubi->peb_lookup[pnum].ec     = cpu_to_be64(UBIL_EC_START);
+	}
+
+	return 0;
+}
+
+/**
+ * ubi_lookup_close- close the lookup buffer
+ * @ubi: ubi descriptor
+ *
+ * This function frees the lookup buffer for ubil
+ */
+static inline void ubi_lookup_close(struct ubi_device *ubi)
+{
+	vfree(ubi->peb_lookup);
+}
+
+
+/**
+ * ubil_init- init ubi-logging subsystems.
+ * @ubi: ubi descriptor
+ *
+ * this function initializes sb,el,cmt.
+ * @returns 0 for success error code otherwise.
+ */
+static int ubil_init(struct ubi_device *ubi, int ubinize)
+{
+	int err, sub_page_size = 0;
+
+	/* calculate eba el space requirements*/
+	sub_page_size = ubi->hdrs_min_io_size;
+
+	if (sub_page_size < UBIL_MIN_SUB_PAGE_SIZE)
+		sub_page_size = UBIL_MIN_SUB_PAGE_SIZE;
+
+	/* the size of each node entry */
+	ubi->node_size = sub_page_size;
+
+	/* in each bud, nodes start after bud hdr */
+	ubi->bud_start_offset  = sub_page_size;
+
+	/* one entry is reserved for bud hdr */
+	ubi->bud_usable_len = ubi->peb_size - ubi->node_size;
+
+	/* el */
+	ubi->el_pebs_in_grp	= (sub_page_size - UBIL_EL_NODE_HDR_SIZE)
+					/ UBIL_EL_REC_SIZE;
+	ubi->el_no_of_grps	= DIV_ROUND_UP(ubi->peb_count,
+						ubi->el_pebs_in_grp);
+	ubi->el_reservd_buds	= DIV_ROUND_UP((ubi->el_no_of_grps *
+						sub_page_size), ubi->peb_size);
+
+	/*cmt*/
+	ubi->c_max_data_size	= ubi->peb_size - sub_page_size;
+	ubi->c_reservd_buds	= DIV_ROUND_UP(
+					(ubi->peb_count * UBIL_EL_REC_SIZE) ,
+					ubi->c_max_data_size);
+	/* set schdeule_cmt as false. */
+	ubi->schedule_cmt	= 0;
+
+
+	err = ubi_sb_init(ubi);
+	if (err)
+		return err;
+
+	err = ubi_el_init(ubi);
+	if (err)
+		goto out_unlock_sb;
+
+	err = ubi_cmt_init(ubi);
+	if (err)
+		goto out_unlock_el;
+
+	err = ubi_lookup_init(ubi, ubinize);
+	if (err)
+		goto out_unlock_cmt;
+
+	ubi_msg("default node Size:		 %d bytes", ubi->node_size);
+	ubi_msg("el record Size Per Pnum:	 %d bytes", UBIL_EL_REC_SIZE);
+	ubi_msg("el pebs in one group:	 %d ", ubi->el_pebs_in_grp);
+	ubi_msg("el group size:		 %d bytes", ubi->el_pebs_in_grp
+				 * UBIL_EL_REC_SIZE + UBIL_EL_NODE_HDR_SIZE);
+	ubi_msg("el number of groups:	 %d bytes", ubi->el_no_of_grps);
+	ubi_msg("el number of buds:		 %d", ubi->el_reservd_buds);
+	dbg_bld("cmt no of reserved buds:	%d ", ubi->c_reservd_buds);
+	dbg_bld("el no of reserved PEB:		%d ", ubi->el_reservd_buds);
+
+	return 0;
+
+out_unlock_cmt:
+	ubi_cmt_close(ubi);
+out_unlock_el:
+	ubi_el_close(ubi);
+out_unlock_sb:
+	ubi_sb_close(ubi);
+	return err;
+
+}
+/**
+ * ubil_close- close sb,el,cmt
+ * @ubi: ubi description
+ *
+ * This function closes sb,el,cmt.Then it frees lookup buffer
+ */
+static void ubil_close(struct ubi_device *ubi)
+{
+	ubi_el_close(ubi);
+
+	ubi_cmt_close(ubi);
+
+	ubi_sb_close(ubi);
+
+	ubi_lookup_close(ubi);
+
+}
+
+/**
+ *  ubil_create_dflt- writes sb,el,cmt,vtbl image to flash.
+ *  @ubi: ubi descriptor.
+ *
+ *  This function writes:
+ *	sb- 1st and last peb
+ *	cmt- next to 1st peb
+ *	el- next to cmt.
+ *	vtbl- next to el.
+ *	 ---------------------------------------------------------------
+ *	| sb hdr|cmt hdr|cmt hdr|el hdr	|vid hdr|vid hdr|	| sb hdr|
+ *	|-------|-------|-------|-------|-------|-------|	|-------|
+ *	|	|	|	|	|	|	|data...|	|
+ *	|  sb	|  cmt	|  cmt	|  el	|  vtbl	|  vtbl	|	|  sb	|
+ *	|	|	|	|	|	|	|	|	|
+ *	 ---------------------------------------------------------------
+ *  @returns 0 on success, error code otherwise.
+ */
+static inline int ubi_create_dflts(struct ubi_device *ubi)
+{
+	int el_bud = 0, vtbl_bud = 0, cmt_bud = 0;
+	int pnum, err = 0, copy, index;
+
+	struct ubi_vid_hdr *vid_hdr;
+
+	/* find last good erase block and create sb image.*/
+	pnum = ubi->peb_count - 1;
+	while (pnum > 0) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum--;
+			continue;
+		}
+
+		err =	ubi_io_sync_erase(ubi, pnum, 0);
+		if (err < 0) {
+			ubi_warn("could not erase block %d", pnum);
+			/* marking it bad as sb shoud be first 2 good blks */
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			err = ubi_io_mark_bad(ubi, pnum);
+			if (err)
+				return err;
+			pnum--;
+			continue;
+		}
+		/* this is last good block, create super block in it */
+		err = ubi_sb_create_dflt(ubi, 1, pnum);
+		if (err) {
+			ubi_err("writing sb image on last peb faild");
+			goto out_unlock;
+		}
+
+		/*mark peb as used special peb */
+		ubi->peb_lookup[pnum].status = UBIL_PEB_USED_SP;
+		pnum--;
+		break;
+	}
+
+	/* find first good erase block and create sb image on it.*/
+	pnum = 0;
+	while (pnum < ubi->peb_count) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum++;
+			continue;
+		}
+
+		err =	ubi_io_sync_erase(ubi, pnum, 0);
+		if (err < 0) {
+			ubi_warn("could not erase block %d", pnum);
+			/* Marking it bad as sb shoud be first 2 good blks */
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			err = ubi_io_mark_bad(ubi, pnum);
+			if (err)
+				return err;
+			pnum++;
+			continue;
+		}
+		/* this is first good block, create super block in it */
+		err = ubi_sb_create_dflt(ubi, 0, pnum);
+		if (err) {
+			ubi_err("writing sb image on first peb faild");
+			goto out_unlock;
+		}
+		ubi->peb_lookup[pnum].status = UBIL_PEB_USED_SP;
+		pnum++;
+		break;
+	}
+
+	/* create cmt image next to sb */
+	for (copy = 0; copy < UBIL_CMT_COPIES; copy++) {
+		dbg_bld("allocating peb for commit copy %d", copy);
+		cmt_bud = 0 ;
+		while (cmt_bud < ubi->c_reservd_buds
+				&& pnum < ubi->peb_count) {
+			if (ubi_io_is_bad(ubi, pnum)) {
+				ubi_warn("bad block at %d", pnum);
+				ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+				pnum++;
+				continue;
+			}
+
+			err = ubi_io_sync_erase(ubi, pnum, 0);
+			if (err < 0) {
+				ubi_warn("could not erase block %d", pnum);
+				ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+				err = ubi_io_mark_bad(ubi, pnum);
+				if (err)
+					return err;
+				pnum++;
+				continue;
+			}
+			index = copy * ubi->c_reservd_buds + cmt_bud;
+			ubi->c_buds[index] = pnum;
+			dbg_bld("copy %d  commit PEB = %d ", copy, pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_USED_SP;
+			cmt_bud++;
+			pnum++;
+		}
+	}
+
+
+
+	/* create el image next to cmt */
+	while (el_bud < ubi->el_reservd_buds && pnum < ubi->peb_count) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum++;
+			continue;
+		}
+
+		err = ubi_io_sync_erase(ubi, pnum, 0);
+		if (err < 0) {
+			ubi_warn("could not erase block %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_CORR;
+			err = ubi_io_mark_bad(ubi, pnum);
+			if (err)
+				return err;
+			pnum++;
+			continue;
+		}
+
+		err = ubi_el_create_dflt(ubi, el_bud, pnum);
+		if (err) {
+			ubi_err("writing el image failed on pnum %d", pnum);
+			goto out_unlock;
+		}
+
+		ubi->el_buds[el_bud]		= pnum;
+		ubi->peb_lookup[pnum].status	= UBIL_PEB_USED_SP;
+		ubi->sb_node->buds[el_bud]	= cpu_to_be32(pnum);
+		/* RR This assignment can be taken out of loop */
+		ubi->sb_node->el_resrvd_buds = cpu_to_be32(el_bud + 1);
+		dbg_bld("allocating PEB for el %d", pnum);
+		pnum++;
+		el_bud++;
+	}
+
+
+	/* create default volume table */
+	err = ubi_vtbl_create_dflt_volume_table(ubi);
+	if (err)
+		goto out_unlock;
+
+
+	/* create default vtbl image*/
+	while (vtbl_bud < UBI_LAYOUT_VOLUME_EBS && pnum < ubi->peb_count) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum++;
+			continue;
+		}
+
+		err =	ubi_io_sync_erase(ubi, pnum, 0);
+		if (err < 0) {
+			ubi_warn("could not erase block %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum++;
+			continue;
+		}
+
+		dbg_bld("creating default vtbl on %d", pnum);
+		err = ubi_vtbl_create_dflt_image(ubi, vtbl_bud, pnum);
+		if (err)
+			goto out_unlock;
+
+
+		/* write default vid hdr for vtbl */
+		vid_hdr			= &ubi->peb_lookup[pnum].v;
+		vid_hdr->vol_type	= UBI_VID_DYNAMIC;
+		vid_hdr->vol_id		= cpu_to_be32(UBI_LAYOUT_VOLUME_ID);
+		vid_hdr->compat		= UBI_LAYOUT_VOLUME_COMPAT;
+		vid_hdr->copy_flag	= cpu_to_be32(0);
+		vid_hdr->data_size	= vid_hdr->used_ebs =
+				vid_hdr->data_pad	= cpu_to_be32(0);
+		vid_hdr->data_crc	= cpu_to_be32(0);
+		vid_hdr->lnum		= cpu_to_be32(vtbl_bud);
+		vid_hdr->sqnum		= cpu_to_be64((long long)UBIL_EC_START);
+		ubi->peb_lookup[pnum].status = UBIL_PEB_USED;
+		vtbl_bud++;
+		pnum++;
+	}
+
+	/*erase all remaining pebs */
+	while (pnum < ubi->peb_count - 1) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_BAD;
+			pnum++;
+			continue;
+		}
+
+		err =	ubi_io_sync_erase(ubi, pnum, 0);
+		if (err < 0) {
+			ubi_warn("could not erase block %d", pnum);
+			ubi->peb_lookup[pnum].status = UBIL_PEB_CORR;
+			pnum++;
+			continue;
+		}
+		ubi->peb_lookup[pnum].status = UBIL_PEB_FREE;
+		pnum++;
+	}
+	err = 0;
+
+out_unlock:
+	vfree(ubi->vtbl);
+	return err;
+}
+
+/**
+ *  ubil_ubinize- ubinize the mtd partition.
+ *  @ubi: ubi descriptor.
+ *
+ *  this function ubinizes flash.
+ *  @return 0 on success failure otherwise.
+ */
+static int ubil_ubinize(struct ubi_device *ubi)
+{
+	int err = 0;
+
+	err =  ubi_create_dflts(ubi);
+	if (err) {
+		ubi_err("writing dflt flash image failed");
+		return err;
+	}
+
+	/* Write cmt log to flash */
+	err = ubi_cmt_ubinize_write(ubi);
+	if (err) {
+		ubi_err("first commit failed!");
+		return err;
+	}
+
+	err = ubi_sb_sync_node(ubi);
+	if (err)
+		ubi_err("writing to sb failed");
+	return err;
+}
+
+/**
+ * ubil_scan_init:
+ * @ubi- ubi descriptor
+ *
+ * this function  reads cmt,applies el and intialize ubil subsystem.
+ * @returns 0 on success, failure otherwise.
+ * Note: for bad cmts in last ubi instance, ubil will need to mark those
+ * pebs as erase pending. Hence the pebs will be recoverd.
+ */
+static int ubil_scan_init(struct ubi_device *ubi)
+{
+		int err = 0;
+
+		err = ubi_get_sb(ubi);
+		if (err) {
+			ubi_err("could not get sb");
+			return err;
+		}
+
+		err = ubi_cmt_sb_init(ubi);
+		if (err) {
+			ubi_err("commit initialization failed");
+			return err;
+		}
+
+		err = ubi_cmt_read(ubi);
+		if (err) {
+			ubi_err("commit read failed");
+			return err;
+		}
+
+		err = paronoid_check_reservd_status(ubi);
+		if (err) {
+			ubi_err("reservd status incorrect");
+			return err;
+		}
+
+		err = ubi_el_scan(ubi);
+		if (err) {
+			ubi_err("error %d  while scanning el", err);
+			return err;
+		}
+
+		err = paronoid_check_reservd_status(ubi);
+		if (err) {
+			ubi_err("reservd status incorrect after el scan");
+			return err;
+		}
+
+		if (ubi->c_previous_status == UBIL_CMT_INVALID) {
+			dbg_bld("previous commit is invalid");
+			/* mark cmt as dirty since previous cmt was fail*/
+			ubi->c_dirty = C_DIRTY;
+			err = ubi_cmt_put_resvd_peb(ubi);
+			if (err) {
+				ubi_err("putting next PEBs failed ");
+				return err;
+			}
+		} else {
+			dbg_bld("previous commit is valid");
+		}
+
+		return err;
+}
+#endif
+
 /**
  * autoresize - re-size the volume which has the "auto-resize" flag set.
  * @ubi: UBI device description object
  * @vol_id: ID of the volume to re-size
  *
- * This function re-sizes the volume marked by the @UBI_VTBL_AUTORESIZE_FLG in
+ * This function re-sizes the volume marked by the @UBIL_VTBL_AUTORESIZE_FLG in
  * the volume table to the largest possible size. See comments in ubi-header.h
  * for more description of the flag. Returns zero in case of success and a
  * negative error code in case of failure.
@@ -873,7 +1362,11 @@
  * Note, the invocations of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
+#ifdef CONFIG_MTD_UBI_LOGGED
+int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int ubinize)
+#else
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
+#endif
 {
 	struct ubi_device *ubi;
 	int i, err, ref = 0;
@@ -934,7 +1427,9 @@

 	ubi->mtd = mtd;
 	ubi->ubi_num = ubi_num;
+#ifndef CONFIG_MTD_UBI_LOGGED
 	ubi->vid_hdr_offset = vid_hdr_offset;
+#endif
 	ubi->autoresize_vol_id = -1;

 	mutex_init(&ubi->buf_mutex);
@@ -957,17 +1452,48 @@
 	if (!ubi->peb_buf2)
 		goto out_free;

+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubil_init(ubi, ubinize);
+	if (err) {
+		ubi_err("ubil allocation failed");
+		goto out_free;
+	}
+
+	if (ubinize) {
+		ubi_msg("ubinizing mtd partition");
+		/* ubinize flash and use it */
+		err = ubil_ubinize(ubi);
+		if (err)
+			goto out_free_ubil;
+		ubi_msg("ubinize done successfully!");
+	} else {
+		err = ubil_scan_init(ubi);
+		if (err)
+			goto out_free_ubil;
+	}
+
+#endif
+
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
 	mutex_init(&ubi->dbg_buf_mutex);
 	ubi->dbg_peb_buf = vmalloc(ubi->peb_size);
 	if (!ubi->dbg_peb_buf)
+#ifndef CONFIG_MTD_UBI_LOGGED
 		goto out_free;
+#else
+		goto out_free_ubil;
+#endif
 #endif

 	err = attach_by_scanning(ubi);
 	if (err) {
 		dbg_err("failed to attach by scanning, error %d", err);
+#ifndef CONFIG_MTD_UBI_LOGGED
 		goto out_free;
+#else
+		goto out_free_ubil;
+#endif
+
 	}

 	if (ubi->autoresize_vol_id != -1) {
@@ -1022,6 +1548,15 @@

 	ubi_devices[ubi_num] = ubi;
 	ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	err = ubi_ensure_cmt(ubi);
+	if (err) {
+		ubi_err("recovering commit failed");
+		ubi_ro_mode(ubi);
+		goto out_uif;
+	}
+#endif
+
 	return ubi_num;

 out_uif:
@@ -1030,6 +1565,10 @@
 	ubi_wl_close(ubi);
 	free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
+#ifdef CONFIG_MTD_UBI_LOGGED
+out_free_ubil:
+	ubil_close(ubi);
+#endif
 out_free:
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
@@ -1040,7 +1579,11 @@
 		put_device(&ubi->dev);
 	else
 		kfree(ubi);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	return err > 0 ? -err : err;
+#else
 	return err;
+#endif
 }

 /**
@@ -1101,9 +1644,23 @@
 	get_device(&ubi->dev);

 	uif_close(ubi);
+#ifdef CONFIG_MTD_UBI_LOGGED
+	/* Unmount time is el is dirty, call cmt
+	 * If no modifications are done, dont cmt
+	 */
+	/* This check is added whiel solving -74 bug error */
+	if (ubi->c_dirty == C_DIRTY)
+		ubi_cmt(ubi);
+	ubi_wl_close(ubi);
+#else
 	ubi_wl_close(ubi);
+#endif
 	free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
+
+#ifdef CONFIG_MTD_UBI_LOGGED
+	ubil_close(ubi);
+#endif
 	put_mtd_device(ubi->mtd);
 	vfree(ubi->peb_buf1);
 	vfree(ubi->peb_buf2);
@@ -1236,8 +1793,13 @@
 		}

 		mutex_lock(&ubi_devices_mutex);
+#ifdef CONFIG_MTD_UBI_LOGGED
+		err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO,
+					 p->ubinize);
+#else
 		err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO,
 					 p->vid_hdr_offs);
+#endif
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			put_mtd_device(mtd);
@@ -1285,6 +1847,7 @@
 }
 module_exit(ubi_exit);

+#ifndef CONFIG_MTD_UBI_LOGGED
 /**
  * bytes_str_to_int - convert a number of bytes string into an integer.
  * @str: the string to convert
@@ -1323,6 +1886,7 @@

 	return result;
 }
+#endif

 /**
  * ubi_mtd_param_parse - parse the 'mtd=' UBI parameter.
@@ -1339,6 +1903,9 @@
 	char buf[MTD_PARAM_LEN_MAX];
 	char *pbuf = &buf[0];
 	char *tokens[2] = {NULL, NULL};
+#ifdef CONFIG_MTD_UBI_LOGGED
+	char ubinize_str[8] = "ubinize";
+#endif

 	if (!val)
 		return -EINVAL;
@@ -1379,18 +1946,38 @@

 	p = &mtd_dev_param[mtd_devs];
 	strcpy(&p->name[0], tokens[0]);
-
+#ifdef CONFIG_MTD_UBI_LOGGED
+	p->ubinize = 0;
+	if (tokens[1]) {
+		if (strcmp(tokens[1], ubinize_str) == 0) {
+			p->ubinize = 1;
+		} else {
+			ubi_err("invalid parameters");
+			return -1;
+		}
+	}
+#else
 	if (tokens[1])
 		p->vid_hdr_offs = bytes_str_to_int(tokens[1]);

 	if (p->vid_hdr_offs < 0)
 		return p->vid_hdr_offs;
-
+#endif
 	mtd_devs += 1;
 	return 0;
 }

 module_param_call(mtd, ubi_mtd_param_parse, NULL, NULL, 000);
+#ifdef CONFIG_MTD_UBI_LOGGED
+MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
+		      "mtd=<name|num>[,ubinize].\n"
+		      "Multiple \"mtd\" parameters may be specified.\n"
+		      "MTD devices may be specified by their number or name.\n"
+		      "Optional \"ubinize\" parameter specifies - ubinize mtd\n"
+		      "Example: mtd=content,ubinize mtd=4 - attach MTD device"
+		      "with name \"content\" and MTD device number 4, partition"
+			"to be ubinized");
+#else
 MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
 		      "mtd=<name|num|path>[,<vid_hdr_offs>].\n"
 		      "Multiple \"mtd\" parameters may be specified.\n"
@@ -1403,7 +1990,7 @@
 		      "Example 2: mtd=content,1984 mtd=4 - attach MTD device "
 		      "with name \"content\" using VID header offset 1984, and "
 		      "MTD device number 4 with default VID header offset.");
-
+#endif
 MODULE_VERSION(__stringify(UBI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
 MODULE_AUTHOR("Artem Bityutskiy");
