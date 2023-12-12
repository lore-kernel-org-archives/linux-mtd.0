Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D4C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 02:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhTrvvswQKwAEFmHyP/vOYYDasAn+njAZ62HZ7EmTok=; b=0+vIfYdrIsMhz/
	6DFOf8jqd2OlsVuMwDcKv9aLb/eQg6CRd8Yllp49XXz1E+MxfSkshatni0R50otIQYjNxy9y8/Adi
	zX3hF7T4eDDEzGjEfNT4LHaCAEt/sLZyZ3S+V6DIl1OpI2ez3cRu9ob+mCQLMlxZLBYvqoMAzuuMF
	Ss4bjlzNWpNhe101UmbvT2H8KIoQsStgx+CcSH/MRyM5jtUu0SXsqdkGOW6CHNGib4geM/5n68Pv7
	qtwpFP2OUdIuRWdqEHzbE/iud3AQEztFr7ZmeVh6zgoLv6seyAtd4zo3jkRbjyzVANzoY9K9I455O
	rjZRDmEiCYkdrFnNM3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsJV-00AVKJ-1p;
	Tue, 12 Dec 2023 02:16:02 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsJS-00AVJc-14
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 02:15:59 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5906eac104bso2958895eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702347356; x=1702952156; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hwf/A/BLTK67N7+JgGvDAiQ7JLc5/N3M6Z0SXp/fHw=;
        b=BNhMfwQdGrYKFbbu+6huvXIA+6vDSYb1aE22m9FVqYh9jCQB2CxzB0SRu8Uir8PHKB
         GJi2Vh12WiT26e9HuUrcSQd/j8GegjkCDwKp9jFwNGIpeXCvMYsFgB0Qpi9UnOnfm4hU
         zFx++0hQJhvoJ3MHU9POUY/MPrzsonKBES+tzv4j/Fju7Sh0V09a7t9ez/5MUm0Vugf0
         EYtMU9+q4NOCM19gHhOYat8RYEjMM+aSTvxdDoK03dcYQUHVZma9UdH4u5G1d5luxu6J
         f01iSz8TIJ2gC09lt//WcDJC9dR9AbxqeNs+mEmO+ziBr5EITA/u46Yr55o5LUvbx5JK
         /fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702347356; x=1702952156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hwf/A/BLTK67N7+JgGvDAiQ7JLc5/N3M6Z0SXp/fHw=;
        b=wENevP5PEk7ZZ/sXWrH5nVgLtjBe+fdzBXFHSyi+K1Mx7bshcNg+2SKubVyP359WyR
         IQIV99JNxYpKK2f5APxhNq1sm6W4bNVIw/FN817mIHgvWE1Na3fPCRw82r9iA3kUqt5m
         WGkUKM9Xzf709H0Hoa+sC16YPH3cDbmGYErjWEACX89gYjRvpACgbgnb4seFy+ALCAVT
         lwCAkvmPS2fll0fVKTWQhCsfi6b109jWCiEe+om65M28FvcZMsk7xB/sl/QyfvvoBKyg
         5KIlw8mIYt0+0uo0wguxQKwNvEzp2vLJawoBWzay/WvntgYmipPch+L9dtra+bkNYGYA
         hUTQ==
X-Gm-Message-State: AOJu0Yyg85APwtHQJD7vMHAzkIUsL0ErkYIDpSTN1xnVkRSHq354U+Z+
	7M/FhGtZYdDzcfxNipf7FvZy7qNcNdSuEluc+onVC8An
X-Google-Smtp-Source: AGHT+IEPqCD3m/U+IpjdmOq6CzkIDe/WMiys2W4msAdKY6ydAcEvwBGYAapq9RBhZm5TIpF60VwEaVpuuG7xaJMHOEY=
X-Received: by 2002:a05:6358:9213:b0:170:6ed7:28f4 with SMTP id
 d19-20020a056358921300b001706ed728f4mr8245773rwb.8.1702347355591; Mon, 11 Dec
 2023 18:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20231207075121.21788-1-jaimeliao.tw@gmail.com> <82372114073788a4b62ec2de163a5b10@walle.cc>
