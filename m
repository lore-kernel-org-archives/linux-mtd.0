Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2GN9-0002tB-K8
 for linux-mtd@lists.infradead.org; Thu, 03 Nov 2016 11:39:56 +0000
Date: Thu, 3 Nov 2016 17:09:27 +0530
From: Sandeep Jain <Sandeep_Jain@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Vladimir
 Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v1 1/2] mtd: m25p80: lock module while used
Message-ID: <20161103113926.GB4873@mentor.com>
References: <Sandeep_Jain@mentor.com>
 <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
 <1470320194-9602-2-git-send-email-Sandeep_Jain@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1470320194-9602-2-git-send-email-Sandeep_Jain@mentor.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Maintainers,
	Requesting for your attention for patch review/merge.

Thanks & Regards,
Sandeep Jain

On Thu, Aug 04, 2016 at 07:46:33PM +0530, Sandeep Jain wrote:
> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> The change controls module users counter, which prevents to get
> accidental oops on module unload while it is in use by mtd subsystem:
> 
> % dd if=/dev/mtd0 of=/dev/null &
> % rmmod m25p80
> 
> Removing MTD device #0 (spi32766.0) with use count 1
> Unable to handle kernel paging request at virtual address 7f4fb7f8
> pgd = bd094000
> [7f4fb7f8] *pgd=4cb66811, *pte=00000000, *ppte=00000000
> Internal error: Oops: 80000007 [#1] PREEMPT SMP ARM
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
> ---
>  drivers/mtd/devices/m25p80.c |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 9cf7fcd..2eb1530 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -185,6 +185,19 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  	return ret;
>  }
>  
> +static void m25p80_put(struct mtd_info *mtd)
> +{
> +	module_put(THIS_MODULE);
> +}
> +
> +static int m25p80_get(struct mtd_info *mtd)
> +{
> +	if (!try_module_get(THIS_MODULE))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  /*
>   * board specific setup should have ensured the SPI clock used here
>   * matches what the READ command supports, at least until this driver
> @@ -212,6 +225,8 @@ static int m25p_probe(struct spi_device *spi)
>  	nor->write = m25p80_write;
>  	nor->write_reg = m25p80_write_reg;
>  	nor->read_reg = m25p80_read_reg;
> +	nor->mtd._put_device = m25p80_put;
> +	nor->mtd._get_device = m25p80_get;
>  
>  	nor->dev = &spi->dev;
>  	spi_nor_set_flash_node(nor, spi->dev.of_node);
> -- 
> 1.7.9.5
> 
