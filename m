Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZL7E7-0003ty-6C
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 10:07:44 +0000
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55BB48D9.6050508@dave-tech.it>
Date: Fri, 31 Jul 2015 12:07:21 +0200
MIME-Version: 1.0
In-Reply-To: <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Boris,


Il 30/07/2015 19:34, Boris Brezillon ha scritto:
> The default NAND read functions are relying on an underlying controller
> to correct bitflips, but some of those controller cannot properly fix
> bitflips in erased pages.
> In case of ECC failures, check if the page of subpage is empty before
> reporting an ECC failure.

I'm still wondering if chip->ecc.strength is the right threshold.

Did you see my comments here [1]? WDYT?

Maybe we can have this discussion in a separate thread, if you want ;-)

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-July/060520.html

>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/mtd/nand/nand_base.c | 63 ++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 55 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 1542ea7..d527c73 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1396,6 +1396,19 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>   		stat = chip->ecc.correct(mtd, p,
>   			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
>   		if (stat < 0) {
> +			/* check for empty pages with bitflips */
> +			int col = (int)(p - bufpoi);
> +
> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, col, -1);
> +			chip->read_buf(mtd, p, chip->ecc.size);
> +			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
> +						&chip->buffers->ecccode[i],
> +						chip->ecc.bytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
> +		if (stat < 0) {
>   			mtd->ecc_stats.failed++;
>   		} else {
>   			mtd->ecc_stats.corrected += stat;
> @@ -1445,6 +1458,16 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
>
>   		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
>   		if (stat < 0) {
> +			/* check for empty pages with bitflips */
> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, i, -1);
> +			chip->read_buf(mtd, p, eccsize);
> +			stat = nand_check_erased_ecc_chunk(p, eccsize,
> +						&ecc_code[i], eccbytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
> +		if (stat < 0) {
>   			mtd->ecc_stats.failed++;
>   		} else {
>   			mtd->ecc_stats.corrected += stat;
> @@ -1495,7 +1518,18 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
>   		chip->read_buf(mtd, p, eccsize);
>   		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
>
> -		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
> +		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
> +		if (stat < 0) {
> +			/* check for empty pages with bitflips */
> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
> +				      i + mtd->oobsize, -1);
> +			chip->read_buf(mtd, p, eccsize);
> +			stat = nand_check_erased_ecc_chunk(p, eccsize,
> +						&ecc_code[i], eccbytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
>   		if (stat < 0) {
>   			mtd->ecc_stats.failed++;
>   		} else {
> @@ -1523,6 +1557,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>   	int i, eccsize = chip->ecc.size;
>   	int eccbytes = chip->ecc.bytes;
>   	int eccsteps = chip->ecc.steps;
> +	int eccstepsize = eccsize + eccbytes + chip->ecc.prepad +
> +			  chip->ecc.postpad;
>   	uint8_t *p = buf;
>   	uint8_t *oob = chip->oob_poi;
>   	unsigned int max_bitflips = 0;
> @@ -1542,19 +1578,30 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>   		chip->read_buf(mtd, oob, eccbytes);
>   		stat = chip->ecc.correct(mtd, p, oob, NULL);
>
> -		if (stat < 0) {
> -			mtd->ecc_stats.failed++;
> -		} else {
> -			mtd->ecc_stats.corrected += stat;
> -			max_bitflips = max_t(unsigned int, max_bitflips, stat);
> -		}
> -
>   		oob += eccbytes;
>
>   		if (chip->ecc.postpad) {
>   			chip->read_buf(mtd, oob, chip->ecc.postpad);
>   			oob += chip->ecc.postpad;
>   		}
> +
> +		if (stat < 0) {
> +			/* check for empty pages with bitflips */
> +			chip->cmdfunc(mtd, NAND_CMD_RNDOUT, i * eccstepsize, -1);
> +			chip->read_buf(mtd, p, chip->ecc.size);
> +			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
> +							   oob - eccstepsize,
> +							   eccstepsize,
> +							   NULL, 0,
> +							   chip->ecc.strength);
> +		}
> +
> +		if (stat < 0) {
> +			mtd->ecc_stats.failed++;
> +		} else {
> +			mtd->ecc_stats.corrected += stat;
> +			max_bitflips = max_t(unsigned int, max_bitflips, stat);
> +		}
>   	}
>
>   	/* Calculate remaining oob bytes */
>
