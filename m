Received: from nm13.bullet.mail.ird.yahoo.com ([77.238.189.66])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5HZb-0008SH-15
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:10:36 +0000
Message-ID: <1331129433.70688.YahooMailClassic@web29017.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 14:10:33 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 1/6] mtd: chips: cfi_cmdset_0001: Match
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
o.com>=0A---=0Adiff -uprN clean-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0001.c=
 linux-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0001.c=0A--- clean-3.3-rc6/driv=
ers/mtd/chips/cfi_cmdset_0001.c=092012-03-04 01:08:09.000000000 +0000=0A+++=
 linux-3.3-rc6/drivers/mtd/chips/cfi_cmdset_0001.c=092012-03-06 16:38:29.78=
7134295 +0000=0A@@ -1017,8 +1017,6 @@ static void put_chip(struct map_info =
*ma=0A =09case FL_READY:=0A =09case FL_STATUS:=0A =09case FL_JEDEC_QUERY:=
=0A-=09=09/* We should really make set_vpp() count, rather than doing this =
*/=0A-=09=09DISABLE_VPP(map);=0A =09=09break;=0A =09default:=0A =09=09print=
k(KERN_ERR "%s: put_chip() called with oldstate %d!!\n", map->name, chip->o=
ldstate);=0A@@ -1551,7 +1549,8 @@ static int __xipram do_write_oneword(str=
=0A =09}=0A =0A =09xip_enable(map, chip, adr);=0A- out:=09put_chip(map, chi=
p, adr);=0A+ out:=09DISABLE_VPP(map);=0A+=09put_chip(map, chip, adr);=0A =
=09mutex_unlock(&chip->mutex);=0A =09return ret;=0A }=0A@@ -1794,7 +1793,8 =
@@ static int __xipram do_write_buffer(stru=0A =09}=0A =0A =09xip_enable(ma=
p, chip, cmd_adr);=0A- out:=09put_chip(map, chip, cmd_adr);=0A+ out:=09DISA=
BLE_VPP(map);=0A+=09put_chip(map, chip, cmd_adr);=0A =09mutex_unlock(&chip-=
>mutex);=0A =09return ret;=0A }=0A@@ -1932,6 +1932,7 @@ static int __xipram=
 do_erase_oneblock(st=0A =09=09=09ret =3D -EIO;=0A =09=09} else if (chipsta=
tus & 0x20 && retries--) {=0A =09=09=09printk(KERN_DEBUG "block erase faile=
d at 0x%08lx: status 0x%lx. Retrying...\n", adr, chipstatus);=0A+=09=09=09D=
ISABLE_VPP(map);=0A =09=09=09put_chip(map, chip, adr);=0A =09=09=09mutex_un=
lock(&chip->mutex);=0A =09=09=09goto retry;=0A@@ -1944,7 +1945,8 @@ static =
int __xipram do_erase_oneblock(st=0A =09}=0A =0A =09xip_enable(map, chip, a=
dr);=0A- out:=09put_chip(map, chip, adr);=0A+ out:=09DISABLE_VPP(map);=0A+=
=09put_chip(map, chip, adr);=0A =09mutex_unlock(&chip->mutex);=0A =09return=
 ret;=0A }=0A@@ -2086,7 +2088,8 @@ static int __xipram do_xxlock_oneblock(s=
=0A =09}=0A =0A =09xip_enable(map, chip, adr);=0A-out:=09put_chip(map, chip=
, adr);=0A+ out:=09DISABLE_VPP(map);=0A+=09put_chip(map, chip, adr);=0A =09=
mutex_unlock(&chip->mutex);=0A =09return ret;=0A }=0A
