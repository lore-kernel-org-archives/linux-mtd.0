Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeAm4-00028v-7n
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2015 23:45:33 +0000
Received: by padbj2 with SMTP id bj2so4887999pad.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2015 16:45:11 -0700 (PDT)
Date: Mon, 21 Sep 2015 16:45:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Andrea Scian <rnd4@dave-tech.it>,
 Richard Weinberger <richard@nod.at>, Roger Quadros <rogerq@ti.com>,
 Pekon Gupta <pekon.gupta@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RESEND PATCH v3 3/5] mtd: nand: use nand_check_erased_ecc_chunk
 in default ECC read functions
Message-ID: <20150921234509.GI31505@google.com>
References: <1441296222-14989-1-git-send-email-boris.brezillon@free-electrons.com>
 <1441296222-14989-4-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441296222-14989-4-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

On Thu, Sep 03, 2015 at 06:03:40PM +0200, Boris Brezillon wrote:
> The default NAND read functions are relying on an underlying controller
> to correct bitflips, but some of those controller cannot properly fix
> bitflips in erased pages.
> In case of ECC failures, check if the page of subpage is empty before
> reporting an ECC failure.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

I'd really want some test results for this before opting everyone in. If
I remember your last response correctly, you're just testing sunxi-nand,
which uses a different implementation, right?

Potential different strategy: if we can get one or two drivers to test
this, we could flip it around into an opt-in flag (this would
modify/eliminate patch 3). I know this has downsides for
less-actively-developed drivers, which may never get fixed up to support
erased-page ECC checks, but then, it also likely has less benefits for
those cases too.

Thoughts? I could be convinced another way if I we can get reasonable
backing from others who can test this.

One more comment below.

> ---
>  drivers/mtd/nand/nand_base.c | 50 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a2687ea..9a109a5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1419,6 +1419,15 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  		stat = chip->ecc.correct(mtd, p,
>  			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
> +		if (stat == -EBADMSG) {
> +			/* check for empty pages with bitflips */
> +			stat = nand_check_erased_ecc_chunk(p, chip->ecc.size,
> +						&chip->buffers->ecccode[i],
> +						chip->ecc.bytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
>  		if (stat < 0) {
>  			mtd->ecc_stats.failed++;
>  		} else {
> @@ -1468,6 +1477,14 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
>  		int stat;
>  
>  		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
> +		if (stat == -EBADMSG) {
> +			/* check for empty pages with bitflips */
> +			stat = nand_check_erased_ecc_chunk(p, eccsize,
> +						&ecc_code[i], eccbytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
>  		if (stat < 0) {
>  			mtd->ecc_stats.failed++;
>  		} else {
> @@ -1520,6 +1537,14 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
>  		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
>  
>  		stat = chip->ecc.correct(mtd, p, &ecc_code[i], NULL);
> +		if (stat == -EBADMSG) {
> +			/* check for empty pages with bitflips */
> +			stat = nand_check_erased_ecc_chunk(p, eccsize,
> +						&ecc_code[i], eccbytes,
> +						NULL, 0,
> +						chip->ecc.strength);
> +		}
> +
>  		if (stat < 0) {
>  			mtd->ecc_stats.failed++;
>  		} else {
> @@ -1547,6 +1572,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  	int i, eccsize = chip->ecc.size;
>  	int eccbytes = chip->ecc.bytes;
>  	int eccsteps = chip->ecc.steps;
> +	int eccstepsize = eccsize + eccbytes + chip->ecc.prepad +
> +			  chip->ecc.postpad;

Hmm, is this correct? I think you shouldn't be adding in eccsize, if
you're looking for just the length of the ECC OOB region. But I could be
wrong.

>  	uint8_t *p = buf;
>  	uint8_t *oob = chip->oob_poi;
>  	unsigned int max_bitflips = 0;
> @@ -1566,19 +1593,28 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  		chip->read_buf(mtd, oob, eccbytes);
>  		stat = chip->ecc.correct(mtd, p, oob, NULL);
>  
> -		if (stat < 0) {
> -			mtd->ecc_stats.failed++;
> -		} else {
> -			mtd->ecc_stats.corrected += stat;
> -			max_bitflips = max_t(unsigned int, max_bitflips, stat);
> -		}
> -
>  		oob += eccbytes;
>  
>  		if (chip->ecc.postpad) {
>  			chip->read_buf(mtd, oob, chip->ecc.postpad);
>  			oob += chip->ecc.postpad;
>  		}
> +
> +		if (stat == -EBADMSG) {
> +			/* check for empty pages with bitflips */
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
>  	}
>  
>  	/* Calculate remaining oob bytes */

Brian
