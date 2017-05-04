From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "LW@KARO-electronics.de" <LW@KARO-electronics.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: imx7: add GPMI NAND
Date: Thu, 4 May 2017 19:13:16 +0000
Message-ID: <c66ca9c8-2a9f-8938-7a70-7f9dfe763457@nxp.com>
References: <20170422012338.4635-1-stefan@agner.ch>
 <20170422012338.4635-5-stefan@agner.ch>
In-Reply-To: <20170422012338.4635-5-stefan@agner.ch>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <4865F377CEBB87448E2D391CA8CA02FE@eurprd04.prod.outlook.com>
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



On 04/21/2017 08:23 PM, Stefan Agner wrote:
> Add i.MX 7 GPMI NAND module.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>   arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 843eb379e1ea..9645257638d4 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -995,5 +995,36 @@
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
> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
> +				<&clks IMX7D_NAND_ROOT_CLK>;
> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";
> +		};
Do you need some patches to enable all clks for APBH DMA? Refer to=20
https://patchwork.ozlabs.org/patch/551967/

> +
> +		gpmi: gpmi-nand@33002000{
> +			compatible =3D "fsl,imx7d-gpmi-nand";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
> +			reg-names =3D "gpmi-nand", "bch";
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "bch";
> +			clocks =3D <&clks IMX7D_NAND_ROOT_CLK>,
> +				<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
> +			dmas =3D <&dma_apbh 0>;
> +			dma-names =3D "rx-tx";
> +			status =3D "disabled";
> +		};
>   	};
>   };
