Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9bwk-0008TC-Gl
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 19:43:52 +0000
Date: Fri, 20 Apr 2018 21:43:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtdcore: add writeable attribute in sysfs
Message-ID: <20180420214327.25b8ac15@bbrezillon>
In-Reply-To: <20180412134232.14006-1-charles-antoine.couret@essensium.com>
References: <20180412134232.14006-1-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles-Antoine,

On Thu, 12 Apr 2018 15:42:32 +0200
Charles-Antoine Couret <charles-antoine.couret@essensium.com> wrote:

> MTD devices read-write or read-only property could be set by the bootloader with
> the mtdparts argument but there is no way to change this definition at runtime
> on Linux. The flags can be read but can not be changed.
> 
> This patch adds the possibility to force a MTD device to be read-only or read-write
> even if the bootloader requested something else. The purpose is to offer to
> the user of a device to eventually change something that is not allowed
> like updating the bootloader or change its environement.

Hm, why don't you remove the RO constraint on such partitions then? I
mean, if the device can be written, even rarely, it's no longer a
read-only device.

> 
> Or to protect the device without using mtdro virtual device to read the content.

What's the point? Only root can access /dev/mtdX. Looks like you want
to protect against inadvertent write to the wrong MTD dev, but I'm not
sure this is the kernel responsibility to enforce that.

Missing Signed-off-by tag.

> ---
>  drivers/mtd/mtdcore.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 807d17d863b3..3a9a7055ee53 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -158,6 +158,39 @@ static ssize_t mtd_flags_show(struct device *dev,
>  }
>  static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
>  
> +static ssize_t mtd_writeable_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)

Please align parameters on the open-parenthesis.

> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +	unsigned int writeable = mtd->flags & MTD_WRITEABLE ? 1 : 0;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", writeable);
> +
> +}
> +
> +static ssize_t mtd_writeable_store(struct device *dev,
> +					   struct device_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +	unsigned int writeable;
> +	int retval;
> +
> +
> +	retval = kstrtouint(buf, 0, &writeable);
> +	if (retval)
> +		return retval;
> +
> +	if (writeable)
> +		mtd->flags |= MTD_WRITEABLE;
> +	else
> +		mtd->flags &= ~MTD_WRITEABLE;

What happens if you turn a RW device into a RO while it's still being
used by someone? Not sure at all this is safe.

Regards,

Boris

> +
> +	return count;
> +}
> +static DEVICE_ATTR(writeable, S_IRUGO | S_IWUSR, mtd_writeable_show,
> +	mtd_writeable_store);
> +
>  static ssize_t mtd_size_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> @@ -322,6 +355,7 @@ static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
>  static struct attribute *mtd_attrs[] = {
>  	&dev_attr_type.attr,
>  	&dev_attr_flags.attr,
> +	&dev_attr_writeable.attr,
>  	&dev_attr_size.attr,
>  	&dev_attr_erasesize.attr,
>  	&dev_attr_writesize.attr,
