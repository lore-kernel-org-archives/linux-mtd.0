Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KGrps-0001qY-U8
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 08:49:09 +0000
Date: Thu, 10 Jul 2008 09:48:59 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [patch 2/2] CPUFREQ: S3C24XX NAND driver frequency scaling
	support.
Message-ID: <20080710084859.GA3569@fluff.org.uk>
References: <20080709130919.508608130@fluff.org>
	<20080709131038.055526318@fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080709131038.055526318@fluff.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 09, 2008 at 02:09:21PM +0100, Ben Dooks wrote:
> Add support for CPU frequency scalling to the S3C24XX NAND driver.

please ignore this patch, it has a build error in it.
 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> 
> Index: linux-2.6.26-rc9-quilt1/drivers/mtd/nand/s3c2410.c
> ===================================================================
> --- linux-2.6.26-rc9-quilt1.orig/drivers/mtd/nand/s3c2410.c	2008-07-09 09:28:56.000000000 +0100
> +++ linux-2.6.26-rc9-quilt1/drivers/mtd/nand/s3c2410.c	2008-07-09 09:53:38.000000000 +0100
> @@ -36,6 +36,7 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/clk.h>
> +#include <linux/cpufreq.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
> @@ -104,8 +105,13 @@ struct s3c2410_nand_info {
>  	int				sel_bit;
>  	int				mtd_count;
>  	unsigned long			save_sel;
> +	unsigned long			clk_rate;
>  
>  	enum s3c_cpu_type		cpu_type;
> +
> +#ifdef CONFIG_CPU_FREQ
> +	struct notifier_block	freq_transition;
> +#endif
>  };
>  
>  /* conversion functions */
> @@ -163,17 +169,18 @@ static int s3c_nand_calc_rate(int wanted
>  
>  /* controller setup */
>  
> -static int s3c2410_nand_inithw(struct s3c2410_nand_info *info,
> -			       struct platform_device *pdev)
> +static int s3c2410_nand_setrate(struct s3c2410_nand_info *info)
>  {
> -	struct s3c2410_platform_nand *plat = to_nand_plat(pdev);
> -	unsigned long clkrate = clk_get_rate(info->clk);
> +	struct s3c2410_platform_nand *plat = info->platform;
>  	int tacls_max = (info->cpu_type == TYPE_S3C2412) ? 8 : 4;
>  	int tacls, twrph0, twrph1;
> -	unsigned long cfg = 0;
> +	unsigned long clkrate = clk_get_rate(info->clk);
> +	unsigned long set, cfg, mask;
> +	unsigned long flags;
>  
>  	/* calculate the timing information for the controller */
>  
> +	info->clk_rate = clkrate;
>  	clkrate /= 1000;	/* turn clock into kHz for ease of use */
>  
>  	if (plat != NULL) {
> @@ -197,26 +204,68 @@ static int s3c2410_nand_inithw(struct s3
>  
>   	switch (info->cpu_type) {
>   	case TYPE_S3C2410:
> -		cfg = S3C2410_NFCONF_EN;
> -		cfg |= S3C2410_NFCONF_TACLS(tacls - 1);
> -		cfg |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
> -		cfg |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
> +		mask = (S3C2410_NFCONF_TACLS(3) |
> +			S3C2410_NFCONF_TWRPH0(7) |
> +			S3C2410_NFCONF_TWRPH1(7));
> +		set = S3C2410_NFCONF_EN;
> +		set |= S3C2410_NFCONF_TACLS(tacls - 1);
> +		set |= S3C2410_NFCONF_TWRPH0(twrph0 - 1);
> +		set |= S3C2410_NFCONF_TWRPH1(twrph1 - 1);
>  		break;
>  
>   	case TYPE_S3C2440:
>   	case TYPE_S3C2412:
> -		cfg = S3C2440_NFCONF_TACLS(tacls - 1);
> -		cfg |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
> -		cfg |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);
> -
> -		/* enable the controller and de-assert nFCE */
> +		mask = (S3C2410_NFCONF_TACLS(tacls_max - 1) |
> +			S3C2410_NFCONF_TWRPH0(7) |
> +			S3C2410_NFCONF_TWRPH1(7));
> +
> +		set = S3C2440_NFCONF_TACLS(tacls - 1);
> +		set |= S3C2440_NFCONF_TWRPH0(twrph0 - 1);
> +		set |= S3C2440_NFCONF_TWRPH1(twrph1 - 1);
> +		break;
>  
> -		writel(S3C2440_NFCONT_ENABLE, info->regs + S3C2440_NFCONT);
> +	default:
> +		/* keep compiler happy */
> +		mask = 0;
> +		set = 0;
> +		BUG();
>  	}
>  
>  	dev_dbg(info->device, "NF_CONF is 0x%lx\n", cfg);
>  
> +	local_irq_save(flags);
> +
> +	cfg = readl(info->regs + S3C2410_NFCONF);
> +	cfg &= ~mask;
> +	cfg |= set;
>  	writel(cfg, info->regs + S3C2410_NFCONF);
> +
> +	local_irq_restore(flags);
> +
> +	return 0;
> +}
> +
> +static int s3c2410_nand_inithw(struct s3c2410_nand_info *info)
> +{
> +	unsigned long clkrate = clk_get_rate(info->clk);
> +	int ret;
> +
> +	ret = s3c2410_nand_setrate(info, clkrate);
> +	if (ret < 0)
> +		return ret;
> +
> + 	switch (info->cpu_type) {
> + 	case TYPE_S3C2410:
> +	default:
> +		break;
> +
> + 	case TYPE_S3C2440:
> + 	case TYPE_S3C2412:
> +		/* enable the controller and de-assert nFCE */
> +
> +		writel(S3C2440_NFCONT_ENABLE, info->regs + S3C2440_NFCONT);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -497,6 +546,52 @@ static void s3c2440_nand_write_buf(struc
>  	writesl(info->regs + S3C2440_NFDATA, buf, len / 4);
>  }
>  
> +/* cpufreq driver support */
> +
> +#ifdef CONFIG_CPU_FREQ
> +
> +static int s3c2410_nand_cpufreq_transition(struct notifier_block *nb,
> +					  unsigned long val, void *data)
> +{
> +	struct s3c2410_nand_info *info;
> +	unsigned long newclk = clk_get_rate(info->clk);
> +	long delta;
> +
> +	info = container_of(nb, struct s3c2410_nand_info, freq_transition);
> +
> +	if ((val == CPUFREQ_POSTCHANGE && newclk < info->clk_rate) ||
> +	    (val == CPUFREQ_PRECHANGE && newclk > info->clk_rate)) {
> +		s3c2410_nand_setrate(info);
> +	}
> +
> +	return 0;
> +}
> +
> +static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
> +{
> +	info->freq_transition.notifier_call = s3c2410_nand_cpufreq_transition;
> +
> +	return cpufreq_register_notifier(&info->freq_transition,
> +					 CPUFREQ_TRANSITION_NOTIFIER);
> +}
> +
> +static inline void s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
> +{
> +	cpufreq_unregister_notifier(&info->freq_transition,
> +				    CPUFREQ_TRANSITION_NOTIFIER);
> +}
> +
> +#else
> +static inline int s3c2410_nand_cpufreq_register(struct s3c2410_nand_info *info)
> +{
> +	return 0;
> +}
> +
> +static inline void s3c2410_nand_cpufreq_deregister(struct s3c2410_nand_info *info)
> +{
> +}
> +#endif
> +
>  /* device management functions */
>  
>  static int s3c2410_nand_remove(struct platform_device *pdev)
> @@ -508,9 +603,10 @@ static int s3c2410_nand_remove(struct pl
>  	if (info == NULL)
>  		return 0;
>  
> -	/* first thing we need to do is release all our mtds
> -	 * and their partitions, then go through freeing the
> -	 * resources used
> +	s3c2410_nand_cpufreq_deregister(info);
> +
> +	/* Release all our mtds  and their partitions, then go through
> +	 * freeing the resources used
>  	 */
>  
>  	if (info->mtds != NULL) {
> @@ -769,7 +865,7 @@ static int s3c24xx_nand_probe(struct pla
>  
>  	/* initialise the hardware */
>  
> -	err = s3c2410_nand_inithw(info, pdev);
> +	err = s3c2410_nand_inithw(info);
>  	if (err != 0)
>  		goto exit_error;
>  
> @@ -812,6 +908,12 @@ static int s3c24xx_nand_probe(struct pla
>  			sets++;
>  	}
>  
> +	err = s3c2410_nand_cpufreq_register(info);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to init cpufreq support\n");
> +		goto exit_error;
> +	}
> +
>  	if (allow_clk_stop(info)) {
>  		dev_info(&pdev->dev, "clock idle support enabled\n");
>  		clk_disable(info->clk);
> @@ -859,7 +961,7 @@ static int s3c24xx_nand_resume(struct pl
>  
>  	if (info) {
>  		clk_enable(info->clk);
> -		s3c2410_nand_inithw(info, dev);
> +		s3c2410_nand_inithw(info);
>  
>  		/* Restore the state of the nFCE line. */
>  
> 
> -- 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
