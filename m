Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccWWX-00047c-5d
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2017 12:11:31 +0000
Subject: Re: [PATCH v3 2/2] mtd: m25p80: Added pm ops support
To: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 cyrille.pitchen@atmel.com, broonie@kernel.org
References: <1486763369-31969-1-git-send-email-kdasu.kdev@gmail.com>
 <1486763369-31969-3-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com
From: Marek Vasut <marex@denx.de>
Message-ID: <0e0edea3-7dfe-bc10-eaa3-18330ae06874@denx.de>
Date: Sat, 11 Feb 2017 13:10:35 +0100
MIME-Version: 1.0
In-Reply-To: <1486763369-31969-3-git-send-email-kdasu.kdev@gmail.com>
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

On 02/10/2017 10:49 PM, Kamal Dasu wrote:
> Added power management ops for resume to be able to resan spi-nor
> device and set it to right transfer modes in its probed state after
> poweron. Some SoC implementations might  power down the spi-nor flash
> and loose its initial settings on suspend. A resume should retore the
> part to its probed state.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c4df3b1..be94fba 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -324,10 +324,26 @@ static int m25p_remove(struct spi_device *spi)
>  };
>  MODULE_DEVICE_TABLE(of, m25p_of_table);
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int m25p_suspend(struct device *dev)
> +{
> +	return 0;

Can't you omit this function ?

> +}
> +
> +static int m25p_resume(struct device *dev)
> +{
> +	struct m25p *flash = dev_get_drvdata(dev);
> +
> +	return spi_nor_init(&flash->spi_nor);
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
> +
>  static struct spi_driver m25p80_driver = {
>  	.driver = {
>  		.name	= "m25p80",
>  		.of_match_table = m25p_of_table,
> +		.pm     = &m25p_pm_ops,
>  	},
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
> 


-- 
Best regards,
Marek Vasut
