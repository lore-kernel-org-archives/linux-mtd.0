Received: from nm8.bullet.mail.ird.yahoo.com ([77.238.189.23])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5HdQ-00010S-PP
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:14:33 +0000
Message-ID: <1331129671.42251.YahooMailClassic@web29005.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:14:31 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 6/6] mtd: maps: sa1100-flash: Add reference counter to
 set_vpp()
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
 in progress.=0AThis patch allows sa1100_set_vpp() calls to be nested by ad=
ding a reference=0Acounter.=0A=0ASigned-off-by: Paul Parsons <lost.distance=
@yahoo.com>=0A---=0Adiff -uprN clean-3.3-rc6/drivers/mtd/maps/sa1100-flash.=
c linux-3.3-rc6/drivers/mtd/maps/sa1100-flash.c=0A--- clean-3.3-rc6/drivers=
/mtd/maps/sa1100-flash.c=092012-03-04 01:08:09.000000000 +0000=0A+++ linux-=
3.3-rc6/drivers/mtd/maps/sa1100-flash.c=092012-03-06 16:38:29.795134347 +00=
00=0A@@ -136,10 +136,22 @@ struct sa_info {=0A =09struct sa_subdev_info=09s=
ubdev[0];=0A };=0A =0A+static DEFINE_SPINLOCK(sa1100_vpp_lock);=0A+static i=
nt sa1100_vpp_refcnt;=0A static void sa1100_set_vpp(struct map_info *map, i=
nt on)=0A {=0A =09struct sa_subdev_info *subdev =3D container_of(map, struc=
t sa_subdev_info, map);=0A-=09subdev->plat->set_vpp(on);=0A+=09unsigned lon=
g flags;=0A+=0A+=09spin_lock_irqsave(&sa1100_vpp_lock, flags);=0A+=09if (on=
) {=0A+=09=09if (++sa1100_vpp_refcnt =3D=3D 1)   /* first nested 'on' */=0A=
+=09=09=09subdev->plat->set_vpp(1);=0A+=09} else {=0A+=09=09if (--sa1100_vp=
p_refcnt =3D=3D 0)   /* last nested 'off' */=0A+=09=09=09subdev->plat->set_=
vpp(0);=0A+=09}=0A+=09spin_unlock_irqrestore(&sa1100_vpp_lock, flags);=0A }=
=0A =0A static void sa1100_destroy_subdev(struct sa_subdev_info *subdev)=0A
