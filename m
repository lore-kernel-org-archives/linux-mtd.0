Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpd8-0002S9-AC
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:19:12 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id D852B1B4015
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 06:19:07 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] libmtd: add helper funcs for getting fds, regioninfo,
	and locked info
Date: Tue,  7 Jun 2011 02:19:06 -0400
Message-Id: <1307427548-29306-4-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This extends the libmtd with the helper functions:
	mtd_open_dev1: open a MTD device by its number
	mtd_regioninfo: interface to MEMGETREGIONINFO
	mtd_islocked: interface to MEMISLOCKED

Users of these functions will follow shortly ...

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 include/libmtd.h |   37 +++++++++++++++++++++++++++++++++++++
 lib/libmtd.c     |   51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index e30c8a6..ba1348a 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -35,6 +35,9 @@ extern "C" {
 /* MTD library descriptor */
 typedef void * libmtd_t;
 
+/* Forward decls */
+struct region_info_user;
+
 /**
  * @mtd_dev_cnt: count of MTD devices in system
  * @lowest_mtd_num: lowest MTD device number in system
@@ -138,6 +141,15 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd);
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
 
 /**
+ * mtd_open_dev1 - get a fd to an MTD device.
+ * @desc: MTD library descriptor
+ * @mtd_num: MTD device number to fetch information about
+ *
+ * Based on a MTD device number, attempt to open the corresponding node.
+ */
+int mtd_open_dev1(int mtd_num);
+
+/**
  * mtd_lock - lock eraseblocks.
  * @desc: MTD library descriptor
  * @mtd: MTD device description object
@@ -174,6 +186,31 @@ int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
 int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
+ * mtd_regioninfo - get information about an erase region.
+ * @fd: MTD device node file descriptor
+ * @regidx: index of region to look up
+ * @reginfo: the region information is returned here
+ *
+ * This function gets information about an erase region defined by the
+ * @regidx index and saves this information in the @reginfo object.
+ * Returns %0 in case of success and %-1 in case of failure. If the
+ * @regidx is not valid or unavailable, errno is set to @ENODEV.
+ */
+int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo);
+
+/**
+ * mtd_islocked - see if the specified eraseblock is locked.
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: eraseblock to check
+ *
+ * This function checks to see if eraseblock @eb of MTD device described
+ * by @fd is locked. Returns %0 if it is unlocked, %1 if it is locked, and
+ * %-1 in case of failure.
+ */
+int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb);
+
+/**
  * mtd_torture - torture an eraseblock.
  * @desc: MTD library descriptor
  * @mtd: MTD device description object
diff --git a/lib/libmtd.c b/lib/libmtd.c
index a651808..3be28c4 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -787,6 +787,25 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
+int mtd_open_dev1(int mtd_num)
+{
+	char devpath[128];
+	int fd;
+
+	sprintf(devpath, "/dev/mtd%i", mtd_num);
+	fd = open(devpath, O_RDONLY | O_CLOEXEC);
+	if (fd < 0)
+		return sys_errmsg("cannot open \"%s\"", devpath);
+
+	/*
+	 * XXX: We could do a stat on the fd and make sure the dev
+	 *      major/minor matches what is expected ... but no real
+	 *      way for us to recover from a mismatch.
+	 */
+
+	return fd;
+}
+
 static inline int mtd_ioctl_error(const struct mtd_dev_info *mtd, int eb,
 				  const char *sreq)
 {
@@ -883,6 +902,38 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 	return 0;
 }
 
+int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
+{
+	int ret;
+
+	if (regidx < 0) {
+		errno = ENODEV;
+		return -1;
+	}
+
+	ret = ioctl(fd, MEMGETREGIONINFO, reginfo);
+	if (ret < 0)
+		return sys_errmsg("%s ioctl failed for erase region %d",
+			"MEMGETREGIONINFO", regidx);
+
+	return 0;
+}
+
+int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
+{
+	int ret;
+	erase_info_t ei;
+
+	ei.start = eb * mtd->eb_size;
+	ei.length = mtd->eb_size;
+
+	ret = ioctl(fd, MEMISLOCKED, &ei);
+	if (ret < 0)
+		return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
+
+	return ret;
+}
+
 /* Patterns to write to a physical eraseblock when torturing it */
 static uint8_t patterns[] = {0xa5, 0x5a, 0x0};
 
-- 
1.7.5.3
