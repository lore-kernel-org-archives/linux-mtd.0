Message-ID: <4DA261DA.2050404@oracle.com>
Date: Sun, 10 Apr 2011 19:05:14 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Jiri Pinkava <jiri.pinkava@vscht.cz>
Subject: Re: [PATCH] nand: Fix S3C NAND clock stop
References: <1302485262-8401-1-git-send-email-jiri.pinkava@vscht.cz>
In-Reply-To: <1302485262-8401-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kgene.kim@samsung.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, ben-linux@fluff.org,
	dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/10/2011 6:27 PM, Jiri Pinkava wrote:
> Current implementation of s3c2410_nand_select_chip call
> clk_disable every time when chip = -1 (de-select). This happend
> multiple times even if chip was already de-selected. This causes
> disabling clock even if they are already disabled and due to
> nature of clock subsytem implementation this causes nand clock
> to be disabled and newer enabled again.
>
> Signed-off-by: Jiri Pinkava<jiri.pinkava@vscht.cz>
> ---
>   drivers/mtd/nand/s3c2410.c |   57 +++++++++++++++++++++++++++++++------------
>   1 files changed, 41 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 33d832d..79e18a3 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c

> @@ -159,11 +165,33 @@ static struct s3c2410_platform_nand *to_nand_plat(struct platform_device *dev)
>   	return dev->dev.platform_data;
>   }
>
> -static inline int allow_clk_stop(struct s3c2410_nand_info *info)
> +static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
>   {
>   	return clock_stop;
>   }
>
> +/**
> + * s3c2410_nand_clk_set_state - Enable, disable or suspend NAND clock.
> + * @info: The controller instance.
> + * @state: State to which clock should be set.

       @new_state:

> + */
> +static void s3c2410_nand_clk_set_state(struct s3c2410_nand_info *info,
> +		int new_state)
> +{
> +	if (!allow_clk_suspend(info)&&  new_state == CLOCK_SUSPEND)
> +		return;
> +
> +	if (clock_state == CLOCK_ENABLE) {
> +		if (new_state != CLOCK_ENABLE)
> +			clk_disable(info->clk);
> +	} else {
> +		if (new_state == CLOCK_ENABLE)
> +			clk_enable(info->clk);
> +	}
> +
> +	clock_state = new_state;
> +}
