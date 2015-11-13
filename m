Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7k4-0001vC-CY
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:21:52 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 14/27] ubifs: io: introduce ubifs_read function to read ubi
 volume
Date: Fri, 13 Nov 2015 14:13:25 +0800
Message-ID: <1447395218-7061-15-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement a ubifs_read function in io lib. This function
will read the data at offset in length of len from ubi volume
to buf.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/io.h |  2 ++
 ubifs-utils/lib/io.c     | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/ubifs-utils/include/io.h b/ubifs-utils/include/io.h
index 920645d..11f568c 100644
--- a/ubifs-utils/include/io.h
+++ b/ubifs-utils/include/io.h
@@ -16,4 +16,6 @@ int write_leb(struct ubifs_info *c, int lnum, int len, void *buf);
 int close_target(void);
 int open_target(struct ubifs_info *c, int yes);
 int open_ubi(struct ubifs_info *c, const char *node);
+
+int ubifs_read(loff_t offset, int len, void *buf);
 #endif
diff --git a/ubifs-utils/lib/io.c b/ubifs-utils/lib/io.c
index 9817d2a..d05cf86 100644
--- a/ubifs-utils/lib/io.c
+++ b/ubifs-utils/lib/io.c
@@ -132,3 +132,21 @@ int write_leb(struct ubifs_info *c, int lnum, int len, void *buf)
 
 	return 0;
 }
+
+/**
+ * ubifs_read - read data from ubi volume.
+ * @offset: offset of data in volume
+ * @len: length of data in the buffer
+ * @buf: buffer (must be at least c->leb_size bytes)
+ */
+int ubifs_read(loff_t offset, int len, void *buf)
+{
+	if (lseek(out_fd, offset, SEEK_SET) != offset)
+		return sys_err_msg("lseek failed seeking %"PRIdoff_t, offset);
+
+	if (read(out_fd, buf, len) != len)
+		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
+				   len, offset);
+
+	return 0;
+}
-- 
1.8.4.2
