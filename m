Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAIgn-0006ru-Qi
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 17:22:32 +0000
Date: Sun, 22 Apr 2018 19:21:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for XM25QH64A and XM25QH128A
Message-ID: <20180422192151.1411c459@bbrezillon>
In-Reply-To: <20180418202532.15876-1-hauke@hauke-m.de>
References: <20180418202532.15876-1-hauke@hauke-m.de>
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

On Wed, 18 Apr 2018 22:25:32 +0200
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> These devices are produced by Wuhan Xinxin Semiconductor Manufacturing
> Corp. (XMC) and found on some routers from Chinese manufactures.
> 
> The data sheets can be found here:
> http://www.xmcwh.com/Uploads/2018-03-01/5a9799e4cb355.pdf
> http://www.xmcwh.com/Uploads/2018-02-05/5a77e6dbe968b.pdf
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 5bfa36e95f35..c453afa70ce2 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1230,6 +1230,10 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "3S400AN", S3AN_INFO(0x1f2400, 256, 264) },
>  	{ "3S700AN", S3AN_INFO(0x1f2500, 512, 264) },
>  	{ "3S1400AN", S3AN_INFO(0x1f2600, 512, 528) },
> +
> +	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
> +	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ },
>  };
>  
