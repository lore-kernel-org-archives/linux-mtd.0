Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4B2C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 12:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088282071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 12:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnR/25Tt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q7IP/Rnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088282071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IGwkORQhwK/hjuS0jJKIrdoeCwIi0jUyw3FSEVCrnGc=; b=pnR/25Tt9Pyjej+eBrh556ie9
	+8vJk0dsD1bbJoUL4dtAzz5rqr0vshJRxun5lA7Unmiy3qB8lPQR/1WmVRbIiTGx9V7LSNg5pa/6u
	tlwsMWcK5AC9e89I6VBjTA6HSckEKjrEAvv5E6y6RpkymKb1I+vW9qQGm/9+A35AZVgvu7WQKXsZm
	kMfML8RQWMU3+/dFTJy6beLlsTBMIvzilF0KUya5GKxoYmtV+Dv7v5OD/Ew2x6SDnEbBtryo1aa74
	34VCsxIXycba05HN0uWGpy4mnUhAtBGo0fyGyoZRTrE+ET7TfFUSVY5QdQdTiJ1HMf37x2yJewd1J
	6Bl1Nz2TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNbHK-00067G-Sg; Wed, 30 Sep 2020 12:32:14 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNbHH-000668-Jn
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 12:32:12 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UCW6Jn002507;
 Wed, 30 Sep 2020 07:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601469126;
 bh=5191FmO5PnWSdkNCKiZHV4GLENGOA2lL6BCPIJIRTxo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Q7IP/RnftNVxpVdEFdVT05opPaM3dyGzULZMoj5xEgRu8865o/NSLEjfKeigZk+l3
 VZBjXH01cJdSLoQdcroNXOBceea79Li5ny2xYJry2zcPHQB+CprZr42bUUOqR2K149
 lU6nN61A14pYWmWBRHOx0bhLNe7P2yQd4QPcBqGA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08UCW6MO125895
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 07:32:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 07:32:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 07:32:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UCW5kd070739;
 Wed, 30 Sep 2020 07:32:05 -0500
Date: Wed, 30 Sep 2020 18:02:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Message-ID: <20200930123202.6nr3bzmm6p36gtjq@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-15-p.yadav@ti.com>
 <b6d35341-475b-03db-f2f0-2625dafc25fa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6d35341-475b-03db-f2f0-2625dafc25fa@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_083211_738608_33BA5523 
X-CRM114-Status: GOOD (  47.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 30/09/20 08:36AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > The Cypress Semper flash is an xSPI compliant octal DTR flash. Add
> > support for using it in octal DTR mode.
> > 
> > The flash by default boots in a hybrid sector mode. But the sector map
> > table on the part I had was programmed incorrectly and the SMPT values
> > on the flash don't match the public datasheet. Specifically, in some
> > places erase type 3 was used instead of 4. In addition, the region sizes
> > were incorrect in some places. So, for testing I set CFR3N[3] to enable
> > uniform sector sizes. Since the uniform sector mode bit is a
> > non-volatile bit, this series does not change it to avoid making any
> > permanent changes to the flash configuration. The correct data to
> > implement a fixup is not available right now and will be done in a
> > follow-up patch if needed.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/spansion.c | 166 +++++++++++++++++++++++++++++++++
> >  1 file changed, 166 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> > index 8429b4af999a..a34e250ea5a2 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -8,6 +8,167 @@
> > 
> >  #include "core.h"
> > 
> > +#define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
> > +#define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> > +#define SPINOR_REG_CYPRESS_CFR2V               0x00800003
> > +#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
> > +#define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> > +#define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
> > +#define SPINOR_REG_CYPRESS_CFR5V               0x00800006
> > +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
> > +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
> > +#define SPINOR_OP_CYPRESS_RD_FAST              0xee
> > +
> > +/**
> > + * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> > + * @nor:               pointer to a 'struct spi_nor'
> > + * @enable:              whether to enable or disable Octal DTR
> > + *
> > + * This also sets the memory access latency cycles to 24 to allow the flash to
> > + * run at up to 200MHz.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +       struct spi_mem_op op;
> > +       u8 *buf = nor->bouncebuf;
> > +       u8 addr_width;
> > +       int ret;
> > +
> > +       if (enable)
> > +               addr_width = 3;
> > +       else
> > +               addr_width = 4;
> 
> you can get rid of the addr_width variable and set the addr nbytes at op init
> directly.

Ok.
 
> > +
> > +       if (enable) {
> > +               /* Use 24 dummy cycles for memory array reads. */
> > +               ret = spi_nor_write_enable(nor);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               *buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
> 
> using nor->bouncebuf[0] makes the code easier to read (for me). No big deal anyway.
> 
> > +               op = (struct spi_mem_op)
> > +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> > +                                  SPI_MEM_OP_ADDR(addr_width,
> > +                                                  SPINOR_REG_CYPRESS_CFR2V,
> > +                                                  1),
> > +                                  SPI_MEM_OP_NO_DUMMY,
> > +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
> 
> new line please

Ok.
 
> > +               ret = spi_mem_exec_op(nor->spimem, &op);
> > +               if (ret) {
> > +                       dev_warn(nor->dev,
> > +                                "failed to set default memory latency value: %d\n",
> > +                                ret);
> 
> do we really care for a message here? you'll get a dbg message from
> spi_nor_octal_dtr_enable() too.
> 
> if you still want it, use dev_dbg please.

Ok. I'll use dev_dbg().
 
> > +                       return ret;
> > +               }
> 
> new line please

Ok.
 
> > +               ret = spi_nor_wait_till_ready(nor);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               nor->read_dummy = 24;
> > +       }
> > +
> > +       /* Set/unset the octal and DTR enable bits. */
> > +       ret = spi_nor_write_enable(nor);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (enable)
> > +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> > +       else
> > +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> > +       op = (struct spi_mem_op)
> > +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> > +                          SPI_MEM_OP_ADDR(addr_width,
> > +                                          SPINOR_REG_CYPRESS_CFR5V,
> > +                                          1),
> > +                          SPI_MEM_OP_NO_DUMMY,
> > +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> > +
> > +       if (!enable)
> > +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +
> > +       ret = spi_mem_exec_op(nor->spimem, &op);
> > +       if (ret) {
> > +               dev_warn(nor->dev, "Failed to enable octal DTR mode\n");
> 
> wrong error message for disable. Maybe get rid of it entirely and return exec_op
> directly.

Ok.
 
> > +               return ret;
> > +       }
> > +
> 
> No need to wait here? you waited after SPINOR_REG_CYPRESS_CFR2V

