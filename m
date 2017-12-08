Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eNQ8n-0007e8-MM
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 21:25:07 +0000
Date: Fri, 8 Dec 2017 22:24:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: onenand: samsung: return an error if
 'mtd_device_parse_register()' fails
Message-ID: <20171208222434.4f146e12@bbrezillon>
In-Reply-To: <ef95e7cafe155e80f80808072d84456dd9bbd712.1512765898.git.christophe.jaillet@wanadoo.fr>
References: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
 <ef95e7cafe155e80f80808072d84456dd9bbd712.1512765898.git.christophe.jaillet@wanadoo.fr>
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

On Fri,  8 Dec 2017 22:11:05 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'mtd_device_parse_register()' fails, we still return 0 which mean
> success.
> Return the error code instead, as done in all the other error handling
> paths.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/mtd/onenand/samsung.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index 04039b967d59..5410e654d3cf 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -987,6 +987,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>  	err = mtd_device_parse_register(mtd, NULL, NULL,
>  					pdata ? pdata->parts : NULL,
>  					pdata ? pdata->nr_parts : 0);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to parse partitions and register the MTD device\n");

And you should call onenand_release() here, to release the resources
allocated in onenand_scan().

> +		return err;
> +	}
>  
>  	platform_set_drvdata(pdev, mtd);
>  
