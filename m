Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Utc5u-0002hg-Nj
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 11:16:31 +0000
Message-ID: <51D164D8.1050707@ti.com>
Date: Mon, 1 Jul 2013 16:45:36 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: spi: Add qspi flash controller
References: <1372232472-2641-1-git-send-email-sourav.poddar@ti.com>
 <1372232472-2641-3-git-send-email-sourav.poddar@ti.com>
 <20130701105605.GH27646@sirena.org.uk>
In-Reply-To: <20130701105605.GH27646@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: rnayak@ti.com, linux-kernel@vger.kernel.org, balbi@ti.com,
 linux-mtd@lists.infradead.org, tqnguyen@micron.com, grant.likely@linaro.org,
 spi-devel-general@lists.sourceforge.net, linux-omap@vger.kernel.org,
 dwmw2@infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

Thanks for the review.
Comments in lined.
On Monday 01 July 2013 04:26 PM, Mark Brown wrote:
> On Wed, Jun 26, 2013 at 01:11:11PM +0530, Sourav Poddar wrote:
>
>> +static int dra7xxx_qspi_prepare_xfer(struct spi_master *master)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int dra7xxx_qspi_unprepare_xfer(struct spi_master *master)
>> +{
>> +	return 0;
>> +}
> Remove empty functions, though...
>
>> +	if (flags&  XFER_END)
>> +		dra7xxx_writel(qspi, qspi->cmd | QSPI_INVAL, QSPI_SPI_CMD_REG);
>> +
>> +	pm_runtime_mark_last_busy(qspi->dev);
>> +	pm_runtime_put_autosuspend(qspi->dev);
> ...there's no point in doing this per-message, it should be in the
> prepare and unprepare functions.
>
Ok, will do runtime PM part in prepare/unprepare in my next version.
>> +	master = spi_alloc_master(&pdev->dev, sizeof(*qspi));
>> +	if (!master)
>> +		return -ENOMEM;
>> +
>> +	master->mode_bits = SPI_CPOL | SPI_CPHA;
>> +
>> +	master->num_chipselect = 1;
>> +	master->bus_num = -1;
>> +	master->setup = dra7xxx_qspi_setup;
>> +	master->prepare_transfer_hardware = dra7xxx_qspi_prepare_xfer;
>> +	master->transfer_one_message = dra7xxx_qspi_start_transfer_one;
>> +	master->unprepare_transfer_hardware = dra7xxx_qspi_unprepare_xfer;
>> +	master->dev.of_node = pdev->dev.of_node;
> There should be some bits per word restrictions in here I think - it
> looks like only 8 bits per word is supported.
>
Yes, currently its only 8 bits per word support.
Yes, bits_per_word_mask can be filled to support upto 32 bits word
transition. Will add in v2.
>> +	qspi->base = devm_request_and_ioremap(&pdev->dev, r);
>> +	if (!qspi->base) {
>> +		dev_dbg(&pdev->dev, "can't ioremap MCSPI\n");
>> +		ret = -ENOMEM;
>> +		goto free_master;
>> +	}
> Use devm_ioremap_resource().
>
Ok. Will replace.
>> +	if (!of_property_read_u32(np, "spi-max-frequency",&max_freq))
>> +		qspi->spi_max_frequency = max_freq;
> You have OF bindings, there should be a binding document and an OF ID
> table.
Yes, will add binding documentation in my next version.

Though, I have a "of_device_id" [1] populated in my patch.

May be, I need to re-arrange it above probe function. ?

[1]:
+
+static const struct of_device_id dra7xxx_qspi_match[] = {
+    {.compatible = "ti,dra7xxx-qspi" },
+    {},
+};
+MODULE_DEVICE_TABLE(of, dra7xxx_qspi_match);
+


Thanks,
Sourav
