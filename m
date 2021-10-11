Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF62C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 14:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B408A60C4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 14:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B408A60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Date:Cc:To:From
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ri/+Zv2aUjaAj0Py/611BrmBd2Tg7w+/K3vTHZ068rw=; b=34Mmnk6Zrb1m6u
	4E1UKIFptqK3sueuUjk3SG5OsDvj0gTfJ3HnoD/ndBCS7x+Vf2BlWKmLVufPlJ+1RIVA+YRoq3tYU
	23jbndlts4W2qhyOQv+1Y9PEJA24tqYANYJLW4VGIbd7Mfj3xePI3zJTZqNHr+i+RPKP8B3Mg66SO
	6FPMVSDtd+9Htajr8tN0hJqrNZSXMMkoAEWdrYmxeknxW99BQ+FJpLEPmSXlwkFXBs+oD8slCbHK4
	lPxcZQrCXfaeMAk2oUp0W0pJp9yck5eqFbjgkdjgMNstMSQOvfuEhQCo7V4alwFD189kXFLedW6f4
	irVnz2rycbBuOoZauFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwCD-009kzC-NT; Mon, 11 Oct 2021 14:22:29 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwCA-009kxx-RK
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 14:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633962146; x=1665498146;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=XVUaL/mIzEcWddp3yKONwc+r9ZvulEHeNquCCYXN8f0=;
 b=Ftoci1flMCwv4GsOn20SeKnlQn5mR8BXDgETxONbc6kPho7P+fg+37gQ
 ZvHvJ3AbTkd/q3tp34ST4vzAGEcMyh3VekXdnwce5INbqfjDUvUOIWEGy
 ojhuYZETGPG9oThIC+kP92ryL6JOTh3WhbMcp+8Poh84oM90Gu54sTunN
 tKqlzXdJPPH0jVqpq5F1ZoKD54ewSczLdiMzTTurcWIPGPCfgLO676xF4
 tfaNsnx638FOHa/0areSxAA+DSOIBtAKgW7NDeTJpFIaTlsXVlbvG+Uak
 kZfZCTA04QaE1G2mygfsFKs+UZig2MUmjOLevn/CgbI+uHqVHUGlyAZoc A==;
X-IronPort-AV: E=Sophos;i="5.85,364,1624312800"; d="scan'208";a="19974711"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Oct 2021 16:22:21 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 11 Oct 2021 16:22:21 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 11 Oct 2021 16:22:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633962141; x=1665498141;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=XVUaL/mIzEcWddp3yKONwc+r9ZvulEHeNquCCYXN8f0=;
 b=MOD1oJ7LaXKDwdH0u5UYA0qSqPq5KBTkJcuUEjhfqvK3Ku2d1gL0J1Nn
 JxcGvAmHGIJpnP+gQoVHHb+lfsg1JLFspWOEX6driNNL1eoc2fLUPGiA/
 whoqnTfF7vJS7iIA5XOIdvkvpihGHUg89sZjaQ78QJMQqD7bQ14jfeExR
 CRqADW0HmxfUYQ80KS0jKjqw9EGWmEtDNOc+UXmjiXZlm8EhzYhWuL6Oh
 9A7Xn5vNbeyCarFCID7MfhmaIkCNrwbUrCh2GBCNNfVKCwyIjxPYgogEg
 ccLO0ojOdmOZ79Ol8bD96RfBce6/y2HThx9quIYJmYQzBqJRCzVeLvJ6v g==;
X-IronPort-AV: E=Sophos;i="5.85,364,1624312800"; d="scan'208";a="19974710"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Oct 2021 16:22:21 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id 81E49280065;
 Mon, 11 Oct 2021 16:22:21 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Mon, 11 Oct 2021 16:22:21
 +0200
