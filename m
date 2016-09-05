Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgrsS-0004Mm-N5
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 11:15:50 +0000
Date: Mon, 5 Sep 2016 13:15:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, linux-mtd
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Subject: Re: [PATCH v1] mtd: nand: tango: import driver for tango controller
Message-ID: <20160905131516.0acb8145@bbrezillon>
In-Reply-To: <57CD4672.1010504@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 Sep 2016 12:18:26 +0200
Mason <slash.tmp@free.fr> wrote:

> On 05/09/2016 09:14, Boris Brezillon wrote:
>=20
> > Marc Gonzalez wrote:
> >  =20
> >> +/* ERROR_REPORT values */
> >> +#define DECODE_ERR_ON_PKT_0(v)	(~v & BIT(7))
> >> +#define DECODE_ERR_ON_PKT_N(v)	(~v & BIT(15)) =20
> >=20
> > Is this really packet N? I'd say it's packet 1. =20
>=20
> NB: "packet_0" and "packet_n" are terms used in the controller's
> documentation (which is not publicly available AFAIU).
>=20
> I didn't want to change the names, for fear of confusing a
> future (internal) maintainer of the code. But in my mind,
> ERR_ON_FIRST_PKT and ERR_ON_OTHER_PKT are clearer. Perhaps
> I can use these identifiers, with a comment mentioning the
> "internal" names.

Or do it the other way around: keep the datasheet wording and add a
comment explaining what it means in your code.

>=20
> DECODE_ERR_ON_PKT_N(v) actually means:
> "decode error on packet N, for N > 0"
> (The HW supports splitting a page in 1 to 16 packets.)
>=20
> > #define DECODE_ERR_ON_PKT(pkt, v)	(~(v) & BIT(((pkt) * 8) + 7)) =20
>=20
> Byte 0 is the report for packet 0.
> Byte 1 is the report for other packets.
>=20
> >> +#define ERR_COUNT_PKT_0(v)	((v >> 0) & 0x3f)
> >> +#define ERR_COUNT_PKT_N(v)	((v >> 8) & 0x3f) =20
>=20
> There are only two bytes in the error report.
> ERR_COUNT_PKT_N(v) returns the max error count for N > 1

Okay, then again, explain that in a comment.

>=20
> >> +struct tango_chip {
> >> +	struct nand_chip chip;
> >> +	void __iomem *base; =20
> >=20
> > I think it better to encode the CS id, and calculate the __iomem offset
> > based on that at run-time. Especially if you want to support multi-CS
> > (multi dies) chips, which you don't seem to support here. =20
>=20
> To support multi-CS chips, I would have to define a
> select_chip callback, where I save the requested CS
> inside the struct tango_chip and use that to compute
> the offset later?

Yes, that's a solution.

>=20
>=20
> >> +	u32 timing1, timing2, xfer_cfg, pkt_0_cfg, pkt_n_cfg, bb_cfg; =20
> >=20
> > Please, one field per line in struct definitions. =20
>=20
> OK.
>=20
>=20
> >> +#define NFC_BUSY(base) (readl_relaxed(base + NFC_STATUS_REG) & 0xf) =
=20
> >=20
> > I'd turn that one into an inline function taking a nand_chip pointer in
> > parameter. Or drop it completely, since you only have one user. =20
>=20
> OK.
>=20
>=20
> > And please document why you use this 0xf mask? I guess there's one bit
> > per CS, so masking with 0xf is not necessarily a good idea... =20
>=20
> There's a 4-bit status code, 0 means idle, non-0 means busy.
> I'll document the mask.
>=20
>=20
> >> +	res =3D readl_relaxed(nfc->mem_base + ERROR_REPORT);
> >> +
> >> +	if (DECODE_ERR_ON_PKT_0(res) || DECODE_ERR_ON_PKT_N(res))
> >> +		return -EBADMSG; =20
> >=20
> > Hm, you're assuming you'll always have 2 packets in your layout, is
> > this true? Don't you have layouts where you only have one packet (2k
> > pages with 2k packets) ? =20
>=20
> The legacy driver hard-codes packet size to 1024.
> Thus 2 packets for 2k pages, 4 packets for 4k pages.
> Are there recent NAND chips with 1k pages?

Nope. Actually I didn't understand the meaning of PKT_N(). Now that you
clarified the situation (it returns the max value for packet > 0), I
fine with your implementation.

>=20
>=20
> >> +	writel_relaxed(MODE_MLC, nfc->pbus_base + PBUS_PAD_MODE); =20
> >=20
> > Not sure I understand what MLC means here? Can you give more detail? =20
>=20
> I'll rename it to MODE_NFC (for "NAND Flash Controller").
>=20
> Basically, either we access NAND chips directly in "raw" mode,
> or we go through the NAND Flash Controller.
>=20
> My driver uses "raw" mode for everything except read_page and
> write_page (because they require DMA and HW ECC).

Okay, then yes, please choose a better name.

>=20
>=20
> >> +	ecc_bits =3D p->chip.ecc.strength * FIELD_ORDER; =20
> >=20
> > Are you sure the field order is always 15? I thought the ECC controller
> > was adapting it depending on the packet size (512 bytes packets =3D> 13,
> > 1024 bytes =3D> 14, 2k =3D> 15), but maybe I'm wrong. =20
>=20
> If I'm reading the doc right, it's always 15.

Okay, so, no matter what packet size you choose, the number of ECC
bytes for a given strength will always be the same, right?

=46rom a storage PoV, that means you'd better choose the biggest packet
size, but I understand that you want to support existing layouts, and
this may also have an impact if you want to support subpage I/Os.

>=20
>=20
> >> +static int tango_nand_probe(struct platform_device *pdev)
> >> +{
> >> +	int i, kHz;
> >> +	struct resource *res;
> >> +	void __iomem *addr[3];
> >> +	struct tango_nfc *nfc;
> >> +	struct device_node *np;
> >> +
> >> +	struct clk *clk =3D clk_get(&pdev->dev, NULL);
> >> +	if (IS_ERR(clk))
> >> +		return PTR_ERR(clk);
> >> +
> >> +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> >> +	if (!nfc)
> >> +		return -ENOMEM;
> >> +
> >> +	for (i =3D 0; i < 3; ++i) {
> >> +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
> >> +		addr[i] =3D devm_ioremap_resource(&pdev->dev, res);
> >> +		if (IS_ERR(addr[i]))
> >> +			return PTR_ERR(addr[i]);
> >> +	}
> >> +
> >> +	platform_set_drvdata(pdev, nfc);
> >> +	nand_hw_control_init(&nfc->hw);
> >> +	kHz =3D clk_get_rate(clk) / 1000;
> >> +
> >> +	nfc->reg_base	=3D addr[0];
> >> +	nfc->mem_base	=3D addr[1];
> >> +	nfc->pbus_base	=3D addr[2]; =20
> >=20
> > Why not doing
> >=20
> > 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > 	nfc->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> >=20
> > 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);

I meant=20

	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);

> > 	nfc->mem_base =3D devm_ioremap_resource(&pdev->dev, res); =20
>=20
> Do you mean why do I have a loop for the 3 ioremaps?
> IIUC, you'd prefer that I unroll the loop?

Having a loop would be appropriate if you were filling an nfc->iomems[]
array, but here you're just putting the values in a temporary table to
then assign each entry to a different field in your NFC struct.
It's not really useful in my opinion.
