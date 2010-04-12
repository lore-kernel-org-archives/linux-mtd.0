Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F8C-0005DE-Jq
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:34 +0000
Received: by mail-pv0-f177.google.com with SMTP id 30so2685072pvc.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:36:18 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:18 +0530
Message-ID: <z2m6b5362aa1004120136w74b913e6r211a8658e76461b8@mail.gmail.com>
Subject: PATCH 4/7] ubi: logging feature for ubi
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

Note: el(eba log) for logging feature

Signed-off-by: brijesh singh <brij.singh@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/el.c	1970-01-01 05:30:00.000000000 +0530
+++ ubi_new/drivers/mtd/ubi/el.c	2010-04-09 21:54:02.624073440 +0530
@@ -0,0 +1,568 @@
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
+ * Author:	Brijesh Singh
+ *		Rohit Dongre
+ */
+
+/*
+ * The el blocks are logged blocks. They store the eba mappings. When one
+ * peb mapping is to be read or written, we group the pebs (utilize the sp=
ace)
+ * When el blocks are full, commit is called which relocates the blocks.
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
+ * verify_bud_hdr - verify el bud header
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @bud_hdr: el bud header to be verified
+ *
+ * This function verifies the el_bud_hdr for consitency.
+ * @return: On success return 0, error value other wise.
+ */
+static inline int verify_bud_hdr(struct ubi_device *ubi, int pnum,
+				 struct el_bud_hdr *bud_hdr)
+{
+	int err;
+
+	/* verify generic node */
+	err =3D verify_node(ubi, node2lnode(bud_hdr), UBIL_EL_BUD_HDR_T);
+	if (err)
+		return err;
+
+	/* check node type */
+	if (be32_to_cpu(bud_hdr->lh.node_type) !=3D UBIL_EL_BUD_HDR_T) {
+		ubi_err("node type mismatch");
+		return -EINVAL;
+	}
+
+	/* check bud magic */
+	if (be32_to_cpu(bud_hdr->MAGIC) !=3D UBIL_EL_BUD_HDR_MAGIC) {
+		ubi_err("magic Mismatch");
+		return -EBADMSG;
+	}
+
+	/* check version for el */
+	if (be32_to_cpu(bud_hdr->log_version) !=3D UBIL_EL_VERSION) {
+		ubi_err("version mismatch");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * process_node - process el node
+ * @ubi_device: UBI device description object
+ * @node: el node
+ *
+ * This function checks el node @node and based on group to
+ * which @node belong, initializes peb_lookup table.
+ * If @node valid and initialization is done successfull,
+ * @return: On success return 0, error value other wise.
+ */
+static int process_node(struct ubi_device *ubi, struct el_node *node)
+{
+	int data_size, group, node_type, pnum;
+	int err;
+
+	err =3D verify_node(ubi, node2lnode(node), UBIL_EL_NODE_T);
+	if (err)
+		return err;
+
+	/* check node type */
+	node_type =3D be32_to_cpu(node->lh.node_type);
+	if (node_type !=3D UBIL_EL_NODE_T) {
+		ubi_err("bad node type");
+		return -EBADMSG;
+	}
+
+	group =3D be32_to_cpu(node->lh.node_id);
+	if (group < 0 || group >=3D ubi->el_no_of_grps)
+		return -EINVAL;
+
+	data_size =3D be32_to_cpu(node->lh.data_size);
+	if (data_size > ubi->node_size)
+		return -EBADMSG;
+
+	/* copy the information in peb_lookup buffer */
+	pnum =3D group * ubi->el_pebs_in_grp;
+	memcpy(&ubi->peb_lookup[pnum], node->recs, data_size);
+	return 0;
+}
+
+/**
+ * prepare_node - generate el node
+ * @ubi_device: UBI device description object
+ * @node: el node where to prepare.
+ * @group: group number for which node should be prepared.
+ *
+ * This function prepares a node for said group value.
+ * TODO grouping recently used pebs can help in removing peb_lookup buffer=
.
+ * @return: On success return 0, error value other wise.
+ */
+static void prepare_node(struct ubi_device *ubi,
+			 struct el_node *node, int group)
+{
+	int pnum =3D group * ubi->el_pebs_in_grp;
+	int data_size, crc;
+	/* data size for node */
+	data_size =3D ubi->el_pebs_in_grp * sizeof(struct peb_info);
+	if (pnum + ubi->el_pebs_in_grp > ubi->peb_count)
+		data_size =3D (ubi->peb_count - pnum) * sizeof(struct peb_info);
+	/* copy group information in node */
+	memcpy(node->recs, &ubi->peb_lookup[pnum], data_size);
+
+	node->lh.node_type	=3D cpu_to_be32(UBIL_EL_NODE_T);
+	node->lh.node_id	=3D cpu_to_be32(group);
+	node->lh.data_size	=3D cpu_to_be32(data_size);
+
+	/* Calculate the Data CRC First */
+	crc =3D crc32(UBI_CRC32_INIT, node->lh.data, data_size);
+	node->lh.data_crc =3D cpu_to_be32(crc);
+}
+
+/**
+ * process_bud - process el bud
+ * @ubi_device: UBI device description object
+ * @buf: buffer containing el bud
+ *
+ * This processes nodes in the bud.empty node is the tail of the log.If an=
y
+ * node is corrupt, the node is skipped. In this case, cmt is scheduled.
+ * After processing of el bud, ubi->el_offset is set to last valid el node=
,
+ * that is to tail of the log.
+ * @return: On success return 0, error value other wise.
+ */
+static int process_bud(struct ubi_device *ubi, void *buf)
+{
+	int err =3D UBIL_NODE_EMPTY;
+	struct el_node *node;
+	int offset =3D 0;
+
+	for (offset =3D 0; offset < ubi->bud_usable_len;
+					offset +=3D ubi->node_size) {
+		node =3D (struct el_node *)(buf + offset);
+		err =3D process_node(ubi, node);
+		if (err =3D=3D UBIL_NODE_EMPTY)
+			break;
+		else if (err) {
+			/*
+			 * Seems like one of the entries is corrupt.
+			 * Doesn't matter, lets continue.
+			 */
+			ubi_warn("el bad node offset %d, needs recovery",
+				 offset);
+			ubi_schedule_cmt(ubi);
+			continue;
+		}
+	}
+
+	ubi->el_offset =3D offset;
+	if (offset >=3D ubi->bud_usable_len)
+		return UBIL_BUD_FULL;
+	else
+		return err;
+
+}
+
+/**
+ * reserve_space -reserve space in log.
+ * @ubi: ubi device descrition object
+ * @pnum: pointer to pnum
+ * @offset: offset in pnum
+ *
+ * This function returns 0 on success and negative err on failure.
+ */
+static inline int reserve_space(struct ubi_device *ubi, int *pnum, int *of=
fset)
+{
+	int off =3D ubi->el_offset;
+	int bud =3D ubi->el_active_bud;
+
+	off +=3D ubi->node_size;
+	if (off >=3D ubi->peb_size) {
+		/**
+		 * there is no space in bud, go to next bud.
+		 * write log from start
+		 */
+		bud +=3D 1;
+		off =3D ubi->bud_start_offset;
+		if (bud >=3D ubi->el_reservd_buds) {
+			/* there are no bud left. */
+			return -ENOSPC;
+		}
+	}
+
+	/* Set el offset and active bud to new once */
+	ubi->el_offset =3D off;
+	ubi->el_active_bud =3D bud;
+
+	/* Set return pnum and offset */
+	*pnum =3D ubi->el_buds[ubi->el_active_bud];
+	*offset =3D off;
+	return 0;
+}
+
+/**
+ * el_write_node - write el node to log
+ * @ubi_device: UBI device description object
+ * @group: group number of el
+ *
+ * This function writes el node to the tail of the log. If there is no spa=
ce,
+ * cmt is called. This creates a new log.node will be written to the new l=
og
+ * If cmt operation is in progress, el node should not be written.
+ * @return: On success return 0, error value other wise.
+ */
+static int el_write_node(struct ubi_device *ubi, int group)
+{
+	int err;
+	struct el_node *node;
+	int pnum, offset;
+
+	/*
+	 * When cmt is in progress only wl is writing.
+	 * Let it halppen in Ram.This is necessary because sometime
+	 * Wl has to give free blocks to cmt. */
+
+	if (ubi_cmt_progress(ubi))
+		BUG();
+
+	node =3D alloc_nodes(ubi, 1);
+	if (!node)
+		return -ENOMEM;
+
+rsrv_space:
+	err =3D reserve_space(ubi, &pnum, &offset);
+	if (err =3D=3D -ENOSPC) {
+		err =3D ubi_cmt(ubi);
+		if (err) {
+			ubi_err("ubi commit error %d", err);
+			goto out_err;
+		}
+		goto rsrv_space;
+	}
+
+	/* TODO there is inconsistency in prepare node.
+	 * But needs better solution.
+	 */
+	prepare_node(ubi, node, group);
+	ubi->c_dirty =3D C_DIRTY;
+
+	err =3D ubi_write_node(ubi, node2lnode(node), pnum,
+				     offset, ubi->node_size);
+	if (err) {
+		ubi_err("could not write eba to log ");
+		ubi_ro_mode(ubi);
+		goto out_err;
+
+	}
+out_err:
+	free_nodes(node);
+	return err;
+}
+
+/**
+ * ubi_el_scan - scan the el log.
+ * @ubi_device: UBI device description object
+ *
+ * el_scan scans the entire el buds, and processes them. map  of valid ent=
ries
+ * is created in the peb_lookup buffer.
+ * @return: On success return 0, error value other wise.
+ */
+int ubi_el_scan(struct ubi_device *ubi)
+{
+	int err =3D 0;
+	int pnum, bud;
+	struct ubi_sb *sb =3D ubi->sb_node;
+
+	struct el_bud_hdr *bud_hdr;
+
+	bud_hdr =3D kmalloc(ubi->node_size, GFP_KERNEL);
+	if (!bud_hdr) {
+		ubi_msg("out of memory");
+		return -ENOMEM;
+	}
+
+	for (bud =3D 0; bud < ubi->el_reservd_buds; bud++) {
+		pnum =3D be32_to_cpu(sb->buds[bud]);
+		err =3D ubi_read_node(ubi, node2lnode(bud_hdr), pnum,
+				    UBIL_BUD_HDR_OFFSET, ubi->node_size);
+		if (err) {
+			ubi_err("error reading el bud %d pum %d", bud + 1,
+				pnum);
+			if (err =3D=3D -EBADMSG || err =3D=3D UBI_IO_BITFLIPS) {
+				/* we are getting ecc error from hardware.
+				 * schedule cmt to relocate el. */
+				ubi_schedule_cmt(ubi);
+			} else
+				goto out_err;
+		}
+
+		err =3D verify_bud_hdr(ubi, pnum, bud_hdr);
+		if (err)
+			goto out_err;
+
+		ubi->el_buds[bud] =3D pnum;
+	}
+
+	mutex_lock(&ubi->buf_mutex);
+	memset(ubi->peb_buf1, 0xFF, ubi->peb_size);
+
+	for (bud =3D 0; bud < ubi->el_reservd_buds; bud++) {
+		pnum =3D ubi->el_buds[bud];
+		ubi->el_active_bud =3D bud;
+		err =3D ubi_io_read(ubi, ubi->peb_buf1, pnum,
+				  ubi->bud_start_offset, ubi->bud_usable_len);
+		if (err) {
+			ubi_err("error reading el bud %d pum %d", bud + 1,
+				pnum);
+			if (err =3D=3D -EBADMSG || err =3D=3D UBI_IO_BITFLIPS)
+				ubi_schedule_cmt(ubi);
+			else
+				goto out_read_err;
+		}
+
+		err =3D process_bud(ubi, ubi->peb_buf1);
+		if (err =3D=3D UBIL_NODE_EMPTY)
+			break;
+		else if (err !=3D UBIL_BUD_FULL)
+			goto out_read_err;
+	}
+
+out_read_err:
+	mutex_unlock(&ubi->buf_mutex);
+out_err:
+	kfree(bud_hdr);
+	return (err =3D=3D UBIL_NODE_EMPTY || err =3D=3D UBIL_BUD_FULL) ? 0 : err=
;
+}
+
+/**
+ * ubi_write_bud_hdr
+ * @ubi: UBI device description object
+ * @bud: el bud
+ * @pnum: physical eraseblock
+ *
+ * this function writes default bud hdr to the pnum.
+ * @return: On success return 0, error value other wise.
+ */
+int ubi_el_create_dflt(struct ubi_device *ubi, int bud, int pnum)
+{
+	int err =3D 0;
+	struct el_bud_hdr *bud_hdr;
+	int data_size, crc;
+
+	dbg_el("creating default EL with %d pebs reserved ", pnum);
+
+	bud_hdr =3D alloc_nodes(ubi, 1);
+	if (!bud_hdr) {
+		ubi_msg("Out of memory");
+		return -ENOMEM;
+	}
+
+	bud_hdr->MAGIC 		=3D cpu_to_be32(UBIL_EL_BUD_HDR_MAGIC);
+	bud_hdr->log_version 	=3D cpu_to_be32(UBIL_EL_VERSION);
+
+	data_size =3D sizeof(struct el_bud_hdr);
+	crc =3D crc32(UBI_CRC32_INIT, bud_hdr->lh.data, data_size);
+
+	bud_hdr->lh.data_size	=3D cpu_to_be32(data_size);
+	bud_hdr->lh.data_crc	=3D cpu_to_be32(crc);
+	bud_hdr->lh.node_type	=3D cpu_to_be32(UBIL_EL_BUD_HDR_T);
+	bud_hdr->lh.node_id	=3D cpu_to_be32(bud);
+
+	err =3D ubi_write_node(ubi, node2lnode(bud_hdr), pnum,
+			     UBIL_BUD_HDR_OFFSET, ubi->node_size);
+	if (err)
+		ubi_err("could not write EL Block header in Block %d", pnum);
+
+	free_nodes(bud_hdr);
+	return err;
+}
+
+/**
+ * el_init -
+ * @ubi_device: UBI device description object
+ * return: On success return 0, error value other wise.
+ */
+
+int ubi_el_init(struct ubi_device *ubi)
+{
+
+	ubi->el_buds =3D kmalloc(ubi->el_reservd_buds * sizeof(int), GFP_KERNEL);
+	if (!ubi->el_buds) {
+		ubi_msg("out of memory");
+		return -ENOMEM;
+	}
+
+	mutex_init(&ubi->el_mutex);
+	ubi->el_offset =3D 0;
+	ubi->el_active_bud =3D 0;
+	return 0;
+}
+
+/**
+ * ubi_el_close -
+ * @ubi_device: UBI device description object
+ */
+void ubi_el_close(struct ubi_device *ubi)
+{
+	kfree(ubi->el_buds);
+}
+
+/**
+ * ubi_el_read_ec_hdr - read erase count of physical eraseblock
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ *
+ * This function return erase count for physical eraseblock
+ * @pnum.
+ */
+
+int ubi_el_read_ec_hdr(struct ubi_device *ubi, int pnum)
+{
+	return ubi->peb_lookup[pnum].ec;
+}
+
+/**
+ * ubi_el_write_ec_hdr - update erase count of physical eraseblock
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @ec: erase count
+ *
+ * This function updates erase count of physical eraseblock @pnum
+ * int el log. i.e. el.
+ */
+
+int ubi_el_write_ec_hdr(struct ubi_device *ubi, int pnum, int ec)
+{
+	int group =3D pnum / ubi->el_pebs_in_grp;
+	int err =3D 0;
+
+	dbg_el("writing Ec Header for Pnum %d grp %d", pnum, group);
+
+	mutex_lock(&ubi->el_mutex);
+	if (paronoid_check_special(ubi, pnum)) {
+		ubi_err("overwritng ec of sp blk");
+		dump_stack();
+	}
+
+	ubi->peb_lookup[pnum].ec =3D ec;
+	ubi->peb_lookup[pnum].status =3D UBIL_PEB_FREE;
+
+	err =3D el_write_node(ubi, group);
+
+	mutex_unlock(&ubi->el_mutex);
+	return err;
+}
+
+/**
+ * ubi_elo_write_ec_hdr_no_sync - in memory update erase count of
+ * physical eraseblock
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @ec: erase count
+ *
+ * This function update erase count of physical eraseblock @pnum
+ * to new value @ec. Modification is done in memory, log entry is
+ * not written.
+ */
+
+int ubi_el_write_ec_hdr_no_sync(struct ubi_device *ubi, int pnum, int ec)
+{
+	dbg_el("writing Ec Header no sync for pnum %d", pnum);
+
+	ubi->peb_lookup[pnum].ec =3D ec;
+	ubi->peb_lookup[pnum].status =3D UBIL_PEB_FREE;
+	return 0;
+}
+
+/**
+ * ubi_el_mark_pending - mark physical eraseblock as erase pending
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ *
+ * This function mark physical eraseblock @pnum as erase pending.
+ */
+
+int ubi_el_mark_pending(struct ubi_device *ubi, int pnum)
+{
+	dbg_el("marking Ec pending in ram for pnum %d", pnum);
+	ubi->peb_lookup[pnum].status =3D UBIL_PEB_ERASE_PENDING;
+	return 0;
+}
+
+/**
+ * ubi_el_read_vid_hdr - read vid header
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @vid_hdr: vid header
+ * @verbose:
+ *
+ * This function reads vid header for physical eraseblock @pnum to
+ * @vid_hdr.
+ * @return status of physical eraseblock @pnum.
+ */
+
+int ubi_el_read_vid_hdr(struct ubi_device *ubi, int pnum,
+			struct ubi_vid_hdr *vid_hdr, int verbose)
+{
+
+	memcpy(vid_hdr, &ubi->peb_lookup[pnum].v, UBI_VID_HDR_SIZE);
+	return ubi->peb_lookup[pnum].status;
+}
+
+/**
+ * ubi_el_write_vid_hdr - write vid header
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @vid_hdr: vid header
+ * @verbose:
+ *
+ * This function updates vid hdr in el.
+ * @returns 0 on success, error code other wise.
+ */
+
+int ubi_el_write_vid_hdr(struct ubi_device *ubi, int pnum,
+			 struct ubi_vid_hdr *vid_hdr)
+{
+
+	int group =3D pnum / ubi->el_pebs_in_grp;
+	int err;
+
+	dbg_el("writing vid hdr in ram for Pnum %d grp %d", pnum, group);
+
+	mutex_lock(&ubi->el_mutex);
+	if (paronoid_check_special(ubi, pnum)) {
+		ubi_err("overwritng ec of sp blk");
+		dump_stack();
+	}
+
+	memcpy(&ubi->peb_lookup[pnum].v, vid_hdr, UBI_VID_HDR_SIZE);
+	ubi->peb_lookup[pnum].status =3D UBIL_PEB_USED;
+
+	err =3D el_write_node(ubi, group);
+	mutex_unlock(&ubi->el_mutex);
+	return err;
+}
+
+#endif
