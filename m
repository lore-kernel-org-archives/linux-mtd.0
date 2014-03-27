Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WT4FF-0005Q5-JY
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 06:56:59 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Date: Thu, 27 Mar 2014 06:56:25 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
In-Reply-To: <1395875121-9320-1-git-send-email-davidm@egauge.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Gerhard Sittig <gsi@denx.de>,
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

>From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf O=
f David Mosberger
>Subject: [PATCH] mtd: nand: Add support for Micron on-die ECC controller (=
rev2).
>
Sorry, I looked at this patch little lately.
But good, if you can keep $subject consistent, like using
prefix "[PATCH v2]"  instead of adding suffix "(rev2)".

>This patch enables support for on-die ECC controllers as found on
>certain Micron chips, for example.  On-die ECC can be useful for
>platforms lacking hardware-support for multi-bit ECC.  The patch is
>safe to apply because it never turns on on-die ECC on its own (that
>job is left to the bootloader).  Instead, this code simply checks
>whether the on-die ECC controller is enabled and, if so, uses it.
>
Also, It would have been good if you can break this patch into two portions
because, I see this patch touching some sections of generic NAND driver
which are re-used by multiple other controller drivers, and it would be
necessary to take multiple tested-by from different owners before
accepting these changes. So, if you break your patch into
- Patch having Micron on-die controller specific changes / hooks
- Patch populating those hooks in generic NAND interface and other checks
Then it would be easy for review and fast in getting acceptance.

(Also, good to be reviewed by Brian once)


