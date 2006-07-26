Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G5mdg-0002Lf-CG
	for linux-mtd@lists.infradead.org; Wed, 26 Jul 2006 12:53:57 -0400
Message-ID: <44C79DE1.8060504@yandex.ru>
Date: Wed, 26 Jul 2006 20:52:49 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: how to use jff2 on UBI layer?
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
	<1153737968.16170.19.camel@sauron.oktetlabs.ru>
	<20060724114007.GB20849@wohnheim.fh-wedel.de>
In-Reply-To: <20060724114007.GB20849@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="------------000002040700070008020101"
Cc: linux-mtd@lists.infradead.org, haver@vnet.ibm.com,
	'Marteo Tim' <tim.marteo@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000002040700070008020101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

J=F6rn Engel wrote:
> Feel free to send a patch.

NP, here is the first edition which adds an abstract I/O API to JFFS2.=20
Adding UBI support now becomes a very easy task.

P.S. Patch is against the mtd-2.6.git.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.

--------------000002040700070008020101
Content-Type: text/x-patch;
 name="add-io-abstraction.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="add-io-abstraction.diff"

[PATCH] [JFFS2] abstract-out I/O

This patch make JFFS2 much less dependent on the MTD API. This is needed to
port JFFS2 on other APIs, like UBI. Porting JFFS2 to another devices becomes
very easy with this patch. The new I/O interface is in io.c and io.h files.

