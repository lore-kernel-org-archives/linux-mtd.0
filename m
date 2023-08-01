Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2ECEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiU9sCiLqBF8qMXh3nbt4uSdnugb2I24BvfQjsNI3dA=; b=GEkhIj9+Wc7B8Q
	b3FLq8RrVmSyP4CViMtTM1eUD7KBEzD/NWwlOvIHpLBcD9txcjqdWeI3eabHcZyuDiS2B4S5vxzN8
	7Iwa24TvPVs/8Z5x1x/hZGO0/bzZXESwSYMObiikpQ/gKTYAUTizECa3Vu2HPFnXrlDERI+2u/GOM
	WgQiBERoSoX+YVDy8ZfIsNyyX7a1XhnINHjSFkIOUdMta4kG7Uvrv032YyomiaOlfeV0fPXqXbyCe
	PfilQV/ZMtNq96Ld2dFEZ+qWIzx9taHuTdW+GcFukuS2FEImmSI7aGP6+f6thoK+1NLuc4MBvLmJA
	n616ETu0I76C1sndnM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm67-001gls-0f;
	Tue, 01 Aug 2023 09:55:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQm65-001glR-30
	for linux-mtd@bombadil.infradead.org;
	Tue, 01 Aug 2023 09:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MAFOJMKTXuhVG+g9Hw9Qx7UvLRPR17iZRsAbAQ5TzME=; b=Y/qMBTL0+E4U2W411NSAwiKard
	Ao7S4QeS5ZfNG60NMkx3bDuabutS1Yuwv65laPHguc1f8ENMUdrQGEDuTU0nxHH+L9KUmGmdigrTV
	YQUIv8RAtTS/eSaoGvrEu6Q5NnBTAmE+7xjiysj/DDJwIZ/PKzeJAm9Ic8kBHsEUoVwSwIYz2vO1d
	f7sqowKh8cDOUbWYXxzEB5L1y9qt7I0uQb0bS8fCwu2I5iaQUUiJerad4+F0uQDwDX6Q2Wzxlwi/W
	8bUyih3gyqBS4hb4YEMouifA6bn4BAk7kLuPZyiLcVOFb0yOtZ0rd5/gUM8dM7FcwzbZP3gMv7nXI
	eYroV0IQ==;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQllz-00E2Nk-0f
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 09:34:37 +0000
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-563e6524aaeso3103712a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2023 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690882472; x=1691487272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MAFOJMKTXuhVG+g9Hw9Qx7UvLRPR17iZRsAbAQ5TzME=;
        b=ny8rFa1G+bJEYmbYaCNXRHOKRDFJZNjv3SO+aqBY/92u10B/7Ujbrk5fB3O4/OP9Bn
         UgA1Dokym0Jn0gLOKLqfOJ4F5WodP6kOgeLk1YMeAu2zmgHxdeEy9U01uyd89D6CGgWq
         13Qzt/ncys3sWOD2Px/5C4TDmqe7/P6Wrf5aB5n5FE04XqQqlzGJpApx4pApRXbSnFjq
         1drgEBJHUj5Lga355jReRngvNCKFY/eAI//UZBFQ67fy8HT7hyLLeFvoSJHJ6+1WQAMC
         25fM17wQKne9cJTOFUypRzivJt9ep2bKv996sPNYLylvil4ObEIkB0HeKHXOsYs5Q5Hx
         YiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882472; x=1691487272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAFOJMKTXuhVG+g9Hw9Qx7UvLRPR17iZRsAbAQ5TzME=;
        b=TGLIISJKuAxFjzIlUiX867RzpH1e+zLZcdwTCU004Zk5MgF9DsqQx6NxMye2rYFdmw
         roTcVJ12pHlUeLYag0CBEjGXynSSAj5X9JPvcpbZf09iJLz83SxzctYKI7xPZOxdJzPu
         aoK5+gRU0oKuLCx+7AfOzQmTeCNr6REoIUEL+tYHM6oLCrf33wm7mfKaHGGf94kMYoAN
         CYIeStBVXHtr3Az3npUCGCQTsUBlL8LN/FP7eE4nCtsQmM7oQezAqx5XFJ4hzY/T0cW1
         Huo+BgNIt2NTdPY6DSa2+bNgGxanSynSHFqeYQiXkE4BKbGt5+Yu/XgBpCqoh3oUoGpc
         A+LQ==