>Signed-of-by: David Mosberger <davidm@egauge.net>
>---
> drivers/mtd/nand/nand_base.c |  258 +++++++++++++++++++++++++++++++++++++=
++++-
> include/linux/mtd/nand.h     |    8 ++
> 2 files changed, 263 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 5826da3..e642d1f 100644
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
>@@ -1250,6 +1264,196 @@ static int nand_read_subpage(struct mtd_info *mtd,=
 struct nand_chip *chip,
> 	return max_bitflips;
> }
>
>+static int
>+set_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip, int on)
>+{
>+	u8 data[ONFI_SUBFEATURE_PARAM_LEN] =3D { 0, };
>+
>+	if (chip->ecc.mode !=3D NAND_ECC_HW_ON_DIE)
>+		return 0;
>+
>+	if (on)
>+		data[0] =3D ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC;
>+
>+	return chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
>+				       data);
>+}
>+
>+/*
>+ * Return the number of bits that differ between buffers SRC1 and
>+ * SRC2, both of which are LEN bytes long.
>+ *
>+ * This code could be optimized for, but it only gets called on pages
>+ * with bitflips and compared to the cost of migrating an eraseblock,
>+ * the execution time here is trivial...
>+ */
>+static int
>+bitdiff(const void *s1, const void *s2, size_t len)
>+{
>+	const uint8_t *src1 =3D s1, *src2 =3D s2;
>+	int count =3D 0, i;
>+
>+	for (i =3D 0; i < len; ++i)
>+		count +=3D hweight8(*src1++ ^ *src2++);
>+	return count;
>+}
>+
>+static int
>+check_for_bitflips(struct mtd_info *mtd, struct nand_chip *chip, int page=
)
>+{
>+	int flips =3D 0, max_bitflips =3D 0, i, j, read_size;
>+	uint8_t *chkbuf, *rawbuf, *chkoob, *rawoob;
>+	uint32_t *eccpos;
>+
>+	chkbuf =3D chip->buffers->chkbuf;
>+	rawbuf =3D chip->buffers->rawbuf;
>+	read_size =3D mtd->writesize + mtd->oobsize;
>+
>+	/* Read entire page w/OOB area with on-die ECC on: */
>+	chip->read_buf(mtd, chkbuf, read_size);

This should have been called directly from nand_read_page_on_die()

>+
>+	/* Re-read page with on-die ECC off: */
>+	set_on_die_ecc(mtd, chip, 0);
>+	{
Why these braces {} ? Did  you miss any error-checking here ?

>+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>+		chip->read_buf(mtd, rawbuf, read_size);
>+	}

>+	set_on_die_ecc(mtd, chip, 1);
>+
>+	chkoob =3D chkbuf + mtd->writesize;
>+	rawoob =3D rawbuf + mtd->writesize;
>+	eccpos =3D chip->ecc.layout->eccpos;
>+	for (i =3D 0; i < chip->ecc.steps; ++i) {
>+		/* Count bit flips in the actual data area: */
>+		flips =3D bitdiff(chkbuf, rawbuf, chip->ecc.size);
>+		/* Count bit flips in the ECC bytes: */
>+		for (j =3D 0; j < chip->ecc.bytes; ++j) {

You should check bit-flips in complete OOB region (mtd->oobsize) not just e=
cc.bytes.

>+			flips +=3D hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
>+			++eccpos;
>+		}
>+		if (flips > 0)
>+			mtd->ecc_stats.corrected +=3D flips;
>+		max_bitflips =3D max_t(int, max_bitflips, flips);
>+		chkbuf +=3D chip->ecc.size;
>+		rawbuf +=3D chip->ecc.size;
>+	}
>+
>+	/* Re-issue the READ command for the actual data read that follows.  */
>+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>+

Something wrong here in the flow. (please see my comments later).

>+	return max_bitflips;
>+}
>+
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
>+	chip->cmd_ctrl(mtd, NAND_CMD_READ0,
>+		       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
>+	chip->cmd_ctrl(mtd, NAND_CMD_NONE,
>+		       NAND_NCE | NAND_CTRL_CHANGE);
>+
>+	if (status & NAND_STATUS_FAIL) {
>+		/* Page has invalid ECC. */
>+		mtd->ecc_stats.failed++;
>+	} else if (status & NAND_STATUS_REWRITE) {
>+		/*
>+		 * The Micron chips turn on the REWRITE status bit for
>+		 * ANY bit flips.  Some pages have stuck bits, so we
>+		 * don't want to migrate a block just because of
>+		 * single bit errors because otherwise, that block
>+		 * would effectively become unusable.  So, work out in
>+		 * software what the max number of flipped bits is for
>+		 * all subpages in a page:
>+		 */
>+		max_bitflips =3D check_for_bitflips(mtd, chip, page);
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

This is the entry point of chip->ecc.read_page(),  So, your first call to e=
cc.read_buf
should have happened here, not in check_for_bitflips(). And you should have=
 just
passed the read_buffer to for checking of bit-flips.

>+	ret =3D check_read_status_on_die(mtd, chip, page);
Also this should have been part of nand_chip->ecc.correct() interface.



>+	if (ret < 0 || mtd->ecc_stats.failed !=3D failed) {
>+		memset(buf, 0, mtd->writesize);

This is not required, because if there are ECC failure (uncorrectable bit-f=
lips)
then, nand_do_read_ops() will automatically convert it into -EBADMSG.
And then let above layers MTD, UBI determine what to do with the corrupted =
data.
Un-correctable bit-flips may be in those portions of  a page which do not
contain any data. Hence, you should not reset the buffer even for ECC failu=
res.

Example: UBIFS erase-header and volume-id-headers occupy on first few
bytes of the page. And so UBIFS uses in-band CRC checks to see if its heade=
rs
have any corruption. Now, even if the NAND page had some uncorrectable
bit-flips, but those bit-flips do not affect the data of UBIFS headers,
then UBIFS just reads those pages and scrubs the block.


>+		if (oob_required)
>+			memset(chip->oob_poi, 0, mtd->oobsize);
 -- same here --

>+		return ret;
>+	}
>+
>+	chip->read_buf(mtd, buf, mtd->writesize);

This is not correct. You first read the data, and then check for bit-flips.
You *don't* re-read the page again, because on re-read you may find
new bit-flips due to read-disturb errors, which were not accounted in
the earlier count.=20

So, if you follow the below sequence..
(1) read buffer (with on-die ECC =3D=3D ON)
(2) check for bit-flips (just pass the read_buffer)
(3) correct bit-flips (again just pass read_buffer)
Then probably you don't need this call, and you can re-use existing generic
NAND driver implementations.


>+	if (oob_required)
>+		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>+	return ret;
>+}
>+
> /**
>  * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read func=
tion
>  * @mtd: mtd info structure
>@@ -3783,22 +3987,46 @@ EXPORT_SYMBOL(nand_scan_ident);
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
>@@ -3956,6 +4184,25 @@ int nand_scan_tail(struct mtd_info *mtd)
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
>+		break;
>+
> 	case NAND_ECC_NONE:
> 		pr_warn("NAND_ECC_NONE selected by board driver. "
> 			   "This is not recommended!\n");
>@@ -4023,8 +4270,13 @@ int nand_scan_tail(struct mtd_info *mtd)
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
>diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>index 450d61e..4514ced 100644
>--- a/include/linux/mtd/nand.h
>+++ b/include/linux/mtd/nand.h
>@@ -101,6 +101,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t of=
s, uint64_t len);
> /* Status bits */
> #define NAND_STATUS_FAIL	0x01
> #define NAND_STATUS_FAIL_N1	0x02
>+#define NAND_STATUS_REWRITE	0x08
> #define NAND_STATUS_TRUE_READY	0x20
> #define NAND_STATUS_READY	0x40
> #define NAND_STATUS_WP		0x80
>@@ -115,6 +116,7 @@ typedef enum {
> 	NAND_ECC_HW_SYNDROME,
> 	NAND_ECC_HW_OOB_FIRST,
> 	NAND_ECC_SOFT_BCH,
>+	NAND_ECC_HW_ON_DIE,
> } nand_ecc_modes_t;
>
> /*
>@@ -214,6 +216,10 @@ struct nand_chip;
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
>@@ -516,6 +522,8 @@ struct nand_buffers {
> 	uint8_t	*ecccalc;
> 	uint8_t	*ecccode;
> 	uint8_t *databuf;
>+	uint8_t *chkbuf;
>+	uint8_t *rawbuf;
> };
>
> /**
>--
>1.7.9.5
>
>
Also, can include a link to public copy of the Micron device datasheet
which has on-die ECC feature. It would be helpful to understand your patch


with regards, pekon