Signed-off-by: Artem B. Bityutskiy <dedekind@linutronix.de>
Index: jffs2-ubi/fs/jffs2/io.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ jffs2-ubi/fs/jffs2/io.c	2006-07-26 20:35:48.000000000 +0400
@@ -0,0 +1,449 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2001-2003 Red Hat, Inc.
+ *
+ * Created by Artem B. Bityutskiy <dedekind@infradead.org>
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ */
+
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/ctype.h>
+#include <linux/fs.h>
+#include <linux/mount.h>
+#include <linux/namei.h>
+#include "nodelist.h"
+#include "io.h"
+
+static void mtd_erase_cb(struct erase_info *mtd_info);
+static int flash_setup(struct jffs2_io_backend *io);
+
+int jffs2_io_open_backend(const char *dev_name, struct jffs2_io_backend *io)
+{
+	int err, nr = -1;
+	struct nameidata nd;
+	struct mtd_info *mtd;
+
+	if (dev_name[0] == 'm' && dev_name[1] == 't' && dev_name[2] == 'd') {
+		/*
+		 * This is an MTD device. There are three metods to specify an
+		 * MTD device:
+		 * 1. mtd<number> - MTD device number <number>;
+		 * 2. mtd:<name> - MTD device with name <name>;
+		 * 3. old "fake block device" method.
+		 */
+		if (dev_name[3] == ':') { /* Method 2 */
+			dbg_fsbuild("try mtd:%s\n", dev_name+4);
+
+			for (nr = 0; nr < MAX_MTD_DEVICES; nr++) {
+				mtd = get_mtd_device(NULL, nr);
+				if (mtd && !strcmp(mtd->name, dev_name+4))
+					break;
+			}
+
+			if (nr >= MAX_MTD_DEVICES) {
+				JFFS2_ERROR("MTD device with name \"%s\" not found\n",
+					    dev_name+4);
+				return -EINVAL;
+			}
+		} else if (isdigit(dev_name[3])) { /* Method 1 */
+			char *endptr;
+
+			nr = simple_strtoul(dev_name+3, &endptr, 0);
+			if (*endptr)
+				/* Not a valid number */
+				return -EINVAL;
+		}
+		io->be_type = JFFS2_IO_BACKEND_MTD;
+	}
+
+	if (nr == -1) {
+		/*
+		 * Try the old way - the hack where we allowed users to
+		 * mount /dev/mtdblock$(n) but didn't actually _use_
+		 * the blkdev.
+		 */
+		dbg_fsbuild("try old \"blk device\" method\n");
+
+		err = path_lookup(dev_name, LOOKUP_FOLLOW, &nd);
+		if (err)
+			return err;
+
+		err = -EINVAL;
+		if (!S_ISBLK(nd.dentry->d_inode->i_mode))
+			goto out_path_release;
+
+		if (nd.mnt->mnt_flags & MNT_NODEV) {
+			err = -EACCES;
+			goto out_path_release;
+		}
+
+		if (imajor(nd.dentry->d_inode) != MTD_BLOCK_MAJOR)
+			goto out_path_release;
+
+		nr = iminor(nd.dentry->d_inode);
+		path_release(&nd);
+		io->be_type = JFFS2_IO_BACKEND_MTD;
+	}
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		io->mtd = mtd = get_mtd_device(NULL, nr);
+		if (!mtd) {
+			dbg_fsbuild("MTD device #%u doesn't appear to exist\n",
+				    nr);
+			return -EINVAL;
+		}
+
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
+		if (mtd->writesize > 1) {
+			JFFS2_ERROR("this flash requires write-buffering support which was not compiled-in\n");
+			ret = -EINVAL;
+			goto out_put_mtd;
+		}
+#endif
+		io->name = mtd->name;
+		io->type_str = "MTD";
+		io->eb_size = mtd->erasesize;
+		io->oob_size = mtd->oobsize;
+		io->bad_allowed = !!mtd->block_markbad;
+		io->writesize = mtd->writesize;
+		io->cm_needed = 1;
+		io->dev_size = mtd->size;
+		io->bit_writable = !!(mtd->type == MTD_NORFLASH &&
+				      mtd->writesize == 1);
+
+		/* Some parameters depend on flash type, initialize them */
+		err = flash_setup(io);
+		if (err)
+			goto out_put_mtd;
+	} else
+		return -EINVAL;
+
+	io->dev_nr = nr + (256 * io->be_type);
+
+	return 0;
+
+out_path_release:
+	path_release(&nd);
+	return err;
+out_put_mtd:
+	put_mtd_device(io->mtd);
+	return err;
+}
+
+void jffs2_io_close_backend(struct jffs2_io_backend *io)
+{
+	if (io->be_type == JFFS2_IO_BACKEND_MTD)
+		put_mtd_device(io->mtd);
+}
+
+int jffs2_io_read(struct jffs2_io_backend *io, uint32_t from, size_t len,
+		  size_t *retlen, void *buf)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		ret = io->mtd->read(io->mtd, from, len, retlen, buf);
+		if (unlikely(ret)) {
+			JFFS2_ERROR("read failed from offset %#08x, len %zd\n",
+				    from, len);
+			dump_stack();
+		} else if (*retlen != len) {
+			JFFS2_ERROR("short read from offset %#08x, %zd not %zd \n",
+				    from, *retlen, len);
+			dump_stack();
+		}
+		return ret;
+	}
+	return -EIO;
+}
+
+int jffs2_io_read_oob(struct jffs2_io_backend *io, uint32_t from, size_t len,
+		       size_t pos, void *buf)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		struct mtd_oob_ops ops;
+
+		ops.len = len;
+		ops.ooblen = io->oob_size;
+		ops.oobbuf = buf;
+		ops.ooboffs = pos;
+		ops.datbuf = NULL;
+		ops.mode = MTD_OOB_PLACE;
+
+		ret = io->mtd->read_oob(io->mtd, from, &ops);
+		if (unlikely(ret)) {
+			JFFS2_ERROR("OOB read failed from offset %#08x, len %d, OOB pos %d, error %d\n",
+				    from, len, pos, ret);
+			dump_stack();
+		} else if (ops.retlen != ops.len) {
+			JFFS2_ERROR("short OOB read from offset %#08x, OOB pos %d, %zd not %d\n",
+				    from, pos, ops.retlen, ops.len);
+			dump_stack();
+			ret = -EIO;
+		}
+		return ret;
+	}
+	return -EIO;
+}
+
+
+int jffs2_io_write(struct jffs2_io_backend *io, uint32_t to, size_t len,
+		   size_t *retlen, const void *buf)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		ret = io->mtd->write(io->mtd, to, len, retlen, buf);
+		if (unlikely(ret)) {
+			JFFS2_ERROR("write failed at offset %#08x, len %zd\n",
+				    to, len);
+			dump_stack();
+		} else if (*retlen != len) {
+			JFFS2_ERROR("short write at offset %#08x, %zd not %zd \n",
+				    to, *retlen, len);
+			dump_stack();
+		}
+		return ret;
+	}
+	return -EIO;
+}
+
+int jffs2_io_writev(struct jffs2_io_backend *io, const struct kvec *vecs,
+		    int count, uint32_t to, size_t *retlen)
+{
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		unsigned long i;
+		size_t totlen = 0, thislen;
+		int ret = 0;
+
+		if (io->mtd->writev)
+			return io->mtd->writev(io->mtd, vecs, count, to, retlen);
+
+		/* fall-back writev() implementation */
+		for (i = 0; i < count; i++) {
+			if (!vecs[i].iov_len)
+				continue;
+			ret = jffs2_io_write(io, to, vecs[i].iov_len, &thislen,
+					     vecs[i].iov_base);
+			totlen += thislen;
+			if (ret || thislen != vecs[i].iov_len)
+				break;
+			to += vecs[i].iov_len;
+		}
+		if (retlen)
+			*retlen = totlen;
+		return ret;
+	}
+	return -EIO;
+}
+
+int jffs2_io_write_oob(struct jffs2_io_backend *io, uint32_t to, size_t len,
+		       size_t pos, void *buf)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		struct mtd_oob_ops ops;
+
+		ops.len = len;
+		ops.ooblen = len;;
+		ops.oobbuf = buf;
+		ops.ooboffs = pos;
+		ops.datbuf = NULL;
+		ops.mode = MTD_OOB_PLACE;
+
+		ret = io->mtd->write_oob(io->mtd, to, &ops);
+		if (unlikely(ret)) {
+			JFFS2_ERROR("OOB write failed at offset %#08x, len %d, OOB pos %d, error %d\n",
+				    to, len, pos, ret);
+			dump_stack();
+		} else if (ops.retlen != ops.len) {
+			JFFS2_ERROR("short OOB write at offset %#08x, OOB pos %d, %zd not %d\n",
+				    to, pos, ops.retlen, ops.len);
+			dump_stack();
+			ret = -EIO;
+		}
+		return ret;
+	}
+	return -EIO;
+}
+
+int jffs2_io_erase(struct jffs2_io_backend *io, struct jffs2_io_erase_info *ei)
+{
+	int ret;
+	struct erase_info *mtd_info = &ei->mtd_info;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD) {
+		memset(mtd_info, 0, sizeof(struct erase_info));
+		mtd_info->mtd = io->mtd;
+		mtd_info->addr = ei->offset;
+		mtd_info->len = io->eb_size;
+		mtd_info->callback = &mtd_erase_cb;
+		mtd_info->priv = (unsigned long)ei->priv;
+		mtd_info->fail_addr = 0xffffffff;
+
+		ret = io->mtd->erase(io->mtd, mtd_info);
+		if (unlikely(ret)) {
+			JFFS2_ERROR("failed to erase eraseblock %#08x, error %d\n",
+				    ei->offset, ret);
+			ei->offset = mtd_info->fail_addr;
+		}
+		return ret;
+	}
+	return -EIO;
+}
+
+int jffs2_io_eb_isbad(struct jffs2_io_backend *io, uint32_t offset)
+{
+	if (io->be_type == JFFS2_IO_BACKEND_MTD && io->mtd->block_isbad)
+		return io->mtd->block_isbad(io->mtd, offset);
+	return 0;
+}
+
+int jffs2_io_mark_bad(struct jffs2_io_backend *io, uint32_t offset)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD && io->mtd->block_markbad) {
+		JFFS2_NOTICE("marking block at %08x as bad\n", offset);
+		ret = io->mtd->block_markbad(io->mtd, offset);
+		if (ret)
+			JFFS2_ERROR("failed to mark block at %08x as bad, error %d\n",
+				    offset, ret);
+		return ret;
+	}
+	return 0;
+}
+
+void jffs2_io_sync(struct jffs2_io_backend *io)
+{
+	if (io->be_type == JFFS2_IO_BACKEND_MTD && io->mtd->sync)
+		io->mtd->sync(io->mtd);
+}
+
+#ifndef __ECOS
+int jffs2_io_point(struct jffs2_io_backend *io, uint32_t ofs, size_t len,
+		   size_t *retlen, void **addr)
+{
+	int ret;
+
+	if (io->be_type == JFFS2_IO_BACKEND_MTD && io->mtd->point) {
+		ret = io->mtd->point(io->mtd, ofs, len, retlen,
+				     (unsigned char **)addr);
+		if (unlikely(ret))
+			JFFS2_WARNING("point failed for address %#08x, len %zd, error code %d\n",
+				      ofs, len, ret);
+		if (*retlen < len) {
+			JFFS2_WARNING("point for address %#08x returned len too short: %zu instead of %d\n",
+				      ofs, *retlen, len);
+			io->mtd->unpoint(io->mtd, (unsigned char *)(*addr),
+					 ofs, len);
+			ret = -EIO;
+		}
+		return ret;
+	}
+	return -1;
+}
+#else
+int jffs2_io_point(struct jffs2_io_backend *io, uint32_t ofs, size_t len,
+		   size_t *retlen, void **addr)
+{
+	return -1;
+}
+#endif /* __ECOS */
+
+#ifndef __ECOS
+void jffs2_io_unpoint(struct jffs2_io_backend *io, void *addr, uint32_t ofs,
+		      size_t len)
+{
+	if (io->be_type == JFFS2_IO_BACKEND_MTD && io->mtd->unpoint)
+		io->mtd->unpoint(io->mtd, (unsigned char *)addr, ofs, len);
+}
+#else
+void jffs2_io_unpoint(struct jffs2_io_backend *io, void *addr, uint32_t ofs,
+		      size_t len)
+{
+	return;
+}
+#endif /* __ECOS */
+
+static void mtd_erase_cb(struct erase_info *mtd_info)
+{
+	struct jffs2_io_erase_info *ei;
+
+	ei = container_of(mtd_info, struct jffs2_io_erase_info, mtd_info);
+
+	if (mtd_info->state == MTD_ERASE_DONE)
+		ei->code = 0;
+	else {
+		JFFS2_ERROR("failed to erase eraseblock %#08x, status %d\n",
+			    ei->offset, mtd_info->state);
+		ei->code = -EIO;
+	}
+
+	ei->callback(ei);
+}
+
+static int flash_setup(struct jffs2_io_backend *io)
+{
+	switch (io->mtd->type) {
+	case MTD_NANDFLASH: /* NAND flash setup */
+	{
+		struct nand_ecclayout *oinfo = io->mtd->ecclayout;
+
+		/* Do this only, if we have an oob buffer */
+		if (!io->mtd->oobsize)
+			return 0;
+
+		/* Should we use autoplacement ? */
+		if (!oinfo) {
+			JFFS2_ERROR("no autoplacment info found\n");
+			return -EINVAL;
+		}
+
+		/* Get the position of the free bytes */
+		if (!oinfo->oobfree[0].length) {
+			JFFS2_ERROR("autoplacement selected and no empty space in oob\n");
+			return -ENOSPC;
+		}
+
+		io->oob_free_pos = oinfo->oobfree[0].offset;
+		io->oob_free_len = oinfo->oobfree[0].length;
+		if (io->oob_free_len > 8)
+			io->oob_free_len = 8;
+
+		break;
+	}
+
+	case MTD_DATAFLASH: /* Dataflash setup */
+		/*
+		 * Eraseblock size is very small in case of data flash. Find an
+		 * suitable one:
+		 * - Not too much sectors
+		 * - Sectors have to be at least 4 K + some bytes
+		 * - All known dataflashes have erase sizes of 528 or 1056
+		 * - We take at least 8 eraseblocks and want to have at least 8K
+		 *   size
+		 * - The concatenation should be a power of 2
+		 */
+
+		// dedekind: I'd made it at least 32KiB
+		while (io->eb_size < 8192)
+			io->eb_size *= 2;
+
+		if ((io->dev_size % io->eb_size) != 0) {
+			io->dev_size = (io->dev_size / io->eb_size) * io->eb_size;
+			JFFS2_WARNING("JFFS2 flash size was adjusted to %dKiB\n",
+				      io->dev_size);
+		}
+
+		break;
+	}
+
+	return 0;
+}
Index: jffs2-ubi/fs/jffs2/io.h
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ jffs2-ubi/fs/jffs2/io.h	2006-07-26 20:33:03.000000000 +0400
@@ -0,0 +1,217 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2001-2003 Red Hat, Inc.
+ *
+ * Created by Artem B. Bityutskiy <dedekind@infradead.org>
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ */
+
+#ifndef __JFFS2_IO_H__
+#define __JFFS2_IO_H__
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
+
+/* MTD I/O back-end types */
+enum {
+	JFFS2_IO_BACKEND_MTD = 0, /* MTD device */
+	JFFS2_IO_BACKEND_UBI,     /* UBI device */
+};
+
+/*
+ * JFFS2 may work on top of bare MTD devices as well as on top of UBI devices.
+ * Also, JFFS2 eCos port has its own flash I/O interface, different to Linux's
+ * MTD interface. To make JFFS2 independent of the underlying storage, an I/O
+ * back-end abstraction was introduced.
+ */
+struct jffs2_io_backend
+{
+	struct mtd_info *mtd; /* MTD device description object */
+	int be_type;          /* device type (JFFS2_IO_BACKEND_MTD, etc) */
+	int dev_nr;           /* unique device number */
+	const char *name;     /* device name string */
+	const char *type_str; /* device type string ("MTD", etc) */
+	int eb_size;          /* eraseblock size */
+	int oob_size;         /* sapare area size */
+	int oob_free_len;     /* free OOB bytes */
+	int oob_free_pos;     /* free OOB bytes position */
+	int bad_allowed;      /* if bad eraseblocks are allowed */
+	int writesize;        /* minimal writable unit size */
+	int cm_needed;        /* if clean marker is needed */
+	uint32_t dev_size;    /* size of the device in bytes */
+	int bit_writable;     /* if individual bits can be cleared */
+};
+
+/* This data structure is a part of the "erase" interface */
+struct jffs2_io_erase_info
+{
+	uint32_t offset; /* absolute address of the eraseblock */
+	void *priv;      /* passed do the 'callback()' */
+	int code;        /* error code of the operation (0 - success) */
+	void (*callback) (struct jffs2_io_erase_info *info);
+	/* Private data */
+	struct erase_info mtd_info;
+};
+
+/**
+ * jffs2_io_open_backend - open back-end storage device.
+ *
+ * @dev_name: device name to open (passed to the 'mount' utility)
+ * @io: a 'struct jffs2_io_backend' object to initialize
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_open_backend(const char *dev_name, struct jffs2_io_backend *io);
+
+/**
+ * jffs2_io_close_backend - close back-end storage device.
+ *
+ * @io: the back-end device description object
+ */
+void jffs2_io_close_backend(struct jffs2_io_backend *io);
+
+/**
+ * jffs2_io_read - read data from the back-end storage device.
+ *
+ * @io: the back-end device description object
+ * @from: absolute offset to read from
+ * @len: how many bytes to read
+ * @retlen: how many bytes were read
+ * @buf: a buffer to store the read data to
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_read(struct jffs2_io_backend *io, uint32_t from, size_t len,
+		  size_t *retlen, void *buf);
+
+/**
+ * jffs2_io_read_oob - read OOB data.
+ *
+ * @io: the back-end device description object
+ * @to: absolute offset of the NAND page to read from
+ * @len: how many bytes to read
+ * @pos: position within the OOB area to read from
+ * @buf: the read data is stored here
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_read_oob(struct jffs2_io_backend *io, uint32_t from, size_t len,
+		       size_t pos, void *buf);
+
+/**
+ * jffs2_io_write - write to the back-end storage device.
+ *
+ * @io: the back-end device description object
+ * @to: absolute offset to write to
+ * @len: how many bytes to write
+ * @retlen: how many bytes were written
+ * @buf: the buffer to write
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_write(struct jffs2_io_backend *io, uint32_t to, size_t len,
+		   size_t *retlen, const void *buf);
+
+/**
+ * jffs2_io_writev - write a vector to the back-end storage device.
+ *
+ * @io: the back-end device description object
+ * @vecs: vectors to write
+ * @count: count ov vectors
+ * @to: absolute offset to write to
+ * @retlen: how many bytes were written
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_writev(struct jffs2_io_backend *io, const struct kvec *vecs,
+		    int count, uint32_t to, size_t *retlen);
+
+/**
+ * jffs2_io_write_oob - write OOB data.
+ *
+ * @io: the back-end device description object
+ * @to: absolute offset of the NAND page to write to
+ * @len: how many bytes to write
+ * @pos: position within the OOB area to write to
+ * @buf: the data to write
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_write_oob(struct jffs2_io_backend *io, uint32_t to, size_t len,
+		       size_t pos, void *buf);
+
+/**
+ * jffs2_io_erase - erase an eraseblock of the back-end storage device.
+ *
+ * @io: the back-end device description object
+ * @ei: erase operation information
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure. %-EIO means the eraseblock is probably bad.
+ */
+int jffs2_io_erase(struct jffs2_io_backend *io, struct jffs2_io_erase_info *ei);
+
+/**
+ * jffs2_io_eb_isbad - check if an eraseblock is bad.
+ *
+ * @io: the back-end device description object
+ * @offset: absolute eraseblock offset
+ *
+ * This function returns zero if the eraseblock is good and non-zero if it is
+ * bad.
+ */
+int jffs2_io_eb_isbad(struct jffs2_io_backend *io, uint32_t offset);
+
+/**
+ * int jffs2_io_mark_bad - mark an eraseblock as bad.
+ *
+ * @io: the back-end device description object
+ * @offset: absolute eraseblock offset
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int jffs2_io_mark_bad(struct jffs2_io_backend *io, uint32_t offset);
+
+/**
+ * jffs2_io_sync - flush the back-end storage device.
+ *
+ * @io:  the back-end device description object
+ */
+void jffs2_io_sync(struct jffs2_io_backend *io);
+
+/**
+ * jffs2_io_point - lock a region for XiP.
+ *
+ * @io: the back-end device description object
+ * @ofs: absolute flash offset to lock
+ * @len: how many bytes to lock
+ * @retlen: how many bytes were locked
+ * @addr: starting locked address
+ *
+ * This function returns zero in case of success, -1 if point is not supported,
+ * and another negative error code in case of failure.
+ */
+int jffs2_io_point(struct jffs2_io_backend *io, uint32_t ofs, size_t len,
+		   size_t *retlen, void **addr);
+
+/**
+ * jffs2_io_unpoint - unlock XiP region.
+ *
+ * @io: the back-end device description object
+ * @addr: address to unlock
+ * @ofs: absolute flash offset to unlock
+ * @len: how many bytes to unlock
+ */
+void jffs2_io_unpoint(struct jffs2_io_backend *io, void *addr, uint32_t ofs,
+		      size_t len);
+
+#endif /* !__JFFS2_IO_H__ */
Index: jffs2-ubi/fs/jffs2/super.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/super.c	2006-07-25 14:24:08.000000000 +0400
+++ jffs2-ubi/fs/jffs2/super.c	2006-07-26 20:38:40.000000000 +0400
@@ -20,11 +20,11 @@
 #include <linux/mount.h>
 #include <linux/jffs2.h>
 #include <linux/pagemap.h>
