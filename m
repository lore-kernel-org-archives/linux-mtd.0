Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KJ8CW-00006G-BL
	for linux-mtd@lists.infradead.org; Wed, 16 Jul 2008 14:41:53 +0000
Subject: Re: [RFC v2] UBI volume re-name
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <487C8357.7050307@logitech.com>
References: <1216029951.29469.7.camel@sauron> <487C8357.7050307@logitech.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2008 17:40:09 +0300
Message-Id: <1216219209.29469.72.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-07-15 at 12:00 +0100, Richard Titmuss wrote:
> Hi Artem,
>=20
> That's excellent, and exactly the functionality I need. I have also=20
> started a patch to add -N support to ubinfo, ubirmvol and ubiupdatevol.=20
> I've got a little distracted with another couple of projects right now,=20
> but hope to return to looking at UBI again next week.

Here is an improved patch. The new semantics is that it if you rename
into an existing volume, it is deleted, unless you rename in the same
request as well.

E.g.:

ubimkvol A
ubimkvol B
ubirename --from A --to B

B will become A, old A will be removed. Just like with files.

ubirename --from A B --to B A

will chase change the names, but not remove anything. See the comments
in ubi-user.h for more details.

I kinda tested it a little and it seems to work fine.

>From 9ae64054dd6297061c67c959c55ca4d68f265ae5 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 13 Jul 2008 21:47:47 +0300
Subject: [PATCH] UBI: implement multiple volumes rename

Quite useful ioctl which allows to make atomic system upgrades.
The idea belongs to Richard Titmuss <richard_titmuss@logitech.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    1 +
 drivers/mtd/ubi/cdev.c  |  188 +++++++++++++++++++++++++++++++++++++++++++=
+++-
 drivers/mtd/ubi/ubi.h   |   33 ++++++++-
 drivers/mtd/ubi/vmt.c   |   57 ++++++++++++--
 drivers/mtd/ubi/vtbl.c  |   51 +++++++++++++
 include/mtd/ubi-user.h  |   60 ++++++++++++++-
 6 files changed, 375 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7210e1d..4418a23 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -806,6 +806,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_nu=
m, int vid_hdr_offset)
=20
 	mutex_init(&ubi->buf_mutex);
 	mutex_init(&ubi->ckvol_mutex);
+	mutex_init(&ubi->mult_mutex);
 	mutex_init(&ubi->volumes_mutex);
 	spin_lock_init(&ubi->volumes_lock);
=20
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index c24dc2c..c295cab 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -599,6 +599,166 @@ static int verify_rsvol_req(const struct ubi_device *=
ubi,
 	return 0;
 }
