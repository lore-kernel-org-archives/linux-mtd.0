Received: from mail-bw0-f11.google.com ([209.85.218.11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOqah-00060p-Hv
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 09:38:46 +0000
Received: by bwz4 with SMTP id 4so331bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jan 2009 01:38:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
References: <200901071022.46343.corentincj@iksaif.net>
	<alpine.LFD.2.00.0901181441410.4913@casper.infradead.org>
	<71cd59b00901180924t4b61a22cw325b18789dd953b2@mail.gmail.com>
Date: Mon, 19 Jan 2009 10:38:42 +0100
Message-ID: <71cd59b00901190138n1e21a769lb6afc28b02c5fb75@mail.gmail.com>
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace v2
From: Corentin Chary <corentin.chary@gmail.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
Here is a draft (won't apply, won't compile).
Do you think this would be ok ?
Thanks

---
diff --cc drivers/mtd/ubi/cdev.c
index 9ddbade,f9631eb..0000000
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@@ -263,8 -259,8 +259,6 @@@ static ssize_t vol_cdev_read(struct fil
  	return err ? err : count_save - count;
  }

--#ifdef CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
--
  /*
   * This function allows to directly write to dynamic UBI volumes, without
   * issuing the volume update operation. Available only as a debugging feature.
@@@ -279,8 -275,7 +273,10 @@@ static ssize_t vol_cdev_direct_write(st
  	int lnum, off, len, tbuf_size, err = 0;
  	size_t count_save = count;
  	char *tbuf;
+
++	if (!vol->direct_ioctl)
++	  return -EPERM;
 +
  	dbg_gen("requested: write %zd bytes to offset %lld of volume %u",
  		count, *offp, vol->vol_id);

@@@ -347,10 -339,10 +340,6 @@@
  	return err ? err : count_save - count;
  }

--#else
--#define vol_cdev_direct_write(file, buf, count, offp) (-EPERM)
--#endif /* CONFIG_MTD_UBI_DEBUG_USERSPACE_IO */
--
  static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
  			      size_t count, loff_t *offp)
  {
@@@ -560,8 -551,7 +548,20 @@@ static long vol_cdev_ioctl(struct file
  		err = ubi_is_mapped(desc, lnum);
  		break;
  	}
- #endif
+
++	case UBI_IOVOLDIRIO:
++	{
++		int32_t directio;
++
++		err = get_user(directio, (__user int32_t *)argp);
++		if (err) {
++			err = -EFAULT;
++			break;
++		}
++		err = desc->vol->direct_ioctl = (directio > 0);
++		break;
++	}
 +
  	default:
  		err = -ENOTTY;
  		break;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 381f0e1..25a77eb 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -206,6 +206,7 @@ struct ubi_volume_desc;
  * @upd_marker: %1 if the update marker is set for this volume
  * @updating: %1 if the volume is being updated
  * @changing_leb: %1 if the atomic LEB change ioctl command is in progress
+ * @direct_ioctl: %1 if direct write operation are enabled for users
(via ioctl())
  *
  * @gluebi_desc: gluebi UBI volume descriptor
  * @gluebi_refcount: reference count of the gluebi MTD device
@@ -253,6 +254,7 @@ struct ubi_volume {
 	unsigned int upd_marker:1;
 	unsigned int updating:1;
 	unsigned int changing_leb:1;
+	unsigned int direct_ioctl:1;

 #ifdef CONFIG_MTD_UBI_GLUEBI
 	/*
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 82113e1..1fa7a28 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -175,6 +175,8 @@
 #define UBI_IOCEBUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
 /* Check if LEB is mapped command */
 #define UBI_IOCEBISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, int32_t)
+/* Set direct-io availability */
+#define UBI_IOVOLDIRIO _IOW(UBI_VOL_IOC_MAGIC, 6, int32_t)

 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
