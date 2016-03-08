Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adJ88-00035x-VT
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 15:01:02 +0000
Date: Tue, 8 Mar 2016 16:00:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
Message-ID: <20160308160038.29374f04@bbrezillon>
In-Reply-To: <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Hi Jorge,

On Wed,  2 Mar 2016 12:00:11 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds documentation support for Smart Device Gen1 type of
> NAND controllers.
> 
> Mediatek's SoC 2701 is one of the SoCs that implements this controller.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../devicetree/bindings/mtd/mtksdg1-nand.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> new file mode 100644
> index 0000000..129d17b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> @@ -0,0 +1,38 @@
> +MTK Smart Device SoCs NAND controller DT binding
> +
> +Required properties:
> +- compatible:          Should be "mediatek,mt2701-nfc".
> +- reg:                 The first contains base physical address and size of
> +                       NAND controller's registers. The second contains base
> +                       physical address and size of NAND ECC engine.
> +- interrupts:          the NFC NFI interrupt, and the NFC ECC interrupt
> +- clocks:              NAND controller clocks.
> +- clock-names:         NAND controller clocks internal name.
> +- vmch-supply:         NAND power supply.
> +- #address-cells:      Partition address, should be set 1.
> +- #size-cells:         Partition size, should be set 1.
> +
> +Optional properties:
> +
> +nand-on-flash-bbt:  Use a flash based bad block table.
> +
> +Optional subnodes:
> +- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +
> +	nand: nand@1100d000 {
> +		compatible = "mediatek,mt2701-nfc";
> +		reg = <0 0x1100d000 0 0x1000>, <0 0x1100e000 0 0x1000>;
> +		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_NFI>, <&pericfg CLK_PERI_NFI_ECC>,
> +			<&pericfg CLK_PERI_NFI_PAD>;
> +		clock-names = "nfi_ck", "nfi_ecc_ck", "nfi_pad_ck";
> +		vmch-supply = <&mt6323_vmch_reg>;
> +		status = "disabled";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		...
> +	};

We're trying to enforce the NAND controller and NAND chip separation
for all new NAND controller drivers, and representing those 2 elements
in the DT is now the preferred approach.

You can have a look at the sunxi-nand bindings [1].

Thanks,

Boris

[1]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/sunxi-nand.txt

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
