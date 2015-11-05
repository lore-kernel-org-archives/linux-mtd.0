Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTH-0005I5-CE
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/5] UBI: Expose the bitrot interface
Date: Thu,  5 Nov 2015 23:56:55 +0100
Message-Id: <1446764217-15021-4-git-send-email-richard@nod.at>
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

Using UBI_IOCRPEB and UBI_IOCSPEB userspace can force
reading and scrubbing of PEBs.

In case of bitflips UBI will automatically take action
and move data to a different PEB.
This interface allows a daemon to foster your NAND.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/cdev.c      |  30 ++++++++++
 drivers/mtd/ubi/ubi.h       |   1 +
 drivers/mtd/ubi/wl.c        | 135 ++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/ubi-user.h |   3 +
 4 files changed, 169 insertions(+)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index d16fccf..f500451 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -963,6 +963,36 @@ static long ubi_cdev_ioctl(struct file *file, unsigned int cmd,
 		break;
 	}
 
+	/* Read a PEB */
+	case UBI_IOCRPEB:
+	{
+		int pnum;
+
+		err = get_user(pnum, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		err = ubi_bitrot_check(ubi, pnum, 0);
+		break;
+	}
+
+	/* Scrub a PEB */
+	case UBI_IOCSPEB:
+	{
+		int pnum;
+
+		err = get_user(pnum, (__user int32_t *)argp);
+		if (err) {
+			err = -EFAULT;
+			break;
+		}
+
+		err = ubi_bitrot_check(ubi, pnum, 1);
+		break;
+	}
+
 	default:
 		err = -ENOTTY;
 		break;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2974b67..40c9eeb 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -859,6 +859,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
+int ubi_bitrot_check(struct ubi_device *ubi, int pnum, int force_scrub);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a7b0543..ad02c46 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1351,6 +1351,141 @@ retry:
 	return ensure_wear_leveling(ubi, 0);
 }
 
+static int scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
+{
+	if (in_wl_tree(e, &ubi->scrub))
+		return -EBUSY;
+	else if (in_wl_tree(e, &ubi->erroneous))
+		return -EBUSY;
+	else if (ubi->move_from == e)
+		return -EBUSY;
+	else if (ubi->move_to == e)
+		return -EBUSY;
+
+	return 0;
+}
+
+/**
+ * ubi_bitrot_check - Check an eraseblock for bitflips
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock to schedule
+ * @force_scrub: force scrubbing if non-zero
+ *
+ * Returns:
+ * %EINVAL, PEB is out of range
+ * %ENOENT, PEB is no longer used by UBI
+ * %EBUSY, PEB cannot be checked now or a check is currently running on it
+ * %EAGAIN, bit flips happened but scrubbing is currently not possible
+ * %EUCLEAN, bit flips happened and PEB is scheduled for scrubbing
+ * %0, no bit flips detected
+ */
+int ubi_bitrot_check(struct ubi_device *ubi, int pnum, int force_scrub)
+{
+	int err;
+	struct ubi_wl_entry *e;
+	struct ubi_work *wl_wrk;
+
+	if (pnum < 0 || pnum >= ubi->peb_count) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * Pause all parallel work, otherwise it can happen that the
+	 * erase worker frees a wl entry under us.
+	 */
+	down_write(&ubi->work_sem);
+
+	/*
+	 * Make sure that the wl entry does not change state while
+	 * inspecting it.
+	 */
+	spin_lock(&ubi->wl_lock);
+	e = ubi->lookuptbl[pnum];
+	if (!e) {
+		spin_unlock(&ubi->wl_lock);
+		err = -ENOENT;
+		goto out_unlock;
+	}
+	/*
+	 * Does it make sense to check this PEB?
+	 * Maybe UBI is already inspecing it...
+	 */
+	err = scrub_possible(ubi, e);
+	spin_unlock(&ubi->wl_lock);
+	if (err)
+		goto out_unlock;
+
+	if (!force_scrub) {
+		mutex_lock(&ubi->buf_mutex);
+		err = ubi_io_read(ubi, ubi->peb_buf, e->pnum, 0, ubi->peb_size);
+		mutex_unlock(&ubi->buf_mutex);
+	}
+
+	if (err == UBI_IO_BITFLIPS || force_scrub) {
+		/*
+		 * Okay, bit flip happened, let figure what we can do.
+		 */
+		spin_lock(&ubi->wl_lock);
+
+		/*
+		 * Need to re-check state
+		 */
+		err = scrub_possible(ubi, e);
+		if (err) {
+			spin_unlock(&ubi->wl_lock);
+			goto out_unlock;
+		}
+
+		if (in_pq(ubi, e)) {
+			prot_queue_del(ubi, e->pnum);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err = ensure_wear_leveling(ubi, 1);
+		} else if (in_wl_tree(e, &ubi->used)) {
+			rb_erase(&e->u.rb, &ubi->used);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err = ensure_wear_leveling(ubi, 1);
+		} else if (in_wl_tree(e, &ubi->free)) {
+			rb_erase(&e->u.rb, &ubi->free);
+			spin_unlock(&ubi->wl_lock);
+
+			wl_wrk = prepare_erase_work(e, -1, -1, force_scrub ? 0 : 1);
+			if (IS_ERR(wl_wrk)) {
+				err = PTR_ERR(wl_wrk);
+				goto out_unlock;
+			}
+
+			__schedule_ubi_work(ubi, wl_wrk);
+		} else {
+			spin_unlock(&ubi->wl_lock);
+			up_write(&ubi->work_sem);
+			/*
+			 * e is owned by fastmap. We are not allowed to
+			 * move it as the on-flash fastmap data structure refers to it.
+			 * Let's schedule a new fastmap write
+			 * such that the said PEB can get released.
+			 */
+			ubi_update_fastmap(ubi);
+			err = -EAGAIN;
+			goto out;
+		}
+
+		if (!err && !force_scrub)
+			err = -EUCLEAN;
+	} else {
+		err = 0;
+	}
+
+out_unlock:
+	up_write(&ubi->work_sem);
+out:
+	return err;
+}
+
 /**
  * ubi_wl_flush - flush all pending works.
  * @ubi: UBI device description object
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 1927b0d..6e1ec98 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -170,6 +170,9 @@
 /* Re-name volumes */
 #define UBI_IOCRNVOL _IOW(UBI_IOC_MAGIC, 3, struct ubi_rnvol_req)
 
+#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
+#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
+
 /* ioctl commands of the UBI control character device */
 
 #define UBI_CTRL_IOC_MAGIC 'o'
-- 
1.8.4.5
