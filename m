Received: from mail-qg0-f54.google.com ([209.85.192.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFmyp-0000pC-O2
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2015 17:29:56 +0000
Received: by qgii95 with SMTP id i95so4717341qgi.2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2015 10:29:33 -0700 (PDT)
Message-ID: <55A7E9FA.4040704@pid1solutions.com>
Date: Thu, 16 Jul 2015 13:29:30 -0400
From: Cory Tusar <cory.tusar@pid1solutions.com>
MIME-Version: 1.0
To: Alexander Stein <alexander.stein@systec-electronic.com>
CC: Han Xu <han.xu@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
References: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
In-Reply-To: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/16/2015 10:13 AM, Alexander Stein wrote:
> Access is only serialized for each NOR device in spi_nor_lock_and_prep(),
> but not for the QSPI device.

Hi Alexander,

Are both devices that you're testing with in the below scenario QSPI, or
is it a combination of QSPI + some other MTD device?

Just want to understand how it was tested as I've got hardware here that
may let me help out with that...

Best regards,
- -Cory


> We must ensure only one NOR device is accessed as each call to
> fsl_qspi_set_base_addr (in fsl_qspi_prep) will affect the effective flash
> address.
> This can simply be achieved by using a mutex in prepare/unprepare
> callbacks.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> This problem can simply be trigged by doing a hexdump on /dev/mtdblock0
> (256 kiB) and /dev/mtdblock3 (64MiB), in my case.
> 
> $ hexdump -C /dev/mtdblock3 # doing a long taking access.
> $ hexdump -C /dev/mtdblock0 # in the meanwhile will show data from mtdblock3
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5d2df50..a48495a 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -226,6 +226,7 @@ struct fsl_qspi {
>  	u32 memmap_phy;
>  	struct clk *clk, *clk_en;
>  	struct device *dev;
> +	struct mutex lock; /* to serialize access to different mtd partitions */
>  	struct completion c;
>  	struct fsl_qspi_devtype_data *devtype_data;
>  	u32 nor_size;
> @@ -771,6 +772,8 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>  		return ret;
>  	}
>  
> +	mutex_lock(&q->lock);
> +
>  	fsl_qspi_set_base_addr(q, nor);
>  	return 0;
>  }
> @@ -779,6 +782,8 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  {
>  	struct fsl_qspi *q = nor->priv;
>  
> +	mutex_unlock(&q->lock);
> +
>  	clk_disable(q->clk);
>  	clk_disable(q->clk_en);
>  }
> @@ -856,6 +861,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	q->dev = dev;
>  	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
>  	platform_set_drvdata(pdev, q);
> +	mutex_init(&q->lock);
>  
>  	ret = fsl_qspi_nor_setup(q);
>  	if (ret)
> 


- -- 
Cory Tusar
Principal
PID 1 Solutions, Inc.


"There are two ways of constructing a software design.  One way is to
 make it so simple that there are obviously no deficiencies, and the
 other way is to make it so complicated that there are no obvious
 deficiencies."  --Sir Charles Anthony Richard Hoare

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWn6foACgkQHT1tsfGwHJ8pmwCfQsbV/yEhq19HPdcbshjeWnrx
Pw0AoJxcek3AjjtPZHSSDEvo81NwaV4H
=Rwdj
-----END PGP SIGNATURE-----
