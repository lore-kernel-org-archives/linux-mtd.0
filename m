Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UlulL-0001Ak-4I
 for linux-mtd@lists.infradead.org; Mon, 10 Jun 2013 05:35:30 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO500D9SWU1UNP0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 10 Jun 2013 14:34:58 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Emil Goode' <emilgoode@gmail.com>
References: <1370822442-25217-1-git-send-email-emilgoode@gmail.com>
In-reply-to: <1370822442-25217-1-git-send-email-emilgoode@gmail.com>
Subject: Re: [PATCH v2] mtd: orion_nand: Improve error handling in
 orion_nand_probe
Date: Mon, 10 Jun 2013 14:34:57 +0900
Message-id: <001e01ce659c$3e582270$bb086750$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: Andrew Lunn <andrew@lunn.ch>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, 'Andy Shevchenko' <andy.shevchenko@gmail.com>,
 Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 'Dan Carpenter' <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Monday, June 10, 2013 9:01 AM, Emil Goode wrote:
> 
> This patch fixes some issues in the error handling and simplifies
> the code by converting to devm* functions.
> 
> If the kzalloc call fails it is unnecessary to use the label no_res
> and pass a NULL pointer to kfree. If the devm_kzalloc call fails on
> line 110 we forget to call iounmap for the previous ioremap call.
> 
> The following changes are introduced:
> - Convert to devm_kzalloc and remove calls to kfree.
> - Convert to devm_ioremap_resource that adds a missing call to
>   *request_mem_region and remove calls to iounmap.
> - The devm_ioremap_resource function checks the passed resource so
>   we can remove the NULL check after the platform_get_resource call.
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> This patch is only build tested
> v2: Fix change log typo and remove error messages for kzalloc calls
> 
>  drivers/mtd/nand/orion_nand.c |   49 +++++++++++++----------------------------
>  1 file changed, 15 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 8fbd002..76b9fba 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -85,35 +85,24 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	u32 val = 0;
> 
> -	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
> -	if (!nc) {
> -		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");

CC'ed Dan Carpenter, Andy Shevchenko

You don't need to remove this error message.
You would replace 'printk(KERN_ERR "orion_nand:...)' with
'dev_err(&pdev->dev,)'.

	dev_err("failed to allocate device structure.\n");


> -		ret = -ENOMEM;
> -		goto no_res;
> -	}
> +	nc = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip) +
> +			  sizeof(struct mtd_info), GFP_KERNEL);
> +	if (!nc)
> +		return -ENOMEM;
> +
>  	mtd = (struct mtd_info *)(nc + 1);
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		ret = -ENODEV;
> -		goto no_res;
> -	}
> -
> -	io_base = ioremap(res->start, resource_size(res));
> -	if (!io_base) {
> -		printk(KERN_ERR "orion_nand: ioremap failed\n");

Yes, this error message is not necessary.
devm_ioremap_resource() provides its own error messages; so all
explicit error messages can be removed from the failure code paths.


> -		ret = -EIO;
> -		goto no_res;
> -	}
> +	io_base = devm_ioremap_resource(&pdev->dev, res);

How about using devm_ioremap() instead of devm_ioremap_resource()?

Only ioremap() was used previously; however, devm_ioremap_resource()
internally calls both devm_request_mem_region() and devm_ioremap().

If it is wrong, please let me know kindly. :)


> +	if (IS_ERR(io_base))
> +		return PTR_ERR(io_base);
> 
>  	if (pdev->dev.of_node) {
>  		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
> -					GFP_KERNEL);
> -		if (!board) {
> -			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");

As above mentioned, you don't need to remove this error message.
You would replace 'printk(KERN_ERR "orion_nand:...)' with
'dev_err(&pdev->dev,)'.

	dev_err("failed to allocate board structure.\n");


Best regards,
Jingoo Han


> -			ret = -ENOMEM;
> -			goto no_res;
> -		}
> +				     GFP_KERNEL);
> +		if (!board)
> +			return -ENOMEM;
> +
>  		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
>  			board->cle = (u8)val;
>  		else
> @@ -167,7 +156,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
> 
>  	if (nand_scan(mtd, 1)) {
>  		ret = -ENXIO;
> -		goto no_dev;
> +		goto disable_clk;
>  	}
> 
>  	mtd->name = "orion_nand";
> @@ -176,20 +165,17 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  			board->parts, board->nr_parts);
>  	if (ret) {
>  		nand_release(mtd);
> -		goto no_dev;
> +		goto disable_clk;
>  	}
> 
>  	return 0;
> 
> -no_dev:
> +disable_clk:
>  	if (!IS_ERR(clk)) {
>  		clk_disable_unprepare(clk);
>  		clk_put(clk);
>  	}
>  	platform_set_drvdata(pdev, NULL);
> -	iounmap(io_base);
> -no_res:
> -	kfree(nc);
> 
>  	return ret;
>  }
> @@ -197,15 +183,10 @@ no_res:
>  static int orion_nand_remove(struct platform_device *pdev)
>  {
>  	struct mtd_info *mtd = platform_get_drvdata(pdev);
> -	struct nand_chip *nc = mtd->priv;
>  	struct clk *clk;
> 
>  	nand_release(mtd);
> 
> -	iounmap(nc->IO_ADDR_W);
> -
> -	kfree(nc);
> -
>  	clk = clk_get(&pdev->dev, NULL);
>  	if (!IS_ERR(clk)) {
>  		clk_disable_unprepare(clk);
> --
> 1.7.10.4
