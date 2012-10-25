Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TRHgV-0005G1-MQ
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 07:16:56 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so878203pad.36
 for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2012 00:16:53 -0700 (PDT)
Date: Thu, 25 Oct 2012 15:16:34 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: dts: mxs: add the "clock-names" for gpmi-nand
Message-ID: <20121025071629.GD2464@S2101-09.ap.freescale.net>
References: <201210101237.13640.marex@denx.de>
 <1349864829-19565-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349864829-19565-1-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd, Olof,

Can you please apply this fix for -rc?  Otherwise, please let me know
if you prefer to get a pull request from me.

Shawn

On Wed, Oct 10, 2012 at 06:27:09PM +0800, Huang Shijie wrote:
> The current DT nodes for mx23/mx28 miss the `clocks-names` item for gpmi-nand.
> So the gpmi-nand driver could not find the proper clock.
> 
> This patch fixes this issue.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/boot/dts/imx23.dtsi |    1 +
>  arch/arm/boot/dts/imx28.dtsi |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
> index 9ca4ca7..6d31aa3 100644
> --- a/arch/arm/boot/dts/imx23.dtsi
> +++ b/arch/arm/boot/dts/imx23.dtsi
> @@ -69,6 +69,7 @@
>  				interrupts = <13>, <56>;
>  				interrupt-names = "gpmi-dma", "bch";
>  				clocks = <&clks 34>;
> +				clock-names = "gpmi_io";
>  				fsl,gpmi-dma-channel = <4>;
>  				status = "disabled";
>  			};
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index e16d631..55c57ea 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -85,6 +85,7 @@
>  				interrupts = <88>, <41>;
>  				interrupt-names = "gpmi-dma", "bch";
>  				clocks = <&clks 50>;
> +				clock-names = "gpmi_io";
>  				fsl,gpmi-dma-channel = <4>;
>  				status = "disabled";
>  			};
> -- 
> 1.7.0.4
> 
> 
