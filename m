Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cah3O-0006iD-PZ
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 11:01:56 +0000
Subject: Re: [PATCH v1 4/5] mtd: m25p80: Check if the spi flash device has pm
 support
To: Kamal Dasu <kdasu.kdev@gmail.com>, <linux-spi@vger.kernel.org>,
 <marex@denx.de>, <broonie@kernel.org>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-5-git-send-email-kdasu.kdev@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <f.fainelli@gmail.com>,
 <bcm-kernel-feedback-list@broadcom.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <9108d13d-0f06-172f-5e8d-91ff80fdd510@atmel.com>
Date: Mon, 6 Feb 2017 12:01:27 +0100
MIME-Version: 1.0
In-Reply-To: <1486164676-12912-5-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kamal,

Le 04/02/2017 à 00:31, Kamal Dasu a écrit :
> Call the spi_nor_rescan() only if the controller driver needs this
> support. This way SoCs that need this feature can use it.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 4528e33..ffdec60 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -328,8 +328,13 @@ static int m25p_suspend(struct device *dev)
>  static int m25p_resume(struct device *dev)
>  {
>  	struct m25p *flash = dev_get_drvdata(dev);
> +	struct spi_device *spi = flash->spi;
> +	int ret = 0;
> +
> +	if (spi_flash_pm_supported(spi))
> +		ret = spi_nor_pm_rescan(&flash->spi_nor, NULL);
>

Why don't you squash patch 2 into this one? Patch 2 suggests that
spi_nor_pm_rescan() could safely be called in any case but now this patch
suggests that calling that function is not so safe.

I see two cases:

1/ either calling spi_nor_pm_rescan() is safe in any case, then patches 3,
4 and 5 are needless.

2/ or calling spi_nor_pm_rescan() has unwanted side effects in some cases,
then patch 2 should be squashed into this patch: patch 2 will never be
taken alone in the spi-nor tree if it may introduce bugs or regressions.

If something has to be done in the SPI sub-system, I guess it should be
done first: for sure applying patches 3 and 5 would not create any issue.
Then patches 2 and 4 squashed into a single patch may be safely applied after.

However, patches 3 and 5 still need to be discussed first.

Best regards,

Cyrille

> -	return spi_nor_pm_rescan(&flash->spi-nor, NULL);
> +	return ret;
>  }
>  #endif
>  static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
> 
