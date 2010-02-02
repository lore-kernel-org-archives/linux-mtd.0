Message-Id: <201002022243.o12MhA38019179@imap1.linux-foundation.org>
Subject: [patch 2/5] jffs2: avoid using C++ keyword `new' in userspace-visible
	header
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 02 Feb 2010 14:43:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	rdiezmail-kernelbugzilla@yahoo.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrew Morton <akpm@linux-foundation.org>

Addresses http://bugzilla.kernel.org/show_bug.cgi?id=14995

Reported-by: R. Diez <rdiezmail-kernelbugzilla@yahoo.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/jffs2/fs.c         |   10 +++++-----
 fs/jffs2/nodelist.h   |    8 ++++----
 include/linux/jffs2.h |    4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff -puN fs/jffs2/fs.c~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header fs/jffs2/fs.c
--- a/fs/jffs2/fs.c~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header
+++ a/fs/jffs2/fs.c
@@ -313,8 +313,8 @@ struct inode *jffs2_iget(struct super_bl
 	case S_IFBLK:
 	case S_IFCHR:
 		/* Read the device numbers from the media */
-		if (f->metadata->size != sizeof(jdev.old) &&
-		    f->metadata->size != sizeof(jdev.new)) {
+		if (f->metadata->size != sizeof(jdev.old_id) &&
+		    f->metadata->size != sizeof(jdev.new_id)) {
 			printk(KERN_NOTICE "Device node has strange size %d\n", f->metadata->size);
 			goto error_io;
 		}
@@ -325,10 +325,10 @@ struct inode *jffs2_iget(struct super_bl
 			printk(KERN_NOTICE "Read device numbers for inode %lu failed\n", (unsigned long)inode->i_ino);
 			goto error;
 		}
-		if (f->metadata->size == sizeof(jdev.old))
-			rdev = old_decode_dev(je16_to_cpu(jdev.old));
+		if (f->metadata->size == sizeof(jdev.old_id))
+			rdev = old_decode_dev(je16_to_cpu(jdev.old_id));
 		else
-			rdev = new_decode_dev(je32_to_cpu(jdev.new));
+			rdev = new_decode_dev(je32_to_cpu(jdev.new_id));
 
 	case S_IFSOCK:
 	case S_IFIFO:
diff -puN fs/jffs2/nodelist.h~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header fs/jffs2/nodelist.h
--- a/fs/jffs2/nodelist.h~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header
+++ a/fs/jffs2/nodelist.h
@@ -312,11 +312,11 @@ static inline int jffs2_blocks_use_vmall
 static inline int jffs2_encode_dev(union jffs2_device_node *jdev, dev_t rdev)
 {
 	if (old_valid_dev(rdev)) {
-		jdev->old = cpu_to_je16(old_encode_dev(rdev));
-		return sizeof(jdev->old);
+		jdev->old_id = cpu_to_je16(old_encode_dev(rdev));
+		return sizeof(jdev->old_id);
 	} else {
-		jdev->new = cpu_to_je32(new_encode_dev(rdev));
-		return sizeof(jdev->new);
+		jdev->new_id = cpu_to_je32(new_encode_dev(rdev));
+		return sizeof(jdev->new_id);
 	}
 }
 
diff -puN include/linux/jffs2.h~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header include/linux/jffs2.h
--- a/include/linux/jffs2.h~jffs2-avoid-using-c-keyword-new-in-userspace-visible-header
+++ a/include/linux/jffs2.h
@@ -215,8 +215,8 @@ union jffs2_node_union
 
 /* Data payload for device nodes. */
 union jffs2_device_node {
-	jint16_t old;
-	jint32_t new;
+	jint16_t old_id;
+	jint32_t new_id;
 };
 
 #endif /* __LINUX_JFFS2_H__ */
_
