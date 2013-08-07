From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 09/20] ata: pdata_pxa: migrate over to dmaengine usage
Date: Wed, 7 Aug 2013 17:59:03 +0200
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-10-git-send-email-zonque@gmail.com>
In-Reply-To: <1375889649-14638-10-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201308071759.03838.arnd@arndb.de>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, broonie@kernel.org,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 August 2013, Daniel Mack wrote:
> +       dma_cap_zero(mask);
> +       dma_cap_set(DMA_SLAVE, mask);
> +
> +       data->dma_channel =
> +               dma_request_slave_channel_compat(mask, mmp_pdma_filter_fn,
> +                                                &pdata->dma_dreq, &pdev->dev,
> +                                                "data");
> +       if (data->dma_channel == NULL)
>                 return -EBUSY;

Here and in other drivers, you hardwire the mmp_pdma_filter_fn pointer, which creates
an explicit module dependency to the dmaengine driver, which should not be there
when booting with DT.

You can avoid that by open-coding the dma_request_slave_channel_compat() function:

	data->dma_channel = dma_request_slave_channel(&pdev->dev, "data");
	if (IS_ENABLED(CONFIG_ATAGS) && !data->dma_channel && pdata)
		data->dma_channel = dma_request_channel(mask, mmp_pdma_filter_fn,
						&pdata->dma_dreq);

	Arnd
