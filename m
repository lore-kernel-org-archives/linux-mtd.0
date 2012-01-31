Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsKQV-0005zP-Ec
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 20:35:40 +0000
Received: by mail-lpp01m010-f49.google.com with SMTP id m7so303695laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 12:35:39 -0800 (PST)
Sender: Grant Likely <glikely@secretlab.ca>
Date: Tue, 31 Jan 2012 13:35:31 -0700
From: Grant Likely <grant.likely@secretlab.ca>
To: Barry Song <Barry.Song@csr.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
Message-ID: <20120131203531.GH22611@ponder.secretlab.ca>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
 workgroup.linux@csr.com, linux-mtd@lists.infradead.org,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Barry Song <Baohua.Song@csr.com>,
 David Woodhouse <dwmw2@infradead.org>, Erik Gilling <konkers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 06:00:00PM +0800, Barry Song wrote:
> From: Barry Song <Baohua.Song@csr.com>
> 
> this patch helps to move the common pattern from
> 
> "
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> if (!res) {
> 	ret = -ENODEV;
> 	goto err;
> }
> 
> base = devm_request_and_ioremap(&dev->dev, mem_res);
> if (!base) {
> 	ret = -ENODEV;
> 	goto err;
> }
> "
> 
> to
> 
> "
> base = platform_devm_request_and_ioremap(pdev, 0);
> if (!base) {
> 	ret = -ENODEV;
> 	goto err;
> }
> "
> 
> Signed-off-by: Barry Song <Baohua.Song@csr.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Erik Gilling <konkers@google.com>
> Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> Cc: David Woodhouse <dwmw2@infradead.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/base/platform.c         |   19 +++++++++++++++++++
>  include/linux/platform_device.h |    1 +
>  2 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index f0c605e..39ca0ab 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -72,6 +72,25 @@ struct resource *platform_get_resource(struct platform_device *dev,
>  EXPORT_SYMBOL_GPL(platform_get_resource);
>  
>  /**
> + * platform_devm_request_and_ioremap() - get resource, check, request region,
> + * and ioremap resource
> + * @dev: platform device
> + * @num: IOMEM resource index
> + */
> +void __iomem *platform_devm_request_and_ioremap(struct platform_device *dev,
> +	unsigned int num)
> +{
> +	struct resource *res;
> +
> +	res = platform_get_resource(dev, IORESOURCE_MEM, num);
> +	if (!res)
> +		return NULL;
> +
> +	return devm_request_and_ioremap(&dev->dev, res);
> +}
> +EXPORT_SYMBOL_GPL(platform_devm_request_and_ioremap);
> +
> +/**
>   * platform_get_irq - get an IRQ for a device
>   * @dev: platform device
>   * @num: IRQ number index
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 60e9994..768c0d7 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -44,6 +44,7 @@ extern struct device platform_bus;
>  
>  extern void arch_setup_pdev_archdata(struct platform_device *);
>  extern struct resource *platform_get_resource(struct platform_device *, unsigned int, unsigned int);
> +extern void __iomem *platform_devm_request_and_ioremap(struct platform_device *, unsigned int);
>  extern int platform_get_irq(struct platform_device *, unsigned int);
>  extern struct resource *platform_get_resource_byname(struct platform_device *, unsigned int, const char *);
>  extern int platform_get_irq_byname(struct platform_device *, const char *);
> -- 
> 1.7.1
> 
> 
> 
> Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
> More information can be found at www.csr.com. Follow CSR on Twitter at http://twitter.com/CSR_PLC and read our blog at www.csr.com/blog
