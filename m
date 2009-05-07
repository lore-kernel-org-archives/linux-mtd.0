Received: from iksaif.net ([88.191.73.63])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M216K-0006uT-3p
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 10:45:38 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
Date: Thu,  7 May 2009 12:21:48 +0200
Message-Id: <1241691709-17624-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

libubiio is library providing the same API the kernel does.
Merge libubiio into mkfs.ubifs. First it won't be exported as
a shared library.
Also update ubi-user.h to use newer ioctl().

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 include/mtd/ubi-user.h    |   72 ++--
 include/ubi.h             |  192 +++++++++
 mkfs.ubifs/libubiio.c     |  936 +++++++++++++++++++++++++++++++++++++++++++++
 mkfs.ubifs/libubiio.h     |   47 +++
 mkfs.ubifs/libubiio_int.h |  187 +++++++++
 5 files changed, 1399 insertions(+), 35 deletions(-)
 create mode 100644 include/ubi.h
 create mode 100644 mkfs.ubifs/libubiio.c
 create mode 100644 mkfs.ubifs/libubiio.h
 create mode 100644 mkfs.ubifs/libubiio_int.h

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 296efae..466a832 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -21,6 +21,8 @@
 #ifndef __UBI_USER_H__
 #define __UBI_USER_H__
 
+#include <linux/types.h>
+
 /*
  * UBI device creation (the same as MTD device attachment)
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -152,7 +154,7 @@
 /* Create an UBI volume */
 #define UBI_IOCMKVOL _IOW(UBI_IOC_MAGIC, 0, struct ubi_mkvol_req)
 /* Remove an UBI volume */
-#define UBI_IOCRMVOL _IOW(UBI_IOC_MAGIC, 1, int32_t)
+#define UBI_IOCRMVOL _IOW(UBI_IOC_MAGIC, 1, __s32)
 /* Re-size an UBI volume */
 #define UBI_IOCRSVOL _IOW(UBI_IOC_MAGIC, 2, struct ubi_rsvol_req)
 /* Re-name volumes */
@@ -165,24 +167,24 @@
 /* Attach an MTD device */
 #define UBI_IOCATT _IOW(UBI_CTRL_IOC_MAGIC, 64, struct ubi_attach_req)
 /* Detach an MTD device */
-#define UBI_IOCDET _IOW(UBI_CTRL_IOC_MAGIC, 65, int32_t)
+#define UBI_IOCDET _IOW(UBI_CTRL_IOC_MAGIC, 65, __s32)
 
 /* ioctl commands of UBI volume character devices */
 
 #define UBI_VOL_IOC_MAGIC 'O'
 
 /* Start UBI volume update */
-#define UBI_IOCVOLUP _IOW(UBI_VOL_IOC_MAGIC, 0, int64_t)
+#define UBI_IOCVOLUP _IOW(UBI_VOL_IOC_MAGIC, 0, __s64)
 /* LEB erasure command, used for debugging, disabled by default */
-#define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, int32_t)
+#define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, __s32)
 /* Atomic LEB change command */
-#define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, int32_t)
+#define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, __s32)
 /* Map LEB command */
 #define UBI_IOCEBMAP _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
 /* Unmap LEB command */
-#define UBI_IOCEBUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
+#define UBI_IOCEBUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, __s32)
 /* Check if LEB is mapped command */
-#define UBI_IOCEBISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, int32_t)
+#define UBI_IOCEBISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, __s32)
 /* Set an UBI volume property */
 #define UBI_IOCSETPROP _IOW(UBI_VOL_IOC_MAGIC, 6, struct ubi_set_prop_req)
 
