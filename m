Received: from 9.mo3.mail-out.ovh.net ([87.98.184.141]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TvvJL-0005mg-Lb
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 19:39:43 +0000
Received: from mail622.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id C1FC5FF9A3E
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2013 20:53:11 +0100 (CET)
Date: Thu, 17 Jan 2013 20:38:14 +0100
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2 2/3] at91: 9x5: add DT parameters to enable PMECC
Message-ID: <20130117193814.GH7360@game.jcrosoft.org>
References: <1358393072-14794-1-git-send-email-josh.wu@atmel.com>
 <1358393072-14794-3-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358393072-14794-3-git-send-email-josh.wu@atmel.com>
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
full name sam the soc
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
> change log:
>    v2: rebase to v3.8-rc3
> 
>  arch/arm/boot/dts/at91sam9x5.dtsi   |    4 ++++
>  arch/arm/boot/dts/at91sam9x5cm.dtsi |    5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
> index 40ac3a4..eedc191 100644
> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> @@ -480,7 +480,11 @@
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			reg = <0x40000000 0x10000000
> +			       0xffffe000 0x600		/* PMECC Registers */
> +			       0xffffe600 0x200		/* PMECC Error Location Registers */
> +			       0x00100000 0x100000	/* ROM code */
I do not like this at all we request 1M of memory where we jsut need a few for
the tables

Best Regards,
J.
>  			      >;
> +			atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
>  			atmel,nand-addr-offset = <21>;
>  			atmel,nand-cmd-offset = <22>;
>  			pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/at91sam9x5cm.dtsi b/arch/arm/boot/dts/at91sam9x5cm.dtsi
> index 31e7be2..4027ac7 100644
> --- a/arch/arm/boot/dts/at91sam9x5cm.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5cm.dtsi
> @@ -26,7 +26,10 @@
>  	ahb {
>  		nand0: nand@40000000 {
>  			nand-bus-width = <8>;
> -			nand-ecc-mode = "soft";
> +			nand-ecc-mode = "hw";
> +			atmel,has-pmecc;	/* Enable PMECC */
> +			atmel,pmecc-cap = <2>;
> +			atmel,pmecc-sector-size = <512>;
>  			nand-on-flash-bbt;
>  			status = "okay";
>  
> -- 
> 1.7.9.5
> 
