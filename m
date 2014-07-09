Received: from blu004-omc3s2.hotmail.com ([65.55.116.77])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4gFy-0006PN-EZ
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 01:01:11 +0000
Message-ID: <BLU185-W2144FD57B7B7D8B8C90EB4A60F0@phx.gbl>
From: bean huo <beanhuo@outlook.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "paul.gortmaker@windriver.com"
 <paul.gortmaker@windriver.com>
Subject: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 9 Jul 2014 01:00:48 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The size of the buffer program has been increased from 256 to 512 =2C 2ms m=
aximum timeout for do_write_buffer can not adapt to all the different vendo=
r's norflash.There maximum timeout information in the CFI area=2Cso the bes=
t way is to choose the result calculated according to timeout field of stru=
ct cfi_ident that probed from norflash's CFI aera.This is also a standard d=
efined by CFI.=0A=
=A0=0A=
Without this change=2C if the size of buffer program is 512 or bigger than =
256=2C due to timeout is the shorter than that the chip required=2Cdo_write=
_buffer sometimes fails.=0A=
=A0=0A=
Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.=0A=
=A0=0A=
Signed-off-by: bean huo <beanhuo@outlook.com>=0A=
---=0A=
changes=0A=
=A0=A0=A0=A0 v1->v2:Deleted unused parameters in this patch (word_write_tim=
e_max and erase_time_max).=0A=
Using usecs_to_jiffies instead of msecs_to_jiffies for convert timeout valu=
e into jiffies.=0A=
=A0=A0=A0=A0=A0 v2->v3:Removed unnecessary messages form comments and delet=
ed trailing whitespace.=0A=
=A0=0A=
=A0drivers/mtd/chips/cfi_cmdset_0002.c |=A0=A0 27 ++++++++++++++++++++++++-=
--=0A=
=A01 file changed=2C 24 insertions(+)=2C 3 deletions(-)=0A=
=A0=0A=
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c=0A=
index e21fde9..f7098d6 100644=0A=
--- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
@@ -628=2C10 +628=2C24 @@ struct mtd_info *cfi_cmdset_0002(struct map_info =
*map=2C int primary)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->chips[i].word_write_time =3D 1<<cfi-=
>cfiq->WordWriteTimeoutTyp=3B=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->chips[i].buffer_write_time =3D 1<<cf=
i->cfiq->BufWriteTimeoutTyp=3B=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->chips[i].erase_time =3D 1<<cfi->cfiq=
->BlockEraseTimeoutTyp=3B=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * We first calculate the timeout max accord=
ing to timeout=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * field of struct cfi_ident that probed fro=
m chip's CFI=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * aera=2CIf haven't probed this information=
=2Cwe will specify=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * a default value=2Cand the time unit is us=
.=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cfi->cfiq->BufWriteTimeoutTyp &&=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->cfiq->BufWriteTimeou=
tMax){=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->chips[i].buffer_writ=
e_time_max =3D=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1<<(cfi=
->cfiq->BufWriteTimeoutTyp +=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 cfi->cfiq->BufWriteTimeoutMax)=3B=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* specify maximum timeou=
t for buffer program 2000us */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->ch=
ips[i].buffer_write_time_max =3D 2000=3B=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cfi->chips[i].ref_point_counter =3D 0=3B=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 init_waitqueue_head(&(cfi->chips[i].wq))=
=3B=0A=
=A0=A0=A0=A0=A0 }=0A=
-=0A=
=A0=A0=A0=A0=A0 map->fldrv =3D &cfi_amdstd_chipdrv=3B=0A=
=A0=0A=
=A0=A0=A0=A0=A0 return cfi_amdstd_setup(mtd)=3B=0A=
@@ -1462=2C8 +1476=2C15 @@ static int __xipram do_write_buffer(struct map_i=
nfo *map=2C struct flchip *chip=2C=A0 {=0A=
=A0=A0=A0=A0=A0 struct cfi_private *cfi =3D map->fldrv_priv=3B=0A=
=A0=A0=A0=A0=A0 unsigned long timeo =3D jiffies + HZ=3B=0A=
-=A0=A0=A0=A0 /* see comments in do_write_oneword() regarding uWriteTimeo. =
*/=0A=
-=A0=A0=A0=A0 unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1=3B=0A=
+=A0=A0=A0=A0 /* There maximum timeout information in the CFI area=2Cso the=
=0A=
+=A0=A0=A0=A0 * best way is to choose the result calculated according to=0A=
+=A0=A0=A0=A0 * timeout field of struct cfi_ident that probed from=0A=
+=A0=A0=A0=A0 * norflash's CFI aera=2Csee comments in cfi_cmdset_0002().=0A=
+=A0=A0=A0=A0 * uWriteTimeout is used for timeout step=2Cit must be concert=
ed=0A=
+=A0=A0=A0=A0 * into jiffies.=0A=
+=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0 unsigned long uWriteTimeout =3D=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 usecs_t=
o_jiffies(chip->buffer_write_time_max)=3B=0A=
=A0=A0=A0=A0=A0 int ret =3D -EIO=3B=0A=
=A0=A0=A0=A0=A0 unsigned long cmd_adr=3B=0A=
=A0=A0=A0=A0=A0 int z=2C words=3B=0A=
--=0A=
1.7.9.5 		 	   		  =