X-Gm-Message-State: ABy/qLb9/yl3IeAkYTpvXYaLtWjribehCe/g5zhANPemoRggg1mMRrb5
	ObaKOI/VzqUjfVhcOxqQ0AYf2SuBv48zUuuJ0e2qnLEq
X-Google-Smtp-Source: APBJJlGqrs2R7KBcTMmPa/Bq9O4ud7vZ5MLyhrsI80fr+XXef3ldbLyiupc1dJxSuC/XN60PtkW8NME0IFyNqlPipME=
X-Received: by 2002:a17:90a:5213:b0:262:ce8f:a3e with SMTP id
 v19-20020a17090a521300b00262ce8f0a3emr9378814pjh.42.1690882472146; Tue, 01
 Aug 2023 02:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com> <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
 <CAAQoYR=89oZr3cjeXgei+Ofkjb76mphSFLy_QvQD9QTFcDPx+g@mail.gmail.com> <1df1d6af-3499-68dd-4e55-952199f445f4@linaro.org>
In-Reply-To: <1df1d6af-3499-68dd-4e55-952199f445f4@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 1 Aug 2023 17:33:44 +0800
Message-ID: <CAAQoYRkUieXdavLoawk_n_cCM6GK4S1xSDS1_kMrrin_dMcmUw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_103435_311335_CE4A60BB 
X-CRM114-Status: GOOD (  36.72  )
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
> On 8/1/23 08:24, liao jaime wrote:
> > Hi Tudor
> >
> >>
> >>
> >>
> >> On 7/27/23 10:16, Jaime Liao wrote:
> >>> From: JaimeLiao <jaimeliao@mxic.com.tw>
> >>>
> >>> Create Macronix specify method for enable Octal DTR mode and
> >>> set 20 dummy cycles to allow running at the maximum supported
> >>> frequency for Macronix Octal flash.
> >>
> >> 20 dummy cycles is particular for a specific operating frequency.
> >>
> >> If you test the flash at different speeds, let's say at 30 MHz, and
> >> at their highest frequency (133, 200 MHZ?) does the flash work with
> >> current settings?
> > Yes, datasheet include "Dummy Cycle and Frequency Table" for checking.
> > For Macronix spi-nor flash, 20 or 18 dummy cycles should be use at 200MHz.
> > It alse means that DC 20 is suit for other frequency(<=200MHz).
> >
>
> You didn't answer my question. Does the flash work at 30 MHz by using 20
> dummy cycles?
Yes.

> >>>
> >>> For enable Macronix flashes in Octal DTR mode, Configuration
> >>> Register2 DOPI bit should be set and DC bit setting for dummy
> >>> cycles.
> >>
> >> Use imperative.
> > I didn't get it.
>
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour. Please read:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
Got it, thanks.

