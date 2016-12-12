Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGHwz-0001Nf-Sw
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 04:10:54 +0000
Received: by mail-wm0-x241.google.com with SMTP id g23so8536042wme.1
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 20:10:32 -0800 (PST)
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, robert.jarzmik@free.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <0b23dbab-3454-2505-d411-41dbfd3d3f3c@gmail.com>
Date: Mon, 12 Dec 2016 05:10:11 +0100
MIME-Version: 1.0
In-Reply-To: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
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

On 12/12/2016 04:00 AM, Arvind Yadav wrote:
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

Um, return -ENOMEM right away ?

Otherwise,
Acked-by: Marek Vasut <marek.vasut@gmail.com>

> +	}
> +
>  	cascade = devm_kzalloc(dev, sizeof(*cascade) * DOC_MAX_NBFLOORS,
>  			       GFP_KERNEL);
>  	if (!cascade)
> 


-- 
Best regards,
Marek Vasut
