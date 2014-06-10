Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuVIW-0005y3-Ch
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 23:17:44 +0000
Received: by mail-qa0-f53.google.com with SMTP id j5so1353376qaq.12
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jun 2014 16:17:23 -0700 (PDT)
Date: Tue, 10 Jun 2014 16:17:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for EON EN25QH128
Message-ID: <20140610231719.GJ3599@ld-irv-0074>
References: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
Cc: Linux MTD list <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergey,

On Wed, Jun 11, 2014 at 02:35:42AM +0400, Sergey Ryazanov wrote:
> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)

Please rebase on l2-mtd.git. This table has moved to
drivers/mtd/spi-nor/

> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 524dab3..ad1399d 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -909,6 +909,7 @@ static const struct spi_device_id m25p_ids[] = {
>  	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
> +	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>  	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>  
>  	/* ESMT */

Brian
