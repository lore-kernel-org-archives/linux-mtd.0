From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Wed, 8 Jun 2011 15:30:14 +0300
Subject: [PATCH] libmtd: improve mtd_islocked interface
Message-ID: <mailman.10.1307536333.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch first of all, re-names 'mtd_islocked()' into 'mtd_is_locked()' since
this seems to be the name Mike wanted, and it looks a bit nicer.

This patch also makes 'mtd_is_locked()' print an error message if it fails. I'm
not sure if it is good idea for a library to do so, but all functions do this,
so it certainly _not_ a good idea to be inconsistent.

However, for the special case, when the the "is locked" ioctl is not supported
or is not valid for this device, we do not print an error message and return
ENOTSUPP error code.

Thus, the user can distinguish between real errors and non-fatal "not
supported" cases.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/libmtd.h |    8 +++++---
 lib/libmtd.c     |   13 +++++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 7275246..9efccbc 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -190,16 +190,18 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb);
 int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo);
 
 /**
- * mtd_islocked - see if the specified eraseblock is locked.
+ * mtd_is_locked - see if the specified eraseblock is locked.
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
  * @eb: eraseblock to check
  *
  * This function checks to see if eraseblock @eb of MTD device described
  * by @fd is locked. Returns %0 if it is unlocked, %1 if it is locked, and
- * %-1 in case of failure.
+ * %-1 in case of failure. If the ioctl is not supported (support was added in
+ * Linux kernel 2.6.36) or this particular device does not support it, errno is
+ * set to @ENOTSUPP.
  */
-int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
  * mtd_torture - torture an eraseblock.
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 2573cc7..c34874e 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -900,14 +900,23 @@ int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
 	return 0;
 }
 
-int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb)
 {
+	int ret;
 	erase_info_t ei;
 
 	ei.start = eb * mtd->eb_size;
 	ei.length = mtd->eb_size;
 
-	return ioctl(fd, MEMISLOCKED, &ei);
+	ret = ioctl(fd, MEMISLOCKED, &ei);
+	if (ret < 0) {
+		if (errno != ENOTTY && errno != EOPNOTSUPP)
+			return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
+		else
+			errno = EOPNOTSUPP;
+	}
+
+	return ret;
 }
 
 /* Patterns to write to a physical eraseblock when torturing it */
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
