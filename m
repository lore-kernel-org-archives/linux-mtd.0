Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW2zg-0006dB-Un
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 05:46:01 +0000
Received: by wa-out-1112.google.com with SMTP id v33so192313wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 22:46:00 -0700 (PDT)
Message-ID: <48AD0126.1050609@gmail.com>
Date: Wed, 20 Aug 2008 22:46:14 -0700
From: Jared Hulbert <jaredeh@gmail.com>
MIME-Version: 1.0
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM,
	cotte@de.ibm.com, nickpiggin@yahoo.com.au
Subject: [PATCH 10/10] AXFS: axfs_uncompress.c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: jaredeh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Handles the decompression for axfs, modeled after fs/cramfs/uncompress.c.

Signed-off-by: Jared Hulbert <jaredeh@gmail.com>
---
diff --git a/fs/axfs/axfs_uncompress.c b/fs/axfs/axfs_uncompress.c
new file mode 100644
index 0000000..b7a2060
--- /dev/null
+++ b/fs/axfs/axfs_uncompress.c
@@ -0,0 +1,97 @@
+/*
+ * Advanced XIP File System for Linux - AXFS
+ *   Readonly, compressed, and XIP filesystem for Linux systems big and small
+ *
+ *   Modified in 2006 by Eric Anderson
+ *     from the cramfs sources fs/cramfs/uncompress.c
+ *
+ * (C) Copyright 1999 Linus Torvalds
+ *
+ * axfs_uncompress.c -
+ *  axfs interfaces to the uncompression library. There's really just
+ * three entrypoints:
+ *
+ *  - axfs_uncompress_init() - called to initialize the thing.
+ *  - axfs_uncompress_exit() - tell me when you're done
+ *  - axfs_uncompress_block() - uncompress a block.
+ *
+ * NOTE NOTE NOTE! The uncompression is entirely single-threaded. We
+ * only have one stream, and we'll initialize it only once even if it
+ * then is used by multiple filesystems.
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/vmalloc.h>
+#include <linux/zlib.h>
+#include <linux/mutex.h>
+
+static z_stream stream;
+static int initialized;
+static struct mutex axfs_uncmp_mutex;
+
+int axfs_uncompress_block(void *dst, int dstlen, void *src, int srclen)
+{
+	int err;
+	int out;
+
+	mutex_lock(&axfs_uncmp_mutex);
+
+	stream.next_in = src;
+	stream.avail_in = srclen;
+
+	stream.next_out = dst;
+	stream.avail_out = dstlen;
+
+	err = zlib_inflateReset(&stream);
+	if (err != Z_OK) {
+		printk(KERN_ERR "zlib_inflateReset error %d\n", err);
+		zlib_inflateEnd(&stream);
+		zlib_inflateInit(&stream);
+	}
+
+	err = zlib_inflate(&stream, Z_FINISH);
+	if (err != Z_STREAM_END)
+		goto err;
+
+	out = stream.total_out;
+
+	mutex_unlock(&axfs_uncmp_mutex);
+
+	return out;
+
+err:
+
+	mutex_unlock(&axfs_uncmp_mutex);
+
+	printk(KERN_ERR "Error %d while decompressing!\n", err);
+	printk(KERN_ERR "%p(%d)->%p(%d)\n", src, srclen, dst, dstlen);
+	return 0;
+}
+
+int axfs_uncompress_init(void)
+{
+	if (!initialized++) {
+
+		mutex_init(&axfs_uncmp_mutex);
+
+		stream.workspace = vmalloc(zlib_inflate_workspacesize());
+		if (!stream.workspace) {
+			initialized = 0;
+			return -ENOMEM;
+		}
+		stream.next_in = NULL;
+		stream.avail_in = 0;
+		zlib_inflateInit(&stream);
+	}
+	return 0;
+}
+
+int axfs_uncompress_exit(void)
+{
+	if (!--initialized) {
+		zlib_inflateEnd(&stream);
+		vfree(stream.workspace);
+	}
+	return 0;
+}
