Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmBSt-0002sJ-Ro
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 03:43:43 +0000
Received: by mail-wm0-x241.google.com with SMTP id z63so318216wmg.2
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 19:43:19 -0800 (PST)
Subject: Re: [PATCH v2] drivers mtd: spi-nor: add new variants
To: Alexander Kurz <akurz@blala.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1488491946-12176-1-git-send-email-akurz@blala.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <13bcdcc3-8a7b-3cba-d69d-110fa948a7c3@gmail.com>
Date: Fri, 10 Mar 2017 04:42:40 +0100
MIME-Version: 1.0
In-Reply-To: <1488491946-12176-1-git-send-email-akurz@blala.de>
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

On 03/02/2017 10:59 PM, Alexander Kurz wrote:
> Macronix MX25U4035 and Winbond 25Q20BW devices are used in 4/5th
> generation Kindle ebook readers. Add those spi-nor variants.
> Also add similar devices found in the same datasheets.

It'd be nice to split it into two separate patches, each one adding one
manufacturer of devices and having $subject reflect that. Otherwise it's
IMO OK.

> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1ae872b..802dc49 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1013,6 +1013,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> +	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> @@ -1128,6 +1130,9 @@ static const struct flash_info spi_nor_ids[] = {
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


-- 
Best regards,
Marek Vasut
