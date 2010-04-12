Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F7s-0005GV-Q2
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:17 +0000
Received: by pwj4 with SMTP id 4so487987pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:36:11 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:11 +0530
Message-ID: <i2j6b5362aa1004120136q95d58cf2i2ba56a80eb047fdd@mail.gmail.com>
Subject: PATCH 3/7] ubi: logging feature for ubi
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

Note: commit for logging feature

Signed-off-by: Rohit Dongre <rohit.dongre@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/commit.c	1970-01-01 05:30:00.000000000 +0530
+++ ubi_new/drivers/mtd/ubi/commit.c	2010-04-09 21:54:02.635580892 +0530
@@ -0,0 +1,1376 @@
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
+ * Author: 	Rohit Dongre
+ * 		Brijesh Singh
+ */
+
+/*
+ * The UBIL commit sub-system.
+ *
+ * Commit module perform checkpointing of valid eba mappings. Whenever el =
calls
+ * commit, checkpointing for valid blocks is done and new el is created fo=
r
+ * further el logging.
+ *
+ * Commit blocks is mirrored to have two copies for valid eba mappings. At
+ * attach time commit blocks are read to get last valid eba mappings.
+ */
+
+
+#include <linux/slab.h>
+#include <linux/crc32.h>
+#include <linux/err.h>
+#ifdef CONFIG_MTD_UBIL_COMPR
+#include <linux/crypto.h>
+#endif
+#include "ubi.h"
+
+#ifdef CONFIG_MTD_UBI_LOGGED
+
+#define COMMIT_HDR_SIZE sizeof(struct cmt_bud_hdr)
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+static struct ubi_compressor lzo_compr =3D {
+	.compr_type =3D 1,
+	.name =3D "lzo",
+	.capi_name =3D "lzo",
+};
+#endif
+
+/**
+ * ubi_schedule_cmt - set flag to perform commit
+ * @ubi_device: UBI device description object
+ *
+ * This function set ubi->schedule_cmt flag if not set and take el lock.
+ *
+ * In order to perform commit operation, el should be locked to avoid
+ * inconsistencies in commit and el.
+ */
+
+void ubi_schedule_cmt(struct ubi_device *ubi)
+{
+	if (!ubi->schedule_cmt) {
+		/* Take el mutex */
+		mutex_lock(&ubi->el_mutex);
+		/* Set flag to do commit operation*/
+		ubi->schedule_cmt =3D 1;
+	}
+}
+
+/**
+ * ubi_ensure_cmt - perform commit operation if required
+ * @ubi_device: UBI device description object
+ *
+ * This function check ubi->schedule_cmt flag, if set commit operation is
+ * called. Otherwise function do nothing and return success.
+ *
+ * During ubi attach operation if error occures in commit read or el scan
+ * operation, ubi->schedule_cmt is set. If flag is set, commit operation i=
s
+ * performed. After performing commit flag is reset and el lock is release=
d.
+ *
+ * If commit operation fails negative error code is returned,
otherwise function
+ * return %0 on success.
+ */
+
+int ubi_ensure_cmt(struct ubi_device *ubi)
+{
+	int err =3D 0;
+
+	if (!ubi->schedule_cmt)
+		return 0;
+
+	ubi_msg("Recovering ubi");
+	err =3D ubi_cmt(ubi);
+	/*
+	 * If commit operation fails, then ubi is switched to read-only mode.
+	 * So if ubi_cmt() return failure, ubi is already in read-only mode,
+	 * same error is returned and we release el mutex.
+	 */
+	ubi->schedule_cmt =3D 0;
+	mutex_unlock(&ubi->el_mutex);
+	return err;
+}
+
+/**
+ * paranoid_check_reservd_status - check status of active reserved blocks
+ * @ubi_device: UBI device description object
+ *
+ * This function check status of active reserved blocks. All reserved bloc=
ks
+ * must have UBIL_PEB_USED_SP status. If active reserved block is found wi=
th
+ * wrong status, function return %-1, otherwise return %0.
+ */
+
+int paranoid_check_reservd_status(struct ubi_device *ubi)
+{
+	int i, pnum;
+
+	dbg_cmt("paranoid check cmt rsvd blck status ");
+
+	for (i =3D 0; i < be32_to_cpu(ubi->sb_node->cmt_next_buds); i++) {
+		pnum =3D be32_to_cpu(ubi->sb_node->buds[i]);
+		if (ubi->peb_lookup[pnum].status !=3D UBIL_PEB_USED_SP)
+			return -1;
+	}
+	return 0;
+}
+
+/**
+ * paranoid_check_special - verify bud is reserved bud
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock to verify
+ *
+ * This function check whether @pnum is reserved bud. If @pnum is a reserv=
ed
+ * function return 1. If @in_pnum is not a reserved bud then return %0.
+ */
+
+int paranoid_check_special(struct ubi_device *ubi, int pnum)
+{
+	int resvd_pnum, act_bud, bud;
+	struct ubi_sb *sb ;
+
+	sb =3D ubi->sb_node;
+	act_bud =3D be32_to_cpu(sb->cmt_next_buds);
+
+	for (bud =3D 0; bud < act_bud; bud++) {
+		resvd_pnum =3D be32_to_cpu(sb->buds[bud]);
+		if (pnum =3D=3D resvd_pnum)
+			return 1;
+	}
+	return 0;
+}
+
+/**
+ * ubi_cmt_progress - check commit status
+ * @ubi_device: UBI device description object
+ *
+ * This function returns status of commit operation. Commit opeation consi=
st of
+ * different sub-operations. Depending on status, function return any one =
of
+ * the following status
+ *	C_FREE - no commit operation
+ *	C_STARTED - started commit operation
+ *	C_WRITING - writing commit to device
+ *	C_FINISHED - finished write operation
+ *	C_FAILED - commit operation failed
+ */
+
+int ubi_cmt_progress(struct ubi_device *ubi)
+{
+	int status =3D 0;
+	spin_lock(&ubi->cmt_lock);
+	status =3D ubi->c_status;
+	spin_unlock(&ubi->cmt_lock);
+	return status;
+}
+
+
+/**
+ * ubi_cmt_init - initialize commit sub-system
+ * @ubi_device: UBI device description object
+ *
+ * This function initialize commit sub-system. If memory allocation fails
+ * function return negative error code and zero in case of success.
+ */
+int ubi_cmt_init(struct ubi_device *ubi)
+{
+	dbg_cmt("initializing commit");
+
+	ubi->c_buds =3D kmalloc(ubi->c_reservd_buds * UBIL_CMT_COPIES
+						 * sizeof(int), GFP_KERNEL);
+	if (!ubi->c_buds) {
+		ubi_err("could not allocate memory");
+		return -ENOMEM;
+	}
+	/* Calculate maximum count of rec in one commit bud */
+	ubi->c_max_no_of_rec =3D ubi->c_max_data_size / UBIL_EL_REC_SIZE ;
+
+	/* Set commit status */
+	ubi->c_status 		=3D C_FREE;
+	ubi->c_dirty		=3D C_CLEAN;
+	ubi->c_previous_status 	=3D UBIL_CMT_WRITE_SUCCESS;
+	/* Initialize commit lock */
+	spin_lock_init(&ubi->cmt_lock);
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+	ubi->compr =3D &lzo_compr;
+	ubi->compr->cc =3D crypto_alloc_comp(ubi->compr->capi_name, 0, 0);
+#endif
+	ubi_msg("commit max data size:	 %d bytes", ubi->c_max_data_size);
+	ubi_msg("commit max no of records:   %d", ubi->c_max_no_of_rec);
+
+	return 0;
+}
+
+
+/**
+ * cmt_start - gather reserved buds for commit operation
+ * @ubi_device: UBI device description object
+ *
+ * This function gather required count of reserved buds for commit
+ * operation. Status of each new bud is set to UBIL_PEB_USED_SP. If
+ * required reserved buds are collected, sb is updated to have
+ * information about new reserved buds.
+ *
+ * Funtion returs zero on success and negative error code in failures.
+ */
+static int cmt_start(struct ubi_device *ubi)
+{
+	int err, pnum, bud_index, peb_count =3D 0;
+	struct ubi_sb *sb;
+
+	dbg_cmt("commit starting ");
+	/* Get sb */
+	sb =3D ubi_sb_get_node(ubi);
+
+	peb_count =3D UBIL_CMT_COPIES * ubi->c_reservd_buds;
+	peb_count +=3D ubi->el_reservd_buds ;
+
+	/* Index for storing new reserved bud info in sb->buds[]*/
+	bud_index =3D be32_to_cpu(sb->cmt_next_buds);
+
+	dbg_cmt("commit start getting pebs from wl");
+
+	while (peb_count > 0) {
+		/* Get reserved bud */
+		pnum =3D ubi_wl_get_peb(ubi, UBIL_RESVD);
+		if (pnum < 0) {
+			ubi_err("unable get peb for commit");
+			err =3D -pnum;
+			goto unlock_sb;
+		}
+		/* Mark reserved bud as special */
+		ubi->peb_lookup[pnum].status 	=3D UBIL_PEB_USED_SP;
+		/* update sb */
+		sb->buds[bud_index++] 		=3D cpu_to_be32(pnum);
+		peb_count--;
+		dbg_cmt("\t%d", pnum);
+	}
+	dbg_cmt("\n");
+
+	/* Set commit status as invalide in sb */
+	sb->cmt_status =3D cpu_to_be32(UBIL_CMT_INVALID);
+	/* sync sb to store reserved bud information */
+	err =3D ubi_sb_sync_node(ubi);
+	if (err) {
+		ubi_err("sb sync failed");
+		goto unlock_sb;
+	}
+
+unlock_sb:
+	ubi_sb_put_node(ubi);
+	return err;
+}
+
+/**
+ * cmt_end - finish commit write process
+ * @ubi_device: UBI device description object
+ *
+ * This function complete commmit operation, by writing new sb to device. =
After
+ * successfull sb write operation, status of new reserved buds is changed =
in
+ * RAM. After successfully updation, old reserved bud are put to wear-leav=
eling
+ * sub-system.
+ *
+ * If wl_put_peb operation fails, we go to read-only mode. In case of
+ * success function returns %0 otherwise return negative error code.
+ */
+static int cmt_end(struct ubi_device *ubi)
+{
+
+	int copy, cmt_bud, el_bud, pnum, err ;
+	int act_bud, bud;
+	int *old_pebs, index;
+
+	struct ubi_sb *sb ;
+	/* Get sb */
+	sb =3D ubi_sb_get_node(ubi);
+
+	old_pebs =3D kmalloc(sizeof(int) * be32_to_cpu(sb->cmt_next_buds),
+								GFP_KERNEL);
+	if (!old_pebs) {
+		ubi_err("error allocating memory");
+		ubi_sb_put_node(ubi);
+		return -ENOMEM;
+	}
+
+	act_bud =3D be32_to_cpu(sb->cmt_next_buds);
+	/* Update new reserved bud information in sb */
+	for (bud =3D 0; bud < act_bud; bud++) {
+		pnum 		=3D be32_to_cpu(sb->buds[act_bud + bud]);
+		old_pebs[bud] 	=3D be32_to_cpu(sb->buds[bud]);
+		sb->buds[bud] 	=3D cpu_to_be32(pnum);
+		/* Flush buffer reserved bud information */
+		sb->buds[act_bud + bud] =3D cpu_to_be32(-1);
+	}
+	/* Set commit status */
+	sb->cmt_status =3D cpu_to_be32(UBIL_CMT_WRITE_SUCCESS);
+	/* write sb to flash */
+	err =3D ubi_sb_sync_node(ubi);
+	if (err) {
+		ubi_err("sb sync error ");
+		ubi_sb_put_node(ubi);
+		goto out_free;
+	}
+	/* Release sb */
+	ubi_sb_put_node(ubi);
+
+	/* Update el and commit information in memory*/
+	bud =3D 0;
+	dbg_cmt("commit end marking el SP ");
+	for (el_bud =3D 0; el_bud < ubi->el_reservd_buds; el_bud++) {
+		/* Update el bud list */
+		ubi->el_buds[el_bud] =3D be32_to_cpu(sb->buds[bud]);
+		/* Update el bud status */
+		ubi->peb_lookup[be32_to_cpu(sb->buds[bud])].status
+							=3D UBIL_PEB_USED_SP;
+		dbg_cmt(" %d ", be32_to_cpu(sb->buds[bud]));
+		bud++;
+	}
+	dbg_cmt("\n");
+
+	dbg_cmt("commit end marking commit SP ");
+	for (copy =3D 0; copy < UBIL_CMT_COPIES; copy++)
+		for (cmt_bud =3D 0; cmt_bud < ubi->c_reservd_buds;
+							 cmt_bud++) {
+			index =3D copy * ubi->c_reservd_buds + cmt_bud;
+			/* Update commit bud list */
+			ubi->c_buds[index] =3D be32_to_cpu(sb->buds[bud]);
+			/* Update commit bud status */
+			ubi->peb_lookup[be32_to_cpu(sb->buds[bud])].status
+							=3D UBIL_PEB_USED_SP;
+
+			dbg_cmt(" %d ", be32_to_cpu(sb->buds[bud]));
+			bud++;
+		}
+	dbg_cmt("\n");
+
+	dbg_cmt("commit end putting pebs");
+	/* Put old reserved buds to wl */
+	while (--bud >=3D 0) {
+		dbg_cmt("\t%d", old_pebs[bud]);
+		err =3D ubi_wl_put_peb(ubi, old_pebs[bud], 0);
+		if (err) {
+			/* If ubi_wl_put_peb fails, then commit is
+			 * consistent, but old special buds may
+			 * not be recovered. At present we continue
+			 * working in read-only mode.
+			 */
+			ubi_err("error while putting reserved PEBs");
+			ubi_ro_mode(ubi);
+			err =3D 0;
+			goto out_free;
+		}
+	}
+	dbg_cmt("\n");
+
+	err =3D paronoid_check_reservd_status(ubi);
+	if (err < 0) {
+		ubi_err("reserved peb status wrong after commit");
+		kfree(old_pebs);
+		return err;
+	}
+out_free:
+	kfree(old_pebs);
+	return err;
+}
+
+/**
+ * cmt_write_bud_header - write commit header
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock
+ * @bud_hdr: commit header to be written
+ *
+ * Returns zero in case of success and negative error code in case
+ * of failure.
+ */
+
+static int cmt_write_bud_header(struct ubi_device *ubi, int pnum,
+					 struct cmt_bud_hdr *bud_hdr)
+{
+
+	int err, crc, data_size ;
+
+	bud_hdr->MAGIC 		=3D cpu_to_be32(UBIL_CMT_BUD_HDR_MAGIC);
+	bud_hdr->cmt_version	=3D cpu_to_be32(UBIL_CMT_VERSION);
+	bud_hdr->lh.node_type 	=3D cpu_to_be32(UBIL_CMT_NODE_T);
+	data_size		=3D sizeof(struct cmt_bud_hdr) -
+							 sizeof(struct node_t);
+	bud_hdr->lh.data_size 	=3D cpu_to_be32(data_size);
+	crc =3D crc32(UBI_CRC32_INIT, bud_hdr->lh.data, data_size);
+
+	bud_hdr->lh.data_crc	=3D cpu_to_be32(crc);
+	err =3D ubi_write_node(ubi, node2lnode(bud_hdr), pnum, 0,
+							ubi->node_size);
+		if (err)
+			ubi_err("commit header write failed");
+
+	return err ;
+}
+
+/**
+ * cmt_write_data - write data to commit bud
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock to write data
+ * @buf: buffer with data to write
+ * @offset: offset within the physical eraseblock where to write
+ * @len: how many bytes to write
+ *
+ * This function writes data on physical eraseblock @pnum to offset @offse=
t.
+ * In case of success returns zero, otherwise return negative erro code.
+ */
+
+static int cmt_write_data(struct ubi_device *ubi, int pnum,
+					void *buf, int offset, int len)
+{
+
+	int data_size =3D ALIGN(len, ubi->node_size);
+	ubi_assert(offset >=3D 0);
+	return ubi_io_write(ubi, buf, pnum, offset, data_size);
+}
+
+/**
+ * update_peb_status - change peb status in write buffer
+ * @ubi_device: UBI device description object
+ * @buf: buffer with data
+ * @bud: commit bud
+ *
+ * This function change status of reserved pebs in buffer @buf.
+ *
+ * In commit operation, present peb status from ubi->peb_lookup are
+ * written to device. If status of peb is changed in memory before
+ * writing commit to device, in case of fail write operations, peb_lookup
+ * will not be consistent.
+ *
+ * So updating peb status is deffered till writing to device is not done. =
In
+ * write operation, peb status is updated only in write buffer. In this
+ * function, write buffer is updated to contain latest peb status.
+ */
+
+static void update_peb_status(struct ubi_device *ubi, void * buf, int bud)
+{
+	int peb_count, index =3D 0, start_peb, end_peb, offset;
+	struct ubi_sb *sb =3D ubi->sb_node;
+	struct peb_info *el_rec;
+
+	el_rec =3D (struct peb_info *)buf;
+
+	start_peb =3D bud * ubi->c_max_no_of_rec;
+	end_peb =3D start_peb + ubi->c_max_no_of_rec;
+
+	if (end_peb > ubi->peb_count)
+		end_peb =3D ubi->peb_count;
+
+	peb_count =3D UBIL_CMT_COPIES * ubi->c_reservd_buds;
+	peb_count +=3D ubi->el_reservd_buds;
+
+	/* Update old reserved peb status to UBIL_PEB_ERASE_PENDING */
+	dbg_cmt("commit start updating status Pending ");
+	while (--peb_count >=3D 0) {
+		if (be32_to_cpu(sb->buds[index]) < end_peb &&
+			be32_to_cpu(sb->buds[index]) >=3D start_peb) {
+				dbg_cmt("pnum %d",
+						 be32_to_cpu(sb->buds[index]));
+				offset =3D  be32_to_cpu(sb->buds[index])
+						% ubi->c_max_no_of_rec;
+				(el_rec + offset)->status
+						=3D UBIL_PEB_ERASE_PENDING;
+				index++;
+		}
+	}
+	dbg_cmt("\n");
+
+	peb_count =3D UBIL_CMT_COPIES * ubi->c_reservd_buds;
+	peb_count +=3D ubi->el_reservd_buds;
+
+	/* Update new reserved peb status to UBIL_PEB_USED_SP */
+	dbg_cmt("\n commit start updating status SPECL ");
+	while (--peb_count >=3D 0) {
+		if (be32_to_cpu(sb->buds[index]) < end_peb)
+			if (be32_to_cpu(sb->buds[index]) >=3D start_peb) {
+				dbg_cmt("pnum %d",
+						 be32_to_cpu(sb->buds[index]));
+				offset =3D  be32_to_cpu(sb->buds[index])
+						% ubi->c_max_no_of_rec;
+				(el_rec + offset)->status
+						=3D UBIL_PEB_USED_SP;
+				index++;
+			}
+	}
+	dbg_cmt("\n");
+}
+
+/**
+ * write_record - write one peb_info record to buffer
+ * @ubi_device: UBI device description object
+ * @buf: buffer for storing peb information
+ * @pnum: physical eraseblock whose information is written to buffer
+ *
+ * This function write physical eraseblock @pnum information from
+ * ubi->peb_lookup to buffer @buf.
+ */
+
+static int write_record(struct ubi_device *ubi, void *buf, int pnum)
+{
+	struct peb_info *peb_rec;
+
+	peb_rec =3D &(ubi->peb_lookup[pnum]);
+	memcpy(buf, peb_rec, sizeof(struct peb_info));
+
+	return 0;
+}
+
+/**
+ * prepare_write_buffer - prepare commit write buffer
+ * @ubi_device: UBI device description object
+ * @buf: buffer for storing peb information
+ * @bud: commit bud
+ *
+ * This function populate buffer for writing commit bud @bud. Each commit =
bud
+ * can contain peb information for fixed set of pebs. So peb information o=
f
+ * specific peb will always present in unique commit bud.
+ *
+ * peb information for pebs present in commit bud @bud is written to @buf =
from
+ * ubi->peb_lookup. Function return size of data written to buffer on succ=
es.
+ * In case of failure function return negative error code
+ */
+
+static int prepare_write_buffer(struct ubi_device *ubi, void *buf, int bud=
)
+{
+	unsigned int data_size =3D 0, peb_count, start_peb, err;
+
+	start_peb =3D bud * ubi->c_max_no_of_rec;
+	peb_count =3D ubi->c_max_no_of_rec;
+
+	memset(buf, 0xFF, ubi->c_max_data_size);
+	while (peb_count-- && start_peb < ubi->peb_count) {
+		/* Write one record to buffer */
+		err =3D write_record(ubi, buf, start_peb);
+		if (err) {
+			ubi_err("error in copying record");
+			return err;
+		}
+		/* Update data size */
+		data_size =3D data_size + UBIL_EL_REC_SIZE;
+		start_peb++;
+		/* Go to next record location in buffer */
+		buf =3D buf + UBIL_EL_REC_SIZE;
+	}
+	return data_size;
+}
+
+/**
+ * cmt_write - write commit buds
+ * @ubi_device: UBI device description object
+ *
+ * This function write peb information to commit bud/s and create new el.
+ *
+ * In commit operation, peb information is written to commit buds. As lete=
st
+ * peb information is written to device, present el is redundant. Thus, in
+ * commit write, new el is created.
+ *
+ * Each commit bud contain information for fixed set of pebs. In commit wr=
ite
+ * each commit bud is written one at a time. Since commit is maintained in=
 two
+ * copies, bud write operation is done for each commit copy.
+ *
+ * On success return %0, else return negative error code.
+ */
+
+static int cmt_write(struct ubi_device *ubi)
+{
+	int copy, cmt_bud =3D 0, el_bud;
+	int count, pnum, data_size, index;
+	int err =3D 0, crc;
+	void *buf;
+	struct ubi_sb *sb ;
+	struct cmt_bud_hdr bud_hdr;
+#ifdef CONFIG_MTD_UBIL_COMPR
+	void *compr_buf;
+	int compr_data_size =3D ubi->c_max_data_size;
+#endif
+
+	sb =3D ubi_sb_get_node(ubi);
+	/* Write buffer */
+	buf =3D vmalloc(ubi->c_max_data_size);
+	if (!buf) {
+		ubi_err("memmory allocation failed");
+		goto no_buf_memory;
+	}
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+	/* Write buffer */
+	compr_buf =3D vmalloc(ubi->c_max_data_size);
+	if (!compr_buf) {
+		ubi_err("memmory allocation failed");
+		vfree(buf);
+		return -ENOMEM;
+	}
+#endif
+	count =3D be32_to_cpu(sb->cmt_next_buds);
+	/* Create new el */
+	for (el_bud =3D 0; el_bud < ubi->el_reservd_buds; el_bud++) {
+		err =3D ubi_el_create_dflt(ubi, el_bud,
+					be32_to_cpu(sb->buds[count]));
+		if (err) {
+			ubi_err("error in creating default el");
+			goto write_error;
+		}
+		count++;
+	}
+	/* Reset el offset */
+	ubi->el_active_bud =3D 0;
+	ubi->el_offset =3D 0;
+
+	/* Write each commit bud */
+	while (cmt_bud < ubi->c_reservd_buds) {
+
+		data_size =3D prepare_write_buffer(ubi, buf, cmt_bud);
+		if (data_size < 0) {
+			ubi_err("error in filling write buffer");
+			err =3D -EINVAL;
+			goto write_error;
+		}
+
+		update_peb_status(ubi, buf, cmt_bud);
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+		err =3D crypto_comp_compress(ubi->compr->cc, buf, data_size,
+				compr_buf, (unsigned int *)&compr_data_size);
+		dbg_cmt("commit data of %d size, compressed to size %d",
+						 data_size, compr_data_size);
+		if (err) {
+			ubi_err("error compressing data");
+			goto write_error;
+		}
+#endif
+		/* For each commit copy */
+		for (copy =3D 0; copy < UBIL_CMT_COPIES; copy++) {
+
+			index =3D count + copy * ubi->c_reservd_buds;
+			index +=3D cmt_bud;
+
+			pnum =3D be32_to_cpu(sb->buds[index]);
+			ubi_assert(pnum >=3D 0);
+
+#ifndef CONFIG_MTD_UBIL_COMPR
+			err =3D cmt_write_data(ubi , pnum, buf,
+					ubi->node_size, data_size);
+#else
+			err =3D cmt_write_data(ubi , pnum, compr_buf,
+				 ubi->node_size, compr_data_size);
+#endif
+			if (err) {
+				ubi_err("commit write data error ");
+				goto write_error;
+			}
+
+			/* Calculate data crc */
+#ifndef CONFIG_MTD_UBIL_COMPR
+			crc =3D crc32(UBI_CRC32_INIT, buf, data_size);
+			bud_hdr.data_crc 	=3D cpu_to_be32(crc);
+			bud_hdr.data_size 	=3D cpu_to_be32(data_size);
+#else
+			crc =3D crc32(UBI_CRC32_INIT, compr_buf, compr_data_size);
+			bud_hdr.data_crc 	=3D cpu_to_be32(crc);
+			bud_hdr.data_size 	=3D cpu_to_be32(compr_data_size);
+#endif
+
+			/* Write commit header */
+			err =3D cmt_write_bud_header(ubi, pnum, &bud_hdr) ;
+			if (err) {
+				ubi_err("commit write header error ");
+				goto write_error ;
+			}
+		}
+		cmt_bud++;
+	}
+write_error:
+	ubi_sb_put_node(ubi);
+#ifdef CONFIG_MTD_UBIL_COMPR
+	vfree(compr_buf);
+#endif
+	vfree(buf);
+	return err ;
+no_buf_memory:
+	ubi_sb_put_node(ubi);
+	return -ENOMEM ;
+}
+
+
+/**
+ * cmt_write_no_wl - write commit at ubinize time
+ * @ubi_device: UBI device description object
+ *
+ * This function is used for creating default commit at ubinize time.
+ *
+ * During ubinize time wl is not initialized. It is not possible to gather=
 pebs
+ * from wl. Pebs are gathered explicitely and are used for writing commit =
buds.
+ *
+ * This funtion return zero in case of success and negative error code
+ * otherwise.
+ */
+
+static int cmt_write_no_wl(struct ubi_device *ubi)
+{
+
+	int copy, pnum, cmt_bud ;
+	int crc, data_size, err =3D 0, index;
+#ifdef CONFIG_MTD_UBIL_COMPR
+	void *compr_buf;
+	int compr_data_size =3D ubi->c_max_data_size;
+#endif
+	struct cmt_bud_hdr bud_hdr ;
+	void *buf;
+
+
+	/* Write buffer */
+	buf =3D vmalloc(ubi->c_max_data_size);
+	if (!buf) {
+		ubi_err("memmory allocation failed");
+		return -ENOMEM;
+	}
+#ifdef CONFIG_MTD_UBIL_COMPR
+	/* Write buffer */
+	compr_buf =3D vmalloc(ubi->c_max_data_size);
+	if (!compr_buf) {
+		ubi_err("memmory allocation failed");
+		vfree(buf);
+		return -ENOMEM;
+	}
+#endif
+
+	cmt_bud =3D 0;
+	/* For each commit bud */
+	while (cmt_bud < ubi->c_reservd_buds) {
+		/* Populate write buffer */
+		data_size =3D prepare_write_buffer(ubi, buf, cmt_bud);
+		if (data_size <=3D 0) {
+			ubi_err("error in fillind write buffer");
+			goto write_error;
+		}
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+		err =3D crypto_comp_compress(ubi->compr->cc, buf, data_size,
+				compr_buf, (unsigned int *)&compr_data_size);
+		dbg_cmt("commit data of %d size, compressed to size %d",
+						data_size, compr_data_size);
+		if (err) {
+			ubi_err("error compressing data");
+			goto write_error;
+		}
+#endif
+
+		for (copy =3D 0; copy < UBIL_CMT_COPIES; copy++) {
+			/* Get physical eraseblock number for write */
+			index =3D copy * ubi->c_reservd_buds + cmt_bud;
+			pnum =3D ubi->c_buds[index];
+
+			/* Write data to commit bud */
+#ifndef CONFIG_MTD_UBIL_COMPR
+			err =3D cmt_write_data(ubi , pnum, buf,
+					ubi->node_size, data_size);
+#else
+			err =3D cmt_write_data(ubi , pnum, compr_buf,
+					ubi->node_size, compr_data_size);
+#endif
+			if (err) {
+				ubi_err("commit write data error ");
+				goto write_error ;
+			}
+
+			/* Calculate data crc */
+#ifndef CONFIG_MTD_UBIL_COMPR
+			crc =3D crc32(UBI_CRC32_INIT, buf, data_size);
+			bud_hdr.data_crc 	=3D cpu_to_be32(crc);
+			bud_hdr.data_size 	=3D cpu_to_be32(data_size);
+#else
+			crc =3D crc32(UBI_CRC32_INIT, compr_buf, compr_data_size);
+			bud_hdr.data_crc 	=3D cpu_to_be32(crc);
+			bud_hdr.data_size 	=3D cpu_to_be32(compr_data_size);
+#endif
+			/* Write commit header */
+			err =3D cmt_write_bud_header(ubi, pnum, &bud_hdr) ;
+			if (err) {
+				ubi_err("commit write header error ");
+				goto write_error ;
+			}
+		}
+		cmt_bud++;
+	}
+
+write_error:
+#ifdef CONFIG_MTD_UBIL_COMPR
+	vfree(compr_buf);
+#endif
+	vfree(buf);
+	return err ;
+}
+
+/**
+ * cmt_update_sb - Update sb
+ * @ubi_device: UBI device description object
+ *
+ * This function update sb with reserved peb information.
+ */
+static void cmt_update_sb(struct ubi_device *ubi)
+{
+	int pnum, copy, peb_count;
+	int bud =3D 0, data_size =3D 0, index;
+
+	struct ubi_sb *sb =3D ubi->sb_node;
+
+	sb->cmt_resrvd_buds =3D cpu_to_be32(ubi->c_reservd_buds);
+
+	/* Update el bud list*/
+	for (pnum =3D 0; pnum < ubi->el_reservd_buds; pnum++) {
+		sb->buds[bud++]  =3D cpu_to_be32(ubi->el_buds[pnum]);
+		data_size +=3D sizeof(int);
+	}
+
+	/* Update commit bud list */
+	for (copy =3D 0; copy < UBIL_CMT_COPIES; copy++) {
+		for (pnum =3D 0; pnum < ubi->c_reservd_buds; pnum++) {
+			index =3D copy * ubi->c_reservd_buds + pnum;
+			sb->buds[bud++] =3D cpu_to_be32(ubi->c_buds[index]);
+			data_size +=3D sizeof(int);
+		}
+	}
+
+	peb_count =3D UBIL_CMT_COPIES * ubi->c_reservd_buds ;
+	peb_count +=3D ubi->el_reservd_buds;
+
+	/* Set starting offset of buffer reserved buds */
+	sb->cmt_next_buds =3D cpu_to_be32(peb_count);
+
+	/* Flush buffer reserved buds information*/
+	for (pnum =3D 0; pnum < peb_count; pnum++) {
+		sb->buds[bud++] =3D cpu_to_be32(-1);
+		data_size +=3D sizeof(int);
+	}
+	/* Set comit status */
+	sb->cmt_status =3D cpu_to_be32(UBIL_CMT_WRITE_SUCCESS) ;
+}
+
+/**
+ * ubi_cmt_ubinize_write - create default commit
+ * @ubi_device: UBI device description object
+ *
+ * This function creates default commit. On successfull write of default
+ * commit, accordingly sb is also updated. So, when next time sb is writtn=
e
+ * updated commit information is also written.
+ * Function returns zero on success and negative error code in case of fai=
lure.
+ */
+
+int ubi_cmt_ubinize_write(struct ubi_device *ubi)
+{
+	int err;
+	dbg_cmt("Starting ubinize commit write");
+	err =3D cmt_write_no_wl(ubi);
+	if (err) {
+		ubi_err("error writing commit copy to flash");
+		return err;
+	}
+	/* update sb */
+	cmt_update_sb(ubi);
+	return err;
+}
+
+/**
+ * read_record - read one peb_info  record from buffer
+ * @ubi_device: UBI device description object
+ * @buf: buffer for reading peb information
+ * @pnum: physical eraseblock whose information is read from buffer
+ *
+ * This function read physical eraseblock @pnum information from buffer @b=
uf to
+ * ubi->peb_lookup table. Functions returns zero on success and negative e=
rror
+ * code is returned on failure.
+ */
+static int read_record(struct ubi_device *ubi, void *buf, int pnum)
+{
+
+	struct peb_info *peb_rec;
+
+	peb_rec =3D &(ubi->peb_lookup[pnum]);
+	memcpy(peb_rec, buf, sizeof(struct peb_info));
+
+	return 0;
+}
+
+/**
+ * prepare_read_buffer - read one el record from buffer
+ * @ubi_device: UBI device description object
+ * @buf: buffer for reading peb information
+ * @bud: commit bud
+ *
+ * This function read information about pebs present in commit bud @bud fr=
om
+ * buffer @buf. Read information is used to populates ubi->peb_lookup tabl=
e.
+ * On success function return zero else return error code.
+ */
+
+static int prepare_read_buffer(struct ubi_device *ubi, void *buf, int bud)
+{
+	int peb_count, err =3D 0, start_peb;
+
+	start_peb =3D bud * ubi->c_max_no_of_rec ;
+	peb_count =3D ubi->c_max_no_of_rec ;
+
+	while (peb_count-- && start_peb < ubi->peb_count) {
+		/* Read one record from buffer */
+		err =3D read_record(ubi, buf, start_peb);
+		if (err) {
+			ubi_err("error in reading commit record");
+			return err;
+		}
+		start_peb++;
+		/* Go to next record in buffer */
+		buf =3D buf + UBIL_EL_REC_SIZE;
+	}
+	return err;
+}
+
+/**
+ * cmt_read_bud_header - read commit bud header
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraeblock
+ * @bud_hdr: commit header
+ *
+ * This function reads commit header for physical eraseblock @pnum to @bud=
_hdr.
+ * On successful read operations function return zero else return negative
+ * error code.
+ */
+
+static int cmt_read_bud_header(struct ubi_device *ubi, int pnum,
+					struct cmt_bud_hdr *bud_hdr)
+{
+	int err, crc, data_size;
+
+	err =3D ubi_read_node(ubi, node2lnode(bud_hdr), pnum, 0, ubi->node_size);
+	if (err) {
+		if (err !=3D -EBADMSG || err !=3D UBI_IO_BITFLIPS)
+			return err;
+	}
+
+	data_size =3D be32_to_cpu(bud_hdr->lh.data_size);
+
+	crc =3D crc32(UBI_CRC32_INIT, bud_hdr->lh.data, data_size);
+	if (crc !=3D be32_to_cpu(bud_hdr->lh.data_crc)) {
+		ubi_err("CRC Mismatch");
+		return -EBADMSG;
+	}
+
+	if (be32_to_cpu(bud_hdr->MAGIC) !=3D UBIL_CMT_BUD_HDR_MAGIC) {
+		ubi_err("commit block header magic incorrect");
+		return -EINVAL ;
+	}
+
+	if (be32_to_cpu(bud_hdr->cmt_version) !=3D UBIL_CMT_VERSION) {
+		ubi_err("commit block incorrect log version");
+		return -EINVAL ;
+	}
+	if (be32_to_cpu(bud_hdr->lh.node_type) !=3D UBIL_CMT_NODE_T) {
+		ubi_err("commit block incorrect log type");
+		return -EINVAL;
+	}
+
+	return err ;
+}
+
+/**
+ * cmt_read_data - read commit bud data
+ * @ubi_device: UBI device description object
+ * @pnum: physical eraseblock for reading
+ * @buf: buffer to read data
+ * @offset: offset within the physical eraseblock where to read
+ * @len: how many bytes to read
+ *
+ * This function reads data from physical eraseblock @pnum to buffer
+ * @buf. In case of success returns zero, otherwise return negative erro c=
ode.
+ */
+
+static int cmt_read_data(struct ubi_device *ubi, int pnum,
+					 void *buf, int offset, int len)
+{
+	int data_size =3D ALIGN(len, ubi->node_size);
+	ubi_assert(offset >=3D 0);
+	return  ubi_io_read(ubi, buf, pnum, offset, data_size);
+}
+
+/**
+ * commit_read_bud - read commit bud
+ * @ubi_device: UBI device description object
+ * @buf: buffer to read bud
+ * @bud: commit bud to read
+ * @active_copy: active commit copy
+ *
+ * Commit is maintained in two copies. This function read commit bud
+ * @bud from copy @active_copy to buffer @buf. If read operation is
+ * successfull function return zero.
+ *
+ * If error is BITFLIPS or EBADMSG then ubi->schedule_cmt flag is set
+ * to recover from erronious cndition and read continue furhter processing=
.
+ * But in case of any other error read operation do not proceed and same
+ * error code is returned.
+ */
+
+static int cmt_read_bud(struct ubi_device *ubi,
+				void *buf, int cmt_bud, int active_copy)
+{
+	int err, crc, data_size, index;
+	struct cmt_bud_hdr *bud_hdr;
+#ifdef CONFIG_MTD_UBIL_COMPR
+	void *decompr_buf;
+	int decompr_data_size =3D ubi->c_max_data_size;
+#endif
+
+	bud_hdr =3D alloc_nodes(ubi, 1);
+	if (!bud_hdr) {
+		ubi_err("out of memory");
+		return -ENOMEM;
+	}
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+	/* Write buffer */
+	decompr_buf =3D vmalloc(ubi->c_max_data_size);
+	if (!decompr_buf) {
+		ubi_err("memmory allocation failed");
+		free_nodes(bud_hdr);
+		return -ENOMEM;
+	}
+#endif
+
+	/* Default active copy is first commit copy */
+	index =3D active_copy * ubi->c_reservd_buds + cmt_bud;
+	/* Read commit bud header */
+	err =3D cmt_read_bud_header(ubi, ubi->c_buds[index], bud_hdr);
+	if (err =3D=3D UBI_IO_BITFLIPS || err =3D=3D -EBADMSG) {
+		ubi_err("commit read header bitflip occured");
+		/* Recoverable error occured. Set commit recovery flag */
+		ubi_schedule_cmt(ubi);
+	} else if (err) {
+		ubi_err("commit read header error ");
+		err =3D -EINVAL;
+		goto free_node;
+	}
+
+	data_size =3D be32_to_cpu(bud_hdr->data_size);
+
+	/* Read commit bud data */
+	err =3D cmt_read_data(ubi, ubi->c_buds[index], buf,
+					 ubi->node_size, data_size);
+
+	if (err =3D=3D UBI_IO_BITFLIPS || err =3D=3D -EBADMSG) {
+		/*
+		* bitflip or EBADMSG detected set commit recovery and continue
+		* operation.
+		*/
+		ubi_err("commit read data bitflip occured");
+		ubi_schedule_cmt(ubi);
+	} else if (err) {
+		ubi_err("commit read data error ");
+		err =3D -EINVAL;
+		goto free_node;
+	}
+	/* Calculate data crc */
+	crc =3D crc32(UBI_CRC32_INIT, buf, data_size);
+	if (crc !=3D be32_to_cpu(bud_hdr->data_crc)) {
+		ubi_err("commit block bad data crc");
+		err =3D -EINVAL;
+		goto free_node;
+	}
+
+#ifdef CONFIG_MTD_UBIL_COMPR
+	/* decompress data */
+	err =3D crypto_comp_decompress(ubi->compr->cc, buf, data_size,
+			decompr_buf, (unsigned int *)&decompr_data_size);
+
+	dbg_cmt("commit data of %d size, decompressed to size %d",
+				data_size, decompr_data_size);
+
+	/* populate ubi->peb_lookup from commit bud data */
+	err =3D prepare_read_buffer(ubi, decompr_buf, cmt_bud);
+#else
+	/* Populate ubi->peb_lookup from commit bud data */
+	err =3D prepare_read_buffer(ubi, buf, cmt_bud);
+
+#endif
+	if (err) {
+		ubi_err("fill read buffer error");
+		err =3D -EINVAL;
+		goto free_node;
+	}
+
+free_node:
+#ifdef CONFIG_MTD_UBIL_COMPR
+	vfree(decompr_buf);
+#endif
+	free_nodes(bud_hdr);
+	return err;
+}
+
+/**
+ * ubi_cmt_read - read commit
+ * @ubi_device: UBI device description object
+ *
+ * This function reads the peb_info stored in commit buds.
+ * Each commit bud is read and peb_lookup table is populated. Commit is
+ * maintained in two copies. If read operation from one copy fails, second=
 copy
+ * become active copy and read operation is performed from second copy. On=
ce
+ * copy is switched, each commit bud is read again independent of failure =
point
+ * is first read operation.
+ *
+ * On successful read of commit from either copy function return zero.
+ * If read operation from second copy also fails, commit read operation is
+ * aborted and EINVAL is returned. In case of other failure function retur=
n
+ * negative error code.
+ */
+
+int ubi_cmt_read(struct ubi_device *ubi)
+{
+	int cmt_bud, err, active_copy =3D 0;
+	char *buf =3D NULL;
+
+	dbg_cmt("reading commit data from flash");
+
+	/* Buffer for reading data */
+	buf =3D vmalloc(ubi->c_max_data_size);
+	if (!buf) {
+		ubi_err("buf memory allocation failed");
+		return -ENOMEM;
+	}
+	memset(buf, 0xFF, ubi->c_max_data_size);
+retry:
+	cmt_bud =3D 0;
+	while (cmt_bud  < ubi->c_reservd_buds) {
+		/* Read one commit bud */
+		err =3D cmt_read_bud(ubi, buf, cmt_bud, active_copy);
+		if (err) {
+
+			ubi_err("process bud read error");
+			goto read_error;
+		}
+		cmt_bud++;
+	}
+	vfree(buf);
+	return 0;
+
+read_error:
+	/* Error occured while reading commit bud.
+	 * If error occure while reading first copy,
+	 * read second commit copy. If reading second
+	 * copy also fails, abort read process.
+	 */
+	if (active_copy =3D=3D 0) {
+		active_copy =3D 1 ;
+		/* Set commit recovery flag  and read second copy */
+		ubi_schedule_cmt(ubi);
+		ubi_msg("switching commit copy");
+		goto retry ;
+	}
+	vfree(buf);
+	return -EINVAL;
+}
+
+/**
+ * ubi_comit_sb_init - initialize commit sub-system from sb
+ * @ubi_device: UBI device description object
+ *
+ * This function reads commit information stored in sb and initialize
+ * commit sub-system.
+ *
+ * This function returns zero on success.
+ */
+
+int ubi_cmt_sb_init(struct ubi_device *ubi)
+{
+
+	int cmt_bud, copy, index, *cmt_peb;
+	struct ubi_sb *sb;
+
+	dbg_cmt("initializing commit from sb data");
+
+	sb =3D ubi->sb_node ;
+	ubi->c_reservd_buds =3D be32_to_cpu(sb->cmt_resrvd_buds);
+
+	ubi_assert(sb);
+	ubi_assert(sb->buds);
+
+	ubi->c_previous_status =3D be32_to_cpu(sb->cmt_status);
+	ubi_msg("previous commit status 	 %s",
+				ubi->c_previous_status ? "Success" : "Failed");
+	/* Initialize peb list of commit */
+	cmt_peb =3D  sb->buds + be32_to_cpu(sb->el_resrvd_buds);
+	for (copy =3D 0; copy < UBIL_CMT_COPIES; copy++) {
+		for (cmt_bud =3D 0; cmt_bud < ubi->c_reservd_buds;
+							 cmt_bud++) {
+			index =3D copy * ubi->c_reservd_buds + cmt_bud;
+			ubi->c_buds[index] =3D be32_to_cpu(*cmt_peb) ;
+			cmt_peb =3D cmt_peb + 1 ;
+		}
+	}
+	return 0 ;
+}
+
+/**
+ * ubi_cmt_close - close commit sub-system
+ * @ubi_device: UBI device description object
+ *
+ */
+
+int ubi_cmt_close(struct ubi_device *ubi)
+{
+	dbg_cmt("freeing commit data structures");
+#ifdef CONFIG_MTD_UBIL_COMPR
+	crypto_free_comp(ubi->compr->cc);
+#endif
+	kfree(ubi->c_buds);
+	return 0;
+}
+
+/* ubi_cmt - perform commit operation
+ * @ubi_device: UBI device description object
+ *
+ * This function write peb_lookup table to commit buds.
+ * Commit is done in following steps
+ * 	1) Start commit
+ * 		- Get new pebs for special blocks
+ * 	2) Write commit buds
+ * 		- Create default el and write commit buds
+ * 	3) End commit
+ * 		- Write updated sb to flash
+ * 		- Do changes in RAM structures.
+ * 		- Put old special buds
+ *
+ * Before starting commit, ubi->c_dirty flag is checked. If write operatio=
n
+ * is not performed since ubi is initialized, then no need to do commit wr=
ite
+ * operation. This flag is set when first write operation is performed.
+ *
+ * On success this function return zero. If any write operations fails
+ * then we go to read-only mode and return negative error code.
+ */
+
+int ubi_cmt(struct ubi_device *ubi)
+{
+	int err ;
+
+	dbg_cmt("closing commit");
+	spin_lock(&ubi->cmt_lock);
+
+	/* Check commit progress status */
+	if (ubi->c_status !=3D C_FREE) {
+		spin_unlock(&ubi->cmt_lock);
+		return -EBUSY;
+	}
+
+	/* Set commit running status to C_STARTED */
+	ubi->c_status =3D C_STARTED;
+	spin_unlock(&ubi->cmt_lock);
+
+	err =3D cmt_start(ubi);
+	if (err) {
+		ubi_err("commit start failed");
+		goto ro_mode;
+	}
+	spin_lock(&ubi->cmt_lock);
+	ubi->c_status =3D C_WRITING;
+	spin_unlock(&ubi->cmt_lock);
+
+	err =3D cmt_write(ubi);
+	if (err) {
+		ubi_err("ubi commit write error ");
+		goto ro_mode;
+	}
+
+	spin_lock(&ubi->cmt_lock);
+	ubi->c_status =3D C_FINISHED;
+	spin_unlock(&ubi->cmt_lock);
+
+	/* Close commit write operation */
+	err =3D cmt_end(ubi);
+	if (err) {
+		ubi_err("ubi commit end error");
+		goto ro_mode;
+	}
+
+	spin_lock(&ubi->cmt_lock);
+	ubi->c_status =3D C_FREE;
+	ubi->c_dirty =3D C_CLEAN;
+	spin_unlock(&ubi->cmt_lock);
+	return err;
+ro_mode:
+	spin_lock(&ubi->cmt_lock);
+	ubi->c_status =3D C_FAILED;
+	spin_unlock(&ubi->cmt_lock);
+	ubi_err("commit failed");
+	ubi_ro_mode(ubi);
+	return err;
+}
+
+/**
+ * cmt_put_resvd_peb - Put buffer pebs in case of failures
+ * @ubi_device: UBI device description object
+ *
+ * In case of partial commit write, we read commit from old commit copy.
+ * But in partial commit, buffer pebs gathered for special blocks must be =
put
+ * back. During attach process, we check previous commit status and if it =
is
+ * invalid using this function we mark buffer pebs as erase pending. In sc=
an
+ * process, these erase pending blocks gets handled accordingly.
+ *
+ * In this function, we check sb for buffer pebs. If it contain valid
+ * number then er mark these pebs as erase pending. After marking them as
+ * erase pending commit status is set as valid and do sb sync operation.
+ * This function return zero in success and negative error code in case
+ * of failures.
+ */
+
+int ubi_cmt_put_resvd_peb(struct ubi_device *ubi)
+{
+	int err, *buffer_peb, pnum, peb_count;
+	struct ubi_sb *sb;
+
+	dbg_cmt("putting buffer pebs");
+
+	/* Get sb */
+	sb =3D ubi_sb_get_node(ubi);
+	buffer_peb =3D sb->buds + be32_to_cpu(sb->cmt_next_buds);
+
+	peb_count =3D ubi->c_reservd_buds * UBIL_CMT_COPIES;
+	peb_count +=3D ubi->el_reservd_buds;;
+
+	while (peb_count > 0) {
+		pnum =3D be32_to_cpu(*buffer_peb);
+		/* Check pnum is not equal to -1 and greater than 0
+		 * We have sb on 0 so pnum should be greater than 0.
+		 */
+		if (pnum !=3D -1 && pnum > 0)
+			ubi->peb_lookup[pnum].status =3D UBIL_PEB_ERASE_PENDING;
+
+		*buffer_peb =3D cpu_to_be32(-1);
+		buffer_peb =3D buffer_peb + 1;
+		peb_count--;
+	}
+	/* Set commit status */
+	sb->cmt_status =3D cpu_to_be32(UBIL_CMT_WRITE_SUCCESS) ;
+	/* Write sb */
+	err =3D ubi_sb_sync_node(ubi);
+	if (err) {
+		ubi_err("sb sync error");
+		ubi_sb_put_node(ubi);
+		return err;
+	}
+	/* Release sb */
+	ubi_sb_put_node(ubi);
+	return 0;
+}
+
+#endif
