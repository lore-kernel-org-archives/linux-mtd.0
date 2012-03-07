Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5FRL-0005YT-GW
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:53:56 +0000
Message-ID: <4F574C2C.8040009@st.com>
Date: Wed, 7 Mar 2012 17:23:16 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Vipin KUMAR <vipin.kumar@st.com>
Subject: Re: [PATCH next-3.3 19/19] spear13xx: Use dma/word access for NAND
 based on platform
References: <cover.1331116554.git.vipin.kumar@st.com>
 <121d8b6451af054b99e4654dfda996de872aeaa3.1331116555.git.vipin.kumar@st.com>
In-Reply-To: <121d8b6451af054b99e4654dfda996de872aeaa3.1331116555.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ignore this patch...sent by mistake

Regards
Vipin

On 3/7/2012 5:01 PM, Vipin KUMAR wrote:
> Signed-off-by: Vipin Kumar<vipin.kumar@st.com>
> Reviewed-by: Viresh Kumar<viresh.kumar@st.com>
> ---
>   arch/arm/mach-spear13xx/include/mach/generic.h  |    2 ++
>   arch/arm/mach-spear13xx/r1801e.c                |    3 +++
>   arch/arm/mach-spear13xx/spear1300_evb.c         |    3 +++
>   arch/arm/mach-spear13xx/spear1310_evb.c         |    3 +++
>   arch/arm/mach-spear13xx/spear1310_reva_evb.c    |    3 +++
>   arch/arm/mach-spear13xx/spear1340_evb.c         |    3 +++
>   arch/arm/mach-spear13xx/spear1340_lcad.c        |    3 +++
>   arch/arm/mach-spear13xx/spear13xx.c             |   12 ++++++++++++
>   arch/arm/mach-spear13xx/spear900_evb.c          |    3 +++
>   arch/arm/mach-spear13xx/spear_hurricane_board.c |    3 +++
>   arch/arm/mach-spear3xx/spear300_evb.c           |    1 +
>   arch/arm/mach-spear3xx/spear310_evb.c           |    1 +
>   arch/arm/mach-spear3xx/spear320_evb.c           |    1 +
>   arch/arm/mach-spear3xx/spear320_hmi.c           |    1 +
>   arch/arm/mach-spear6xx/spear600_evb.c           |    1 +
>   15 files changed, 43 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-spear13xx/include/mach/generic.h b/arch/arm/mach-spear13xx/include/mach/generic.h
> index 2693a3b..ffff6fd 100644
> --- a/arch/arm/mach-spear13xx/include/mach/generic.h
> +++ b/arch/arm/mach-spear13xx/include/mach/generic.h
> @@ -500,6 +500,8 @@ extern struct sys_timer spear13xx_timer;
>
>   /* Add spear13xx structure declarations here */
>   extern struct dw_dma_slave cf_dma_priv;
> +extern struct dw_dma_slave nand_read_dma_priv;
> +extern struct dw_dma_slave nand_write_dma_priv;
>
>   /* Add spear13xx family function declarations here */
>   bool dw_dma_filter(struct dma_chan *chan, void *slave);
> diff --git a/arch/arm/mach-spear13xx/r1801e.c b/arch/arm/mach-spear13xx/r1801e.c
> index 0383e16..043e718 100644
> --- a/arch/arm/mach-spear13xx/r1801e.c
> +++ b/arch/arm/mach-spear13xx/r1801e.c
> @@ -227,6 +227,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.cle_off = PLAT_NAND_CLE,
>   	.partitions = partition_info,
>   	.nr_partitions = ARRAY_SIZE(partition_info),
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   #ifdef CONFIG_SPEAR_PCIE_REV341
> diff --git a/arch/arm/mach-spear13xx/spear1300_evb.c b/arch/arm/mach-spear13xx/spear1300_evb.c
> index 077ba1e..e4be164 100644
> --- a/arch/arm/mach-spear13xx/spear1300_evb.c
> +++ b/arch/arm/mach-spear13xx/spear1300_evb.c
> @@ -128,6 +128,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   #if 0
> diff --git a/arch/arm/mach-spear13xx/spear1310_evb.c b/arch/arm/mach-spear13xx/spear1310_evb.c
> index 6b8238a..ce5ecca 100644
> --- a/arch/arm/mach-spear13xx/spear1310_evb.c
> +++ b/arch/arm/mach-spear13xx/spear1310_evb.c
> @@ -174,6 +174,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   /* fsmc nor platform data */
> diff --git a/arch/arm/mach-spear13xx/spear1310_reva_evb.c b/arch/arm/mach-spear13xx/spear1310_reva_evb.c
> index 9d9c22d..b44850e 100644
> --- a/arch/arm/mach-spear13xx/spear1310_reva_evb.c
> +++ b/arch/arm/mach-spear13xx/spear1310_reva_evb.c
> @@ -263,6 +263,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   /* fsmc nor partition info */
> diff --git a/arch/arm/mach-spear13xx/spear1340_evb.c b/arch/arm/mach-spear13xx/spear1340_evb.c
> index c0ead2b..59604b5 100644
> --- a/arch/arm/mach-spear13xx/spear1340_evb.c
> +++ b/arch/arm/mach-spear13xx/spear1340_evb.c
> @@ -314,6 +314,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   /* arasan compact flash controller's platform data */
> diff --git a/arch/arm/mach-spear13xx/spear1340_lcad.c b/arch/arm/mach-spear13xx/spear1340_lcad.c
> index 9b0476f..073f769 100644
> --- a/arch/arm/mach-spear13xx/spear1340_lcad.c
> +++ b/arch/arm/mach-spear13xx/spear1340_lcad.c
> @@ -234,6 +234,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   /* I2S STA529 i2c board info */
> diff --git a/arch/arm/mach-spear13xx/spear13xx.c b/arch/arm/mach-spear13xx/spear13xx.c
> index de4757d..f893b3f 100644
> --- a/arch/arm/mach-spear13xx/spear13xx.c
> +++ b/arch/arm/mach-spear13xx/spear13xx.c
> @@ -524,6 +524,18 @@ void nand_select_bank(u32 bank, u32 busw)
>   	writel(fsmc_cfg, VA_FSMC_CFG);
>   }
>
> +struct dw_dma_slave nand_read_dma_priv = {
> +	.dma_dev =&spear13xx_dmac_device[0].dev,
> +	.src_master = SPEAR13XX_DMA_MASTER_FSMC,
> +	.dst_master = SPEAR13XX_DMA_MASTER_MEMORY,
> +};
> +
> +struct dw_dma_slave nand_write_dma_priv = {
> +	.dma_dev =&spear13xx_dmac_device[0].dev,
> +	.src_master = SPEAR13XX_DMA_MASTER_MEMORY,
> +	.dst_master = SPEAR13XX_DMA_MASTER_FSMC,
> +};
> +
>   static struct resource nand_resources[] = {
>   	{
>   		.name = "nand_data",
> diff --git a/arch/arm/mach-spear13xx/spear900_evb.c b/arch/arm/mach-spear13xx/spear900_evb.c
> index 9045640..ba2a816 100644
> --- a/arch/arm/mach-spear13xx/spear900_evb.c
> +++ b/arch/arm/mach-spear13xx/spear900_evb.c
> @@ -130,6 +130,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   #if 0
> diff --git a/arch/arm/mach-spear13xx/spear_hurricane_board.c b/arch/arm/mach-spear13xx/spear_hurricane_board.c
> index e45f92f..2bcb395 100644
> --- a/arch/arm/mach-spear13xx/spear_hurricane_board.c
> +++ b/arch/arm/mach-spear13xx/spear_hurricane_board.c
> @@ -222,6 +222,9 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_DMA_ACCESS,
> +	.read_dma_priv =&nand_read_dma_priv,
> +	.write_dma_priv =&nand_write_dma_priv,
>   };
>
>   static struct arasan_cf_pdata cf_pdata = {
> diff --git a/arch/arm/mach-spear3xx/spear300_evb.c b/arch/arm/mach-spear3xx/spear300_evb.c
> index 1602fde..92b8238 100644
> --- a/arch/arm/mach-spear3xx/spear300_evb.c
> +++ b/arch/arm/mach-spear3xx/spear300_evb.c
> @@ -119,6 +119,7 @@ static const struct fsmc_nand_platform_data nand0_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = SPEAR300_PLAT_NAND_ALE,
>   	.cle_off = SPEAR300_PLAT_NAND_CLE,
> +	.mode = USE_WORD_ACCESS,
>   };
>
>   /* keyboard specific platform data */
> diff --git a/arch/arm/mach-spear3xx/spear310_evb.c b/arch/arm/mach-spear3xx/spear310_evb.c
> index 69778b5..da11f2d 100644
> --- a/arch/arm/mach-spear3xx/spear310_evb.c
> +++ b/arch/arm/mach-spear3xx/spear310_evb.c
> @@ -194,6 +194,7 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = SPEAR310_PLAT_NAND_ALE,
>   	.cle_off = SPEAR310_PLAT_NAND_CLE,
> +	.mode = USE_WORD_ACCESS,
>   };
>
>   /* spi board information */
> diff --git a/arch/arm/mach-spear3xx/spear320_evb.c b/arch/arm/mach-spear3xx/spear320_evb.c
> index 09aa95b..ce41448 100644
> --- a/arch/arm/mach-spear3xx/spear320_evb.c
> +++ b/arch/arm/mach-spear3xx/spear320_evb.c
> @@ -174,6 +174,7 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = SPEAR320_PLAT_NAND_ALE,
>   	.cle_off = SPEAR320_PLAT_NAND_CLE,
> +	.mode = USE_WORD_ACCESS,
>   };
>
>   /* Currently no gpios are free on eval board so it is kept commented */
> diff --git a/arch/arm/mach-spear3xx/spear320_hmi.c b/arch/arm/mach-spear3xx/spear320_hmi.c
> index bba73f1..cd12fc9 100644
> --- a/arch/arm/mach-spear3xx/spear320_hmi.c
> +++ b/arch/arm/mach-spear3xx/spear320_hmi.c
> @@ -155,6 +155,7 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = SPEAR320_PLAT_NAND_ALE,
>   	.cle_off = SPEAR320_PLAT_NAND_CLE,
> +	.mode = USE_WORD_ACCESS,
>   };
>
>   static void __init spear320_hmi_init(void)
> diff --git a/arch/arm/mach-spear6xx/spear600_evb.c b/arch/arm/mach-spear6xx/spear600_evb.c
> index 36b6183..881f0eb 100644
> --- a/arch/arm/mach-spear6xx/spear600_evb.c
> +++ b/arch/arm/mach-spear6xx/spear600_evb.c
> @@ -90,6 +90,7 @@ static const struct fsmc_nand_platform_data nand_plat_data __initconst = {
>   	.width = FSMC_NAND_BW8,
>   	.ale_off = PLAT_NAND_ALE,
>   	.cle_off = PLAT_NAND_CLE,
> +	.mode = USE_WORD_ACCESS,
>   };
>
>   /* spi board information */
