Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2DNc-0002KP-Tf
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 07:55:57 +0000
Date: Mon, 16 May 2016 09:55:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 moritz.fischer.private@gmail.com
Subject: Re: [PATCH] mtd: Adding of_mtd_info_get to get mtd_info from
 devicetree
Message-ID: <20160516095534.727fcac6@bbrezillon>
In-Reply-To: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
References: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
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

Hi Moritz,

On Wed, 11 May 2016 10:47:39 -0700
Moritz Fischer <moritz.fischer@ettus.com> wrote:

> This allows for getting a struct mtd_info from a node pointer,
> allowing mtd devices to e.g. store serial numbers or MAC addresses.

Can you detail a bit what you'll do next. I guess you need to provide
this information to in-kernel users, and those users will just call
mtd_read() after retrieving the mtd_info pointer.

Here are a few questions (I'm assuming the netdev + MAC address case):
- how would you link the net/PHY device to the MTD partition storing
  the MAC address

> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  drivers/mtd/mtdcore.c   | 21 +++++++++++++++++++++
>  include/linux/mtd/mtd.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3096251..3d0ae65 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -363,6 +363,27 @@ unsigned mtd_mmap_capabilities(struct mtd_info *mtd)
>  EXPORT_SYMBOL_GPL(mtd_mmap_capabilities);
>  #endif
>  
> +static int mtd_of_node_match(struct device *dev, const void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +struct mtd_info *of_mtd_info_get(struct device_node *node)
> +{
> +	struct mtd_info *mtd;
> +	struct device *d;
> +	int ret = -ENODEV;
> +
> +	d = class_find_device(&mtd_class, NULL, node, mtd_of_node_match);
> +	if (!d)
> +		return ERR_PTR(-ENODEV);
> +
> +	mtd = container_of(d, struct mtd_info, dev);
> +
> +	return mtd;
> +}
> +EXPORT_SYMBOL_GPL(of_mtd_info_get);
> +
>  static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
>  			       void *cmd)
>  {
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 7712721..cce6cc7 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -264,6 +264,8 @@ static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
>  	return mtd->dev.of_node;
>  }
>  
> +struct mtd_info *of_mtd_info_get(struct device_node *node);
> +
>  static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops *ops)
>  {
>  	return ops->mode == MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->oobsize;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
