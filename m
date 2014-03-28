Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTPey-0001p1-UR
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 05:48:58 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>
Subject: RE: [RFC] mtd: nand: Preparatory patch for adding on-die ECC
 controller support. This patch adds NAND_ECC_HW_ON_DIE and all other changes
 to generic code.
Date: Fri, 28 Mar 2014 05:48:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
References: <1395975504-11301-1-git-send-email-davidm@egauge.net>
In-Reply-To: <1395975504-11301-1-git-send-email-davidm@egauge.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "gsi@denx.de" <gsi@denx.de>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>From: David Mosberger
>Pekon,
>
>Before I go any further with this, could you confirm that what is
>below is what you had in mind as far as the generic portion of the
>patch is concerned.  If so, I'll go ahead and create the second,
>Micron-specific part next.
>
>Thanks,
>
>  --david
>
>PS: This patch adds a one-liner to of_mtd.c that I forgot about previously=
.
>
>Signed-off-by: David Mosberger <davidm@egauge.net>
>---
> drivers/mtd/nand/nand_base.c |   36 +++++++++++++++++++++++++++++++++---
> drivers/of/of_mtd.c          |    1 +
> include/linux/mtd/nand.h     |    7 +++++++
> 3 files changed, 41 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 5826da3..b94e2e9 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -3783,22 +3783,46 @@ EXPORT_SYMBOL(nand_scan_ident);
> int nand_scan_tail(struct mtd_info *mtd)
> {
> 	int i;
>+	u8 features[ONFI_SUBFEATURE_PARAM_LEN];
> 	struct nand_chip *chip =3D mtd->priv;
> 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
> 	struct nand_buffers *nbuf;
>
>+	if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
>+				    features) >=3D 0) {
>+		if (features[0] & ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC) {
>+			/*
>+			 * If the chip has on-die ECC enabled, we kind
>+			 * of have to do the same...
>+			 */
>+			chip->ecc.mode =3D NAND_ECC_HW_ON_DIE;
>+			pr_info("Using on-die ECC\n");
>+		}
>+	}
>+
Here, I'm bit skeptical on enabling "NAND_ECC_HW_ON_DIE" mode automatically=
,
based on ONFI parameters. ONFI params just advertise the current NAND devic=
e's
capability and features, whether to use that feature or not should be under
control of individual vendor drivers or passed by user via DT | platform-da=
ta.
Example: "MT29F4G16ABADAWP" is supported on-die 4-bit ECC correction. But u=
ser
   can use 8-bit ECC correction on same device,  using ECC-schemes supporte=
d by
   vendor controller driver.

(1) So it would be nice if instead of enabling  chip->ecc.mode=3DNAND_ECC_H=
W_ON_DIE
in nand_scan_tail(), you advertise the availability of this feature in nand=
_scan_ident(),
and then let user choose whether to enable 'on-die' ECC or not.

(2) At-least in the datasheet "m60a_4gb_8gb_16gb_ecc_nand.pdf" I have,
- "internal ECC" is _not_ mentioned in vendor specific ONFI params. Rather
- "internal ECC" is mentioned in 4th byte of READ_ID command.
So, I don't know if using chip->onfi_get_feature() is correct API to use he=
re,
because it uses NAND_CMD_GET_FEATURES (0xeeh) not READ_ID (0x90h)=20

(3) If "internal ECC" is mentioned via some vendor specific ONFI params,=20
Then you should put this code under nand_base.c : nand_onfi_detect_micron()


