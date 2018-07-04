Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fad6n-0008PW-7y
 for linux-mtd@lists.infradead.org; Wed, 04 Jul 2018 08:26:00 +0000
Date: Wed, 4 Jul 2018 10:25:31 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "David Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Peter
 Pan <peterpandong@micron.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: spinand: Fix missing unlock on error path
Message-ID: <20180704102531.7af9a2e6@bbrezillon>
In-Reply-To: <1530692979-6274-1-git-send-email-weiyongjun1@huawei.com>
References: <1530692979-6274-1-git-send-email-weiyongjun1@huawei.com>
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

On Wed, 4 Jul 2018 08:29:39 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Add the missing unlock before return from function
> spinand_mtd_(read|write) in the error handling case.
> 
> Fixes: c898e0526fb6 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/nand/spi/core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 17d207a..8ac1ba95 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -560,12 +560,16 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>  
>  	nanddev_io_for_each_page(nand, from, ops, &iter) {
>  		ret = spinand_select_target(spinand, iter.req.pos.target);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&spinand->lock);
>  			return ret;
> +		}

Why not
		if (ret)
			break;

?

>  
>  		ret = spinand_ecc_enable(spinand, enable_ecc);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&spinand->lock);
>  			return ret;
> +		}

Ditto.

>  
>  		ret = spinand_read_page(spinand, &iter.req, enable_ecc);
>  		if (ret < 0 && ret != -EBADMSG)
> @@ -609,11 +613,11 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
>  	nanddev_io_for_each_page(nand, to, ops, &iter) {
>  		ret = spinand_select_target(spinand, iter.req.pos.target);
>  		if (ret)
> -			return ret;
> +			break;
>  
>  		ret = spinand_ecc_enable(spinand, enable_ecc);
>  		if (ret)
> -			return ret;
> +			break;
>  
>  		ret = spinand_write_page(spinand, &iter.req);
>  		if (ret)
> 
