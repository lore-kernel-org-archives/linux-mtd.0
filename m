Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzngs-0006LX-9t
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 09:06:23 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] libubi: add support to attach/detach by MTD device path
Date: Thu,  8 Apr 2010 12:04:11 +0300
Message-Id: <1270717452-8993-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
References: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
Cc: Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mika Westerberg <ext-mika.1.westerberg@nokia.com>

struct ubi_attach_request now has additional field 'dev' that can contain path
to the MTD device node in the filesystem. Also there are two new functions that
are able to handle path to the MTD device node:

	ubi_attach() - attach MTD device by number or by path
	ubi_detach() - detach MTD device by path

ubi_attach() works like ubi_attach_mtd() when it is passed empty req->dev,
otherwise it looks up correct MTD device number based on the given device node
path.

Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/include/libubi.h |   30 ++++++++++
 ubi-utils/src/libubi.c     |  127 +++++++++++++++++++++++++++++++++++++++-----
 ubi-utils/src/libubi_int.h |    1 +
 3 files changed, 145 insertions(+), 13 deletions(-)

diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index f52904d..64b5eed 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -44,6 +44,7 @@ typedef void * libubi_t;
  *           (%UBI_DEV_NUM_AUTO should be used to automatically assign the
  *           number)
  * @mtd_num: MTD device number to attach
+ * @dev: path to device node to attach
  * @vid_hdr_offset: VID header offset (%0 means default offset and this is what
  *                  most of the users want)
  */
@@ -51,6 +52,7 @@ struct ubi_attach_request
 {
 	int dev_num;
 	int mtd_num;
+	const char *dev;
 	int vid_hdr_offset;
 };
 
