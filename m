Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ybf0M-0007Mv-MG
 for linux-mtd@lists.infradead.org; Sat, 28 Mar 2015 00:53:39 +0000
Received: by pacwe9 with SMTP id we9so110365529pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 17:53:16 -0700 (PDT)
Date: Fri, 27 Mar 2015 17:53:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH v3 2/3] mtd: part: Add sysfs variable for offset of
 partition
Message-ID: <20150328005313.GB32500@ld-irv-0074>
References: <1427484257-13708-1-git-send-email-dehrenberg@chromium.org>
 <1427484257-13708-3-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427484257-13708-3-git-send-email-dehrenberg@chromium.org>
Cc: Richard Weinberger <richard@nod.at>, gwendal@chromium.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 27, 2015 at 12:24:16PM -0700, Dan Ehrenberg wrote:
> This patch makes a sysfs variable called 'offset' on each partition
> which contains the offset in bytes from the beginning of the master
> device that the partition starts.
> 
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/mtdpart.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index a19ec5a..b8ed202 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -554,6 +554,30 @@ out_register:
>  	return slave;
>  }
>  
> +static ssize_t mtd_partition_offset_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +	struct mtd_part *part = PART(mtd);
> +	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
> +}
> +
> +static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);

You'll want #include <linux/device.h>, just to be explicit.

And if you're adding to the sysfs ABI, please update
Documentation/ABI/testing/sysfs-class-mtd

> +
> +const static struct attribute *mtd_partition_attrs[] = {

gcc complains:

  drivers/mtd/mtdpart.c:568:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

> +	&dev_attr_offset.attr,
> +	NULL
> +};
> +
> +int mtd_add_partition_attrs(struct mtd_part *new)

gcc and sprase complain:

  drivers/mtd/mtdpart.c:573:5: warning: no previous prototype for 'mtd_add_partition_attrs' [-Wmissing-prototypes]
  drivers/mtd/mtdpart.c:573:5: warning: symbol 'mtd_add_partition_attrs' was not declared. Should it be static? [sparse]

> +{
> +	int ret = sysfs_create_files(&new->mtd.dev.kobj, mtd_partition_attrs);
> +	if (ret)
> +		printk(KERN_WARNING
> +		       "mtd: failed to create partition attrs, err=%d\n", ret);
> +	return ret;
> +}
> +
>  int mtd_add_partition(struct mtd_info *master, const char *name,
>  		      long long offset, long long length)
>  {
> @@ -603,6 +627,8 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>  
>  	add_mtd_device(&new->mtd);
>  
> +	mtd_add_partition_attrs(new);

Hmm, so you're adding the partition attribute only to dynamically
created partitions? I think we'll want it for all partitions. I know
the naming isn't completely straightforward, but some partitions are
added through add_mtd_device(), without calling mtd_add_partition().

> +
>  	return ret;
>  err_inv:
>  	mutex_unlock(&mtd_partitions_mutex);
> @@ -620,6 +646,8 @@ int mtd_del_partition(struct mtd_info *master, int partno)
>  	list_for_each_entry_safe(slave, next, &mtd_partitions, list)
>  		if ((slave->master == master) &&
>  		    (slave->mtd.index == partno)) {
> +			sysfs_remove_files(&slave->mtd.dev.kobj,
> +					   mtd_partition_attrs);
>  			ret = del_mtd_device(&slave->mtd);
>  			if (ret < 0)
>  				break;
> @@ -663,6 +691,7 @@ int add_mtd_partitions(struct mtd_info *master,
>  		mutex_unlock(&mtd_partitions_mutex);
>  
>  		add_mtd_device(&slave->mtd);
> +		mtd_add_partition_attrs(slave);
>  
>  		cur_offset = slave->offset + slave->mtd.size;
>  	}

Brian
