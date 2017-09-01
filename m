Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnidg-0003j8-U8
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 09:53:27 +0000
Received: by mail-wm0-x232.google.com with SMTP id f127so603196wmf.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 02:53:03 -0700 (PDT)
Subject: Re: [PATCH 01/10] spi-nor: intel-spi: Fix number of protected range
 registers for BYT/LPT
To: Bin Meng <bmeng.cn@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
 <1504252841-2445-2-git-send-email-bmeng.cn@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <31598b63-7080-5bae-5556-bee89169a7c8@gmail.com>
Date: Fri, 1 Sep 2017 11:52:58 +0200
MIME-Version: 1.0
In-Reply-To: <1504252841-2445-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/01/2017 10:00 AM, Bin Meng wrote:
> The number of protected range registers is not the same on BYT/LPT/
> BXT. GPR0 only exists on Apollo Lake and its offset is reserved on
> other platforms.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Can this use regmap ? What you're implementing here seems like regmap to me.

> ---
> 
>  drivers/mtd/spi-nor/intel-spi.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index 8a596bf..e5b52e8 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -67,8 +67,6 @@
>  #define PR_LIMIT_MASK			(0x3fff << PR_LIMIT_SHIFT)
>  #define PR_RPE				BIT(15)
>  #define PR_BASE_MASK			0x3fff
> -/* Last PR is GPR0 */
> -#define PR_NUM				(5 + 1)
>  
>  /* Offsets are from @ispi->sregs */
>  #define SSFSTS_CTL			0x00
> @@ -96,14 +94,17 @@
>  #define BYT_BCR				0xfc
>  #define BYT_BCR_WPD			BIT(0)
>  #define BYT_FREG_NUM			5
> +#define BYT_PR_NUM			5
>  
>  #define LPT_PR				0x74
>  #define LPT_SSFSTS_CTL			0x90
>  #define LPT_FREG_NUM			5
> +#define LPT_PR_NUM			5
>  
>  #define BXT_PR				0x84
>  #define BXT_SSFSTS_CTL			0xa0
>  #define BXT_FREG_NUM			12
> +#define BXT_PR_NUM			6
>  
>  #define INTEL_SPI_TIMEOUT		5000 /* ms */
>  #define INTEL_SPI_FIFO_SZ		64
> @@ -117,6 +118,7 @@
>   * @pregs: Start of protection registers
>   * @sregs: Start of software sequencer registers
>   * @nregions: Maximum number of regions
> + * @pr_num: Maximum number of protected range registers
>   * @writeable: Is the chip writeable
>   * @swseq: Use SW sequencer in register reads/writes
>   * @erase_64k: 64k erase supported
> @@ -132,6 +134,7 @@ struct intel_spi {
>  	void __iomem *pregs;
>  	void __iomem *sregs;
>  	size_t nregions;
> +	size_t pr_num;
>  	bool writeable;
>  	bool swseq;
>  	bool erase_64k;
> @@ -167,7 +170,7 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
>  	for (i = 0; i < ispi->nregions; i++)
>  		dev_dbg(ispi->dev, "FREG(%d)=0x%08x\n", i,
>  			readl(ispi->base + FREG(i)));
> -	for (i = 0; i < PR_NUM; i++)
> +	for (i = 0; i < ispi->pr_num; i++)
>  		dev_dbg(ispi->dev, "PR(%d)=0x%08x\n", i,
>  			readl(ispi->pregs + PR(i)));
>  
> @@ -182,7 +185,7 @@ static void intel_spi_dump_regs(struct intel_spi *ispi)
>  		dev_dbg(ispi->dev, "BCR=0x%08x\n", readl(ispi->base + BYT_BCR));
>  
>  	dev_dbg(ispi->dev, "Protected regions:\n");
> -	for (i = 0; i < PR_NUM; i++) {
> +	for (i = 0; i < ispi->pr_num; i++) {
>  		u32 base, limit;
>  
>  		value = readl(ispi->pregs + PR(i));
> @@ -286,6 +289,7 @@ static int intel_spi_init(struct intel_spi *ispi)
>  		ispi->sregs = ispi->base + BYT_SSFSTS_CTL;
>  		ispi->pregs = ispi->base + BYT_PR;
>  		ispi->nregions = BYT_FREG_NUM;
> +		ispi->pr_num = BYT_PR_NUM;
>  
>  		if (writeable) {
>  			/* Disable write protection */
> @@ -305,12 +309,14 @@ static int intel_spi_init(struct intel_spi *ispi)
>  		ispi->sregs = ispi->base + LPT_SSFSTS_CTL;
>  		ispi->pregs = ispi->base + LPT_PR;
>  		ispi->nregions = LPT_FREG_NUM;
> +		ispi->pr_num = LPT_PR_NUM;
>  		break;
>  
>  	case INTEL_SPI_BXT:
>  		ispi->sregs = ispi->base + BXT_SSFSTS_CTL;
>  		ispi->pregs = ispi->base + BXT_PR;
>  		ispi->nregions = BXT_FREG_NUM;
> +		ispi->pr_num = BXT_PR_NUM;
>  		ispi->erase_64k = true;
>  		break;
>  
> @@ -652,7 +658,7 @@ static bool intel_spi_is_protected(const struct intel_spi *ispi,
>  {
>  	int i;
>  
> -	for (i = 0; i < PR_NUM; i++) {
> +	for (i = 0; i < ispi->pr_num; i++) {
>  		u32 pr_base, pr_limit, pr_value;
>  
>  		pr_value = readl(ispi->pregs + PR(i));
> 


-- 
Best regards,
Marek Vasut
