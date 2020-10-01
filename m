Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6189CC4727E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DBD20759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NDsUiC1/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Sbc9E2ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3DBD20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PBnxX5ctf78NTdUg3hOLJTY4d8QeiqGCL4GruXAa2dY=; b=NDsUiC1/DoyBOTU+jPpaB1sb2
	tqStNeLeEV+OHHEO49zaJX/5NQ/SOhLo4ktbtcrZg3yqBqr2KFTaxnSnPaFGuAzYMDgvD6YVAyoPA
	0cSQ171kUUQHeXtoke2Q2HbGTmAL6Dgpr4t0QWx/yL6riSWnSb7r0bqR9Ju6MPYB7ap7dUdGtA7oY
	stWrzlBVTjvD0/2pNTRRNpYIcV1WF8VwS2v9P3Xfdg0wllDNTLc3c5cekdDB1L0CFVe4RU425cdYp
	HnlevUM8/T7LI0lhxPb1dvnc6igu/7EL7zLp68Jwx93+BY4wvPLVA+itUieyWZMK7i4lXy2RWnh5a
	i8YyasSkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO4Ul-0004jD-1W; Thu, 01 Oct 2020 19:44:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4Ug-0004iJ-2K
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 19:44:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 091JhqXo049716;
 Thu, 1 Oct 2020 14:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601581432;
 bh=KDQ2HaZEXUkl7oL661s31lWASXgw47ixpbSHIn2BxmU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Sbc9E2kimU3SqjdGpz4mv76HJEEECi+o1/Ggn+Hk3gIlPiSm89iKC2LuXfr1Rj+Gb
 grHTJXdA5s4kW+Dw04eedoc26V0OMh16kNNkpQjeIiJQMCglMhNv9ojpSuez+csxYT
 AyIRcK+hCR+AYgs5VcXsYIfnCj5EF1n6WSpNBCiY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 091Jhp22015635
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 14:43:52 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 14:43:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 14:43:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 091JhorI057643;
 Thu, 1 Oct 2020 14:43:51 -0500
Date: Fri, 2 Oct 2020 01:13:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v14 15/15] mtd: spi-nor: micron-st: allow using
 MT35XU512ABA in Octal DTR mode
Message-ID: <20201001194348.d2j6bctouwt5mrzk@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-16-p.yadav@ti.com>
 <dd899747-f1eb-2253-9677-8d82c9f73ea6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd899747-f1eb-2253-9677-8d82c9f73ea6@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_154358_195031_09854B96 
X-CRM114-Status: GOOD (  30.93  )
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

On 01/10/20 08:38AM, Tudor.Ambarus@microchip.com wrote:
> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Since this flash doesn't have a Profile 1.0 table, the Octal DTR
> > capabilities are enabled in the post SFDP fixup, along with the 8D-8D-8D
> > fast read settings.
> > 
> > Enable Octal DTR mode with 20 dummy cycles to allow running at the
> > maximum supported frequency of 200Mhz.
> > 
> > The flash supports the soft reset sequence. So, add the flag in the
> > flash's info.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/micron-st.c | 100 +++++++++++++++++++++++++++++++-
> >  1 file changed, 99 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> > index ef3695080710..b0002c29fd37 100644
> > --- a/drivers/mtd/spi-nor/micron-st.c
> > +++ b/drivers/mtd/spi-nor/micron-st.c
> > @@ -8,10 +8,108 @@
> > 
> >  #include "core.h"
> > 
> > +#define SPINOR_OP_MT_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
> > +#define SPINOR_OP_MT_RD_ANY_REG        0x85    /* Read volatile register */
> > +#define SPINOR_OP_MT_WR_ANY_REG        0x81    /* Write volatile register */
> > +#define SPINOR_REG_MT_CFR0V    0x00    /* For setting octal DTR mode */
> > +#define SPINOR_REG_MT_CFR1V    0x01    /* For setting dummy cycles */
> > +#define SPINOR_MT_OCT_DTR      0xe7    /* Enable Octal DTR. */
> > +#define SPINOR_MT_EXSPI                0xff    /* Enable Extended SPI (default) */
> > +
> > +static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +       struct spi_mem_op op;
> > +       u8 *buf = nor->bouncebuf;
> > +       int ret;
> > +
> > +       if (enable) {
> > +               /* Use 20 dummy cycles for memory array reads. */
> > +               ret = spi_nor_write_enable(nor);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               *buf = 20;
> > +               op = (struct spi_mem_op)
> > +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> > +                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
> > +                                  SPI_MEM_OP_NO_DUMMY,
> > +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
> > +
> > +               ret = spi_mem_exec_op(nor->spimem, &op);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               ret = spi_nor_wait_till_ready(nor);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       ret = spi_nor_write_enable(nor);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (enable)
> > +               *buf = SPINOR_MT_OCT_DTR;
> > +       else
> > +               *buf = SPINOR_MT_EXSPI;
> > +
> > +       op = (struct spi_mem_op)
> > +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> > +                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
> > +                                          SPINOR_REG_MT_CFR0V, 1),
> > +                          SPI_MEM_OP_NO_DUMMY,
> > +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> > +
> > +       if (!enable)
> > +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +
> > +       ret = spi_mem_exec_op(nor->spimem, &op);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Give some time for the mode change to take place. */
> > +       usleep_range(400, 600);
> 
> Don't we need to still read the Status Register here? The same question
> applies for the previous patch.

We do, and I even added a check here after reading your email. But in 
practice I realized that all we get from it is a false sense of 
security. If the sleep is too little, then the read status register will 
give out garbage data (or might even hang the controller) because the 
flash is still in a transition state. If the sleep is long enough then 
the read status register will tell us the flash is ready on the first 
try and we don't really gain any new insight.
 
> > +
> > +       return 0;
> > +}
> > +
> > +static void mt35xu512aba_default_init(struct spi_nor *nor)
> > +{
> > +       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
> > +}
> > +
> > +static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
> > +{
> > +       /* Set the Fast Read settings. */
> > +       nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> > +       spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
> > +                                 0, 20, SPINOR_OP_MT_DTR_RD,
> > +                                 SNOR_PROTO_8_8_8_DTR);
> > +
> > +       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
> > +       nor->params->rdsr_dummy = 8;
> > +       nor->params->rdsr_addr_nbytes = 0;
> > +
> > +       /*
> > +        * The BFPT quad enable field is set to a reserved value so the quad
> > +        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
> > +        * disable it.
> > +        */
> > +       nor->params->quad_enable = NULL;
> > +}
> > +
> > +static struct spi_nor_fixups mt35xu512aba_fixups = {
> > +       .default_init = mt35xu512aba_default_init,
> > +       .post_sfdp = mt35xu512aba_post_sfdp_fixup,
> > +};
> > +
> >  static const struct flash_info micron_parts[] = {
> >         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
> >                                SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> > -                              SPI_NOR_4B_OPCODES) },
> > +                              SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
> > +                              SPI_NOR_OCTAL_DTR_PP |
> > +                              SPI_NOR_IO_MODE_EN_VOLATILE)
> > +         .fixups = &mt35xu512aba_fixups},
> >         { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> >                             SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> >                             SPI_NOR_4B_OPCODES) },
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
