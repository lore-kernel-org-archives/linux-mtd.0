Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNxKs-00056Z-IH
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 06:42:43 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>, linux-mtd@lists.infradead.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH] Adapt raw page accesses to match the new raw_read/write
 implementation
Date: Tue, 26 Jan 2016 07:42:17 +0100
Message-Id: <1453790537-20566-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
 <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris BREZILLON <boris.brezillon@free-electrons.com>

The old raw access implementation (in GPMI driver) was considering that
data and OOB data were separated in their respective regions (the data
area and the OOB area of the page), which is not true.
They are actually interleaved this way:

METADATA + ((DATA + ECCBYTES) * N)

The new raw access implementation (in the GPMI driver) is hiding this weird
layout to MTD users by exposing a more common layout:

DATA + METADATA + (N * ECCBYTES)

Here METADATA + (N * ECCBYTES) are exposed as if they were stored in the
OOB area.

Unfortunately kobs-ng rely on this weird layout when accessing the NAND
in raw mode.
This patch take the new layout into account.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 src/mtd.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/src/mtd.c b/src/mtd.c
index 02af33b..f6fa962 100644
--- a/src/mtd.c
+++ b/src/mtd.c
@@ -254,14 +254,26 @@ int mtd_read_page(struct mtd_data *md, int chip, loff_t ofs, int ecc)
 
 	mtd_set_ecc_mode(md, ecc);
 
-	data = md->buf;
+	if (ecc) {
+		data = md->buf;
+	} else {
+		data = malloc(mtd_writesize(md) + mtd_oobsize(md));
+		if (!data) {
+			fprintf(stderr, "mtd: %s failed to allocate buffer\n", __func__);
+			return -1;
+		}
+	}
+
 	oobdata = data + mtd_writesize(md);
 
 	/* make sure it's aligned to a page */
-	if ((ofs % mtd_writesize(md)) != 0)
+	if ((ofs % mtd_writesize(md)) != 0) {
+		if (!ecc)
+			free(data);
 		return -1;
+	}
 
-	memset(md->buf, 0, mtd_writesize(md) + mtd_oobsize(md));
+	memset(data, 0, mtd_writesize(md) + mtd_oobsize(md));
 
 	size = mtd_writesize(md);
 
@@ -269,6 +281,33 @@ int mtd_read_page(struct mtd_data *md, int chip, loff_t ofs, int ecc)
 		r = pread(md->part[chip].fd, data, size, ofs);
 	} while (r == -1 && (errno == EAGAIN || errno == EBUSY));
 
+	if (!ecc) {
+		int i;
+		struct nfc_geometry *nfc_geo = &md->nfc_geometry;
+		int eccbytes = ((nfc_geo->ecc_strength * nfc_geo->gf_len) + 7) / 8;
+		int chunksize = nfc_geo->ecc_chunk_size_in_bytes;
+		int dst_offset = 0;
+
+		memcpy(md->buf, oobdata, nfc_geo->metadata_size_in_bytes);
+		dst_offset += nfc_geo->metadata_size_in_bytes;
+		for (i = 0; i < nfc_geo->ecc_chunk_count; i++) {
+			memcpy(md->buf + dst_offset, data + (i * chunksize), chunksize);
+			dst_offset += chunksize;
+			memcpy(md->buf + dst_offset,
+			       oobdata + nfc_geo->metadata_size_in_bytes + (i * eccbytes),
+			       eccbytes);
+			dst_offset += eccbytes;
+		}
+
+		if (mtd_writesize(md) + mtd_oobsize(md) > dst_offset) {
+			memcpy(md->buf + dst_offset,
+			       oobdata + nfc_geo->metadata_size_in_bytes + (i * eccbytes),
+			       mtd_writesize(md) + mtd_oobsize(md) - dst_offset);
+		}
+
+		free(data);
+	}
+
 	/* end of partition? */
 	if (r == 0)
 		return 0;
@@ -329,23 +368,71 @@ int mtd_write_page(struct mtd_data *md, int chip, loff_t ofs, int ecc)
 	int r;
 	const void *data;
 	const void *oobdata;
+	struct mtd_write_req ops;
 
 	mtd_set_ecc_mode(md, ecc);
 
-	data = md->buf;
-	oobdata = data + mtd_oobsize(md);
+	if (ecc) {
+		data = md->buf;
+		oobdata = data + mtd_writesize(md);
+	} else {
+		int i;
+		struct nfc_geometry *nfc_geo = &md->nfc_geometry;
+		int eccbytes = ((nfc_geo->ecc_strength * nfc_geo->gf_len) + 7) / 8;
+		int chunksize = nfc_geo->ecc_chunk_size_in_bytes;
+		int src_offset = 0;
+
+		data = malloc(mtd_writesize(md) + mtd_oobsize(md));
+		if (!data) {
+			fprintf(stderr, "mtd: %s failed to allocate buffer\n", __func__);
+			return -1;
+		}
+		oobdata = data + mtd_writesize(md);
+		memset(data, 0, mtd_writesize(md) + mtd_oobsize(md));
+		memcpy(oobdata, md->buf, nfc_geo->metadata_size_in_bytes);
+		src_offset += nfc_geo->metadata_size_in_bytes;
+		for (i = 0; i < nfc_geo->ecc_chunk_count; i++) {
+			memcpy(data + (i * chunksize), md->buf + src_offset, chunksize);
+			src_offset += chunksize;
+			memcpy(oobdata + nfc_geo->metadata_size_in_bytes + (i * eccbytes),
+			       md->buf + src_offset, eccbytes);
+			src_offset += eccbytes;
+		}
+
+		if (mtd_writesize(md) + mtd_oobsize(md) > src_offset) {
+			memcpy(oobdata + nfc_geo->metadata_size_in_bytes + (i * eccbytes),
+			       md->buf + src_offset,
+			       mtd_writesize(md) + mtd_oobsize(md) - src_offset);
+		}
+	}
 
 	/* make sure it's aligned to a page */
 	if ((ofs % mtd_writesize(md)) != 0) {
 		fprintf(stderr, "mtd: %s failed\n", __func__);
+		if (!ecc)
+			free(data);
 		return -1;
 	}
 
 	size = mtd_writesize(md);
 
+	ops.start = ofs;
+	ops.len = size;
+	ops.ooblen = ecc ? 0 : mtd_oobsize(md);
+	ops.usr_oob = (uint64_t)(unsigned long)oobdata;
+	ops.usr_data = (uint64_t)(unsigned long)data;
+	ops.mode = ecc ? MTD_OPS_AUTO_OOB : MTD_OPS_RAW;
+	r = ioctl(md->part[chip].fd, MEMWRITE, &ops);
+	if (!r)
+		r = size;
+	/*
 	do {
 		r = pwrite(md->part[chip].fd, data, size, ofs);
 	} while (r == -1 && (errno == EAGAIN || errno == EBUSY));
+	*/
+
+	if (!ecc)
+		free(data);
 
 	/* end of partition? */
 	if (r == 0) {
-- 
1.9.1
