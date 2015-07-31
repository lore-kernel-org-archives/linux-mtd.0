Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLHQD-0005Z2-A6
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 21:00:54 +0000
Received: by pdjr16 with SMTP id r16so49427526pdj.3
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 14:00:32 -0700 (PDT)
Date: Fri, 31 Jul 2015 14:00:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 5/8] mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the
 random QSPI access failed issue
Message-ID: <20150731210027.GF10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-6-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-6-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 25, 2015 at 02:06:25AM +0800, Frank.Li@freescale.com wrote:
> From: Allen Xu <b45815@freescale.com>
> 
> We found there is a low probability(5%) QSPI access timeout issue,
> usually it happened on kernel boot stage, the first time kernel tried to
> access QSPI chip. The READ_ID command was sent but not executed,
> consequently the probe function failed.
> 
> Finally we located the issue by these steps.
> 
> 1. Since the issue happened randomly and usually it cost half day to
> reproduce, we add more debug code in driver, to create a timeout file if
> the issue occurred.
> 
> 2. Prepared an autorun script to keep rebooting the system and check if
> the timeout file existed, if the file existed, stop reboot.
> 
> 3. The system will stop rebooting when timeout error occurred, set the
> CCM_CCOSR register and related IOMUX to measure QPSI clock, found there
> is no clock output, while clock output can be measured when QSPI driver
> successfully probed.
> 
> 4. Check the code and found QSPI clock rate was changed while not
> disabled clock gate, most of the multiplexers on i.MX6 are glitch ones,
> clock glitch may occurred and propagated into downstream clock dividers
> 
> Based on the new clock flag(CLK_SET_RATE_GATE) and new framework, we
> need to change the approach of seting clock rate. In current
> implementation, there are several places in which the clock was touched.

I appreciate the long, descriptive commit message, but I feel like
there's still an important detail that's not very obvious -- what was
the actual *bug* you're solving? (You spend more time on how you found
the problem (which is nice, but readers probably don't really care), and
leave the actual problem to be inferred by reading up on
CLK_SET_RATE_GATE.)

AIUI, the problem is that your clocks need to be gated when their rate
is changed, correct? Please put a short note here that explains it.

> 1. probe function. prepare and enable clock before setting the QSPI
> register, disable and unprepare the clock before exit.
> 
> 2. nor_setup & nor_setup_last, since we change clock rate in these two
> functions.
> 
> 3. fsl_qspi_prep and fsl_qspi_unprep, clock was enabled only when got
> QSPI access request.
> 
> 4. resume function. Clock was required to restroe the setting after
> resume, disable the clock before exit.
> 
> Signed-off-by: Allen Xu <b45815@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 83 +++++++++++++++++++++++++++------------
>  1 file changed, 58 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 3746542..9ee6db9 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -653,6 +653,32 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
>  		q->iobase + QUADSPI_BFGENCR);
>  }
>  
> +/* This function was used to prepare and enable QSPI clock */
> +static int fsl_qspi_clk_prep_enable(struct fsl_qspi *q)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(q->clk_en);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(q->clk);
> +	if (ret) {
> +		clk_disable_unprepare(q->clk_en);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* This function was used to disable and unprepare QSPI clock */
> +static void fsl_qspi_clk_disable_unprep(struct fsl_qspi *q)
> +{
> +	clk_disable_unprepare(q->clk);
> +	clk_disable_unprepare(q->clk_en);
> +
> +}
> +
>  /* We use this function to do some basic init for spi_nor_scan(). */
>  static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>  {
> @@ -660,11 +686,19 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>  	u32 reg;
>  	int ret;
>  
> -	/* the default frequency, we will change it in the future.*/
> +	/* disable and unprepare clock first */

The comment (above) doesn't add much that the function name (below)
doesn't say already (i.e., the function says "disable" and "unprep").
But perhaps you can explain the "why"? e.g.:

	/* Clocks must be gated when changing rates, to avoid glitching */

> +	fsl_qspi_clk_disable_unprep(q);
> +
> +	/* the default frequency, we will change it in the future. */
>  	ret = clk_set_rate(q->clk, 66000000);
>  	if (ret)
>  		return ret;
>  
> +	/* prepare and enable the clock */
> +	ret = fsl_qspi_clk_prep_enable(q);
> +	if (ret)
> +		return ret;
> +
>  	/* Init the LUT table. */
>  	fsl_qspi_init_lut(q);
>  
> @@ -696,10 +730,18 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  	if (needs_4x_clock(q))
>  		rate *= 4;
>  
> +	/* disable and unprepare clock first */

Same here.

> +	fsl_qspi_clk_disable_unprep(q);
> +
>  	ret = clk_set_rate(q->clk, rate);
>  	if (ret)
>  		return ret;
>  
> +	/* prepare and enable the clock */
> +	ret = fsl_qspi_clk_prep_enable(q);
> +	if (ret)
> +		return ret;
> +
>  	/* Init the LUT table again. */
>  	fsl_qspi_init_lut(q);
>  
...

Brian
