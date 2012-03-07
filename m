Received: from nm22-vm7.bullet.mail.ird.yahoo.com ([212.82.109.226])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Hcd-0000jD-Iw
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:13:44 +0000
Message-ID: <1331129621.17523.YahooMailClassic@web29004.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:13:41 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 5/6] mtd: maps: pcmciamtd: Add reference counter to set_vpp()
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
 in progress.=0AThis patch allows pcmciamtd_set_vpp() calls to be nested by=
 adding a reference=0Acounter.=0A=0ASigned-off-by: Paul Parsons <lost.dista=
nce@yahoo.com>=0A---=0Adiff -uprN clean-3.3-rc6/drivers/mtd/maps/pcmciamtd.=
c linux-3.3-rc6/drivers/mtd/maps/pcmciamtd.c=0A--- clean-3.3-rc6/drivers/mt=
d/maps/pcmciamtd.c=092012-03-04 01:08:09.000000000 +0000=0A+++ linux-3.3-rc=
6/drivers/mtd/maps/pcmciamtd.c=092012-03-06 16:38:29.795134347 +0000=0A@@ -=
295,13 +295,24 @@ static void pcmcia_copy_to(struct map_in=0A }=0A =0A =0A+=
static DEFINE_SPINLOCK(pcmcia_vpp_lock);=0A+static int pcmcia_vpp_refcnt;=
=0A static void pcmciamtd_set_vpp(struct map_info *map, int on)=0A {=0A =09=
struct pcmciamtd_dev *dev =3D (struct pcmciamtd_dev *)map->map_priv_1;=0A =
=09struct pcmcia_device *link =3D dev->p_dev;=0A+=09unsigned long flags;=0A=
 =0A =09pr_debug("dev =3D %p on =3D %d vpp =3D %d\n\n", dev, on, dev->vpp);=
=0A-=09pcmcia_fixup_vpp(link, on ? dev->vpp : 0);=0A+=09spin_lock_irqsave(&=
pcmcia_vpp_lock, flags);=0A+=09if (on) {=0A+=09=09if (++pcmcia_vpp_refcnt =
=3D=3D 1)   /* first nested 'on' */=0A+=09=09=09pcmcia_fixup_vpp(link, dev-=
>vpp);=0A+=09} else {=0A+=09=09if (--pcmcia_vpp_refcnt =3D=3D 0)   /* last =
nested 'off' */=0A+=09=09=09pcmcia_fixup_vpp(link, 0);=0A+=09}=0A+=09spin_u=
nlock_irqrestore(&pcmcia_vpp_lock, flags);=0A }=0A =0A =0A
