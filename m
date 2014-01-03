Received: from mail-oa0-x22d.google.com ([2607:f8b0:4003:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzA5z-0005ns-3S
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 19:07:47 +0000
Received: by mail-oa0-f45.google.com with SMTP id g12so995102oah.18
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 11:07:25 -0800 (PST)
Date: Fri, 3 Jan 2014 11:07:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Hou Zhiqiang <b48286@freescale.com>
Subject: Re: [PATCH v2] mtd: m25p80: Add Power Management support
Message-ID: <20140103190720.GH5631@ld-irv-0074>
References: <1386826716-20476-1-git-send-email-b48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386826716-20476-1-git-send-email-b48286@freescale.com>
Cc: Marek Vasut <marex@denx.de>, grant.likely@secretlab.ca,
 linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, Mingkai.Hu@freescale.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 12, 2013 at 01:38:36PM +0800, Hou Zhiqiang wrote:
> Add PM support using callback function suspend and resume in
> .driver.pm of spi_driver.
> 
> Signed-off-by: Hou Zhiqiang <b48286@freescale.com>
> ---
> v2:
>  - Replace .driver.suspend and .driver.resume with .driver.pm
>  - Use CONFIG_PM_SLEEP instead of CONFIG_PM

Just noticed v2... My v1 comments still apply.

> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1128,11 +1130,46 @@ static int m25p_remove(struct spi_device *spi)
...
> +static const struct dev_pm_ops m25p_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(m25p_suspend, m25p_resume)
> +};

This could just be:

static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);

>  
>  static struct spi_driver m25p80_driver = {
>  	.driver = {
>  		.name	= "m25p80",
>  		.owner	= THIS_MODULE,
> +		.pm	= &m25p_pm,
>  	},
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,

Brian
