Received: from nm16-vm0.bullet.mail.ird.yahoo.com ([77.238.189.192])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5HaH-00006i-Ut
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:11:19 +0000
Message-ID: <1331129476.90478.YahooMailClassic@web29011.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:11:16 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 2/6] mtd: chips: cfi_cmdset_0002: Match
 ENABLE_VPP()/DISABLE_VPP() calls
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
 in progress.=0AThis patch ensures that only those flash operations which c=
all ENABLE_VPP() can=0Athen call DISABLE_VPP(). Other operations should nev=
er call DISABLE_VPP().=0A=0ASigned-off-by: Paul Parsons <lost.distance@yaho=
o.com>=0A---=0Adiff -uprN clean-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0002.c=
 linux-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0002.c=0A--- clean-3.3-rc6/driv=
ers/mtd/chips/cfi_cmdset_0002.c=092012-03-04 01:08:09.000000000 +0000=0A+++=
 linux-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0002.c=092012-03-06 16:38:29.78=
7134295 +0000=0A@@ -770,8 +770,6 @@ static void put_chip(struct map_info *m=
a=0A =0A =09case FL_READY:=0A =09case FL_STATUS:=0A-=09=09/* We should real=
ly make set_vpp() count, rather than doing this */=0A-=09=09DISABLE_VPP(map=
);=0A =09=09break;=0A =09default:=0A =09=09printk(KERN_ERR "MTD: put_chip()=
 called with oldstate %d!!\n", chip->oldstate);=0A@@ -1234,6 +1232,7 @@ sta=
tic int __xipram do_write_oneword(str=0A =09xip_enable(map, chip, adr);=0A =
 op_done:=0A =09chip->state =3D FL_READY;=0A+=09DISABLE_VPP(map);=0A =09put=
_chip(map, chip, adr);=0A =09mutex_unlock(&chip->mutex);=0A =0A@@ -1476,6 +=
1475,7 @@ static int __xipram do_write_buffer(stru=0A =09ret =3D -EIO;=0A  =
op_done:=0A =09chip->state =3D FL_READY;=0A+=09DISABLE_VPP(map);=0A =09put_=
chip(map, chip, adr);=0A =09mutex_unlock(&chip->mutex);=0A =0A@@ -1649,6 +1=
649,7 @@ static int __xipram do_erase_chip(struct=0A =0A =09chip->state =3D=
 FL_READY;=0A =09xip_enable(map, chip, adr);=0A+=09DISABLE_VPP(map);=0A =09=
put_chip(map, chip, adr);=0A =09mutex_unlock(&chip->mutex);=0A =0A@@ -1739,=
6 +1740,7 @@ static int __xipram do_erase_oneblock(st=0A =09}=0A =0A =09chi=
p->state =3D FL_READY;=0A+=09DISABLE_VPP(map);=0A =09put_chip(map, chip, ad=
r);=0A =09mutex_unlock(&chip->mutex);=0A =09return ret;=0A
