Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9e-0001KQ-Vt
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:17:12 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/11] ubifs: add emubi, a minimal UBI emulation layer
Date: Sat, 31 Oct 2015 12:15:59 +0100
Message-Id: <1446290160-30696-11-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
References: <1446290160-30696-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

emubi enables processing of ubi images (e.g. created using nanddump) as input
instead of using the ubi volume directly.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 Makefile                    |   2 +-
 ubifs-utils/include/emubi.h |  81 ++++++++++
 ubifs-utils/include/io.h    |   2 +
 ubifs-utils/include/ubifs.h |   4 +
 ubifs-utils/lib/emubi.c     | 351 ++++++++++++++++++++++++++++++++++++++++++++
 ubifs-utils/lib/io.c        |  63 +++++++-
 ubifs-utils/lib/scan.c      |  10 +-
 7 files changed, 510 insertions(+), 3 deletions(-)
 create mode 100644 ubifs-utils/include/emubi.h
 create mode 100644 ubifs-utils/lib/emubi.c

diff --git a/Makefile b/Makefile
index 91f9820..72681f4 100644
--- a/Makefile
+++ b/Makefile
@@ -130,7 +130,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 #
 # Utils in ubifs-utils subdir
 #
-$(foreach v,crc16.o lpt.o compr.o devtable.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
+$(foreach v,crc16.o lpt.o compr.o devtable.o emubi.o io.o hashtable.o hashtable_itr.o,$(eval UBIFS_LIBS += ../lib/$(v)))
 
 obj-ubifs_dump = $(UBIFS_LIBS)
 obj-ubifs_dump += ../lib/scan.o ../lib/master.o ../lib/lprops.o ../lib/hexdump.o
diff --git a/ubifs-utils/include/emubi.h b/ubifs-utils/include/emubi.h
new file mode 100644
index 0000000..e06ba7d
--- /dev/null
+++ b/ubifs-utils/include/emubi.h
@@ -0,0 +1,81 @@
+/*
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+#ifndef __UBIFS_EMUBI_H__
+#define __UBIFS_EMUBI_H__
+
+#include <assert.h>
+#include "list.h"
+
+enum {
+	EMUBI_MODE_FILE,
+	EMUBI_MODE_MMAP
+};
+
+/*
+ * LEB to PEB mapping.
+ * @pnum: PEB number this LEB belongs to, (for mode EMUBI_MODE_FILE)
+ * @data: pointer to start of PEB data (for mode EMUBI_MODE_MMAP)
+ */
+union emubi_eba {
+	int pnum;
+	char *data;
+};
+
+/*
+ * embui context
+ * @peb_size: PEB size in bytes
+ * @page_size: min I/O size used for UBI data (this is not the sub-page size)
+ * @vol_id: volume id
+ * @flash_fd: file descriptor of input file
+ * @mode: emubi mode
+ * @flash_mmap: mmap-ed input file when mode is set to EMUBI_MODE_MMAP
+ * @flash_size: total flash size in bytes
+ * @peb_count: total number of PEBs
+ * @leb_start: offset where LEB data starts
+ * @ff_peb: empty PEB
+ * @eba: eraseblock association table
+ * @scan_lebs: list of scanned LEBs
+ */
+struct emubi_ctx {
+	int peb_size;
+	int page_size;
+	int vol_id;
+
+	int flash_fd;
+	int mode;
+	char *flash_mmap;
+	unsigned long flash_size;
+
+	unsigned int peb_count;
+	unsigned int leb_start;
+	char *ff_peb;
+	union emubi_eba *eba;
+
+	struct list_head scan_lebs;
+};
+
+void emubi_print(struct emubi_ctx *ctx);
+int emubi_scan(struct emubi_ctx *ctx);
+int emubi_open(struct emubi_ctx *ctx, char *file);
+int emubi_leb_read(struct emubi_ctx *ctx, unsigned int lnum, unsigned int offset,
+		   char *lbuf, size_t len);
+
+#endif
diff --git a/ubifs-utils/include/io.h b/ubifs-utils/include/io.h
index 11f568c..e5c3d6c 100644
--- a/ubifs-utils/include/io.h
+++ b/ubifs-utils/include/io.h
@@ -18,4 +18,6 @@ int open_target(struct ubifs_info *c, int yes);
 int open_ubi(struct ubifs_info *c, const char *node);
 
 int ubifs_read(loff_t offset, int len, void *buf);
+int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
+		   int len);
 #endif
