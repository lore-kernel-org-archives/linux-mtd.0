Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F7j-0005DE-JP
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:05 +0000
Received: by mail-pv0-f177.google.com with SMTP id 30so2685072pvc.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:36:03 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:03 +0530
Message-ID: <k2p6b5362aa1004120136z63438118i56547305b28c3f70@mail.gmail.com>
Subject: PATCH 2/7] ubi: logging feature for ubi
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

Note: super block for logging feature

Signed-off-by: brijesh singh <brij.singh@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/sb.c	1970-01-01 05:30:00.000000000 +0530
+++ ubi_new/drivers/mtd/ubi/sb.c	2010-04-09 21:54:02.645580870 +0530
@@ -0,0 +1,813 @@
+/*
+ * Copyright =A9 2009 Samsung Electronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author:	 Brijesh Singh
+ *		 Rohit Dongre
+ */
+
+/*
+ * The UBI Super Block handling.
+ * Super block or anchor blocks tracks ubi commit, el, which are moving.
+ * Super block is written on first and last peb.
+ */
+
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/err.h>
+#include "ubi.h"
+
+#ifdef CONFIG_MTD_UBI_LOGGED
+
+/**
+ * next_sqnum - get next sequence number.
+ * @ubi: UBI device description object
+ *
+ * This function returns next sequence number to use, which is just the cu=
rrent
+ * sb sequence counter value. It also increases the global sequence counte=
r.
+ */
+static unsigned long long next_sqnum(struct ubi_device *ubi)
+{
+	unsigned long long sqnum;
+
+	spin_lock(&ubi->sb_lock);
+	sqnum =3D ubi->sb_sqnum++;
+	spin_unlock(&ubi->sb_lock);
+
+	return sqnum;
+}
+
+/**
+ * update_sqnum - update sequence number counter.
+ * @ubi: UBI device description object.
+ * @sqnum: sqnum to be updated from.
+ *
+ * Update sb sqnum to sqnum if value  is greater than present counter.
+ */
+
+static void update_sqnum(struct ubi_device *ubi, unsigned long long sqnum)
+{
+	spin_lock(&ubi->sb_lock);
+	if (ubi->sb_sqnum < sqnum)
+		ubi->sb_sqnum =3D sqnum;
+	spin_unlock(&ubi->sb_lock);
+}
+
+/**
+ * find_first_sb - find first sb physical eraseblock
+ * @ubi: UBI device description object.
+ *
+ * This function finds first good physical eraseblock.
+ * on first good eraseblock sb is stored.
+ * @returns pnum on success, negative value otherwise.
+ */
+static inline int find_first_sb(struct ubi_device *ubi)
+{
+	int pnum;
+	for (pnum =3D 0; pnum < ubi->peb_count; pnum++) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status =3D UBIL_PEB_BAD;
+			continue;
+		}
+		return pnum;
+	}
+	return -pnum;
+}
+
+/**
+ * find_last_sb - find last sb physical eraseblock
+ * @ubi: UBI device description object.
+ *
+ * This function finds last good physical eraseblock.
+ * on last good eraseblock sb is stored.
+ * @returns pnum on success, negative value otherwise.
+ */
+static inline int find_last_sb(struct ubi_device *ubi)
+{
+	int pnum;
+	for (pnum =3D ubi->peb_count - 1; pnum > 0; pnum--) {
+		if (ubi_io_is_bad(ubi, pnum)) {
+			ubi_warn("bad block at %d", pnum);
+			ubi->peb_lookup[pnum].status =3D UBIL_PEB_BAD;
+			continue;
+		}
+		return pnum;
+	}
+	return -pnum;
+}
+
+/**
+ * recover_sb - recover corrupt sb
+ * @ubi: UBI device description object.
+ * @returns 0 on success, negative value otherwise.
+ *
+ * This function checks which bud is corrupt.A corrupt bud can have the la=
test
+ * copy of sb. In this case, it copies the latest sb in other bud and
then erase
+ * the corrupt bud. If not, erase the corrupt bud and make it usable.
+ * This function also erases the other bud to maintain sb syncronization.
+ * Finally the offset is set to the next place in log.
+ */
+static int recover_sb(struct ubi_device *ubi)
+{
+	struct ubi_sb *sb =3D ubi->sb_node;
+	int err =3D 0, data_size, crc;
+	int torture =3D 0;
+	int next_active_bud, next_offset;
+
+	if (ubi->sb_needs_rcvry =3D=3D 3) {
+		ubi_warn("both sb blocks need recovery");
+		ubi_ro_mode(ubi);
+		return -EROFS;
+	}
+
+	sb->lh.node_type =3D cpu_to_be32(UBIL_SB_NODE_T);
+	data_size =3D sizeof(struct ubi_sb);
+
+	crc =3D crc32(UBI_CRC32_INIT, sb->lh.data, data_size);
+	sb->lh.data_size =3D cpu_to_be32(data_size);
+	sb->lh.data_crc =3D cpu_to_be32(crc);
+
+	if (ubi->sb_needs_rcvry =3D=3D ubi->sb_active_bud + 1) {
+		/*
+		 *  bud needing recovery holds  the sb copy.
+		 *  erase and write to other one first.
+		 */
+		next_active_bud =3D (ubi->sb_active_bud =3D=3D 0 ? 1 : 0);
+		next_offset =3D ubi->bud_start_offset;
+		torture =3D 0;
+	} else {
+		torture =3D 1;
+		next_active_bud =3D ubi->sb_needs_rcvry - 1;
+		next_offset =3D ubi->bud_start_offset;
+	}
+
+erase_sync_sb:
+	err =3D ubi_io_sync_erase(ubi, ubi->sb_buds[next_active_bud], torture);
+	if (err < 0) {
+		ubi_err("error erasing sb block");
+		goto out_err;
+	}
+
+	err =3D ubi_write_node(ubi, node2lnode(sb), ubi->sb_buds[next_active_bud]=
,
+			     next_offset, ubi->node_size);
+	if (err) {
+		ubi_err("could not write sb");
+		goto out_err;
+	}
+	/* write bud hdr to recognize this sb bud */
+	err =3D ubi_sb_create_dflt(ubi, next_active_bud,
+				 ubi->sb_buds[next_active_bud]);
+	if (err < 0) {
+		ubi_err("error writing sb block");
+		goto out_err;
+	}
+
+	if (ubi->sb_needs_rcvry =3D=3D 0) {
+		ubi->sb_active_bud =3D 1;
+		ubi->sb_offset =3D ubi->bud_start_offset;
+		return 0;
+	}
+
+	if (ubi->sb_needs_rcvry =3D=3D ubi->sb_active_bud + 1) {
+		/* "updated sb" is available in other bud.
+		 *  we have to torture and write curropt bud */
+		torture =3D 1;
+		next_active_bud =3D ubi->sb_needs_rcvry - 1;
+		next_offset =3D ubi->bud_start_offset;
+		ubi->sb_needs_rcvry =3D 0;
+		goto erase_sync_sb;
+	} else {
+		ubi->sb_needs_rcvry =3D 0;
+		next_active_bud =3D (ubi->sb_active_bud =3D=3D 0 ? 1 : 0);
+		next_offset =3D ubi->bud_start_offset;
+		torture =3D 0;
+		goto erase_sync_sb;
+
+	}
+	/* scrub the bud to be recovered */
+
+out_err:
+	ubi_err("sb recovery failed");
+	ubi_ro_mode(ubi);
+	return err;
+}
+
+/**
+ * validate_bud_hdr - validate sb bud header
+ * @ubi: UBI device description object
+ * @pnum: physical eraseblock ti read
+ * @bud_hdr: buffer to read bud header
+ *
+ * This function reads sb bud header to @bud_hdr from physical  eraseblock
+ * @pnum. Then it validates the bud header.
+ * @returns 0 on success, error code other wise.
+ */
+static int validate_bud_hdr(struct ubi_device *ubi, int pnum,
+			    struct sb_bud_hdr *bud_hdr)
+{
+	int err =3D 0;
+
+	dbg_sb("processing bud header at pnum %d", pnum);
+
+	err =3D ubi_io_read(ubi, node2lnode(bud_hdr), pnum, UBIL_BUD_HDR_OFFSET,
+			  ubi->node_size);
+	if (err && (err !=3D -EBADMSG || err !=3D UBI_IO_BITFLIPS)) {
+		ubi_err("could not read header for sb block %d", pnum);
+		return err;
+	}
+
+	err =3D verify_node(ubi, node2lnode(bud_hdr), UBIL_SB_BUD_HDR_T);
+	if (err)
+		return err;
+
+	if (be32_to_cpu(bud_hdr->MAGIC) !=3D UBI_MAGIC) {
+		ubi_err("UBI Magic Mismatch at pnum %d", pnum);
+		return -EINVAL;
+	}
+	if (be32_to_cpu(bud_hdr->ubi_version) !=3D UBI_VERSION) {
+		ubi_err("UBI Version Mismatch at pnum %d", pnum);
+		return -EINVAL;
+	}
+	if (be32_to_cpu(bud_hdr->el_version) !=3D UBIL_EL_VERSION) {
+		ubi_err("UBI Log Version Mismatch at pnum %d", pnum);
+		return -EINVAL;
+	}
+	if (be32_to_cpu(bud_hdr->cmt_version) !=3D UBIL_CMT_VERSION) {
+		ubi_err("UBI Commit Mismatch at pnum %d", pnum);
+		return -EINVAL;
+	}
+	if (be32_to_cpu(bud_hdr->lh.node_type) !=3D UBIL_SB_BUD_HDR_T) {
+		ubi_err("UBI Commit Mismatch at pnum %d", pnum);
+		return -EINVAL;
+	}
+
+	if (ubi->flash_size !=3D be64_to_cpu(bud_hdr->flash_size))
+		goto out_err;
+	if (ubi->peb_count !=3D be32_to_cpu(bud_hdr->peb_count))
+		goto out_err;
+	if (ubi->peb_size !=3D be32_to_cpu(bud_hdr->peb_size))
+		goto out_err;
+	if (ubi->min_io_size !=3D be32_to_cpu(bud_hdr->min_io_size))
+		goto out_err;
+	if (ubi->hdrs_min_io_size !=3D be32_to_cpu(bud_hdr->hdrs_min_io_size))
+		goto out_err;
+	if (ubi->bad_allowed !=3D be32_to_cpu(bud_hdr->bad_allowed))
+		goto out_err;
+
+	update_sqnum(ubi, be64_to_cpu(bud_hdr->sqnum));
+	return 0;
+
+out_err:
+	ubi_err("bad values in sb");
+	return -EBADMSG;
+}
+
+/**
+ * validate_sb_node - validate sb node
+ * @ubi: UBI device description object
+ * @sb: sb node to be validated
+ *
+ * This function validates data stored in sb node @sb.
+ * @return 0 on success, error code otherwise.
+ */
+static inline int validate_sb_node(struct ubi_device *ubi, struct ubi_sb *=
sb)
+{
+
+	int el_resrvd_buds =3D 0, cmt_next_buds =3D 0;
+	int node_type;
+
+	if (be32_to_cpu(sb->version) !=3D UBIL_SB_VERSION)
+		return -EBADMSG;
+
+	/* check node type */
+	node_type =3D be32_to_cpu(sb->lh.node_type);
+	if (node_type !=3D UBIL_SB_NODE_T) {
+		ubi_err("bad node type");
+		return -EBADMSG;
+	}
+
+	el_resrvd_buds =3D be32_to_cpu(sb->el_resrvd_buds);
+	if (el_resrvd_buds <=3D 0 || el_resrvd_buds !=3D ubi->el_reservd_buds)
+		return -EBADMSG;
+
+	/**
+	 * vtbl copies can be added to sb. This will help in finding vtbl table
+	 * without scanning.
+	 * if (be32_to_cpu(sb->vtbl_peb[0]) <=3D 0
+	 *	        || be32_to_cpu(sb->vtbl_peb[1]) <=3D 0)
+	 *	        return -EBADMSG;
+	 */
+
+	if (be32_to_cpu(sb->cmt_status) !=3D UBIL_CMT_INVALID &&
+	    be32_to_cpu(sb->cmt_status) !=3D UBIL_CMT_WRITE_SUCCESS)
+		return -EBADMSG;
+
+	if (be32_to_cpu(sb->cmt_resrvd_buds) <=3D 0)
+		return -EBADMSG;
+
+	cmt_next_buds =3D be32_to_cpu(sb->cmt_next_buds);
+	if (cmt_next_buds < 0)
+		return -EBADMSG;
+
+	return 0;
+}
+
+/**
+ * process_bud - process sb bud
+ * @ubi: UBI device description object
+ * @buf: sb bud content to process
+ *
+ * This function process sb bud @buf, to find last valid
+ * entry from sb. Each entry in sb bud is verified until
+ * empty entry is found or usable bud length is exceeded.
+ * If empty entry is found in sb bud, then ubi->sb_offset
+ * is initialized to previous valid entry. Validation of
+ * valid entry is done.
+ *
+ * In case of corrupt entry in sb bud, function return one
+ * for doing sb recovery. if tail in bud is invalid then -EBADMSG
+ * is returned.
+ */
+
+static int process_bud(struct ubi_device *ubi, void *buf)
+{
+	int err =3D 0, valid =3D 1, recovery_needed =3D 0;
+	struct ubi_sb *node, *valid_node =3D NULL;
+	int offset =3D 0;
+
+	while (offset < ubi->bud_usable_len) {
+		node =3D (struct ubi_sb *)(buf + offset);
+		/* verify if the data content and crc are matching */
+		err =3D verify_node(ubi, node2lnode(node), UBIL_SB_NODE_T);
+		if (err =3D=3D UBIL_NODE_EMPTY)
+			break;
+		else if (err) {
+			/*
+			 * seems like one of the entries is corrupt.
+			 * doesn't matter, if we can still get the tail sb,
+			 * super block will be valid.
+			 */
+			ubi_warn("sb node corrupt at offset %d err %d",
+				 offset + ubi->bud_start_offset, err);
+			valid =3D 1;
+			recovery_needed =3D 1;
+			offset +=3D ubi->node_size;
+			continue;
+		}
+		valid_node =3D node;
+		valid =3D 0;
+		offset +=3D ubi->node_size;
+	}
+
+	/*
+	 *  If tail is invalid, the block does not contain last valid entry
+	 */
+	if (valid =3D=3D 1)
+		return -EBADMSG;
+
+	/* Offset starts at node start offset */
+	ubi->sb_offset =3D ubi->bud_start_offset;
+	/* we exited the loop at free node. */
+	ubi->sb_offset +=3D offset - ubi->node_size;
+
+	/* validate contents */
+	err =3D validate_sb_node(ubi, valid_node);
+	if (err)
+		return err;
+
+	return recovery_needed;
+}
+
+/**
+ * initialize_sb - initialize sb
+ * @ubi: UBI device description object
+ * @node: valid sb node
+ *
+ * This function initializes in ram sb with valid sb node found on flash
+ */
+static int initialize_sb(struct ubi_device *ubi, struct ubi_sb *node)
+{
+	memcpy(ubi->sb_node, node, ubi->node_size);
+	return 0;
+}
+
+/**
+ * ubi_sb_get_node - get sb node
+ * @ubi: UBI device description object
+ *
+ * This function takes sb lock and returns ubi->sb_node. For any change in
+ * sb_node, caller must call this function.
+ */
+struct ubi_sb *ubi_sb_get_node(struct ubi_device *ubi)
+{
+	mutex_lock(&ubi->sb_mutex);
+	return ubi->sb_node;
+}
+
+/**
+ * ubi_sb_put_node - release sb lock
+ * @ubi: UBI device description object
+ *
+ * This function releases sb lock
+ */
+
+void ubi_sb_put_node(struct ubi_device *ubi)
+{
+	mutex_unlock(&ubi->sb_mutex);
+}
+
+/**
+ * ubi_sb_sync_node - write sb node
+ * @ubi: UBI device description object
+ *
+ * This function writes sb node on flash. During write operation if sb ful=
l
+ * condition is reached then, sb is erases and updated sb is written
atomically.
+ * @return: 0 on success, error code otherwise.
+ * Note: This function expects caller to take lock using ubi_sb_get_node.
+ */
+int ubi_sb_sync_node(struct ubi_device *ubi)
+{
+	struct ubi_sb *sb =3D ubi->sb_node;
+	int err, data_size, crc;
+	int next_active_bud, next_offset;
+
+	sb->lh.node_type	=3D cpu_to_be32(UBIL_SB_NODE_T);
+	sb->version		=3D cpu_to_be32(UBIL_SB_VERSION);
+	data_size		=3D sizeof(struct ubi_sb);
+
+	crc =3D crc32(UBI_CRC32_INIT, sb->lh.data, data_size);
+
+	sb->lh.data_size 	=3D cpu_to_be32(data_size);
+	sb->lh.data_crc 	=3D cpu_to_be32(crc);
+
+	if (ubi->sb_active_bud =3D=3D 1) {
+		next_active_bud =3D 0;
+		next_offset =3D ubi->sb_offset + ubi->node_size;
+		if (next_offset >=3D ubi->peb_size) {
+			err =3D ubi_io_sync_erase(ubi,
+						ubi->sb_buds[next_active_bud],
+						0);
+			if (err < 0) {
+				ubi_err("error erasing sb block");
+				goto out_err;
+			}
+			err =3D ubi_sb_create_dflt(ubi, next_active_bud,
+						 ubi->sb_buds[next_active_bud]);
+			if (err < 0) {
+				ubi_err("error writing sb block");
+				goto out_err;
+			}
+			next_offset =3D ubi->bud_start_offset;
+		}
+	} else if (ubi->sb_active_bud =3D=3D 0) {
+		next_active_bud =3D 1;
+		next_offset =3D ubi->sb_offset;
+		if (next_offset =3D=3D ubi->bud_start_offset) {
+			err =3D ubi_io_sync_erase(ubi,
+						ubi->sb_buds[next_active_bud],
+						0);
+			if (err < 0) {
+				ubi_err("error erasing sb block");
+				goto out_err;
+			}
+			err =3D ubi_sb_create_dflt(ubi, next_active_bud,
+						 ubi->sb_buds[next_active_bud]);
+			if (err < 0) {
+				ubi_err("error writing sb block");
+				goto out_err;
+			}
+		}
+	} else {
+		/* Something went wrong */
+		ubi_err("active sb beyond limitation");
+		BUG();
+	}
+
+	err =3D ubi_write_node(ubi, node2lnode(sb), ubi->sb_buds[next_active_bud]=
,
+			     next_offset, ubi->node_size);
+	if (err) {
+		ubi_err("could not write sb");
+		goto out_err;
+
+	}
+
+	ubi->sb_active_bud =3D next_active_bud;
+	ubi->sb_offset =3D next_offset;
+	return 0;
+out_err:
+	ubi_ro_mode(ubi);
+	return err;
+}
+
+/**
+ * ubi_get_sb - read valid sb node
+ * @ubi: UBI device description object
+ *
+ * This function reads sb bud and find valid entry from sb bud.
+ * If valid entry is found then ubi->sb_node is initialized
+ * and return zero. In case of failure negative error code
+ * is returned.
+ */
+
+int ubi_get_sb(struct ubi_device *ubi)
+{
+	int err =3D 0, bud, pnum =3D 0;
+	int rcvr_sb =3D 0;
+	int bud_is_bad[2] =3D { 1, 1 };
+	struct sb_bud_hdr *bud_hdr;
+
+	struct ubi_sb *sb_node, *valid_node;
+
+	dbg_sb("ubi trying to find and intialize super blocks");
+
+	ubi->sb_needs_rcvry =3D 0;
+
+	/* Find first and last block for super blocks */
+	ubi->sb_buds[0] =3D find_first_sb(ubi);
+	if (ubi->sb_buds[0] < 0) {
+		ubi_err("not enough good blocks");
+		return -EINVAL;
+	}
+
+	ubi->sb_buds[1] =3D find_last_sb(ubi);
+	if (ubi->sb_buds[1] < 0 || ubi->sb_buds[1] =3D=3D ubi->sb_buds[0]) {
+		ubi_err("not enough good blocks");
+		return -EINVAL;
+	}
+
+	dbg_sb("sb buds found at pnum %d %d", ubi->sb_buds[0], ubi->sb_buds[1]);
+
+	/* Now validate these pebs for sb bud headers */
+	bud_hdr =3D alloc_nodes(ubi, UBIL_SB_BUDS_RESRVD);
+	if (!bud_hdr) {
+		ubi_err("error allocating memory");
+		return -ENOMEM;
+	}
+
+	for (bud =3D 0; bud < 2; bud++)
+		bud_is_bad[bud] =3D validate_bud_hdr(ubi, ubi->sb_buds[bud],
+						   &bud_hdr[bud]);
+
+	/*
+	 * Check for active bud. If bud 0 is bad, bud 1 is valide
+	 * If both pebs have bad header, we should not process them
+	 */
+
+	if (!bud_is_bad[0])
+		ubi->sb_active_bud =3D 0;
+	else if (!bud_is_bad[1])
+		ubi->sb_active_bud =3D 1;
+	else {
+		ubi_err("both super blocks are bad");
+		free_nodes(bud_hdr);
+		return -EBADMSG;
+	}
+
+	/* read the entire block and find updates sb copy. */
+	mutex_lock(&ubi->buf_mutex);
+	memset(ubi->peb_buf1, 0xFF, ubi->peb_size);
+
+	sb_node =3D alloc_nodes(ubi, 1);
+	if (!sb_node) {
+		ubi_err("error allocating memory");
+		mutex_unlock(&ubi->buf_mutex);
+		free_nodes(bud_hdr);
+		return -ENOMEM;
+	}
+
+retry:
+	/* Read the active sb pnum and process it to find updated sb copy */
+	pnum =3D ubi->sb_buds[ubi->sb_active_bud];
+	err =3D ubi_io_read(ubi, ubi->peb_buf1, pnum, ubi->bud_start_offset,
+			  ubi->bud_usable_len);
+	if (err =3D=3D UBI_IO_BITFLIPS || err =3D=3D -EBADMSG) {
+		/*
+		 * Scrub the PEB later. Note, -EBADMSG indicates an
+		 * uncorrectable ECC error, but we have our own CRC and
+		 * the data will be checked later.
+		 * One or both copies of sb will need to be recovered later
+		 * This flag is set to 1.
+		 */
+		rcvr_sb =3D 1;
+	} else if (err) {
+		/*
+		 * something went wrong. We can not process this bud.
+		 * Try other
+		 */
+		goto out_retry;
+	}
+
+	err =3D process_bud(ubi, ubi->peb_buf1);
+	if (err < 0) {
+		/* Try other bud */
+		goto out_retry;
+	} else if (err)
+		rcvr_sb =3D 1;
+	/*
+	 * If sb_needs_rcvry =3D 0, no recovery needed.
+	 * If sb_needs_rcvry =3D 1, first bud needs scrubing.
+	 * If sb_needs_rcvry =3D 2, second bud needs scrubing.
+	 * If sb_needs_rcvry =3D 3, both buds need scrubing.
+	 *
+	 */
+	if (rcvr_sb)
+		ubi->sb_needs_rcvry +=3D ubi->sb_active_bud + 1;
+
+	/* reset recovery flag for retry */
+	rcvr_sb =3D 0;
+
+	/* get valid node offset just processed by process_bud */
+	valid_node =3D (struct ubi_sb *)(ubi->peb_buf1 + ubi->sb_offset
+				       - ubi->bud_start_offset);
+	/*
+	 * one of the good blocks holding active super block is processed.
+	 */
+
+	if (ubi->sb_active_bud =3D=3D 0 && bud_is_bad[1] =3D=3D 0) {
+		if (be64_to_cpu(bud_hdr[1].sqnum) <
+		    be64_to_cpu(bud_hdr[0].sqnum)) {
+			/*
+			 * This is older copy. Skip it, next sb_sync will
+			 * erase and reuse it.
+			 */
+			ubi_msg("sb #1 is old");
+			goto out;
+		}
+
+		err =3D ubi_read_node(ubi, node2lnode(sb_node), ubi->sb_buds[1],
+				    ubi->sb_offset, ubi->node_size);
+		if (err) {
+			if (err =3D=3D UBIL_NODE_EMPTY)
+				goto out;
+
+			ubi_err("could not read super block #1");
+			/* Second copy needs recovery */
+			ubi->sb_needs_rcvry +=3D 2;
+			goto out;
+		}
+
+		/* verify if the data content and crc are matching */
+		err =3D verify_node(ubi, node2lnode(sb_node), UBIL_SB_NODE_T);
+		if (err =3D=3D UBIL_NODE_EMPTY)
+			goto out;
+		else if (err) {
+			ubi_warn("sb #1 is corrupt");
+			/* Second copy needs recovery */
+			ubi->sb_needs_rcvry +=3D 2;
+			goto out;
+		}
+
+		/* validate contents */
+		err =3D validate_sb_node(ubi, sb_node);
+		if (err) {
+			/* Second copy needs recovery */
+			ubi->sb_needs_rcvry +=3D 2;
+			goto out;
+		}
+
+		ubi->sb_active_bud =3D 1;
+		valid_node =3D sb_node;
+	}
+
+out:
+	initialize_sb(ubi, valid_node);
+
+	if (ubi->sb_needs_rcvry)
+		recover_sb(ubi);
+
+	err =3D 0;
+
+	mutex_unlock(&ubi->buf_mutex);
+	kfree(sb_node);
+	free_nodes(bud_hdr);
+	return err;
+
+out_retry:
+	ubi_warn("could not read sb bud #%d err %d", ubi->sb_active_bud, err);
+	/* Set active bud as bad */
+	bud_is_bad[ubi->sb_active_bud] =3D 1;
+	/*
+	 * If we were processing first bud retry for second bud.
+	 * Do not proceed if second bud is already bad.
+	 * If we were processing second bud, throw error as we are out of buds
+	 */
+	if (ubi->sb_active_bud =3D=3D 0 && !bud_is_bad[1]) {
+		ubi->sb_active_bud =3D 1;
+		goto retry;
+	}
+	mutex_unlock(&ubi->buf_mutex);
+	kfree(sb_node);
+	free_nodes(bud_hdr);
+	return err;
+}
+
+/**
+ * ubi_sb_init - initialize super block
+ * @ubi: UBI device description object
+ *
+ * This function initializes super block.
+ */
+int ubi_sb_init(struct ubi_device *ubi)
+{
+
+	dbg_sb("initializing sb parameters");
+
+	ubi->sb_node =3D kmalloc(ubi->node_size, GFP_KERNEL);
+	if (!ubi->sb_node) {
+		ubi_err("could not allocate memory");
+		return -ENOMEM;
+	}
+	memset(ubi->sb_node, 0xff, ubi->node_size);
+
+	ubi->sb_needs_rcvry =3D 0;
+	ubi->sb_offset =3D 0;
+	ubi->sb_active_bud =3D 1;
+
+	mutex_init(&ubi->sb_mutex);
+	spin_lock_init(&ubi->sb_lock);
+	ubi->sb_sqnum =3D 1;
+	return 0;
+}
+
+/**
+ * ubi_sb_close - release super block
+ * @ubi: UBI device description object
+ *
+ * Free allocated memory.
+ */
+
+int ubi_sb_close(struct ubi_device *ubi)
+{
+	kfree(ubi->sb_node);
+	return 0;
+}
+
+/**
+ * ubi_sb_create_dflt - create default sb header
+ * @ubi: UBI device description object
+ * @bud: sb bud
+ * @pnum: physical eraseblock to create sb
+ *
+ * This function writes sb header for sb bud @bud on
+ * physiacl eraseblock @pnum. If header is successfully
+ * written this function return zero. In case of failure
+ * function return negative error code.
+ */
+
+int ubi_sb_create_dflt(struct ubi_device *ubi, int bud, int pnum)
+{
+	int err;
+	struct sb_bud_hdr *bud_hdr;
+	int data_size, crc;
+
+	dbg_sb("create sb called on pnum %d bud_id %d", pnum, bud);
+
+	bud_hdr =3D kmalloc(ubi->node_size, GFP_KERNEL);
+	memset(bud_hdr, 0xff, ubi->node_size);
+
+	bud_hdr->MAGIC			=3D cpu_to_be32(UBI_MAGIC);
+	bud_hdr->ubi_version		=3D cpu_to_be32(UBI_VERSION);
+	bud_hdr->el_version		=3D cpu_to_be32(UBIL_EL_VERSION);
+	bud_hdr->cmt_version		=3D cpu_to_be32(UBIL_CMT_VERSION);
+
+	bud_hdr->rsvd_pebs		=3D cpu_to_be32(ubi->rsvd_pebs);
+	bud_hdr->beb_rsvd_pebs		=3D cpu_to_be32(ubi->beb_rsvd_pebs);
+	bud_hdr->beb_rsvd_level		=3D cpu_to_be32(ubi->beb_rsvd_level);
+	bud_hdr->flash_size		=3D cpu_to_be64(ubi->flash_size);
+	bud_hdr->peb_count		=3D cpu_to_be32(ubi->peb_count);
+	bud_hdr->peb_size		=3D cpu_to_be32(ubi->peb_size);
+	bud_hdr->min_io_size		=3D cpu_to_be32(ubi->min_io_size);
+	bud_hdr->hdrs_min_io_size	=3D cpu_to_be32(ubi->hdrs_min_io_size);
+	bud_hdr->bad_allowed		=3D cpu_to_be32(ubi->bad_allowed);
+	bud_hdr->sqnum			=3D cpu_to_be64(next_sqnum(ubi));
+
+	data_size =3D sizeof(struct sb_bud_hdr);
+	crc =3D crc32(UBI_CRC32_INIT, bud_hdr->lh.data, data_size);
+
+	bud_hdr->lh.data_size		=3D cpu_to_be32(data_size);
+	bud_hdr->lh.data_crc		=3D cpu_to_be32(crc);
+	bud_hdr->lh.node_type		=3D cpu_to_be32(UBIL_SB_BUD_HDR_T);
+	bud_hdr->lh.node_id		=3D cpu_to_be32(bud);
+
+	err =3D ubi_write_node(ubi, node2lnode(bud_hdr),
+				pnum, UBIL_BUD_HDR_OFFSET, ubi->node_size);
+	kfree(bud_hdr);
+	if (!err)
+		ubi->sb_buds[bud] =3D pnum;
+	return err;
+}
+#endif
