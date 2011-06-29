Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbu2A-0005bz-K0
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 12:38:24 +0000
Date: Wed, 29 Jun 2011 13:38:03 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC
	controller driver
Message-ID: <20110629123803.GM21898@n2100.arm.linux.org.uk>
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1309335878-16678-2-git-send-email-b32955@freescale.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: dedekind1@gmail.com, w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 29, 2011 at 04:24:36PM +0800, Huang Shijie wrote:
> +	dma_addr_t destination_phys = ~0;
> +
> +	if (virt_addr_valid(destination))
> +		destination_phys = dma_map_single(dev, destination,
> +						length, DMA_FROM_DEVICE);
> +
> +	if (dma_mapping_error(dev, destination_phys)) {

This is buggy.  There is no guarantee that we'll keep using ~0 as the
value for dma_mapping_error().  Please don't rely on this, but instead
code this better to avoid having to play these games.

> +static int send_page_prepare(struct gpmi_nfc_data *this,
> +			const void *source, unsigned length,
> +			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
> +			const void **use_virt, dma_addr_t *use_phys)
> +{
> +	dma_addr_t source_phys = ~0;
> +	struct device *dev = this->dev;
> +
> +	if (virt_addr_valid(source))
> +		source_phys = dma_map_single(dev,
> +				(void *)source, length, DMA_TO_DEVICE);
> +
> +	if (dma_mapping_error(dev, source_phys)) {

Ditto.