-#include <linux/mtd/mtd.h>
 #include <linux/ctype.h>
 #include <linux/namei.h>
 #include "compr.h"
 #include "nodelist.h"
+#include "io.h"
 
 static void jffs2_put_super(struct super_block *);
 
@@ -86,12 +86,14 @@
 
 	/* The superblocks are considered to be equivalent if the underlying MTD
 	   device is the same one */
-	if (c->mtd == p->mtd) {
-		D1(printk(KERN_DEBUG "jffs2_sb_compare: match on device %d (\"%s\")\n", p->mtd->index, p->mtd->name));
+	if (c->io->be_type == p->io->be_type && c->io->dev_nr == p->io->dev_nr) {
+		dbg_fsbuild("match on device %d (\"%s:%s\")\n",
+			    p->io->dev_nr, c->io->type_str, p->io->name);
 		return 1;
 	} else {
-		D1(printk(KERN_DEBUG "jffs2_sb_compare: No match, device %d (\"%s\"), device %d (\"%s\")\n",
-			  c->mtd->index, c->mtd->name, p->mtd->index, p->mtd->name));
+		dbg_fsbuild("no match, device %d (\"%s:%s\"), device %d (\"%s:%s\")\n",
+			    c->io->dev_nr, c->io->type_str, c->io->name,
+			    p->io->dev_nr, p->io->type_str, p->io->name);
 		return 0;
 	}
 }
@@ -105,41 +107,59 @@
 	   device */
 	sb->s_fs_info = p;
 	p->os_priv = sb;
-	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, p->mtd->index);
+	sb->s_dev = MKDEV(MTD_BLOCK_MAJOR, p->io->dev_nr);
 
 	return 0;
 }
 
-static int jffs2_get_sb_mtd(struct file_system_type *fs_type,
-			    int flags, const char *dev_name,
-			    void *data, struct mtd_info *mtd,
-			    struct vfsmount *mnt)
+static int jffs2_get_sb(struct file_system_type *fs_type,
+			int flags, const char *dev_name,
+			void *data, struct vfsmount *mnt)
 {
+	struct jffs2_io_backend *io, *old_io;
 	struct super_block *sb;
 	struct jffs2_sb_info *c;
 	int ret;
 
-	c = kmalloc(sizeof(*c), GFP_KERNEL);
-	if (!c)
+	if (!dev_name)
+		return -EINVAL;
+
+	dbg_fsbuild("dev_name \"%s\"\n", dev_name);
+
+	io = kzalloc(sizeof(*io), GFP_KERNEL);
+	if (!io)
+		return -ENOMEM;
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c) {
+		kfree(io);
 		return -ENOMEM;
-	memset(c, 0, sizeof(*c));
-	c->mtd = mtd;
+	}
 
-	sb = sget(fs_type, jffs2_sb_compare, jffs2_sb_set, c);
+	ret = jffs2_io_open_backend(dev_name, io);
+	if (ret)
+		goto out_free;
+
+	old_io = c->io;
+	c->io = io;
 
-	if (IS_ERR(sb))
-		goto out_error;
+	sb = sget(fs_type, jffs2_sb_compare, jffs2_sb_set, c);
+	if (IS_ERR(sb)) {
+		ret = PTR_ERR(sb);
+		goto out_close;
+	}
 
 	if (sb->s_root) {
 		/* New mountpoint for JFFS2 which is already mounted */
-		D1(printk(KERN_DEBUG "jffs2_get_sb_mtd(): Device %d (\"%s\") is already mounted\n",
-			  mtd->index, mtd->name));
+		dbg_fsbuild("device %d (\"%s:%s\") is already mounted\n",
+			    io->dev_nr, io->type_str, io->name);
+
 		ret = simple_set_mnt(mnt, sb);
-		goto out_put;
+		c->io = old_io;
+		goto out_close;
 	}
 
