Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMXH-0007e6-KG
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:40:48 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so10499663pdj.39
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:40:26 -0800 (PST)
Date: Mon, 1 Dec 2014 00:40:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
Message-ID: <20141201084023.GH29070@brian-ubuntu>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
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

On Wed, Oct 22, 2014 at 06:05:00PM +0200, Rafał Miłecki wrote:
> This will allow spi-nor users to plainly use JEDEC to detect flash chip.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ee777a4..1facaac 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -937,13 +937,21 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  	if (ret)
>  		return ret;
>  
> -	id = spi_nor_match_id(name);
> +	/* Try to auto-detect if chip name wasn't specified */
> +	if (!name)
> +		id = spi_nor_read_id(nor);
> +	else
> +		id = spi_nor_match_id(name);
>  	if (!id)
>  		return -ENOENT;
>  
>  	info = (void *)id->driver_data;
>  
> -	if (info->jedec_id) {
> +	/*
> +	 * If caller has specified name of flash model that can normally be
> +	 * detected using JEDEC, let's verify it.
> +	 */
> +	if (name && info->jedec_id) {

This part doesn't apply cleanly any more.

>  		const struct spi_device_id *jid;
>  
>  		jid = spi_nor_read_id(nor);

I think this is a good time to consider this question: how do we
*really* want a SPI NOR driver to interact with spi-nor.c, regarding
device detection? I like how this patch removes the string-matching
requirement, so we can just auto-detect by JEDEC RDID alone. But I don't
like how it leaves around the function parameter 'name', which really
we should really be moving to deprecate if possible.

Anyway, I can take a rebased version of this patch. But I'd like to
encourage more thought here for the future. I don't yet have a specific
proposal, so any thoughts are welcome.

Brian
