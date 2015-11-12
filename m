Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwnbf-0007DC-6s
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:51:48 +0000
Date: Thu, 12 Nov 2015 09:51:20 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] mtd: grab a reference to the MTD of_node before
 registering it
Message-ID: <20151112095120.5ae32efd@bbrezillon>
In-Reply-To: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
References: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
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

On Wed, 11 Nov 2015 16:26:04 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> We now stick the device node representing the current MTD (if any) into
> sysfs, so let's make sure we have a reference to it before doing that.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks good to me,

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index a91cee90aef9..c393a1155376 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -32,6 +32,7 @@
>  #include <linux/err.h>
>  #include <linux/ioctl.h>
>  #include <linux/init.h>
> +#include <linux/of.h>
>  #include <linux/proc_fs.h>
>  #include <linux/idr.h>
>  #include <linux/backing-dev.h>
> @@ -454,6 +455,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	mtd->dev.devt = MTD_DEVT(i);
>  	dev_set_name(&mtd->dev, "mtd%d", i);
>  	dev_set_drvdata(&mtd->dev, mtd);
> +	of_node_get(mtd_get_of_node(mtd));
>  	error = device_register(&mtd->dev);
>  	if (error)
>  		goto fail_added;
> @@ -476,6 +478,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	return 0;
>  
>  fail_added:
> +	of_node_put(mtd_get_of_node(mtd));
>  	idr_remove(&mtd_idr, i);
>  fail_locked:
>  	mutex_unlock(&mtd_table_mutex);
> @@ -517,6 +520,7 @@ int del_mtd_device(struct mtd_info *mtd)
>  		device_unregister(&mtd->dev);
>  
>  		idr_remove(&mtd_idr, mtd->index);
> +		of_node_put(mtd_get_of_node(mtd));
>  
>  		module_put(THIS_MODULE);
>  		ret = 0;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
