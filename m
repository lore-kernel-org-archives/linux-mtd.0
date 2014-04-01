Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUrn8-0007xf-2e
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 06:03:23 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>
Subject: RE: [PATCH v4 2/5] mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
Date: Tue, 1 Apr 2014 06:02:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB9FF9@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-3-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-3-git-send-email-davidm@egauge.net>
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
>Some Micron chips such as the MT29F4G16ABADAWP have an internal
>(on-die) ECC-controller that is useful when the host-platform doesn't
>have hardware-support for multi-bit ECC.  This patch adds
>NAND_ECC_HW_ON_DIE to support such chips when the driver detects that
>the on-die ECC controller is enabled.
>
>Signed-off-by: David Mosberger <davidm@egauge.net>
>---
> drivers/mtd/nand/nand_base.c |  133 +++++++++++++++++++++++++++++++++++++=
+++++
> drivers/of/of_mtd.c          |    1 +
> include/linux/mtd/nand.h     |    2 +
> 3 files changed, 136 insertions(+)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index f145f00..7047e9f5 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -78,6 +78,20 @@ static struct nand_ecclayout nand_oob_64 =3D {
> 		 .length =3D 38} }
> };
>
>+static struct nand_ecclayout nand_oob_64_on_die =3D {
>+	.eccbytes =3D 32,
>+	.eccpos =3D {
>+		    8,  9, 10, 11, 12, 13, 14, 15,
>+		   24, 25, 26, 27, 28, 29, 30, 31,
>+		   40, 41, 42, 43, 44, 45, 46, 47,
>+		   56, 57, 58, 59, 60, 61, 62, 63},
>+	.oobfree =3D {
>+		{.offset =3D  4,	 .length =3D 4},
>+		{.offset =3D 20,	 .length =3D 4},
>+		{.offset =3D 36,	 .length =3D 4},
>+		{.offset =3D 52,	 .length =3D 4}}
>+};
>+
> static struct nand_ecclayout nand_oob_128 =3D {
> 	.eccbytes =3D 48,
> 	.eccpos =3D {
>@@ -1258,6 +1272,105 @@ static int nand_read_subpage(struct mtd_info *mtd,=
 struct nand_chip *chip,
> 	return max_bitflips;
> }
>
>+static int check_read_status_on_die(struct mtd_info *mtd,
>+				    struct nand_chip *chip, int page)
>+{
>+	int max_bitflips =3D 0;
>+	uint8_t status;
>+
>+	/* Check ECC status of page just transferred into NAND's page buffer: */
>+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>+	status =3D chip->read_byte(mtd);
>+
>+	/* Switch back to data reading: */
>+	chip->cmdfunc(mtd, NAND_CMD_READMODE, -1, -1);
>+
>+	if (status & NAND_STATUS_FAIL) {
>+		/* Page has invalid ECC. */
>+		mtd->ecc_stats.failed++;
>+	} else if (status & NAND_STATUS_REWRITE) {
>+		/*
>+		 * Simple but suboptimal: any page with a single stuck
>+		 * bit will be unusable since it'll be rewritten on
>+		 * each read...
>+		 */
>+		max_bitflips =3D mtd->bitflip_threshold;

This is not correct. You need to count the bit-flips. This would lead to
un-necessary scrubbing of the pages by UBI even for single-bit errors.

>+	}
>+	return max_bitflips;
>+}
>+
>+/**
>+ * nand_read_subpage_on_die - [REPLACEABLE] raw sub-page read function
>+ * @mtd: mtd info structure
>+ * @chip: nand chip info structure
>+ * @data_offs: offset of requested data within the page
>+ * @readlen: data length
>+ * @bufpoi: buffer to store read data
>+ */
>+static int nand_read_subpage_on_die(struct mtd_info *mtd,
>+				    struct nand_chip *chip,
>+				    uint32_t data_offs, uint32_t readlen,
>+				    uint8_t *bufpoi, int page)
>+{
>+	int start_step, end_step, num_steps, ret;
>+	int data_col_addr;
>+	int datafrag_len;
>+	uint32_t failed;
>+	uint8_t *p;
>+
>+	/* Column address within the page aligned to ECC size */
>+	start_step =3D data_offs / chip->ecc.size;
>+	end_step =3D (data_offs + readlen - 1) / chip->ecc.size;
>+	num_steps =3D end_step - start_step + 1;
>+
>+	/* Data size aligned to ECC ecc.size */
>+	datafrag_len =3D num_steps * chip->ecc.size;
>+	data_col_addr =3D start_step * chip->ecc.size;
>+	p =3D bufpoi + data_col_addr;
>+
>+	failed =3D mtd->ecc_stats.failed;
>+
>+	ret =3D check_read_status_on_die(mtd, chip, page);
>+	if (ret < 0 || mtd->ecc_stats.failed !=3D failed) {
>+		memset(p, 0, datafrag_len);
>+		return ret;
>+	}
>+
>+	/* If we read not a page aligned data */
>+	if (data_col_addr !=3D 0)
>+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, data_col_addr, -1);
>+
>+	chip->read_buf(mtd, p, datafrag_len);
>+
>+	return ret;
>+}
>+
Please spawn out nand_read_subpage_on_die() into a separate patch
(or may be later) so that basic framework with nand_read_page_on_die()
can be independently reviewed and accepted.


>+/**
>+ * nand_read_page_on_die - [INTERN] read raw page data without ecc
>+ * @mtd: mtd info structure
>+ * @chip: nand chip info structure
>+ * @buf: buffer to store read data
>+ * @oob_required: caller requires OOB data read to chip->oob_poi
>+ * @page: page number to read
>+ */
>+static int nand_read_page_on_die(struct mtd_info *mtd, struct nand_chip *=
chip,
>+				 uint8_t *buf, int oob_required, int page)
>+{
>+	uint32_t failed;
>+	int ret;
>+
>+	failed =3D mtd->ecc_stats.failed;
>+
>+	ret =3D check_read_status_on_die(mtd, chip, page);
>+	if (ret < 0 || mtd->ecc_stats.failed !=3D failed)
>+		return ret;
>+
>+	chip->read_buf(mtd, buf, mtd->writesize);
>+	if (oob_required)
>+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>+	return ret;
>+}
>+
> /**
>  * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read func=
tion
>  * @mtd: mtd info structure
>@@ -3069,6 +3182,7 @@ nand_onfi_detect_micron_on_die_ecc(struct mtd_info *=
mtd,
> 		 * If the chip has on-die ECC enabled, we kind of have
> 		 * to do the same...
> 		 */
>+		chip->ecc.mode =3D NAND_ECC_HW_ON_DIE;
> 		pr_info("Using on-die ECC\n");
> 	}
> }
>@@ -3985,6 +4099,25 @@ int nand_scan_tail(struct mtd_info *mtd)
> 		ecc->strength =3D ecc->bytes * 8 / fls(8 * ecc->size);
> 		break;
>
>+	case NAND_ECC_HW_ON_DIE:
>+		/* nand_bbt attempts to put Bbt marker at offset 8 in
>+		   oob, which is used for ECC by Micron
>+		   MT29F4G16ABADAWP, for example.  Fixed by not using
>+		   OOB for BBT marker.  */
>+		chip->bbt_options |=3D NAND_BBT_NO_OOB;
>+		chip->ecc.layout =3D &nand_oob_64_on_die;
>+		chip->ecc.read_page =3D nand_read_page_on_die;
>+		chip->ecc.read_subpage =3D nand_read_subpage_on_die;
>+		chip->ecc.write_page =3D nand_write_page_raw;
>+		chip->ecc.read_oob =3D nand_read_oob_std;
>+		chip->ecc.read_page_raw =3D nand_read_page_raw;
>+		chip->ecc.write_page_raw =3D nand_write_page_raw;
>+		chip->ecc.write_oob =3D nand_write_oob_std;
>+		chip->ecc.size =3D 512;
>+		chip->ecc.bytes =3D 8;
>+		chip->ecc.strength =3D 4;

