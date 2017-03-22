Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqnTD-0006cx-UB
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 21:07:06 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 87B9F433C0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 22:06:40 +0100 (CET)
Subject: Re: [PATCH v3 1/2] drivers mtd: spi-nor: add Winbond W25Q20 variants
To: Alexander Kurz <akurz@blala.de>, Marek Vasut <marek.vasut@gmail.com>
References: <1489258865-831-1-git-send-email-akurz@blala.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <0d7e4325-901b-a6ca-9f96-e9a227fe7f10@wedev4u.fr>
Date: Wed, 22 Mar 2017 22:06:32 +0100
MIME-Version: 1.0
In-Reply-To: <1489258865-831-1-git-send-email-akurz@blala.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 11/03/2017 à 20:01, Alexander Kurz a écrit :
> Winbond W25Q20BW devices are used in 4/5th generation Kindle ebook readers.
> Add this spi-nor device and the similar W25Q20 devices to the list of known
> devices.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
Applied to github/spi-nor

Thanks!

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1ae872b..4fbd98c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1128,6 +1128,9 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
>  	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
> +	{ "w25q20cl", INFO(0xef4012, 0, 64 * 1024,  4, SECT_4K) },
> +	{ "w25q20bw", INFO(0xef5012, 0, 64 * 1024,  4, SECT_4K) },
> +	{ "w25q20ew", INFO(0xef6012, 0, 64 * 1024,  4, SECT_4K) },
>  	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
>  	{
>  		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
> 