@@ -260,10 +262,10 @@ enum {
  * sub-page of the first page and add needed padding.
  */
 struct ubi_attach_req {
-	int32_t ubi_num;
-	int32_t mtd_num;
-	int32_t vid_hdr_offset;
-	int8_t padding[12];
+	__s32 ubi_num;
+	__s32 mtd_num;
+	__s32 vid_hdr_offset;
+	__s8 padding[12];
 };
 
 /**
@@ -298,13 +300,13 @@ struct ubi_attach_req {
  * BLOBs, without caring about how to properly align them.
  */
 struct ubi_mkvol_req {
-	int32_t vol_id;
-	int32_t alignment;
-	int64_t bytes;
-	int8_t vol_type;
-	int8_t padding1;
-	int16_t name_len;
-	int8_t padding2[4];
+	__s32 vol_id;
+	__s32 alignment;
+	__s64 bytes;
+	__s8 vol_type;
+	__s8 padding1;
+	__s16 name_len;
+	__s8 padding2[4];
 	char name[UBI_MAX_VOLUME_NAME + 1];
 } __attribute__ ((packed));
 
@@ -320,8 +322,8 @@ struct ubi_mkvol_req {
  * zero number of bytes).
  */
 struct ubi_rsvol_req {
-	int64_t bytes;
-	int32_t vol_id;
+	__s64 bytes;
+	__s32 vol_id;
 } __attribute__ ((packed));
 
 /**
@@ -356,12 +358,12 @@ struct ubi_rsvol_req {
  * re-name request.
  */
 struct ubi_rnvol_req {
-	int32_t count;
-	int8_t padding1[12];
+	__s32 count;
+	__s8 padding1[12];
 	struct {
-		int32_t vol_id;
-		int16_t name_len;
-		int8_t  padding2[2];
+		__s32 vol_id;
+		__s16 name_len;
+		__s8  padding2[2];
 		char    name[UBI_MAX_VOLUME_NAME + 1];
 	} ents[UBI_MAX_RNVOL];
 } __attribute__ ((packed));
@@ -375,10 +377,10 @@ struct ubi_rnvol_req {
  * @padding: reserved for future, not used, has to be zeroed
  */
 struct ubi_leb_change_req {
-	int32_t lnum;
-	int32_t bytes;
-	int8_t  dtype;
-	int8_t  padding[7];
+	__s32 lnum;
+	__s32 bytes;
+	__s8  dtype;
+	__s8  padding[7];
 } __attribute__ ((packed));
 
 /**
@@ -388,9 +390,9 @@ struct ubi_leb_change_req {
  * @padding: reserved for future, not used, has to be zeroed
  */
 struct ubi_map_req {
-	int32_t lnum;
-	int8_t  dtype;
-	int8_t  padding[3];
+	__s32 lnum;
+	__s8  dtype;
+	__s8  padding[3];
 } __attribute__ ((packed));
 
 
@@ -402,9 +404,9 @@ struct ubi_map_req {
  * @value: value to set
  */
 struct ubi_set_prop_req {
-       uint8_t  property;
-       uint8_t  padding[7];
-       uint64_t value;
+       __u8  property;
+       __u8  padding[7];
+       __u64 value;
 }  __attribute__ ((packed));
 
 #endif /* __UBI_USER_H__ */
diff --git a/include/ubi.h b/include/ubi.h
new file mode 100644
index 0000000..5d9ae11
--- /dev/null
+++ b/include/ubi.h
@@ -0,0 +1,192 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ * Author: Artem Bityutskiy (Битюцкий Артём)
+ */
+
+#ifndef __LINUX_UBI_H__
+#define __LINUX_UBI_H__
+
+#include <asm/ioctl.h>
+#include <linux/types.h>
+#include <mtd/ubi-user.h>
+
+/*
+ * enum ubi_open_mode - UBI volume open mode constants.
+ *
+ * UBI_READONLY: read-only mode
+ * UBI_READWRITE: read-write mode
+ * UBI_EXCLUSIVE: exclusive mode
+ */
+enum
+{
+  UBI_READONLY = 1,
+  UBI_READWRITE,
+  UBI_EXCLUSIVE
+};
+
+/**
+ * struct ubi_volume_info - UBI volume description data structure.
+ * @vol_id: volume ID
+ * @ubi_num: UBI device number this volume belongs to
+ * @size: how many physical eraseblocks are reserved for this volume
+ * @used_bytes: how many bytes of data this volume contains
+ * @used_ebs: how many physical eraseblocks of this volume actually contain any
+ *            data
+ * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
+ * @corrupted: non-zero if the volume is corrupted (static volumes only)
+ * @upd_marker: non-zero if the volume has update marker set
+ * @alignment: volume alignment
+ * @usable_leb_size: how many bytes are available in logical eraseblocks of
+ *                   this volume
+ * @name_len: volume name length
+ * @name: volume name
+ * @cdev: UBI volume character device major and minor numbers
+ *
+ * The @corrupted flag is only relevant to static volumes and is always zero
+ * for dynamic ones. This is because UBI does not care about dynamic volume
+ * data protection and only cares about protecting static volume data.
+ *
+ * The @upd_marker flag is set if the volume update operation was interrupted.
+ * Before touching the volume data during the update operation, UBI first sets
+ * the update marker flag for this volume. If the volume update operation was
+ * further interrupted, the update marker indicates this. If the update marker
+ * is set, the contents of the volume is certainly damaged and a new volume
+ * update operation has to be started.
+ *
+ * To put it differently, @corrupted and @upd_marker fields have different
+ * semantics:
+ *     o the @corrupted flag means that this static volume is corrupted for some
+ *       reasons, but not because an interrupted volume update
+ *     o the @upd_marker field means that the volume is damaged because of an
+ *       interrupted update operation.
+ *
+ * I.e., the @corrupted flag is never set if the @upd_marker flag is set.
+ *
+ * The @used_bytes and @used_ebs fields are only really needed for static
+ * volumes and contain the number of bytes stored in this static volume and how
+ * many eraseblock this data occupies. In case of dynamic volumes, the
+ * @used_bytes field is equivalent to @size*@usable_leb_size, and the @used_ebs
+ * field is equivalent to @size.
+ *
+ * In general, logical eraseblock size is a property of the UBI device, not
+ * of the UBI volume. Indeed, the logical eraseblock size depends on the
+ * physical eraseblock size and on how much bytes UBI headers consume. But
+ * because of the volume alignment (@alignment), the usable size of logical
+ * eraseblocks if a volume may be less. The following equation is true:
+ * 	@usable_leb_size = LEB size - (LEB size mod @alignment),
+ * where LEB size is the logical eraseblock size defined by the UBI device.
+ *
+ * The alignment is multiple to the minimal flash input/output unit size or %1
+ * if all the available space is used.
+ *
+ * To put this differently, alignment may be considered is a way to change
+ * volume logical eraseblock sizes.
+ */
+struct ubi_volume_info
+{
+  int ubi_num;
+  int vol_id;
+  int size;
+  long long used_bytes;
+  int used_ebs;
+  int vol_type;
+  int corrupted;
+  int upd_marker;
+  int alignment;
+  int usable_leb_size;
+  int name_len;
+  const char *name;
+  dev_t cdev;
+};
+
+/**
+ * struct ubi_device_info - UBI device description data structure.
+ * @ubi_num: ubi device number
+ * @leb_size: logical eraseblock size on this UBI device
+ * @min_io_size: minimal I/O unit size
+ * @ro_mode: if this device is in read-only mode
+ * @cdev: UBI character device major and minor numbers
+ *
+ * Note, @leb_size is the logical eraseblock size offered by the UBI device.
+ * Volumes of this UBI device may have smaller logical eraseblock size if their
+ * alignment is not equivalent to %1.
+ */
+struct ubi_device_info
+{
+  int ubi_num;
+  int leb_size;
+  int min_io_size;
+  int ro_mode;
+  dev_t cdev;
+};
+
+/* UBI descriptor given to users when they open UBI volumes */
+struct ubi_volume_desc;
+
+int ubi_get_device_info(int ubi_num, struct ubi_device_info *di);
+void ubi_get_volume_info(struct ubi_volume_desc *desc,
+			 struct ubi_volume_info *vi);
+struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode);
+struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
+					   int mode);
+void ubi_close_volume(struct ubi_volume_desc *desc);
+int ubi_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf,
+		 int offset, int len, int check);
+int ubi_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
+		  int offset, int len, int dtype);
+int ubi_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
+		   int len, int dtype);
+int ubi_leb_erase(struct ubi_volume_desc *desc, int lnum);
+int ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum);
+int ubi_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype);
+int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
+int ubi_sync(int ubi_num);
+
+/*
+ * This function is the same as the 'ubi_leb_read()' function, but it does not
+ * provide the checking capability.
+ */
+static inline int
+ubi_read(struct ubi_volume_desc *desc, int lnum, char *buf,
+	 int offset, int len)
+{
+  return ubi_leb_read(desc, lnum, buf, offset, len, 0);
+}
+
+/*
+ * This function is the same as the 'ubi_leb_write()' functions, but it does
+ * not have the data type argument.
+ */
+static inline int
+ubi_write(struct ubi_volume_desc *desc, int lnum,
+	  const void *buf, int offset, int len)
+{
+  return ubi_leb_write(desc, lnum, buf, offset, len, UBI_UNKNOWN);
+}
+
+/*
+ * This function is the same as the 'ubi_leb_change()' functions, but it does
+ * not have the data type argument.
+ */
+static inline int
+ubi_change(struct ubi_volume_desc *desc, int lnum, const void *buf, int len)
+{
+  return ubi_leb_change(desc, lnum, buf, len, UBI_UNKNOWN);
+}
+
+#endif /* !__LINUX_UBI_H__ */
diff --git a/mkfs.ubifs/libubiio.c b/mkfs.ubifs/libubiio.c
new file mode 100644
index 0000000..47025e5
--- /dev/null
+++ b/mkfs.ubifs/libubiio.c
@@ -0,0 +1,936 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * UBI (Unsorted Block Images) io library.
+ */
+
+#define _GNU_SOURCE
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/file.h>
+#include <dirent.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <limits.h>
+#include <inttypes.h>
+#include <mtd/ubi-user.h>
+#include <linux/kdev_t.h>
+
+#include "libubiio.h"
+#include "libubiio_int.h"
+
+#define PROGRAM_NAME "libubiio"
+
+static int
+__ubi_get_device_info(int ubi_num, struct ubi_device_info *dev_info)
+{
+  char sys_path[PATH_MAX];
+  const char *sys_dir_path = get_sys_dir_path();
+  int ret = 0;
+
+  dbgmsg("ubi get device info ");
+  memset(dev_info, '\0', sizeof(struct ubi_device_info));
+  dev_info->ubi_num = ubi_num;
+
+  /* minimum input/output unit size of the UBI device */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_DEV_NAME_PATT "/" DEV_MIN_IO_SIZE,
+	  sys_dir_path, ubi_num);
+  if ((ret = read_positive_int(sys_path, &dev_info->min_io_size)) < 0)
+    return ret;
+  dbgmsg("%s = %d", sys_path, dev_info->min_io_size);
+
+  /* dev eb_size */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_DEV_NAME_PATT "/" DEV_EB_SIZE,
+	  sys_dir_path, ubi_num);
+  if ((ret = read_positive_int(sys_path, &dev_info->leb_size)) < 0)
+    return ret;
+  dbgmsg("%s = %d", sys_path, dev_info->leb_size);
+
+  return 0;
+}
+
+static int
+__ubi_get_volume_info(int ubi_num, int vol_id, struct ubi_volume_info *vol_info)
+{
+  char sys_path[PATH_MAX];
+  const char *sys_dir_path = get_sys_dir_path();
+  int ret = 0;
+
+  dbgmsg("ubi get volume info");
+  /* device number */
+  vol_info->ubi_num = ubi_num;
+  /* volume id */
+  vol_info->vol_id = vol_id;
+  /* volume dev minor major */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_DEV,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_cdev(sys_path, &vol_info->cdev)) < 0)
+    return ret;
+  dbgmsg("major = %d", MAJOR(vol_info->cdev));
+  dbgmsg("minor = %d", MINOR(vol_info->cdev));
+
+  /* volume type */
+  {
+    char type_buf[64];
+
+    sprintf(sys_path,
+	    "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_TYPE,
+	    sys_dir_path, ubi_num, vol_id);
+    if ((ret = read_data(sys_path, type_buf, sizeof(type_buf))) < 7)
+      return -EINVAL;
+    type_buf[6] = '\0';
+    if (!strcmp(type_buf, "static"))
+      vol_info->vol_type = UBI_STATIC_VOLUME;
+    else if (!strcmp(type_buf, "dynami"))
+      vol_info->vol_type = UBI_DYNAMIC_VOLUME;
+    else
+      {
+        errmsg("Invalid type of volume (%s) in %s", type_buf, sys_path);
+        return -EINVAL;
+      }
+  }
+  /* alignment */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_ALIGNMENT,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_positive_int(sys_path, &vol_info->alignment)) < 0)
+    return ret;
+  dbgmsg("%s  = %d", sys_path, vol_info->alignment);
+
+  /* reserved_ebs = size */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_RSVD_EBS,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_positive_int(sys_path, &vol_info->size)) < 0)
+    return ret;
+  dbgmsg("%s  = %d", sys_path, vol_info->size);
+
+  /* eb size  */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_EB_SIZE,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_positive_int(sys_path, &vol_info->usable_leb_size)) < 0)
+    return ret;
+  dbgmsg("%s  = %d", sys_path, vol_info->usable_leb_size);
+  /*
+   * used_ebs :
+   * In case of dynamic volume UBI knows nothing about how many
+   * data is stored there. So assume the whole volume is used.
+   * FIXME: And in case of static volume I have no idea how compute
+   * last_eb_bytes, need more research ...
+   */
+  vol_info->used_ebs = vol_info->size;
+  dbgmsg("used_ebs  = %Ld", vol_info->used_ebs);
+  /* FIXME: this value may be false for a STATIC VOLUME */
+  vol_info->used_bytes = vol_info->usable_leb_size * vol_info->used_ebs;
+  dbgmsg("used_bytes  = %Ld", vol_info->used_bytes);
+
+  /* upd marker  */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_UPD_MARKER,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_positive_int(sys_path, &vol_info->upd_marker)) < 0)
+    return ret;
+  dbgmsg("%s = %d", sys_path, vol_info->upd_marker);
+
+  /* corrupted  */
+  sprintf(sys_path,
+	  "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_CORRUPTED,
+	  sys_dir_path, ubi_num, vol_id);
+  if ((ret = read_positive_int(sys_path, &vol_info->corrupted)) < 0)
+    return ret;
+  dbgmsg("%s = %d", sys_path, vol_info->corrupted);
+
+  /* volume name */
+  {
+    char name[UBI_VOL_NAME_MAX];
+
+    sprintf(sys_path,
+	    "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_NAME,
+	    sys_dir_path, ubi_num, vol_id);
+    if ((ret = read_data(sys_path, name, sizeof name)) < 0)
+      return ret;
+    vol_info->name = strdup(name);
+    vol_info->name_len = strlen(name);
+    dbgmsg("%s = %s", sys_path, vol_info->name);
+  }
+  return 0;
+}
+
+static int
+ubi_mode2flags(int mode, int *flags)
+{
+  switch (mode)
+    {
+    case UBI_READWRITE:
+      *flags = O_RDWR;
+      break;
+    case UBI_READONLY:
+      *flags = O_RDONLY;
+      break;
+    case UBI_EXCLUSIVE:
+      *flags = O_RDWR;
+      break;
+    default:
+      return -1;
+    }
+  return 0;
+}
+
+/**
+ * ubi_open_volume - open UBI volume.
+ * @ubi_num: UBI device number
+ * @vol_id: volume ID
+ * @mode: open mode
+ *
+ * The @mode parameter specifies if the volume should be opened in read-only
+ * mode, read-write mode, or exclusive mode. The exclusive mode guarantees that
+ * nobody else will be able to open this volume. UBI allows to have many volume
+ * readers and one writer at a time.
+ *
+ * If a static volume is being opened for the first time since boot, it will be
+ * checked by this function, which means it will be fully read and the CRC
+ * checksum of each logical eraseblock will be checked.
+ *
+ * This function returns volume descriptor in case of success and %NULL in case
+ * of failure and errno is set.
+ */
+struct ubi_volume_desc *
+ubi_open_volume(int ubi_num, int vol_id, int mode)
+{
+  char vol_path[64];
+  struct ubi_volume_desc *desc;
+  int ret = 0;
+
+  sprintf(vol_path, "/dev/ubi%d_%d", ubi_num, vol_id);
+  desc = calloc(1, sizeof(struct ubi_volume_desc));
+  if (desc == NULL) {
+    ret = -errno;
+    goto failed;
+  }
+
+  desc->mode = mode;
+  if (ubi_mode2flags(mode, &mode) == -1)
+    {
+      sys_errmsg("Invalid mode");
+      ret = EINVAL;
+      goto failed;
+    }
+  desc->fd = open(vol_path, mode);
+  if (desc->fd < 0) {
+    ret = -errno;
+    goto failed;
+  }
+
+  /* allow direct write */
+  if (mode == UBI_READWRITE || mode == UBI_EXCLUSIVE)
+  {
+    struct ubi_set_prop_req setprop_req = {
+      .property = UBI_PROP_DIRECT_WRITE,
+      .value = 1
+    };
+    if (ioctl(desc->fd, UBI_IOCSETPROP, &setprop_req) < 0) {
+      ret = -errno;
+      goto failed_close;
+    }
+    if (mode == UBI_EXCLUSIVE)
+    {
+      if (flock(desc->fd, LOCK_EX))
+      {
+        sys_errmsg("Cannot lock the device");
+	ret = -errno;
+        goto failed_close;
+      }
+    }
+  }
+
+  if ((ret = __ubi_get_device_info(ubi_num, &desc->di)) < 0)
+    goto failed_close;
+
+  if ((ret = __ubi_get_volume_info(ubi_num, vol_id, &desc->vi)) < 0)
+    goto failed_close;
+
+  return desc;
+failed_close:
+  close(desc->fd);
+failed:
+  free(desc);
+  errno = -ret;
+  return NULL;
+}
+
+/**
+ * ubi_get_device_info - get information about UBI device.
+ * @ubi_num: UBI device number
+ * @di: the information is stored here
+ *
+ * This function returns %0 in case of success and  a negative
+ * error code in case of failure.
+ */
+int
+ubi_get_device_info(int ubi_num, struct ubi_device_info *di)
+{
+  return __ubi_get_device_info(ubi_num, di);
+}
+
+/**
+ * ubi_get_volume_info - get information about UBI volume.
+ * @desc: volume descriptor
+ * @vi: the information is stored here
+ */
+void
+ubi_get_volume_info(struct ubi_volume_desc *desc,
+			 struct ubi_volume_info *vi)
+{
+  memcpy(vi, &desc->vi, sizeof (*vi));
+}
+
+/**
+ * ubi_get_vol_id_by_name - get UBI volume information.
+ * @ubi_num: UBI device
+ * @name: name of the volume to get
+ *
+ * This function returns the volume id of the given volume name
+ * Returns the volume id in case of success and %-1 in case of failure.
+ */
+int
+ubi_get_vol_id_by_name(int ubi_num, const char *name)
+{
+  char sys_path[PATH_MAX];
+  const char *sys_dir_path = get_sys_dir_path();
+  char tmpname[UBI_VOL_NAME_MAX + 1];
+  char tmp_buf[NAME_MAX];
+  int tmp_ubi_num, tmp_vol_id, ret;
+  char *pos;
+  DIR *dir;
+  struct dirent *dirent;
+
+  /* get volume count */
+  sprintf(sys_path, "%s/" SYSFS_UBI, sys_dir_path);
+  dir = opendir(sys_path);
+  if (dir == NULL)
+    return -errno;
+  while ((dirent = readdir(dir)) != NULL)
+  {
+    ret =
+      sscanf(dirent->d_name, UBI_VOL_NAME_PATT "%s",
+          &tmp_ubi_num, &tmp_vol_id, tmp_buf);
+    if (ret != 2 || tmp_ubi_num != ubi_num)
+      continue;
+    sprintf(sys_path,
+        "%s/" SYSFS_UBI "/" UBI_VOL_NAME_PATT "/" VOL_NAME,
+        get_sys_dir_path(), ubi_num, tmp_vol_id);
+    if (read_data(sys_path, tmpname, UBI_VOL_NAME_MAX) == -1)
+      goto end_error;
+    /* strip \n */
+    pos = strchr(tmpname, '\n');
+    if (pos != NULL)
+      *pos = '\0';
+    if (!strcmp(tmpname, name))
+      goto return_vol_id;
+  }
+end_error:
+  tmp_vol_id = -1;
+return_vol_id:
+  closedir(dir);
+  dbgmsg("ubi get volume id by name (name = %s, id_vol = %d", name,
+	 tmp_vol_id);
+  return tmp_vol_id;
+}
+
+/**
+ * ubi_open_volume_nm - open UBI volume by name.
+ * @ubi_num: UBI device number
+ * @name: volume name
+ * @mode: open mode
+ *
+ * This function is similar to 'ubi_open_volume()', but opens a volume by name.
+ */
+struct ubi_volume_desc *
+ubi_open_volume_nm(int ubi_num, const char *name, int mode)
+{
+  int vol_id;
+
+  vol_id = ubi_get_vol_id_by_name(ubi_num, name);
+  if (vol_id < 0)
+    {
+      sys_errmsg("Cannot find volume id for name \"%s\"", name);
+      return NULL;
+    }
+  return ubi_open_volume(ubi_num, vol_id, mode);
+}
+
+/**
+ * ubi_close_volume - close UBI volume.
+ * @desc: volume descriptor
+ */
+void
+ubi_close_volume(struct ubi_volume_desc *desc)
+{
+  if (desc->mode == UBI_EXCLUSIVE)
+    flock(desc->fd, LOCK_UN);
+  close(desc->fd);
+  /* cast const char* to char* to free without warning */
+  free((char *) desc->vi.name);
+  free(desc);
+}
+
+/**
+ * ubi_leb_read - read data.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number to read from
+ * @buf: buffer where to store the read data
+ * @offset: offset within the logical eraseblock to read from
+ * @len: how many bytes to read
+ * @check: whether UBI has to check the read data's CRC or not.
+ *
+ * This function reads data from offset @offset of logical eraseblock @lnum and
+ * stores the data at @buf. When reading from static volumes, @check specifies
+ * whether the data has to be checked or not. If yes, the whole logical
+ * eraseblock will be read and its CRC checksum will be checked (i.e., the CRC
+ * checksum is per-eraseblock). So checking may substantially slow down the
+ * read speed. The @check argument is ignored for dynamic volumes.
+ *
+ * In case of success, this function returns %0. In case of failure, this
+ * function returns a negative error code.
+ *
+ * %EBADMSG is returned:
+ * o for both static and dynamic volumes if MTD driver has detected a data
+ *   integrity problem (unrecoverable ECC checksum mismatch in case of NAND);
+ * o for static volumes in case of data CRC mismatch.
+ *
+ * If the volume is damaged because of an interrupted update this function just
+ * returns %-EBADF error code.
+ */
+int
+ubi_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf, int offset,
+	     int len, int check)
+{
+  off_t addr;
+  int err;
+
+  /* TODO : we may want to use "check" for static volume */
+  (void) check;
+  addr = (desc->vi.usable_leb_size * (loff_t) lnum) + offset;
+  err = pread(desc->fd, buf, len, addr);
+  if (err < 0)
+    return -errno;
+  return 0;
+}
+
+/**
+ * ubi_leb_write - write data.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number to write to
+ * @buf: data to write
+ * @offset: offset within the logical eraseblock where to write
+ * @len: how many bytes to write
+ * @dtype: expected data type
+ *
+ * This function writes @len bytes of data from @buf to offset @offset of
+ * logical eraseblock @lnum. The @dtype argument describes expected lifetime of
+ * the data.
+ *
+ * This function takes care of physical eraseblock write failures. If write to
+ * the physical eraseblock write operation fails, the logical eraseblock is
+ * re-mapped to another physical eraseblock, the data is recovered, and the
+ * write finishes. UBI has a pool of reserved physical eraseblocks for this.
+ *
+ * If all the data were successfully written, %0 is returned. If an error
+ * occurred and UBI has not been able to recover from it, this function returns
+ * a negative error code. Note, in case of an error, it is 
+ * possible that something was still written to the flash media, but that may
+ * be some garbage.
+ *
+ * If the volume is damaged because of an interrupted update this function just
+ * returns immediately %-EBADF error code.
+ */
+int
+ubi_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
+	      int offset, int len, int dtype)
+{
+  int vol_id = desc->vi.vol_id;
+  off_t addr;
+  int err;
+
+  if (vol_id < 0)
+    {
+      sys_errmsg("Invalid volume id");
+      return -EINVAL;
+    }
+
+  if (desc->mode == UBI_READONLY || desc->vi.vol_type == UBI_STATIC_VOLUME)
+    {
+      sys_errmsg("UBI volume is readonly or static");
+      return -EROFS;
+    }
+
+  if (lnum < 0 || lnum >= desc->vi.used_ebs || offset < 0 || len < 0
+      || offset + len > desc->vi.usable_leb_size
+      || offset & (desc->di.min_io_size - 1)
+      || len & (desc->di.min_io_size - 1))
+    {
+      sys_errmsg("Invalid arguments");
+      return -EINVAL;
+    }
+
+  if (dtype != UBI_LONGTERM && dtype != UBI_SHORTTERM && dtype != UBI_UNKNOWN)
+    {
+      sys_errmsg("Invalid data type");
+      return -EINVAL;
+    }
+
+  if (desc->vi.upd_marker)
+    {
+      sys_errmsg("The volume is marked as updating");
+      return -EBADF;
+    }
+
+  if (len == 0)
+    return 0;
+  dbgmsg("write %d bytes to LEB %d:%d:%d", len, vol_id, lnum, offset);
+
+  addr = (desc->vi.usable_leb_size * (loff_t) lnum) + offset;
+  err = pwrite(desc->fd, buf, len, addr);
+  if (err < 0)
+      return -errno;
+  return 0;
+}
+
+/*
+ * ubi_leb_change - change logical eraseblock atomically.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number to change
+ * @buf: data to write
+ * @len: how many bytes to write
+ * @dtype: expected data type
+ *
+ * This function changes the contents of a logical eraseblock atomically. @buf
+ * has to contain new logical eraseblock data, and @len - the length of the
+ * data, which has to be aligned. The length may be shorter then the logical
+ * eraseblock size, ant the logical eraseblock may be appended to more times
+ * later on. This function guarantees that in case of an unclean reboot the old
+ * contents is preserved. Returns %0 in case of success and a negative error
+ * code in case of failure.
+ */
+int
+ubi_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
+	       int len, int dtype)
+{
+  off_t addr;
+  struct ubi_leb_change_req req = {
+    .lnum = lnum,
+    .bytes = len,
+    .dtype = dtype
+  };
+
+  if (desc->mode == UBI_READONLY || desc->vi.vol_type == UBI_STATIC_VOLUME)
+    {
+      sys_errmsg("UBI volume is readonly or static");
+      return -EROFS;
+    }
+
+  if (lnum < 0 || lnum >= desc->vi.used_ebs || len < 0 ||
+      len > desc->vi.usable_leb_size || len & (desc->di.min_io_size - 1))
+    {
+      sys_errmsg("Invalid arguments");
+      return -EINVAL;
+    }
+
+  if (dtype != UBI_LONGTERM && dtype != UBI_SHORTTERM && dtype != UBI_UNKNOWN)
+    {
+      sys_errmsg("Invalid data type");
+      return -EINVAL;
+    }
+
+  if (desc->vi.upd_marker)
+    {
+      sys_errmsg("The volume is marked as updating");
+      return -EBADF;
+    }
+
+  if (len == 0)
+    return 0;
+
+  addr = (desc->vi.usable_leb_size * (loff_t) lnum);
+  if (ioctl(desc->fd, UBI_IOCEBCH, &req))
+    return -errno;
+  if (pwrite(desc->fd, buf, len, addr) == -1)
+    return -errno;
+  return 0;
+}
+
+/**
+ * ubi_leb_erase - erase logical eraseblock.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number
+ *
+ * This function un-maps logical eraseblock @lnum and synchronously erases the
+ * correspondent physical eraseblock. Returns zero in case of success and a
+ * negative error code in case of failure.
+ *
+ * If the volume is damaged because of an interrupted update this function just
+ * returns immediately with %-EBADF code.
+ */
+int
+ubi_leb_erase(struct ubi_volume_desc *desc, int lnum)
+{
+  dbgmsg("erase LEB %d:%d", desc->vi.vol_id, lnum);
+
+  if (desc->mode == UBI_READONLY || desc->vi.vol_type == UBI_STATIC_VOLUME)
+    {
+      sys_errmsg("UBI volume is readonly or static");
+      return -EROFS;
+    }
+
+  if (lnum < 0 || lnum >= desc->vi.used_ebs)
+    {
+      sys_errmsg("Invalid arguments");
+      return -EINVAL;
+    }
+
+  if (desc->vi.upd_marker)
+    {
+      sys_errmsg("The volume is marked as updating");
+      return -EBADF;
+    }
+  if (ioctl(desc->fd, UBI_IOCEBER, &lnum) < 0)
+    return -errno;
+  return 0;
+}
+
+/**
+ * ubi_leb_unmap - un-map logical eraseblock.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number
+ *
+ * This function un-maps logical eraseblock @lnum and schedules the
+ * corresponding physical eraseblock for erasure, so that it will eventually be
+ * physically erased in background. This operation is much faster then the
+ * erase operation.
+ *
+ * Unlike erase, the un-map operation does not guarantee that the logical
+ * eraseblock will contain all 0xFF bytes when UBI is initialized again. For
+ * example, if several logical eraseblocks are un-mapped, and an unclean reboot
+ * happens after this, the logical eraseblocks will not necessarily be
+ * un-mapped again when this MTD device is attached. They may actually be
+ * mapped to the same physical eraseblocks again. So, this function has to be
+ * used with care.
+ *
+ * In other words, when un-mapping a logical eraseblock, UBI does not store
+ * any information about this on the flash media, it just marks the logical
+ * eraseblock as "un-mapped" in RAM. If UBI is detached before the physical
+ * eraseblock is physically erased, it will be mapped again to the same logical
+ * eraseblock when the MTD device is attached again.
+ *
+ * The main and obvious use-case of this function is when the contents of a
+ * logical eraseblock has to be re-written. Then it is much more efficient to
+ * first un-map it, then write new data, rather then first erase it, then write
+ * new data. Note, once new data has been written to the logical eraseblock,
+ * UBI guarantees that the old contents has gone forever. In other words, if an
+ * unclean reboot happens after the logical eraseblock has been un-mapped and
+ * then written to, it will contain the last written data.
+ *
+ * This function returns %0 in case of success and a negative error code in
+ * case of failure. If the volume is damaged because of an interrupted update
+ * this function just returns immediately returns %-EBADF code.
+ */
+int
+ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum)
+{
+  dbgmsg("unmap LEB %d:%d", desc->vi.vol_id, lnum);
+
+  if (desc->mode == UBI_READONLY || desc->vi.vol_type == UBI_STATIC_VOLUME)
+    {
+      sys_errmsg("UBI volume is readonly or static");
+      return -EROFS;
+    }
+
+  if (lnum < 0 || lnum >= desc->vi.used_ebs)
+    {
+      sys_errmsg("Invalid arguments");
+      return -EINVAL;
+    }
+
+  if (desc->vi.upd_marker)
+    {
+      sys_errmsg("The volume is marked as updating");
+      return -EBADF;
+    }
+
+  if (ioctl(desc->fd, UBI_IOCEBUNMAP, &lnum) < 0)
+    return -errno;
+  return 0;
+}
+
+/**
+ * ubi_leb_map - map logical erasblock to a physical eraseblock.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number
+ * @dtype: expected data type
+ *
+ * This function maps an un-mapped logical eraseblock @lnum to a physical
+ * eraseblock. This means, that after a successful invocation of this
+ * function the logical eraseblock @lnum will be empty (contain only %0xFF
+ * bytes) and be mapped to a physical eraseblock, even if an unclean reboot
+ * happens.
+ *
+ * This function returns %0 in case of success, and a negative error code in
+ * case of failure.
+ * %-EBADF is returned if the volume is damaged because of an interrupted
+ * update, %-EBADMSG is returned if the logical eraseblock is already mapped.
+ */
+int
+ubi_leb_map(struct ubi_volume_desc *desc, int lnum, int dtype)
+{
+  struct ubi_map_req req = {
+    .lnum = lnum,
+    .dtype = dtype
+  };
+
+  dbgmsg("map LEB %d:%d", desc->vi.vol_id, lnum);
+
+  if (desc->mode == UBI_READONLY || desc->vi.vol_type == UBI_STATIC_VOLUME)
+    {
+      sys_errmsg("UBI volume is readonly or static");
+      return -EROFS;
+    }
+
+  if (lnum < 0 || lnum >= desc->vi.used_ebs)
+    {
+      sys_errmsg("Invalid arguments");
+      return -EINVAL;
+    }
+
+  if (dtype != UBI_LONGTERM && dtype != UBI_SHORTTERM && dtype != UBI_UNKNOWN)
+    {
+      sys_errmsg("Invalid data type");
+      return -EINVAL;
+    }
+
+  if (desc->vi.upd_marker)
+    {
+      sys_errmsg("The volume is marked as updating");
+      return -EBADF;
+    }
+  if (ioctl(desc->fd, UBI_IOCEBMAP, &req) < 0)
+    return -errno;
+  return 0;
+}
+
+/**
+ * ubi_is_mapped - check if logical eraseblock is mapped.
+ * @desc: volume descriptor
+ * @lnum: logical eraseblock number
+ *
+ * This function checks if logical eraseblock @lnum is mapped to a physical
+ * eraseblock. If a logical eraseblock is un-mapped, this does not necessarily
+ * mean it will still be un-mapped after the UBI device is re-attached. The
+ * logical eraseblock may become mapped to the physical eraseblock it was last
+ * mapped to.
+ *
+ * This function returns %1 if the LEB is mapped, %0 if not, and %-1 in case of
+ * failure. If the volume is damaged because of an interrupted update errno
+ * set with %EBADF error code.
+ */
+int
+ubi_is_mapped(struct ubi_volume_desc *desc, int lnum)
+{
+  return ioctl(desc->fd, UBI_IOCEBISMAP, &lnum);
+}
+
+/**
+ * ubi_sync - synchronize UBI device buffers.
+ * @ubi_num: UBI device to synchronize
+ *
+ * The underlying MTD device may cache data in hardware or in software. This
+ * function ensures the caches are flushed. Returns %0 in case of success and
+ * %-1 in case of failure.
+ * TODO: Needs to be implemented.
+ */
+int
+ubi_sync(int ubi_num)
+{
+  // FIXME: Call fsync() on all volume for this device
+  // Add an ioctl to sync a device
+  (void) ubi_num;
+  return 0;
+}
+
+static const char *
+get_sys_dir_path()
+{
+  /* TODO: this must be discovered instead */
+  return "/sys";
+}
+
+static int
+read_positive_ll(const char *file, long long *value)
+{
+  int fd, rd;
+  char buf[50];
+  int ret = 0;
+
+  fd = open(file, O_RDONLY);
+  if (fd == -1)
+    return -errno;
+
+  rd = read(fd, buf, 50);
+  if (rd == -1)
+    {
+      sys_errmsg("cannot read \"%s\"", file);
+      ret = -errno;
+      goto out_error;
+    }
+  if (rd == 50)
+    {
+      errmsg("contents of \"%s\" is too long", file);
+      ret = -EINVAL;
+      goto out_error;
+    }
+  buf[rd] = '\0';
+
+  if (sscanf(buf, "%lld\n", value) != 1)
+    {
+      /* This must be a UBI bug */
+      errmsg("cannot read integer from \"%s\"", file);
+      ret = -EINVAL;
+      goto out_error;
+    }
+
+  if (*value < 0)
+    {
+      errmsg("negative value %lld in \"%s\"", *value, file);
+      ret = -EINVAL;
+      goto out_error;
+    }
+
+  if (close(fd))
+    {
+      sys_errmsg("close failed on \"%s\"", file);
+      return -errno;
+    }
+
+  return 0;
+
+out_error:
+  close(fd);
+  return ret;
+}
+
+static int
+read_positive_int(const char *file, int *value)
+{
+  long long res;
+  int ret = 0;
+
+  if ((ret = read_positive_ll(file, &res)) < 0)
+    return ret;
+
+  /* Make sure the value is not too big */
+  if (res > INT_MAX)
+    {
+      errmsg("value %lld read from file \"%s\" is out of range", res, file);
+      return -EINVAL;
+    }
+
+  *value = res;
+  return 0;
+}
+
+static int
+read_data(const char *file, void *buf, int buf_len)
+{
+  int fd, rd, tmp, tmp1;
+  int ret = 0;
+
+  fd = open(file, O_RDONLY);
+  if (fd == -1)
+    return -errno;
+
+  rd = read(fd, buf, buf_len);
+  if (rd == -1)
+    {
+      sys_errmsg("cannot read \"%s\"", file);
+      ret = -errno;
+      goto out_error;
+    }
+  ((char *)buf)[rd - 1] = '\0';
+  /* Make sure all data is read */
+  tmp1 = read(fd, &tmp, 1);
+  if (tmp1 == -1)
+    {
+      sys_errmsg("cannot read \"%s\"", file);
+      ret = -errno;
+      goto out_error;
+    }
+  if (tmp1)
+    {
+      errmsg("file \"%s\" contains too much data (> %d bytes)",
+	     file, buf_len);
+      ret = -EINVAL;
+      goto out_error;
+    }
+
+  if (close(fd))
+    {
+      sys_errmsg("close failed on \"%s\"", file);
+      return -errno;
+    }
+
+  return rd;
+
+out_error:
+  close(fd);
+  return ret;
+}
+
+static int
+read_cdev(const char *file, dev_t * pdev)
+{
+  int ret;
+  char buf[50];
+  int major, minor;
+
+  ret = read_data(file, buf, 50);
+  if (ret < 0)
+    return ret;
+
+  ret = sscanf(buf, "%d:%d\n", &major, &minor);
+  if (ret != 2)
+    {
+      errmsg("\"%s\" does not have major:minor format", file);
+      return -EINVAL;
+    }
+
+  if (major < 0 || minor < 0)
+    {
+      errmsg("bad major:minor %d:%d in \"%s\"", major, minor, file);
+      return -EINVAL;
+    }
+  *pdev = MKDEV(major, minor);
+  return 0;
+}
diff --git a/mkfs.ubifs/libubiio.h b/mkfs.ubifs/libubiio.h
new file mode 100644
index 0000000..da44d47
--- /dev/null
+++ b/mkfs.ubifs/libubiio.h
@@ -0,0 +1,47 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * ubi (unsorted block images) io library.
+ */
+
+#ifndef __LIBUBIIO_H__
+#define __LIBUBIIO_H__
+
+/* sys/types.h for dev_t */
+#include <sys/types.h>
+/* stdint.h for int32/64_t */
+#include <stdint.h>
+#include <mtd/ubi-user.h>
+
+#ifdef __cplusplus
+extern "C"
+{
+#endif
+
+/* UBI version libubiio is made for */
+#define LIBUBIIO_UBI_VERSION	1
+#define UBI_VOL_NAME_MAX	127
+
+#include "ubi.h"
+  int ubi_get_vol_id_by_name(int ubi_num, const char *name);
+
+#ifdef __cplusplus
+}
+#endif
+#endif				/* !__LIBUBIIO_H__ */
diff --git a/mkfs.ubifs/libubiio_int.h b/mkfs.ubifs/libubiio_int.h
new file mode 100644
index 0000000..8c94159
--- /dev/null
+++ b/mkfs.ubifs/libubiio_int.h
@@ -0,0 +1,187 @@
+/*
+ * Copyright (c) International Business Machines Corp., 2006
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Artem Bityutskiy
+ *
+ * UBI (Unsorted Block Images) IO library.
+ */
+
+#ifndef __LIBUBIIO_INT_H__
+#define __LIBUBIIO_INT_H__
+
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+
+#ifdef __cplusplus
+extern "C"
+{
+#endif
+
+#define MIN(a ,b) ((a) < (b) ? (a) : (b))
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+
+/* Verbose messages */
+#define verbose(verbose, fmt, ...) \
+  do {								   \
+    if (verbose)						   \
+      printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__);	   \
+  } while(0)
+
+/* Normal messages */
+#define normsg(fmt, ...)				   \
+	printf(PROGRAM_NAME ": " fmt "\n", ##__VA_ARGS__)
+
+#define normsg_cont(fmt, ...)				\
+	printf(PROGRAM_NAME ": " fmt, ##__VA_ARGS__)
+
+/* Error messages */
+#define errmsg(fmt, ...)						\
+	fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__)
+
+/* System error messages */
+#define sys_errmsg(fmt, ...)						\
+  do {									\
+    int _err = errno;                                                   \
+    size_t _i;								\
+    fprintf(stderr, PROGRAM_NAME ": error!: " fmt "\n", ##__VA_ARGS__); \
+    for (_i = 0; _i < sizeof(PROGRAM_NAME) + 1; _i++)                   \
+      fprintf(stderr, " ");						\
+    fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
+  } while (0)
+
+
+/* Warnings */
+#define warnmsg(fmt, ...)						\
+  fprintf(stderr, PROGRAM_NAME ": warning!: " fmt "\n", ##__VA_ARGS__)
+
+/* debug */
+#ifdef CONFIG_LIBUBIO_DEBUG
+#define dbgmsg(fmt, ...)						\
+  fprintf(stderr, PROGRAM_NAME ": debug!: " fmt "\n", ##__VA_ARGS__)
+#else
+#define dbgmsg(fmt, ...)	(void) fmt
+#endif
+
+/**
+ * struct ubi_volume_desc - UBI volume information.
+ * @fd: UBI volume file descriptor
+ * @mode: volume open mode (%UBI_READONLY, %UBI_READWRITE, %UBI_EXCLUSIVE)
+ * @vi: volume info structure
+ * @di: device info structure
+ */
+  struct ubi_volume_desc
+  {
+    int fd;
+    int mode;
+    struct ubi_volume_info vi;
+    struct ubi_device_info di;
+  };
+
+/*
+ * The below are pre-define UBI file and directory names.
+ *
+ * Note, older kernels put 'ubiX_Y' directories straight to '/sys/class/ubi/'.
+ * New kernels puts 'ubiX_Y' directories to '/sys/class/ubi/ubiX/', which is
+ * saner. And for compatibility reasons it also puts symlinks to 'ubiX_Y'
+ * directories to '/sys/class/ubi/'. For now libubi assumes old layout.
+ * TODO: use new layout ?
+ */
+
+#define SYSFS_UBI         "class/ubi"
+#define SYSFS_CTRL        "class/misc/ubi_ctrl"
+
+#define CTRL_DEV          "dev"
+
+#define UBI_VER           "version"
+#define UBI_VOL_COUNT     "volumes_count"
+#define UBI_DEV_NAME_PATT "ubi%d"
+
+#define DEV_DEV           "dev"
+#define DEV_AVAIL_EBS     "avail_eraseblocks"
+#define DEV_TOTAL_EBS     "total_eraseblocks"
+#define DEV_BAD_COUNT     "bad_peb_count"
+#define DEV_EB_SIZE       "eraseblock_size"
+#define DEV_MAX_EC        "max_ec"
+#define DEV_MAX_RSVD      "reserved_for_bad"
+#define DEV_MAX_VOLS      "max_vol_count"
+#define DEV_MIN_IO_SIZE   "min_io_size"
+#define DEV_MTD_NUM       "mtd_num"
+
+#define UBI_VOL_NAME_PATT "ubi%d_%d"
+#define VOL_TYPE          "type"
+#define VOL_DEV           "dev"
+#define VOL_ALIGNMENT     "alignment"
+#define VOL_DATA_BYTES    "data_bytes"
+#define VOL_RSVD_BYTES    "resvd_bytes"
+#define VOL_RSVD_EBS      "reserved_ebs"
+#define VOL_EB_SIZE       "usable_eb_size"
+#define VOL_CORRUPTED     "corrupted"
+#define VOL_UPD_MARKER    "upd_marker"
+#define VOL_CORRUPTED     "corrupted"
+#define VOL_NAME          "name"
+
+
+/**
+ * get_sys_dir_path - return the sys directory path
+ */
+static const char *get_sys_dir_path();
+/**
+ * read_positive_ll - read a positive 'long long' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function reads file @file and interprets its contents as a positive
+ * 'long long' integer. If this is not true, it fails with %EINVAL error code.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_positive_ll(const char *file, long long *value);
+/**
+ * read_positive_int - read a positive 'int' value from a file.
+ * @file: the file to read from
+ * @value: the result is stored here
+ *
+ * This function is the same as 'read_positive_ll()', but it reads an 'int'
+ * value, not 'long long'.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_positive_int(const char *file, int *value);
+/**
+ * read_data - read data from a file.
+ * @file: the file to read from
+ * @buf: the buffer to read to
+ * @buf_len: buffer length
+ *
+ * This function returns number of read bytes in case of success and %-1 in
+ * case of failure. Note, if the file contains more then @buf_len bytes of
+ * date, this function fails with %EINVAL error code.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+static int read_data(const char *file, void *buf, int buf_len);
+/**
+ * read_cdev - read major and minor numbers from a file.
+ * @file: name of the file to read from
+ * @pdev: device decription is returned here
+ *
+ * Returns %0 in case of succes, and %-1 in case of failure.
+ */
+static int read_cdev(const char *file, dev_t * pdev);
+
+#ifdef __cplusplus
+}
+#endif
+#endif				/* !__LIBUBIIO_INT_H__ */
-- 
1.6.2.5
