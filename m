Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Stubc-0004Sk-Os
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2012 05:57:58 +0000
Message-ID: <500F8B1A.6070605@freescale.com>
Date: Wed, 25 Jul 2012 13:58:50 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Select MXS_DMA for MTD_NAND_GPMI_NAND
References: <1343146515-18578-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1343146515-18578-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B407=E6=9C=8825=E6=97=A5 00:15, Fabio Estevam =E5=86=
=99=E9=81=93:
> From: Fabio Estevam<fabio.estevam@freescale.com>
>
> MTD_NAND_GPMI_NAND driver needs MXS_DMA to be selected, otherwise the f=
ollowing error happens
> for imx_v6_v7_defconfig:
>
> drivers/built-in.o: In function `gpmi_dma_filter':
> clk-fixed-factor.c:(.text+0xb124c): undefined reference to `mxs_dma_is_=
apbh'
> make: *** [vmlinux] Error 1
>
> Signed-off-by: Fabio Estevam<fabio.estevam@freescale.com>
> ---
>   drivers/mtd/nand/Kconfig |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index b40e172..2062ee9 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -463,6 +463,7 @@ config MTD_NAND_NANDSIM
>   config MTD_NAND_GPMI_NAND
>           bool "GPMI NAND Flash Controller driver"
>           depends on MTD_NAND&&  (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
> +	select MXS_DMA
>           help
>   	 Enables NAND Flash support for IMX23/28/6.
>   	 The GPMI controller is very powerful, with the help of BCH
thanks, but please see this thread.

http://comments.gmane.org/gmane.linux.ports.arm.kernel/146232

Huang Shijie
