Received: from nasmtp01.atmel.com ([192.199.1.246]
 helo=DVREDG02.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzh8W-0004IL-0V
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 08:33:40 +0000
Subject: Re: [PATCH v2 2/2] mtd: nand: atmel_nand: fix a possible NULL
 dereference
To: LABBE Corentin <clabbe.montjoie@gmail.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448005517-26004-3-git-send-email-clabbe.montjoie@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: Josh Wu <josh.wu@atmel.com>
Message-ID: <564EDACA.30204@atmel.com>
Date: Fri, 20 Nov 2015 16:33:14 +0800
MIME-Version: 1.0
In-Reply-To: <1448005517-26004-3-git-send-email-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Corentin

Thanks for the patch. It looks fine to me, just one nitpick in below:

On 11/20/2015 3:45 PM, LABBE Corentin wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later.
>
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>   drivers/mtd/nand/atmel_nand.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 475c938..7902967 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1496,8 +1496,9 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
>   	struct atmel_nand_data *board = &host->board;
>   	enum of_gpio_flags flags = 0;
>   
> -	host->caps = (struct atmel_nand_caps *)
> -		of_match_device(atmel_nand_dt_ids, host->dev)->data;
> +	host->caps = of_device_get_match_data(host->dev);
> +	if (!host->caps)
> +		return 1;

it's better to use -EINVAL here.

Best Regards,
Josh Wu

>   
>   	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
>   		if (val >= 32) {
