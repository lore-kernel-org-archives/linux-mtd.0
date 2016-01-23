Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN5Tj-0003Ne-8H
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 21:12:18 +0000
Received: by mail-pf0-x231.google.com with SMTP id n128so60518190pfn.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 13:11:54 -0800 (PST)
Date: Sat, 23 Jan 2016 13:11:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yuan Yao <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org, han.xu@freescale.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, yao.yuan@nxp.com
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20160123211152.GD35559@google.com>
References: <1453362836-44377-1-git-send-email-yao.yuan@freescale.com>
 <1453362836-44377-2-git-send-email-yao.yuan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453362836-44377-2-git-send-email-yao.yuan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 21, 2016 at 03:53:54PM +0800, Yuan Yao wrote:
> Add R/W functions for big- or little-endian registers:
> The qSPI controller's endian is independent of the CPU core's endian.
> So far, the qSPI have two versions for big-endian and little-endian.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> Acked-by: Han xu <han.xu@freescale.com>
> ---

...

> @@ -954,6 +990,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	if (IS_ERR(q->iobase))
>  		return PTR_ERR(q->iobase);
>  
> +	q->big_endian = of_property_read_bool(np, "big-endian");
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  					"QuadSPI-memory");
>  	if (!devm_request_mem_region(dev, res->start, resource_size(res),

Still no documentation for this property?? You're trying my patience.
We've had the same request since November, and you haven't managed to
satisfy it.
