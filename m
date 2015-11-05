Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTd-0005KA-RA
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:54 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/5] UBI: Expose UBI statistics interface
Date: Thu,  5 Nov 2015 23:56:57 +0100
Message-Id: <1446764217-15021-6-git-send-email-richard@nod.at>
In-Reply-To: <1446764217-15021-1-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI_IOCSTATS allows userspace to query read and erase
counters and can take action.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c      | 23 +++++++++++++++++
 drivers/mtd/ubi/ubi.h       |  1 +
 drivers/mtd/ubi/wl.c        | 61 +++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/ubi-user.h | 16 ++++++++++++
 4 files changed, 101 insertions(+)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f500451..ab58c5f 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -992,6 +992,29 @@ static long ubi_cdev_ioctl(struct file *file, unsigned int cmd,
 		err = ubi_bitrot_check(ubi, pnum, 1);
 		break;
 	}
+	/* Get UBI stats */
+	case UBI_IOCSTATS:
+	{
+		struct ubi_stats_req *req;
+		struct ubi_stats_req __user *ureq = argp;
+
+		req = kmalloc(sizeof(struct ubi_stats_req), GFP_KERNEL);
+		if (!req) {
+			err = -ENOMEM;
+			break;
+		}
+
+		err = copy_from_user(req, argp, sizeof(struct ubi_stats_req));
+		if (err) {
+			kfree(req);
+			err = -EFAULT;
+			break;
+		}
+
+		err = ubi_wl_report_stats(ubi, req, ureq->stats);
+		kfree(req);
+		break;
+	}
 
 	default:
 		err = -ENOTTY;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 9bfede0..c6c2964 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -865,6 +865,7 @@ void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
 int ubi_bitrot_check(struct ubi_device *ubi, int pnum, int force_scrub);
 void ubi_wl_update_rc(struct ubi_device *ubi, int pnum);
+int ubi_wl_report_stats(struct ubi_device *ubi, struct ubi_stats_req *req, struct ubi_stats_entry __user *se);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 43466d4..90b715e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -102,6 +102,7 @@
 #include <linux/crc32.h>
 #include <linux/freezer.h>
 #include <linux/kthread.h>
+#include <linux/uaccess.h>
 #include "ubi.h"
 #include "wl.h"
 
@@ -482,6 +483,66 @@ static void ubi_wl_get_rc(struct ubi_wl_entry *e, struct ubi_stats_entry *se)
 #endif
 }
 
+static int ubi_wl_fill_stats_entry(struct ubi_device *ubi,
+				   struct ubi_stats_entry *se, int pnum)
+{
+	struct ubi_wl_entry *e;
+
+	spin_lock(&ubi->wl_lock);
+	e = ubi->lookuptbl[pnum];
+	if (e) {
+		se->pnum = pnum;
+		se->ec = e->ec;
+		ubi_wl_get_rc(e, se);
+	}
+	spin_unlock(&ubi->wl_lock);
+
+	return e ? 0 : -1;
+}
+
+
+int ubi_wl_report_stats(struct ubi_device *ubi, struct ubi_stats_req *req,
+			struct ubi_stats_entry __user *se)
+{
+	int i, pnum, peb_end, peb_start;
+	struct ubi_stats_entry tmp_se;
+	size_t write_len;
+	int n = 0;
+
+	pnum = req->req_pnum;
+	if (pnum != -1) {
+		if (pnum < 0 || pnum >= ubi->peb_count)
+			return -EINVAL;
+
+		peb_start = pnum;
+		peb_end = pnum + 1;
+		write_len = sizeof(*se);
+	} else {
+		peb_start = 0;
+		peb_end = ubi->peb_count;
+		write_len = sizeof(*se) * ubi->good_peb_count;
+	}
+
+	if (write_len > req->req_len - sizeof(*req))
+		return -EFAULT;
+
+	if (!access_ok(VERIFY_WRITE, se, req->req_len - sizeof(*req) + write_len))
+		return -EFAULT;
+
+	for (i = peb_start; i < peb_end; i++) {
+		if (ubi_wl_fill_stats_entry(ubi, &tmp_se, i) == 0) {
+			if (__copy_to_user(se, &tmp_se, sizeof(tmp_se)))
+				return -EFAULT;
+
+			se++;
+			n++;
+		}
+	}
+
+	return n;
+}
+
+
 /**
  * sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 6e1ec98..8610440 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -173,6 +173,8 @@
 #define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
 #define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
 
+#define UBI_IOCSTATS _IOW(UBI_IOC_MAGIC, 6, struct ubi_stats_req)
+
 /* ioctl commands of the UBI control character device */
 
 #define UBI_CTRL_IOC_MAGIC 'o'
@@ -445,4 +447,18 @@ struct ubi_blkcreate_req {
 	__s8  padding[128];
 }  __packed;
 
+struct ubi_stats_entry {
+	__s32 pnum;
+	__s32 ec;
+	__s32 rc;
+	__s32 padding;
+} __packed;
+
+struct ubi_stats_req {
+	__s32 req_len;
+	__s32 req_pnum;
+	__s32 padding[2];
+	struct ubi_stats_entry stats[0];
+} __packed;
+
 #endif /* __UBI_USER_H__ */
-- 
1.8.4.5
