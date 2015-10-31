Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsU9I-0001Hu-On
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 11:16:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, yangds.fnst@cn.fujitsu.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 04/11] ubifs: add decompression functions
Date: Sat, 31 Oct 2015 12:15:53 +0100
Message-Id: <1446290160-30696-5-git-send-email-richard@nod.at>
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

This enables decompression of lzo and zlib compressed data in addition to the
existin compression functions.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/include/compr.h |  1 +
 ubifs-utils/lib/compr.c     | 75 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/ubifs-utils/include/compr.h b/ubifs-utils/include/compr.h
index d44a2ba..9f6a173 100644
--- a/ubifs-utils/include/compr.h
+++ b/ubifs-utils/include/compr.h
@@ -39,6 +39,7 @@ enum compression_type
 };
 
 int compress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len, int type, int lzo_percent);
+int decompress_data(void *in_buf, size_t in_len, void *out_buf, size_t *out_len, int type);
 int init_compression(void);
 void destroy_compression(void);
 
diff --git a/ubifs-utils/lib/compr.c b/ubifs-utils/lib/compr.c
index 35cc447..a4591f8 100644
--- a/ubifs-utils/lib/compr.c
+++ b/ubifs-utils/lib/compr.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (C) 2008 Nokia Corporation.
  * Copyright (C) 2008 University of Szeged, Hungary
+ * Copyright (C) 2015 sigma star gmbh
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License version 2 as published by
@@ -18,6 +19,8 @@
  * Authors: Artem Bityutskiy
  *          Adrian Hunter
  *          Zoltan Sogor
+ *          Richard Weinberger
+ *          David Gstir
  */
 
 #include "ubifs_common.h"
@@ -79,6 +82,47 @@ static int zlib_deflate(void *in_buf, size_t in_len, void *out_buf,
 	return 0;
 }
 
+static int zlib_inflate(void *in_buf, size_t in_len, void *out_buf,
+			size_t *out_len)
+{
+	z_stream strm;
+
+	strm.zalloc = NULL;
+	strm.zfree = NULL;
+
+	/*
+	 * Match exactly the zlib parameters used by the Linux kernel crypto
+	 * API.
+	 */
+        if (inflateInit2(&strm, -DEFLATE_DEF_WINBITS)) {
+		errcnt += 1;
+		return -1;
+	}
+
+	strm.next_in = in_buf;
+	strm.avail_in = in_len;
+	strm.total_in = 0;
+
+	strm.next_out = out_buf;
+	strm.avail_out = *out_len;
+	strm.total_out = 0;
+
+	if (inflate(&strm, Z_FINISH) != Z_STREAM_END) {
+		inflateEnd(&strm);
+		errcnt += 1;
+		return -1;
+	}
+
+	if (inflateEnd(&strm) != Z_OK) {
+		errcnt += 1;
+		return -1;
+	}
+
+	*out_len = strm.total_out;
+
+	return 0;
+}
+
 static int lzo_compress(void *in_buf, size_t in_len, void *out_buf,
 			size_t *out_len)
 {
@@ -189,6 +233,37 @@ int compress_data(void *in_buf, size_t in_len, void *out_buf,
 	return type;
 }
 
+int decompress_data(void *in_buf, size_t in_len, void *out_buf,
+		    size_t *out_len, int type)
+{
+	int err = 0;
+
+	switch (type) {
+	case UBIFS_COMPR_NONE:
+		if (*out_len < in_len) {
+			err = -1;
+			goto out;
+		}
+		memcpy(out_buf, in_buf, in_len);
+		*out_len = in_len;
+		break;
+	case UBIFS_COMPR_LZO:
+		err = lzo1x_decompress_safe(in_buf, in_len, (unsigned char *)out_buf, out_len, NULL);
+		err = (err == LZO_E_OK) ? 0 : -1;
+		break;
+	case UBIFS_COMPR_ZLIB:
+		err = zlib_inflate(in_buf, in_len, out_buf, out_len);
+		break;
+	default:
+		errcnt += 1;
+		err = 1;
+		break;
+	}
+
+out:
+	return err;
+}
+
 int init_compression(void)
 {
 	lzo_mem = malloc(LZO1X_999_MEM_COMPRESS);
-- 
2.5.0
