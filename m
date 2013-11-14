Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgxJw-00009q-1a
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 13:50:56 +0000
Date: Thu, 14 Nov 2013 10:50:34 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 5/8] mtd: gpmi: use devm_ioremap_resource
Message-ID: <20131114135033.GB7076@localhost>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-6-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1384410351-2169-6-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 02:25:48PM +0800, Huang Shijie wrote:
> Use the devm_ioremap_resource to simplify the code.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   26 +++-----------------------
>  1 files changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 36ef60a..1f99038 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -486,16 +486,9 @@ static int acquire_register_block(struct gpmi_nand_data *this,
>  	void __iomem *p;
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
> -	if (!r) {
> -		pr_err("Can't get resource for %s\n", res_name);
> -		return -ENODEV;
> -	}
> -
> -	p = ioremap(r->start, resource_size(r));
> -	if (!p) {
> -		pr_err("Can't remap %s\n", res_name);
> -		return -ENOMEM;
> -	}
> +	p = devm_ioremap_resource(&pdev->dev, r);
> +	if (IS_ERR(p))
> +		return PTR_ERR(p);

Hm... devm_ioremap_resource() is not "pin-to-pin" replacement for the
combination of platform_get_resource + ioremap. Instead, you're adding
a request_memory() call.

So, this is an improvement, and it's fine to do so. I'm just warning
about a change in the driver's behavior.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
