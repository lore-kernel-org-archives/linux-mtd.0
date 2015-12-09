Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6lsD-0003CG-Vf
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 21:02:06 +0000
Received: by oies6 with SMTP id s6so34098584oie.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 13:01:44 -0800 (PST)
Subject: Re: [PATCH linux-next (v2) 1/3] mtd: brcmnand: Add brcm, bcm6368-nand
 device tree binding
To: Simon Arlott <simon@fire.lp0.eu>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
References: <566891DA.1050208@simon.arlott.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jonas Gorski <jogo@openwrt.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <566896B6.9010204@gmail.com>
Date: Wed, 9 Dec 2015 13:01:42 -0800
MIME-Version: 1.0
In-Reply-To: <566891DA.1050208@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 09/12/2015 12:40, Simon Arlott a écrit :
> Add device tree binding for NAND on the BCM6368.
> 
> The BCM6368 has a NAND interrupt register with combined status and enable
> registers. It also requires a clock, so add an optional clock to the
> common brcmnand binding.
> 

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> Changed "nand-intr-base" reg name to "nand-int-base".
> 
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index 4ff7128..ebfa6fc 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -45,6 +45,8 @@ Required properties:
>  - #size-cells      : <0>
>  
>  Optional properties:
> +- clock                     : reference to the clock for the NAND controller
> +- clock-names               : "nand" (required for the above clock)
>  - brcm,nand-has-wp          : Some versions of this IP include a write-protect
>                                (WP) control bit. It is always available on >=
>                                v7.0. Use this property to describe the rare
> @@ -72,6 +74,12 @@ we define additional 'compatible' properties and associated register resources w
>         and enable registers
>       - reg-names: (required) "nand-int-base"
>  
> +   * "brcm,nand-bcm6368"
> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> +       and enable registers, and boot address registers
> +     - reg-names: (required) "nand-int-base"
> +
>     * "brcm,nand-iproc"
>       - reg: (required) the "IDM" register range, for interrupt enable and APB
>         bus access endianness configuration, and the "EXT" register range,
> @@ -148,3 +156,27 @@ nand@f0442800 {
>  		};
>  	};
>  };
> +
> +nand@10000200 {
> +	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm6368",
> +		"brcm,brcmnand-v4.0", "brcm,brcmnand";
> +	reg = <0x10000200 0x180>,
> +	      <0x10000600 0x200>,
> +	      <0x100000b0 0x10>;
> +	reg-names = "nand", "nand-cache", "nand-intr-base";
> +	interrupt-parent = <&periph_intc>;
> +	interrupts = <50>;
> +	clocks = <&periph_clk 20>;
> +	clock-names = "nand";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	nand0: nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength = <1>;
> +		nand-ecc-step-size = <512>;
> +	};
> +};
> 


-- 
Florian
