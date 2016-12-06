Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEL7D-00020M-Gb
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 19:09:26 +0000
Received: by mail-wj0-x242.google.com with SMTP id kp2so45650535wjc.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 11:09:01 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <096f8b4c-b00a-af89-e667-7385226c2e7e@gmail.com>
Date: Tue, 6 Dec 2016 20:00:15 +0100
MIME-Version: 1.0
In-Reply-To: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/06/2016 06:14 PM, Cyrille Pitchen wrote:
> This patch removes the WARN_ONCE() test in spi_nor_write().
> This macro triggers the display of a warning message almost every time we
> use a UBI file-system because a write operation is performed at offset 64,
> which is in the middle of the SPI NOR memory page. This is a valid
> operation for ubifs.

Is that a valid operation for all spi nors ?

> Hence this warning is pretty annoying and useless so we just remove it.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Suggested-by: Richard Weinberger <richard@nod.at>
> Suggested-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c9bcd05ca5d9..cdeb2c6b1492 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1265,9 +1265,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		ssize_t written;
>  
>  		page_offset = (to + i) & (nor->page_size - 1);
> -		WARN_ONCE(page_offset,
> -			  "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
> -			  page_offset);
>  		/* the size of data remaining on the first page */
>  		page_remain = min_t(size_t,
>  				    nor->page_size - page_offset, len - i);
> 


-- 
Best regards,
Marek Vasut
