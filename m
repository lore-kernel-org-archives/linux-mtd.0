Received: from nm9.bullet.mail.ird.yahoo.com ([77.238.189.35])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Hbn-0000QU-TT
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:12:52 +0000
Message-ID: <1331129570.47213.YahooMailClassic@web29016.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:12:50 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 4/6] mtd: maps: l440gx: Add reference counter to set_vpp()
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
 in progress.=0AThis patch allows l440gx_set_vpp() calls to be nested by ad=
ding a reference=0Acounter.=0A=0ASigned-off-by: Paul Parsons <lost.distance=
@yahoo.com>=0A---=0Adiff -uprN clean-3.3-rc6/drivers/mtd/maps/l440gx.c linu=
x-3.3-rc6/drivers/mtd/maps/l440gx.c=0A--- clean-3.3-rc6/drivers/mtd/maps/l4=
40gx.c=092012-03-04 01:08:09.000000000 +0000=0A+++ linux-3.3-rc6/drivers/mt=
d/maps/l440gx.c=092012-03-06 16:38:29.795134347 +0000=0A@@ -27,17 +27,21 @@=
 static struct mtd_info *mymtd;=0A =0A =0A /* Is this really the vpp port? =
*/=0A+static DEFINE_SPINLOCK(l440gx_vpp_lock);=0A+static int l440gx_vpp_ref=
cnt;=0A static void l440gx_set_vpp(struct map_info *map, int vpp)=0A {=0A-=
=09unsigned long l;=0A+=09unsigned long flags;=0A =0A-=09l =3D inl(VPP_PORT=
);=0A+=09spin_lock_irqsave(&l440gx_vpp_lock, flags);=0A =09if (vpp) {=0A-=
=09=09l |=3D 1;=0A+=09=09if (++l440gx_vpp_refcnt =3D=3D 1)   /* first neste=
d 'on' */=0A+=09=09=09outl(inl(VPP_PORT) | 1, VPP_PORT);=0A =09} else {=0A-=
=09=09l &=3D ~1;=0A+=09=09if (--l440gx_vpp_refcnt =3D=3D 0)   /* last neste=
d 'off' */=0A+=09=09=09outl(inl(VPP_PORT) & ~1, VPP_PORT);=0A =09}=0A-=09ou=
tl(l, VPP_PORT);=0A+=09spin_unlock_irqrestore(&l440gx_vpp_lock, flags);=0A =
}=0A =0A static struct map_info l440gx_map =3D {=0A
