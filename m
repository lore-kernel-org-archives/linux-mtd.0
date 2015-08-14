Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ5jm-0005mq-RC
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 03:32:59 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Fri, 14 Aug 2015 05:32:34 +0200
Cc: Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Vikas MANOCHA <vikas.manocha@st.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de>
In-Reply-To: <1439522892-7524-2-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508140532.34935.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, August 14, 2015 at 05:28:12 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alan Tull <atull@opensource.altera.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Graham Moore <grmoore@opensource.altera.com>
> Cc: Vikas MANOCHA <vikas.manocha@st.com>
> Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> Cc: devicetree@vger.kernel.org

[...]

> +	/* Get flash device data */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		unsigned int cs;
> +		struct cqspi_flash_pdata *f_pdata;
> +
> +		if (of_property_read_u32(np, "reg", &cs)) {
> +			dev_err(dev, "couldn't determine chip select\n");
> +			return -ENXIO;
> +		}
> +
> +		if (cs >= CQSPI_MAX_CHIPSELECT) {
> +			dev_err(dev, "chip select %d out of range\n", cs);
> +			return -ENXIO;
> +		}
> +
> +		f_pdata = &cqspi->f_pdata[cs];
> +		f_pdata->cqspi = cqspi;
> +		f_pdata->cs = cs;
> +
> +		ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> +		if (ret)
> +			goto probe_failed;
> +
> +		nor = &f_pdata->nor;
> +		mtd = &f_pdata->mtd;
> +
> +		nor->mtd = mtd;
> +		nor->dev = dev;
> +		nor->priv = f_pdata;
> +		mtd->priv = nor;
> +
> +		nor->read_reg = cqspi_read_reg;
> +		nor->write_reg = cqspi_write_reg;
> +		nor->read = cqspi_read;
> +		nor->write = cqspi_write;
> +		nor->erase = cqspi_erase;
> +		nor->set_protocol = cqspi_set_protocol;
> +
> +		nor->prepare = cqspi_prep;
> +

--->8---

> +		/*
> +		 * Here is a 'nasty hack' from Marek Vasut to pick
> +		 * up OF properties from flash device subnode.
> +		 */
> +		nor->dev->of_node = np;
> +
> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		if (ret)
> +			goto probe_failed;

The only bizzare thing is this stuff above ^ . If I want to pass for example 
"m25p,fast-read" to the SPI NOR connected to this controller, I have to set
up the nor->dev->of_node, otherwise the of_node would point to the controller.
I am positive this is wrong, but I'm not quite sure how to repair this.
Brian, can you please comment on this one bit ?

[...]
