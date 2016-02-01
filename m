Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQJU2-0005So-Ma
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 18:45:56 +0000
Received: by mail-pf0-x229.google.com with SMTP id n128so87526030pfn.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 10:45:34 -0800 (PST)
Date: Mon, 1 Feb 2016 10:45:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Raghav Dogra <raghav@freescale.com>
Cc: linux-mtd@lists.infradead.org, scottwood@freescale.com,
 prabhakar@freescale.com
Subject: Re: [PATCH 1/3] driver/memory: Removal of deprecated NO_IRQ
Message-ID: <20160201184531.GI19540@google.com>
References: <1450262491-5135-1-git-send-email-raghav@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450262491-5135-1-git-send-email-raghav@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 16, 2015 at 04:11:31PM +0530, Raghav Dogra wrote:
> Replacing the NO_IRQ macro with 0. If there is no interrupt,
> returned value will be 0 regardless of what NO_IRQ is defined.
> 
> Signed-off-by: Raghav Dogra <raghav@freescale.com>
> ---
>  drivers/memory/fsl_ifc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index e87459f..8436c59 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@ -259,7 +259,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  
>  	/* get the Controller level irq */
>  	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
> -	if (fsl_ifc_ctrl_dev->irq == NO_IRQ) {
> +	if (fsl_ifc_ctrl_dev->irq == 0) {
>  		dev_err(&dev->dev, "failed to get irq resource "
>  							"for IFC\n");
>  		ret = -ENODEV;

Applied this one to l2-mtd.git, as it seems obvious.
