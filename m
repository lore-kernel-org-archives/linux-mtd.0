Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUmx-0001au-TW
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:33:24 +0000
Received: by fg-out-1718.google.com with SMTP id 13so957453fge.26
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 01:33:23 -0800 (PST)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] UBI: is_mapped operation via ioctl
Date: Wed, 7 Jan 2009 10:29:18 +0100
References: <200901071022.46343.corentincj@iksaif.net>
In-Reply-To: <200901071022.46343.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200901071029.18625.corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom dbccb9a0ed4d9b9b45cbad2d13432bad6e9ca886 Mon Sep 17 00:00:00 2001
=46rom: Corentin Chary <corentincj@iksaif.net>
Date: Mon, 5 Jan 2009 14:48:59 +0100

UBI: is_mapped operation via ioctl

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
=2D--
 drivers/mtd/ubi/cdev.c |   12 ++++++++++++
 include/mtd/ubi-user.h |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7a9080c..1bf21eb 100644
=2D-- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -542,6 +542,18 @@ static int vol_cdev_ioctl(struct inode *inode, struct =
file *file,
 		err =3D ubi_leb_unmap(desc, lnum);
 		break;
 	}
+	case UBI_IOISMAP:
+	{
+		int32_t lnum;
+
+		err =3D get_user(lnum, (__user int32_t *)argp);
+		if (err) {
+			err =3D -EFAULT;
+			break;
+		}
+		err =3D ubi_is_mapped(desc, lnum);
+		break;
+	}
=20
 #endif
=20
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index bcff3a0..a65c4ab 100644
=2D-- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -137,6 +137,8 @@
 #define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
 /* Unmap an eraseblock */
 #define UBI_IOUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
+/* Check whether an eraseblock is mapped */
+#define UBI_IOISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, int32_t)
=20
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
=2D-=20
1.6.0.6
