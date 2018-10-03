Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7bJY-0004fK-Ns
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 07:11:26 +0000
Date: Wed, 3 Oct 2018 09:10:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, frieder.schrempf@exceet.de,
 computersforpeace@gmail.com, david.wolfe@nxp.com, han.xu@nxp.com,
 festevam@gmail.com, marek.vasut@gmail.com, prabhakar.kushwaha@nxp.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Support controllers with limited TX FIFO
 size
Message-ID: <20181003091058.07a13965@bbrezillon>
In-Reply-To: <1528870092-14526-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1528870092-14526-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

On Wed, 13 Jun 2018 11:38:12 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Some SPI controllers can't write nor->page_size bytes in a single
> step because their TX FIFO is too small.
> 
> Allow nor->write() to return a size that is smaller than the requested
> write size to gracefully handle this case.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e..3e63543 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1431,13 +1431,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  			goto write_err;
>  		*retlen += written;
>  		i += written;
> -		if (written != page_remain) {
> -			dev_err(nor->dev,
> -				"While writing %zu bytes written %zd bytes\n",
> -				page_remain, written);
> -			ret = -EIO;
> -			goto write_err;
> -		}
>  	}
>  
>  write_err:
