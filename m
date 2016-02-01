Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQJQP-0003Yh-Ou
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 18:42:10 +0000
Received: by mail-pa0-x236.google.com with SMTP id ho8so86323737pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 10:41:49 -0800 (PST)
Date: Mon, 1 Feb 2016 10:41:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Raghav Dogra <raghav@freescale.com>
Cc: linux-mtd@lists.infradead.org, scottwood@freescale.com,
 prabhakar@freescale.com, Jaiprakash Singh <b44839@freescale.com>
Subject: Re: [PATCH 3/3] mtd/ifc: Segregate IFC fcm and runtime registers
Message-ID: <20160201184145.GH19540@google.com>
References: <1450262529-5216-1-git-send-email-raghav@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450262529-5216-1-git-send-email-raghav@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Raghav,

On Wed, Dec 16, 2015 at 04:12:09PM +0530, Raghav Dogra wrote:
> IFC has two set of registers viz FCM (Flash control machine)
> aka global and run time registers. These set are defined in two
> memory map PAGES. Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0
> PAGE size is 64KB

So...this patch is adding new hardware support? It's not immediately
clear from the patch description. Perhaps that could use some work?

> Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> Signed-off-by: Raghav Dogra <raghav@freescale.com>
> ---
>  drivers/memory/fsl_ifc.c        | 37 ++++++++++-----------
>  drivers/mtd/nand/fsl_ifc_nand.c | 72 ++++++++++++++++++++++-------------------
>  include/linux/fsl_ifc.h         | 45 +++++++++++++++++---------

Who merges changes for the drivers/memory/ portions anyway? Is there a
maintainer? Or should I be taking these, since it touches drivers/mtd/
enough? If so, can I get an ack from a Freescale maintainer?

Mostly, the changes look good. I think this does need to be rebased on
the latest l2-mtd.git or linux-next.git, though, as there are some
conflicts. One other comment below.

>  3 files changed, 88 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index 903c0a5..df17ead 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c

[...]

> @@ -216,6 +216,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  {
>  	int ret = 0;
>  	int version, banks;
> +	void __iomem *addr;
>  
>  	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
>  

[...]

> @@ -259,6 +252,14 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  	fsl_ifc_ctrl_dev->version = version;
>  	fsl_ifc_ctrl_dev->banks = banks;
>  
> +	addr = fsl_ifc_ctrl_dev->gregs;
> +	if (version >= FSL_IFC_VERSION_2_0_0)
> +		fsl_ifc_ctrl_dev->rregs =
> +			(struct fsl_ifc_runtime *)(addr + PGOFFSET_64K);
> +	else
> +		fsl_ifc_ctrl_dev->rregs =
> +			(struct fsl_ifc_runtime *)(addr + PGOFFSET_4K);
> +

Sparse doesn't like your casting here:

drivers/memory/fsl_ifc.c:258:41: warning: incorrect type in assignment (different address spaces) [sparse]
drivers/memory/fsl_ifc.c:258:41:    expected struct fsl_ifc_runtime [noderef] <asn:2>*rregs [sparse]
drivers/memory/fsl_ifc.c:258:41:    got struct fsl_ifc_runtime *<noident> [sparse]
drivers/memory/fsl_ifc.c:259:26: warning: cast removes address space of expression [sparse]
drivers/memory/fsl_ifc.c:261:41: warning: incorrect type in assignment (different address spaces) [sparse]
drivers/memory/fsl_ifc.c:261:41:    expected struct fsl_ifc_runtime [noderef] <asn:2>*rregs [sparse]
drivers/memory/fsl_ifc.c:261:41:    got struct fsl_ifc_runtime *<noident> [sparse]
drivers/memory/fsl_ifc.c:262:26: warning: cast removes address space of expression [sparse]

It might be better to do this, since you're bothering to add a local variable
'addr' already. This helps the __iomem annotations, and it keeps the lines
shorter too:


	addr = fsl_ifc_ctrl_dev->gregs;
	if (version >= FSL_IFC_VERSION_2_0_0)
		addr += PGOFFSET_64K;
	else
		addr += PGOFFSET_4K;
	fsl_ifc_ctrl_dev->rregs = addr;

Or anything similar.

>  	/* get the Controller level irq */
>  	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
>  	if (fsl_ifc_ctrl_dev->irq == 0) {

[...]

Brian
