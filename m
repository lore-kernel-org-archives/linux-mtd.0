Date: Wed, 3 May 2017 21:25:15 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@atmel.com, robh+dt@kernel.org,
 mark.rutland@arm.com, kernel@pengutronix.de, han.xu@nxp.com,
 fabio.estevam@freescale.com, LW@KARO-electronics.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mtd: nand: gpmi: add i.MX 7 support
Message-ID: <20170503132513.GE24392@dragon>
References: <20170422012338.4635-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170422012338.4635-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 21, 2017 at 06:23:33PM -0700, Stefan Agner wrote:
> This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
> There have been similar patchsets already:
> https://lkml.org/lkml/2016/2/23/912
> 
> However, this patchset does not make use of any of the new features.
> The current feature set seems to work fine, I successfully run the MTD
> tests on a Colibri iMX7.
> 
> --
> Stefan
> 
> Changes since v1:
> - Make clks_count const
> - Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6
> 
> Stefan Agner (5):
>   mtd: nand: gpmi: unify clock handling
>   mtd: nand: gpmi: add i.MX 7 SoC support
>   mtd: gpmi: document current clock requirements
>   ARM: dts: imx7: add GPMI NAND
>   ARM: dts: imx7-colibri: add NAND support

The dts patches look good to me.  I will pick them up once the driver
changes are accepted.

Shawn

> 
>  .../devicetree/bindings/mtd/gpmi-nand.txt          | 14 +++++-
>  arch/arm/boot/dts/imx7-colibri.dtsi                |  9 ++++
>  arch/arm/boot/dts/imx7s.dtsi                       | 31 ++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 56 +++++++++++++---------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  9 +++-
>  5 files changed, 93 insertions(+), 26 deletions(-)
> 
> -- 
> 2.12.2
> 
