Received: from mail-by2nam05on060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe52::60a]
 helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL6gs-0000Wv-HP
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 13:19:16 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Michal Simek
 <michals@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nagasuresh12@gmail.com"
 <nagasuresh12@gmail.com>, "robh@kernel.org" <robh@kernel.org>
Subject: RE: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Fri, 9 Nov 2018 13:18:42 +0000
Message-ID: <MWHPR02MB262374134ED95C0DF68BA8F9AFC60@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1541739641-17789-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20181109090733.41ef6edf@bbrezillon>
In-Reply-To: <20181109090733.41ef6edf@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, November 9, 2018 1:38 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; richard@nod.at; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com; Michal Simek
> <michals@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.ke=
rnel.org;
> nagasuresh12@gmail.com; robh@kernel.org
> Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for =
Arasan NAND
> Flash Controller
>=20
> Hi Naga,
>=20
> Just a preliminary review. I still think we have problems with how you ex=
ecute NAND
> operations. You seem to assume that read/write operation are always page =
write/read operation
> with a size aligned on a page size. This is wrong, either the controller =
is able to execute the
> exact operation that has been requested or it returns -ENOTSUPP.
Are you pointing the anfc_read_param_get_feature_sp_read_type_exec()?
Where I am reading a length of page size even for get_features op.
Is that you are pointing?

