Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLoV0-0000q3-5D
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 10:29:07 +0000
Received: by mail-wr0-x241.google.com with SMTP id y25so3908263wrd.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2017 03:28:45 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: cqspi: make of_device_ids const
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, cyrille.pitchen@wedev4u.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
References: <c4663aaa9e5753053f6ac12a3565e0e1995f3b55.1497605323.git.arvind.yadav.cs@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4f604ebc-69a7-4e35-d682-cc4fa9e76c82@gmail.com>
Date: Fri, 16 Jun 2017 12:27:03 +0200
MIME-Version: 1.0
In-Reply-To: <c4663aaa9e5753053f6ac12a3565e0e1995f3b55.1497605323.git.arvind.yadav.cs@gmail.com>
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

On 06/16/2017 11:35 AM, Arvind Yadav wrote:
> of_device_ids are not supposed to change at runtime. All functions
> working with of_device_ids provided by <linux/of.h> work with const
> of_device_ids. So mark the non-const structs as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Works for me
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 9f8102d..1a25637 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -1277,7 +1277,7 @@ static int cqspi_resume(struct device *dev)
>  #define CQSPI_DEV_PM_OPS	NULL
>  #endif
>  
> -static struct of_device_id const cqspi_dt_ids[] = {
> +static const struct of_device_id const cqspi_dt_ids[] = {
>  	{.compatible = "cdns,qspi-nor",},
>  	{ /* end of table */ }
>  };
> 


-- 
Best regards,
Marek Vasut
