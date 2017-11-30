Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKWCg-0000NH-1i
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 21:17:08 +0000
Date: Thu, 30 Nov 2017 22:16:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpmi: replace _manual_ swap with swap macro
Message-ID: <20171130221643.65f79c58@bbrezillon>
In-Reply-To: <20171103203147.GA28309@embeddedor.com>
References: <20171103203147.GA28309@embeddedor.com>
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

On Fri, 3 Nov 2017 15:31:47 -0500
"Gustavo A. R. Silva" <garsilva@embeddedor.com> wrote:

> Make use of the swap macro and remove unnecessary variables swap.
> This makes the code easier to read and maintain.
> 
> This code was detected with the help of Coccinelle.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 50f8d4a..9e365d4 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1487,12 +1487,8 @@ static int gpmi_ecc_read_page_raw(struct mtd_info *mtd,
>  	 * See the layout description for a detailed explanation on why this
>  	 * is needed.
>  	 */
> -	if (this->swap_block_mark) {
> -		u8 swap = tmp_buf[0];
> -
> -		tmp_buf[0] = tmp_buf[mtd->writesize];
> -		tmp_buf[mtd->writesize] = swap;
> -	}
> +	if (this->swap_block_mark)
> +		swap(tmp_buf[0], tmp_buf[mtd->writesize]);
>  
>  	/*
>  	 * Copy the metadata section into the oob buffer (this section is
> @@ -1615,12 +1611,8 @@ static int gpmi_ecc_write_page_raw(struct mtd_info *mtd,
>  	 * See the layout description for a detailed explanation on why this
>  	 * is needed.
>  	 */
> -	if (this->swap_block_mark) {
> -		u8 swap = tmp_buf[0];
> -
> -		tmp_buf[0] = tmp_buf[mtd->writesize];
> -		tmp_buf[mtd->writesize] = swap;
> -	}
> +	if (this->swap_block_mark)
> +		swap(tmp_buf[0], tmp_buf[mtd->writesize]);
>  
>  	chip->write_buf(mtd, tmp_buf, mtd->writesize + mtd->oobsize);
>  
