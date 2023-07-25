Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24857C001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXCNCE360BhKPPZUdmsE0Dc6XXqa0FyGAOuWWk2B8bw=; b=nWI9PowfgX1lyC
	1xEHUZx4Js7ZPt2CbL3UrnkgcrL+nsnE+vgeH+FgHkzAujfyiFT2zzjTQGXiHjxbJnTeKTQhGsj/G
	uP2wUZ1kbqE41orvscYsx5VUhLja860wg/g3UqXimKjtwMoJ8BFGhRcl+t+JvEDmqrx321RZ5mkaG
	EZYIEr7gEKChy1QAeanPtM36vnWFt6ZLYoInA87x3AWyGWZ3brlw0Vk7vRemGFQf5gU8rVvlb1qkF
	U1HtUlix2aeOwhdAp0aixh8bCObeXvwI3WBtFdF6GsIJ4CBg5IeMrIe9HwCTFdyUarUhRE2gbN/zN
	9WuGhh64aF+EM2ozyCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODzw-006rHG-1R;
	Tue, 25 Jul 2023 09:06:28 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODzt-006rGQ-1x
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:06:27 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a412653352so3351292b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690275981; x=1690880781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qOy1UDKwqjsYur1pE9G0IhWnuKqEk17ArR63nJo19i8=;
        b=e19a/gqO3PaAvmHzTA8l66Bkf7npfEW5erOXNU4g7V/ikKGOqJMt//45Ykxs4yAL9a
         4UDiOimGn6DkrgCptnue8QoOxpRY/JjNkQjnvjqW9hGPO1AbmjMhvNPe62nCSAMIgRk9
         Fie63lu+8IyoWOAsottWefRkTbwxTHyGfletJSj5cRgboNyCPwRLyxuN2JX7ixSDiOHo
         eS9VRLm7pmJa17oiksbO2ul+vlaWxeGnYXx4VBcM1838aThyRgSBwpyeB34Aw/yZQXtT
         HZxBpQi71QIY+g0JEdHU/2rewgDQBG7ihq6ME+JaL1VJIaiOYxbiRK4IgJIi8B7OLk7N
         KQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690275981; x=1690880781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOy1UDKwqjsYur1pE9G0IhWnuKqEk17ArR63nJo19i8=;
        b=GcESBe7SiOTczm3gnsK1hhY7Hq69tLK8NYCBfBor1SX76f4EZQFUC/WfOSrR59huZh
         OnpSOkeHwiBCenfVTF2rF++/Ia+2xCO1HxZRIoHPxbHULr6tHzeBzBL2GXpVv2hSjviD
         29FFX0bfRvjNy5u5qF3fdDbRzCJ5N0VhjMx+LaPHrQPk5i3FweVm5G4y4jftz0/HY6M8
         Q2Fz6K3q32uoygG4vQXk9rsxLUdPQoDXJ2r60J2pRUTK8ovDDwItnfRgk7drIlfd1VKi
         3VoBnHW3LnojMgOxsPXBIHTrQ39fnF9t7u1AQzW4rWLB0gmh6I1i/lkqQLL6O42Qj7Us
         kavg==
X-Gm-Message-State: ABy/qLbrve0wKWWRgmNbVwuxwWXNwUovn5m5Xww2ZXHMPgWnr1X8ITja
	tdcv5zu8D8UrCAMNrvulBXhWaONtLw1zh8PrU8Y=
X-Google-Smtp-Source: APBJJlFzvSmjaS8jCvJI2ia0cF35N3oD6mbJY3/dGxfLKNfKHFNwxw3SrlVGhv/AItv+VewPCFBQO5bVQBr2og+mgBg=
X-Received: by 2002:a05:6808:34d:b0:3a4:8a13:98a5 with SMTP id
 j13-20020a056808034d00b003a48a1398a5mr12373554oie.16.1690275981572; Tue, 25
 Jul 2023 02:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <20230725022302.210275-2-jaimeliao.tw@gmail.com> <0acced240c27dd34cf1348ac4a24dba3@walle.cc>
In-Reply-To: <0acced240c27dd34cf1348ac4a24dba3@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 25 Jul 2023 17:05:42 +0800
Message-ID: <CAAQoYRnfEEtRhVcWXAyokgS1G8fGsMhvUfoe6PcuVBEQ8sW2Hg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_020625_699591_A51601D4 
X-CRM114-Status: GOOD (  38.43  )
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

Hi Michael


>
> Hi,
>
> > From: JaimeLiao <jaimeliao.tw@gmail.com>
>
> You write "We" in your next patch. "We" as in macronix? Then please
> use your macronix email address for the patches. Please note, you
> can still send them through your gmail account.
Yes I am Macronix engineer and sorry for the company mail
issue so that I can't send and reply patch on Macronix mail.

