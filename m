Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 19:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Mrf/z6Mqz8zybKqgkEYAWFtTnKH4XQ9d0sN0EMwbcQ=; b=Qsj1PVFoqaOFRJ
	QHpLSS1zET8ImtU8KjoSNn/O1Ci556Vxb3A9XxKGqzRdZNFaoTj+/4W2Sg/jY/G0sxDwMFd2ysgVm
	MsxKJYLbwYkuUzJpGsrShBir+c/HdiqO2T5XezVw5Jwl+qX/cHm3dc2FYkyz5fyIWbOAPTo//8N5u
	0UFrFkb+3Qt0QjLG3LHnupnJEuQZ7QPVkmRnGizhphGZ5II8NPb8PLMmWSVewqQ3z7OfF1Uujjr+A
	KYC4QJQStxBLT/woE3PdGjC03hVVDimPGuULXbo2AifEwb8/5vS/btb258Qxr3+bCgVpuovLb33cG
	vxMMa7ax7NFWb7Xee+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nboqp-002MG5-Iq; Tue, 05 Apr 2022 19:28:27 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nboqm-002MFE-Mp; Tue, 05 Apr 2022 19:28:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235JRwNC034240;
 Tue, 5 Apr 2022 14:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649186878;
 bh=ryPzySi+sY1PGhJYHg8EDNmmr6lLqwb9RbsI5qhyyH0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aaRdE5nnYIrJf5T+fvuEYm5nR9xQxzxlSRRn/11310CZYxzxNFRWA3N/1ujm2T/TD
 iQut+m7fr7M0lJZSODgNTzU3SajLEUSGBv+SS5169QFUIrTVCzmMAtYMs4uXO5c/Ao
 KSacvEvmH13gp+mUPEcdV2goz9m+jWLuc4CEsZn8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235JRw2p027239
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:27:58 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:27:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:27:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235JRvNp005681;
 Tue, 5 Apr 2022 14:27:58 -0500
Date: Wed, 6 Apr 2022 00:57:57 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v4 04/11] spi: aspeed: Add support for direct mapping
Message-ID: <20220405192757.v356zx2u4mpgpnlq@ti.com>
References: <20220325100849.2019209-1-clg@kaod.org>
 <20220325100849.2019209-5-clg@kaod.org>
 <20220330194548.zldbkaoctlhgwcl2@ti.com>
 <3e5ea70d-805a-ff30-663b-e802d9116a49@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e5ea70d-805a-ff30-663b-e802d9116a49@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_122824_883914_BB6C1353 
