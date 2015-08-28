Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVJYB-00043I-Fx
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 13:18:36 +0000
Subject: Re: [PATCH] mtd: nand: sunxi_nand.c: Select the chip in
 sunxi_nand_chip_init_timings()
To: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
References: <1440765921-10972-1-git-send-email-sr@denx.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Roy Spliet <r.spliet@ultimaker.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55E05F93.5070802@redhat.com>
Date: Fri, 28 Aug 2015 15:18:11 +0200
MIME-Version: 1.0
In-Reply-To: <1440765921-10972-1-git-send-email-sr@denx.de>
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

Hi Stefan,

On 28-08-15 14:45, Stefan Roese wrote:
> nand_scan_ident() leaves the chip deselected. So just issuing some commands
> from the sunxi driver does not work. We need to select the chip before
> writing the commands to the NAND device. This patch takes care of this.
>
> Set the new timing on all dies implemented as suggested by Boris.
>
> This was detected on the in-circuit ICnova-A20 SoM equipped with the
> Micron MT29F32G08CBACAWP (4GiB) ONFI NAND device.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Roy Spliet <r.spliet@ultimaker.com>
> Cc: Brian Norris <computersforpeace@gmail.com>

This one has some whitespace errors, so you may want todo a v2:

[hans@shalem linux]$ git am ~/1.eml
Applying: mtd: nand: sunxi_nand.c: Select the chip in sunxi_nand_chip_init_timings()
/home/hans/projects/sunxi/linux/.git/rebase-apply/patch:29: space before tab in indent.
  						ONFI_FEATURE_ADDR_TIMING_MODE,
/home/hans/projects/sunxi/linux/.git/rebase-apply/patch:30: space before tab in indent.
  						feature);
warning: 2 lines add whitespace errors.

Regards,

Hans


> ---
>   drivers/mtd/nand/sunxi_nand.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> index f97a58d..6e7941b 100644
> --- a/drivers/mtd/nand/sunxi_nand.c
> +++ b/drivers/mtd/nand/sunxi_nand.c
> @@ -978,17 +978,23 @@ static int sunxi_nand_chip_init_timings(struct sunxi_nand_chip *chip,
>   		mode = chip->nand.onfi_timing_mode_default;
>   	} else {
>   		uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {};
> +		int i;
>
>   		mode = fls(mode) - 1;
>   		if (mode < 0)
>   			mode = 0;
>
>   		feature[0] = mode;
> -		ret = chip->nand.onfi_set_features(&chip->mtd, &chip->nand,
> -						ONFI_FEATURE_ADDR_TIMING_MODE,
> -						feature);
> -		if (ret)
> -			return ret;
> +		for (i = 0; i < chip->nsels; i++) {
> +			chip->nand.select_chip(&chip->mtd, i);
> +			ret = chip->nand.onfi_set_features(&chip->mtd,
> +						&chip->nand,
> + 						ONFI_FEATURE_ADDR_TIMING_MODE,
> + 						feature);
> +			chip->nand.select_chip(&chip->mtd, -1);
> +			if (ret)
> +				return ret;
> +		}
>   	}
>
>   	timings = onfi_async_timing_mode_to_sdr_timings(mode);
>
