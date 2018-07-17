Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffP3y-0003Gh-Rx
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:26:44 +0000
Date: Tue, 17 Jul 2018 14:26:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: rawnand: add default values for dynamic timings
Message-ID: <20180717142621.380adf1e@bbrezillon>
In-Reply-To: <20180714102354.12323-1-miquel.raynal@bootlin.com>
References: <20180714102354.12323-1-miquel.raynal@bootlin.com>
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

On Sat, 14 Jul 2018 12:23:54 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Some timings like tBERS (block erase time), tCCs (change column setup
> time), tPROG (page program time) and tR (page read time) are derived
> from the ONFI parameter page. They are set in the SDR interface only
> if the chip is ONFI compliant.
> 
> It makes these timings unreliable and prevent the driver to use one of
> these four values with a non-ONFI chip.
> 
> Fix this situation by taking the highest possible value (or a default
> one) value for each missing timing (stored as unsigned 16-bit entries in
> the parameter page).
> 
> This makes tBERS and tPROG being ~65ms while typical values are at most
> a few milliseconds. As these are timeouts, it is not impacting at all
> the performances in nominal use.
> 
> tR maximum time and tCCS minimum time (delay to wait after a change
> column) are set, according to the ONFI specification, to default 'slow'
> values; respectively 200us and 500ns.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> 
> Changes since v1
> ================
> * Remove in the commit message a wrong assertion on which the problem
>   depicted above happened when no ->setup_data_inferface() hook was set.
> * The missing timings were set, for each timing mode, in the
>   onfi_sdr_timings structure, not it is done in an else block in
>   onfi_fill_data_interface() once.
> * Changed tR and tCCS to be 'timing mode 0' values by default (should
>   limit the impact of such a change in throughputs).
> 
> 
>  drivers/mtd/nand/raw/nand_timings.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 7c4e4a371bbc..9bb599106a31 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -13,6 +13,8 @@
>  #include <linux/export.h>
>  #include <linux/mtd/rawnand.h>
>  
> +#define ONFI_DYN_TIMING_MAX U16_MAX
> +
>  static const struct nand_data_interface onfi_sdr_timings[] = {
>  	/* Mode 0 */
>  	{
> @@ -303,7 +305,7 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  
>  	/*
>  	 * Initialize timings that cannot be deduced from timing mode:
> -	 * tR, tPROG, tCCS, ...
> +	 * tPROG, tBERS, tR and tCCS.
>  	 * These information are part of the ONFI parameter page.
>  	 */
>  	if (chip->parameters.onfi.version) {
> @@ -317,6 +319,22 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  
>  		/* nanoseconds -> picoseconds */
>  		timings->tCCS_min = 1000UL * params->onfi.tCCS;
> +	} else {
> +		struct nand_sdr_timings *timings = &iface->timings.sdr;
> +		/*
> +		 * For non-ONFI chips we use the highest possible value for
> +		 * tPROG and tBERS. tR and tCCS will take the default values
> +		 * precised in the ONFI specification for timing mode 0,
> +		 * respectively 200us and 500ns.
> +		 */
> +
> +		/* microseconds -> picoseconds */
> +		timings->tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX;
> +		timings->tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX;
> +		timings->tR_max = 1000000ULL * 200000000ULL;
> +
> +		/* nanoseconds -> picoseconds */
> +		timings->tCCS_min = 1000UL * 500000;
>  	}
>  
>  	return 0;