-	D1(printk(KERN_DEBUG "jffs2_get_sb_mtd(): New superblock for device %d (\"%s\")\n",
-		  mtd->index, mtd->name));
+	dbg_fsbuild("new superblock for device %d (\"%s:%s\")\n",
+		    io->dev_nr, io->type_str, io->name);
 
 	/* Initialize JFFS2 superblock locks, the further initialization will be
 	 * done later */
@@ -157,7 +177,6 @@
 	sb->s_flags |= MS_POSIXACL;
 #endif
 	ret = jffs2_do_fill_super(sb, data, flags & MS_SILENT ? 1 : 0);
-
 	if (ret) {
 		/* Failure case... */
 		up_write(&sb->s_umount);
@@ -168,119 +187,16 @@
 	sb->s_flags |= MS_ACTIVE;
 	return simple_set_mnt(mnt, sb);
 
-out_error:
-	ret = PTR_ERR(sb);
- out_put:
+out_close:
+	jffs2_io_close_backend(io);
+out_free:
+	kfree(io);
 	kfree(c);
-	put_mtd_device(mtd);
 
 	return ret;
 }
 
-static int jffs2_get_sb_mtdnr(struct file_system_type *fs_type,
-			      int flags, const char *dev_name,
-			      void *data, int mtdnr,
-			      struct vfsmount *mnt)
-{
-	struct mtd_info *mtd;
-
-	mtd = get_mtd_device(NULL, mtdnr);
-	if (!mtd) {
-		D1(printk(KERN_DEBUG "jffs2: MTD device #%u doesn't appear to exist\n", mtdnr));
-		return -EINVAL;
-	}
-
-	return jffs2_get_sb_mtd(fs_type, flags, dev_name, data, mtd, mnt);
-}
-
-static int jffs2_get_sb(struct file_system_type *fs_type,
-			int flags, const char *dev_name,
-			void *data, struct vfsmount *mnt)
-{
-	int err;
-	struct nameidata nd;
-	int mtdnr;
-
-	if (!dev_name)
-		return -EINVAL;
-
-	D1(printk(KERN_DEBUG "jffs2_get_sb(): dev_name \"%s\"\n", dev_name));
-
-	/* The preferred way of mounting in future; especially when
-	   CONFIG_BLK_DEV is implemented - we specify the underlying
-	   MTD device by number or by name, so that we don't require
-	   block device support to be present in the kernel. */
-
-	/* FIXME: How to do the root fs this way? */
-
-	if (dev_name[0] == 'm' && dev_name[1] == 't' && dev_name[2] == 'd') {
-		/* Probably mounting without the blkdev crap */
-		if (dev_name[3] == ':') {
-			struct mtd_info *mtd;
-
-			/* Mount by MTD device name */
-			D1(printk(KERN_DEBUG "jffs2_get_sb(): mtd:%%s, name \"%s\"\n", dev_name+4));
-			for (mtdnr = 0; mtdnr < MAX_MTD_DEVICES; mtdnr++) {
-				mtd = get_mtd_device(NULL, mtdnr);
-				if (mtd) {
-					if (!strcmp(mtd->name, dev_name+4))
-						return jffs2_get_sb_mtd(fs_type, flags, dev_name, data, mtd, mnt);
-					put_mtd_device(mtd);
-				}
-			}
-			printk(KERN_NOTICE "jffs2_get_sb(): MTD device with name \"%s\" not found.\n", dev_name+4);
-		} else if (isdigit(dev_name[3])) {
-			/* Mount by MTD device number name */
-			char *endptr;
-
-			mtdnr = simple_strtoul(dev_name+3, &endptr, 0);
-			if (!*endptr) {
-				/* It was a valid number */
-				D1(printk(KERN_DEBUG "jffs2_get_sb(): mtd%%d, mtdnr %d\n", mtdnr));
-				return jffs2_get_sb_mtdnr(fs_type, flags, dev_name, data, mtdnr, mnt);
-			}
-		}
-	}
-
-	/* Try the old way - the hack where we allowed users to mount
-	   /dev/mtdblock$(n) but didn't actually _use_ the blkdev */
-
-	err = path_lookup(dev_name, LOOKUP_FOLLOW, &nd);
-
-	D1(printk(KERN_DEBUG "jffs2_get_sb(): path_lookup() returned %d, inode %p\n",
-		  err, nd.dentry->d_inode));
-
-	if (err)
-		return err;
-
-	err = -EINVAL;
-
-	if (!S_ISBLK(nd.dentry->d_inode->i_mode))
-		goto out;
-
-	if (nd.mnt->mnt_flags & MNT_NODEV) {
-		err = -EACCES;
-		goto out;
-	}
-
-	if (imajor(nd.dentry->d_inode) != MTD_BLOCK_MAJOR) {
-		if (!(flags & MS_SILENT))
-			printk(KERN_NOTICE "Attempt to mount non-MTD device \"%s\" as JFFS2\n",
-			       dev_name);
-		goto out;
-	}
-
-	mtdnr = iminor(nd.dentry->d_inode);
-	path_release(&nd);
-
-	return jffs2_get_sb_mtdnr(fs_type, flags, dev_name, data, mtdnr, mnt);
-
-out:
-	path_release(&nd);
-	return err;
-}
-
-static void jffs2_put_super (struct super_block *sb)
+static void jffs2_put_super(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
 
@@ -298,11 +214,11 @@
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);
-	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
 	jffs2_clear_xattr_subsystem(c);
-	if (c->mtd->sync)
-		c->mtd->sync(c->mtd);
+	kfree(c->oobbuf);
+	kfree(c->wbuf);
+	jffs2_io_sync(c->io);
 
 	D1(printk(KERN_DEBUG "jffs2_put_super returning\n"));
 }
@@ -313,7 +229,8 @@
 	if (!(sb->s_flags & MS_RDONLY))
 		jffs2_stop_garbage_collect_thread(c);
 	generic_shutdown_super(sb);
-	put_mtd_device(c->mtd);
+	jffs2_io_close_backend(c->io);
+	kfree(c->io);
 	kfree(c);
 }
 
Index: jffs2-ubi/fs/jffs2/jffs2_fs_sb.h
===================================================================
--- jffs2-ubi.orig/fs/jffs2/jffs2_fs_sb.h	2006-07-25 15:54:07.000000000 +0400
+++ jffs2-ubi/fs/jffs2/jffs2_fs_sb.h	2006-07-26 20:39:01.000000000 +0400
@@ -17,14 +17,17 @@
 #define JFFS2_SB_FLAG_SCANNING 2 /* Flash scanning is in progress */
 #define JFFS2_SB_FLAG_BUILDING 4 /* File system building is in progress */
 
+#define NR_OOB_SCAN_PAGES 4
+
 struct jffs2_inodirty;
+struct jffs2_io_backend;
 
 /* A struct for the overall file system control.  Pointers to
    jffs2_sb_info structs are named `c' in the source code.
    Nee jffs_control
 */
 struct jffs2_sb_info {
-	struct mtd_info *mtd;
+	struct jffs2_io_backend *io;
 
 	uint32_t highest_ino;
 	uint32_t checked_ino;
Index: jffs2-ubi/fs/jffs2/Makefile
===================================================================
--- jffs2-ubi.orig/fs/jffs2/Makefile	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/Makefile	2006-07-25 16:17:21.000000000 +0400
@@ -9,7 +9,7 @@
 jffs2-y	:= compr.o dir.o file.o ioctl.o nodelist.o malloc.o
 jffs2-y	+= read.o nodemgmt.o readinode.o write.o scan.o gc.o
 jffs2-y	+= symlink.o build.o erase.o background.o fs.o writev.o
-jffs2-y	+= super.o debug.o
+jffs2-y	+= super.o debug.o io.o
 
 jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
 jffs2-$(CONFIG_JFFS2_FS_XATTR)		+= xattr.o xattr_trusted.o xattr_user.o
Index: jffs2-ubi/fs/jffs2/wbuf.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/wbuf.c	2006-07-25 19:31:08.000000000 +0400
+++ jffs2-ubi/fs/jffs2/wbuf.c	2006-07-26 17:28:03.000000000 +0400
@@ -15,12 +15,10 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/mtd/mtd.h>
 #include <linux/crc32.h>
-#include <linux/mtd/nand.h>
 #include <linux/jiffies.h>
-
 #include "nodelist.h"
+#include "io.h"
 
 /* For testing write failures */
 #undef BREAKME
@@ -294,7 +292,8 @@
 		}
 
 		/* Do the read... */
