Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC3pj-0001zT-Pu
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 09:36:38 +0000
Message-ID: <53D76AD4.1010206@huawei.com>
Date: Tue, 29 Jul 2014 17:35:16 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] ubi-utils: Enable lnum2pnum ioctl in userspace
References: <53D7677A.6000905@huawei.com>
In-Reply-To: <53D7677A.6000905@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce ubi_lnum_to_pnum() to translate lnum into pnum by the
a new ioctl.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 include/mtd/ubi-user.h     | 12 ++++++++++++
 ubi-utils/include/libubi.h | 11 +++++++++++
 ubi-utils/libubi.c         | 12 ++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 2b50dad..e4f57c6 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -200,6 +200,8 @@
 #define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
 /* Remove the R/O block device */
 #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
+/* Get pnum of a specified leb */
+#define UBI_IOCEBGETPNUM _IOW(UBI_VOL_IOC_MAGIC, 9, struct ubi_lnum2pnum_req)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -437,4 +439,14 @@ struct ubi_blkcreate_req {
 	int8_t  padding[128];
 }  __attribute__((packed));

+/**
+ * struct ubi_lnum2pnum_req - a data structure used in lnum translate requests.
+ * @lnum: logical eraseblock num to translate
+ * @pnum: physical eraseblock num @lnum mapped
+ */
+struct ubi_lnum2pnum_req {
+	int32_t lnum;
+	int32_t pnum;
+}  __attribute__((packed));
+
 #endif /* __UBI_USER_H__ */
diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 4d6a7ee..618a6ba 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -478,6 +478,17 @@ int ubi_leb_unmap(int fd, int lnum);
  */
 int ubi_is_mapped(int fd, int lnum);

+/**
+ * ubi_lnum_to_pnum - get the pnum of a specified leb.
+ * @fd: volume character device file descriptor
+ * @lnum: logical eraseblock number to translate
+ * @pnum: physical eraseblock number to return
+ *
+ * This function return %0 in case of success and %-1 in case of failure. The
+ * pnum of the specified leb is returned by @pnum.
+ */
+int ubi_lnum_to_pnum(int fd, int lnum, int *pnum);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 1e08b7d..9650b6a 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1123,6 +1123,18 @@ int ubi_vol_block_remove(int fd)
 	return ioctl(fd, UBI_IOCVOLRMBLK);
 }

+int ubi_lnum_to_pnum(int fd, int lnum, int *pnum)
+{
+	struct ubi_lnum2pnum_req request;
+
+	request.pnum = -1;
+	request.lnum = lnum;
+	if (ioctl(fd, UBI_IOCEBGETPNUM, &request))
+		return -1;
+	*pnum = request.pnum;
+	return 0;
+}
+
 int ubi_update_start(libubi_t desc, int fd, long long bytes)
 {
 	desc = desc;
-- 
1.8.1.4
