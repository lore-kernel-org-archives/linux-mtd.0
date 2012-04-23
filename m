Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMBut-0000dG-V7
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 05:34:28 +0000
Received: by dadn15 with SMTP id n15so18418339dad.16
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 22:34:26 -0700 (PDT)
Date: Mon, 23 Apr 2012 13:35:17 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/3] ARM: mx6q-arm2: add gpmi-nand dt support
Message-ID: <20120423053515.GO26306@S2101-09.ap.freescale.net>
References: <1334913859-5314-1-git-send-email-b32955@freescale.com>
 <1334913859-5314-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334913859-5314-2-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 20, 2012 at 05:24:17PM +0800, Huang Shijie wrote:
> add gpmi-nand dt support, and add the proper clock for gpmi-nand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/boot/dts/imx6q.dtsi    |   12 ++++++++++++
>  arch/arm/mach-imx/clock-imx6q.c |    5 +++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
The patch subject suggests it touches some imx6q-arm2 specific files,
while the diffstat says no.

I think the reason for that is you missed one fact.  Generally, the
peripherals defined in imx6q.dtsi should be disabled by default
(status = "disabled"), and need to to be enabled (status = "okay")
by <board>.dts file.

> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index 4905f51..f23a0c4 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -87,6 +87,18 @@
>  		interrupt-parent = <&intc>;
>  		ranges;
>  
> +		gpmi-nand@00112000 {
> +			compatible = "fsl,imx6q-gpmi-nand";
> +			reg = <0x00112000 0x2000>;
> +			interrupts = <0 13 0x04>;
> +			dma_channel = <0>;
> +		};

Add a new line between two nodes.

Regards,
Shawn

> +		bch@00114000 {
> +			compatible = "fsl,imx6q-bch";
> +			reg = <0x00114000 0x2000>;
> +			interrupts = <0 15 0x04>;
> +		};
> +
>  		timer@00a00600 {
>  			compatible = "arm,cortex-a9-twd-timer";
>  			reg = <0x00a00600 0x20>;
> diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
> index 111c328..e3dc1b3 100644
> --- a/arch/arm/mach-imx/clock-imx6q.c
> +++ b/arch/arm/mach-imx/clock-imx6q.c
> @@ -1859,7 +1859,8 @@ DEF_CLK(pwm1_clk,	  CCGR4, CG8,  &ipg_perclk,	  NULL);
>  DEF_CLK(pwm2_clk,	  CCGR4, CG9,  &ipg_perclk,	  NULL);
>  DEF_CLK(pwm3_clk,	  CCGR4, CG10, &ipg_perclk,	  NULL);
>  DEF_CLK(pwm4_clk,	  CCGR4, CG11, &ipg_perclk,	  NULL);
> -DEF_CLK(gpmi_bch_apb_clk, CCGR4, CG12, &usdhc3_clk,	  NULL);
> +DEF_CLK(per1_bch_clk,     CCGR4, CG6,  &usdhc3_clk,	  NULL);
> +DEF_CLK(gpmi_bch_apb_clk, CCGR4, CG12, &usdhc3_clk,	  &per1_bch_clk);
>  DEF_CLK(gpmi_bch_clk,	  CCGR4, CG13, &usdhc4_clk,	  &gpmi_bch_apb_clk);
>  DEF_CLK(gpmi_apb_clk,	  CCGR4, CG15, &usdhc3_clk,	  &gpmi_bch_clk);
>  DEF_CLK(gpmi_io_clk,	  CCGR4, CG14, &enfc_clk,	  &gpmi_apb_clk);
> @@ -1988,7 +1989,7 @@ static struct clk_lookup lookups[] = {
>  	_REGISTER_CLOCK(NULL, "pwm2_clk", pwm2_clk),
>  	_REGISTER_CLOCK(NULL, "pwm3_clk", pwm3_clk),
>  	_REGISTER_CLOCK(NULL, "pwm4_clk", pwm4_clk),
> -	_REGISTER_CLOCK(NULL, "gpmi_io_clk", gpmi_io_clk),
> +	_REGISTER_CLOCK("112000.gpmi-nand", NULL, gpmi_io_clk),
>  	_REGISTER_CLOCK(NULL, "usboh3_clk", usboh3_clk),
>  	_REGISTER_CLOCK(NULL, "sata_clk", sata_clk),
>  	_REGISTER_CLOCK(NULL, "cko1_clk", cko1_clk),
> -- 
> 1.7.0.4
> 
> 