diff --git a/ubifs-utils/include/ubifs.h b/ubifs-utils/include/ubifs.h
index d4794cf..ed04383 100644
--- a/ubifs-utils/include/ubifs.h
+++ b/ubifs-utils/include/ubifs.h
@@ -28,6 +28,7 @@
 #include "defs.h"
 #include "list.h"
 #include "libubi.h"
+#include "emubi.h"
 
 /* Maximum logical eraseblock size in bytes */
 #define UBIFS_MAX_LEB_SZ (2*1024*1024)
@@ -372,6 +373,8 @@ enum {
  * @lsave_offs: offset of LPT's save table
  * @lsave: LPT's save table
  * @lscan_lnum: LEB number of last LPT scan
+ *
+ * @emubi: emubi context for working with image files
  * @verbose: verbose mode enabled
  */
 struct ubifs_info
@@ -465,6 +468,7 @@ struct ubifs_info
 
 	int max_znode_sz;
 
+	struct emubi_ctx *emubi;
 	int verbose;
 };
 /**
diff --git a/ubifs-utils/lib/emubi.c b/ubifs-utils/lib/emubi.c
new file mode 100644
index 0000000..1c88eea
--- /dev/null
+++ b/ubifs-utils/lib/emubi.c
@@ -0,0 +1,351 @@
+/*
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
+#define PROGRAM_NAME "emubi"
+
+#include <sys/mman.h>
+
+#include "emubi.h"
+#include "common.h"
+#include "ubifs_common.h"
+#include "crc32.h"
+#include "xalloc.h"
+
+struct ubi_scan_leb {
+	struct list_head l;
+	int lnum;
+	int pnum;
+	unsigned long long sqnum;
+	unsigned int copy_flag:1;
+};
+
+static inline int get_peb(struct emubi_ctx *ctx, unsigned int pnum, char **pbuf,
+			  unsigned int offset, unsigned int len)
+{
+	off_t pos;
+
+	if (pnum >= ctx->peb_count)
+		errmsg_die("Invalid PEB number %u", pnum);
+
+	if (offset >= ctx->peb_size)
+		errmsg_die("Invalid read offset %u (PEB size %u)", offset, ctx->peb_size);
+
+	if (len > ctx->peb_size - offset)
+		return errmsg("Invalid read outside of PEB (size %u, offset %u, read len %u)",
+			      ctx->peb_size, offset, len);
+
+	pos = (pnum * ctx->peb_size) + offset;
+	switch (ctx->mode) {
+	case EMUBI_MODE_MMAP:
+		*pbuf = ctx->flash_mmap + pos;
+		break;
+	case EMUBI_MODE_FILE:
+		if (!*pbuf)
+			errmsg_die("pbuf must not be null!");
+
+		if (lseek(ctx->flash_fd, pos, SEEK_SET) != pos)
+			return errmsg("Failed to lseek input file: %m");
+
+		if (read(ctx->flash_fd, *pbuf, len) != len)
+			return errmsg("Failed to read from input file: %m");
+
+		break;
+	default:
+		return errmsg("Invalid emubi mode %d", ctx->mode);
+	}
+
+	return 0;
+}
+
+int emubi_leb_read(struct emubi_ctx *ctx, unsigned int lnum, unsigned int offset,
+		   char *lbuf, size_t len)
+{
+	char *leb;
+	int err;
+
+	if (lnum >= ctx->peb_count)
+		return errmsg("LEB number invalid %u!", lnum);
+
+	switch (ctx->mode) {
+	case EMUBI_MODE_MMAP:
+		if (ctx->eba[lnum].data)
+			leb = ctx->eba[lnum].data;
+		else
+			leb = ctx->ff_peb;
+
+		memcpy(lbuf, leb + ctx->leb_start + offset, len);
+		break;
+	case EMUBI_MODE_FILE:
+		if (ctx->eba[lnum].pnum == -1) {
+			memset(lbuf, 0xFF, len);
+		} else {
+			err = get_peb(ctx, ctx->eba[lnum].pnum, &lbuf,
+				      ctx->leb_start + offset, len);
+			if (err)
+				return errmsg("LEB read failed: %m");
+		}
+
+		break;
+	default:
+		errmsg_die("Unknown emubi mode!");
+	}
+
+	return 0;
+}
+
+static struct ubi_scan_leb *scan_leb_new(int pnum, struct ubi_vid_hdr *vh)
+{
+	struct ubi_scan_leb *sl = xmalloc(sizeof(*sl));
+
+	sl->lnum = be32toh(vh->lnum);
+	sl->sqnum = be64toh(vh->sqnum);
+	sl->pnum = pnum;
+	sl->copy_flag = !!vh->copy_flag;
+
+	return sl;
+}
+
+static int scan_leb_crc_check(struct emubi_ctx *ctx, int pnum, struct ubi_vid_hdr *vh, char *pbuf)
+{
+	int data_len;
+	uint32_t data_crc, crc;
+
+	if (!vh->copy_flag)
+		return 0;
+
+	data_len = be32toh(vh->data_size);
+	if (!data_len)
+		return 0;
+
+	assert(data_len <= ctx->peb_size - ctx->leb_start);
+
+	data_crc = be32toh(vh->data_crc);
+	crc = mtd_crc32(UBI_CRC32_INIT, pbuf + ctx->leb_start, data_len);
+
+	if (crc != data_crc) {
+		errmsg("crc mismatch in peb %i", pnum);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void scan_leb_apply(struct emubi_ctx *ctx, int pnum, struct ubi_vid_hdr *scan_vh, char *pbuf)
+{
+	struct ubi_scan_leb *tmp_sl, *sl, *dup_sl = NULL;
+	int lnum = be32toh(scan_vh->lnum);
+
+	if (scan_leb_crc_check(ctx, pnum, scan_vh, pbuf) < 0)
+		return;
+
+	list_for_each_entry(tmp_sl, &ctx->scan_lebs, l) {
+		if (tmp_sl->lnum == lnum) {
+			dup_sl = tmp_sl;
+			break;
+		}
+	}
+
+	sl = scan_leb_new(pnum, scan_vh);
+
+	if (sl->lnum >= ctx->peb_count) {
+		warnmsg("Found a LEB >= PEB count! Image truncated?");
+		return;
+	}
+
+	if (!dup_sl) {
+		list_add_tail(&sl->l, &ctx->scan_lebs);
+
+		return;
+	}
+
+	if (dup_sl->sqnum == sl->sqnum)
+		errmsg_die("Duplicate LEB with identical UBI sequence number!");
+
+	if (dup_sl->sqnum > sl->sqnum) {
+		free(sl);
+	} else {
+		list_del(&dup_sl->l);
+		free(dup_sl);
+		list_add_tail(&sl->l, &ctx->scan_lebs);
+	}
+}
+
+static int eba_from_scan(struct emubi_ctx *ctx)
+{
+	struct ubi_scan_leb *sl;
+
+	list_for_each_entry(sl, &ctx->scan_lebs, l) {
+		switch (ctx->mode) {
+		case EMUBI_MODE_MMAP:
+			ctx->eba[sl->lnum].data = ctx->flash_mmap + (sl->pnum * ctx->peb_size);
+			break;
+		case EMUBI_MODE_FILE:
+			ctx->eba[sl->lnum].pnum = sl->pnum;
+			break;
+		default:
+			return errmsg("Invalid emubi mode %d", ctx->mode);
+		}
+	}
+
+	return 0;
+}
+
+void emubi_print(struct emubi_ctx *ctx)
+{
+	normsg("flash metadata:");
+	printf("\tPEB size: ");
+	print_bytes(ctx->peb_size, 0);
+	printf("\n\tmin. I/O unit size: ");
+	print_bytes(ctx->page_size, 0);
+	printf("\n\tvolume ID: %d", ctx->vol_id);
+
+	if (ctx->flash_mmap) {
+		printf("\n\tflash size: ");
+		print_bytes(ctx->flash_size, 0);
+		printf("\n\tPEB count: %u", ctx->peb_count);
+		printf("\n\tdata offset: %u", ctx->leb_start);
+	}
+	printf("\n\temubi mode: %s\n", (ctx->mode == EMUBI_MODE_MMAP) ? "mmap" : "file");
+}
+
+static int is_empty(struct emubi_ctx *ctx, char *pbuf, size_t len)
+{
+	return memcmp(pbuf, ctx->ff_peb, len) == 0;
+}
+
+static inline void init_eba(struct emubi_ctx *ctx, int leb_start)
+{
+	int i;
+	//TODO: replace peb_count by correct value from vol table
+	ctx->eba = xcalloc(ctx->peb_count, sizeof(ctx->eba[0]));
+	ctx->leb_start = leb_start;
+
+	if (ctx->mode == EMUBI_MODE_FILE) {
+		for (i = 0; i < ctx->peb_count; i++) {
+			ctx->eba[i].pnum = -1;
+		}
+	}
+}
+
+int emubi_scan(struct emubi_ctx *ctx)
+{
+	int n, err;
+	char *pbuf = NULL;
+
+	INIT_LIST_HEAD(&ctx->scan_lebs);
+
+	if (ctx->mode == EMUBI_MODE_FILE)
+		pbuf = xmalloc(ctx->peb_size);
+
+	normsg("scanning for logical erase blocks...");
+	for (n = 0; n < ctx->peb_count; n++) {
+		err = get_peb(ctx, n, &pbuf, 0, ctx->peb_size);
+		if (err)
+			goto out;
+
+		struct ubi_ec_hdr *ec = (struct ubi_ec_hdr *)pbuf;
+		struct ubi_vid_hdr *vid;
+
+		if (be32toh(ec->magic) != UBI_EC_HDR_MAGIC) {
+			errmsg("PEB %u contains no valid EC header\n", n);
+			continue;
+		}
+
+		vid = (struct ubi_vid_hdr *)(pbuf + be32toh(ec->vid_hdr_offset));
+		if (be32toh(vid->magic) != UBI_VID_HDR_MAGIC) {
+			/* skip over pebs with empty vid header */
+			if (is_empty(ctx, (char *)vid, ctx->page_size))
+				continue;
+
+			errmsg("PEB %u contains invalid VID header\n", n);
+		}
+
+		if (!ctx->eba) {
+			init_eba(ctx, be32toh(ec->data_offset));
+		}
+
+		if (be32toh(vid->vol_id) == ctx->vol_id)
+			scan_leb_apply(ctx, n, vid, pbuf);
+	}
+
+	err = eba_from_scan(ctx);
+
+out:
+	if (ctx->mode == EMUBI_MODE_FILE)
+		free(pbuf);
+
+	return err;
+}
+
+int emubi_open(struct emubi_ctx *ctx, char *file)
+{
+	int err;
+	int fd;
+	struct stat stbuf;
+
+	normsg("opening UBI image file %s...", file);
+	fd = open(file, O_RDONLY);
+	if (fd < 0) {
+		errmsg("Unable to open %s: %m", file);
+		err = -1;
+		goto out;
+	}
+
+	memset(&stbuf, 0, sizeof(stbuf));
+	if (fstat(fd, &stbuf) != 0) {
+		errmsg("Unable to stat %s: %m", file);
+		close(fd);
+		err = -1;
+		goto out;
+	}
+	ctx->flash_size = stbuf.st_size;
+	if (ctx->flash_size % ctx->peb_size) {
+		errmsg("Image size is not a multiple of PEB size %u", ctx->peb_size);
+		close(fd);
+		err = -1;
+		goto out;
+	}
+
+	if (ctx->mode == EMUBI_MODE_MMAP) {
+		ctx->flash_mmap = mmap(NULL, ctx->flash_size, PROT_READ, MAP_PRIVATE, fd, 0);
+		if (ctx->flash_mmap == MAP_FAILED) {
+			errmsg("Unable to mmap %s: %m. Falling back to file mode", file);
+			ctx->flash_mmap = NULL;
+			ctx->mode = EMUBI_MODE_FILE;
+		} else {
+			/* we won't need that anymore */
+			close(fd);
+		}
+	}
+
+	if (ctx->mode == EMUBI_MODE_FILE) {
+		ctx->flash_mmap = NULL;
+		ctx->flash_fd = fd;
+	}
+
+	ctx->eba = NULL;
+	ctx->peb_count = ctx->flash_size / ctx->peb_size;
+	ctx->ff_peb = xmalloc(ctx->peb_size);
+	memset(ctx->ff_peb, 0xFF, ctx->peb_size);
+
+	err = 0;
+out:
+	return err;
+}
diff --git a/ubifs-utils/lib/io.c b/ubifs-utils/lib/io.c
index c2e0d63..28d8504 100644
--- a/ubifs-utils/lib/io.c
+++ b/ubifs-utils/lib/io.c
@@ -1,7 +1,39 @@
+/*
+ * Copyright (C) 2008 Nokia Corporation.
+ * Copyright (C) 2008 University of Szeged, Hungary
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Adrian Hunter
+ *          Artem Bityutskiy
+ *          Zoltan Sogor
+ */
+/*
+ * Modifications for mtd-utils.
+ *
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
+
 #include "io.h"
 #define PROGRAM_NAME "ubifs-io"
-#include <common.h>
+#include "common.h"
+#include "emubi.h"
 
+// TODO: move these to struct ubifs_info ?
 int out_fd;
 int out_ubi;
 libubi_t ubi;
@@ -150,3 +182,32 @@ int ubifs_read(loff_t offset, int len, void *buf)
 
 	return 0;
 }
+
+/*
+ * ubifs_leb_read - read LEB data
+ * @c: ubifs context
+ * @lnum: LEB number
+ * @buf: output buffer
+ * @offs: offset in LEB
+ * @len: length of data to read
+ */
+
+int ubifs_leb_read(const struct ubifs_info *c, int lnum, void *buf, int offs,
+		   int len)
+{
+	int seek_offs;
+
+	if (c->emubi) {
+		emubi_leb_read(c->emubi, lnum, offs, buf, len);
+	} else {
+		seek_offs = (lnum * c->leb_size) + offs;
+		if (lseek(out_fd, seek_offs, SEEK_SET) != seek_offs)
+			return sys_err_msg("lseek failed seeking %d", seek_offs);
+
+		if (read(out_fd, buf, len) != len)
+			return sys_err_msg("read failed reading %d bytes at pos %d",
+					   len, seek_offs);
+	}
+
+	return 0;
+}
diff --git a/ubifs-utils/lib/scan.c b/ubifs-utils/lib/scan.c
index 3c5be2c..1811e4a 100644
--- a/ubifs-utils/lib/scan.c
+++ b/ubifs-utils/lib/scan.c
@@ -16,6 +16,14 @@
  * this program; if not, write to the Free Software Foundation, Inc., 51
  * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
  */
+/*
+ * Modifications for mtd-utils.
+ *
+ * Copyright (C) 2015 sigma star gmbh
+ *
+ * Authors: Richard Weinberger
+ *          David Gstir
+ */
 
 /*
  * This file implements the scan which is a general-purpose function for
@@ -131,7 +139,7 @@ struct ubifs_scan_leb *ubifs_start_scan(const struct ubifs_info *c, int lnum,
 	INIT_LIST_HEAD(&sleb->nodes);
 	sleb->buf = sbuf;
 
-	err = ubifs_read(lnum * c->leb_size + offs, c->leb_size - offs, sbuf + offs);
+	err = ubifs_leb_read(c, lnum, sbuf + offs, offs, c->leb_size - offs);
 	if (err && err != -EBADMSG) {
 		kfree(sleb);
 		return ERR_PTR(err);
-- 
2.5.0
