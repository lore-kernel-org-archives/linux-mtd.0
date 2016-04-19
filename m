Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asTSM-0003RZ-Ls
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 11:04:36 +0000
Subject: Re: [PATCH] mtd: nand: jz4740: Remove unused local variable
To: Maarten ter Huurne <maarten@treewalker.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
References: <1460995496-11666-1-git-send-email-maarten@treewalker.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <571610AC.2010002@imgtec.com>
Date: Tue, 19 Apr 2016 12:04:12 +0100
MIME-Version: 1.0
In-Reply-To: <1460995496-11666-1-git-send-email-maarten@treewalker.org>
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

Hi Maarten,

On 18/04/16 17:04, Maarten ter Huurne wrote:
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>   drivers/mtd/nand/jz4740_nand.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
> index 673ceb2..2f39ee1 100644
> --- a/drivers/mtd/nand/jz4740_nand.c
> +++ b/drivers/mtd/nand/jz4740_nand.c
> @@ -221,7 +221,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
>   	struct jz_nand *nand = mtd_to_jz_nand(mtd);
>   	int i, error_count, index;
>   	uint32_t reg, status, error;
> -	uint32_t t;
>   	unsigned int timeout = 1000;
>
>   	for (i = 0; i < 9; ++i)
>

Acked-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks,

Harvey
