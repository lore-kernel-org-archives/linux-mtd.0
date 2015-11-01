Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zt22v-00058T-Jw
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2015 23:28:22 +0000
Date: Mon, 2 Nov 2015 00:27:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>, Scott
 Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu
 <han.xu@freescale.com>
Subject: Re: [PATCH v2 01/11] mtd: add get/set of_node/flash_node helpers
Message-ID: <20151102002758.51e34a71@bbrezillon>
In-Reply-To: <1446262410-45754-2-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-2-git-send-email-computersforpeace@gmail.com>
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

On Fri, 30 Oct 2015 20:33:20 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> We are going to begin using the mtd->dev.of_node field for MTD device
> nodes, so let's add helpers for it. Also, we'll be making some
> conversions on spi_nor (and nand_chip eventually) too, so get that ready
> with their own helpers.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2: new
> 
>  include/linux/mtd/mtd.h     | 11 +++++++++++
>  include/linux/mtd/nand.h    | 11 +++++++++++
>  include/linux/mtd/spi-nor.h | 11 +++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f17fa75809aa..cc84923011c0 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -254,6 +254,17 @@ struct mtd_info {
>  	int usecount;
>  };
>  
> +static inline void mtd_set_of_node(struct mtd_info *mtd,
> +				   struct device_node *np)
> +{
> +	mtd->dev.of_node = np;

Maybe we should retain a reference to the device_node here (IOW,
replace '= np' by '= of_node_get(np)'). Of course this implies calling
of_node_put() when the mtd device is unregistered.

> +}
> +
> +static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
> +{
> +	return mtd->dev.of_node;

Not sure this is relevant to to the same here before returning the
device_node because it's mostly used by the MTD drivers and those are
the ones who called mtd_set_of_node() in the first place, so we can
assume it's safe to return an non-retained reference to a device_node.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
