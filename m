Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvvHw-0005Tq-Px
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 19:38:16 +0000
Received: from mail622.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 8242BFF9B84
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2013 20:51:40 +0100 (CET)
Date: Thu, 17 Jan 2013 20:36:40 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2 3/3] at91: at91sam9n12: add DT parameters to enable
 PMECC
Message-ID: <20130117193640.GG7360@game.jcrosoft.org>
References: <1358393072-14794-1-git-send-email-josh.wu@atmel.com>
 <1358393072-14794-4-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358393072-14794-4-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11:24 Thu 17 Jan     , Josh Wu wrote:
> Default ecc correctable setting is 2bits in 512 bytes.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
this must go via at91 tree

so we can manage other mergie issue on dts

Best Regards,
J.
> ---
> change log:
>    v2: rebase to v3.8-rc3
> 
>  arch/arm/boot/dts/at91sam9n12.dtsi  |    1 +
>  arch/arm/boot/dts/at91sam9n12ek.dts |    5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
> index e9efb34..eb9f12e 100644
> --- a/arch/arm/boot/dts/at91sam9n12.dtsi
> +++ b/arch/arm/boot/dts/at91sam9n12.dtsi
> @@ -366,6 +366,7 @@
>  				0xffffe600 0x00000200
>  				0x00100000 0x00100000
>  			       >;
> +			atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
>  			atmel,nand-addr-offset = <21>;
>  			atmel,nand-cmd-offset = <22>;
>  			pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
> index 0376bf4..d400f8d 100644
> --- a/arch/arm/boot/dts/at91sam9n12ek.dts
> +++ b/arch/arm/boot/dts/at91sam9n12ek.dts
> @@ -71,7 +71,10 @@
>  
>  		nand0: nand@40000000 {
>  			nand-bus-width = <8>;
> -			nand-ecc-mode = "soft";
> +			nand-ecc-mode = "hw";
> +			atmel,has-pmecc;
> +			atmel,pmecc-cap = <2>;
> +			atmel,pmecc-sector-size = <512>;
>  			nand-on-flash-bbt;
>  			status = "okay";
>  		};
> -- 
> 1.7.9.5
> 