-		ret = c->mtd->read(c->mtd, start, c->wbuf_ofs - start, &retlen, buf);
+		ret = jffs2_io_read(c->io, start, c->wbuf_ofs - start, &retlen,
+				    buf);
 
 		/* ECC recovered ? */
 		if ((ret == -EUCLEAN || ret == -EBADMSG) &&
@@ -367,13 +366,12 @@
 		if (breakme++ == 20) {
 			printk(KERN_NOTICE "Faking write error at 0x%08x\n", ofs);
 			breakme = 0;
-			c->mtd->write(c->mtd, ofs, towrite, &retlen,
-				      brokenbuf);
+			jffs2_io_write(c->io, ofs, towrite, &retlen, brokenbuf);
 			ret = -EIO;
 		} else
 #endif
-			ret = c->mtd->write(c->mtd, ofs, towrite, &retlen,
-					    rewrite_buf);
+			ret = jffs2_io_write(c->io, ofs, towrite, &retlen,
+					     rewrite_buf);
 
 		if (ret || retlen != towrite) {
 			/* Argh. We tried. Really we did. */
@@ -574,13 +572,14 @@
 	if (breakme++ == 20) {
 		printk(KERN_NOTICE "Faking write error at 0x%08x\n", c->wbuf_ofs);
 		breakme = 0;
-		c->mtd->write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen,
-			      brokenbuf);
+		jffs2_io_write(c->io, c->wbuf_ofs, c->wbuf_pagesize, &retlen,
+			       brokenbuf);
 		ret = -EIO;
 	} else
 #endif
 
-		ret = c->mtd->write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen, c->wbuf);
+	ret = jffs2_io_write(c->io, c->wbuf_ofs, c->wbuf_pagesize,
+			     &retlen, c->wbuf);
 
 	if (ret || retlen != c->wbuf_pagesize) {
 		if (ret)
@@ -815,8 +814,8 @@
 		v += wbuf_retlen;
 
 		if (vlen >= c->wbuf_pagesize) {
-			ret = c->mtd->write(c->mtd, outvec_to, PAGE_DIV(vlen),
-					    &wbuf_retlen, v);
+			ret = jffs2_io_write(c->io, outvec_to, PAGE_DIV(vlen),
+					     &wbuf_retlen, v);
 			if (ret < 0 || wbuf_retlen != PAGE_DIV(vlen))
 				goto outfile;
 
@@ -902,15 +901,15 @@
 	int	ret;
 
 	if (!jffs2_is_writebuffered(c))
-		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
+		return jffs2_io_read(c->io, ofs, len, retlen, buf);
 
 	/* Read flash */
 	down_read(&c->wbuf_sem);
-	ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
+	ret = jffs2_io_read(c->io, ofs, len, retlen, buf);
 
 	if ( (ret == -EBADMSG || ret == -EUCLEAN) && (*retlen == len) ) {
 		if (ret == -EBADMSG)
-			printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx)"
+			printk(KERN_WARNING "read(0x%zx bytes from 0x%llx)"
 			       " returned ECC error\n", len, ofs);
 		/*
 		 * We have the raw data without ECC correction in the buffer,
@@ -956,56 +955,35 @@
 	return ret;
 }
 
-#define NR_OOB_SCAN_PAGES	4
-
 /*
  * Check, if the out of band area is empty
  */
 int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 			  struct jffs2_eraseblock *jeb, int mode)
 {
-	int i, page, ret;
-	int oobsize = c->mtd->oobsize;
-	struct mtd_oob_ops ops;
-
-	ops.len = NR_OOB_SCAN_PAGES * oobsize;
-	ops.ooblen = oobsize;
-	ops.oobbuf = c->oobbuf;
-	ops.ooboffs = 0;
-	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	int i, page, ret, len = NR_OOB_SCAN_PAGES*c->io->oob_size;
 
-	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
-	if (ret) {
-		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
-			  "failed %d for block at %08x\n", ret, jeb->offset));
+	ret = jffs2_io_read_oob(c->io, jeb->offset, len, 0, c->oobbuf);
+	if (ret)
 		return ret;
-	}
-
-	if (ops.retlen < ops.len) {
-		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
-			  "returned short read (%zd bytes not %d) for block "
-			  "at %08x\n", ops.retlen, ops.len, jeb->offset));
-		return -EIO;
-	}
 
 	/* Special check for first page */
-	for(i = 0; i < oobsize ; i++) {
+	for(i = 0; i < c->io->oob_size; i++) {
 		/* Yeah, we know about the cleanmarker. */
 		if (mode && i >= c->fsdata_pos &&
 		    i < c->fsdata_pos + c->fsdata_len)
 			continue;
 
-		if (ops.oobbuf[i] != 0xFF) {
+		if (c->oobbuf[i] != 0xFF) {
 			D2(printk(KERN_DEBUG "Found %02x at %x in OOB for "
-				  "%08x\n", ops.oobbuf[i], i, jeb->offset));
+				  "%08x\n", c->oobbuf[i], i, jeb->offset));
 			return 1;
 		}
 	}
 
 	/* we know, we are aligned :) */
-	for (page = oobsize; page < ops.len; page += sizeof(long)) {
-		long dat = *(long *)(&ops.oobbuf[page]);
+	for (page = c->io->oob_size; page < len; page += sizeof(long)) {
+		long dat = *(long *)(&c->oobbuf[page]);
 		if(dat != -1)
 			return 1;
 	}
@@ -1019,41 +997,20 @@
 				  struct jffs2_eraseblock *jeb)
 {
 	struct jffs2_unknown_node n;
-	struct mtd_oob_ops ops;
-	int oobsize = c->mtd->oobsize;
 	unsigned char *p,*b;
 	int i, ret;
 	size_t offset = jeb->offset;
 
 	/* Check first if the block is bad. */
-	if (c->mtd->block_isbad(c->mtd, offset)) {
+	if (jffs2_io_eb_isbad(c->io, offset)) {
 		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker()"
 			   ": Bad block at %08x\n", jeb->offset));
 		return 2;
 	}
 
-	ops.len = oobsize;
-	ops.ooblen = oobsize;
-	ops.oobbuf = c->oobbuf;
-	ops.ooboffs = 0;
-	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
-
-	ret = c->mtd->read_oob(c->mtd, offset, &ops);
-	if (ret) {
-		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker(): "
-			   "Read OOB failed %d for block at %08x\n",
-			   ret, jeb->offset));
+	ret = jffs2_io_read_oob(c->io, offset, c->io->oob_size, 0, c->oobbuf);
+	if (ret)
 		return ret;
-	}
-
-	if (ops.retlen < ops.len) {
-		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker(): "
-			    "Read OOB return short read (%zd bytes not %d) "
-			    "for block at %08x\n", ops.retlen, ops.len,
-			    jeb->offset));
-		return -EIO;
-	}
 
 	n.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 	n.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
@@ -1071,7 +1028,7 @@
 		       "Cleanmarker node not detected in block at %08x\n",
 		       offset);
 		printk(KERN_WARNING "OOB at %08zx was ", offset);
-		for (i=0; i < oobsize; i++)
+		for (i=0; i < c->io->oob_size; i++)
 			printk("%02x ", c->oobbuf[i]);
 		printk("\n");
 	});
@@ -1082,35 +1039,13 @@
 				 struct jffs2_eraseblock *jeb)
 {
 	struct jffs2_unknown_node n;
-	int	ret;
-	struct mtd_oob_ops ops;
 
 	n.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
 	n.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
 	n.totlen = cpu_to_je32(8);
 
-	ops.len = c->fsdata_len;
-	ops.ooblen = c->fsdata_len;;
-	ops.oobbuf = (uint8_t *)&n;
-	ops.ooboffs = c->fsdata_pos;
-	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
-
-	ret = c->mtd->write_oob(c->mtd, jeb->offset, &ops);
-
-	if (ret) {
-		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
-			  "Write failed for block at %08x: error %d\n",
-			  jeb->offset, ret));
-		return ret;
-	}
-	if (ops.retlen != ops.len) {
-		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
-			  "Short write for block at %08x: %zd not %d\n",
-			  jeb->offset, ops.retlen, ops.len));
-		return -EIO;
-	}
-	return 0;
+	return jffs2_io_write_oob(c->io, jeb->offset, c->fsdata_len,
+				  c->fsdata_pos, &n);
 }
 
 /*
@@ -1123,156 +1058,12 @@
 
 int jffs2_write_nand_badblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
 {
-	int 	ret;
+	int ret;
 
 	/* if the count is < max, we try to write the counter to the 2nd page oob area */
 	if( ++jeb->bad_count < MAX_ERASE_FAILURES)
 		return 0;
 
