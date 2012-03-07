Received: from nm8.bullet.mail.ird.yahoo.com ([77.238.189.23])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Hb8-0000DP-Nf
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:12:11 +0000
Message-ID: <1331129528.38705.YahooMailClassic@web29009.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:12:08 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 3/6] mtd: maps: physmap: Add reference counter to set_vpp()
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, joakim.tjernlund@transmode.se, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is part of a set which fixes unnecessary flash erase and write e=
rrors=0Aresulting from the MTD CFI driver turning off vpp while an erase is=
 in progress.=0AThis patch allows physmap_set_vpp() calls to be nested by a=
dding a reference=0Acounter.=0A=0Aomap1_set_vpp() already used a reference =
counter. Since it is called from=0Aphysmap_set_vpp(), omap1_set_vpp() can n=
ow be simplified.=0A=0Asimtec_nor_vpp() already disabled hard interrupts. S=
ince it is called from=0Aphysmap_set_vpp(), simtec_nor_vpp() can now be sim=
plified.=0A=0ASigned-off-by: Paul Parsons <lost.distance@yahoo.com>=0A---=
=0Adiff -uprN clean-3.3-rc6/arch/arm/mach-omap1/flash.c linux-3.3-rc6/arch/=
arm/mach-omap1/flash.c=0A--- clean-3.3-rc6/arch/arm/mach-omap1/flash.c=0920=
12-03-04 01:08:09.000000000 +0000=0A+++ linux-3.3-rc6/arch/arm/mach-omap1/f=
lash.c=092012-03-06 16:38:29.787134295 +0000=0A@@ -15,20 +15,12 @@=0A =0A v=
oid omap1_set_vpp(struct platform_device *pdev, int enable)=0A {=0A-=09stat=
ic int count;=0A =09u32 l;=0A =0A-=09if (enable) {=0A-=09=09if (count++ =3D=
=3D 0) {=0A-=09=09=09l =3D omap_readl(EMIFS_CONFIG);=0A-=09=09=09l |=3D OMA=
P_EMIFS_CONFIG_WP;=0A-=09=09=09omap_writel(l, EMIFS_CONFIG);=0A-=09=09}=0A-=
=09} else {=0A-=09=09if (count && (--count =3D=3D 0)) {=0A-=09=09=09l =3D o=
map_readl(EMIFS_CONFIG);=0A-=09=09=09l &=3D ~OMAP_EMIFS_CONFIG_WP;=0A-=09=
=09=09omap_writel(l, EMIFS_CONFIG);=0A-=09=09}=0A-=09}=0A+=09l =3D omap_rea=
dl(EMIFS_CONFIG);=0A+=09if (enable)=0A+=09=09l |=3D OMAP_EMIFS_CONFIG_WP;=
=0A+=09else=0A+=09=09l &=3D ~OMAP_EMIFS_CONFIG_WP;=0A+=09omap_writel(l, EMI=
FS_CONFIG);=0A }=0Adiff -uprN clean-3.3-rc6/arch/arm/mach-s3c2410/nor-simte=
c.c linux-3.3-rc6/arch/arm/mach-s3c2410/nor-simtec.c=0A--- clean-3.3-rc6/ar=
ch/arm/mach-s3c2410/nor-simtec.c=092012-03-04 01:08:09.000000000 +0000=0A++=
+ linux-3.3-rc6/arch/arm/mach-s3c2410/nor-simtec.c=092012-03-06 16:38:29.78=
7134295 +0000=0A@@ -35,9 +35,7 @@=0A static void simtec_nor_vpp(struct plat=
form_device *pdev, int vpp)=0A {=0A =09unsigned int val;=0A-=09unsigned lon=
g flags;=0A =0A-=09local_irq_save(flags);=0A =09val =3D __raw_readb(BAST_VA=
_CTRL3);=0A =0A =09printk(KERN_DEBUG "%s(%d)\n", __func__, vpp);=0A@@ -48,7=
 +46,6 @@ static void simtec_nor_vpp(struct platfo=0A =09=09val &=3D ~BAST_=
CPLD_CTRL3_ROMWEN;=0A =0A =09__raw_writeb(val, BAST_VA_CTRL3);=0A-=09local_=
irq_restore(flags);=0A }=0A =0A static struct physmap_flash_data simtec_nor=
_pdata =3D {=0Adiff -uprN clean-3.3-rc6/drivers/mtd/maps/physmap.c linux-3.=
3-rc6/drivers/mtd/maps/physmap.c=0A--- clean-3.3-rc6/drivers/mtd/maps/physm=
ap.c=092012-03-04 01:08:09.000000000 +0000=0A+++ linux-3.3-rc6/drivers/mtd/=
maps/physmap.c=092012-03-06 16:38:29.795134347 +0000=0A@@ -27,6 +27,8 @@ st=
ruct physmap_flash_info {=0A =09struct mtd_info=09=09*mtd[MAX_RESOURCES];=
=0A =09struct mtd_info=09=09*cmtd;=0A =09struct map_info=09=09map[MAX_RESOU=
RCES];=0A+=09spinlock_t=09=09vpp_lock;=0A+=09int=09=09=09vpp_refcnt;=0A };=
=0A =0A static int physmap_flash_remove(struct platform_device *dev)=0A@@ -=
63,12 +65,26 @@ static void physmap_set_vpp(struct map_i=0A {=0A =09struct =
platform_device *pdev;=0A =09struct physmap_flash_data *physmap_data;=0A+=
=09struct physmap_flash_info *info;=0A+=09unsigned long flags;=0A =0A =09pd=
ev =3D (struct platform_device *)map->map_priv_1;=0A =09physmap_data =3D pd=
ev->dev.platform_data;=0A =0A-=09if (physmap_data->set_vpp)=0A-=09=09physma=
p_data->set_vpp(pdev, state);=0A+=09if (!physmap_data->set_vpp)=0A+=09=09re=
turn;=0A+=0A+=09info =3D platform_get_drvdata(pdev);=0A+=0A+=09spin_lock_ir=
qsave(&info->vpp_lock, flags);=0A+=09if (state) {=0A+=09=09if (++info->vpp_=
refcnt =3D=3D 1)    /* first nested 'on' */=0A+=09=09=09physmap_data->set_v=
pp(pdev, 1);=0A+=09} else {=0A+=09=09if (--info->vpp_refcnt =3D=3D 0)    /*=
 last nested 'off' */=0A+=09=09=09physmap_data->set_vpp(pdev, 0);=0A+=09}=
=0A+=09spin_unlock_irqrestore(&info->vpp_lock, flags);=0A }=0A =0A static c=
onst char *rom_probe_types[] =3D {=0A@@ -172,6 +188,8 @@ static int physmap=
_flash_probe(struct pl=0A =09if (err)=0A =09=09goto err_out;=0A =0A+=09spin=
_lock_init(&info->vpp_lock);=0A+=0A =09part_types =3D physmap_data->part_pr=
obe_types ? : part_probe_types;=0A =0A =09mtd_device_parse_register(info->c=
mtd, part_types, 0,=0A
