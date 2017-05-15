Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dABoY-0004ru-8q
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 08:57:16 +0000
Date: Mon, 15 May 2017 10:56:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Pavel Machek <pavel@ucw.cz>, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] mtd: nand: tango: Update ecc_stats.corrected
Message-ID: <20170515105652.1970c97e@bbrezillon>
In-Reply-To: <a78b005a-ef38-7dda-1213-82acc09de597@sigmadesigns.com>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170503200427.GC17315@amd> <20170504104216.0969423f@bbrezillon>
 <a78b005a-ef38-7dda-1213-82acc09de597@sigmadesigns.com>
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

On Fri, 12 May 2017 17:34:01 +0200
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> According to Boris, some user-space tools expect MTD drivers to
> update ecc_stats.corrected, and it's better to provide a lower
> bound than to provide no information at all.
> 
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> NB: this patch is based on 4.9; if it looks good, I'll rebase
> it on v4.12-rc1 next week.

No need to resend, it seems to apply cleanly.

> ---
>  drivers/mtd/nand/tango_nand.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 4a5e948c62df..471348462e42 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -55,10 +55,10 @@
>   * byte 1 for other packets in the page (PKT_N, for N > 0)
>   * ERR_COUNT_PKT_N is the max error count over all but the first packet.
>   */
> -#define DECODE_OK_PKT_0(v)	((v) & BIT(7))
> -#define DECODE_OK_PKT_N(v)	((v) & BIT(15))
>  #define ERR_COUNT_PKT_0(v)	(((v) >> 0) & 0x3f)
>  #define ERR_COUNT_PKT_N(v)	(((v) >> 8) & 0x3f)
> +#define DECODE_FAIL_PKT_0(v)	(((v) & BIT(7)) == 0)
> +#define DECODE_FAIL_PKT_N(v)	(((v) & BIT(15)) == 0)
>  
>  /* Offsets relative to pbus_base */
>  #define PBUS_CS_CTRL	0x83c
> @@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip, u8 *buf)
>  						  chip->ecc.strength);
>  		if (res < 0)
>  			mtd->ecc_stats.failed++;
> +		else
> +			mtd->ecc_stats.corrected += res;
>  
>  		bitflips = max(res, bitflips);
>  		buf += pkt_size;
> @@ -202,9 +204,10 @@ static int check_erased_page(struct nand_chip *chip, u8 *buf)
>  	return bitflips;
>  }
>  
> -static int decode_error_report(struct tango_nfc *nfc)
> +static int decode_error_report(struct nand_chip *chip, struct tango_nfc *nfc)

You could just pass chip here and extract nfc using to_tango_nfc(), but
that's just a tiny detail.

Looks good otherwise.

Thanks,

Boris

>  {
>  	u32 status, res;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  
>  	status = readl_relaxed(nfc->reg_base + NFC_XFER_STATUS);
>  	if (status & PAGE_IS_EMPTY)
> @@ -212,10 +215,14 @@ static int decode_error_report(struct tango_nfc *nfc)
>  
>  	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);
>  
> -	if (DECODE_OK_PKT_0(res) && DECODE_OK_PKT_N(res))
> -		return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
> +	if (DECODE_FAIL_PKT_0(res) || DECODE_FAIL_PKT_N(res))
> +		return -EBADMSG;
> +
> +	/* ERR_COUNT_PKT_N is max, not sum, but that's all we have */
> +	mtd->ecc_stats.corrected +=
> +		ERR_COUNT_PKT_0(res) + ERR_COUNT_PKT_N(res);
>  
> -	return -EBADMSG;
> +	return max(ERR_COUNT_PKT_0(res), ERR_COUNT_PKT_N(res));
>  }
>  
>  static void tango_dma_callback(void *arg)
> @@ -280,7 +287,7 @@ static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (err)
>  		return err;
>  
> -	res = decode_error_report(nfc);
> +	res = decode_error_report(chip, nfc);
>  	if (res < 0) {
>  		chip->ecc.read_oob_raw(mtd, chip, page);
>  		res = check_erased_page(chip, buf);
