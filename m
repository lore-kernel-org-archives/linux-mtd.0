Message-ID: <55BB2D15.2020408@atmel.com>
Date: Fri, 31 Jul 2015 10:08:53 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <zajec5@gmail.com>, <beanhuo@micron.com>,
 <juhosg@openwrt.org>, <marex@denx.de>, <shijie.huang@intel.com>,
 <ben@decadent.org.uk>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
 <mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
 <galak@codeaurora.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 4/5] Documentation: atmel-quadspi: add binding file
 for Atmel QSPI driver
References: <cover.1437986785.git.cyrille.pitchen@atmel.com>
 <a5ece7085956e97f35ecd5ddb41abd28a7c402a8.1437986785.git.cyrille.pitchen@atmel.com>
In-Reply-To: <a5ece7085956e97f35ecd5ddb41abd28a7c402a8.1437986785.git.cyrille.pitchen@atmel.com>
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

Le 27/07/2015 10:59, Cyrille Pitchen a écrit :
> This patch documents the DT bindings for the driver of the Atmel QSPI
> controller embedded inside sama5d2x SoCs.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Yes, it seems good:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

> ---
>  .../devicetree/bindings/mtd/atmel-quadspi.txt      | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> new file mode 100644
> index 000000000000..0b8d545bb198
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> @@ -0,0 +1,29 @@
> +* Atmel Quad Serial Peripheral Interface (QSPI)
> +
> +Required properties:
> +- compatible:     should be "atmel,sama5d2-qspi"
> +- reg:            the first contains the register location and length,
> +                  the second contains the memory mapping address and length
> +- interrupts:     should contain the interrupt for the device
> +- clocks:         the phandle of the clock needed by the QSPI controller
> +- #address-cells: should be <1>
> +- #size-cells:    should be <0>
> +
> +Example:
> +
> +spi@f0020000 {
> +	compatible = "atmel,sama5d2-qspi";
> +	reg = <0xf0020000 0x100>,
> +	      <0xd0000000 0x8000000>;
> +	interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
> +	clocks = <&spi0_clk>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi0_default>;
> +	status = "okay";
> +
> +	m25p80@0 {
> +		...
> +	};
> +};
> 


-- 
Nicolas Ferre