=20
+/**
+ * rename_volumes - rename UBI volumes.
+ * @ubi: UBI device description object
+ * @req: volumes re-name request
+ *
+ * This is a helper function for the volume re-name IOCTL which validates =
the
+ * the request, opens the volume and calls corresponding volumes managemen=
t
+ * function. Returns zero in case of success and a negative error code in =
case
+ * of failure.
+ */
+static int rename_volumes(struct ubi_device *ubi,
+			  struct ubi_rnvol_req *req)
+{
+	int i, n, err;
+	struct list_head rename_list;
+	struct ubi_rename_entry *re, *re1;
+
+	if (req->count < 0 || req->count > UBI_MAX_RNVOL)
+		return -EINVAL;
+
+	if (req->count =3D=3D 0)
+		return 0;
+
+	/* Validate volume IDs and names in the request */
+	for (i =3D 0; i < req->count; i++) {
+		if (req->ents[i].vol_id < 0 ||
+		    req->ents[i].vol_id >=3D ubi->vtbl_slots)
+			return -EINVAL;
+		if (req->ents[i].name_len < 0)
+			return -EINVAL;
+		if (req->ents[i].name_len > UBI_VOL_NAME_MAX)
+			return -ENAMETOOLONG;
+		req->ents[i].name[req->ents[i].name_len] =3D '\0';
+		n =3D strlen(req->ents[i].name);
+		if (n !=3D req->ents[i].name_len)
+			err =3D -EINVAL;
+	}
+
+	/* Make sure volume IDs and names are unique */
+	for (i =3D 0; i < req->count - 1; i++) {
+		for (n =3D i + 1; n < req->count; n++) {
+			if (req->ents[i].vol_id =3D=3D req->ents[n].vol_id) {
+				dbg_err("duplicated volume id %d",
+					req->ents[i].vol_id);
+				return -EINVAL;
+			}
+			if (!strcmp(req->ents[i].name, req->ents[n].name)) {
+				dbg_err("duplicated volume name \"%s\"",
+					req->ents[i].name);
+				return -EINVAL;
+			}
+		}
+	}
+
+	/* Create the re-name list */
+	INIT_LIST_HEAD(&rename_list);
+	for (i =3D 0; i < req->count; i++) {
+		int vol_id =3D req->ents[i].vol_id;
+		int name_len =3D req->ents[i].name_len;
+		const char *name =3D req->ents[i].name;
+
+		re =3D kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
+		if (!re) {
+			err =3D -ENOMEM;
+			goto out_free;
+		}
+
+		re->desc =3D ubi_open_volume(ubi->ubi_num, vol_id, UBI_EXCLUSIVE);
+		if (IS_ERR(re->desc)) {
+			err =3D PTR_ERR(re->desc);
+			dbg_err("cannot open volume %d, error %d", vol_id, err);
+			kfree(re);
+			goto out_free;
+		}
+
+		/* Skip this re-naming if the name does not really change */
+		if (re->desc->vol->name_len =3D=3D name_len &&
+		    !memcmp(re->desc->vol->name, name, name_len)) {
+			ubi_close_volume(re->desc);
+			kfree(re);
+			continue;
+		}
+
+		re->new_name_len =3D name_len;
+		memcpy(re->new_name, name, name_len);
+		list_add_tail(&re->list, &rename_list);
+		dbg_msg("will rename volume %d from \"%s\" to \"%s\"",
+			vol_id, re->desc->vol->name, name);
+	}
+
+	if (list_empty(&rename_list))
+		return 0;
+
+	/* Find out the volumes which have to be removed */
+	list_for_each_entry(re, &rename_list, list) {
+		struct ubi_volume_desc *desc;
+		int no_remove_needed =3D 0;
+
+		/*
+		 * Volume @re->vol_id is going to be re-named to
+		 * @re->new_name, while its current name is @name. If a volume
+		 * with name @re->new_name currently exists, it has to be
+		 * removed, unless it is also re-named in the request (@req).
+		 */
+		list_for_each_entry(re1, &rename_list, list) {
+			if (re->new_name_len =3D=3D re1->desc->vol->name_len &&
+			    !memcmp(re->new_name, re1->desc->vol->name,
+				    re1->desc->vol->name_len)) {
+				no_remove_needed =3D 1;
+				break;
+			}
+		}
+
+		if (no_remove_needed)
+			continue;
+
+		/*
+		 * It seems we need to remove volume with name @re->new_name,
+		 * if it exists.
+		 */
+		desc =3D ubi_open_volume_nm(ubi->ubi_num, re->new_name, UBI_EXCLUSIVE);
+		if (IS_ERR(desc)) {
+			err =3D PTR_ERR(desc);
+			if (err =3D=3D -ENODEV)
+				/* Re-naming into a non-existing volume name */
+				continue;
+
+			/* The volume exists but busy, or an error occurred */
+			dbg_err("cannot open volume \"%s\", error %d",
+				re->new_name, err);
+			goto out_free;
+		}
+
+		re =3D kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
+		if (!re) {
+			err =3D -ENOMEM;
+			ubi_close_volume(desc);
+			goto out_free;
+		}
+
+		re->remove =3D 1;
+		re->desc =3D desc;
+		list_add(&re->list, &rename_list);
+		dbg_msg("will remove volume %d, name \"%s\"",
+			re->desc->vol->vol_id, re->desc->vol->name);
+	}
+
+	mutex_lock(&ubi->volumes_mutex);
+	err =3D ubi_rename_volumes(ubi, &rename_list);
+	mutex_unlock(&ubi->volumes_mutex);
+
+out_free:
+	list_for_each_entry_safe(re, re1, &rename_list, list) {
+		ubi_close_volume(re->desc);
+		list_del(&re->list);
+		kfree(re);
+	}
+	return err;
+}
+
 static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -664,7 +824,7 @@ static int ubi_cdev_ioctl(struct inode *inode, struct f=
ile *file,
 		}
=20
 		mutex_lock(&ubi->volumes_mutex);
-		err =3D ubi_remove_volume(desc);
+		err =3D ubi_remove_volume(desc, 0);
 		mutex_unlock(&ubi->volumes_mutex);
