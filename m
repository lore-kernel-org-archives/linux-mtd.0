Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YS5qrklBkMipPa2xMwCPaWN9dMO24of74eIQZfOU/8=; b=uYcicJb+58ndxX
	oEI4GjnQP8wQZY0HvdRSSBABPiFo7a1sBqhrkF2T93PUxdUOllCPbfPBxn0mSDWgTkgZ4qqPLPbdZ
	iPGDF/tBdSPH12qoUBcJopIxo3ZbxLmE8KBsd98c5u0u52PsmazyuKcTsdfBnsJdtwlNtY1dm2+pN
	irjc5j2vsF8jNXSRWiJtmeg37MEPWSilYKF0ToHbGB2F9bdobDtdiB/dEmEnbly40JSNw50IQgQy1
	bSNpRpsVopb6ZE3BXntChfC59jXW3gD/jDsrfEU2ze36DHzCKGdx0WzfBsz2hj1D2DOCJls4Ou/99
	OnuQ0Q0LianS38DVBKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDU18-002xQG-An; Fri, 28 Jan 2022 16:22:30 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTzk-002wtP-6I
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 16:21:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20SGKwk9026835;
 Fri, 28 Jan 2022 10:20:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643386858;
 bh=D1AOGYn6jUr5AgtjuK1vxz1Y6kP4u9AYzIKiGPBdrSg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=P+JQeLHunuCmrjamxFL47jxLfiy9wqK/dAWNWiCJeMWLliWUme+jLsyGIigjXnIEZ
 HNlWpUOTYZF1cpEuRPBLmSJ0jPgQ5ntyYVttqS0fPryZwJAbk4IqFOU8HwhECtx0ff
 wDU6KC1L+lLCTDhDu7/vOtU9VaCS61+mnQo61Ins=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20SGKwd9060290
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jan 2022 10:20:58 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 28
 Jan 2022 10:20:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 28 Jan 2022 10:20:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20SGKvbH109314;
 Fri, 28 Jan 2022 10:20:57 -0600
Date: Fri, 28 Jan 2022 21:50:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Message-ID: <20220128162056.vwxhlz5psdxzz3tf@ti.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
 <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_082104_376174_99531612 
X-CRM114-Status: GOOD (  26.60  )
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

On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > 
> > Some of Spansion/Cypress chips support Read/Write Any Register commands.
> > These commands are mainly used to write volatile registers.
> > 
> > The Read Any Register instruction (65h) is followed by register address
> > and dummy cycles, then the selected register byte is returned.
> > 
> > The Write Any Register instruction (71h) is followed by register address
> > and register byte to write.
> > 
> > Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > ---
> > Changes in v7:
> >   - No change
> > 
> > Changes in v6:
> >   - Add helper functions for controller_ops
> >   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
> >   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
> >     function header comment
> > 
> > Changes in v5:
> >   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
> > 
> > Changes in v4:
> >   - Fix dummy cycle calculation in spansion_read_any_reg()
> >   - Modify comment for spansion_write_any_reg()
> > 
> > Changes in v3:
> >   - Cleanup implementation
> > 
> >  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> > 
> > +/**
> > + * spansion_read_any_reg() - Read Any Register.
> > + * @nor:               pointer to a 'struct spi_nor'
> > + * @reg_addr:          register address
> > + * @reg_addr_width:    number of address bytes
> > + * @reg_dummy:         number of dummy cycles for register read
> > + * @reg_val:           pointer to a buffer where the register value is copied
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> > +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
> 
> how about making this a generic core method? I'm sure there are other SPI NOR
> vendors that use registers indexed by address. How about introducing:
> 
> struct spi_nor_reg {
> 	u32 addr;
> 	u8 addr_width;
> 	u8 dummy;
> 	u8 opcode;
> 	u8 val;
> };
> 
> and passing a pointer to this struct as argument.

Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then 
just pass that in as a "template"?

> 
> > +{
> > +       if (nor->spimem) {
> > +               struct spi_mem_op op =
> > +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),
> > +                                  SPI_MEM_OP_ADDR(reg_addr_width, reg_addr, 0),
> > +                                  SPI_MEM_OP_DUMMY(reg_dummy, 0),
> > +                                  SPI_MEM_OP_DATA_IN(1, reg_val, 0));
> > +
> > +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> > +
> > +               /* convert the dummy cycles to the number of bytes */
> > +               op.dummy.nbytes = (reg_dummy * op.dummy.buswidth) / 8;
> > +               if (spi_nor_protocol_is_dtr(nor->reg_proto))
> > +                       op.dummy.nbytes *= 2;
> > +
> > +               return spi_mem_exec_op(nor->spimem, &op);
> > +       }
> > +
> else
> 	return -EOPNOTSUPP;
> 
> we'd like to move all the SPI NOR controller drivers under SPI MEM, let's
> not add support for them.

Sounds good to me.

> 
> > +       return controller_ops_read_any_reg(nor, reg_addr, reg_addr_width,
> > +                                          reg_dummy, reg_val);
> > +}

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
