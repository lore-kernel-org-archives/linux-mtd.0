Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTBex-0000pv-E9
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 18:05:37 +0000
Received: by mail-lf0-x244.google.com with SMTP id v186so13621986lfa.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 10:05:14 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
To: Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <872915d9-07aa-bf4c-b9e1-09758230e7ca@gmail.com>
Date: Mon, 16 Jan 2017 17:06:16 +0100
MIME-Version: 1.0
In-Reply-To: <20170116151214.11195-1-bst@pengutronix.de>
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

On 01/16/2017 04:12 PM, Bastian Stender wrote:
> Since MRAM chips (like the Everspin mr25h40) are not sector organized
> they should be defined as n_sectors * 1 byte sectors. To be able to
> store the higher number of sectors n_sectors should be an unsigned 32
> bit integer just like sector_size.
> 
> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69d4857..c8399522c69d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -55,7 +55,7 @@ struct flash_info {
>  	 * necessarily called a "sector" by the vendor.
>  	 */
>  	unsigned	sector_size;
> -	u16		n_sectors;
> +	unsigned	n_sectors;

Make this u32 then , to make things consistent .

>  	u16		page_size;
>  	u16		addr_width;
> 


-- 
Best regards,
Marek Vasut
