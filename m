Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGMCA-0007As-Mw
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 08:42:51 +0000
Date: Mon, 12 Dec 2016 09:42:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: robert.jarzmik@free.fr, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
Message-ID: <20161212094218.2d29b34a@bbrezillon>
In-Reply-To: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
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

On Mon, 12 Dec 2016 08:30:04 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> Here, If devm_ioremap will fail. It will return NULL.
> Kernel can run into a NULL-pointer dereference.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/devices/docg3.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index b833e6c..ffe3db0 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -2083,9 +2083,14 @@ static int __init docg3_probe(struct platform_device *pdev)
>  		dev_err(dev, "No I/O memory resource defined\n");
>  		return ret;
>  	}
> -	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
>  
>  	ret = -ENOMEM;
> +	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
> +	if (!base) {
> +		dev_err(dev, "failed to map I/O memory\n");
> +		return ret;
> +	}
> +
>  	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
>  			       GFP_KERNEL);
>  	if (!cascade)

How about going even further and doing the following?
This way you can drop the test on rres (it's done for you in
devm_ioremap_resource()), and you can directly return the error
returned by devm_ioremap_resource().

--->8---
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index b833e6cc684c..c59b91734344 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2077,13 +2077,10 @@ static int __init docg3_probe(struct
platform_device *pdev) int ret, floor;
        struct docg3_cascade *cascade;
 
-       ret = -ENXIO;
        ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-       if (!ress) {
-               dev_err(dev, "No I/O memory resource defined\n");
-               return ret;
-       }
-       base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
+       base = devm_ioremap_resource(dev, ress);
+       if (IS_ERR(base))
+               return PTR_ERR(base);
 
        ret = -ENOMEM;
        cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