>
> > Enable Octal DTR mode with 20 dummy cycles to allow running
> > at the maximum supported frequency for adding Macronix flash
> > in Octal DTR mode.
>
> Please explain a bit more what you are doing here. The patch itself
> looks dodgy. You are writing CR2 but maybe thats used for register
> accesses?! I also can't really tell from the macro names.
Ok I will correct it to _MXIC_ next version of patch.

>
> >
> > Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
> > Co-authored-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> There seems to be no written process documentation wether this has
> to be followed by a SoB (unlike Co-developed-by). Dunno.
Maybe it is not "Co-authored-by", it will be correct next version.

>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 77 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c
> > b/drivers/mtd/spi-nor/macronix.c
> > index 04888258e891..9010b81e098f 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -8,6 +8,12 @@
> >
> >  #include "core.h"
> >
> > +#define SPINOR_OP_RD_CR2             0x71            /* Read configuration register 2 */
> > +#define SPINOR_OP_WR_CR2             0x72            /* Write configuration register 2 */
>
> Copied from spansion.c? Why isn't there an _MXIC_ in the name?
It will be correct next version.

>
> > +#define SPINOR_REG_MXIC_CR2_MODE     0x00000000      /* For setting octal DTR
> > mode */
> > +#define SPINOR_REG_MXIC_OPI_DTR_EN   0x2             /* Enable Octal DTR */
> > +#define SPINOR_REG_MXIC_SPI_EN               0x0             /* Enable SPI */
>
> The names don't make much sense to me. Are you accessing individual
> registers? If so please use MXIC_REG_<regname> and
> MXIC_REG_<regname>_<bit/mode/mask/..>
>
> > +
> >  static int
> >  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> >                           const struct sfdp_parameter_header *bfpt_header,
> > @@ -32,6 +38,76 @@ static const struct spi_nor_fixups mx25l25635_fixups
> > = {
> >       .post_bfpt = mx25l25635_post_bfpt_fixups,
> >  };
> >
> > +/**
> > + * spi_nor_macronix_octal_dtr_enable() - Enable octal DTR on Macronix
> > flashes.
> > + * @nor:             pointer to a 'struct spi_nor'
> > + * @enable:          whether to enable Octal DTR or switch back to SPI
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool
> > enable)
> > +{
> > +     struct spi_mem_op op;
> > +     u8 *buf = nor->bouncebuf, i;
> > +     int ret;
> > +
> > +     /* Set/unset the octal and DTR enable bits. */
> > +     ret = spi_nor_write_enable(nor);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (enable) {
> > +             buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
> > +     } else {
> > +             /*
> > +              * The register is 1-byte wide, but 1-byte transactions are not
> > +              * allowed in 8D-8D-8D mode. Since there is no register at the
> > +              * next location, just initialize the value to 0 and let the
> > +              * transaction go on.
> > +              */
> > +             buf[0] = SPINOR_REG_MXIC_SPI_EN;
> > +             buf[1] = 0x0;
> > +     }
> > +
> > +     op = (struct spi_mem_op)
> > +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
> > +                        SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
> > +                        SPI_MEM_OP_NO_DUMMY,
> > +                        SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> > +
> > +     if (!enable)
> > +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +
> > +     ret = spi_mem_exec_op(nor->spimem, &op);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Read flash ID to make sure the switch was successful. */
>
> While cleaning up the flash_info db I come around this and it is
> copied all over the place. Please work on factoring this (also the
> other code in micron-st.c and spansion.c) out into a helper.
Let me clearify the data order for read ID on Macronix flashes.
Read ID
SPI mode : c2-84-3c-c2-84-3c
OPI DTR mode : c2-c2-84-84-3c-3c

So that I create a specify judement for checking ID via 8D-8D-8D
on Macronix flash.

>
> > +     op = (struct spi_mem_op)
> > +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> > +                        SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
> > +                        SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
> > +                        SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
> > +
> > +     if (enable)
> > +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +
> > +     ret = spi_mem_exec_op(nor->spimem, &op);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (enable) {
> > +             for (i = 0; i < nor->info->id_len; i++)
> > +                     if (buf[i * 2] != nor->info->id[i])
> > +                             return -EINVAL;
>
> Why is the ID now swapped? Doesn't look right.
Actullay 6 bytes data are c2-c2-84-84-3c-3c which are got by 8D-8D-8D read id
on Macronix flash.

>
> -michael
>
> > +     } else {
> > +             if (memcmp(buf, nor->info->id, nor->info->id_len))
> > +                     return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct flash_info macronix_nor_parts[] = {
> >       /* Macronix */
> >       { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
> > @@ -108,6 +184,7 @@ static const struct flash_info macronix_nor_parts[]
> > = {
> >  static void macronix_nor_default_init(struct spi_nor *nor)
> >  {
> >       nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> > +     nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
> >  }
> >
> >  static void macronix_nor_late_init(struct spi_nor *nor)

Thanks your reply
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
