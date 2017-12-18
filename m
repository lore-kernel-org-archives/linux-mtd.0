Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eR1dZ-0004Rz-GT
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 20:03:47 +0000
Date: Mon, 18 Dec 2017 21:03:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/4 v3] mtd: onenand: samsung: use devm_ function to
 simplify code and fix some leaks
Message-ID: <20171218210308.791fb0ae@bbrezillon>
In-Reply-To: <f223e9ea768198b70e37102fc369007d1482e802.1513230484.git.christophe.jaillet@wanadoo.fr>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
 <f223e9ea768198b70e37102fc369007d1482e802.1513230484.git.christophe.jaillet@wanadoo.fr>
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

On Thu, 14 Dec 2017 07:03:49 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Convert all error handling code in 's3c_onenand_probe()' to
> resource-managed alternatives in order to simplify code.
> 
> This fixes a resource leak if 'platform_get_resource()' fails at line 872.
> 
> The 'request_irq()' at line 971 was also un-balanced. It is now
> resource-managed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Cross-compiled tested-only
> 
> v2: use devm_ioremap_resource()
> v3: fix a bug introduced in v2
> ---
>  drivers/mtd/onenand/samsung.c | 164 ++++++++----------------------------------
>  1 file changed, 29 insertions(+), 135 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index af0ac1a7bf8f..b650290611d2 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -129,16 +129,13 @@ struct s3c_onenand {
>  	struct platform_device	*pdev;
>  	enum soc_type	type;
>  	void __iomem	*base;
> -	struct resource *base_res;
>  	void __iomem	*ahb_addr;
> -	struct resource *ahb_res;
>  	int		bootram_command;
>  	void __iomem	*page_buf;
>  	void __iomem	*oob_buf;

Next thing to address: page_buf and oob_buf are not iomem regions (they
are allocated with kmalloc) and should not have an __iomem specifier.
You should also get rid of the various casts transforming those iomem
pointers into regular ones.

>  	unsigned int	(*mem_addr)(int fba, int fpa, int fsa);
>  	unsigned int	(*cmd_map)(unsigned int type, unsigned int val);
>  	void __iomem	*dma_addr;
> -	struct resource *dma_res;
>  	unsigned long	phys_base;
>  	struct completion	complete;
>  };