>
> >
> >>>
> >>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> >>> Co-developed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >>> ---
> >>>  drivers/mtd/spi-nor/macronix.c | 97 ++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 97 insertions(+)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> >>> index 04888258e891..b397fd274868 100644
> >>> --- a/drivers/mtd/spi-nor/macronix.c
> >>> +++ b/drivers/mtd/spi-nor/macronix.c
> >>> @@ -8,6 +8,22 @@
> >>>
> >>>  #include "core.h"
> >>>
> >>> +#define SPINOR_OP_MXIC_RD_ANY_REG    0x71            /* Read volatile configuration register 2 */
> >>> +#define SPINOR_OP_MXIC_WR_ANY_REG    0x72            /* Write volatile configuration register 2 */
> >>> +#define SPINOR_REG_MXIC_CR2_MODE     0x00000000      /* For setting octal DTR mode */
> >>> +#define SPINOR_REG_MXIC_CR2_DC               0x00000300      /* For setting dummy cycles */
> >>> +#define SPINOR_REG_MXIC_OPI_DTR_EN   0x2             /* Enable Octal DTR */
> >>> +#define SPINOR_REG_MXIC_SPI_EN               0x0             /* Enable SPI */
> >>> +#define SPINOR_REG_MXIC_DC_20                0x0             /* Setting dummy cycles to 20 */
> >>> +#define SPINOR_REG_MXIC_ADDR_BYTES   4               /* Fixed R/W volatile address bytes to 4 */
> >>> +
> >>> +/* Macronix SPI NOR flash operations. */
> >>> +#define MXIC_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)              \
> >>> +     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MXIC_WR_ANY_REG, 0),                \
> >>> +                SPI_MEM_OP_ADDR(naddr, addr, 0),                     \
> >>> +                SPI_MEM_OP_NO_DUMMY,                                 \
> >>> +                SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> >>> +
> >>>  static int
> >>>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> >>>                           const struct sfdp_parameter_header *bfpt_header,
> >>> @@ -105,9 +121,90 @@ static const struct flash_info macronix_nor_parts[] = {
> >>>               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> >>>  };
> >>>
> >>> +static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
> >>> +{
> >>> +     struct spi_mem_op op;
> >>> +     u8 *buf = nor->bouncebuf, i;
> >>> +     int ret;
> >>> +
> >>> +     /* Use 20 dummy cycles for memory array reads. */
> >>> +     buf[0] = SPINOR_REG_MXIC_DC_20;
> >>> +     op = (struct spi_mem_op)
> >>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> >>> +                                    SPINOR_REG_MXIC_CR2_DC, 1, buf);
> >>> +
> >>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     /* Set the octal and DTR enable bits. */
> >>> +     buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
> >>> +     op = (struct spi_mem_op)
> >>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> >>> +                                    SPINOR_REG_MXIC_CR2_MODE, 1, buf);
> >>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     /* Read flash ID to make sure the switch was successful. */
> >>> +     ret = spi_nor_read_id(nor, 4, 4, buf, SNOR_PROTO_8_8_8_DTR);
> >>> +     if (ret) {
> >>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     /* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
> >>> +     for (i = 0; i < nor->info->id_len; i++)
> >>> +             if (buf[i * 2] != nor->info->id[i])
> >>> +                     return -EINVAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int macronix_nor_octal_dtr_dis(struct spi_nor *nor)
> >>> +{
> >>> +     struct spi_mem_op op;
> >>> +     u8 *buf = nor->bouncebuf;
> >>> +     int ret;
> >>> +
> >>> +     /*
> >>> +      * The register is 1-byte wide, but 1-byte transactions are not
> >>> +      * allowed in 8D-8D-8D mode. Since there is no register at the
> >>> +      * next location, just initialize the value to 0 and let the
> >>> +      * transaction go on.
> >>> +      */
> >>> +     buf[0] = SPINOR_REG_MXIC_SPI_EN;
> >>> +     buf[1] = 0x0;
> >>> +     op = (struct spi_mem_op)
> >>> +             MXIC_NOR_WR_ANY_REG_OP(SPINOR_REG_MXIC_ADDR_BYTES,
> >>> +                                    SPINOR_REG_MXIC_CR2_MODE, 2, buf);
> >>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     /* Read flash ID to make sure the switch was successful. */
> >>> +     ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
> >>> +     if (ret) {
> >>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
> >>> +             return ret;
> >>> +     }
> >>> +
> >>> +     if (memcmp(buf, nor->info->id, nor->info->id_len))
> >>> +             return -EINVAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int macronix_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> >>> +{
> >>> +     return enable ? macronix_nor_octal_dtr_en(nor) :
> >>> +                     macronix_nor_octal_dtr_dis(nor);
> >>> +}
> >>> +
> >>>  static void macronix_nor_default_init(struct spi_nor *nor)
> >>>  {
> >>>       nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> >>> +     nor->params->octal_dtr_enable = macronix_nor_octal_dtr_enable;
> >>
> >> this must be done in the late_init hook, I'd like to get rid of the
> >> default_init hook.
> > nor->params->quad_enable should be move in late_init or
> > nor->params->octal_dtr_enable only?
>
> quad_enable should be parsed from sfdp, thus we have to get rid of
> setting quad_enable in a dedicated hook. Remove it entirely, but in a
> dedicated patch. Of course, I expect you test the change and verify
> that quad still works on all the affected flashes.
>
> octal_dtr_enable should be set in late_init as we don't retrieve the
> octal dtr enable from SFDP yet.
Ok, I will move it to late_init.

> >
> >>>  }
> >>>
> >>>  static void macronix_nor_late_init(struct spi_nor *nor)
> >
> > Thanks
> > Jaime

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
