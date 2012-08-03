Message-ID: <501B8E74.4030803@de.bosch.com>
Date: Fri, 3 Aug 2012 10:40:20 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>, Fabio Estevam
 <fabio.estevam@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: imx_v6_v7_defconfig: Select MXS_DMA
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-3-git-send-email-festevam@gmail.com>
In-Reply-To: <1343215100-24005-3-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@linux.intel.com" <Artem.Bityutskiy@linux.intel.com>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25.07.2012 13:18, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Let MXS_DMA be selected by default.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - No changes. Newly introduced in this series
>  arch/arm/configs/imx_v6_v7_defconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index f725b96..3c9f32f 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -192,6 +192,7 @@ CONFIG_RTC_DRV_MC13XXX=y
>  CONFIG_RTC_DRV_MXC=y
>  CONFIG_DMADEVICES=y
>  CONFIG_IMX_SDMA=y
> +CONFIG_MXS_DMA=y
>  CONFIG_COMMON_CLK_DEBUG=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_EXT2_FS=y

Building mainline 3.6-rc1 with imx_v6_v7_defconfig this is still broken 
due to

drivers/built-in.o: In function `gpmi_dma_filter':
clk-fixed-factor.c:(.text+0xab170): undefined reference to `mxs_dma_is_apbh'

Is any fix for this on its way to mainline? Either the above or any 
other one?

Best regards

Dirk
