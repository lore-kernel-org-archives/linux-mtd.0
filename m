From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "sboyd@codeaurora.org" <sboyd@codeaurora.org>
CC: "A.S. Dong" <aisheng.dong@nxp.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "fabio.estevam@freescale.com"
 <fabio.estevam@freescale.com>, "LW@KARO-electronics.de"
 <LW@KARO-electronics.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
Date: Wed, 7 Jun 2017 15:33:26 +0000
Message-ID: <9d66efda-d7c1-89a2-e163-c86056e08fb1@nxp.com>
References: <cover.b62c3a17bd60de48d8fb2ade6dde4f2bc60aaf3c.1496730576.git-series.stefan@agner.ch>
 <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
In-Reply-To: <151ddece1e1427d0b69c4ff11b86a69b6a035d0d.1496730576.git-series.stefan@agner.ch>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <F00862B47729364989D44108CF5F95EC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 06/06/2017 01:30 AM, Stefan Agner wrote:
> Add i.MX 7 APBH DMA and GPMI NAND modules.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index c4f12fd..d71acd8 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -995,5 +995,37 @@
>   				status =3D "disabled";
>   			};
>   		};
> +
> +		dma_apbh: dma-apbh@33000000 {
> +			compatible =3D "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
> +			reg =3D <0x33000000 0x2000>;
> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "gpmi0", "gpmi1", "gpmi2", "gpmi3";
> +			#dma-cells =3D <1>;
> +			dma-channels =3D <4>;
> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";

please remove the clock names, I am good with all other changes.

> +		};
> +
> +		gpmi: gpmi-nand@33002000{
> +			compatible =3D "fsl,imx7d-gpmi-nand";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
> +			reg-names =3D "gpmi-nand", "bch";
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "bch";
> +			clocks =3D <&clks IMX7D_NAND_RAWNAND_CLK>,
> +				<&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
> +			dmas =3D <&dma_apbh 0>;
> +			dma-names =3D "rx-tx";
> +			status =3D "disabled";
> +			assigned-clocks =3D <&clks IMX7D_NAND_ROOT_SRC>;
> +			assigned-clock-parents =3D <&clks IMX7D_PLL_ENET_MAIN_500M_CLK>;
> +		};
>   	};
>   };
