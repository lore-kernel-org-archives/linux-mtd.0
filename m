Received: from nm14.bullet.mail.ird.yahoo.com ([77.238.189.67])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S37RT-0000sv-Q8
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 14:57:19 +0000
Message-ID: <1330613834.5242.YahooMailClassic@web29010.mail.ird.yahoo.com>
Date: Thu, 1 Mar 2012 14:57:14 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF3A221559.E83A6FE6-ONC12579B3.0080422F-C12579B3.008197D4@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Wed, 29/2/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote=
:=0A> This looks like a erase resume problem, cfi driver issues a=0A> resum=
e command but the=0A> chip fails or is slow to respond. I remember someone =
having=0A> a similar problem=0A> some time ago. Don't think we got to botto=
m of it though,=0A> look for subject:=0A> =A0 Numonyx NOR and chip->mutex b=
ug?=0A=0AYes, that Numonyx NOR problem seems to be the same as mine.=0A=0A>=
 Try adding extra read status cmds around resume, check if=0A> SR.6 is clea=
red too.=0A=0AOK, I think I've made some progress here.=0A=0AThe status tra=
nsitions around the Erase Resume are as follows:=0A=0A[   58.702774] 108: P=
UTC: 0: status=3D0x00c000c0 // Before CMD(0xd0)=0A[   58.702792] 108: PUTC:=
 1: status=3D0x00400040 // After CMD(0xd0),CMD(0x70)=0A[   58.702808] 108: =
PUTC: 2: status=3D0x00000000 // + cfi_udelay(1)=0A=0ASo SR.7 transitions fr=
om 1 to 0 after CMD(0xd0), and some time later SR.6=0Atransitions from 1 to=
 0. So the effects of Erase Resume are not immediate.=0AThus it seemed a go=
od idea to wait for these bits to settle:=0A=0Adiff -upr clean-3.3-rc5/driv=
ers/mtd/chips/cfi_cmdset_0001.c linux-3.3-rc5/drivers/mtd/chips/cfi_cmdset_=
0001.c=0A--- clean-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c=092012-02-25=
 20:18:16.000000000 +0000=0A+++ linux-3.3-rc5/drivers/mtd/chips/cfi_cmdset_=
0001.c=092012-03-01 13:44:49.529371920 +0000=0A@@ -956,6 +956,7 @@ static i=
nt get_chip(struct map_info *map=0A static void put_chip(struct map_info *m=
ap, struct flchip *chip, unsigned long adr)=0A {=0A =09struct cfi_private *=
cfi =3D map->fldrv_priv;=0A+=09map_word status, status_40 =3D CMD(0x40), st=
atus_00 =3D CMD(0x00);=0A =0A =09if (chip->priv) {=0A =09=09struct flchip_s=
hared *shared =3D chip->priv;=0A@@ -1006,6 +1007,15 @@ static void put_chip=
(struct map_info *ma=0A =09=09map_write(map, CMD(0xd0), adr);=0A =09=09map_=
write(map, CMD(0x70), adr);=0A =09=09chip->oldstate =3D FL_READY;=0A+=09=09=
chip->state =3D FL_ERASE_RESUMING;=0A+=09=09for (;;) {=0A+=09=09=09status =
=3D map_read(map, adr);=0A+=09=09=09if (map_word_andequal(map, status, stat=
us_40, status_00))=0A+=09=09=09        break;=0A+=09=09=09mutex_unlock(&chi=
p->mutex);=0A+=09=09=09cfi_udelay(1);=0A+=09=09=09mutex_lock(&chip->mutex);=
=0A+=09=09}=0A =09=09chip->state =3D FL_ERASING;=0A =09=09break;=0A =0Adiff=
 -upr clean-3.3-rc5/include/linux/mtd/flashchip.h linux-3.3-rc5/include/lin=
ux/mtd/flashchip.h=0A--- clean-3.3-rc5/include/linux/mtd/flashchip.h=092012=
-02-25 20:18:16.000000000 +0000=0A+++ linux-3.3-rc5/include/linux/mtd/flash=
chip.h=092012-03-01 13:41:48.288232532 +0000=0A@@ -36,6 +36,7 @@ typedef en=
um {=0A =09FL_ERASING,=0A =09FL_ERASE_SUSPENDING,=0A =09FL_ERASE_SUSPENDED,=
=0A+=09FL_ERASE_RESUMING,=0A =09FL_WRITING,=0A =09FL_WRITING_TO_BUFFER,=0A =
=09FL_OTP_WRITE,=0A=0AThis patch adds a wait after Erase Resume, just like =
the existing one after=0AErase Suspend (but without the timeout). I added t=
he FL_ERASE_RESUMING=0Astate to perform the same function as the FL_ERASE_S=
USPENDING state: to=0Astop anyone else touching it.=0A=0AWhen I tried this =
patch in place of my previous one I found it too fixed=0Amy problem. That's=
 not a surprise because it does the same thing, it waits=0Afor SR.6 to clea=
r, but at an earlier point. Unlike my previous patch,=0Athis patch leaves S=
R.7 and SR.6 in a consistent state before put_chip()=0Areturns (and indeed =
before the call to wake_up(&chip->wq) at the bottom of=0Aput_chip()).=0A=0A=
What I don't know is why not waiting for SR.7 and SR.6 to settle after=0AEr=
ase Resume can then break UBI, in particular provoking the=0A"block erase e=
rror: (bad VPP)" messages I was seeing earlier.
