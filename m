Received: from service87.mimecast.com ([94.185.240.25])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QMK2s-0007Ef-NF
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 13:10:43 +0000
From: Marc Zyngier <marc.zyngier@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
Date: Tue, 17 May 2011 14:11:10 +0100
Message-Id: <1305637877-24436-2-git-send-email-marc.zyngier@arm.com>
In-Reply-To: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the process of moving platforms away from integrator-flash
(aka armflash), add to physmap the few features that make
armflash unique:

- optionnal probing for the AFS partition type
- init() and exit() methods, used by Integrator to control
  write access to the various onboard programmable components

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 drivers/mtd/maps/physmap.c  |   16 +++++++++++++++-
 include/linux/mtd/physmap.h |    2 ++
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 7522df4..49676b7 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -67,6 +67,10 @@ static int physmap_flash_remove(struct platform_device *=
dev)
 =09=09if (info->mtd[i] !=3D NULL)
 =09=09=09map_destroy(info->mtd[i]);
 =09}
+
+=09if (physmap_data->exit)
+=09=09physmap_data->exit(dev);
+
 =09return 0;
 }
=20
@@ -77,7 +81,11 @@ static const char *rom_probe_types[] =3D {
 =09=09=09=09=09"map_rom",
 =09=09=09=09=09NULL };
 #ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", NULL=
 };
+static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot",
+#ifdef CONFIG_MTD_AFS_PARTS
+=09=09=09=09=09  "afs",
+#endif
+=09=09=09=09=09  NULL };
 #endif
=20
 static int physmap_flash_probe(struct platform_device *dev)
@@ -100,6 +108,12 @@ static int physmap_flash_probe(struct platform_device =
*dev)
 =09=09goto err_out;
 =09}
=20
+=09if (physmap_data->init) {
+=09=09err =3D physmap_data->init(dev);
+=09=09if (err)
+=09=09=09goto err_out;
+=09}
+
 =09platform_set_drvdata(dev, info);
=20
 =09for (i =3D 0; i < dev->num_resources; i++) {
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index bcfd9f7..d37cca0 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -22,6 +22,8 @@ struct map_info;
=20
 struct physmap_flash_data {
 =09unsigned int=09=09width;
+=09int=09=09=09(*init)(struct platform_device *);
+=09void=09=09=09(*exit)(struct platform_device *);
 =09void=09=09=09(*set_vpp)(struct map_info *, int);
 =09unsigned int=09=09nr_parts;
 =09unsigned int=09=09pfow_base;
--=20
1.7.0.4
