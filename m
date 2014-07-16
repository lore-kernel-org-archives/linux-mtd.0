Received: from blu004-omc3s11.hotmail.com ([65.55.116.86])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7JLL-0006OD-8M
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 07:09:36 +0000
Message-ID: <BLU185-W10713E955F9530C4D53490A6F70@phx.gbl>
From: Bean Huo <beanhuo@outlook.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: [PATCH v4] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 16 Jul 2014 07:09:13 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "b32955@freescale.com" <b32955@freescale.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jg1.han@samsung.com" <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "christian.riesch@omicron.at" <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some Norflashes=2Cthe size of the buffer program has been=0A=
increased from 256 bytes to 512 bytes=2C2ms maximum timeout can=0A=
not adapt to all the different vendor's norflash.There maximum=0A=
timeout information in the CFI area=2Cso the best way is to choose=0A=
the result calculated according to timeout field of struct cfi_ident=0A=
that probed from norflash's CFI aera.This is also a standard defined=0A=
by CFI.If haven't probed this information=2Cor smaller than 2000us=2Cthen=
=0A=
specify a defualt value 2000us.=0A=
=0A=
Tested with Micron JS28F512M29EWx and Micron MT28EW512ABA flash devices.=0A=
=0A=
Signed-off-by: bean huo <beanhuo@outlook.com>=0A=
---=0A=
changes=0A=
	v1->v2:Deleted unused parameters in this patch=A0=0A=
		(word_write_time_max and erase_time_max).Using usecs_to_jiffies=0A=
		instead of msecs_to_jiffies for convert timeout value into jiffies.=0A=
	v2->v3:Removed unnecessary messages form comments and deleted trailing whi=
tespace.=0A=
	V3->v4:If haven't probed timeout information=2Cor smaller than 2000us=2Csp=
ecify default=0A=
	 =A0 =A0 =A0 2000us.=0A=
=0A=
=A0drivers/mtd/chips/cfi_cmdset_0002.c | =A0 28 ++++++++++++++++++++++++++-=
-=0A=
=A01 file changed=2C 26 insertions(+)=2C 2 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c=0A=
index e21fde9..c248a8c 100644=0A=
--- a/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
@@ -628=2C6 +628=2C24 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *=
map=2C int primary)=0A=
=A0		cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWriteTimeoutTyp=3B=
=0A=
=A0		cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWriteTimeoutTyp=
=3B=0A=
=A0		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp=3B=0A=
+		/*=0A=
+		 * First calculate the timeout max according to timeout=0A=
+		 * field of struct cfi_ident that probed from chip's CFI=0A=
+		 * aera.If haven't probed this information=2Cor smaller than=0A=
+		 * 2000us=2Cwe will specify defualt value 2000us=2Cand the time=0A=
+		 * unit is us.=0A=
+		 */=0A=
+		if (cfi->cfiq->BufWriteTimeoutTyp &&=0A=
+			cfi->cfiq->BufWriteTimeoutMax){=0A=
+			cfi->chips[i].buffer_write_time_max =3D=0A=
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +=0A=
+					cfi->cfiq->BufWriteTimeoutMax)=3B=0A=
+			} else {=0A=
+				cfi->chips[i].buffer_write_time_max =3D 0=3B=0A=
+				}=0A=
+		cfi->chips[i].buffer_write_time_max =3D=0A=
+			((cfi->chips[i].buffer_write_time_max>=3D 2000)=0A=
+			 ? cfi->chips[i].buffer_write_time_max : 2000)=3B=0A=
=A0		cfi->chips[i].ref_point_counter =3D 0=3B=0A=
=A0		init_waitqueue_head(&(cfi->chips[i].wq))=3B=0A=
=A0	}=0A=
@@ -1462=2C8 +1480=2C14 @@ static int __xipram do_write_buffer(struct map_i=
nfo *map=2C struct flchip *chip=2C=0A=
=A0{=0A=
=A0	struct cfi_private *cfi =3D map->fldrv_priv=3B=0A=
=A0	unsigned long timeo =3D jiffies + HZ=3B=0A=
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */=0A=
-	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1=3B=0A=
+	/*=0A=
+	 * Use the result that calculated according to timeout field=0A=
+	 * of struct cfi_ident that probed from norflash's CFI aera.=0A=
+	 * See more comments in cfi_cmdset_0002().uWriteTimeout is=0A=
+	 * used for timeout step=2Cit must be concerted into jiffies.=0A=
+	 */=0A=
+	unsigned long uWriteTimeout =3D=0A=
+				usecs_to_jiffies(chip->buffer_write_time_max)=3B=0A=
=A0	int ret =3D -EIO=3B=0A=
=A0	unsigned long cmd_adr=3B=0A=
=A0	int z=2C words=3B=0A=
--=A0=0A=
1.7.9.5 		 	   		  =
