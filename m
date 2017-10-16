Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4DPi-00034g-Qi
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 21:59:13 +0000
Subject: Re: [PATCH] mtd: spi-nor: add support for is25lp032
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, linux-mtd@lists.infradead.org
References: <20170830193323.14478-1-sean.nyekjaer@prevas.dk>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <076fe56a-381c-591e-f5a8-c2438af8cceb@wedev4u.fr>
Date: Mon, 16 Oct 2017 23:58:48 +0200
MIME-Version: 1.0
In-Reply-To: <20170830193323.14478-1-sean.nyekjaer@prevas.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

Le 30/08/2017 à 21:33, Sean Nyekjaer a écrit :
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index cf1d4a15e10a..a764fe67b59c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ISSI */
>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> +	{ "is25lp032", INFO(0x9d4013, 0, 64 * 1024,  64, SECT_4K) },

I'm reading the IS25LP032 datasheet:
http://www.issi.com/WW/pdf/IS25LP032-064-128.pdf

Table 8.3 Product Identification states that the JEDEC ID should be
0x9d6016. Is the datasheet wrong or did you make a mistake on the memory
name ?

Best regards,

Cyrille


>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> 
