From: "Gupta, Pekon" <pekon@ti.com>
To: "Quadros, Roger" <rogerq@ti.com>, "tony@atomide.com" <tony@atomide.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Subject: RE: [RFC PATCH 09/10] mtd: nand: omap: Use GPMC APIs for accessing
 ECC/BCH engine
Date: Fri, 11 Jul 2014 07:56:54 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB01E1E@DBDE04.ent.ti.com>
References: <1404909450-11970-1-git-send-email-rogerq@ti.com>
 <1404909450-11970-10-git-send-email-rogerq@ti.com>
In-Reply-To: <1404909450-11970-10-git-send-email-rogerq@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "jg1.han@samsung.com" <jg1.han@samsung.com>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "javier@dowhile0.org" <javier@dowhile0.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Roger,

>From: Quadros, Roger
>Don't access the ECC/BCH engine registers directly as they belong
>to the GPMC controller's register space. Use the relevant
>GPMC APIs instead.
>
>Signed-off-by: Roger Quadros <rogerq@ti.com>
>---
> drivers/mtd/nand/omap2.c | 191 +++++++++++++++++++-----------------------=
-----
> 1 file changed, 76 insertions(+), 115 deletions(-)
>
>diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>index 420ef0b..6b0f953 100644
>--- a/drivers/mtd/nand/omap2.c
>+++ b/drivers/mtd/nand/omap2.c
>@@ -1123,71 +1088,67 @@ static int __maybe_unused omap_calculate_ecc_bch(s=
truct mtd_info
>*mtd,
> 		switch (info->ecc_opt) {
> 		case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
> 		case OMAP_ECC_BCH8_CODE_HW:
>-			bch_val1 =3D readl(gpmc_regs->gpmc_bch_result0[i]);
>-			bch_val2 =3D readl(gpmc_regs->gpmc_bch_result1[i]);
>-			bch_val3 =3D readl(gpmc_regs->gpmc_bch_result2[i]);
>-			bch_val4 =3D readl(gpmc_regs->gpmc_bch_result3[i]);
>-			*ecc_code++ =3D (bch_val4 & 0xFF);
>-			*ecc_code++ =3D ((bch_val3 >> 24) & 0xFF);
>-			*ecc_code++ =3D ((bch_val3 >> 16) & 0xFF);
>-			*ecc_code++ =3D ((bch_val3 >> 8) & 0xFF);
>-			*ecc_code++ =3D (bch_val3 & 0xFF);
>-			*ecc_code++ =3D ((bch_val2 >> 24) & 0xFF);
>-			*ecc_code++ =3D ((bch_val2 >> 16) & 0xFF);
>-			*ecc_code++ =3D ((bch_val2 >> 8) & 0xFF);
>-			*ecc_code++ =3D (bch_val2 & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 >> 24) & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 >> 16) & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 >> 8) & 0xFF);
>-			*ecc_code++ =3D (bch_val1 & 0xFF);
>+			omap_gpmc_ecc_get_bch_result(4, i, bch_val);
>+			*ecc_code++ =3D (bch_val[3] & 0xFF);
>+			*ecc_code++ =3D ((bch_val[2] >> 24) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[2] >> 16) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[2] >> 8) & 0xFF);
>+			*ecc_code++ =3D (bch_val[2] & 0xFF);
>+			*ecc_code++ =3D ((bch_val[1] >> 24) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[1] >> 16) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[1] >> 8) & 0xFF);
>+			*ecc_code++ =3D (bch_val[1] & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] >> 24) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] >> 16) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] >> 8) & 0xFF);
>+			*ecc_code++ =3D (bch_val[0] & 0xFF);
> 			break;
> 		case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
> 		case OMAP_ECC_BCH4_CODE_HW:
>-			bch_val1 =3D readl(gpmc_regs->gpmc_bch_result0[i]);
>-			bch_val2 =3D readl(gpmc_regs->gpmc_bch_result1[i]);
>-			*ecc_code++ =3D ((bch_val2 >> 12) & 0xFF);
>-			*ecc_code++ =3D ((bch_val2 >> 4) & 0xFF);
>-			*ecc_code++ =3D ((bch_val2 & 0xF) << 4) |
>-				((bch_val1 >> 28) & 0xF);
>-			*ecc_code++ =3D ((bch_val1 >> 20) & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 >> 12) & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 >> 4) & 0xFF);
>-			*ecc_code++ =3D ((bch_val1 & 0xF) << 4);
>+			omap_gpmc_ecc_get_bch_result(2, i, bch_val);
>+			*ecc_code++ =3D ((bch_val[1] >> 12) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[1] >> 4) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[1] & 0xF) << 4) |
>+				((bch_val[0] >> 28) & 0xF);
>+			*ecc_code++ =3D ((bch_val[0] >> 20) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] >> 12) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] >> 4) & 0xFF);
>+			*ecc_code++ =3D ((bch_val[0] & 0xF) << 4);
> 			break;
> 		case OMAP_ECC_BCH16_CODE_HW:
>-			val =3D readl(gpmc_regs->gpmc_bch_result6[i]);
>-			ecc_code[0]  =3D ((val >>  8) & 0xFF);
>-			ecc_code[1]  =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result5[i]);
>-			ecc_code[2]  =3D ((val >> 24) & 0xFF);
>-			ecc_code[3]  =3D ((val >> 16) & 0xFF);
>-			ecc_code[4]  =3D ((val >>  8) & 0xFF);
>-			ecc_code[5]  =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result4[i]);
>-			ecc_code[6]  =3D ((val >> 24) & 0xFF);
>-			ecc_code[7]  =3D ((val >> 16) & 0xFF);
>-			ecc_code[8]  =3D ((val >>  8) & 0xFF);
>-			ecc_code[9]  =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result3[i]);
>-			ecc_code[10] =3D ((val >> 24) & 0xFF);
>-			ecc_code[11] =3D ((val >> 16) & 0xFF);
>-			ecc_code[12] =3D ((val >>  8) & 0xFF);
>-			ecc_code[13] =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result2[i]);
>-			ecc_code[14] =3D ((val >> 24) & 0xFF);
>-			ecc_code[15] =3D ((val >> 16) & 0xFF);
>-			ecc_code[16] =3D ((val >>  8) & 0xFF);
>-			ecc_code[17] =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result1[i]);
>-			ecc_code[18] =3D ((val >> 24) & 0xFF);
>-			ecc_code[19] =3D ((val >> 16) & 0xFF);
>-			ecc_code[20] =3D ((val >>  8) & 0xFF);
>-			ecc_code[21] =3D ((val >>  0) & 0xFF);
>-			val =3D readl(gpmc_regs->gpmc_bch_result0[i]);
>-			ecc_code[22] =3D ((val >> 24) & 0xFF);
>-			ecc_code[23] =3D ((val >> 16) & 0xFF);
>-			ecc_code[24] =3D ((val >>  8) & 0xFF);
>-			ecc_code[25] =3D ((val >>  0) & 0xFF);
>+			omap_gpmc_ecc_get_bch_result(7, i, bch_val);
>+			ecc_code[0]  =3D ((bch_val[6] >>  8) & 0xFF);
>+			ecc_code[1]  =3D ((bch_val[6] >>  0) & 0xFF);
>+
>+			ecc_code[2]  =3D ((bch_val[5] >> 24) & 0xFF);
>+			ecc_code[3]  =3D ((bch_val[5] >> 16) & 0xFF);
>+			ecc_code[4]  =3D ((bch_val[5] >>  8) & 0xFF);
>+			ecc_code[5]  =3D ((bch_val[5] >>  0) & 0xFF);
>+
>+			ecc_code[6]  =3D ((bch_val[4] >> 24) & 0xFF);
>+			ecc_code[7]  =3D ((bch_val[4] >> 16) & 0xFF);
>+			ecc_code[8]  =3D ((bch_val[4] >>  8) & 0xFF);
>+			ecc_code[9]  =3D ((bch_val[4] >>  0) & 0xFF);
>+
>+			ecc_code[10] =3D ((bch_val[3] >> 24) & 0xFF);
>+			ecc_code[11] =3D ((bch_val[3] >> 16) & 0xFF);
>+			ecc_code[12] =3D ((bch_val[3] >>  8) & 0xFF);
>+			ecc_code[13] =3D ((bch_val[3] >>  0) & 0xFF);
>+
>+			ecc_code[14] =3D ((bch_val[2] >> 24) & 0xFF);
>+			ecc_code[15] =3D ((bch_val[2] >> 16) & 0xFF);
>+			ecc_code[16] =3D ((bch_val[2] >>  8) & 0xFF);
>+			ecc_code[17] =3D ((bch_val[2] >>  0) & 0xFF);
>+
>+			ecc_code[18] =3D ((bch_val[1] >> 24) & 0xFF);
>+			ecc_code[19] =3D ((bch_val[1] >> 16) & 0xFF);
>+			ecc_code[20] =3D ((bch_val[1] >>  8) & 0xFF);
>+			ecc_code[21] =3D ((bch_val[1] >>  0) & 0xFF);
>+
>+			ecc_code[22] =3D ((bch_val[0] >> 24) & 0xFF);
>+			ecc_code[23] =3D ((bch_val[0] >> 16) & 0xFF);
>+			ecc_code[24] =3D ((bch_val[0] >>  8) & 0xFF);
>+			ecc_code[25] =3D ((bch_val[0] >>  0) & 0xFF);
> 			break;
> 		default:
> 			return -EINVAL;
>--
>1.8.3.2

Again same feedback.
You won't need all these changes, if you move this function
completely into GPMC driver, leaving only the wrapper here
which make the GPMC function compatible to chip->ecc.calculate.

with regards, pekon
