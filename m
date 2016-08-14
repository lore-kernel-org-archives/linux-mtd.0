Date: Sun, 14 Aug 2016 17:51:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] mtd: nand: s3c2410: Register cpufreq notifier only on
 S3C24xx
Message-ID: <20160814175140.254b1bec@bbrezillon>
In-Reply-To: <1467031898-1410-1-git-send-email-k.kozlowski@samsung.com>
References: <1467031898-1410-1-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 27 Jun 2016 14:51:38 +0200
Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:

> The driver registered for CPU frequency transitions to recalculate its
> clock when ARM clock frequency changes (ratio between frequencies of
> ARM's parent clock (fclk) and clock for peripherals remains fixed).
> 
> This is needed only on S3C24xx platform when cpufreq driver is enabled
> so limit the ifdef to respective cpufreq Kconfig.
> 

Applied.

Thanks,

Boris

> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/mtd/nand/s3c2410.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index d9309cf0ce2e..8d440cc0f002 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -180,7 +180,7 @@ struct s3c2410_nand_info {
>  
>  	enum s3c_cpu_type		cpu_type;
>  
> -#ifdef CONFIG_CPU_FREQ
> +#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
>  	struct notifier_block	freq_transition;
>  #endif
>  };
> @@ -701,7 +701,7 @@ static void s3c2440_nand_write_buf(struct mtd_info *mtd, const u_char *buf,
>  
>  /* cpufreq driver support */
>  
> -#ifdef CONFIG_CPU_FREQ
> +#ifdef CONFIG_ARM_S3C24XX_CPUFREQ
>  
>  static int s3c2410_nand_cpufreq_transition(struct notifier_block *nb,
>  					  unsigned long val, void *data)
