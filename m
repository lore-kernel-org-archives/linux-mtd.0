Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG4RZ-0000J5-0K
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 11:04:13 +0000
Received: by mail-pd0-f175.google.com with SMTP id r10so8240163pdi.6
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 04:03:52 -0700 (PDT)
Date: Sat, 9 Aug 2014 19:03:45 +0800
From: Huang Shijie <shijie8@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: remove duplicated w25q128 entry
Message-ID: <20140809110344.GA1674@localhost.localdomain>
References: <1407397622-9252-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1407397622-9252-1-git-send-email-zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 07, 2014 at 09:47:01AM +0200, Rafał Miłecki wrote:
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> This is based on top of
> mtd: spi-nor: factor out write_enable() for erase commands
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d08d9f8..06fe959 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -613,7 +613,6 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
>  	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
> -	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>  	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
> -- 
> 1.8.4.5
Acked-by: Huang Shijie <shijie8@gmail.com>