In-Reply-To: <82372114073788a4b62ec2de163a5b10@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 12 Dec 2023 10:15:36 +0800
Message-ID: <CAAQoYR=n29KAocdTeJ07gGtr3US7eTh0uhyoo_6-M3H1QoOUQQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_181558_392261_38E8A4CA 
X-CRM114-Status: GOOD (  28.86  )
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
> > BFPT 17th DWORD contains the informations about 1-1-8,
>
> Ok.
>
> > The difference from Dual and Quad mode is not determined
> > by a single bit indicating support but rather by using
> > 1-byte instruction, which content is the opcode.
>
> I don't get what you try to express here.
In struct sfdp_bfpt_reads[], support bit and setting are defined
for every Dual and Quad protocol.
It is a good way for checking whether the protocol support.
1-1-8 would be check by 1-byte instruction but sfdp_bfpt_reads[].

>
> > A value of 0x00 represents not support.
> > Therefore, parse BFPT 17 DWORD instruction to determine
> > whether flash support 1-1-8, and set its dummy cycle
> > accordingly.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 15 ++++++++++++++-
> >  drivers/mtd/spi-nor/sfdp.h |  3 +++
> >  2 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index b3b11dfed789..d04dbddb70d6 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       u32 dword;
> >       u16 half;
> >       u8 erase_mask;
> > +     u8 dummy, opcode;
> >
> >       /* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs.
> > */
> >       if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> > @@ -516,6 +517,18 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >               spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
> >       }
> >
> > +     /* Make sure BFPT provide dwords more than 16 and parsing 1-1-8
> > information */
> > +     if (bfpt_header->length > BFPT_DWORD_MAX_JESD216B) {
>
> Move that into the JESD216B and later parsing code and you don't
> need this condition anymore. That is below
Sounds good, got it.
>
> if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
>         return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>
> > +             opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD,
> > bfpt.dwords[SFDP_DWORD(17)]);
> > +             dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY,
> > bfpt.dwords[SFDP_DWORD(17)]);
> > +             if (opcode) {
>
> move the dummy here and you can just declare dummy here.
Got it.

>
> everything else looks sane to me.
>
> -michael

Thanks
Jaime
>
> > +                     nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> > +                     spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> > +                                       0, dummy, opcode,
> > +                                       SNOR_PROTO_1_1_8);
> > +             }
> > +     }
> > +
> >       /*
> >        * Sector Erase settings. Reinitialize the uniform erase map using
> > the
> >        * Erase Types defined in the bfpt table.
> > @@ -525,7 +538,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
> >               const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
> >               u32 erasesize;
> > -             u8 opcode;
> >
> >               half = bfpt.dwords[er->dword] >> er->shift;
> >               erasesize = half & 0xff;
> > @@ -968,6 +980,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
> >               { SNOR_HWCAPS_READ_1_1_1_DTR,   BIT(13) },
> >               { SNOR_HWCAPS_READ_1_2_2_DTR,   BIT(14) },
> >               { SNOR_HWCAPS_READ_1_4_4_DTR,   BIT(15) },
> > +             { SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
> >       };
> >       static const struct sfdp_4bait programs[] = {
> >               { SNOR_HWCAPS_PP,               BIT(6) },
> > diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> > index 6eb99e1cdd61..584a05f9931d 100644
> > --- a/drivers/mtd/spi-nor/sfdp.h
> > +++ b/drivers/mtd/spi-nor/sfdp.h
> > @@ -118,6 +118,9 @@ struct sfdp_bfpt {
> >       (BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
> >  #define BFPT_DWORD16_SWRST_EN_RST            BIT(12)
> >
> > +#define BFPT_DWORD17_RD_1_1_8_CMD            GENMASK(31, 24)
> > +#define BFPT_DWORD17_RD_1_1_8_DUMMY          GENMASK(20, 16)
> > +
> >  #define BFPT_DWORD18_CMD_EXT_MASK            GENMASK(30, 29)
> >  #define BFPT_DWORD18_CMD_EXT_REP             (0x0UL << 29) /* Repeat */
> >  #define BFPT_DWORD18_CMD_EXT_INV             (0x1UL << 29) /* Invert */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
