Received: from smtp2-g21.free.fr ([212.27.42.2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgqze-0003Od-K2
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 10:19:18 +0000
Subject: Re: [PATCH v1] mtd: nand: tango: import driver for tango controller
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Sebastian Frias <sf84@laposte.net>,
 Jean-Baptiste Lescher <jblescher@gmail.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon>
From: Mason <slash.tmp@free.fr>
Message-ID: <57CD4672.1010504@free.fr>
Date: Mon, 5 Sep 2016 12:18:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160905091450.017e4aa3@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/09/2016 09:14, Boris Brezillon wrote:

> Marc Gonzalez wrote:
> 
>> +/* ERROR_REPORT values */
>> +#define DECODE_ERR_ON_PKT_0(v)	(~v & BIT(7))
>> +#define DECODE_ERR_ON_PKT_N(v)	(~v & BIT(15))
> 
> Is this really packet N? I'd say it's packet 1.

NB: "packet_0" and "packet_n" are terms used in the controller's
documentation (which is not publicly available AFAIU).

I didn't want to change the names, for fear of confusing a
future (internal) maintainer of the code. But in my mind,
ERR_ON_FIRST_PKT and ERR_ON_OTHER_PKT are clearer. Perhaps
I can use these identifiers, with a comment mentioning the
"internal" names.

DECODE_ERR_ON_PKT_N(v) actually means:
"decode error on packet N, for N > 0"
(The HW supports splitting a page in 1 to 16 packets.)

> #define DECODE_ERR_ON_PKT(pkt, v)	(~(v) & BIT(((pkt) * 8) + 7))

Byte 0 is the report for packet 0.
Byte 1 is the report for other packets.

>> +#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
>> +#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f)

There are only two bytes in the error report.
ERR_COUNT_PKT_N(v) returns the max error count for N > 1

>> +struct tango_chip {
>> +	struct nand_chip chip;
>> +	void __iomem *base;
> 
> I think it better to encode the CS id, and calculate the __iomem offset
> based on that at run-time. Especially if you want to support multi-CS
> (multi dies) chips, which you don't seem to support here.

To support multi-CS chips, I would have to define a
select_chip callback, where I save the requested CS
inside the struct tango_chip and use that to compute
the offset later?


>> +	u32 timing1, timing2, xfer_cfg, pkt_0_cfg, pkt_n_cfg, bb_cfg;
> 
> Please, one field per line in struct definitions.

OK.


>> +#define NFC_BUSY(base) (readl_relaxed(base + NFC_STATUS_REG) & 0xf)
> 
> I'd turn that one into an inline function taking a nand_chip pointer in
> parameter. Or drop it completely, since you only have one user.

OK.


> And please document why you use this 0xf mask? I guess there's one bit
> per CS, so masking with 0xf is not necessarily a good idea...

There's a 4-bit status code, 0 means idle, non-0 means busy.
I'll document the mask.


>> +	res = readl_relaxed(nfc->mem_base + ERROR_REPORT);
>> +
>> +	if (DECODE_ERR_ON_PKT_0(res) || DECODE_ERR_ON_PKT_N(res))
>> +		return -EBADMSG;
> 
> Hm, you're assuming you'll always have 2 packets in your layout, is
> this true? Don't you have layouts where you only have one packet (2k
> pages with 2k packets) ?

The legacy driver hard-codes packet size to 1024.
Thus 2 packets for 2k pages, 4 packets for 4k pages.
Are there recent NAND chips with 1k pages?


>> +	writel_relaxed(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE);
> 
> Not sure I understand what MLC means here? Can you give more detail?

I'll rename it to MODE_NFC (for "NAND Flash Controller").

Basically, either we access NAND chips directly in "raw" mode,
or we go through the NAND Flash Controller.

My driver uses "raw" mode for everything except read_page and
write_page (because they require DMA and HW ECC).


>> +	ecc_bits = p->chip.ecc.strength * FIELD_ORDER;
> 
> Are you sure the field order is always 15? I thought the ECC controller
> was adapting it depending on the packet size (512 bytes packets => 13,
> 1024 bytes => 14, 2k => 15), but maybe I'm wrong.

If I'm reading the doc right, it's always 15.


>> +static int tango_nand_probe(struct platform_device *pdev)
>> +{
>> +	int i, kHz;
>> +	struct resource *res;
>> +	void __iomem *addr[3];
>> +	struct tango_nfc *nfc;
>> +	struct device_node *np;
>> +
>> +	struct clk *clk = clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(clk))
>> +		return PTR_ERR(clk);
>> +
>> +	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
>> +	if (!nfc)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < 3; ++i) {
>> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>> +		addr[i] = devm_ioremap_resource(&pdev->dev, res);
>> +		if (IS_ERR(addr[i]))
>> +			return PTR_ERR(addr[i]);
>> +	}
>> +
>> +	platform_set_drvdata(pdev, nfc);
>> +	nand_hw_control_init(&nfc->hw);
>> +	kHz = clk_get_rate(clk) / 1000;
>> +
>> +	nfc->reg_base	= addr[0];
>> +	nfc->mem_base	= addr[1];
>> +	nfc->pbus_base	= addr[2];
> 
> Why not doing
> 
> 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 	nfc->reg_base = devm_ioremap_resource(&pdev->dev, res);
> 
> 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 	nfc->mem_base = devm_ioremap_resource(&pdev->dev, res);

Do you mean why do I have a loop for the 3 ioremaps?
IIUC, you'd prefer that I unroll the loop?

Regards.
