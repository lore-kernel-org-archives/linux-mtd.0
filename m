Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43CJ-0005e6-4p
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:18:48 +0000
Message-ID: <53BA499B.5090206@huawei.com>
Date: Mon, 7 Jul 2014 15:17:47 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/7] UBI: Add a new ioctl to support ubidump
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

Add a new ioctl to dump EC header and VID header to user space. This
ioctl is called without lock so I think users *should not* run ubidump
when volume is mounted.

Struct ubi_ebdump_req is used to transfer data between user space and
kernel space. Can I find a way to set buffer length from '64' to
UBI_VID_HDR_SIZE and UBI_EC_HDR_SIZE?


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 drivers/mtd/ubi/cdev.c      | 50 +++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/ubi-user.h | 15 ++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7646220..5b94323 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -581,6 +581,56 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}

+	case UBI_IOCEBDUMP:
+	{
+		int pnum;
+		struct ubi_ebdump_req req;
+		struct ubi_ec_hdr *ec_hdr;
+		struct ubi_vid_hdr *vid_hdr;
+
+		err = copy_from_user(&req, argp,
+				     sizeof(struct ubi_ebdump_req));
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		err = ubi_is_mapped(desc, req.lnum);
+		if (err <= 0)
+			break;
+		pnum = vol->eba_tbl[req.lnum];
+		req.pnum = pnum;
+
+		/*
+		 * No need to check return value of ubi_io_read(),
+		 * we will confirm the date in user space.
+		 */
+		ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
+		if (!ec_hdr) {
+			err = -ENOMEM;
+			break;
+		}
+		ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
+		memcpy(req.ec_hdr, ec_hdr, UBI_EC_HDR_SIZE);
+		kfree(ec_hdr);
+
+		vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
+		if (!vid_hdr) {
+			err = -ENOMEM;
+			break;
+		}
+		ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
+		memcpy(req.vid_hdr, vid_hdr, UBI_VID_HDR_SIZE);
+		ubi_free_vid_hdr(ubi, vid_hdr);
+
+		err = copy_to_user(argp, &req,
+				   sizeof(struct ubi_ebdump_req));
+		if (err)
+			err = -EFAULT;
+
+		break;
+	}
+
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 1927b0d..76ff035 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -205,6 +205,8 @@
 #define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
 /* Remove the R/O block device */
 #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
+/* Dump LEB header */
+#define UBI_IOCEBDUMP _IOW(UBI_VOL_IOC_MAGIC, 9, struct ubi_ebdump_req)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -442,4 +444,17 @@ struct ubi_blkcreate_req {
 	__s8  padding[128];
 }  __packed;

+/**
+ * struct ubi_ebdump_req - a data structure used in dump eraseblock header.
+ * @lnum: logical eraseblock num to dump
+ * @ec_hdr: ec_hdr to set
+ * @vid_hdr: vid_hdr to set
+ */
+struct ubi_ebdump_req {
+	__s32	lnum;
+	__s32	pnum;
+	char	ec_hdr[64];
+	char	vid_hdr[64];
+}  __packed;
+
 #endif /* __UBI_USER_H__ */
-- 
1.8.1.4
