Received: from exprod6og101.obsmtp.com ([64.18.1.181])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0HUp-00084e-26
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 16:23:43 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
Date: Tue, 20 Oct 2009 12:23:33 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E24827@mi8nycmail19.Mi8.com>
In-Reply-To: <20091021.002941.41633716.anemo@mba.ocn.ne.jp>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
	<20091021.002941.41633716.anemo@mba.ocn.ne.jp>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During the probe for physmap platform flash devices there are a
number error exit conditions that all do a goto err_out which
then calls physmap_flash_remove().  In that function one of the
cleanup steps is:

#ifdef CONFIG_MTD_CONCAT
	if (info->cmtd !=3D info->mtd[0])
		mtd_concat_destroy(info->cmtd);
#endif

This test will succeed since info->cmtd =3D=3D NULL and info->mtd[0] is
valid, which then causes a NULL pointer dereference when =
mtd_concat_destroy()
is called.  Fix this by moving the mtd_concat_destroy() step into the
if (info->cmtd) condition.

Also, move the kfree(info->parts) cleanup to remove an #ifdef.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

---

V2 - As pointed out by Atsushi Nemoto, the map_destroy loop should not
     be skipped even when info->cmtd =3D=3D NULL.

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 380648e..3f13a96 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -48,23 +48,22 @@ static int physmap_flash_remove(struct =
platform_device *dev)
=20
 	if (info->cmtd) {
 #ifdef CONFIG_MTD_PARTITIONS
-		if (info->nr_parts || physmap_data->nr_parts)
+		if (info->nr_parts || physmap_data->nr_parts) {
 			del_mtd_partitions(info->cmtd);
-		else
+
+			if (info->nr_parts)
+				kfree(info->parts);
+		} else {
 			del_mtd_device(info->cmtd);
+		}
 #else
 		del_mtd_device(info->cmtd);
 #endif
-	}
-#ifdef CONFIG_MTD_PARTITIONS
-	if (info->nr_parts)
-		kfree(info->parts);
-#endif
-
 #ifdef CONFIG_MTD_CONCAT
-	if (info->cmtd !=3D info->mtd[0])
-		mtd_concat_destroy(info->cmtd);
+		if (info->cmtd !=3D info->mtd[0])
+			mtd_concat_destroy(info->cmtd);
 #endif
+	}
=20
 	for (i =3D 0; i < MAX_RESOURCES; i++) {
 		if (info->mtd[i] !=3D NULL)=20
