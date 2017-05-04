Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d6HQp-0007f4-AL
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 14:08:39 +0000
Date: Thu, 4 May 2017 16:08:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Message-ID: <20170504160813.23bad4f9@bbrezillon>
In-Reply-To: <20170504121100.2709-1-colin.king@canonical.com>
References: <20170504121100.2709-1-colin.king@canonical.com>
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

On Thu,  4 May 2017 13:11:00 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
> in global scope.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, feel free to apply this patch directly if you want, otherwise,
I'll queue it for 4.13.

> ---
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d474378ed810..d3a735012b81 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -202,7 +202,7 @@ static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
>  	return 0;
>  }
>  
> -const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
> +static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
>  	.ecc = nand_ooblayout_ecc_lp_hamming,
>  	.free = nand_ooblayout_free_lp_hamming,
>  };