Subject: AW: (EXT) Re: [PATCH 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Pratyush Yadav" <p.yadav@ti.com>, "Alexander Stein"
 <Alexander.Stein@tq-systems.com>
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Rob Herring" <robh@kernel.org>, "Michael Walle" <michael@walle.cc>,
 "Tudor Ambarus" <tudor.ambarus@microchip.com>,
 =?us-ascii?Q?linux-mtd=40lists=2Einfrad?= =?us-ascii?Q?ead=2Eorg?=
 <linux-mtd@lists.infradead.org>, 
 =?us-ascii?Q?devicetree=40vger=2Ekernel=2Eorg?= <devicetree@vger.kernel.org>, 
 =?us-ascii?Q?linux-kernel=40vger=2Ekernel=2Eorg?=
 <linux-kernel@vger.kernel.org>
Date: Mon, 11 Oct 2021 14:22:21 +0000
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.K51pswPLSRK1NpSyVG7WYA.gMwmZ6u+1wE@vtuxmail01.tq-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_072227_295502_8D905E79 
X-CRM114-Status: GOOD (  23.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Pratyush,

> On 08/10/21 01:18PM, Pratyush Yadav wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> > 
> > Micron flashes support this by the Bits [2:0] in the Enhanced Volatile
> > Configuration Register.
> > Checked datasheets:
> > - n25q_128mb_3v_65nm.pdf
> > - mt25t-qljs-L512-xBA-xxT.pdf
> 
> What does changing the impedance do? Does it improve latency? If we use 
> suboptimal impedance, will the flash still keep working correctly?
> 
> In other words, you need to justify why this patch is needed.

Hardware guys told me this will affect the signal qualitiy when the flash is
sending data. This depends among others on line length. If set incorrectly
voltage overshoots upon 0->1 or 1-> switch might occur. To answer to your
question if the flash will work with incorrect settings: It depends. It might
working the short term, but might fail in the long term.
Also this is completly unrelated to latency.

> > +static int micron_read_evcr(struct spi_nor *nor)
> > +{
> > +	int ret;
> > +
> > +	if (nor->spimem) {
> > +		struct spi_mem_op op =
> > +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_EVCR, 1),
> > +				   SPI_MEM_OP_NO_ADDR,
> > +				   SPI_MEM_OP_NO_DUMMY,
> > +				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> 
> Are you always guaranteed to be in 1S-1S-1S mode during register write?
> 
> I would suggest calling spi_nor_spimem_setup_op() before this so that it 
> sets up all the buswidths correctly based on nor->reg_proto.

Thanks, I wasn't aware of that. I'll do that.

> > +
> > +		ret = spi_mem_exec_op(nor->spimem, &op);
> > +	} else {
> > +		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RD_EVCR, nor->bouncebuf,
> 1);
> 
> Split into 2 lines?

Will do.

> > +	}
> > +
> > +	if (ret < 0) {
> > +		dev_err(nor->dev, "error %d reading EVCR\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return nor->bouncebuf[0];
> > +}
> > +
> > +/*
> > + * Write Micron enhanced volatile configuration register
> > + * Return negative if error occurred or configuration register value
> > + */
> > +static int micron_write_evcr(struct spi_nor *nor, u8 evcr)
> > +{
> > +	nor->bouncebuf[0] = evcr;
> > +
> > +	spi_nor_write_enable(nor);
> 
> Check return code.

Will do.

> > +
> > +	if (nor->spimem) {
> > +		struct spi_mem_op op =
> > +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WD_EVCR, 1),
> > +				   SPI_MEM_OP_NO_ADDR,
> > +				   SPI_MEM_OP_NO_DUMMY,
> > +				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> 
> Same as above.

Will do.

> > +
> > +		return spi_mem_exec_op(nor->spimem, &op);
> > +	}
> > +
> > +	return nor->controller_ops->write_reg(nor, SPINOR_OP_WD_EVCR, nor->bouncebuf,
> 1);
> 
> Same as above. Split into 2 lines?

Will do.

> > +}
> > +
> > +/*
> > + * Supported values from Enahanced Volatile COnfiguration Register (Bits
> 2:0)
> > + */
> > +static const struct micron_drive_strength drive_strength_data[] = {
> > +	{ .ohms = 90, .val = 1 },
> > +	{ .ohms = 45, .val = 3 },
> > +	{ .ohms = 20, .val = 5 },
> > +	{ .ohms = 30, .val = 7 },
> > +};
> > +
> > +static struct micron_drive_strength const *micron_st_find_drive_strength_entry(u32
> ohms)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(drive_strength_data); i++) {
> > +		if (ohms == drive_strength_data[i].ohms)
> > +			return &drive_strength_data[i];
> > +	}
> > +	return NULL;
> > +}
> > +
> > +static void micron_st_post_sfdp(struct spi_nor *nor)
> > +{
> > +	struct device_node *np = spi_nor_get_flash_node(nor);
> > +	u32 ohms;
> > +
> > +	if (!np)
> > +		return;
> > +
> > +	if (!of_property_read_u32(np, "output-driver-strength", &ohms)) {
> > +		struct micron_drive_strength const *entry =
> > +			micron_st_find_drive_strength_entry(ohms);
> > +
> > +		if (entry) {
> > +			int evcrr = micron_read_evcr(nor);
> > +
> > +			if (evcrr >= 0) {
> 
> This is a bit confusing. Can you instead do:
> 
> if (evcrr < 0)
> 	return evcrr;
> 
> ...

Will do.

> > +				u8 evcr = (u8)(evcrr & 0xf8) | entry->val;
> 
> Don't use magic numbers. Define a bitmask, preferably using GENMASK().

Will do.

> > +
> > +				micron_write_evcr(nor, evcr);
> 
> Check return code. Do we need to abort flash probe if this fails, or can 
> we live with it, despite the suboptimal impedance?

Well, it's hard to say. It might work, see above. At least this should raise a warning
if setting the driver strength for some reason.

> > +				dev_dbg(nor->dev, "%s: EVCR 0x%x\n", __func__,
> > +					(u32)micron_read_evcr(nor));
> > +			}
> > +		} else {
> > +			dev_warn(nor->dev,
> > +				"Invalid output-driver-strength property specified: %u",
> > +				ohms);
> > +		}
> > +	}
> > +}
> > +
> >  static const struct spi_nor_fixups micron_st_fixups = {
> >  	.default_init = micron_st_default_init,
> > +	.post_sfdp = micron_st_post_sfdp,
> 
> NACK. Not every Micron flash has the EVCR register. For example, the 
> Micron MT35 flash family does not have an EVCR and the output drive 
> strength is programmed in a separate register. Set this only for the 
> flashes that need this.

Thanks for that information. I do not have the MT35 datasheet, so I wasn't aware of it.
I'll stick to MT25Q for now, which is the part number my datasheet is for.

Thanks for your feedback.

Best regards,
Alexander


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
