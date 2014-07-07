Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43Di-000643-40
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:20:14 +0000
Message-ID: <53BA49F5.5020605@huawei.com>
Date: Mon, 7 Jul 2014 15:19:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] Add new ioctl in userspace
References: <53BA491E.8060502@huawei.com>
In-Reply-To: <53BA491E.8060502@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add same ioctl in user space.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 include/mtd/ubi-user.h | 15 +++++++++++++++
 ubi-utils/libubi.c     |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 2b50dad..cc867a2 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -200,6 +200,8 @@
 #define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
 /* Remove the R/O block device */
 #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
+/* Dump LEB header */
+#define UBI_IOCEBDUMP _IOW(UBI_VOL_IOC_MAGIC, 9, struct ubi_ebdump_req)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -437,4 +439,17 @@ struct ubi_blkcreate_req {
 	int8_t  padding[128];
 }  __attribute__((packed));

+/**
+ * struct ubi_ebdump_req - a data structure used in dump eraseblock header.
+ * @lnum: logical eraseblock num to dump
+ * @ec_hdr: ec_hdr to set
+ * @vid_hdr: vid_hdr to set
+ */
+struct ubi_ebdump_req {
+	int32_t lnum;
+	int32_t pnum;
+	char	ec_hdr[64];
+	char	vid_hdr[64];
+}  __attribute__((packed));
+
 #endif /* __UBI_USER_H__ */
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 1e08b7d..39bfa1c 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1123,6 +1123,14 @@ int ubi_vol_block_remove(int fd)
 	return ioctl(fd, UBI_IOCVOLRMBLK);
 }

+int ubi_leb_dump_header(libubi_t desc, int fd, struct ubi_ebdump_req *request)
+{
+	desc = desc;
+	if (ioctl(fd, UBI_IOCEBDUMP, request))
+		return -1;
+	return 0;
+}
+
 int ubi_update_start(libubi_t desc, int fd, long long bytes)
 {
 	desc = desc;
-- 
1.8.1.4
