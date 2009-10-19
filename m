Received: from exprod6ob117.obsmtp.com ([64.18.1.38] helo=psmtp.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mzw5J-0007rY-5z
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 17:31:58 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
Date: Mon, 19 Oct 2009 13:31:46 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
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
valid.

Fix this by exiting the remove function when info->cmtd =3D=3D NULL.

Also, cleanup the #ifdef CONFIG_MTD_PARTITIONS stuff by using
mtd_has_partitions().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 380648e..65f52d4 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -44,22 +44,23 @@ static int physmap_flash_remove(struct =
platform_device *dev)
 		return 0;
 	platform_set_drvdata(dev, NULL);
=20
+	if (info->cmtd =3D=3D NULL)
+		return 0;
+
 	physmap_data =3D dev->dev.platform_data;
=20
-	if (info->cmtd) {
-#ifdef CONFIG_MTD_PARTITIONS
-		if (info->nr_parts || physmap_data->nr_parts)
+	if (mtd_has_partitions()) {
+		if (info->nr_parts || physmap_data->nr_parts) {
 			del_mtd_partitions(info->cmtd);
-		else
+
+			if (info->nr_parts)
+				kfree(info->parts);
+		} else {
 			del_mtd_device(info->cmtd);
-#else
+		}
+	} else {
 		del_mtd_device(info->cmtd);
-#endif
 	}
-#ifdef CONFIG_MTD_PARTITIONS
-	if (info->nr_parts)
-		kfree(info->parts);
-#endif
=20
 #ifdef CONFIG_MTD_CONCAT
 	if (info->cmtd !=3D info->mtd[0])
@@ -169,22 +170,22 @@ static int physmap_flash_probe(struct =
platform_device *dev)
 	if (err)
 		goto err_out;
=20
-#ifdef CONFIG_MTD_PARTITIONS
-	err =3D parse_mtd_partitions(info->cmtd, part_probe_types,
-				&info->parts, 0);
-	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
-		info->nr_parts =3D err;
-		return 0;
-	}
+	if (mtd_has_partitions()) {
+		err =3D parse_mtd_partitions(info->cmtd, part_probe_types,
+					&info->parts, 0);
+		if (err > 0) {
+			add_mtd_partitions(info->cmtd, info->parts, err);
+			info->nr_parts =3D err;
+			return 0;
+		}
=20
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
-		return 0;
+		if (physmap_data->nr_parts) {
+			printk(KERN_NOTICE "Using physmap partition information\n");
+			add_mtd_partitions(info->cmtd, physmap_data->parts,
+					physmap_data->nr_parts);
+			return 0;
+		}
 	}
-#endif
=20
 	add_mtd_device(info->cmtd);
 	return 0;=20
