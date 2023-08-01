Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385EEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cmrvZx8AqD86uBFv0daFmXElCCTP6SsoA3+g7zkQR8=; b=stxVyxqQl7UDnj
	Rv2OqJlIj51uDCDvfbDKrS9nav4gA/e12PGiKaa1zQvyCZ1T2D/v4hyPMHbxYyEdAjVJGA6FyfE5Q
	Jv/o2Ooq57h9VOMyt0rPmKS8c//ROQciCdW8zgVLGcZhlZfb9BLeZDHwOtE9xplaiOQHuxHzo4nEm
	Z0B6YmzWQGDFGmtcRaFYsOM+ziyxbAesVXsi2J8ECnWw5+hHiSFKPrETa9QyqBZZ+R5O0Evag5oxk
	7t4BvoZqWU5aQgBv6+t/8lbQIfs6JAEPE37Ix8VzNO005BPjMHRAyK8adMk6BT3juABSKrXl8KAVL
	eObuBTJpPBXsvkaTamWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQjl6-000YCE-0F;
	Tue, 01 Aug 2023 07:25:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQjl2-000YBn-1q
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 07:25:30 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26826f93a1fso3703836a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2023 00:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690874726; x=1691479526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bxb+Z+wwOgcMpOU2tIrdqBb0rCspeHH9dz7up62AA48=;
        b=gV/cDQN3YOPulMD8kV6R8b4gGPLuuCzzYdgkY0GKoTdpqlHy2iIPTzw8ZWVqsFUoUc
         6qOMn/d1SEmQLtx/4LgY0D50jYKu4s01Ehnvat4EQi2IKVL6U5M67xkwMB6bphtQOE1H
         A5MJhATNsT346BQowB5FrErzTzUJ6uXDM7VWV7PqNZkS4t0CcwdlpSmpoMicEGL4ziyb
         MYUt+OJNDibQ3L0m/2rFUJAvLNLBlb7N9MbBrPzFoeOnzdoLv9NTf/iawFNjrpIQOwmj
         T5xtkUAfWgdccfbqypzYkvwuoutSelavxDVGU8Ch+sSgfU4naj3Hxp4HSuPk+5hlyyhP
         pm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690874726; x=1691479526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxb+Z+wwOgcMpOU2tIrdqBb0rCspeHH9dz7up62AA48=;
        b=VKGW43z/+3+DVFsXUwkXsHmnZcJxQkA0iY5/VZ7GK/PjBTQbFvhgpg2cvmbefEdlbN
         QCBB883JJ1G1RdCyv/hdXGfavYtr9GeBoIzrEnttpFjNP+Tcn+RTmYrn0xhw2wdrCyPe
         ++Q71FbyD0v246NRs/OQULygFsI540bklL+PYaLMRFEyIPWb8j94mK23Bb205ZgXWGNM
         y7a6ddR1dMT5sLZmqX+DQn5W/4jPFiGFs2z5BV7XZSjLFCYxK4ZoqbSLnoenXEJkzogr
         ZIUxZvGggbd6z5IUtygp74u/YwXjgx/WrlBHJnSvMyTqBGmH3wU1L3XVI/WU8/5QAG3b
         tUEQ==
X-Gm-Message-State: ABy/qLbJzimM0U3YZQ1kUvdJ1h3ULp3PkTTSH+rKnGLQWblrE3/9sDoj
	PkBSe2isiewsYU5VcEkWeptZI/ktzhaSVMQKxfg=
X-Google-Smtp-Source: APBJJlEk4wu7rqWjR2pCXUE/UePn+77i2SLNF6DxRrJSWA1rZ+9xL2aQeDybqTKLGF13KzWzEeJ148zywWU4yis46M8=
X-Received: by 2002:a17:90b:3b89:b0:267:f157:e830 with SMTP id
 pc9-20020a17090b3b8900b00267f157e830mr10575905pjb.3.1690874726327; Tue, 01
 Aug 2023 00:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com> <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
In-Reply-To: <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 1 Aug 2023 15:24:38 +0800
Message-ID: <CAAQoYR=89oZr3cjeXgei+Ofkjb76mphSFLy_QvQD9QTFcDPx+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_002528_653410_FCF976B2 
X-CRM114-Status: GOOD (  33.24  )
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

Hi Tudor

>
>
>
> On 7/27/23 10:16, Jaime Liao wrote:
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >
> > Create Macronix specify method for enable Octal DTR mode and
> > set 20 dummy cycles to allow running at the maximum supported
> > frequency for Macronix Octal flash.
>
> 20 dummy cycles is particular for a specific operating frequency.
>
> If you test the flash at different speeds, let's say at 30 MHz, and
> at their highest frequency (133, 200 MHZ?) does the flash work with
> current settings?
Yes, datasheet include "Dummy Cycle and Frequency Table" for checking.
For Macronix spi-nor flash, 20 or 18 dummy cycles should be use at 200MHz.
It alse means that DC 20 is suit for other frequency(<=200MHz).

