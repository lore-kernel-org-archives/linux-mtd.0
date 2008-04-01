Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhTFf-0004s6-0b
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 17:29:27 +0000
Message-Id: <20080401181332.853833004@logfs.org>
References: <20080401181308.512473173@logfs.org>
Date: Tue, 01 Apr 2008 20:13:08 +0200
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [patch 4/15] fs/logfs/compr.c
From: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- /dev/null	2008-03-30 12:15:48.586669308 +0200
+++ linux-2.6.24logfs/fs/logfs/compr.c	2008-03-25 16:56:40.399236016 +0100
@@ -0,0 +1,95 @@
+/*
+ * fs/logfs/compr.c	- compression routines
+ *
+ * As should be obvious for Linux kernel code, license is GPLv2
+ *
+ * Copyright (c) 2005-2007 Joern Engel <joern@logfs.org>
+ */
+#include "logfs.h"
+#include <linux/vmalloc.h>
+#include <linux/zlib.h>
+
+#define COMPR_LEVEL 3
+
+static DEFINE_MUTEX(compr_mutex);
+static struct z_stream_s stream;
+
+int logfs_compress(void *in, void *out, size_t inlen, size_t outlen)
+{
+	int err, ret;
+
+	ret = -EIO;
+	mutex_lock(&compr_mutex);
+	err = zlib_deflateInit(&stream, COMPR_LEVEL);
+	if (err != Z_OK)
+		goto error;
+
+	stream.next_in = in;
+	stream.avail_in = inlen;
+	stream.total_in = 0;
+	stream.next_out = out;
+	stream.avail_out = outlen;
+	stream.total_out = 0;
+
+	err = zlib_deflate(&stream, Z_FINISH);
+	if (err != Z_STREAM_END)
+		goto error;
+
+	err = zlib_deflateEnd(&stream);
+	if (err != Z_OK)
+		goto error;
+
+	if (stream.total_out >= stream.total_in)
+		goto error;
+
+	ret = stream.total_out;
+error:
+	mutex_unlock(&compr_mutex);
+	return ret;
+}
+
+int logfs_uncompress(void *in, void *out, size_t inlen, size_t outlen)
+{
+	int err, ret;
+
+	ret = -EIO;
+	mutex_lock(&compr_mutex);
+	err = zlib_inflateInit(&stream);
+	if (err != Z_OK)
+		goto error;
+
+	stream.next_in = in;
+	stream.avail_in = inlen;
+	stream.total_in = 0;
+	stream.next_out = out;
+	stream.avail_out = outlen;
+	stream.total_out = 0;
+
+	err = zlib_inflate(&stream, Z_FINISH);
+	if (err != Z_STREAM_END)
+		goto error;
+
+	err = zlib_inflateEnd(&stream);
+	if (err != Z_OK)
+		goto error;
+
+	ret = 0;
+error:
+	mutex_unlock(&compr_mutex);
+	return ret;
+}
+
+int __init logfs_compr_init(void)
+{
+	size_t size = max(zlib_deflate_workspacesize(),
+			zlib_inflate_workspacesize());
+	stream.workspace = vmalloc(size);
+	if (!stream.workspace)
+		return -ENOMEM;
+	return 0;
+}
+
+void logfs_compr_exit(void)
+{
+	vfree(stream.workspace);
+}