> 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
> 	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
> 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
>
> 	if (!(chip->options & NAND_OWN_BUFFERS)) {
>+		size_t on_die_bufsz =3D 0;
>+
>+		if (chip->ecc.mode =3D=3D NAND_ECC_HW_ON_DIE)
>+			on_die_bufsz =3D 2*(mtd->writesize + mtd->oobsize);
>+
> 		nbuf =3D kzalloc(sizeof(*nbuf) + mtd->writesize
>-				+ mtd->oobsize * 3, GFP_KERNEL);
>+				+ mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
> 		if (!nbuf)
> 			return -ENOMEM;
> 		nbuf->ecccalc =3D (uint8_t *)(nbuf + 1);
> 		nbuf->ecccode =3D nbuf->ecccalc + mtd->oobsize;
> 		nbuf->databuf =3D nbuf->ecccode + mtd->oobsize;
>+		if (chip->ecc.mode =3D=3D NAND_ECC_HW_ON_DIE) {
>+			nbuf->chkbuf =3D (nbuf->databuf + mtd->writesize
>+					+ mtd->oobsize);
>+			nbuf->rawbuf =3D (nbuf->chkbuf + mtd->writesize
>+					+ mtd->oobsize);
>+		}
>
> 		chip->buffers =3D nbuf;
> 	} else {
>@@ -3956,6 +3980,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> 		ecc->strength =3D ecc->bytes * 8 / fls(8 * ecc->size);
> 		break;
>
>+	case NAND_ECC_HW_ON_DIE:
> 	case NAND_ECC_NONE:
> 		pr_warn("NAND_ECC_NONE selected by board driver. "
> 			   "This is not recommended!\n");
>@@ -4023,8 +4048,13 @@ int nand_scan_tail(struct mtd_info *mtd)
> 	/* Invalidate the pagebuffer reference */
> 	chip->pagebuf =3D -1;
>
>-	/* Large page NAND with SOFT_ECC should support subpage reads */
>-	if ((ecc->mode =3D=3D NAND_ECC_SOFT) && (chip->page_shift > 9))
>+	/*
>+	 * Large page NAND with SOFT_ECC or on-die ECC should support
>+	 * subpage reads.
>+	 */
>+	if (((ecc->mode =3D=3D NAND_ECC_SOFT)
>+	     || (chip->ecc.mode =3D=3D NAND_ECC_HW_ON_DIE))
>+	    && (chip->page_shift > 9))
> 		chip->options |=3D NAND_SUBPAGE_READ;
>
> 	/* Fill in remaining MTD driver data */
>diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
>index b7361ed..c844c84 100644
>--- a/drivers/of/of_mtd.c
>+++ b/drivers/of/of_mtd.c
>@@ -23,6 +23,7 @@ static const char *nand_ecc_modes[] =3D {
> 	[NAND_ECC_HW_SYNDROME]	=3D "hw_syndrome",
> 	[NAND_ECC_HW_OOB_FIRST]	=3D "hw_oob_first",
> 	[NAND_ECC_SOFT_BCH]	=3D "soft_bch",
>+	[NAND_ECC_HW_ON_DIE]	=3D "hw_on_die",
> };
>
> /**
>diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>index 450d61e..a1cc980 100644
>--- a/include/linux/mtd/nand.h
>+++ b/include/linux/mtd/nand.h
>@@ -115,6 +115,7 @@ typedef enum {
> 	NAND_ECC_HW_SYNDROME,
> 	NAND_ECC_HW_OOB_FIRST,
> 	NAND_ECC_SOFT_BCH,
>+	NAND_ECC_HW_ON_DIE,
> } nand_ecc_modes_t;
>
> /*
>@@ -214,6 +215,10 @@ struct nand_chip;
> /* Vendor-specific feature address (Micron) */
> #define ONFI_FEATURE_ADDR_READ_RETRY	0x89
>
>+/* Vendor-specific array operation mode (Micron) */
>+#define ONFI_FEATURE_ADDR_OP_MODE	0x90
>+#define ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC		0x08
>+
> /* ONFI subfeature parameters length */
> #define ONFI_SUBFEATURE_PARAM_LEN	4
>
>@@ -516,6 +521,8 @@ struct nand_buffers {
> 	uint8_t	*ecccalc;
> 	uint8_t	*ecccode;
> 	uint8_t *databuf;
>+	uint8_t *chkbuf;
>+	uint8_t *rawbuf;
> };
>
I'm not sure if its good to extend struct nand_buffers, you could have=20
as well re-used nbuf->databuf, instead of nbuf->chkbuf, as you only
need to get number of bit-flips. Right ?
And again re-use nbuf->databuf on re-reads, in read_page_on_die().



I tried to be elaborate here, so that it cuts down the number of iterations
of your patch. So if you have any disagreements or discussion, lets
clear that out before you send next patch version.


with regards, pekon
