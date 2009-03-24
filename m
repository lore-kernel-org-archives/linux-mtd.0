Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LluPe-0006hF-T3
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 00:22:45 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KGZ00CC1IDE3B02@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 20:22:27 -0400 (EDT)
Date: Mon, 23 Mar 2009 20:22:26 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Daniel Mack <daniel@caiaq.de>
Subject: Re: [PATCH] pxa2xx-flash.c: fix memory leak
In-reply-to: <1237853943-6472-1-git-send-email-daniel@caiaq.de>
Message-id: <alpine.LFD.2.00.0903232021480.26337@xanadu.home>
References: <1237853943-6472-1-git-send-email-daniel@caiaq.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Mar 2009, Daniel Mack wrote:

> 
> Signed-off-by: Daniel Mack <daniel@caiaq.de>
> Cc: Nicolas Pitre <nico@cam.org>

Acked-by: Nicolas Pitre <nico@cam.org>


> ---
>  drivers/mtd/maps/pxa2xx-flash.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
> index 771139c..9d66881 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -70,6 +70,7 @@ static int __init pxa2xx_flash_probe(struct device *dev)
>  	if (!info->map.virt) {
>  		printk(KERN_WARNING "Failed to ioremap %s\n",
>  		       info->map.name);
> +		kfree(info);
>  		return -ENOMEM;
>  	}
>  	info->map.cached =
> @@ -92,6 +93,7 @@ static int __init pxa2xx_flash_probe(struct device *dev)
>  		iounmap((void *)info->map.virt);
>  		if (info->map.cached)
>  			iounmap(info->map.cached);
> +		kfree(info);
>  		return -EIO;
>  	}
>  	info->mtd->owner = THIS_MODULE;
> -- 
> 1.6.2
> 
