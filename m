Received: from nasmtp01.atmel.com ([192.199.1.246]
 helo=DVREDG02.corp.atmel.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzh3t-0002Jg-H1
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 08:28:54 +0000
Subject: Re: [PATCH v2 1/2] mtd: nand: atmel_nand: constify atmel_nand_caps
 structures
To: LABBE Corentin <clabbe.montjoie@gmail.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448005517-26004-2-git-send-email-clabbe.montjoie@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: Josh Wu <josh.wu@atmel.com>
Message-ID: <564ED99A.2050502@atmel.com>
Date: Fri, 20 Nov 2015 16:28:10 +0800
MIME-Version: 1.0
In-Reply-To: <1448005517-26004-2-git-send-email-clabbe.montjoie@gmail.com>
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

Thanks for the patch.

On 11/20/2015 3:45 PM, LABBE Corentin wrote:
> All atmel_nand_caps are never modified, consitify them.
>
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Acked-by: Josh Wu <josh.wu@atmel.com>

Best Regards,
Josh Wu
> ---
>   drivers/mtd/nand/atmel_nand.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 583cdd9..475c938 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -128,7 +128,7 @@ struct atmel_nand_host {
>   
>   	struct atmel_nfc	*nfc;
>   
> -	struct atmel_nand_caps	*caps;
> +	const struct atmel_nand_caps	*caps;
>   	bool			has_pmecc;
>   	u8			pmecc_corr_cap;
>   	u16			pmecc_sector_size;
> @@ -2304,11 +2304,11 @@ static int atmel_nand_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static struct atmel_nand_caps at91rm9200_caps = {
> +static const struct atmel_nand_caps at91rm9200_caps = {
>   	.pmecc_correct_erase_page = false,
>   };
>   
> -static struct atmel_nand_caps sama5d4_caps = {
> +static const struct atmel_nand_caps sama5d4_caps = {
>   	.pmecc_correct_erase_page = true,
>   };
>   