@@ -219,6 +221,23 @@ int ubi_attach_mtd(libubi_t desc, const char *node,
 		   struct ubi_attach_request *req);
 
 /**
+ * ubi_attach - attach an MTD device by its node path.
+ * @desc: UBI library descriptor
+ * @node: name of the UBI control character device node
+ * @req: MTD attach request
+ *
+ * This function creates new UBI device by attaching an MTD device described by
+ * @req. If @req->dev is given it should contain path to the MTD device node.
+ * Otherwise functionality is similar than in function 'ubi_attach_mtd()' where
+ * @req->mtd_num is used.
+ *
+ * Returns %0 in case of success and %-1 in case of failure (errno is set). The
+ * newly created UBI device number is returned in @req->dev_num.
+ */
+int ubi_attach(libubi_t desc, const char *node,
+	       struct ubi_attach_request *req);
+
+/**
  * ubi_detach_mtd - detach an MTD device.
  * @desc: UBI library descriptor
  * @node: name of the UBI control character device node
@@ -231,6 +250,17 @@ int ubi_attach_mtd(libubi_t desc, const char *node,
 int ubi_detach_mtd(libubi_t desc, const char *node, int mtd_num);
 
 /**
+ * ubi_detach - detach an MTD device by its node path.
+ * @desc: UBI library descriptor
+ * @node: name of the UBI control character device node
+ * @dev: path to an MTD device node
+ *
+ * This function detaches an MTD device @dev from UBI. Returns zero in case of
+ * success and %-1 in case of failure.
+ */
+int ubi_detach(libubi_t desc, const char *node, const char *dev);
+
+/**
  * ubi_remove_dev - remove an UBI device.
  * @desc: UBI library descriptor
  * @node: name of the UBI control character device node
diff --git a/ubi-utils/src/libubi.c b/ubi-utils/src/libubi.c
index fd97774..2f19bd7 100644
--- a/ubi-utils/src/libubi.c
+++ b/ubi-utils/src/libubi.c
@@ -677,35 +677,120 @@ void libubi_close(libubi_t desc)
 	free(lib);
 }
 
-int ubi_attach_mtd(libubi_t desc, const char *node,
-		   struct ubi_attach_request *req)
+/**
+ * do_attach - perform the actual attach operation.
+ * @node: name of the UBI control character device node
+ * @r: attach request
+ *
+ * This function performs the actual UBI attach operation. Returns %0 in case of
+ * success and %-1 in case of failure. @r->ubi_num contains newly created UBI
+ * device number.
+ */
+static int do_attach(const char *node, const struct ubi_attach_req *r)
 {
 	int fd, ret;
-	struct ubi_attach_req r;
-
-	memset(&r, 0, sizeof(struct ubi_attach_req));
-
-	desc = desc;
-	r.ubi_num = req->dev_num;
-	r.mtd_num = req->mtd_num;
-	r.vid_hdr_offset = req->vid_hdr_offset;
 
 	fd = open(node, O_RDONLY);
 	if (fd == -1)
 		return sys_errmsg("cannot open \"%s\"", node);
 
-	ret = ioctl(fd, UBI_IOCATT, &r);
+	ret = ioctl(fd, UBI_IOCATT, r);
 	close(fd);
 	if (ret == -1)
 		return -1;
 
-	req->dev_num = r.ubi_num;
-
 #ifdef UDEV_SETTLE_HACK
 //	if (system("udevsettle") == -1)
 //		return -1;
 	usleep(100000);
 #endif
+	return ret;
+}
+
+int ubi_attach_mtd(libubi_t desc, const char *node,
+		   struct ubi_attach_request *req)
+{
+	struct ubi_attach_req r;
+	int ret;
+
+	(void)desc;
+
+	memset(&r, 0, sizeof(struct ubi_attach_req));
+	r.ubi_num = req->dev_num;
+	r.mtd_num = req->mtd_num;
+	r.vid_hdr_offset = req->vid_hdr_offset;
+
+	ret = do_attach(node, &r);
+	if (ret == 0)
+		req->dev_num = r.ubi_num;
+
+	return ret;
+}
+
+#ifndef MTD_CHAR_MAJOR
+/*
+ * This is taken from kernel <linux/mtd/mtd.h> and is unlikely to change anytime
+ * soon.
+ */
+#define MTD_CHAR_MAJOR 90
+#endif
+
+/**
+ * dev_to_mtdnum - converts device node to MTD number.
+ * @dev: path to device node to convert
+ *
+ * This function converts given @dev to MTD device number. @dev should contain
+ * path to the MTD device node. Returns MTD device number in case of success and
+ * %-1 in case of failure (errno is set).
+ */
+static int dev_to_mtdnum(const char *dev)
+{
+	int major, minor;
+	struct stat sb;
+
+	if (stat(dev, &sb) < 0)
+		return sys_errmsg("cannot stat \"%s\"", dev);
+
+	if (!S_ISCHR(sb.st_mode)) {
+		errno = EINVAL;
+		return sys_errmsg("\"%s\" is not a character device", dev);
+	}
+
+	major = major(sb.st_rdev);
+	minor = minor(sb.st_rdev);
+
+	if (major != MTD_CHAR_MAJOR) {
+		errno = EINVAL;
+		return sys_errmsg("\"%s\" is not an MTD device", dev);
+	}
+
+	return minor / 2;
+}
+
+int ubi_attach(libubi_t desc, const char *node, struct ubi_attach_request *req)
+{
+	struct ubi_attach_req r;
+	int ret;
+
+	if (!req->dev)
+		/* Fallback to opening by mtd_num */
+		return ubi_attach_mtd(desc, node, req);
+
+	memset(&r, 0, sizeof(struct ubi_attach_req));
+	r.ubi_num = req->dev_num;
+	r.vid_hdr_offset = req->vid_hdr_offset;
+
+	/*
+	 * User has passed path to device node. Lets find out MTD device number
+	 * of the device and pass it to the kernel.
+	 */
+	r.mtd_num = dev_to_mtdnum(req->dev);
+	if (r.mtd_num == -1)
+		return -1;
+
+	ret = do_attach(node, &r);
+	if (ret == 0)
+		req->dev_num = r.ubi_num;
 
 	return ret;
 }
@@ -723,6 +808,22 @@ int ubi_detach_mtd(libubi_t desc, const char *node, int mtd_num)
 	return ubi_remove_dev(desc, node, ubi_dev);
 }
 
+int ubi_detach(libubi_t desc, const char *node, const char *dev)
+{
+	int mtd_num;
+
+	if (!dev) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	mtd_num = dev_to_mtdnum(dev);
+	if (mtd_num == -1)
+		return -1;
+
+	return ubi_detach_mtd(desc, node, mtd_num);
+}
+
 int ubi_remove_dev(libubi_t desc, const char *node, int ubi_dev)
 {
 	int fd, ret;
diff --git a/ubi-utils/src/libubi_int.h b/ubi-utils/src/libubi_int.h
index 6d17d57..c3aa37a 100644
--- a/ubi-utils/src/libubi_int.h
+++ b/ubi-utils/src/libubi_int.h
@@ -83,6 +83,7 @@ extern "C" {
  *                handling
  * @dev_max_vols: maximum volumes number count sysfs path pattern
  * @dev_min_io_size: minimum I/O unit size sysfs path pattern
+ * @dev_mtd_num: MTD device number
  * @ubi_vol: UBI volume sysfs directory pattern
  * @vol_type: volume type sysfs path pattern
  * @vol_dev: volume major/minor numbers file pattern
-- 
1.6.6.1
