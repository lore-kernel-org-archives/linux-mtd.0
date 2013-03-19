Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHz4M-0002ji-Sy
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 16:07:25 +0000
Message-ID: <1363709327.17844.0.camel@linux-builds1>
Subject: Re: [PATCH 4/4] mtd: denali_dt: Remove redundant use of of_match_ptr
From: Dinh Nguyen <dinguyen@altera.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Tue, 19 Mar 2013 11:08:47 -0500
In-Reply-To: <1363599674-26933-4-git-send-email-sachin.kamat@linaro.org>
References: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
 <1363599674-26933-4-git-send-email-sachin.kamat@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: dwmw2@infradead.org, dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sachin,

On Mon, 2013-03-18 at 15:11 +0530, Sachin Kamat wrote:
> Since this driver is dt only and denali_nand_dt_ids is always
> compiled in, use of of_match_ptr() macro is not necessary.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/mtd/nand/denali_dt.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index 067a505..9253024 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -146,7 +146,7 @@ static struct platform_driver denali_dt_driver = {
>  	.driver		= {
>  		.name	= "denali-nand-dt",
>  		.owner	= THIS_MODULE,
> -		.of_match_table	= of_match_ptr(denali_nand_dt_ids),
> +		.of_match_table	= denali_nand_dt_ids,
>  	},
>  };
>  

Reviewed-by: Dinh Nguyen <dinguyen@altera.com>

for all 4 patches.

Thanks,
Dinh
