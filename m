Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxFBr-00084M-Ph
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 15:23:38 +0000
Subject: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
To: =?UTF-8?Q?Jo=c3=abl_Esponde?= <joel.esponde@honeywell.com>,
 <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
Date: Thu, 20 Oct 2016 17:23:08 +0200
MIME-Version: 1.0
In-Reply-To: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joël,

Le 20/10/2016 à 15:43, Joël Esponde a écrit :
> With the S25FL127S nor flash part, each writing to the configuration register takes hundreds of ms. During that  time, no more accesses to the flash should be done (even reads).
> 
> This commit adds:
> - a pre check of the quad enable bit to avoid a useless and time consuming writing to the flash,
> - a wait loop after the register writing until the flash finishes its work.
> 
> This issue could make rootfs mounting fail when the latter was done too much closely to this quad enable bit setting step. And in this case, a driver as UBIFS may try to recover the filesystem and may broke it completely.
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d0fc165..df43cd7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1246,18 +1246,41 @@ static int spansion_quad_enable(struct spi_nor *nor)
>  	int ret;
>  	int quad_en = CR_QUAD_EN_SPAN << 8;
>  
> +	/* check quad enable bit
> +	 * as S25FL127S takes 200 ms to execute each write of SR & CR 
> +	 * registers even if data is the same, write step will be shorted 
> +	 * if not needed
> +	 */
> +	ret = read_cr(nor);

Sorry but the Read Configuration Register (35h) command is not supported by
all Spansion (or Spansion-like) memories.

For more details, please refer to the JEDEC JESD216B specification, especially
the part dealing with the "Quad Enable Requirements". An extract of this
specification can also be found in this patch:
https://patchwork.ozlabs.org/patch/678408/

Please have a look at values 001b, 100b and 101b for the bits[22:20] of the
15th DWORD.

I think your patch is likely to introduce a regression on some old memory
parts.

However, *if* your S25FL127S memory implements the SFDP tables correctly,
bits[22:20] of the 15th DWORD should be set to 101b, hence using SFDP patch
above should fix the issue:
spansion_new_quad_enable() will be called instead of the current
spansion_quad_enable(). This new function adds the very same test on the Quad
Enable bit as your patch does.

If you want to test the SFDP patch, you will need to apply the whole series
which introduces some improvement on QSPI memory support:
http://lists.infradead.org/pipermail/linux-mtd/2016-October/069554.html

I'm just cautious with Spansion memories: I tested one sample, and I guess
it was a S25FL127S, which claimed to be compliant with JESD216 rev B (minor 6)
but words after the 9th one were all 0xffffffff.
JESD216 (minor 0) describes only 9 DWORDs in the Basic Flash Parameter Table
JESD216 rev A (minor 5) introduces 7 new DWORDS, hence 16 DWORDS in the (BFPT).
the 15th DWORD provides the Quad Enable Requirements, which describes the
procedure to set the Quad Enable bit.

If the BFPT of your S25FL127S is incomplete but the memory still claiming to be
JESD216 rev B compliant, neither spansion_quad_enable() nor
spansion_new_quad_enable() would be called. Since the Quad Enable bit is
non-volatile on Spansion memories, it will work if the bit as already been set
before.


Best regards,

Cyrille

> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading CR\n", ret);
> +		return ret;
> +	} 
> +	if (ret & CR_QUAD_EN_SPAN) {
> +		/* quad enable bit is already set */
> +		return 0;
> +	}
> +
> +	/* set SR & CR, enable quad I/O */
>  	write_enable(nor);
>  
>  	ret = write_sr_cr(nor, quad_en);
>  	if (ret < 0) {
> -		dev_err(nor->dev,
> -			"error while writing configuration register\n");
> +		dev_err(nor->dev, "error while writing SR and CR registers\n");
>  		return -EINVAL;
>  	}
>  
> -	/* read back and check it */
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret)
> +		return ret;
> +	
> +	/* read CR and check it */
>  	ret = read_cr(nor);
> -	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
> +	if (ret < 0) {
> +		dev_err(nor->dev, "error %d reading CR\n", ret);
> +		return ret;
> +	}
> +	if (!(ret & CR_QUAD_EN_SPAN)) {
>  		dev_err(nor->dev, "Spansion Quad bit not set\n");
>  		return -EINVAL;
>  	}
> 
