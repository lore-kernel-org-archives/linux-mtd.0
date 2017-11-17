Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFkA3-0006wf-WA
 for linux-mtd@lists.infradead.org; Fri, 17 Nov 2017 17:10:42 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add support for ISSI is25lp128
To: Angelo Dureghello <angelo@sysam.it>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com
References: <20171116190950.odsscmakabyi26cc@jerusalem>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <429524c9-8534-fcef-5d5c-133eb4cb468d@wedev4u.fr>
Date: Fri, 17 Nov 2017 18:10:05 +0100
MIME-Version: 1.0
In-Reply-To: <20171116190950.odsscmakabyi26cc@jerusalem>
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

Hi Angelo,

Le 16/11/2017 à 20:09, Angelo Dureghello a écrit :
> Add support for ISSI is25lp128 spi nor flash.
> 
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

I've checked both datasheets for is25cd512 and is25lp128 because I was
surprised to see different manufacturer IDs in the JEDEC IDs: I suspected
some mistake in one of the two entries above.

Then I found this old discussion on patchwork:
https://patchwork.ozlabs.org/patch/581017/

I looked closer at the is25cd512 datasheet and actually I confirmed that it
is stated that the manufacturer ID is received as the 2nd data byte after
the 9Fh op code. So both entries are correct and this is not a bug of the
is25cd512 memory part: it is documented so it is a feature, right?

Anyway, I plan to add another patch on top of yours just to add a comment
otherwise it might not be the last time that someone is puzzled with this
quirk.

Then back to your patch, is25lp128's datasheet states that this memory
parts support the Fast Read 1-1-2 (Dual Output), the Fast Read 1-4-4 (Quad
I/O) but strangely not the Fast Read 1-1-4 (Quad Output). Also I see that
the Read SFDP (5Ah) op code is supported too.
So could you please add the SPI_NOR_DUAL_READ flag but _not_ the
SPI_NOR_QUAD_READ flag in your new entry for is25lp128 ?

Indeed, currently at least one of the two SPI_NOR_{DUAL|QUAD}_READ flags is
needed to enabled the parsing of SFDP tables and I would like this parsing
to be enabled for this memory part since its datasheet claims that SFDP is
supported. Right now, this is the only mean to allow using SPI 1-4-4 with
SPI controllers that support this SPI protocol too.

Best regards,

Cyrille

>  
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> 
