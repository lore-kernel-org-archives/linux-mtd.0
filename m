Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxVv0-0000A7-96
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 07:38:27 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Wed, 27 May 2015 09:37:53 +0200
Message-ID: <5386954.hrl5VLbdYc@wuerfel>
In-Reply-To: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, jogo@openwrt.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 24 May 2015 20:32:29 Hauke Mehrtens wrote:
> @@ -124,17 +124,7 @@
>                         <0x00026000 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
>  
>                         /* Ethernet Controller 3 */
> -                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> -
> -                       /* NAND Controller */
> -                       <0x00028000 0 &gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 1 &gic GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 2 &gic GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 3 &gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 4 &gic GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 5 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 6 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 7 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
>  
>                 chipcommon: chipcommon@0 {
>                         reg = <0x00000000 0x1000>;
> @@ -143,4 +133,30 @@
>                         #gpio-cells = <2>;
>                 };
>         };
> +
> +       nand: nand@18028000 {
> +               compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
> +               reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
> +               reg-names = "nand", "iproc-idm", "iproc-ext";
> +               interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;

I think I'd rather leave the interrupt-map in the brcm node, and use

	interrupts = <0>;

here.

> +               status = "disabled";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               brcm,nand-has-wp;
> +
> +               nandcs@0 {
> +                       compatible = "brcm,nandcs";
> +                       reg = <0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       nand-ecc-strength = <8>;
> +                       nand-ecc-step-size = <512>;
> +
> +                       linux,part-probe = "ofpart", "bcm47xxpart";
> +               };
> +       };

This seems fine in principle, once the exact binding has been nailed down.

"bcm47xxpart" does not seem like an appropriate string here.

	Arnd
