Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V83PG-0000aA-9e
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 07:16:11 +0000
Received: by mail-pb0-f41.google.com with SMTP id rp2so5280231pbb.28
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 00:15:46 -0700 (PDT)
Date: Sat, 10 Aug 2013 00:15:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 2/4] mtd: add a new sys node to show the ecc step size
Message-ID: <20130810071536.GA3467@norris.computersforpeace.net>
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
 <1368607606-4344-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1368607606-4344-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 15, 2013 at 04:46:44PM +0800, Huang Shijie wrote:
> Add a new sys node to show the ecc step size.
> The application then can uses this node to get the ecc step
> size.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/mtdcore.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c400c57..63903b9 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -285,6 +285,16 @@ static DEVICE_ATTR(bitflip_threshold, S_IRUGO | S_IWUSR,
>  		   mtd_bitflip_threshold_show,
>  		   mtd_bitflip_threshold_store);
>  
> +static ssize_t mtd_ecc_step_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->ecc_step);

ecc_step is an unsigned int, so why cast to unsigned long? Just use:

	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->ecc_step);

> +
> +}
> +static DEVICE_ATTR(ecc_step, S_IRUGO, mtd_ecc_step_show, NULL);
> +
>  static struct attribute *mtd_attrs[] = {
>  	&dev_attr_type.attr,
>  	&dev_attr_flags.attr,

...

Brian