=20
 		/*
@@ -711,6 +871,32 @@ static int ubi_cdev_ioctl(struct inode *inode, struct =
file *file,
 		break;
 	}
=20
+	/* Re-name volumes command */
+	case UBI_IOCRNVOL:
+	{
+		struct ubi_rnvol_req *req;
+
+		dbg_msg("re-name volumes");
+		req =3D kmalloc(sizeof(struct ubi_rnvol_req), GFP_KERNEL);
+		if (!req) {
+			err =3D -ENOMEM;
+			break;
+		};
+
+		err =3D copy_from_user(req, argp, sizeof(struct ubi_rnvol_req));
+		if (err) {
+			err =3D -EFAULT;
+			kfree(req);
+			break;
+		}
+
+		mutex_lock(&ubi->mult_mutex);
+		err =3D rename_volumes(ubi, req);
+		mutex_unlock(&ubi->mult_mutex);
+		kfree(req);
+		break;
+	}
+
 	default:
 		err =3D -ENOTTY;
 		break;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1fc32c8..274c679 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -131,6 +131,27 @@ struct ubi_ltree_entry {
 	struct rw_semaphore mutex;
 };
=20
+/**
+ * struct ubi_rename_entry - volume re-name description data structure.
+ * @new_name_len: new volume name length
+ * @new_name: new volume name
+ * @remove: if not zero, this volume should be removed, not re-named
+ * @desc: descriptor of the volume
+ * @list: links re-name entries into a list
+ *
+ * This data structure is utilized in the multiple volume re-name code. Na=
mely,
+ * UBI first creates a list of &struct ubi_rename_entry objects from the
+ * &struct ubi_rnvol_req request object, and then utilizes this list to do=
 all
+ * the job.
+ */
+struct ubi_rename_entry {
+	int new_name_len;
+	char new_name[UBI_VOL_NAME_MAX + 1];
+	int remove;
+	struct ubi_volume_desc *desc;
+	struct list_head list;
+};
+
 struct ubi_volume_desc;
=20
 /**
@@ -206,7 +227,7 @@ struct ubi_volume {
 	int alignment;
 	int data_pad;
 	int name_len;
-	char name[UBI_VOL_NAME_MAX+1];
+	char name[UBI_VOL_NAME_MAX + 1];
=20
 	int upd_ebs;
 	int ch_lnum;
@@ -272,7 +293,7 @@ struct ubi_wl_entry;
  * @vtbl_size: size of the volume table in bytes
  * @vtbl: in-RAM volume table copy
  * @volumes_mutex: protects on-flash volume table and serializes volume
- *                 changes, like creation, deletion, update, resize
+ *                 changes, like creation, deletion, update, re-size and r=
e-name
  *
  * @max_ec: current highest erase counter value
  * @mean_ec: current mean erase counter value
@@ -330,6 +351,8 @@ struct ubi_wl_entry;
  * @peb_buf1: a buffer of PEB size used for different purposes
  * @peb_buf2: another buffer of PEB size used for different purposes
  * @buf_mutex: proptects @peb_buf1 and @peb_buf2
+ * @ckvol_mutex: serializes static volume checking when opening
+ * @mult_mutex: serializes operations on multiple volumes, like re-nameing
  * @dbg_peb_buf: buffer of PEB size used for debugging
  * @dbg_buf_mutex: proptects @dbg_peb_buf
  */
@@ -410,6 +433,7 @@ struct ubi_device {
 	void *peb_buf2;
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
+	struct mutex mult_mutex;
 #ifdef CONFIG_MTD_UBI_DEBUG
 	void *dbg_peb_buf;
 	struct mutex dbg_buf_mutex;
@@ -426,12 +450,15 @@ extern struct mutex ubi_devices_mutex;
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec);
+int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
+			    struct list_head *rename_list);
 int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si=
);
=20
 /* vmt.c */
 int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
-int ubi_remove_volume(struct ubi_volume_desc *desc);
+int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl);
 int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs);
+int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_li=
st);
 int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol);
 void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol);
=20
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 2cd886a..4be4014 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -402,13 +402,14 @@ out_unlock:
 /**
  * ubi_remove_volume - remove volume.
  * @desc: volume descriptor
+ * @no_vtbl: do not change volume table if not zero
  *
  * This function removes volume described by @desc. The volume has to be o=
pened
  * in "exclusive" mode. Returns zero in case of success and a negative err=
or
  * code in case of failure. The caller has to have the @ubi->volumes_mutex
  * locked.
  */
