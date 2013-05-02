Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXtbN-0008Ji-4v
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 13:31:14 +0000
Received: by mail-la0-f44.google.com with SMTP id ed20so513621lab.17
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 06:30:50 -0700 (PDT)
Message-ID: <51826A70.9050904@cogentembedded.com>
Date: Thu, 02 May 2013 17:30:24 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Laurent Navet <laurent.navet@gmail.com>
Subject: Re: [PATCH] drivers: mtd: nand: davinci: use devm_ioremap_resource()
References: <1367500934-28030-1-git-send-email-laurent.navet@gmail.com>
In-Reply-To: <1367500934-28030-1-git-send-email-laurent.navet@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mturquette@linaro.org, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, m-karicheri2@ti.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 02-05-2013 17:22, Laurent Navet wrote:

> Replace a call to deprecated devm_request_and_ioremap by devm_ioremap_resource.

> Found with coccicheck and this semantic patch:
>   scripts/coccinelle/api/devm_request_and_ioremap.cocci.

> Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
> ---
>   drivers/mtd/nand/davinci_nand.c |   13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index 94e17af..4a96e58 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -623,11 +623,14 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>   		goto err_nomem;
>   	}
>
> -	vaddr = devm_request_and_ioremap(&pdev->dev, res1);
> -	base = devm_request_and_ioremap(&pdev->dev, res2);
> -	if (!vaddr || !base) {
> -		dev_err(&pdev->dev, "ioremap failed\n");
> -		ret = -EADDRNOTAVAIL;
> +	vaddr = devm_ioremap_resource(&pdev->dev, res1);
> +	base = devm_ioremap_resource(&pdev->dev, res2);

    I'd rather put this line before its corresponding error check.

> +	if (IS_ERR(vaddr)) {
> +		ret = PTR_ERR(vaddr);
> +		goto err_ioremap;
> +	}
> +	if (IS_ERR(base)) {
> +		ret = PTR_ERR(base);
>   		goto err_ioremap;
>   	}

WBR, Sergei
