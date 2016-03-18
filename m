Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agwee-0004D9-1D
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 15:49:37 +0000
Date: Fri, 18 Mar 2016 16:49:04 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org,
 cernekee@gmail.com, sboyd@codeaurora.org, linux-mtd@lists.infradead.org,
 dehrenberg@google.com, andy.gross@linaro.org
Subject: Re: [PATCH v8 2/3] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20160318164904.45a77338@bbrezillon>
In-Reply-To: <1454489991-14717-3-git-send-email-architt@codeaurora.org>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-3-git-send-email-architt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Archit,

On Wed,  3 Feb 2016 14:29:50 +0530
Archit Taneja <architt@codeaurora.org> wrote:

> +/*
> + * NAND controller page layout info
> + *
> + * Layout with ECC enabled:
> + *
> + * |----------------------|  |---------------------------------|
> + * |           xx.......yy|  |             *********xx.......yy|
> + * |    DATA   xx..ECC..yy|  |    DATA     **SPARE**xx..ECC..yy|
> + * |   (516)   xx.......yy|  |  (516-n*4)  **(n*4)**xx.......yy|
> + * |           xx.......yy|  |             *********xx.......yy|
> + * |----------------------|  |---------------------------------|
> + *     codeword 1,2..n-1                  codeword n
> + *  <---(528/532 Bytes)-->    <-------(528/532 Bytes)--------->
> + *
> + * n = Number of codewords in the page
> + * . = ECC bytes
> + * * = Spare/free bytes
> + * x = Unused byte(s)
> + * y = Reserved byte(s)
> + *
> + * 2K page: n = 4, spare = 16 bytes
> + * 4K page: n = 8, spare = 32 bytes
> + * 8K page: n = 16, spare = 64 bytes
> + *
> + * the qcom nand controller operates at a sub page/codeword level. each
> + * codeword is 528 and 532 bytes for 4 bit and 8 bit ECC modes respectively.
> + * the number of ECC bytes vary based on the ECC strength and the bus width.
> + *
> + * the first n - 1 codewords contains 516 bytes of user data, the remaining
> + * 12/16 bytes consist of ECC and reserved data. The nth codeword contains
> + * both user data and spare(oobavail) bytes that sum up to 516 bytes.
> + *
> + * When we access a page with ECC enabled, the reserved bytes(s) are not
> + * accessible at all. When reading, we fill up these unreadable positions
> + * with 0xffs. When writing, the controller skips writing the inaccessible
> + * bytes.
> + *
> + * Layout with ECC disabled:
> + *
> + * |------------------------------|  |---------------------------------------|
> + * |         yy          xx.......|  |         bb          *********xx.......|
> + * |  DATA1  yy  DATA2   xx..ECC..|  |  DATA1  bb  DATA2   **SPARE**xx..ECC..|
> + * | (size1) yy (size2)  xx.......|  | (size1) bb (size2)  **(n*4)**xx.......|
> + * |         yy          xx.......|  |         bb          *********xx.......|
> + * |------------------------------|  |---------------------------------------|
> + *         codeword 1,2..n-1                        codeword n
> + *  <-------(528/532 Bytes)------>    <-----------(528/532 Bytes)----------->
> + *
> + * n = Number of codewords in the page
> + * . = ECC bytes
> + * * = Spare/free bytes
> + * x = Unused byte(s)
> + * y = Dummy Bad Bock byte(s)
> + * b = Real Bad Block byte(s)
> + * size1/size2 = function of codeword size and 'n'
> + *
> + * when the ECC block is disabled, one reserved byte (or two for 16 bit bus
> + * width) is now accessible. For the first n - 1 codewords, these are dummy Bad
> + * Block Markers. In the last codeword, this position contains the real BBM
> + *
> + * In order to have a consistent layout between RAW and ECC modes, we assume
> + * the following OOB layout arrangement:
> + *
> + * |-----------|  |--------------------|
> + * |yyxx.......|  |bb*********xx.......|
> + * |yyxx..ECC..|  |bb*FREEOOB*xx..ECC..|
> + * |yyxx.......|  |bb*********xx.......|
> + * |yyxx.......|  |bb*********xx.......|
> + * |-----------|  |--------------------|
> + *  first n - 1       nth OOB region
> + *  OOB regions
> + *
> + * n = Number of codewords in the page
> + * . = ECC bytes
> + * * = FREE OOB bytes
> + * y = Dummy bad block byte(s) (inaccessible when ECC enabled)
> + * x = Unused byte(s)
> + * b = Real bad block byte(s) (inaccessible when ECC enabled)
> + *
> + * This layout is read as is when ECC is disabled. When ECC is enabled, the
> + * inaccessible Bad Block byte(s) are ignored when we write to a page/oob,
> + * and assumed as 0xffs when we read a page/oob. The ECC, unused and
> + * dummy/real bad block bytes are grouped as ecc bytes in nand_ecclayout (i.e,
> + * ecc->bytes is the sum of the three).
> + */
> +
> +static struct nand_ecclayout *
> +qcom_nand_create_layout(struct qcom_nand_host *host)
> +{
> +	struct nand_chip *chip = &host->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +	struct nand_ecclayout *layout;
> +	int i, j, steps, pos = 0, shift = 0;
> +
> +	layout = devm_kzalloc(nandc->dev, sizeof(*layout), GFP_KERNEL);
> +	if (!layout)
> +		return NULL;
> +
> +	steps = mtd->writesize / ecc->size;
> +	layout->eccbytes = steps * ecc->bytes;
> +
> +	layout->oobfree[0].offset = (steps - 1) * ecc->bytes + host->bbm_size;
> +	layout->oobfree[0].length = steps << 2;
> +	layout->oobavail = steps << 2;
> +
> +	/*
> +	 * the oob bytes in the first n - 1 codewords are all grouped together
> +	 * in the format:
> +	 * DUMMY_BBM + UNUSED + ECC
> +	 */
> +	for (i = 0; i < steps - 1; i++) {
> +		for (j = 0; j < ecc->bytes; j++)
> +			layout->eccpos[pos++] = i * ecc->bytes + j;
> +	}
> +
> +	/*
> +	 * the oob bytes in the last codeword are grouped in the format:
> +	 * BBM + FREE OOB + UNUSED + ECC
> +	 */
> +
> +	/* fill up the bbm positions */
> +	for (j = 0; j < host->bbm_size; j++)
> +		layout->eccpos[pos++] = i * ecc->bytes + j;
> +
> +	/*
> +	 * fill up the ecc and reserved positions, their indices are offseted
> +	 * by the free oob region
> +	 */
> +	shift = layout->oobfree[0].length + host->bbm_size;
> +
> +	for (j = 0; j < (host->ecc_bytes_hw + host->spare_bytes); j++)
> +		layout->eccpos[pos++] = i * ecc->bytes + shift + j;
> +
> +	return layout;
> +}

I'm trying to move this layout definition to the mtd_ooblayout_ops
approach, and I wonder why you decided to take such a complicated
representation.
AFAIU, in each ECC step you have 512 bytes of data, X ECC+reserved
bytes (you decided to consider all of them as ECC bytes, which is fine
by me) and 4 usable/free bytes. Am I correct?

If that's the case, then why not exposing the following layout.

eccregion[i] = {
	.offset = i * (ecc->bytes + 4);
	.length = ecc->bytes;
}

oobfreeregion[i] = {
	.offset = (i * (ecc->bytes + 4)) + ecc->bytes;
	.length = 4;
}

Are there any userspace tools relying on the ooblayout you're currently
exposing (remember that the exposed OOB layout is not necessarily
what you see on the media)?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
