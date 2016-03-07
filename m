Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad2lO-0003cJ-Ry
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 21:32:27 +0000
Received: by mail-pf0-x22d.google.com with SMTP id x188so62689239pfb.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 13:32:05 -0800 (PST)
Date: Mon, 7 Mar 2016 13:32:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nikita Nazarenko <nnazarenko@radiofid.com>
Cc: linux-mtd@lists.infradead.org, Gabor Juhos <juhosg@openwrt.org>,
 Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for ISSI is25lp128
Message-ID: <20160307213202.GA52131@google.com>
References: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Gabor, who submitted the other ISSI entry; and some others

On Tue, Feb 09, 2016 at 09:12:43PM +0300, Nikita Nazarenko wrote:
> Signed-off-by: Nikita Nazarenko <nnazarenko@radiofid.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ed0c19c..e0bb151 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -739,6 +739,7 @@ static const struct flash_info spi_nor_ids[] = {
>  
>  	/* ISSI */

Both of these ISSI entries look wrong.

>  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },

Looking at the datasheet for this part [1], shouldn't the ID be
0x9d7f20 (i.e., the MFR ID is 0x9d, not 0x7f)? That would match the
existing CFI definition for "PMC". And IIUC, PMC got bought by ISSI? Or
some kind of merger, I don't follow these things.

> +	{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },

This datasheet [1] says that for SPI mode (not QPI mode), 4K erase is
done with opcode 0xD7 (i.e., SPINOR_OP_BE_4K_PMC) not 0x20
(SPINOR_OP_BE_4K). So we would need the SECT_4K_PMC, not the SECT_4K
flag.

Also, the datasheet for this device says it supports 64K sectors, and
the 32K sectors require a different erase command (SPINOR_OP_BE_32K; not
currently supported in this driver). Did you test erase to be sure it
worked as expected? Or are one or more datasheets wrong?

Regards,
Brian

>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },

[1] I'm looking at these:

http://www.issi.com/WW/pdf/25LP128.pdf
http://www.issi.com/WW/pdf/25CD512-010-020.pdf
