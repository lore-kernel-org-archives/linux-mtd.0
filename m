Received: from mail-fx0-f17.google.com ([209.85.220.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUrH-00042z-9h
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:37:52 +0000
Received: by fxm10 with SMTP id 10so1350974fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 01:37:50 -0800 (PST)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] UBI: unmap operation via ioctl
Date: Wed, 7 Jan 2009 10:27:14 +0100
References: <200901071022.46343.corentincj@iksaif.net>
In-Reply-To: <200901071022.46343.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200901071027.14992.corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom 4c15079a77b4a871fc96f2267222626a7e91b86a Mon Sep 17 00:00:00 2001
=46rom: Corentin Chary <corentincj@iksaif.net>
Date: Mon, 5 Jan 2009 14:46:19 +0100

[PATCH 2/3] UBI: unmap operation via ioctl

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
=2D--
 drivers/mtd/ubi/cdev.c |   12 ++++++++++++
 include/mtd/ubi-user.h |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index db47121..7a9080c 100644
=2D-- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -530,6 +530,18 @@ static int vol_cdev_ioctl(struct inode *inode, struct =
file *file,
 		err =3D ubi_leb_map(desc, req.lnum, req.dtype);
 		break;
 	}
+	case UBI_IOUNMAP:
+	{
+		int32_t lnum;
+
+		err =3D get_user(lnum, (__user int32_t *)argp);
+		if (err) {
+			err =3D -EFAULT;
+			break;
+		}
+		err =3D ubi_leb_unmap(desc, lnum);
+		break;
+	}
=20
 #endif
=20
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 8222f12..bcff3a0 100644
=2D-- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -135,7 +135,8 @@
 #define UBI_IOCEBCH _IOW(UBI_VOL_IOC_MAGIC, 2, int32_t)
 /* Map an eraseblock */
 #define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
=2D
+/* Unmap an eraseblock */
+#define UBI_IOUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
=20
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
=2D-=20
1.6.0.6


=2D-=20
=2D-
Corentin Chary
http://xf.iksaif.net
