Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUqf-0003eS-2l
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:37:14 +0000
Received: by bwz5 with SMTP id 5so18292418bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 01:37:11 -0800 (PST)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] UBI: map operation via ioctl
Date: Wed, 7 Jan 2009 10:25:59 +0100
References: <200901071022.46343.corentincj@iksaif.net>
In-Reply-To: <200901071022.46343.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200901071025.59765.corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom bafefa6ed036173c65b7f51c6a4a4ce5004ad09f Mon Sep 17 00:00:00 2001
=46rom: Corentin Chary <corentincj@iksaif.net>
Date: Mon, 5 Jan 2009 14:44:11 +0100

UBI: map operation via ioctl

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
=2D--
 drivers/mtd/ubi/cdev.c |   13 +++++++++++++
 include/mtd/ubi-user.h |   16 ++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 98cf31e..db47121 100644
=2D-- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -518,6 +518,19 @@ static int vol_cdev_ioctl(struct inode *inode, struct =
file *file,
 		err =3D ubi_wl_flush(ubi);
 		break;
 	}
+	case UBI_IOMAP:
+	{
+		struct ubi_map_req req;
+		err =3D copy_from_user(&req, argp,
+				sizeof(struct ubi_map_req));
+		if (err) {
+			err =3D -EFAULT;
+			break;
+		}
+		err =3D ubi_leb_map(desc, req.lnum, req.dtype);
+		break;
+	}
+
 #endif
=20
 	default:
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index ccdc562..8222f12 100644
=2D-- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -133,6 +133,9 @@
 #define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, int32_t)
 /* An atomic eraseblock change command */
 #define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, int32_t)
+/* Map an eraseblock */
+#define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
+
=20
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -319,4 +322,17 @@ struct ubi_leb_change_req {
 	int8_t  padding[7];
 } __attribute__ ((packed));
=20
+/**
+ * struct ubi_map_req - a data structure used in map
+ *                      eraseblock requests.
+ * @lnum: logical eraseblock number to change
+ * @dtype: data type (%UBI_LONGTERM, %UBI_SHORTTERM, %UBI_UNKNOWN)
+ * @padding: reserved for future, not used, has to be zeroed
+ */
+struct ubi_map_req {
+	int32_t lnum;
+	int8_t  dtype;
+	int8_t  padding[3];
+} __attribute__ ((packed));
+
 #endif /* __UBI_USER_H__ */
=2D-=20
1.6.0.6
