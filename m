Received: from mail.tqs.de ([62.157.136.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OR36A-0002Ni-If
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 13:01:07 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH]] mtdconcat: fix bug with uninitialized lock and unlock
	functions
Date: Tue, 22 Jun 2010 15:00:19 +0200
Message-ID: <47F3F98010FF784EBEE6526EAAB078D10635E728@tq-mailsrv.tq-net.de>
From: "Martin Krause" <Martin.Krause@tqs.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Test if a lock or unlock function is present (pointer not NULL) before
calling it, to prevent a kernel dump.

Signed-off-by: Martin Krause <martin.krause@tqs.de>
---
 drivers/mtd/mtdconcat.c |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index db6de74..0a7ee03 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -541,10 +541,13 @@ static int concat_lock(struct mtd_info *mtd, =
loff_t ofs, uint64_t len)
 		else
 			size =3D len;
=20
-		err =3D subdev->lock(subdev, ofs, size);
+		if (subdev->lock) {
+			err =3D subdev->lock(subdev, ofs, size);
=20
-		if (err)
-			break;
+			if (err)
+				break;
+		} else
+			err =3D -EOPNOTSUPP;
=20
 		len -=3D size;
 		if (len =3D=3D 0)
@@ -579,10 +582,13 @@ static int concat_unlock(struct mtd_info *mtd, =
loff_t ofs, uint64_t len)
 		else
 			size =3D len;
=20
-		err =3D subdev->unlock(subdev, ofs, size);
+		if (subdev->unlock) {
+			err =3D subdev->unlock(subdev, ofs, size);
=20
-		if (err)
-			break;
+			if (err)
+				break;
+		} else
+			err =3D -EOPNOTSUPP;
=20
 		len -=3D size;
 		if (len =3D=3D 0)
--=20
1.6.6.1
