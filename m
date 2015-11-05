Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuGGJ-0006QC-0t
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 08:51:15 +0000
Date: Thu, 5 Nov 2015 09:49:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>, Scott
 Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu
 <han.xu@freescale.com>
Subject: Re: [PATCH v2 09/11] mtd: drop unnecessary partition parser data
Message-ID: <20151105094930.3536ea34@bbrezillon>
In-Reply-To: <1446262410-45754-10-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-10-git-send-email-computersforpeace@gmail.com>
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

On Fri, 30 Oct 2015 20:33:28 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -110,7 +110,6 @@ ltq_copy_to(struct map_info *map, unsigned long to,
>  static int
>  ltq_mtd_probe(struct platform_device *pdev)
>  {
> -	struct mtd_part_parser_data ppdata;
>  	struct ltq_mtd *ltq_mtd;
>  	struct cfi_private *cfi;
>  	int err;
> @@ -161,13 +160,13 @@ ltq_mtd_probe(struct platform_device *pdev)
>  	}
>  
>  	ltq_mtd->mtd->dev.parent = &pdev->dev;
> +	mtd_set_of_node(&ltq_mtd->mtd, pdev->dev.of_node);

Should be:

	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);

(This error was reported by your aiaiai build test)

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
