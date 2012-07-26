MIME-Version: 1.0
In-Reply-To: <1343215100-24005-2-git-send-email-festevam@gmail.com>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-2-git-send-email-festevam@gmail.com>
Date: Thu, 26 Jul 2012 10:27:05 +0800
Message-ID: <CAMiH66H8GwK+5Zf8RLukC9O35eyQ6rVPYQhV2GarczFYmdpjMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: nand: Let MTD_NAND_GPMI_NAND depend on MXS_DMA
From: Huang Shijie <shijie8@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think  we can merget the patch 1 and patch 2 to one patch.

Huang Shijie

On Wed, Jul 25, 2012 at 7:18 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> MTD_NAND_GPMI_NAND driver depends on MXS_DMA to be selected, otherwise the following error happens
> for imx_v6_v7_defconfig:
>
> drivers/built-in.o: In function `gpmi_dma_filter':
> clk-fixed-factor.c:(.text+0xb124c): undefined reference to `mxs_dma_is_apbh'
> make: *** [vmlinux] Error 1
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Use 'depends' rather than 'select'
>  drivers/mtd/nand/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index a5d8a1b..da52c7d 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -463,6 +463,7 @@ config MTD_NAND_NANDSIM
>  config MTD_NAND_GPMI_NAND
>          bool "GPMI NAND Flash Controller driver"
>          depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
> +       depends on MXS_DMA
>          help
>          Enables NAND Flash support for IMX23, IMX28 or IMX6.
>          The GPMI controller is very powerful, with the help of BCH
> --
> 1.7.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
