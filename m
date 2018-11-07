Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKW7q-0003xB-R1
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 22:16:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, thomas.roeder@harman.com,
 juergen.lachmann@harman.com, Richard Weinberger <richard@nod.at>
Subject: [PATCH 2/2] ubi: Expose the bitrot interface
Date: Wed,  7 Nov 2018 23:16:19 +0100
Message-Id: <20181107221619.32498-2-richard@nod.at>
In-Reply-To: <20181107221619.32498-1-richard@nod.at>
References: <20181107221619.32498-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
 drivers/mtd/ubi/cdev.c      |  30 ++++++++
 drivers/mtd/ubi/ubi.h       |   1 +
 drivers/mtd/ubi/wl.c        | 144 ++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/ubi-user.h |   5 ++
 4 files changed, 180 insertions(+)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 22547d7a84ea..947a8adbc799 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -974,6 +974,36 @@ static long ubi_cdev_ioctl(struct file *file, unsign=
ed int cmd,
 		break;
 	}
=20
+	/* Check a specific PEB for bitflips and scrub it if needed */
+	case UBI_IOCRPEB:
+	{
+		int pnum;
+
+		err =3D get_user(pnum, (__user int32_t *)argp);
+		if (err) {
+			err =3D -EFAULT;
+			break;
+		}
+
+		err =3D ubi_bitflip_check(ubi, pnum, 0);
+		break;
+	}
+
+	/* Force scrubbing for a specific PEB */
+	case UBI_IOCSPEB:
+	{
+		int pnum;
+
+		err =3D get_user(pnum, (__user int32_t *)argp);
+		if (err) {
+			err =3D -EFAULT;
+			break;
+		}
+
+		err =3D ubi_bitflip_check(ubi, pnum, 1);
+		break;
+	}
+
 	default:
 		err =3D -ENOTTY;
 		break;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d47b9e436e67..a1b9e764d489 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -929,6 +929,7 @@ int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct =
ubi_wl_entry *used_e,
 int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
+int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force_scrub)=
;
=20
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int o=
ffset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ca1b31385eb5..5540599a60c6 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1440,6 +1440,150 @@ int ubi_wl_flush(struct ubi_device *ubi, int vol_=
id, int lnum)
 	return err;
 }
=20
+static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *=
e)
+{
+	if (in_wl_tree(e, &ubi->scrub))
+		return false;
+	else if (in_wl_tree(e, &ubi->erroneous))
+		return false;
+	else if (ubi->move_from =3D=3D e)
+		return false;
+	else if (ubi->move_to =3D=3D e)
+		return false;
+
+	return true;
+}
+
+/**
+ * ubi_bitflip_check - Check an eraseblock for bitflips and scrub it if =
needed.
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock to schedule
+ * @force_scrub: force scrubbing if non-zero, schedule erase otherwise
+ *
+ * This function reads the given eraseblock and checks if bitflips occur=
ed.
+ * In case of bitflips, the eraseblock is scheduled for scrubbing.
+ * If scrubbing is forced with @force_scrub, the eraseblock is not read,
+ * but scheduled for scrubbing right away.
+ *
+ * Returns:
+ * %EINVAL, PEB is out of range
+ * %ENOENT, PEB is no longer used by UBI
+ * %EBUSY, PEB cannot be checked now or a check is currently running on =
it
+ * %EAGAIN, bit flips happened but scrubbing is currently not possible
+ * %EUCLEAN, bit flips happened and PEB is scheduled for scrubbing
+ * %0, no bit flips detected
+ */
+int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force_scrub)
+{
+	int err;
+	struct ubi_wl_entry *e;
+
+	if (pnum < 0 || pnum >=3D ubi->peb_count) {
+		err =3D -EINVAL;
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
+	e =3D ubi->lookuptbl[pnum];
+	if (!e) {
+		spin_unlock(&ubi->wl_lock);
+		err =3D -ENOENT;
+		goto out_resume;
+	}
+
+	/*
+	 * Does it make sense to check this PEB?
+	 */
+	if (!scrub_possible(ubi, e)) {
+		spin_unlock(&ubi->wl_lock);
+		err =3D -EBUSY;
+		goto out_resume;
+	}
+	spin_unlock(&ubi->wl_lock);
+
+	if (!force_scrub) {
+		mutex_lock(&ubi->buf_mutex);
+		err =3D ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		mutex_unlock(&ubi->buf_mutex);
+	}
+
+	if (err =3D=3D UBI_IO_BITFLIPS || force_scrub) {
+		/*
+		 * Okay, bit flip happened, let's figure out what we can do.
+		 */
+		spin_lock(&ubi->wl_lock);
+
+		/*
+		 * Recheck. We released wl_lock, UBI might have killed the
+		 * wl entry under us.
+		 */
+		e =3D ubi->lookuptbl[pnum];
+		if (!e) {
+			spin_unlock(&ubi->wl_lock);
+			err =3D -ENOENT;
+			goto out_resume;
+		}
+
+		/*
+		 * Need to re-check state
+		 */
+		if (!scrub_possible(ubi, e)) {
+			spin_unlock(&ubi->wl_lock);
+			err =3D -EBUSY;
+			goto out_resume;
+		}
+
+		if (in_pq(ubi, e)) {
+			prot_queue_del(ubi, e->pnum);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err =3D ensure_wear_leveling(ubi, 1);
+		} else if (in_wl_tree(e, &ubi->used)) {
+			rb_erase(&e->u.rb, &ubi->used);
+			wl_tree_add(e, &ubi->scrub);
+			spin_unlock(&ubi->wl_lock);
+
+			err =3D ensure_wear_leveling(ubi, 1);
+		} else if (in_wl_tree(e, &ubi->free)) {
+			rb_erase(&e->u.rb, &ubi->free);
+			ubi->free_count--;
+			spin_unlock(&ubi->wl_lock);
+
+			/*
+			 * This PEB is empty we can schedule it for
+			 * erasure right away. No wear leveling needed.
+			 */
+			err =3D schedule_erase(ubi, e, UBI_UNKNOWN, UBI_UNKNOWN,
+					     force_scrub ? 0 : 1, true);
+		} else {
+			spin_unlock(&ubi->wl_lock);
+			err =3D -EAGAIN;
+		}
+
+		if (!err && !force_scrub)
+			err =3D -EUCLEAN;
+	} else {
+		err =3D 0;
+	}
+
+out_resume:
+	up_write(&ubi->work_sem);
+out:
+
+	return err;
+}
+
 /**
  * tree_destroy - destroy an RB-tree.
  * @ubi: UBI device description object
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index aad3b6201fc0..b69e9ba6742b 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -171,6 +171,11 @@
 /* Re-name volumes */
 #define UBI_IOCRNVOL _IOW(UBI_IOC_MAGIC, 3, struct ubi_rnvol_req)
=20
+/* Read the specified PEB and scrub it if there are bitflips */
+#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
+/* Force scrubbing on the specified PEB */
+#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
+
 /* ioctl commands of the UBI control character device */
=20
 #define UBI_CTRL_IOC_MAGIC 'o'
--=20
2.19.1
