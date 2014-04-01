Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUsDI-0008Qe-An
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 06:30:25 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>
Subject: RE: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
Date: Tue, 1 Apr 2014 06:29:52 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EABA022@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
In-Reply-To: <1396308537-16013-6-git-send-email-davidm@egauge.net>
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
>
>When NAND_STATUS_REWRITE is set, there is no direct indication as to
>how many bits have were flipped.  This patch improves the existing
>code by manually counting the number of bitflips, rather than just
>assuming the worst-case of mtd->bitflip_threshold.  This avoids
>unnecessary rewrites, e.g., due to a single stuck bit.
>
>Signed-off-by: David Mosberger <davidm@egauge.net>
>---
> drivers/mtd/nand/nand_base.c |   90 +++++++++++++++++++++++++++++++++++++=
+++--
> 1 file changed, 86 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>index 834352a..80cfaa8 100644
>--- a/drivers/mtd/nand/nand_base.c
>+++ b/drivers/mtd/nand/nand_base.c
>@@ -1272,6 +1272,84 @@ static int nand_read_subpage(struct mtd_info *mtd, =
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
>+		data[0] =3D ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC;
>+
>+	return chip->onfi_set_features(mtd, chip,
>+				       ONFI_FEATURE_ADDR_ARRAY_OP_MODE, data);
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

hweight8() might not be good option, how about using hweight32 ?

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
>+
>+	/* Re-read page with on-die ECC off: */
>+	set_on_die_ecc(mtd, chip, 0);
>+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>+	chip->read_buf(mtd, rawbuf, read_size);
>+	set_on_die_ecc(mtd, chip, 1);
>+
>+	chkoob =3D chkbuf + mtd->writesize;
>+	rawoob =3D rawbuf + mtd->writesize;
>+	eccpos =3D chip->ecc.layout->eccpos;
>+	for (i =3D 0; i < chip->ecc.steps; ++i) {
>+		/* Count bit flips in the actual data area: */
>+		flips =3D bitdiff(chkbuf, rawbuf, chip->ecc.size);

Do you really need this as separate function call ?
You could make it inline, like you did below of OOB.
Also, you may stop checking bitflips, once count > chip->ecc.strength.

Some of the discussion on different patch may be helpful here, please see
Brian's comments on [1].

>+		/* Count bit flips in the ECC bytes: */
>+		for (j =3D 0; j < chip->ecc.bytes; ++j) {

Again, why checking only for ecc.bytes ? should have been.

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

If you refer my previous feedbacks, you could avoided this extra
"chip->read_buf(mtd, chkbuf, read_size);" by calling it in nand_page_read_o=
n_die();

>+	return max_bitflips;
>+}
>+
> static int check_read_status_on_die(struct mtd_info *mtd,
> 				    struct nand_chip *chip, int page)
> {
>@@ -1290,11 +1368,15 @@ static int check_read_status_on_die(struct mtd_inf=
o *mtd,
> 		mtd->ecc_stats.failed++;
> 	} else if (status & NAND_STATUS_REWRITE) {
> 		/*
>-		 * Simple but suboptimal: any page with a single stuck
>-		 * bit will be unusable since it'll be rewritten on
>-		 * each read...
>+		 * The Micron chips turn on the REWRITE status bit for
>+		 * ANY bit flips.  Some pages have stuck bits, so we
>+		 * don't want to migrate a block just because of
>+		 * single bit errors because otherwise, that block
>+		 * would effectively become unusable.  So, work out in
>+		 * software what the max number of flipped bits is for
>+		 * all subpages in a page:
> 		 */
>-		max_bitflips =3D mtd->bitflip_threshold;
>+		max_bitflips =3D check_for_bitflips(mtd, chip, page);

We usually don't delete the changes, introduced in previous patches
of same series. So, take one approach and then logically divide the patches=
.

> 	}
> 	return max_bitflips;
> }
>--
>1.7.9.5
>

Again, please review all the comments given by Gerhard and myself
on previous patches. Don't hurry in sending newer revisions, as it
would just increase your iterations.

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052625.html

with regards, pekon
