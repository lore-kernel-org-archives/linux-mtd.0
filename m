Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eFP8P-0006FD-FT
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 18:43:38 +0000
Date: Thu, 16 Nov 2017 19:43:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Angelo Dureghello <angelo@sysam.it>
Cc: linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH] [RESEND] mtd: spi-nor: add support for ISSI is25lp128
Message-ID: <20171116194311.7d648d41@bbrezillon>
In-Reply-To: <20171116135600.6lfrbnw5j2vckheo@jerusalem>
References: <20171116135600.6lfrbnw5j2vckheo@jerusalem>
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

Hello Angelo,

On Thu, 16 Nov 2017 14:56:01 +0100
Angelo Dureghello <angelo@sysam.it> wrote:

Can you please add a commit message here?

I'll let Cyrille comment on the patch itself.

Regards,

Boris

> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 19c000722cbc..88cd10a0ee9e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ISSI */
>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> +	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256, SECT_4K) },
>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
