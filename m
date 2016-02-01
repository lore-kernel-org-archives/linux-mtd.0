Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQIft-00061a-R4
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 17:54:06 +0000
Received: by mail-pf0-x22b.google.com with SMTP id 65so87458092pfd.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 09:53:45 -0800 (PST)
Date: Mon, 1 Feb 2016 09:53:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: brcmnand: set initial ECC params based on info from
 HW
Message-ID: <20160201175342.GF19540@google.com>
References: <1453881500-11736-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1453881500-11736-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 27, 2016 at 08:58:20AM +0100, Rafał Miłecki wrote:
> So far we were depending on nand_dt_init getting ECC info from DT and
> setting it in ECC struct. It is possible to simply read this info from
> hardware registers which makes adding support for new hardware way
> easier (no more guessing & trying all combinations).
> Please note it still gives a precedence to DT which was overwrite
> whatever was initially set by the driver.

Precedence of DT is extremely important, but even with that, I'm not
sure it's a great idea to support this by default. It's very error prone
to rely on HW defaults at boot time; they might be left at their reset
values.

Anyway, if we are really making the DT properties optional, we'd need to
modify Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt to
reflect this.

> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> It took me hours to figure out how to setup NAND on my D-Link DIR-885L.
> This should be very helpful for ppl adding new devices support.

What if we just print out the hardware defaults when we bail out due to
missing ECC DT properties? Then developers can choose to set up their DT
with these properties, if those are actually proven correct. Would that
save you the hours of setup you mention?

Another option: maybe a commandline boot flag?

> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 844fc07..f358cda 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -615,6 +615,17 @@ static inline u32 brcmnand_ecc_level_mask(struct brcmnand_controller *ctrl)
>  	return mask << NAND_ACC_CONTROL_ECC_SHIFT;
>  }
>  
> +static int brcmnand_get_ecc_strength(struct brcmnand_host *host)
> +{
> +	struct brcmnand_controller *ctrl = host->ctrl;
> +	u32 mask = brcmnand_ecc_level_mask(ctrl);
> +	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
> +						  BRCMNAND_CS_ACC_CONTROL);
> +
> +	return (nand_readreg(ctrl, acc_control_offs) & mask) >>
> +		NAND_ACC_CONTROL_ECC_SHIFT;

This is wrong. You ignore Hamming ECC and 1K sector sizes. With Hamming
ECC, you need to translate a value of '15' to 'strength = 1'. And with
1K sector sizes, you need to translate a value of 'N' to 'strength = N *
2'.

> +}
> +
>  static void brcmnand_set_ecc_enabled(struct brcmnand_host *host, int en)
>  {
>  	struct brcmnand_controller *ctrl = host->ctrl;
> @@ -1960,6 +1971,9 @@ static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
>  	nand_writereg(ctrl, cfg_offs,
>  		      nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH);
>  
> +	chip->ecc.strength = brcmnand_get_ecc_strength(host);
> +	chip->ecc.size = brcmnand_get_sector_size_1k(host) ? 1024 : 512;
> +
>  	if (nand_scan_ident(mtd, 1, NULL))
>  		return -ENXIO;
>  

Brian
