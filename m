Received: from mail-by2on0068.outbound.protection.outlook.com ([207.46.100.68]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgwT5-0003Ls-EC
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 15:05:24 +0000
Message-ID: <560AA7B6.3010505@opensource.altera.com>
Date: Tue, 29 Sep 2015 10:01:10 -0500
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>
CC: <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>,
 Alan Tull <atull@opensource.altera.com>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>
Subject: Re: [PATCH] mtd: nand: denali: max_banks calculation changed in
 revision 5.1
References: <1437489571-916-1-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1437489571-916-1-git-send-email-grmoore@opensource.altera.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Howdy folks,

Any comment on this patch?  Is anyone else using Denali NAND rev 5.1 
controller?

Thanks,
Graham

On 07/21/2015 09:39 AM, Graham Moore wrote:
> Read Denali hardware revision number and use it to
> calculate max_banks,  The encoding of max_banks changed
> in Denali revision 5.1.
>
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
>   drivers/mtd/nand/denali.c |   11 ++++++++++-
>   drivers/mtd/nand/denali.h |    2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 870c7fc..a98b41e 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -458,8 +458,17 @@ static void find_valid_banks(struct denali_nand_info *denali)
>   static void detect_max_banks(struct denali_nand_info *denali)
>   {
>   	uint32_t features = ioread32(denali->flash_reg + FEATURES);
> +	/*
> +	 * Read the revision register, so we can calculate the max_banks
> +	 * properly: the encoding changed from rev 5.0 to 5.1
> +	 */
> +	u32 revision = MAKE_COMPARABLE_REVISION(
> +				ioread32(denali->flash_reg + REVISION));
>
> -	denali->max_banks = 2 << (features & FEATURES__N_BANKS);
> +	if (revision < REVISION_5_1)
> +		denali->max_banks = 2 << (features & FEATURES__N_BANKS);
> +	else
> +		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
>   }
>
>   static void detect_partition_feature(struct denali_nand_info *denali)
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index 145bf88..4bf13bb 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -178,6 +178,8 @@
>
>   #define REVISION				0x370
>   #define     REVISION__VALUE				0xffff
> +#define MAKE_COMPARABLE_REVISION(x)		swab16(x & REVISION__VALUE)
> +#define REVISION_5_1				0x00000501
>
>   #define ONFI_DEVICE_FEATURES			0x380
>   #define     ONFI_DEVICE_FEATURES__VALUE			0x003f
>
