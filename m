Received: from mail-bn1blp0181.outbound.protection.outlook.com
 ([207.46.163.181] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKHZ6-0001L4-Qt
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 01:53:25 +0000
Message-ID: <1408585972.4058.95.camel@snotra.buserror.net>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: Recover corrupted empty page for
 preventing read-only mount in UBIFS
From: Scott Wood <scottwood@freescale.com>
To: <eunb.song@samsung.com>
Date: Wed, 20 Aug 2014 20:52:52 -0500
In-Reply-To: <26017351.61791396316965998.JavaMail.weblogic@epv6ml06>
References: <26017351.61791396316965998.JavaMail.weblogic@epv6ml06>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 01:49 +0000, Eunbong Song wrote:
> Even if the meaning of EUCLEAN was changed by commit edbc4540.
> There is still possibility of read-only mount in UBIFS with ubifs_scan() "corrupt empty space at LEB".
> So i made this patch for fix that problem.

Please elaborate on the nature of the problem.

> This patch do as follow.
>  - If there are ecc errors which is equal to or less than chip->ecc.strength in page.
>  - Check that page has how many zero bits, and if zero bits are equal to or less than
>    chip->ecc.strength then overwrite 1 to zero bits in buf.

This is difficult to parse, with no mention in this sentence that you're
talking about corrupted empty pages.

> ubifs_scan() cannot detect corrupted empty space because buf is recovered by this patch.
> And this is safe because ecc controller can correct up to chip->ecc.strength bits.

So the concern is that is_blank is failing to report a page that has not
been written to but has errors that would have been correctable if the
page had been written?

Do most drivers handle this?

> Signed-off-by: Eunbong Song <eunb.song@samsung.com>
> ---
>  drivers/mtd/nand/fsl_ifc_nand.c |   41 +++++++++++++++++++++++++++++++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index 90ca7e7..2129c39 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -277,6 +277,42 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
>  	return 1;
>  }
>  
> +static int num_zero_bits(uint8_t val)
> +{
> +	int i, ret=0;
> +
> +	for(i=7; i>=0 ; i--)
> +		if(!(0x1 & (val >> i)))
> +			ret++;

Whitespace (here and elsewhere)

Also, use hweight8(~val) instead of reimplementing it.  Or better, use
hweight64() and process the data in larger chunks.

> +	return ret;
> +}
> +
> +static int is_corrupted_blank(struct mtd_info *mtd, uint8_t * buf)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	int i;
> +	int zero_bits = 0;
> +
> +	for (i = 0; i < mtd->writesize ; i++) {
> +		if(buf[i] != 0xff) {
> +			zero_bits += num_zero_bits(buf[i]);	
> +		}
> +	}
> +
> +	if(zero_bits && (zero_bits <= chip->ecc.strength)){
> +		return 1;
> +	}
> +
> +	return 0;
> +}

What if it's a page that legitimately has only a handful of zero bits?
You need to count zero bits in the ECC as well.

Also, this could be combined with is_blank().

> +static void recover_corrupted_blank(struct mtd_info *mtd, uint8_t * buf)
> +{
> +	memset(buf, 0xff, mtd->writesize);
> +	return;
> +}
> +
>  /* returns nonzero if entire page is blank */
>  static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
>  			  u32 *eccstat, unsigned int bufnum)
> @@ -760,6 +796,11 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
>  		mtd->ecc_stats.failed++;
>  
> +	if(nctrl->max_bitflips && (nctrl->max_bitflips <= chip->ecc.strength)){
> +		if(is_corrupted_blank(mtd, buf))
> +			recover_corrupted_blank(mtd, buf);
> +	}

If the page is blank except for errors, most likely max_bitflips will be
zero because fsl_ifc_run_command() already considered it an
uncorrectable error and set ECCER instead.  Moving corrupted blank page
detection into is_blank() wouldn't have this problem.

How did you test this patch?

-Scott
