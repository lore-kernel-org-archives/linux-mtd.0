Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B9CC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 05:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEXSDBsfjDtpaSCwUjWWCA07FxXbYakcdayoNHC71io=; b=dbJ/Ljqrr8tk2Z
	u+Pf+6d0QQ8vmPsh9ezRANpjkZc3sUzhrYwMF6Z8mkjsILYe2FsIK85Yj8EouhHnMUUaQyTRzEtwC
	+B0CpRfrJ0UONJ1kHKx0KXy7KpyKpX9UmzosdVqlEi5PwXwp0GBACodn1OIRMq5/IwaInYOF/YOXr
	DhOHszpZpPRIloj7rGLNc95NCjYa2SUU1cGujee5APBZh0CTpatFEg3N+7NG9cA9CpxkxpFXg2JWZ
	u6ivqczsGY/du6pl+Rnv4I+RYV/CgOZLKowMvLNbE6Yf4yB+SmxB4RHeeUD1wpJSDDue8YOzc9cVz
	122/dGd95+s5RRDhXPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9tK-001vC8-1X;
	Fri, 12 Jan 2024 05:15:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9tF-001vAd-0m
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 05:15:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-28ca8a37adeso5100099a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 21:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705036530; x=1705641330; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UkhZGoLLO49/zBLtwK5KZducRTCNXb4RMyGKiBYNjH0=;
        b=B3XAko73+G+LHqfKet+2VwhRyqYAyBdf6uTf4OFzrz/QVhH1j4vbgvBZ7OvMXeRY67
         zwvWye/Ib4kvh9q/ELUh9IoemPXrm3U7ACLZEkV7+4n3Hz+Gqj8yjGSpw9baKTbFyQ1T
         4mAlYyOSbVaqfEKjUGKEwDl21D5gZa71ewITWuY2o0PcTnmL3ZH3hsADqNBS4xckqlIY
         e8n7ZRPuT+dMyB4Sg6nQXJTcuRYWZy/74VwSbeSwVJkzCFYO1dDfqlYrEDRbHP1H+0Lp
         RKxbejY/wFOM4kpnjHgNveh8SsODV91cnpANo/v5YjQoG2OvYLvNfeIxxUWsy8HPthzd
         t3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705036530; x=1705641330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkhZGoLLO49/zBLtwK5KZducRTCNXb4RMyGKiBYNjH0=;
        b=aDVHriAso8T99xYFGPmIfWGtrdGEjQcuY0/obr8sa+Li1D/iRZSzdT3fb4HKxtxQ8p
         pjEEQmAKRwozC8/8gBYzIr/+Ec6QFs9ejk10LlBn8IunWNywZB1kDbvx7jX/RvPcKEvE
         FEw30vUPk5h2jV2ge6gNx3nySeMMlvoijCttagLZ8/2wjl0cEFwrPHRU5IIgM0o+WNjU
         cmp0m1LJ+wKyAMicxqS5d+28IJIlVzQAV8EIwoZatvRk2cTQA9kX0oKW7YHAEI+W8+tX
         k3i32LIJ6xT1g5OoLhgSIQEouQQGCRrZLV2GetRY1Fldr+O6quWmVa1HBpnIEjfkqiKE
         C7wg==
X-Gm-Message-State: AOJu0Yz46SFeCWFg83tvGU5dJM+KChWjZrsE+Wk4h1S+V5hhaTrex13u
	UIBIS5/5wTIYjXybTu7bEQ67IWB2MQ3qCi80cH8=
X-Google-Smtp-Source: AGHT+IFWmVi2Q5iibM6VLC2FPRsrxKYH/rzQHxe6hAyq+d1f8k06VlslgEojGaTsdzJFjqTIq752uxMTiI7r6GJFUj8=
X-Received: by 2002:a17:90a:6fe1:b0:28d:4edf:e9e1 with SMTP id
 e88-20020a17090a6fe100b0028d4edfe9e1mr839114pjk.89.1705036529689; Thu, 11 Jan
 2024 21:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-6-jaimeliao.tw@gmail.com> <02ff70794b9c5f361d3728b4ad4d028a@kernel.org>