Shouldn't you parse these value from ONFI params ?
Do Byte[112] (Number of bits ECC bits) of ONFI param page still holds
good when on-die-ECC is enabled ?=20

>+		break;
>+
> 	case NAND_ECC_NONE:
> 		pr_warn("NAND_ECC_NONE selected by board driver. "
> 			   "This is not recommended!\n");
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
Why are you adding this an selectable option for "nand-ecc-mode"
DT binding ? (as you are not giving user to choose ECC mode).
Also, description of this new DT binding value needs to be added in
Documentation/devicetree/bindings/mtd/nand.txt


> /**
>diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>index 780ab58..dbb99b3 100644
>--- a/include/linux/mtd/nand.h
>+++ b/include/linux/mtd/nand.h
>@@ -112,6 +112,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t of=
s, uint64_t len);
> /* Status bits */
> #define NAND_STATUS_FAIL	0x01
> #define NAND_STATUS_FAIL_N1	0x02
>+#define NAND_STATUS_REWRITE	0x08
> #define NAND_STATUS_TRUE_READY	0x20
> #define NAND_STATUS_READY	0x40
> #define NAND_STATUS_WP		0x80
>@@ -126,6 +127,7 @@ typedef enum {
> 	NAND_ECC_HW_SYNDROME,
> 	NAND_ECC_HW_OOB_FIRST,
> 	NAND_ECC_SOFT_BCH,
>+	NAND_ECC_HW_ON_DIE,
> } nand_ecc_modes_t;
>
> /*
>--
>1.7.9.5
>

In summary, It seems that you havn't followed the recommendations by
given on previous patches. If you feel those are not applicable to your dri=
ver
then please feel free to discuss before re-sending the new version.


with regards, pekon