-int ubi_remove_volume(struct ubi_volume_desc *desc)
+int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 {
 	struct ubi_volume *vol =3D desc->vol;
 	struct ubi_device *ubi =3D vol->ubi;
@@ -437,9 +438,11 @@ int ubi_remove_volume(struct ubi_volume_desc *desc)
 	if (err)
 		goto out_err;
=20
-	err =3D ubi_change_vtbl_record(ubi, vol_id, NULL);
-	if (err)
-		goto out_err;
+	if (!no_vtbl) {
+		err =3D ubi_change_vtbl_record(ubi, vol_id, NULL);
+		if (err)
+			goto out_err;
+	}
=20
 	for (i =3D 0; i < vol->reserved_pebs; i++) {
 		err =3D ubi_eba_unmap_leb(ubi, vol, i);
@@ -465,7 +468,8 @@ int ubi_remove_volume(struct ubi_volume_desc *desc)
 	ubi->vol_count -=3D 1;
 	spin_unlock(&ubi->volumes_lock);
=20
-	err =3D paranoid_check_volumes(ubi);
+	if (!no_vtbl)
+		err =3D paranoid_check_volumes(ubi);
 	return err;
=20
 out_err:
@@ -602,6 +606,44 @@ out_free:
 }
=20
 /**
+ * ubi_rename_volumes - re-name UBI volumes.
+ * @ubi: UBI device description object
+ * @renam_list: list of &struct ubi_rename_entry objects
+ *
+ * This function re-names or removes volumes specified in the re-name list=
.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_li=
st)
+{
+	int err;
+	struct ubi_rename_entry *re;
+
+	err =3D ubi_vtbl_rename_volumes(ubi, rename_list);
+	if (err)
+		return err;
+
+	list_for_each_entry(re, rename_list, list) {
+		if (re->remove) {
+			err =3D ubi_remove_volume(re->desc, 1);
+			if (err)
+				break;
+		} else {
+			struct ubi_volume *vol =3D re->desc->vol;
+
+			spin_lock(&ubi->volumes_lock);
+			vol->name_len =3D re->new_name_len;
+			memcpy(vol->name, re->new_name, re->new_name_len + 1);
+			spin_unlock(&ubi->volumes_lock);
+		}
+	}
+
+	if (!err)
+		paranoid_check_volumes(ubi);
+	return err;
+}
+
+/**
  * ubi_add_volume - add volume.
  * @ubi: UBI device description object
  * @vol: volume description object
@@ -826,10 +868,9 @@ static int paranoid_check_volume(struct ubi_device *ub=
i, int vol_id)
=20
 fail:
 	ubi_err("paranoid check failed for volume %d", vol_id);
-	if (vol) {
+	if (vol)
 		ubi_dbg_dump_vol_info(vol);
-		ubi_dbg_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
-	}
+	ubi_dbg_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
 	spin_unlock(&ubi->volumes_lock);
 	return -EINVAL;
 }
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 05fb72f..23c5376 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -115,6 +115,57 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int=
 idx,
 }
=20
 /**
+ * ubi_vtbl_rename_volumes - rename UBI volumes in the volume table.
+ * @ubi: UBI device description object
+ * @renam_list: list of &struct ubi_rename_entry objects
+ *
+ * This function re-names multiple volumes specified in @req in the volume
+ * table. Returns zero in case of success and a negative error code in cas=
e of
+ * failure.
+ */
+int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
+			    struct list_head *rename_list)
+{
+	int i, err;
+	struct ubi_rename_entry *re;
+	struct ubi_volume *layout_vol;
+
+	list_for_each_entry(re, rename_list, list) {
+		uint32_t crc;
+		struct ubi_volume *vol =3D re->desc->vol;
+		struct ubi_vtbl_record *vtbl_rec =3D &ubi->vtbl[vol->vol_id];
+
+		if (re->remove) {
+			memcpy(vtbl_rec, &empty_vtbl_record,
+			       sizeof(struct ubi_vtbl_record));
+			continue;
+		}
+
+		vtbl_rec->name_len =3D cpu_to_be16(re->new_name_len);
+		memcpy(vtbl_rec->name, re->new_name, re->new_name_len);
+		memset(vtbl_rec->name + re->new_name_len, 0,
+		       UBI_VOL_NAME_MAX + 1 - re->new_name_len);
+		crc =3D crc32(UBI_CRC32_INIT, vtbl_rec,
+			    UBI_VTBL_RECORD_SIZE_CRC);
+		vtbl_rec->crc =3D cpu_to_be32(crc);
+	}
+
+	layout_vol =3D ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
+	for (i =3D 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
+		err =3D ubi_eba_unmap_leb(ubi, layout_vol, i);
+		if (err)
+			return err;
+
+		err =3D ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
+					ubi->vtbl_size, UBI_LONGTERM);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
  * vtbl_check - check if volume table is not corrupted and contains sensib=
le
  *              data.
  * @ubi: UBI device description object
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index a7421f1..e8e57c3 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -58,6 +58,13 @@
  * device should be used. A &struct ubi_rsvol_req object has to be properl=
y
  * filled and a pointer to it has to be passed to the IOCTL.
  *
+ * UBI volumes re-name
+ * ~~~~~~~~~~~~~~~~~~~
+ *
+ * To re-name several volumes atomically at one go, the %UBI_IOCRNVOL comm=
and
+ * of the UBI character device should be used. A &struct ubi_rnvol_req obj=
ect
+ * has to be properly filled and a pointer to it has to be passed to the I=
OCTL.
+ *
  * UBI volume update
  * ~~~~~~~~~~~~~~~~~
  *
@@ -104,6 +111,8 @@
 #define UBI_IOCRMVOL _IOW(UBI_IOC_MAGIC, 1, int32_t)
 /* Re-size an UBI volume */
 #define UBI_IOCRSVOL _IOW(UBI_IOC_MAGIC, 2, struct ubi_rsvol_req)
+/* Re-name volumes */
+#define UBI_IOCRNVOL _IOW(UBI_IOC_MAGIC, 3, struct ubi_rnvol_req)
=20
 /* IOCTL commands of the UBI control character device */
=20
@@ -128,6 +137,9 @@
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
=20
+/* Maximum amount of UBI volumes that can be re-named at one go */
+#define UBI_MAX_RNVOL 32
+
 /*
  * UBI data type hint constants.
  *
@@ -189,7 +201,7 @@ struct ubi_attach_req {
 	int32_t ubi_num;
 	int32_t mtd_num;
 	int32_t vid_hdr_offset;
-	uint8_t padding[12];
+	int8_t padding[12];
 };
=20
 /**
@@ -251,6 +263,48 @@ struct ubi_rsvol_req {
 } __attribute__ ((packed));
=20
 /**
+ * struct ubi_rnvol_req - volumes re-name request.
+ * @count: count of volumes to re-name
+ * @padding1:  reserved for future, not used, has to be zeroed
+ * @vol_id: ID of the volume to re-name
+ * @name_len: name length
+ * @padding2:  reserved for future, not used, has to be zeroed
+ * @name: new volume name
+ *
+ * UBI allows to re-name up to %32 volumes at one go. The count of volumes=
 to
+ * re-name is specified in the @count field. The ID of the volumes to re-n=
ame
+ * and the new names are specified in the @vol_id and @name fields.
+ *
+ * The UBI volume re-name operation is atomic, which means that should pow=
er cut
+ * happen, the volumes will have either old name or new name. So the possi=
ble
+ * use-cases of this command is atomic upgrade. Indeed, to upgrade, say, v=
olumes
+ * A and B one may create temporary volumes %A1 and %B1 with the new conte=
nts,
+ * then atomically re-name A1->A and B1->B, in which case old %A and %B wi=
ll
+ * be removed.
+ *
+ * If it is not desirable to remove old A and B, the re-name request has t=
o
+ * contain 4 entries: A1->A, A->A1, B1->B, B->B1, in which case old A1 and=
 B1
+ * become A and B, and old A and B will become A1 and B1.
+ *
+ * It is also OK to request: A1->A, A1->X, B1->B, B->Y, in which case old =
A1
+ * and B1 become A and B, and old A and B become X and Y.
+ *
+ * In other words, in case of re-naming into an existing volume name, the
+ * existing volume is removed, unless it is re-named as well at the same
+ * re-name request.
+ */
+struct ubi_rnvol_req {
+	int32_t count;
+	int8_t padding1[12];
+	struct {
+		int32_t vol_id;
+		int16_t name_len;
+		int8_t  padding2[2];
+		char    name[UBI_MAX_VOLUME_NAME + 1];
+	} ents[UBI_MAX_RNVOL];
+} __attribute__ ((packed));
+
+/**
  * struct ubi_leb_change_req - a data structure used in atomic logical
  *                             eraseblock change requests.
  * @lnum: logical eraseblock number to change
@@ -261,8 +315,8 @@ struct ubi_rsvol_req {
 struct ubi_leb_change_req {
 	int32_t lnum;
 	int32_t bytes;
-	uint8_t dtype;
-	uint8_t padding[7];
+	int8_t  dtype;
+	int8_t  padding[7];
 } __attribute__ ((packed));
=20
 #endif /* __UBI_USER_H__ */
--=20
1.5.4.1

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
