From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 "Christian Riesch" <christian.riesch@omicron.at>
Subject: [PATCH V2] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Tue, 3 Jun 2014 15:57:00 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315D0FAE@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kees Cook <keescook@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The size of the buffer program has been increased from 256 to 512 ,
2ms maximum timeout can not adapt to all the different vendor's norflash,
There maximum timeout information in the CFI area,so the best way is to
choose the result calculated according to timeout field of struct cfi_ident
that probed from norflash's CFI aera.This is also a standard defined by CFI=
.

Without this change, if the size of buffer program is 512 or bigger than 25=
6,
due to timeout is the shorter than that the chip required,do_write_buffer
sometimes fails.

Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.

Signed-off-by: bean huo <beanhuo@micron.com>
---
changes v1->v2:Deleted unused parameters in this patch (word_write_time_max=
 and erase_time_max).
Using usecs_to_jiffies instead of msecs_to_jiffies for convert timeout valu=
e into jiffies.

 drivers/mtd/chips/cfi_cmdset_0002.c |   27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index e21fde9..22e0b93 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -628,10 +628,24 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map=
, int primary)
 		cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+		/*
+		 * We first calculate the timeout max according to timeout
+		 * field of struct cfi_ident that probed from chip's CFI
+		 * aera,If haven't probed this information,we will specify
+		 * a default value,and the time unit is us.
+		 */
+		if (cfi->cfiq->BufWriteTimeoutTyp &&
+			cfi->cfiq->BufWriteTimeoutMax){
+			cfi->chips[i].buffer_write_time_max =3D
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +
+					cfi->cfiq->BufWriteTimeoutMax);
+			} else {
+		/* specify maximum timeout for buffer program 2000us */
+				cfi->chips[i].buffer_write_time_max =3D 2000;
+				}
 		cfi->chips[i].ref_point_counter =3D 0;
 		init_waitqueue_head(&(cfi->chips[i].wq));
 	}
-
 	map->fldrv =3D &cfi_amdstd_chipdrv;
=20
 	return cfi_amdstd_setup(mtd);
@@ -1462,8 +1476,15 @@ static int __xipram do_write_buffer(struct map_info =
*map, struct flchip *chip,
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	unsigned long timeo =3D jiffies + HZ;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
+	/* The size of the buffer program has been increased from 256 to 512,
+	 * 2ms maximum timeout can not adapt to all the different vendor's
+	 * norflash.There maximum timeout information in the CFI area,so the
+	 * best way is to choose the result calculated according to timeout
+	 * field of struct cfi_ident that probed from norflash's CFI aera,see
+	 * comments in cfi_cmdset_0002().uWriteTimeout is used for timeout step,
+	 * it must be concerted into jiffies.
+	 */
+	unsigned long uWriteTimeout =3D usecs_to_jiffies(chip->buffer_write_time_=
max);
 	int ret =3D -EIO;
 	unsigned long cmd_adr;
 	int z, words;
--=20
1.7.9.5
