From: Han Xu <han.xu@nxp.com>
To: Stefan Agner <stefan@agner.ch>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "LW@KARO-electronics.de" <LW@KARO-electronics.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] ARM: dts: imx7: add NAND support
Date: Thu, 1 Jun 2017 21:14:57 +0000
Message-ID: <3c086d95-96e5-71ec-b44f-12ed41903fcf@nxp.com>
References: <20170601192044.6548-1-stefan@agner.ch>
In-Reply-To: <20170601192044.6548-1-stefan@agner.ch>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <747476295435174AA58ABE6DCBF21B41@eurprd04.prod.outlook.com>
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



On 06/01/2017 02:20 PM, Stefan Agner wrote:
> This are the missing device tree parts to add NAND support for i.MX 7.
> See previous patchset:
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml=
.org%2Flkml%2F2017%2F4%2F21%2F832&data=3D01%7C01%7Chan.xu%40nxp.com%7C3b908=
1a68c94476c4a2108d4a9235512%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=3D=
mQ2aq5rW%2B9uADY5mSzFxk8P6bAVq%2BosPJQAi0PL9SQg%3D&reserved=3D0
>
> The previous version also included driver changes, which are already
> merged.
>
> --
> Stefan
>
> Changes since v2:
> - Only specify IMX7D_NAND_USDHC_BUS_ROOT_CLK which seems to be sufficent
Hi Stefan, sorry I didn't reply your last patch. I was unable to fully=20
test on i.MX7 since the work bandwidth, but the quick test shows DMA=20
cannot work WITHOUT IMX7D_NAND_ROOT_CLK on my side, I will fully check=20
it tomorrow morning and let you know the result.
> - Dropped driver changes, alreay merged
>
> Changes since v1:
> - Make clks_count const
> - Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6
>
> Stefan Agner (2):
>    ARM: dts: imx7: add GPMI NAND
>    ARM: dts: imx7-colibri: add NAND support
>
>   arch/arm/boot/dts/imx7-colibri.dtsi |  9 +++++++++
>   arch/arm/boot/dts/imx7s.dtsi        | 31 ++++++++++++++++++++++++++++++=
+
>   2 files changed, 40 insertions(+)
>
