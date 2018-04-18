Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8wex-0005qT-MX
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2018 23:38:46 +0000
Received: by mail-wr0-x242.google.com with SMTP id u11-v6so9093885wri.12
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2018 16:38:32 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add support for XM25QH64A and XM25QH128A
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
References: <20180418202532.15876-1-hauke@hauke-m.de>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <48427f0e-cd32-15c2-d032-73d9a26b0cd3@gmail.com>
Date: Wed, 18 Apr 2018 23:02:55 +0200
MIME-Version: 1.0
In-Reply-To: <20180418202532.15876-1-hauke@hauke-m.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/18/2018 10:25 PM, Hauke Mehrtens wrote:
> These devices are produced by Wuhan Xinxin Semiconductor Manufacturing
> Corp. (XMC) and found on some routers from Chinese manufactures.
> 
> The data sheets can be found here:
> http://www.xmcwh.com/Uploads/2018-03-01/5a9799e4cb355.pdf
> http://www.xmcwh.com/Uploads/2018-02-05/5a77e6dbe968b.pdf
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

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
> 


-- 
Best regards,
Marek Vasut
