Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqneJ-0003dk-7g
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 21:18:33 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 3D83441575
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 22:18:08 +0100 (CET)
Subject: Re: [PATCH v3 2/2] drivers mtd: spi-nor: add Macronix MX25Ux033E and
 MX25Ux035 variants
To: Alexander Kurz <akurz@blala.de>, Marek Vasut <marek.vasut@gmail.com>
References: <1489258865-831-1-git-send-email-akurz@blala.de>
 <1489258865-831-2-git-send-email-akurz@blala.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <ae9eea4f-90ea-2f37-5610-e3b078af53df@wedev4u.fr>
Date: Wed, 22 Mar 2017 22:18:00 +0100
MIME-Version: 1.0
In-Reply-To: <1489258865-831-2-git-send-email-akurz@blala.de>
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
> Macronix MX25U2033E, MX25U4033E and MX25U4035 devices are used in 4/5/6th
> generation Kindle ebook readers. Both MX25U403x variants share the same
> JEDEC id. Add those spi-nor variants and the similar MX25U8035 mentioned
> in the same set of datasheets.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
Applied to github/spi-nor

Thanks!

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 4fbd98c..3e14fd6 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1013,6 +1013,9 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
> +	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> +	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> 
