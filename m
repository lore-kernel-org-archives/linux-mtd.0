Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xML-0000SD-JF
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:26:23 +0000
Subject: Re: [PATCH v8 2/2] mtd: spi-nor: Add spi-nor mtd resume handler
To: Kamal Dasu <kdasu.kdev@gmail.com>, marek.vasut@gmail.com
Cc: boris.brezillon@free-electrons.com, f.fainelli@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com
References: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
 <1503434722-5429-3-git-send-email-kdasu.kdev@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <479a28e4-19bf-514a-e3ca-67e9a2d193dd@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:25:58 +0200
MIME-Version: 1.0
In-Reply-To: <1503434722-5429-3-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 22/08/2017 à 22:45, Kamal Dasu a écrit :
> Implemented and populated spi-nor mtd PM handlers for resume ops.
> spi-nor resume op re-initializes spi-nor flash to its probed
> state by calling the newly implemented spi_nor_init() function.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index ab98ecff..69164bc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1871,6 +1871,19 @@ static int spi_nor_init(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +/* mtd resume handler */
> +static void spi_nor_resume(struct mtd_info *mtd)
> +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	struct device *dev = nor->dev;
> +	int ret;
> +
> +	/* re-initialize the nor chip */
> +	ret = spi_nor_init(nor);
> +	if (ret)
> +		dev_err(dev, "resume() failed\n");
> +}
> +
>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		 const struct spi_nor_hwcaps *hwcaps)
>  {
> @@ -1947,6 +1960,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	mtd->size = params.size;
>  	mtd->_erase = spi_nor_erase;
>  	mtd->_read = spi_nor_read;
> +	mtd->_resume = spi_nor_resume;
>  
>  	/* NOR protection support for STmicro/Micron chips and similar */
>  	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
> 
