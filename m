Received: from mail-pf0-f193.google.com ([209.85.192.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbauW-00086H-A2
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 22:40:27 +0000
Received: by mail-pf0-f193.google.com with SMTP id e4so12313884pfg.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 14:40:02 -0800 (PST)
Date: Wed, 8 Feb 2017 14:38:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Message-ID: <20170208223859.GK94627@google.com>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
 <1485368255-12038-2-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1485368255-12038-2-git-send-email-clg@kaod.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 25, 2017 at 07:17:34PM +0100, Cédric Le Goater wrote:
> This can be used to easily identify a specific chip on a system with
> multiple chips.
> 
> Drivers wanting to support this new label property will benefit from
> it without a change. They might want to check in the future that
> mtd->name is NULL before assigning a default name to the mtd device.
> Other drivers will keep the current behavior, which is to override
> mtd->name with their own value.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  Changes since v1:
> 
>  - moved the use of the "label" property from mtd_set_dev_defaults()
>    to mtd_set_of_node() to let drivers keep control on how mtd->name
>    is set and allocated.
> 
>  include/linux/mtd/mtd.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 13f8052b9ff9..f4fe15517295 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -24,6 +24,7 @@
>  #include <linux/uio.h>
>  #include <linux/notifier.h>
>  #include <linux/device.h>
> +#include <linux/of.h>
>  
>  #include <mtd/mtd-abi.h>
>  
> @@ -385,6 +386,7 @@ static inline void mtd_set_of_node(struct mtd_info *mtd,
>  				   struct device_node *np)
>  {
>  	mtd->dev.of_node = np;
> +	of_property_read_string(np, "label", &mtd->name);

Seems like this could be done only if '!mtd->name'?

As it stands, you're still clobbering some names, e.g. ones from
physmap_of.c. Notably, this driver already supports a "linux,mtd-name"
(which your new property should probably supersede), but it seems like
you're breaking compatibility.

Brian

>  }
>  
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
> -- 
> 2.7.4
> 
