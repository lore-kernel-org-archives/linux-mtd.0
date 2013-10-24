Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZSRW-0005UL-D9
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 21:27:47 +0000
Date: Thu, 24 Oct 2013 18:27:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v11 04/10] mtd: nand: omap: use DT specified bus-width
 only for scanning NAND device
Message-ID: <20131024212714.GB2520@localhost>
References: <1382619026-4182-1-git-send-email-pekon@ti.com>
 <1382619026-4182-5-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1382619026-4182-5-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 ijc+devicetree@hellion.org.uk, linux-omap@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 avinashphilipk@gmail.com, swarren@wwwdotorg.org, jp.francois@cynove.com,
 balbi@ti.com, robherring2@gmail.com, bcousson@baylibre.com, olof@lixom.net,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 06:20:20PM +0530, Pekon Gupta wrote:
> This patch:
> - calls nand_scan_ident() using bus-width as passed by DT
> - removes double calls to nand_scan_ident(), incase first call fails
>   then omap_nand_probe just returns error.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/omap2.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 5596368..f464321 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1856,7 +1856,6 @@ static int omap_nand_probe(struct platform_device *pdev)
>  	mtd->name		= dev_name(&pdev->dev);
>  	mtd->owner		= THIS_MODULE;
>  	nand_chip		= &info->nand;
> -	nand_chip->options	= pdata->devsize;
>  	nand_chip->options	|= NAND_SKIP_BBTSCAN;
>  #ifdef CONFIG_MTD_NAND_OMAP_BCH
>  	info->of_node		= pdata->of_node;
> @@ -1904,6 +1903,15 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		nand_chip->chip_delay = 50;
>  	}
>  
> +	/* scan NAND device connected to chip controller */
> +	nand_chip->options |= pdata->devsize & NAND_BUSWIDTH_16;

Hm.. this only works if the device is listed in nand_flash_ids[] array,
so that ONFI detection is not used. To make ONFI detection work I think you
need to do as Brian suggested and use NAND_BUSWIDTH_AUTO.

(Odd: why is there no current user of that auto-width option?)

Anyway, I really think we should fix this now and independently
of the evolution of this ECC DT binding discussion.
That way you can keep sending a smaller ECC DT binding patchset and
make reviewers focus on what's really important in each case.

I have a few fixes (based on your work) and I'll send them now, after
I complete the tests. We can continue our discussion there.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