Yes, we need to wait but which mode do we poll the status register in? 
If we poll it in 8D mode and the flash isn't done switching to it yet, 
we will get garbage data which might falsely be interpreted as "done".

Maybe a simple udelay() will do the trick but the delay will have to be 
a guess. I have no data on how long it takes to switch to 8D mode and I 
have no way of measuring it either. I feel 500us should be enough, but 
again I have no data to say for sure. Dunno...
 
> > +       return 0;
> > +}
> > +
> > +static void s28hs512t_default_init(struct spi_nor *nor)
> > +{
> > +       nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
> > +}
> > +
> > +static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
> > +{
> > +       /*
> > +        * On older versions of the flash the xSPI Profile 1.0 table has the
> > +        * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
> > +        */
> > +       if (nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
> > +               nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
> > +                       SPINOR_OP_CYPRESS_RD_FAST;
> > +
> > +       /* This flash is also missing the 4-byte Page Program opcode bit. */
> > +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
> > +                               SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
> > +       /*
> > +        * Since xSPI Page Program opcode is backward compatible with
> > +        * Legacy SPI, use Legacy SPI opcode there as well.
> > +        */
> > +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> > +                               SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
> > +
> > +       /*
> > +        * The xSPI Profile 1.0 table advertises the number of additional
> > +        * address bytes needed for Read Status Register command as 0 but the
> > +        * actual value for that is 4.
> > +        */
> > +       nor->params->rdsr_addr_nbytes = 4;
> > +}
> > +
> > +static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
> > +                                    const struct sfdp_parameter_header *bfpt_header,
> > +                                    const struct sfdp_bfpt *bfpt,
> > +                                    struct spi_nor_flash_parameter *params)
> > +{
> > +       struct spi_mem_op op;
> > +       u8 *buf = nor->bouncebuf;
> > +       u8 addr_width = 3;
> > +       int ret;
> > +
> > +       /*
> > +        * The BFPT table advertises a 512B page size but the page size is
> > +        * actually configurable (with the default being 256B). Read from
> > +        * CFR3V[4] and set the correct size.
> > +        */
> > +       op = (struct spi_mem_op)
> 
> here you can get rid of the cast, as you have just one op.
> 
> 
> > +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
> > +                          SPI_MEM_OP_ADDR(addr_width, SPINOR_REG_CYPRESS_CFR3V, 1),
> 
> set addr nbits to 3 directly
> 
> > +                          SPI_MEM_OP_NO_DUMMY,
> > +                          SPI_MEM_OP_DATA_IN(1, buf, 1));
> 
> I would use nor->bouncebuf directly
> 
> new line please

Ok.
 
> > +       ret = spi_mem_exec_op(nor->spimem, &op);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (*buf & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> > +               params->page_size = 512;
> > +       else
> > +               params->page_size = 256;
> > +
> > +       return 0;
> > +}
> > +
> > +static struct spi_nor_fixups s28hs512t_fixups = {
> > +       .default_init = s28hs512t_default_init,
> > +       .post_sfdp = s28hs512t_post_sfdp_fixup,
> > +       .post_bfpt = s28hs512t_post_bfpt_fixup,
> > +};
> > +
> >  static int
> >  s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
> >                          const struct sfdp_parameter_header *bfpt_header,
> > @@ -104,6 +265,11 @@ static const struct flash_info spansion_parts[] = {
> >                              SPI_NOR_4B_OPCODES) },
> >         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
> >                               SPI_NOR_NO_ERASE) },
> > +       { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> > +                            SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                            SPI_NOR_OCTAL_DTR_PP)
> > +               .fixups = &s28hs512t_fixups,
> 
> the .fixups init is not aligned with the other .fixups in the file. Is the alignment wrong?

Ok. I'll fix the alignment.
 
> looks good.
> 
> > +       },
> >  };
> > 
> >  static void spansion_post_sfdp_fixups(struct spi_nor *nor)
> > --
> > 2.28.0
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
