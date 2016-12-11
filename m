Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cG9bT-0006i3-1V
 for linux-mtd@lists.infradead.org; Sun, 11 Dec 2016 19:16:07 +0000
Received: by mail-wj0-x241.google.com with SMTP id he10so8674668wjc.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 11:15:46 -0800 (PST)
Subject: Re: [V1] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
References: <1481479310-2698-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a09b8dbc-ca4b-000e-e5c2-5039119e99ba@gmail.com>
Date: Sun, 11 Dec 2016 20:15:39 +0100
MIME-Version: 1.0
In-Reply-To: <1481479310-2698-1-git-send-email-arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/11/2016 07:01 PM, Arvind Yadav wrote:
> Here, If devm_ioremap will fail. It will return NULL.
> Kernel can run into a NULL-pointer dereference.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/devices/docg3.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index b833e6c..013b5b9 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2083,9 +2083,12 @@ static int __init docg3_probe(struct platform_device *pdev)
>  		dev_err(dev, "No I/O memory resource defined\n");
>  		return ret;
>  	}
> -	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>  
>  	ret = -ENOMEM;
> +	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
> +	if (!base)
> +		return ret;

I think return -ENOMEM right away won't hurt here. Also, dev_err()
explaining the failure would be nice to add.

Thanks!

>  	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
>  			       GFP_KERNEL);
>  	if (!cascade)
> 


-- 
Best regards,
Marek Vasut