In-Reply-To: <02ff70794b9c5f361d3728b4ad4d028a@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 12 Jan 2024 13:14:49 +0800
Message-ID: <CAAQoYRm_t=5gVkyf2NS6wucL1FQWpL2oieJ_bi+xpz29vWXoiA@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] spi: mxic: Add support for swapping byte
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_211533_277727_4C651822 
X-CRM114-Status: GOOD (  27.87  )
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
> > Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> > configured in Octal DTR mode. It means data format D0 D1 D2 D3
> > would be swapped to D1 D0 D3 D2. So that whether controller
> > support swapping bytes should be checked before enable Octal
> > DTR mode. Add swap byte support on a 16-bit boundary when
> > configured in Octal DTR mode for Macronix xSPI host controller
> > dirver.
> >
> > According dtr_swab in operation to enable/disable Macronix
> > xSPI host controller swap byte feature.
> >
> > To make sure swap byte feature is working well, program data in
> > 1S-1S-1S mode then read back and compare read data in 8D-8D-8D
> > mode.
> >
> > This feature have been validated on byte-swap flash and
> > non-byte-swap flash.
> >
> > Macronix xSPI host controller bit "HC_CFG_DATA_PASS" determine
> > the byte swap feature disabled/enabled and swap byte feature is
> > working on 8D-8D-8D mode only.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/spi/spi-mxic.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > index 60c9f3048ac9..8dc83adaaa88 100644
> > --- a/drivers/spi/spi-mxic.c
> > +++ b/drivers/spi/spi-mxic.c
> > @@ -294,7 +294,8 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
> >              mxic->regs + HC_CFG);
> >  }
> >
> > -static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
> > +static u32 mxic_spi_prep_hc_cfg(const struct spi_mem_op *op,
> > +                             struct spi_device *spi, u32 flags)
>
> Not my driver, but because it caught my eye: I wouldn't pass
> spi_mem_op. Maybe just "bool swap16"?
Thanks, I will change this next patch.

>
> >  {
> >       int nio = 1;
> >
> > @@ -305,6 +306,13 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device
> > *spi, u32 flags)
> >       else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
> >               nio = 2;
> >
> > +     if (op->data.dtr) {
>
> Checking this seems to be redundant with checking dtr_swab16.
Got it.

>
> > +             if (op->data.dtr_swab16)
> > +                     flags &= ~HC_CFG_DATA_PASS;
> > +             else
> > +                     flags |= HC_CFG_DATA_PASS;
>
> Mhh, this is strange. Given that dtr_swap16 is a new flag means
> that you are now setting the HC_CFG_DATA_PASS bit by default.
> Something to keep in mind if you have any users which already use
> 8d8d8d mode nowadays.
>
> Also clearing the flag seems superfluous.
>
> -michael
>
> > +     }
> > +
> >       return flags | HC_CFG_NIO(nio) |
> >              HC_CFG_TYPE(spi_get_chipselect(spi, 0), HC_CFG_TYPE_SPI_NOR) |
> >              HC_CFG_SLV_ACT(spi_get_chipselect(spi, 0)) |
> > HC_CFG_IDLE_SIO_LVL(1);
> > @@ -397,7 +405,8 @@ static ssize_t mxic_spi_mem_dirmap_read(struct
> > spi_mem_dirmap_desc *desc,
> >       if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
> >               return -EINVAL;
> >
> > -     writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> > +     writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
> > +                                 desc->mem->spi, 0), mxic->regs + HC_CFG);
> >
> >       writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
> >              mxic->regs + LRD_CFG);
> > @@ -441,7 +450,8 @@ static ssize_t mxic_spi_mem_dirmap_write(struct
> > spi_mem_dirmap_desc *desc,
> >       if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
> >               return -EINVAL;
> >
> > -     writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
> > +     writel(mxic_spi_prep_hc_cfg(&desc->info.op_tmpl,
> > +                                 desc->mem->spi, 0), mxic->regs + HC_CFG);
> >
> >       writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
> >              mxic->regs + LWR_CFG);
> > @@ -518,7 +528,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem
> > *mem,
> >       if (ret)
> >               return ret;
> >
> > -     writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
> > +     writel(mxic_spi_prep_hc_cfg(op, mem->spi, HC_CFG_MAN_CS_EN),
> >              mxic->regs + HC_CFG);
> >
> >       writel(HC_EN_BIT, mxic->regs + HC_EN);
> > @@ -572,6 +582,7 @@ static const struct spi_controller_mem_ops
> > mxic_spi_mem_ops = {
> >
> >  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
> >       .dtr = true,
> > +     .dtr_swab16 = true,
> >       .ecc = true,
> >  };

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