-	if (!c->mtd->block_markbad)
-		return 1; // What else can we do?
-
-	D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Marking bad block at %08x\n", bad_offset));
-	ret = c->mtd->block_markbad(c->mtd, bad_offset);
-
-	if (ret) {
-		D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Write failed for block at %08x: error %d\n", jeb->offset, ret));
-		return ret;
-	}
-	return 1;
-}
-
-static int jffs2_nand_set_oobinfo(struct jffs2_sb_info *c)
-{
-	struct nand_ecclayout *oinfo = c->mtd->ecclayout;
-
-	/* Do this only, if we have an oob buffer */
-	if (!c->mtd->oobsize)
-		return 0;
-
-	/* Cleanmarker is out-of-band, so inline size zero */
-	c->cleanmarker_size = 0;
-
-	/* Should we use autoplacement ? */
-	if (!oinfo) {
-		D1(printk(KERN_DEBUG "JFFS2 on NAND. No autoplacment info found\n"));
-		return -EINVAL;
-	}
-
-	D1(printk(KERN_DEBUG "JFFS2 using autoplace on NAND\n"));
-	/* Get the position of the free bytes */
-	if (!oinfo->oobfree[0].length) {
-		printk (KERN_WARNING "jffs2_nand_set_oobinfo(): Eeep."
-			" Autoplacement selected and no empty space in oob\n");
-		return -ENOSPC;
-	}
-	c->fsdata_pos = oinfo->oobfree[0].offset;
-	c->fsdata_len = oinfo->oobfree[0].length;
-	if (c->fsdata_len > 8)
-		c->fsdata_len = 8;
-
-	return 0;
-}
-
-int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
-{
-	int res;
-
-	/* Initialise write buffer */
-	init_rwsem(&c->wbuf_sem);
-	c->wbuf_pagesize = c->mtd->writesize;
-	c->wbuf_ofs = 0xFFFFFFFF;
-
-	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf)
-		return -ENOMEM;
-
-	c->oobbuf = kmalloc(NR_OOB_SCAN_PAGES * c->mtd->oobsize, GFP_KERNEL);
-	if (!c->oobbuf)
-		return -ENOMEM;
-
-	res = jffs2_nand_set_oobinfo(c);
-
-#ifdef BREAKME
-	if (!brokenbuf)
-		brokenbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!brokenbuf) {
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-	memset(brokenbuf, 0xdb, c->wbuf_pagesize);
-#endif
-	return res;
-}
-
-void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c)
-{
-	kfree(c->wbuf);
-	kfree(c->oobbuf);
-}
-
-int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
-	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
-
-	/* Initialize write buffer */
-	init_rwsem(&c->wbuf_sem);
-
-
-	c->wbuf_pagesize =  c->mtd->erasesize;
-
-	/* Find a suitable c->sector_size
-	 * - Not too much sectors
-	 * - Sectors have to be at least 4 K + some bytes
-	 * - All known dataflashes have erase sizes of 528 or 1056
-	 * - we take at least 8 eraseblocks and want to have at least 8K size
-	 * - The concatenation should be a power of 2
-	*/
-
-	c->sector_size = 8 * c->mtd->erasesize;
-
-	while (c->sector_size < 8192) {
-		c->sector_size *= 2;
-	}
-
-	/* It may be necessary to adjust the flash size */
-	c->flash_size = c->mtd->size;
-
-	if ((c->flash_size % c->sector_size) != 0) {
-		c->flash_size = (c->flash_size / c->sector_size) * c->sector_size;
-		printk(KERN_WARNING "JFFS2 flash size adjusted to %dKiB\n", c->flash_size);
-	};
-
-	c->wbuf_ofs = 0xFFFFFFFF;
-	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf)
-		return -ENOMEM;
-
-	printk(KERN_INFO "JFFS2 write-buffering enabled buffer (%d) erasesize (%d)\n", c->wbuf_pagesize, c->sector_size);
-
-	return 0;
-}
-
-void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
-	kfree(c->wbuf);
-}
-
-int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c) {
-	/* Cleanmarker currently occupies whole programming regions,
-	 * either one or 2 for 8Byte STMicro flashes. */
-	c->cleanmarker_size = max(16u, c->mtd->writesize);
-
-	/* Initialize write buffer */
-	init_rwsem(&c->wbuf_sem);
-	c->wbuf_pagesize = c->mtd->writesize;
-	c->wbuf_ofs = 0xFFFFFFFF;
-
-	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c) {
-	kfree(c->wbuf);
+	ret = jffs2_io_mark_bad(c->io, bad_offset);
+	return ret ? ret : 1;
 }
Index: jffs2-ubi/fs/jffs2/writev.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/writev.c	2006-07-25 19:30:30.000000000 +0400
+++ jffs2-ubi/fs/jffs2/writev.c	2006-07-26 20:25:39.000000000 +0400
@@ -12,32 +12,8 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
-
-/* This ought to be in core MTD code. All registered MTD devices
-   without writev should have this put in place. Bug the MTD
-   maintainer */
-static inline int mtd_fake_writev(struct mtd_info *mtd, const struct kvec *vecs,
-				  unsigned long count, loff_t to, size_t *retlen)
-{
-	unsigned long i;
-	size_t totlen = 0, thislen;
-	int ret = 0;
-
-	for (i=0; i<count; i++) {
-		if (!vecs[i].iov_len)
-			continue;
-		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
-		totlen += thislen;
-		if (ret || thislen != vecs[i].iov_len)
-			break;
-		to += vecs[i].iov_len;
-	}
-	if (retlen)
-		*retlen = totlen;
-	return ret;
-}
+#include "io.h"
 
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
@@ -52,18 +28,14 @@
 		}
 	}
 
-	if (c->mtd->writev)
-		return c->mtd->writev(c->mtd, vecs, count, to, retlen);
-	else {
-		return mtd_fake_writev(c->mtd, vecs, count, to, retlen);
-	}
+	return jffs2_io_writev(c->io, vecs, count, to, retlen);
 }
 
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
-			size_t *retlen, const u_char *buf)
+			     size_t *retlen, const u_char *buf)
 {
 	int ret;
-	ret = c->mtd->write(c->mtd, ofs, len, retlen, buf);
+	ret = jffs2_io_write(c->io, ofs, len, retlen, buf);
 
 	if (jffs2_sum_active()) {
 		struct kvec vecs[1];
@@ -73,9 +45,8 @@
 		vecs[0].iov_len = len;
 
 		res = jffs2_sum_add_kvec(c, vecs, 1, (uint32_t) ofs);
-		if (res) {
+		if (res)
 			return res;
-		}
 	}
 	return ret;
 }
Index: jffs2-ubi/fs/jffs2/os-linux.h
===================================================================
--- jffs2-ubi.orig/fs/jffs2/os-linux.h	2006-07-25 20:04:40.000000000 +0400
+++ jffs2-ubi/fs/jffs2/os-linux.h	2006-07-26 20:35:27.000000000 +0400
@@ -14,6 +14,8 @@
 #ifndef __JFFS2_OS_LINUX_H__
 #define __JFFS2_OS_LINUX_H__
 
+#include "io.h"
+
 /* JFFS2 uses Linux mode bits natively -- no need for conversion */
 #define os_to_jffs2_mode(x) (x)
 #define jffs2_to_os_mode(x) (x)
@@ -82,7 +84,7 @@
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
 
 #define jffs2_flash_write(c, ofs, len, retlen, buf) jffs2_flash_direct_write(c, ofs, len, retlen, buf)
-#define jffs2_flash_read(c, ofs, len, retlen, buf) ((c)->mtd->read((c)->mtd, ofs, len, retlen, buf))
+#define jffs2_flash_read(c, ofs, len, retlen, buf) (jffs2_io_read((c)->io, ofs, len, retlen, buf))
 #define jffs2_flush_wbuf_pad(c) ({ do{} while(0); (void)(c), 0; })
 #define jffs2_flush_wbuf_gc(c, i) ({ do{} while(0); (void)(c), (void) i, 0; })
 #define jffs2_write_nand_badblock(c,jeb,bad_offset) (1)
@@ -92,12 +94,6 @@
 #define jffs2_flash_writev(a,b,c,d,e,f) jffs2_flash_direct_writev(a,b,c,d,e)
 #define jffs2_wbuf_timeout NULL
 #define jffs2_wbuf_process NULL
-#define jffs2_dataflash(c) (0)
-#define jffs2_dataflash_setup(c) (0)
-#define jffs2_dataflash_cleanup(c) do {} while (0)
-#define jffs2_nor_wbuf_flash(c) (0)
-#define jffs2_nor_wbuf_flash_setup(c) (0)
-#define jffs2_nor_wbuf_flash_cleanup(c) do {} while (0)
 
 #else /* NAND and/or ECC'd NOR support present */
 
@@ -106,13 +102,10 @@
 #ifdef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) (0)
 #else
-#define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
+#define jffs2_can_mark_obsolete(c) (c->io->bit_writable)
 #endif
 
-#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
-
-#define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
-#define jffs2_flash_read_oob(c, ofs, len, retlen, buf) ((c)->mtd->read_oob((c)->mtd, ofs, len, retlen, buf))
+#define jffs2_cleanmarker_oob(c) (c->io->oob_size != 0)
 #define jffs2_wbuf_dirty(c) (!!(c)->wbuf_len)
 
 /* wbuf.c */
@@ -130,14 +123,6 @@
 int jffs2_nand_flash_setup(struct jffs2_sb_info *c);
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c);
 
-#define jffs2_dataflash(c) (c->mtd->type == MTD_DATAFLASH)
-int jffs2_dataflash_setup(struct jffs2_sb_info *c);
-void jffs2_dataflash_cleanup(struct jffs2_sb_info *c);
-
-#define jffs2_nor_wbuf_flash(c) (c->mtd->type == MTD_NORFLASH && ! (c->mtd->flags & MTD_BIT_WRITEABLE))
-int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c);
-void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);
-
 #endif /* WRITEBUFFER */
 
 /* erase.c */
