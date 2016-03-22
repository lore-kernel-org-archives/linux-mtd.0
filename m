Date: Tue, 22 Mar 2016 14:52:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFCv2: PATCH 1/2] mtd: mediatek: device tree docs for MTK
 Smart Device Gen1 NAND
Message-ID: <20160322145258.44945c64@bbrezillon>
In-Reply-To: <1458653560-2679-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

On Tue, 22 Mar 2016 09:32:39 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds documentation support for Smart Device Gen1 type of
> NAND controllers.
> 
> Mediatek's SoC 2701 is one of the SoCs that implements this controller.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  .../devicetree/bindings/mtd/mtksdg1-nand.txt       | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> new file mode 100644
> index 0000000..be6c579
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
> @@ -0,0 +1,143 @@
> +MTK Smart Device SoCs NAND FLASH controller (NFC) DT binding
> +
> +This file documents the device tree bindings for the Smart Device Gen1
> +NAND controllers. The functional split of the controller requires two
> +drivers to operate: the nand controller interface driver and the ECC
> +controller driver.
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
> +- mediatek,ecc-controller:	Required ECC Engine node.
> +- #address-cells:		NAND chip index, should be 1.
> +- #size-cells:			Should be 0.
> +
> +Example:
> +
> +	nand: nfi@1100d000 {

I would name it nandc or nand-controller instead of just nand, to make
it clear that it's representing the NAND controller.

> +		compatible = "mediatek,mt2701-nfc";
> +		reg = <0 0x1100d000 0 0x1000>;
> +		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_NFI>,
> +			 <&pericfg CLK_PERI_NFI_PAD>;
> +		clock-names = "nfi_clk", "pad_clk";
> +		nand-on-flash-bbt;
> +		status = "disabled";
> +		mediatek,ecc-controller = <&bch>;

Now that 2 different drivers use the same way to link the ECC engine
and the NAND controller we can think about defining a generic property
(ecc-engine ?), and provide a generic framework.

The generic framework part is not something I'm asking right now, but I
think we should start using a generic property here.

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
> +- nand-ecc-strength:	Number of bits to correct per ECC step.
> +- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
> +
> +Optional:
> +- vmch-supply:		NAND power supply.
> +- pinctrl-names:	Default NAND pin GPIO setting name.
> +- pinctrl-0:		GPIO setting node.
> +
> +Example:
> +	&pio {
> +		nand_pins_default: nanddefault {
> +			pins_dat {
> +				pinmux = <MT2701_PIN_111_MSDC0_DAT7__FUNC_NLD7>,
> +					 <MT2701_PIN_112_MSDC0_DAT6__FUNC_NLD6>,
> +					 <MT2701_PIN_114_MSDC0_DAT4__FUNC_NLD4>,
> +					 <MT2701_PIN_118_MSDC0_DAT3__FUNC_NLD3>,
> +					 <MT2701_PIN_121_MSDC0_DAT0__FUNC_NLD0>,
> +					 <MT2701_PIN_120_MSDC0_DAT1__FUNC_NLD1>,
> +					 <MT2701_PIN_113_MSDC0_DAT5__FUNC_NLD5>,
> +					 <MT2701_PIN_115_MSDC0_RSTB__FUNC_NLD8>,
> +					 <MT2701_PIN_119_MSDC0_DAT2__FUNC_NLD2>;
> +				input-enable;
> +				drive-strength = <MTK_DRIVE_8mA>;
> +				bias-pull-up;
> +			};
> +
> +			pins_we {
> +				pinmux = <MT2701_PIN_117_MSDC0_CLK__FUNC_NWEB>;
> +				drive-strength = <MTK_DRIVE_8mA>;
> +				bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> +			};
> +
> +			pins_ale {
> +				pinmux = <MT2701_PIN_116_MSDC0_CMD__FUNC_NALE>;
> +				drive-strength = <MTK_DRIVE_8mA>;
> +				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			};
> +		};
> +	};
> +
> +	&nand {
> +		status = "okay";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&nand_pins_default>;
> +		chip@0 {

With the parent renamed, you can just use nand@X here.

> +			reg = <0>;
> +			spare_per_sector = <56>;
> +			nand-ecc-strength = <24>;
> +			nand-ecc-step-size = <1024>;
> +		};
> +	};
> +
> +NAND chip optional subnodes:
> +- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +	chip@0 {
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			preloader@0 {
> +				label = "pl";
> +				read-only;
> +				reg = <0x00000000 0x00400000>;
> +			};
> +			android@0x00400000 {
> +				label = "android";
> +				reg = <0x00400000 0x12c00000>;
> +			};
> +		};
> +	};
> +
> +2) ECC Engine:
> +==============
> +
> +Required BCH properties:
> +- compatible:	Should be "mediatek,mtxxxx-ecc".
> +- reg:		Base physical address and size of ECC.
> +- interrupts:	Interrupts of ECC.
> +- clocks:	ECC required clocks.
> +- clock-names:	ECC clocks internal name.
> +- status:	Disabled default. Then set "okay" by platform.
> +
> +Example:
> +
> +	bch: ecc@1100e000 {
> +		compatible = "mediatek,mt2701-ecc";
> +		reg = <0 0x1100e000 0 0x1000>;
> +		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&pericfg CLK_PERI_NFI_ECC>;
> +		clock-names = "nfiecc_clk";
> +		status = "disabled";
> +	};

Otherwise the bindings look good to me.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