X-CRM114-Status: GOOD (  41.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/04/22 09:11AM, C=E9dric Le Goater wrote:
> On 3/30/22 21:45, Pratyush Yadav wrote:
> > On 25/03/22 11:08AM, C=E9dric Le Goater wrote:
> > > Use direct mapping to read the flash device contents. This operation
> > > mode is called "Command mode" on Aspeed SoC SMC controllers. It uses a
> > > Control Register for the settings to apply when a memory operation is
> > > performed on the flash device mapping window.
> > > =

> > > If the window is not big enough, fall back to the "User mode" to
> > > perform the read.
> > > =

> > > Since direct mapping now handles all reads of the flash device
> > > contents, also use memcpy_fromio for other address spaces, such as
> > > SFDP.
> > > =

> > > Direct mapping for writes will come later when validated.
> > > =

> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Joel Stanley <joel@jms.id.au>
> > > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > ---
> > >   drivers/spi/spi-aspeed-smc.c | 67 +++++++++++++++++++++++++++++++++=
+--
> > >   1 file changed, 65 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-sm=
c.c
> > > index 997ec2e45118..0951766baef4 100644
> > > --- a/drivers/spi/spi-aspeed-smc.c
> > > +++ b/drivers/spi/spi-aspeed-smc.c
> > > @@ -322,8 +322,8 @@ static int do_aspeed_spi_exec_op(struct spi_mem *=
mem, const struct spi_mem_op *o
> > >   		if (!op->addr.nbytes)
> > >   			ret =3D aspeed_spi_read_reg(chip, op);
> > >   		else
> > > -			ret =3D aspeed_spi_read_user(chip, op, op->addr.val,
> > > -						   op->data.nbytes, op->data.buf.in);
> > > +			memcpy_fromio(op->data.buf.in, chip->ahb_base + op->addr.val,
> > > +				      op->data.nbytes);
> > =

> > I think I commented on this earlier too, though I failed to respond to
> > your reply. Let me bring the topic back up. I think this can cause an
> > invalid memory address to be accessed. Not all SPI MEM consumers will
> > use dirmap APIs, and they won't use them all the time. For example, SPI
> > NOR can perform some operations to reset the flash before shutting down.
> > For example, SPI NOR turns off 4byte address mode during shutdown. This
> > will be a register read/write operation, which usually has a different
> > opcode.
> =

> It's only a small optimization for startup when the SFDP probing is done.
> There are quite a few reads which are large :
> =

>   spi-aspeed-smc 1e630000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 nd=
ummies:0x1 len:0x10
>   spi-aspeed-smc 1e630000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 nd=
ummies:0x1 len:0x10
>   spi-aspeed-smc 1e630000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 nd=
ummies:0x1 len:0x120
>   spi-aspeed-smc 1e630000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 nd=
ummies:0x1 len:0x40
>   spi-aspeed-smc 1e630000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 nd=
ummies:0x1 len:0x8

Is the overhead large enough to cause any significant delays? This would =

only happen once, it is not on a hot path.

Anyway, I had not noticed earlier that you set opcode, dummy, etc. in =

do_aspeed_spi_exec_op() so I was thinking you would always end up using =

the "main" read operation for this.

I am fine with this as long as you add range checks to make sure there =

are no overflows.

> =

> > =

> > So I think you should keep dirmap and exec_op() independent of each
> > other.
> =

> OK. I understand. It's not a problem as it works either way.
> =

> Thanks,
> =

> C.
> =

> =

> > >   	} else {
> > >   		if (!op->addr.nbytes)
> > >   			ret =3D aspeed_spi_write_reg(chip, op);
> > > @@ -403,10 +403,73 @@ static int aspeed_spi_chip_set_default_window(s=
truct aspeed_spi_chip *chip)
> > >   	return chip->ahb_window_size ? 0 : -1;
> > >   }
> > > +static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> > > +{
> > > +	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->s=
pi->master);
> > > +	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_=
select];
> > > +	struct spi_mem_op *op =3D &desc->info.op_tmpl;
> > > +	u32 ctl_val;
> > > +	int ret =3D 0;
> > > +
> > > +	chip->clk_freq =3D desc->mem->spi->max_speed_hz;
> > > +
> > > +	/* Only for reads */
> > > +	if (op->data.dir !=3D SPI_MEM_DATA_IN)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	if (desc->info.length > chip->ahb_window_size)
> > > +		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
> > > +			 chip->cs, chip->ahb_window_size >> 20);
> > > +
> > > +	/* Define the default IO read settings */
> > > +	ctl_val =3D readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
> > > +	ctl_val |=3D aspeed_spi_get_io_mode(op) |
> > > +		op->cmd.opcode << CTRL_COMMAND_SHIFT |
> > > +		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
> > > +		CTRL_IO_MODE_READ;
> > > +
> > > +	/* Tune 4BYTE address mode */
> > > +	if (op->addr.nbytes) {
> > > +		u32 addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
> > > +
> > > +		if (op->addr.nbytes =3D=3D 4)
> > > +			addr_mode |=3D (0x11 << chip->cs);
> > > +		else
> > > +			addr_mode &=3D ~(0x11 << chip->cs);
> > > +		writel(addr_mode, aspi->regs + CE_CTRL_REG);
> > > +	}
> > > +
> > > +	/* READ mode is the controller default setting */
> > > +	chip->ctl_val[ASPEED_SPI_READ] =3D ctl_val;
> > > +	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
> > > +
> > > +	dev_info(aspi->dev, "CE%d read buswidth:%d [0x%08x]\n",
> > > +		 chip->cs, op->data.buswidth, chip->ctl_val[ASPEED_SPI_READ]);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *de=
sc,
> > > +				      u64 offset, size_t len, void *buf)
> > > +{
> > > +	struct aspeed_spi *aspi =3D spi_controller_get_devdata(desc->mem->s=
pi->master);
> > > +	struct aspeed_spi_chip *chip =3D &aspi->chips[desc->mem->spi->chip_=
select];
> > > +
> > > +	/* Switch to USER command mode if mapping window is too small */
> > > +	if (chip->ahb_window_size < offset + len)
> > > +		aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, len, buf);
> > > +	else
> > > +		memcpy_fromio(buf, chip->ahb_base + offset, len);
> > > +
> > > +	return len;
> > > +}
> > > +
> > >   static const struct spi_controller_mem_ops aspeed_spi_mem_ops =3D {
> > >   	.supports_op =3D aspeed_spi_supports_op,
> > >   	.exec_op =3D aspeed_spi_exec_op,
> > >   	.get_name =3D aspeed_spi_get_name,
> > > +	.dirmap_create =3D aspeed_spi_dirmap_create,
> > > +	.dirmap_read =3D aspeed_spi_dirmap_read,
> > >   };
> > >   static void aspeed_spi_chip_set_type(struct aspeed_spi *aspi, unsig=
ned int cs, int type)
> > > -- =

> > > 2.34.1
> > > =

> > =

> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