> >
> > For enable Macronix flashes in Octal DTR mode, Configuration
> > Register2 DOPI bit should be set and DC bit setting for dummy
> > cycles.
>
> Use imperative.
I didn't get it.

> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> > index 04888258e891..b397fd274868 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -8,6 +8,22 @@
> >
> >  #include "core.h"
> >
> > +#define SPINOR_OP_MXIC_RD_ANY_REG    0x71            /* Read volatile configuration register 2 */
> > +#define SPINOR_OP_MXIC_WR_ANY_REG    0x72            /* Write volatile configuration register 2 */
> > +#define SPINOR_REG_MXIC_CR2_MODE     0x00000000      /* For setting octal DTR mode */
> > +#define SPINOR_REG_MXIC_CR2_DC               0x00000300      /* For setting dummy cycles */
> > +#define SPINOR_REG_MXIC_OPI_DTR_EN   0x2             /* Enable Octal DTR */
> > +#define SPINOR_REG_MXIC_SPI_EN               0x0             /* Enable SPI */
> > +#define SPINOR_REG_MXIC_DC_20                0x0             /* Setting dummy cycles to 20 */
> > +#define SPINOR_REG_MXIC_ADDR_BYTES   4               /* Fixed R/W volatile address bytes to 4 */
> > +
> > +/* Macronix SPI NOR flash operations. */
> > +#define MXIC_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)              \
> > +     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MXIC_WR_ANY_REG, 0),                \
> > +                SPI_MEM_OP_ADDR(naddr, addr, 0),                     \
> > +                SPI_MEM_OP_NO_DUMMY,                                 \
> > +                SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> > +
> >  static int
> >  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> >                           const struct sfdp_parameter_header *bfpt_header,
> > @@ -105,9 +121,90 @@ static const struct flash_info macronix_nor_parts[] = {
> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> >  };
> >
> > +static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
> > +{
> > +     struct spi_mem_op op;
> > +     u8 *buf = nor->bouncebuf, i;
> > +     int ret;
> > +
> > +     /* Use 20 dummy cycles for memory array reads. */
> > +     buf[0] = SPINOR_REG_MXIC_DC_20;
> > +     op = (struct spi_mem_op)
> > +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> > +                                    SPINOR_REG_MXIC_CR2_DC, 1, buf);
> > +
> > +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Set the octal and DTR enable bits. */
> > +     buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
> > +     op = (struct spi_mem_op)
> > +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> > +                                    SPINOR_REG_MXIC_CR2_MODE, 1, buf);
> > +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Read flash ID to make sure the switch was successful. */
> > +     ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
> > +     if (ret) {
> > +             dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
> > +     for (i = 0; i < nor->info->id_len; i++)
> > +             if (buf[i * 2] != nor->info->id[i])
> > +                     return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int macronix_nor_octal_dtr_dis(struct spi_nor *nor)
> > +{
> > +     struct spi_mem_op op;
> > +     u8 *buf = nor->bouncebuf;
> > +     int ret;
> > +
> > +     /*
> > +      * The register is 1-byte wide, but 1-byte transactions are not
> > +      * allowed in 8D-8D-8D mode. Since there is no register at the
> > +      * next location, just initialize the value to 0 and let the
> > +      * transaction go on.
> > +      */
> > +     buf[0] = SPINOR_REG_MXIC_SPI_EN;
> > +     buf[1] = 0x0;
> > +     op = (struct spi_mem_op)
> > +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> > +                                    SPINOR_REG_MXIC_CR2_MODE, 2, buf);
> > +     ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Read flash ID to make sure the switch was successful. */
> > +     ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> > +     if (ret) {
> > +             dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     if (memcmp(buf, nor->info->id, nor->info->id_len))
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int macronix_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> > +{
> > +     return enable ? macronix_nor_octal_dtr_en(nor) :
> > +                     macronix_nor_octal_dtr_dis(nor);
> > +}
> > +
> >  static void macronix_nor_default_init(struct spi_nor *nor)
> >  {
> >       nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> > +     nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;
>
> this must be done in the late_init hook, I'd like to get rid of the
> default_init hook.
nor->params->quad_enable should be move in late_init or
nor->params->octal_dtr_enable only?

> >  }
> >
> >  static void macronix_nor_late_init(struct spi_nor *nor)

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
