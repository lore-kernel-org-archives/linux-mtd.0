Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1165EC001B0
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 01:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De14inGKrtQif3FHeL1AhijVPBp+RXYDb3rSbwWDHnw=; b=IzULCd+1P3G+3s
	GXPk0eLzgQ7fVN+PjMg9CcW+nASO/n59K44DcDDIldWA6l0kQ7e4yi/gjYy6MmG9rA9feOMty5o+w
	Vsn3SrweGIs8p+e46HTC4vtNz8LLJ5hHYohTJUJsZmQibGtxlbSX79EvycK+do1kSaRmJNLB69GHj
	8LJg778jKFISBWdpr3F016Wv+hocViNNGe4Yb6OAkKHgJejqC7qlVTEkOShRlUhclISKZHH81GR0z
	AaQBjJAyfPFvtRwEUOG1l/IL4tAm/mkviSL8fJBhq70vP8Y3e4/8t/SxQ4e4x26gvHa+WP5ruMCE8
	qwRnB8ludXXkLAkdGW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTY97-003odO-16;
	Wed, 09 Aug 2023 01:37:57 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTY94-003ocp-1Y
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 01:37:55 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a6f3ef3155so4928981b6e.1
        for <linux-mtd@lists.infradead.org>; Tue, 08 Aug 2023 18:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691545073; x=1692149873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yKSB+AQGoklGt5VEuk70Fb2LSYmIjX5auT6qf420390=;
        b=lNoMZobBfDpUAAtaKFdE+LzBj0jVapznehKegu265rpM9+MyFxHYHZqnim8//XoPAL
         wal2KjLO3Q/1MtRw188uZXzrJBYoKc0OgPlUwYtCOU4UVLmJJ+aAifeNAgqTcQyXwOEI
         kZaWONoFSpHHLU5egqQQk61aa4QoAK+nneYdPLP8F2VK/MAChnTs7yN2UNm1gFnCmQKE
         GqQojCHd7X1yW8PmBj2eV8mcvm3zgLxZpz5wl5ZOlmSGLH7yHeUYxNL5c8Xjo3T52iZ6
         2blFR6Q9Mmk3g/uWZu+v33XseNERCrTlxMGb9h0WRi9YlW7+OZ+Hi3zIzg2nnMbsCsGO
         FzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545073; x=1692149873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKSB+AQGoklGt5VEuk70Fb2LSYmIjX5auT6qf420390=;
        b=lnVg5W1h/A0GxDg/YtGUk33VHD/7dAbpURKHkr0AVTD38x9fB8CyfSkSwsFzsgP3sT
         DzltcjIdMiYA71RGCnVUVs7qDxbjDGmHFgJlk2l6SEuzgDgzgBa9iTmIqI/Y7AkJ++Hh
         E3yLRyUwmKxUlZaiOCu3SE0pmKLvbWu0gr9rBBEjMCwTNhoEBTctePXRPQ80eBD4/h5e
         ZqdvMkJRtMKrI64OgCVydDM9PQEtt5Y+htUgR9TuZ9M+5MQ6C9Q9uetoWyTRFyEu91Za
         6hI7JyQUHv6M9VCCNp9YntjJrQM2i9D3pa+MVREkjjH8RoTnJSkDWi7mDRUTlDfr315F
         dJJw==
X-Gm-Message-State: AOJu0YzmZJe/CZ6XdNAikoN/vlSQqZ1tGSiX5qkFqPn1ohzeIgrboUdy
	tHnWdtxl45I7qKooYXorRBihNH53wrP9cbAk24o=
X-Google-Smtp-Source: AGHT+IGM2xUzsFZKBv+XcewjnWr/BmDcIc/wsb7WMnsyFRSGxftVnsPfJNtd4xRzLwlRxUwyYMZVnYluTrPHkkAjOks=
X-Received: by 2002:a05:6808:2019:b0:3a7:2690:94d5 with SMTP id
 q25-20020a056808201900b003a7269094d5mr1768659oiw.8.1691545072879; Tue, 08 Aug
 2023 18:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-4-jaimeliao.tw@gmail.com> <49a226a128a908c4d99238246bbd09b2@walle.cc>
In-Reply-To: <49a226a128a908c4d99238246bbd09b2@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 9 Aug 2023 09:36:54 +0800
Message-ID: <CAAQoYRmtUvnU-SmT1sLRgDGQr6UFwsd8=EyN31pv2cghK6apUg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] spi: spi-mem: Allow specifying the byte order in
 DTR mode
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_183754_539834_6E094ADB 
X-CRM114-Status: GOOD (  32.63  )
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
> Am 2023-08-04 11:54, schrieb Jaime Liao:
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
>
> This doesn't match..
>
> >
> > There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> > boundary when configured in Octal DTR mode. The byte order of
> > 16-bit words is swapped when read or written in Octal Double
> > Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> > modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> > 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> > Swapping the bytes may introduce some endianness problems. It can
> > affect the boot sequence if the entire boot sequence is not handled
> > in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> > back to have the same byte order as in STR modes. Fortunately there
> > are controllers that could swap the bytes back at runtime,
> > addressing the flash's endiannesses requirements. Provide a way for
> > the upper layers to specify the byte order in Octal DTR mode.
> >
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> .. this. If you pick up a patch from another author, you should
> keep the author of the patch.
How could I do for this?
Because of Tudor's patch is on old Linux kernel version, it need
a small changes for suiting on v6.5-rc3.

>
> -michael
>
> > ---
> >  drivers/spi/spi-mem.c       | 3 +++
> >  include/linux/spi/spi-mem.h | 6 ++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index edd7430d4c05..fd6b1c69ab9b 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -171,6 +171,9 @@ bool spi_mem_default_supports_op(struct spi_mem
> > *mem,
> >       if (op_is_dtr) {
> >               if (!spi_mem_controller_is_capable(ctlr, dtr))
> >                       return false;
> > +             if (op->data.dtr_swab16 &&
> > +                 !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
> > +                     return false;
> >
> >               if (op->cmd.nbytes != 2)
> >                       return false;
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index 8e984d75f5b6..9da6d53a29a3 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> > @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
> >   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or
> > not
> >   * @data.buswidth: number of IO lanes used to send/receive the data
> >   * @data.dtr: whether the data should be sent in DTR mode or not
> > + * @data.dtr_swab16: whether the byte order of 16-bit words is swapped
> > when read
> > + *                or written in Octal DTR mode compare to STR mode
> >   * @data.ecc: whether error correction is required or not
> >   * @data.dir: direction of the transfer
> >   * @data.nbytes: number of data bytes to send/receive. Can be zero if
> > the
> > @@ -120,6 +122,7 @@ struct spi_mem_op {
> >       struct {
> >               u8 buswidth;
> >               u8 dtr : 1;
> > +             u8 dtr_swab16 : 1;
> >               u8 ecc : 1;
> >               enum spi_mem_data_dir dir;
> >               unsigned int nbytes;
> > @@ -290,10 +293,13 @@ struct spi_controller_mem_ops {
> >  /**
> >   * struct spi_controller_mem_caps - SPI memory controller capabilities
> >   * @dtr: Supports DTR operations
> > + * @dtr_swab16: Supports swapping bytes on a 16 bit boundary when
> > configured in
> > +             Octal DTR
> >   * @ecc: Supports operations with error correction
> >   */
> >  struct spi_controller_mem_caps {
> >       bool dtr;
> > +     bool dtr_swab16;
> >       bool ecc;
> >  };

Thanks your review
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
