Message-ID: <4E0BD657.3070400@freescale.com>
Date: Thu, 30 Jun 2011 09:50:15 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v7 1/3] MTD : add the common code for GPMI-NFC	controller
	driver
References: <1309335878-16678-1-git-send-email-b32955@freescale.com>
	<1309335878-16678-2-git-send-email-b32955@freescale.com>
	<20110629123803.GM21898@n2100.arm.linux.org.uk>
In-Reply-To: <20110629123803.GM21898@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Russell:
> On Wed, Jun 29, 2011 at 04:24:36PM +0800, Huang Shijie wrote:
>> +	dma_addr_t destination_phys = ~0;
>> +
>> +	if (virt_addr_valid(destination))
>> +		destination_phys = dma_map_single(dev, destination,
>> +						length, DMA_FROM_DEVICE);
>> +
>> +	if (dma_mapping_error(dev, destination_phys)) {
> This is buggy.  There is no guarantee that we'll keep using ~0 as the
> value for dma_mapping_error().  Please don't rely on this, but instead
> code this better to avoid having to play these games.
>
thanks a lot. I will change it in the next version.

>> +static int send_page_prepare(struct gpmi_nfc_data *this,
>> +			const void *source, unsigned length,
>> +			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
>> +			const void **use_virt, dma_addr_t *use_phys)
>> +{
>> +	dma_addr_t source_phys = ~0;
>> +	struct device *dev = this->dev;
>> +
>> +	if (virt_addr_valid(source))
>> +		source_phys = dma_map_single(dev,
>> +				(void *)source, length, DMA_TO_DEVICE);
>> +
>> +	if (dma_mapping_error(dev, source_phys)) {
> Ditto.
>
Best Regards
Huang Shijie