@@ -191,8 +176,6 @@
 void jffs2_gc_release_page(struct jffs2_sb_info *c,
 			   unsigned char *pg,
 			   unsigned long *priv);
-void jffs2_flash_cleanup(struct jffs2_sb_info *c);
-
 
 /* writev.c */
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
Index: jffs2-ubi/fs/jffs2/erase.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/erase.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/erase.c	2006-07-26 14:09:31.000000000 +0400
@@ -13,12 +13,12 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
 #include <linux/crc32.h>
 #include <linux/sched.h>
 #include <linux/pagemap.h>
 #include "nodelist.h"
+#include "io.h"
 
 struct erase_priv_struct {
 	struct jffs2_eraseblock *jeb;
@@ -26,7 +26,7 @@
 };
 
 #ifndef __ECOS
-static void jffs2_erase_callback(struct erase_info *);
+static void jffs2_erase_callback(struct jffs2_io_erase_info *instr);
 #endif
 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset);
 static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
@@ -45,13 +45,14 @@
        }
        bad_offset = jeb->offset;
 #else /* Linux */
-	struct erase_info *instr;
+	struct jffs2_io_erase_info *instr;
 
 	D1(printk(KERN_DEBUG "jffs2_erase_block(): erase block %#08x (range %#08x-%#08x)\n",
 				jeb->offset, jeb->offset, jeb->offset + c->sector_size));
