Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4KogT2sTDTZNVo1OiKvIKu+Ep3TkkFRVmHQahh9aYk=; b=n9jER5agsJq6AK
	YZCRDPFkn2Afzxj0iORGkczLX3BkBKdXqMTDt21RN9Oyy/syznI/GquybDW4cR+RilW3joy5WgNSs
	4YFi9rc5aJWy9c7ISaFIkpsEyj2x1D88njPpXQ+qYGQLrRzlVXlNM7mta2O2E1Bmf6efgXeDv/PyR
	BaBeTMSGaYnH0IdwlXOhI/uVl0KUGuSagTjbN9Rl6gaQ0sJ955oUFPqZptWdiKaRXVYNPcMGGS1RS
	2dFhApcZpKDsAExYJ6bNLGuy/k3ZYRzT/suGaIP9+dwxFND0cS8kiyTSKDK/ci/KbgvfBYOMn/zgG
	DJgZyo0wskFku3D5/2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDUGf-0031yy-66; Fri, 28 Jan 2022 16:38:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDUGb-0031wi-Fa
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 16:38:31 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20SGcMKK006609;
 Fri, 28 Jan 2022 10:38:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643387902;
 bh=6KPv9dxDHnWam9BKSSN/QSTpzhITVibu7Kqm+5HTZeg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iSr+1sJTYJoPYqV46Ixma8BEUf3aAGOnh5GkrMsfdQYadjHV1bFU5f0Yap8SbrTAX
 cOo3qO37wnCjVRxfCw9IH7OJM7ZJjeYBq1l09HWX3EeFw/VaI3n5zVcGONxAW+1jQ7
 lcpalO4xGzdbjRXl8LB1nrVoWD4/RscgwoOFoTZ0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20SGcLUm106611
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jan 2022 10:38:22 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 28
 Jan 2022 10:38:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 28 Jan 2022 10:38:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20SGcIDn038796;
 Fri, 28 Jan 2022 10:38:19 -0600
Date: Fri, 28 Jan 2022 22:08:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 2/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Message-ID: <20220128163817.mxu2pkbyuf27gdy6@ti.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <26f6a4d7e1d3c4dfdf7bf161a72f140c3364a3da.1626677855.git.Takahiro.Kuwano@infineon.com>
 <67f7901b-a3a3-ae4e-78f1-ef54de3ff1b7@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67f7901b-a3a3-ae4e-78f1-ef54de3ff1b7@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_083829_657636_0523A8DB 
X-CRM114-Status: GOOD (  36.44  )
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

On 28/01/22 10:12AM, Tudor.Ambarus@microchip.com wrote:
> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > 
> > Some of Spansion/Cypress chips support volatile version of configuration
> > registers and it is recommended to update volatile registers in the field
> > application due to a risk of the non-volatile registers corruption by
> > power interrupt.
> > 
> > Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> > ---
> > Changes in v7:
> >   - Add missing macro definitions in v6
> > 
> > Changes in v6:
> >   - Remove multi die package support
> > 
> > Changes in v5:
> >   - No change
> > 
> > Changes in v4:
> >   - No change
> > 
> > Changes in v3:
> >   - Add multi-die package parts support
> > 
> >  drivers/mtd/spi-nor/spansion.c | 59 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> > index 5e7e62704e11..ca50e77b4220 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -10,6 +10,8 @@
> > 
> >  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
> >  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> > +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
> > +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */

I have the Cypress S28 flash and this bit is marked as "reserved" there. 
Maybe we should have a flash family specific name? Dunno. But I guess it 
does not matter so much since it will be very localised anyway.

> >  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
> >  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
> >  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> > @@ -161,6 +163,63 @@ static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr,
> >                                             reg_val);
> >  }
> > 
> > +/**
> > + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
> > + * @nor:       pointer to a 'struct spi_nor'
> > + * @reg_dummy: number of dummy cycles for register read
> > + *
> > + * It is recommended to update volatile registers in the field application due
> > + * to a risk of the non-volatile registers corruption by power interrupt. This
> > + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> > + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> > + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> > + * also set during Flash power-up. This function supports multi-die package
> 
> Why do you duplicate the setting of QE bit in CFR1V if QE bit is already set in
> CFR1NV? Does the Volatile Register has a higher priority than the Non-Volatile one?
> What happens when QE is zero in CFR1NV and QE is one in CFR1V?

I have the Cypress S28 flash family, and on there I see that the 
volatile bit takes precedence over non-volatile bit*. At powerup data in 
NV bits is transferred to V bits to set their default state.

What I am more worried about is if quad mode is enabled in a 
non-volatile register (which should NEVER be done by Linux), will we be 
able to properly detect and initialize the flash? We certainly can't do 
it for 8D-8D-8D mode flashes.

* The exception is when the volatile bit is marked read-only. Then 
non-volatile bit takes precedence and volatile bit is ignored.

> 
> > + * parts that require to set the Quad Enable bit in each die.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
> > +{
> > +       u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
> > +       u8 cfr1v, cfr1v_written;
> > +       int ret;
> > +
> > +       ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
> > +                                   &cfr1v);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (cfr1v & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> > +               return 0;
> > +
> > +       ret = spi_nor_write_enable(nor);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Update the Quad Enable bit. */
> > +       cfr1v |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> > +
> > +       ret = spansion_write_any_reg(nor, reg_addr, nor->addr_width, cfr1v);
> you'll need to pass nor->bouncebuf and not variables on stack, they are not DMA-able.

Good catch! I see there is function called object_is_on_stack(). 
spi_mem_exec_op() should probably run that check.

> 
> > +
> you have an extra blank line here
> > +       if (ret)
> > +               return ret;
> > +
> > +       cfr1v_written = cfr1v;
> > +
> > +       /* Read back and check it. */
> > +       ret = spansion_read_any_reg(nor, reg_addr, nor->addr_width, reg_dummy,
> > +                                   &cfr1v);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (cfr1v != cfr1v_written) {
> > +               dev_err(nor->dev, "CFR1: Read back test failed\n");
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  /**
> >   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
> >   * @nor:               pointer to a 'struct spi_nor'
> > --
> > 2.25.1
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
