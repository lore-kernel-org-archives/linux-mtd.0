Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYxnA-00036c-AG
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2015 14:53:09 +0000
Subject: Re: [PATCH v4 3/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
 <55B63E85.5030809@imgtec.com> <20150906212147.GC7745@laptop.cereza>
CC: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Zubair Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>,
 <linux-kernel@vger.kernel.org>
From: Alex Smith <alex.smith@imgtec.com>
Message-ID: <55EDA4BE.2040605@imgtec.com>
Date: Mon, 7 Sep 2015 15:52:46 +0100
MIME-Version: 1.0
In-Reply-To: <20150906212147.GC7745@laptop.cereza>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 06/09/2015 22:21, Ezequiel Garcia wrote:
> On 27 Jul 03:21 PM, Alex Smith wrote:
>> Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
>> well as the hardware BCH controller. DMA is not currently implemented.
>>
>> While older 47xx SoCs also have a BCH controller, they are incompatible
>> with the one in the 4780 due to differing register/bit positions, which
>> would make implementing a common driver for them quite messy.
>>
> 
> If the difference is only in register/bit positions, a common driver
> might be fairly simple. See drivers/i2c/busses/i2c-mv64xxx.c,
> which supports two different register layouts.

I've just gone back and looked at the older SoCs and it doesn't seem as though this commit message really applies to the JZ4740, which is the only other Ingenic SoC currently supported upstream. The 4740 doesn't have a BCH controller at all and the NAND interface is fairly different. I think this driver could potentially be reused if support for the JZ4770 makes it upstream, for now though a separate driver is certainly needed for the 4780.


>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id jz4780_bch_dt_match[] = {
>> +	{ .compatible = "ingenic,jz4780-bch" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, jz4780_bch_dt_match);
>> +
>> +static struct platform_driver jz4780_bch_driver = {
>> +	.probe		= jz4780_bch_probe,
> 
> Why no remove?

Is it needed? Everything should be cleaned up due to the use of devm functions.


>> +static int jz4780_nand_init_chips(struct jz4780_nand *nand, struct device *dev)
>> +{
>> +	struct jz4780_nand_chip *chip;
>> +	const __be32 *prop;
>> +	u64 addr, size;
>> +	int i = 0;
>> +
>> +	/*
>> +	 * Iterate over each bank assigned to this device and request resources.
>> +	 * The bank numbers may not be consecutive, but nand_scan_ident()
>> +	 * expects chip numbers to be, so fill out a consecutive array of chips
>> +	 * which map chip number to actual bank number.
>> +	 */
>> +	while ((prop = of_get_address(dev->of_node, i, &size, NULL))) {
>> +		chip = &nand->chips[i];
>> +		chip->bank = of_read_number(prop, 1);
>> +
>> +		jz4780_nemc_set_type(nand->dev, chip->bank,
>> +				     JZ4780_NEMC_BANK_NAND);
>> +
>> +		addr = of_translate_address(dev->of_node, prop);
> 
> Are you sure you must translate the address yourself?
> Isn't this handled by the OF magic behing the ranges property
> in the NEMC DT node?

I think the reasoning behind doing this was because I already have to get the address property here in order to get the bank number out of it.

You're right though that I can just do "platform_get_resource(pdev, i)" and avoid doing the translation again, so I have changed it to do that.

I've fixed the rest of your comments as well.

Thanks,
Alex
