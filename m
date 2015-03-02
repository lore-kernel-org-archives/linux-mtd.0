Received: from nasmtp02.atmel.com ([204.2.163.16] helo=SJOEDG01.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSEkU-0002QK-5J
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 01:02:18 +0000
Message-ID: <54F3B66A.7040100@atmel.com>
Date: Mon, 2 Mar 2015 09:01:30 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: atmel_nand: fix typo in dev_err error message
References: <1425155276-8039-1-git-send-email-colin.king@canonical.com>
In-Reply-To: <1425155276-8039-1-git-send-email-colin.king@canonical.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Colin

On 3/1/2015 4:27 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Fix typo, "Unkown" -> "Unknown"
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch.
Acked-by: Josh Wu <josh.wu@atmel.com>

> ---
>   drivers/mtd/nand/atmel_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index d93c849..1310450 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1719,7 +1719,7 @@ static int nfc_wait_interrupt(struct atmel_nand_host *host, u32 flag)
>   		comp[index++] = &host->nfc->comp_cmd_done;
>   
>   	if (index == 0) {
> -		dev_err(host->dev, "Unkown interrupt flag: 0x%08x\n", flag);
> +		dev_err(host->dev, "Unknown interrupt flag: 0x%08x\n", flag);
>   		return -EINVAL;
>   	}
>   
Best Regards,
Josh Wu