-	instr = kmalloc(sizeof(struct erase_info) + sizeof(struct erase_priv_struct), GFP_KERNEL);
+	instr = kmalloc(sizeof(struct jffs2_io_erase_info) +
+			sizeof(struct erase_priv_struct), GFP_KERNEL);
 	if (!instr) {
-		printk(KERN_WARNING "kmalloc for struct erase_info in jffs2_erase_block failed. Refiling block for later\n");
+		JFFS2_WARNING("kmalloc failed. Refiling block for later\n");
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -= c->sector_size;
@@ -63,21 +64,18 @@
 
 	memset(instr, 0, sizeof(*instr));
 
-	instr->mtd = c->mtd;
-	instr->addr = jeb->offset;
-	instr->len = c->sector_size;
-	instr->callback = jffs2_erase_callback;
-	instr->priv = (unsigned long)(&instr[1]);
-	instr->fail_addr = 0xffffffff;
+	instr->offset = jeb->offset;
+	instr->priv = &instr[1];
+	instr->callback = &jffs2_erase_callback;
 
 	((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 	((struct erase_priv_struct *)instr->priv)->c = c;
 
-	ret = c->mtd->erase(c->mtd, instr);
+	ret = jffs2_io_erase(c->io, instr);
 	if (!ret)
 		return;
 
-	bad_offset = instr->fail_addr;
+	bad_offset = instr->offset;
 	kfree(instr);
 #endif /* __ECOS */
 
@@ -194,16 +192,16 @@
 }
 
 #ifndef __ECOS
-static void jffs2_erase_callback(struct erase_info *instr)
+static void jffs2_erase_callback(struct jffs2_io_erase_info *instr)
 {
-	struct erase_priv_struct *priv = (void *)instr->priv;
+	struct erase_priv_struct *priv = instr->priv;
 
-	if(instr->state != MTD_ERASE_DONE) {
-		printk(KERN_WARNING "Erase at 0x%08x finished, but state != MTD_ERASE_DONE. State is 0x%x instead.\n", instr->addr, instr->state);
-		jffs2_erase_failed(priv->c, priv->jeb, instr->fail_addr);
-	} else {
+	if(instr->code) {
+		JFFS2_WARNING("erase at 0x%08x finished, but with error %d instead\n",
+			      instr->offset, instr->code);
+		jffs2_erase_failed(priv->c, priv->jeb, instr->offset);
+	} else
 		jffs2_erase_succeeded(priv->c, priv->jeb);
-	}
 	kfree(instr);
 }
 #endif /* !__ECOS */
Index: jffs2-ubi/fs/jffs2/fs.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/fs.c	2006-07-26 17:22:40.000000000 +0400
+++ jffs2-ubi/fs/jffs2/fs.c	2006-07-26 18:07:20.000000000 +0400
@@ -16,15 +16,13 @@
 #include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/list.h>
-#include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/vfs.h>
 #include <linux/crc32.h>
 #include "nodelist.h"
-
-static int jffs2_flash_setup(struct jffs2_sb_info *c);
+#include "io.h"
 
 static int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
 {
@@ -468,19 +466,8 @@
 
 	c = JFFS2_SB_INFO(sb);
 
-#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
-	if (c->mtd->type == MTD_NANDFLASH) {
-		printk(KERN_ERR "jffs2: Cannot operate on NAND flash unless jffs2 NAND support is compiled in.\n");
-		return -EINVAL;
-	}
-	if (c->mtd->type == MTD_DATAFLASH) {
-		printk(KERN_ERR "jffs2: Cannot operate on DataFlash unless jffs2 DataFlash support is compiled in.\n");
-		return -EINVAL;
-	}
-#endif
-
-	c->flash_size = c->mtd->size;
-	c->sector_size = c->mtd->erasesize;
+	c->flash_size = c->io->dev_size;
+	c->sector_size = c->io->eb_size;
 	blocks = c->flash_size / c->sector_size;
 
 	/*
@@ -497,18 +484,47 @@
 		return -EINVAL;
 	}
 
-	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
+	if (c->io->cm_needed) {
+		int rem;
 
-	/* NAND (or other bizarre) flash... do setup accordingly */
-	ret = jffs2_flash_setup(c);
-	if (ret)
-		return ret;
+		c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
+
+		/* Align the size to the minimal I/O unit size */
+		rem = c->cleanmarker_size % c->io->writesize;
+		if (rem)
+			c->cleanmarker_size += (c->io->writesize - rem);
+	}
+
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
+	/* Setup write-buffer */
+	init_rwsem(&c->wbuf_sem);
+	if (c->io->writesize > 1) {
+		c->wbuf_pagesize = c->io->writesize;
+		c->wbuf_ofs = 0xFFFFFFFF;
+		c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+		if (!c->wbuf)
+			return -ENOMEM;
+	}
+#endif
+
+	if (jffs2_cleanmarker_oob(c)) {
+		/* If we have OOB, we store clean marker there */
+		c->oobbuf = kmalloc(NR_OOB_SCAN_PAGES*c->io->oob_size, GFP_KERNEL);
+		if (!c->oobbuf) {
+			kfree(c->wbuf);
+			return -ENOMEM;
+		}
+		c->cleanmarker_size = 0; /* CM is in OOB in this case */
+		c->fsdata_pos = c->io->oob_free_pos;
+		c->fsdata_len = c->io->oob_free_len;
+	}
 
 	c->inocache_list = kmalloc(INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
 	if (!c->inocache_list) {
 		ret = -ENOMEM;
-		goto out_wbuf;
+		goto out_oobbuf;
 	}
+
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
 	jffs2_init_xattr_subsystem(c);
@@ -538,7 +554,7 @@
 		jffs2_start_garbage_collect_thread(c);
 	return 0;
 
- out_root_i:
+out_root_i:
 	iput(root_i);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
@@ -546,12 +562,12 @@
 		vfree(c->blocks);
 	else
 		kfree(c->blocks);
- out_inohash:
+out_inohash:
 	jffs2_clear_xattr_subsystem(c);
-	kfree(c->inocache_list);
- out_wbuf:
-	jffs2_flash_cleanup(c);
-
+ 	kfree(c->inocache_list);
+out_oobbuf:
+	kfree(c->oobbuf);
+	kfree(c->wbuf);
 	return ret;
 }
 
@@ -650,47 +666,3 @@
 	kunmap(pg);
 	page_cache_release(pg);
 }
-
-static int jffs2_flash_setup(struct jffs2_sb_info *c) {
-	int ret = 0;
-
-	if (jffs2_cleanmarker_oob(c)) {
-		/* NAND flash... do setup accordingly */
-		ret = jffs2_nand_flash_setup(c);
-		if (ret)
-			return ret;
-	}
-
-	/* and Dataflash */
-	if (jffs2_dataflash(c)) {
-		ret = jffs2_dataflash_setup(c);
-		if (ret)
-			return ret;
-	}
-
-	/* and Intel "Sibley" flash */
-	if (jffs2_nor_wbuf_flash(c)) {
-		ret = jffs2_nor_wbuf_flash_setup(c);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
-void jffs2_flash_cleanup(struct jffs2_sb_info *c) {
-
-	if (jffs2_cleanmarker_oob(c)) {
-		jffs2_nand_flash_cleanup(c);
-	}
-
-	/* and DataFlash */
-	if (jffs2_dataflash(c)) {
-		jffs2_dataflash_cleanup(c);
-	}
-
-	/* and Intel "Sibley" flash */
-	if (jffs2_nor_wbuf_flash(c)) {
-		jffs2_nor_wbuf_flash_cleanup(c);
-	}
-}
Index: jffs2-ubi/fs/jffs2/acl.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/acl.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/acl.c	2006-07-26 19:25:03.000000000 +0400
@@ -16,7 +16,6 @@
 #include <linux/jffs2.h>
 #include <linux/xattr.h>
 #include <linux/posix_acl_xattr.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
 static size_t jffs2_acl_size(int count)
Index: jffs2-ubi/fs/jffs2/background.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/background.c	2006-07-26 19:11:53.000000000 +0400
+++ jffs2-ubi/fs/jffs2/background.c	2006-07-26 19:33:48.000000000 +0400
@@ -13,11 +13,10 @@
 
 #include <linux/kernel.h>
 #include <linux/jffs2.h>
-#include <linux/mtd/mtd.h>
 #include <linux/completion.h>
 #include <linux/sched.h>
 #include "nodelist.h"
-
+#include "io.h"
 
 static int jffs2_garbage_collect_thread(void *);
 
@@ -72,7 +71,7 @@
 {
 	struct jffs2_sb_info *c = _c;
 
-	daemonize("jffs2_gcd_mtd%d", c->mtd->index);
+	daemonize("jffs2_gcd_mtd%d", c->io->dev_nr);
 	allow_signal(SIGKILL);
 	allow_signal(SIGSTOP);
 	allow_signal(SIGCONT);
Index: jffs2-ubi/fs/jffs2/gc.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/gc.c	2006-07-26 19:12:12.000000000 +0400
+++ jffs2-ubi/fs/jffs2/gc.c	2006-07-26 19:21:21.000000000 +0400
@@ -12,7 +12,6 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
Index: jffs2-ubi/fs/jffs2/nodelist.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/nodelist.c	2006-07-26 19:11:33.000000000 +0400
+++ jffs2-ubi/fs/jffs2/nodelist.c	2006-07-26 20:06:35.000000000 +0400
@@ -14,12 +14,12 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
-#include <linux/mtd/mtd.h>
 #include <linux/rbtree.h>
 #include <linux/crc32.h>
 #include <linux/slab.h>
 #include <linux/pagemap.h>
 #include "nodelist.h"
+#include "io.h"
 
 static void jffs2_obsolete_node_frag(struct jffs2_sb_info *c,
 				     struct jffs2_node_frag *this);
@@ -409,7 +409,7 @@
 	struct jffs2_raw_node_ref *ref = tn->fn->raw;
 	int err = 0, pointed = 0;
 	struct jffs2_eraseblock *jeb;
-	unsigned char *buffer;
+	void *buffer;
 	uint32_t crc, ofs, len;
 	size_t retlen;
 
@@ -436,20 +436,8 @@
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
 		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
 
-#ifndef __ECOS
-	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
-	 * adding and jffs2_flash_read_end() interface. */
-	if (c->mtd->point) {
-		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
-		if (!err && retlen < tn->csize) {
-			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-			c->mtd->unpoint(c->mtd, buffer, ofs, len);
-		} else if (err)
-			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
-		else
-			pointed = 1; /* succefully pointed to device */
-	}
-#endif
+	if (!jffs2_io_point(c->io, ofs, len, &retlen, &buffer))
+		pointed = 1;
 
 	if (!pointed) {
 		buffer = kmalloc(len, GFP_KERNEL);
@@ -475,10 +463,8 @@
 	crc = crc32(tn->partial_crc, buffer, len);
 	if(!pointed)
 		kfree(buffer);
-#ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
-#endif
+		jffs2_io_unpoint(c->io, buffer, ofs, len);
 
 	if (crc != tn->data_crc) {
 		JFFS2_NOTICE("wrong data CRC in data node at 0x%08x: read %#08x, calculated %#08x.\n",
@@ -506,10 +492,8 @@
 free_out:
 	if(!pointed)
 		kfree(buffer);
-#ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, buffer, ofs, len);
-#endif
+		jffs2_io_unpoint(c->io, buffer, ofs, len);
 	return err;
 }
 
Index: jffs2-ubi/fs/jffs2/nodemgmt.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/nodemgmt.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/nodemgmt.c	2006-07-26 19:24:40.000000000 +0400
@@ -13,7 +13,6 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
 #include <linux/sched.h> /* For cond_resched() */
 #include "nodelist.h"
Index: jffs2-ubi/fs/jffs2/read.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/read.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/read.c	2006-07-26 19:24:28.000000000 +0400
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/pagemap.h>
-#include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
 #include "nodelist.h"
 #include "compr.h"
Index: jffs2-ubi/fs/jffs2/scan.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/scan.c	2006-07-25 20:00:06.000000000 +0400
+++ jffs2-ubi/fs/jffs2/scan.c	2006-07-26 19:49:23.000000000 +0400
@@ -13,13 +13,13 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
 #include <linux/compiler.h>
 #include "nodelist.h"
 #include "summary.h"
 #include "debug.h"
+#include "io.h"
 
 #define DEFAULT_EMPTY_SCAN_SIZE 1024
 
@@ -94,21 +94,13 @@
 	unsigned char *flashbuf = NULL;
 	uint32_t buf_size = 0;
 	struct jffs2_summary *s = NULL; /* summary info collected by the scan process */
-#ifndef __ECOS
 	size_t pointlen;
 
-	if (c->mtd->point) {
-		ret = c->mtd->point (c->mtd, 0, c->mtd->size, &pointlen, &flashbuf);
-		if (!ret && pointlen < c->mtd->size) {
-			/* Don't muck about if it won't let us point to the whole flash */
-			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", pointlen));
-			c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
-			flashbuf = NULL;
-		}
-		if (ret)
-			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
-	}
-#endif
+	ret = jffs2_io_point(c->io, 0, c->io->dev_size, &pointlen,
+			     (void **)&flashbuf);
+	if (ret)
+		flashbuf = NULL;
+
 	if (!flashbuf) {
 		/* For NAND it's quicker to read a whole eraseblock at a time,
 		   apparently */
@@ -264,10 +256,8 @@
  out:
 	if (buf_size)
 		kfree(flashbuf);
-#ifndef __ECOS
 	else
-		c->mtd->unpoint(c->mtd, flashbuf, 0, c->mtd->size);
-#endif
+		jffs2_io_unpoint(c->io, flashbuf, 0, c->io->dev_size);
 	if (s)
 		kfree(s);
 
Index: jffs2-ubi/fs/jffs2/security.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/security.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/security.c	2006-07-26 19:23:59.000000000 +0400
@@ -17,7 +17,6 @@
 #include <linux/crc32.h>
 #include <linux/jffs2.h>
 #include <linux/xattr.h>
-#include <linux/mtd/mtd.h>
 #include <linux/security.h>
 #include "nodelist.h"
 
Index: jffs2-ubi/fs/jffs2/summary.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/summary.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/summary.c	2006-07-26 19:24:18.000000000 +0400
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/mtd/mtd.h>
 #include <linux/pagemap.h>
 #include <linux/crc32.h>
 #include <linux/compiler.h>
Index: jffs2-ubi/fs/jffs2/write.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/write.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/write.c	2006-07-26 19:23:28.000000000 +0400
@@ -16,11 +16,9 @@
 #include <linux/crc32.h>
 #include <linux/slab.h>
 #include <linux/pagemap.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
 #include "compr.h"
 
-
 int jffs2_do_new_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f, uint32_t mode, struct jffs2_raw_inode *ri)
 {
 	struct jffs2_inode_cache *ic;
Index: jffs2-ubi/fs/jffs2/xattr.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/xattr.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/xattr.c	2006-07-26 19:21:35.000000000 +0400
@@ -17,8 +17,8 @@
 #include <linux/crc32.h>
 #include <linux/jffs2.h>
 #include <linux/xattr.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
+
 /* -------- xdatum related functions ----------------
  * xattr_datum_hashkey(xprefix, xname, xvalue, xsize)
  *   is used to calcurate xdatum hashkey. The reminder of hashkey into XATTRINDEX_HASHSIZE is
Index: jffs2-ubi/fs/jffs2/xattr_user.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/xattr_user.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/xattr_user.c	2006-07-26 19:23:17.000000000 +0400
@@ -12,7 +12,6 @@
 #include <linux/fs.h>
 #include <linux/jffs2.h>
 #include <linux/xattr.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
 static int jffs2_user_getxattr(struct inode *inode, const char *name,
Index: jffs2-ubi/fs/jffs2/readinode.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/readinode.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/readinode.c	2006-07-26 19:25:24.000000000 +0400
@@ -17,7 +17,6 @@
 #include <linux/fs.h>
 #include <linux/crc32.h>
 #include <linux/pagemap.h>
-#include <linux/mtd/mtd.h>
 #include <linux/compiler.h>
 #include "nodelist.h"
 
Index: jffs2-ubi/fs/jffs2/xattr_trusted.c
===================================================================
--- jffs2-ubi.orig/fs/jffs2/xattr_trusted.c	2006-07-25 14:03:23.000000000 +0400
+++ jffs2-ubi/fs/jffs2/xattr_trusted.c	2006-07-26 19:25:25.000000000 +0400
@@ -12,7 +12,6 @@
 #include <linux/fs.h>
 #include <linux/jffs2.h>
 #include <linux/xattr.h>
-#include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
 static int jffs2_trusted_getxattr(struct inode *inode, const char *name,

--------------000002040700070008020101--
