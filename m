Message-ID: <4E27CD14.4090702@nvidia.com>
Date: Thu, 21 Jul 2011 12:24:12 +0530
From: Varun Wadekar <vwadekar@nvidia.com>
MIME-Version: 1.0
To: "jhbird.choi@samsung.com" <jhbird.choi@samsung.com>
Subject: Re: [PATCH] mtd: s3c2410 nand: Remove uncessary null check
References: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
In-Reply-To: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Kukjin Kim <kgene.kim@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 July 2011 12:03 PM, jhbird.choi@samsung.com wrote:
> From: Jonghwan Choi <jhbird.choi@samsung.com>
>
> clk_get() return a pointer to the struct clk or an ERR_PTR().
>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/mtd/nand/s3c2410.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 4405468..18ff2f5 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -723,7 +723,7 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
>  
>  	/* free the common resources */
>  
> -	if (info->clk != NULL && !IS_ERR(info->clk)) {
> +	if (!IS_ERR(info->clk)) {

I think you should use IS_ERR_OR_NULL instead.
>  		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
>  		clk_put(info->clk);
>  	}
