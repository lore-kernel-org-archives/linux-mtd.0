Received: from nm5-vm1.bullet.mail.ird.yahoo.com ([77.238.189.202])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S2P2H-0007A4-Md
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2012 15:32:18 +0000
Message-ID: <1330443135.75072.YahooMailClassic@web29019.mail.ird.yahoo.com>
Date: Tue, 28 Feb 2012 15:32:15 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If an Erase Suspend Command (0xb0) is issued while a Block Erase operation=
=0A(0x20, 0xd0) is in progress, Status Register bit 6 (SR.6) will be set to=
 1.=0AAfter an Erase Resume Command (0xd0) is issued, SR.6 will be set back=
 to 0.=0A=0AUnfortunately when inval_cache_and_wait_for_operation() is call=
ed to wait for=0Aa Block Erase operation to finish, it never checks that SR=
.6 =3D 0 before=0Areturning. Consequently it can (and does) return while a =
Block Erase operation=0Ais still suspended, resulting in random breakage.=
=0A=0AThis patch ensures that when inval_cache_and_wait_for_operation() is =
called to=0Await for a Block Erase operation to finish (chip->state =3D=3D =
FL_ERASING), it does=0Anot return until both SR.7 =3D 1 (as before) and SR.=
6 =3D 0.=0A=0ASigned-off-by: Paul Parsons <lost.distance@yahoo.com>=0A---=
=0A=0AI found this after switching my HP iPAQ hx4700 from using jffs2 to ub=
ifs. It=0Athen consistently reported "block erase error: (bad VPP)" errors.=
 Intriguingly,=0Athe bootloader never reporting erase or programming failur=
es; it turned out that=0Athe bootloader never issued Erase Suspend Commands=
.=0A=0AShould SR.6 =3D 0 also be checked after an Erase Suspend Command (0x=
b0) is issued?=0AThis should preclude an unnecessary (and perhaps unpredict=
able) subsequent Erase=0AResume Command (0xd0).=0A=0A--- clean-3.3-rc5/driv=
ers/mtd/chips/cfi_cmdset_0001.c=092012-02-25 20:18:16.000000000 +0000=0A+++=
 linux-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c=092012-02-28 03:13:30.52=
1537614 +0000=0A@@ -1211,6 +1211,7 @@ static int inval_cache_and_wait_for_o=
per=0A {=0A =09struct cfi_private *cfi =3D map->fldrv_priv;=0A =09map_word =
status, status_OK =3D CMD(0x80);=0A+=09map_word status_76 =3D (chip->state =
=3D=3D FL_ERASING) ? CMD(0xc0) : CMD(0x80);=0A =09int chip_state =3D chip->=
state;=0A =09unsigned int timeo, sleep_time, reset_timeo;=0A =0A@@ -1239,7 =
+1240,7 @@ static int inval_cache_and_wait_for_oper=0A =09=09}=0A =0A =09=
=09status =3D map_read(map, cmd_adr);=0A-=09=09if (map_word_andequal(map, s=
tatus, status_OK, status_OK))=0A+=09=09if (map_word_andequal(map, status, s=
tatus_76, status_OK))=0A =09=09=09break;=0A =0A =09=09if (chip->erase_suspe=
nded && chip_state =3D=3D FL_ERASING)  {=0A
