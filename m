From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "fabio.estevam@freescale.com"
 <fabio.estevam@freescale.com>, "LW@KARO-electronics.de"
 <LW@karo-electronics.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: imx7: add GPMI NAND
Date: Thu, 4 May 2017 22:59:52 +0000
Message-ID: <8f039bb6-9bc3-349a-cfe8-727e4caf41de@nxp.com>
References: <20170422012338.4635-1-stefan@agner.ch>
 <20170422012338.4635-5-stefan@agner.ch>
 <c66ca9c8-2a9f-8938-7a70-7f9dfe763457@nxp.com>
 <48b5c543e713f9597b67a39a51ffd521@agner.ch>
In-Reply-To: <48b5c543e713f9597b67a39a51ffd521@agner.ch>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <7FDEF8E0A9E31246B4C0971E3F6F7D6B@eurprd04.prod.outlook.com>
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



On 05/04/2017 04:50 PM, Stefan Agner wrote:
> On 2017-05-04 12:13, Han Xu wrote:
>> On 04/21/2017 08:23 PM, Stefan Agner wrote:
>>> Add i.MX 7 GPMI NAND module.
>>>
>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>> ---
>>>    arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
>>>    1 file changed, 31 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dts=
i
>>> index 843eb379e1ea..9645257638d4 100644
>>> --- a/arch/arm/boot/dts/imx7s.dtsi
>>> +++ b/arch/arm/boot/dts/imx7s.dtsi
>>> @@ -995,5 +995,36 @@
>>>    				status =3D "disabled";
>>>    			};
>>>    		};
>>> +
>>> +		dma_apbh: dma-apbh@33000000 {
>>> +			compatible =3D "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
>>> +			reg =3D <0x33000000 0x2000>;
>>> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "gpmi0", "gpmi1", "gpmi2", "gpmi3";
>>> +			#dma-cells =3D <1>;
>>> +			dma-channels =3D <4>;
>>> +			clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
>>> +				<&clks IMX7D_NAND_ROOT_CLK>;
>>> +			clock-names =3D "dma_apbh_bch", "dma_apbh_io";
>>> +		};
>> Do you need some patches to enable all clks for APBH DMA? Refer to
>> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.ozlabs.org%2Fpatch%2F551967%2F&data=3D01%7C01%7Chan.xu%40nxp.com%7C9=
8493f7e475341dbf67008d49337b441%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdat=
a=3DFH9k%2FC4VcVCeyidkRgUJ5Ahu4%2B%2FlDAjXVwO0DY7XMhA%3D&reserved=3D0
>>
> Oh I see, with the current code and this device tree we actually only
> enable the first clock... But it seems to work in practice...
>
> What is interesting, the chapter 5.2.5 System Clocks only describes
> APBHDMA, and no GPMI module.
>
> Chapter 9.4 about APBH-Bridge-DMA bridge only specifies "hclk" as clock
> sources.
>
> When looking at the table in chapter 5.2.5, hclk is
> NAND_USDHC_BUS_CLK_ROOT
>
> Module    Syste Module Clock   Clock Root
> APBHDMA   apbhdma.hclk         NAND_USDHC_BUS_CLK_ROOT
>  =20
> So my guess is that the actual DMA controller should work fine with
> IMX7D_NAND_USDHC_BUS_ROOT_CLK only. It is only the GPMI module which
> needs the NAND_ROOT_CLK. My guess is since the APBHDMA controller is
> only used for GPMI these days, it has been combined in one module in the
> table in chapter 5.2.5.
>
> So we could actually only specify:
>
> clocks =3D <&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
>
> Tested with this and NAND seems to work fine.
>
> Also tested accessing APBHDMA register in U-Boot with
> IMX7D_NAND_ROOT_CLK disabled, it worked fine.
>
> What do you think? Should we go with this?
>
> This probably even saves power since GPMI's runtime clock management
> disables IMX7D_NAND_ROOT_CLK when NAND is idle (according to the
> nand_root_clk counter in clk_summary and the root clock register at
> 0x3038AA00).

It also surprised me how it can work on your side, I remember we made=20
the code change for some purpose, please give me some time I can check=20
if the doc is wrong.

> --
> Stefan
>
>>> +
>>> +		gpmi: gpmi-nand@33002000{
>>> +			compatible =3D "fsl,imx7d-gpmi-nand";
>>> +			#address-cells =3D <1>;
>>> +			#size-cells =3D <1>;
>>> +			reg =3D <0x33002000 0x2000>, <0x33004000 0x4000>;
>>> +			reg-names =3D "gpmi-nand", "bch";
>>> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>>> +			interrupt-names =3D "bch";
>>> +			clocks =3D <&clks IMX7D_NAND_ROOT_CLK>,
>>> +				<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>;
>>> +			clock-names =3D "gpmi_io", "gpmi_bch_apb";
>>> +			dmas =3D <&dma_apbh 0>;
>>> +			dma-names =3D "rx-tx";
>>> +			status =3D "disabled";
>>> +		};
>>>    	};
>>>    };
