Date: Tue, 12 Apr 2016 01:15:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] mtd: mediatek: device tree docs for MTK Smart
 Device Gen1 NAND
Message-ID: <20160412011500.24b29157@bbrezillon>
In-Reply-To: <1460393772-26910-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

On Mon, 11 Apr 2016 12:56:11 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds documentation support for Smart Device Gen1 type of
> NAND controllers.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/mtk-nand.txt | 145 +++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> new file mode 100644
> index 0000000..ca3cc95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
> @@ -0,0 +1,145 @@
> +MTK SoCs NAND FLASH controller (NFC) DT binding
> +
> +This file documents the device tree bindings for MTK SoCs NAND controllers.
> +The functional split of the controller requires two drivers to operate:
> +the nand controller interface driver and the ECC engine driver.
> +
> +The hardware description for both devices must be captured as device
> +tree nodes.
> +
> +1) NFC NAND Controller Interface (NFI):
> +=======================================
> +
> +The first part of NFC is NAND Controller Interface (NFI) HW.
> +Required NFI properties:
> +- compatible:			Should be "mediatek,mtxxxx-nfc".
> +- reg:				Base physical address and size of NFI.
> +- interrupts:			Interrupts of NFI.
> +- clocks:			NFI required clocks.
> +- clock-names:			NFI clocks internal name.
> +- status:			Disabled default. Then set "okay" by platform.
> +- ecc-engine:			Required ECC Engine node.
> +- #address-cells:		NAND chip index, should be 1.
> +- #size-cells:			Should be 0.
> +
> +Example:
> +
> +	nandc: nfi@1100d000 {
> +		compatible = "mediatek,mt2701-nfc";
> +		reg = <0 0x1100d000 0 0x1000>;
> +		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_NFI>,
> +			 <&pericfg CLK_PERI_NFI_PAD>;
> +		clock-names = "nfi_clk", "pad_clk";
> +		status = "disabled";
> +		ecc-engine = <&bch>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +        };
> +
> +Platform related properties, should be set in {platform_name}.dts:
> +- children nodes:	NAND chips.
> +
> +Children nodes properties:
> +- reg:			Chip Select Signal, default 0.
> +			Set as reg = <0>, <1> when need 2 CS.
> +- spare_per_sector:	Spare size of each sector.

Do you really need this property? It should be deduced from ECC
strength/step-size and oobsize info (or any other NFC/ECC constraints).


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