>=20
> On Fri, 9 Nov 2018 10:30:41 +0530
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>=20
> > +
> > +/**
> > + * struct anfc_nand_chip - Defines the nand chip related information
> > + * @node:		Used to store NAND chips into a list.
> > + * @chip:		NAND chip information structure.
> > + * @strength:		Bch or Hamming mode enable/disable.
>=20
> The name is still confusing. BTW, can't you deduce Hamming vs BCH from th=
e strength?
> Hamming strength is 1, while BCH strengths seem to start at 4.
Yes we can deduce. I will try that.
.
>=20
> > + * @ecc_strength:	Ecc strength 4.8/12/16.
>=20
> 				      ^/
>=20
> > + * @eccval:		Ecc config value.
> > + * @spare_caddr_cycles:	Column address cycle information for spare are=
a.
> > + * @pktsize:		Packet size for read / write operation.
> > + * @csnum:		chipselect number to be used.
> > + * @spktsize:		Packet size in ddr mode for status operation.
> > + * @inftimeval:		Data interface and timing mode information
> > + */
> > +struct anfc_nand_chip {
> > +	struct list_head node;
> > +	struct nand_chip chip;
> > +	bool strength;
> > +	u32 ecc_strength;
> > +	u32 eccval;
> > +	u16 spare_caddr_cycles;
> > +	u32 pktsize;
> > +	int csnum;
> > +	u32 spktsize;
> > +	u32 inftimeval;
> > +};
> > +
> > +/**
> > + * struct anfc_nand_controller - Defines the Arasan NAND flash control=
ler
> > + *				 driver instance
> > + * @controller:		base controller structure.
> > + * @chips:		list of all nand chips attached to the ctrler.
> > + * @dev:		Pointer to the device structure.
> > + * @base:		Virtual address of the NAND flash device.
> > + * @clk_sys:		Pointer to the system clock.
> > + * @clk_flash:		Pointer to the flash clock.
> > + * @dma:		Dma enable/disable.
> > + * @buf:		Buffer used for read/write byte operations.
> > + * @irq:		irq number
>=20
> You should need this field. Just get the irq num in you probe path an reg=
ister an irq handler
> with devm_request_irq().
You mean to say, instead of putting irq in anfc_nand_controller structure, =
update the code like below snippet, right?

irq =3D platform_get_irq(pdev, 0);
if (irq < 0) {
            dev_err(dev, "failed to retrieve irq\n");
            return irq;
}
devm_request_irq(&pdev->dev, irq, anfc_irq_handler, 0, "arasannfc", nfc);

>=20
> > + * @bufshift:		Variable used for indexing buffer operation
> > + * @csnum:		Chip select number currently inuse.
>=20
> 						     ^ in use
>=20
> > + * @event:		Completion event for nand status events.
> > + * @status:		Status of the flash device.
> > + * @prog:		Used to initiate controller operations.
> > + */
> > +struct anfc_nand_controller {
> > +	struct nand_controller controller;
> > +	struct list_head chips;
> > +	struct device *dev;
> > +	void __iomem *base;
> > +	struct clk *clk_sys;
> > +	struct clk *clk_flash;
> > +	int irq;
> > +	int csnum;
> > +	struct completion event;
> > +	int status;
> > +	u8 buf[TEMP_BUF_SIZE];
>=20
> Allocate this buf dynamically.
Ok
>=20
> > +	u32 eccval;
> > +};
>=20
> > +static int anfc_page_write_type_exec(struct nand_chip *chip,
> > +				     const struct nand_subop *subop) {
> > +	const struct nand_op_instr *instr;
> > +	struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
> > +	struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
> > +	unsigned int op_id, len;
> > +	struct anfc_op nfc_op =3D {};
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +
> > +	anfc_parse_instructions(chip, subop, &nfc_op);
> > +	instr =3D nfc_op.data_instr;
> > +	op_id =3D nfc_op.data_instr_idx;
> > +	anfc_prepare_cmd(chip, nfc_op.cmds[0], nfc_op.cmds[1], 1,
> > +			 mtd->writesize, nfc_op.naddrcycles);
> > +	anfc_setpagecoladdr(nfc, nfc_op.row, nfc_op.col);
> > +	if (!nfc_op.data_instr)
> > +		return 0;
> > +
> > +	len =3D nand_subop_get_data_len(subop, op_id);
> > +	anfc_write_data_op(chip,  (char *)instr->ctx.data.buf.out,
>=20
> 				^ extra white space here
> and please drop the cast.
Ok
>=20
> Can you please run checkpatch --strict prior to submitting patches?
I ran it with --strict while submitting the patch, but I didn't find any wa=
rning.
Anyway I will correct it.
>=20
> > +			   mtd->writesize,
> > +			   DIV_ROUND_UP(mtd->writesize, achip->pktsize),
>=20
> No, that's wrong. You should use instr->ctx.data.len here, and the
> DIV_ROUND_UP() thing is a bit scary. That means you might be writing more=
 data than
> requested.
Ok. Got it.
>=20
> > +			   achip->pktsize);
> > +
> > +	return 0;
> > +}
> > +
>=20
> > +
> > +static int anfc_probe(struct platform_device *pdev) {
> > +	struct anfc_nand_controller *nfc;
> > +	struct anfc_nand_chip *anand_chip;
> > +	struct device_node *np =3D pdev->dev.of_node, *child;
> > +	struct resource *res;
> > +	int err;
> > +
> > +	nfc =3D devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > +	if (!nfc)
> > +		return -ENOMEM;
> > +
> > +	nand_controller_init(&nfc->controller);
> > +	INIT_LIST_HEAD(&nfc->chips);
> > +	init_completion(&nfc->event);
> > +	nfc->dev =3D &pdev->dev;
> > +	platform_set_drvdata(pdev, nfc);
> > +	nfc->csnum =3D -1;
> > +	nfc->controller.ops =3D &anfc_nand_controller_ops;
>=20
> Add a blank line here please
Ok, I will update
>=20
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	nfc->base =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(nfc->base))
> > +		return PTR_ERR(nfc->base);
>=20
> and here
Ok, I will update
>=20
> > +	nfc->irq =3D platform_get_irq(pdev, 0);
> > +	if (nfc->irq < 0) {
> > +		dev_err(&pdev->dev, "platform_get_irq failed\n");
> > +		return -ENXIO;
> > +	}
>=20
> and here
Ok, I will update
>=20
> > +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>=20
> Is this really needed?
Yes, As our DMA supports 64bit addressing. It is needed
>=20
> > +	err =3D devm_request_irq(&pdev->dev, nfc->irq, anfc_irq_handler,
> > +			       0, "arasannfc", nfc);
> > +	if (err)
> > +		return err;
>=20
> Add a blank line here too.
Ok, I will update
>=20
> > +	nfc->clk_sys =3D devm_clk_get(&pdev->dev, "clk_sys");
> > +	if (IS_ERR(nfc->clk_sys)) {
> > +		dev_err(&pdev->dev, "sys clock not found.\n");
> > +		return PTR_ERR(nfc->clk_sys);
> > +	}
> > +
> > +	nfc->clk_flash =3D devm_clk_get(&pdev->dev, "clk_flash");
> > +	if (IS_ERR(nfc->clk_flash)) {
> > +		dev_err(&pdev->dev, "flash clock not found.\n");
> > +		return PTR_ERR(nfc->clk_flash);
> > +	}
> > +
> > +	err =3D clk_prepare_enable(nfc->clk_sys);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Unable to enable sys clock.\n");
> > +		return err;
> > +	}
> > +
> > +	err =3D clk_prepare_enable(nfc->clk_flash);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Unable to enable flash clock.\n");
> > +		goto clk_dis_sys;
> > +	}
> > +
> > +	for_each_available_child_of_node(np, child) {
> > +		anand_chip =3D devm_kzalloc(&pdev->dev, sizeof(*anand_chip),
> > +					  GFP_KERNEL);
> > +		if (!anand_chip) {
> > +			of_node_put(child);
> > +			err =3D -ENOMEM;
> > +			goto nandchip_clean_up;
> > +		}
>=20
> and here.
Ok, I will update
>=20
> > +		err =3D anfc_nand_chip_init(nfc, anand_chip, child);
> > +		if (err) {
> > +			devm_kfree(&pdev->dev, anand_chip);
>=20
> We usually try to avoid calling devm_kfree(). I guess you do it to avoid =
keeping the chip obj
> around when init failed, but this should be rare enough so we can actuall=
y ignore it and let the
> mem allocated for the NFC lifetime.
Ok. I understood.
>=20
> > +			continue;
> > +		}
> > +
> > +		list_add_tail(&anand_chip->node, &nfc->chips);
> > +	}
> > +	return 0;
> > +
> > +nandchip_clean_up:
> > +	list_for_each_entry(anand_chip, &nfc->chips, node)
> > +		nand_release(&anand_chip->chip);
>=20
> Blank line here.
Ok, I will update
>=20
> > +	clk_disable_unprepare(nfc->clk_flash);
>=20
> Blank line here.
Ok, I will update
>=20
> > +clk_dis_sys:
> > +	clk_disable_unprepare(nfc->clk_sys);
> > +
> > +	return err;
> > +}
>=20
> Regards,
>=20
> Boris

Boris/Miquel, could you please review the remaining code as well, if you fe=
el
There is still something to improve.
One concern I have is especially anfc_read_page_hwecc(), there I am checkin=
g erased pages bit flips.
Since Arasan NAND controller doesn't have multibit error detection beyond 2=
4-bit( it can correct upto 24 bit errors),=20
I took some error count as default value(16, I put this based on the error =
count that I got while reading erased page on Micron device).
I will just read the error count register and compare this value with the d=
efault error count(16) and if it is more
Than default then I am checking for erased page bit flips.
I am doubting that this will not work in all cases.
In my case it is just working because the error count that it got on an era=
sed page is 16.
Could you please suggest a way to do detect erased_page bit flips.

Thanks,
Naga Sureshkumar Relli
