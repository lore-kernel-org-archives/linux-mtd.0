Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePEBN-0004ar-4b
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 21:03:14 +0000
Date: Wed, 13 Dec 2017 22:02:41 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fix memory leak on ep on error exit returns
Message-ID: <20171213220241.29bbe131@bbrezillon>
In-Reply-To: <20171213204909.28287-1-colin.king@canonical.com>
References: <20171213204909.28287-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Colin,

On Wed, 13 Dec 2017 20:49:09 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two error return paths that are not kfree'ing ep that
> lead to memory leaks.  Fix this by exiting on error via the
> ext_out exit path that performs the necessary kfree.

Well, given that no one implements the ->exec_op() hook yet, the
xxxx_op() functions always return 0 right now, but I agree, we
should fix the generic case. 

> 
> Detected by CoverityScan, CID#1462747 ("Resource Leak")
> 
> Fixes: b83ea87958c5 ("mtd: nand: provide several helpers to do common NAND operations")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

If you don't mind, I'd like to squash these changes in the original
commit.

Thanks,

Boris

> ---
>  drivers/mtd/nand/nand_base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index eb810d5d44e7..1c5126d1db8c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -5046,14 +5046,14 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
>  	/* Send our own NAND_CMD_PARAM. */
>  	ret = nand_read_param_page_op(chip, 0, NULL, 0);
>  	if (ret)
> -		return ret;
> +		goto ext_out;
>  
>  	/* Use the Change Read Column command to skip the ONFI param pages. */
>  	ret = nand_change_read_column_op(chip,
>  					 sizeof(*p) * p->num_of_param_pages,
>  					 ep, len, true);
>  	if (ret)
> -		return ret;
> +		goto ext_out;
>  
>  	ret = -EINVAL;
>  	if ((onfi_crc16(ONFI_CRC_BASE, ((uint8_t *)ep) + 2, len - 2)
