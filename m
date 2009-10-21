Received: from exprod6og108.obsmtp.com ([64.18.1.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0PhU-0006sW-90
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 01:09:20 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mtd: fix error path in physmap.c
Date: Tue, 20 Oct 2009 21:09:22 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E24920@mi8nycmail19.Mi8.com>
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

During the physmap probe, add_mtd_partitions() and add_mtd_device()
can both return an error.  Add an error path to handle this.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 3f13a96..966b25d 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -169,24 +169,28 @@ static int physmap_flash_probe(struct =
platform_device *dev)
 		goto err_out;
=20
 #ifdef CONFIG_MTD_PARTITIONS
-	err =3D parse_mtd_partitions(info->cmtd, part_probe_types,
-				&info->parts, 0);
-	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
-		info->nr_parts =3D err;
-		return 0;
+	info->nr_parts =3D parse_mtd_partitions(info->cmtd, part_probe_types,
+					      &info->parts, 0);
+	if (info->nr_parts > 0) {
+		err =3D add_mtd_partitions(info->cmtd, info->parts,
+					 info->nr_parts);
+		goto out;
 	}
=20
 	if (physmap_data->nr_parts) {
 		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
-		return 0;
+		err =3D add_mtd_partitions(info->cmtd, physmap_data->parts,
+					 physmap_data->nr_parts);
+		goto out;
 	}
 #endif
=20
-	add_mtd_device(info->cmtd);
-	return 0;
+	if (add_mtd_device(info->cmtd) =3D=3D 1)
+		err =3D -ENODEV;
+
+out:
+	if (!err)
+		return 0;
=20
 err_out:
 	physmap_flash_remove(dev);=20
