Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMLON-0008D8-QO
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 14:37:01 +0000
Received: by mail-pz0-f49.google.com with SMTP id 28so297686pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 May 2011 07:36:59 -0700 (PDT)
From: Wanlong Gao <wanlong.gao@gmail.com>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 2/2] driver:mtd:fix the bad format in the mtdcore.c
Date: Tue, 17 May 2011 22:36:19 +0800
Message-Id: <1305642979-7419-2-git-send-email-wanlong.gao@gmail.com>
In-Reply-To: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
References: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
Cc: Wanlong Gao <wanlong.gao@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wanlong Gao <wanlong.gao@gmail.com>

Fix the bad format in the mtdcore.c.

Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>
---
 drivers/mtd/mtdcore.c |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9b7ad35..524e030 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -615,7 +615,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	if(!mtd->write) {
 		ret = -EROFS;
 	} else {
-		for (i=0; i<count; i++) {
+		for (i = 0; i < count; i++) {
 			if (!vecs[i].iov_len)
 				continue;
 			ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
@@ -651,8 +651,8 @@ static struct proc_dir_entry *proc_mtd;
 static inline int mtd_proc_info(char *buf, struct mtd_info *this)
 {
 	return sprintf(buf, "mtd%d: %8.8llx %8.8x \"%s\"\n", this->index,
-		       (unsigned long long)this->size,
-		       this->erasesize, this->name);
+			(unsigned long long)this->size,
+			this->erasesize, this->name);
 }
 
 static int mtd_read_proc (char *page, char **start, off_t off, int count,
@@ -660,30 +660,30 @@ static int mtd_read_proc (char *page, char **start, off_t off, int count,
 {
 	struct mtd_info *mtd;
 	int len, l;
-        off_t   begin = 0;
+	off_t begin = 0;
 
 	mutex_lock(&mtd_table_mutex);
 
 	len = sprintf(page, "dev:    size   erasesize  name\n");
 	mtd_for_each_device(mtd) {
 		l = mtd_proc_info(page + len, mtd);
-                len += l;
-                if (len+begin > off+count)
-                        goto done;
-                if (len+begin < off) {
-                        begin += len;
-                        len = 0;
-                }
-        }
+		len += l;
+		if (len + begin > off + count)
+			goto done;
+		if (len + begin < off) {
+			begin += len;
+			len = 0;
+		}
+	}
 
-        *eof = 1;
+	*eof = 1;
 
 done:
 	mutex_unlock(&mtd_table_mutex);
-        if (off >= len+begin)
-                return 0;
-        *start = page + (off-begin);
-        return ((count < begin+len-off) ? count : begin+len-off);
+	if (off >= len + begin)
+		return 0;
+	*start = page + (off - begin);
+	return ((count < begin + len - off) ? count : begin + len - off);
 }
 
 #endif /* CONFIG_PROC_FS */
-- 
1.7.4.1
