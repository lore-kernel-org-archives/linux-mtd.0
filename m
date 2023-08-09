Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3746EC001DE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5JMq3LKCsjkpKUbedrj49t5d991amMZ9u6EwK9MaR4=; b=gutM6SAe2lDq/s
	PH51rbnbs6W30uUdWFeUuj28CGK3X2gJ3csbHqBYhTPJII/ZfzxJngq4u1aTUSVGQQAv30klgwQIO
	f7jZZ9QYrUgIb5hL2+fEAc0Fz8ocAp2rq8tpQYqf3Y5jiV9Sz+DSMMzPLEANrmoBnjCYguOjtz8/n
	8EN0BsM7J27Xvlpu2IVT17pHsWJDwRjXmk85Og5QGR3lej89iWr7WmfPIKYM2p3eaab/iLEuXKUdr
	9VuwbmaXgZV5TfvRmSvrIh/ZEbdsaiFAIsEopVyoCasw2zr/xrTLE/gEv5lXX4Yydrih2PcCghAqE
	gWqUOzwGGVuVaOqaT0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXdL-003mK6-0H;
	Wed, 09 Aug 2023 01:05:07 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTXdI-003mJd-1F
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 01:05:05 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a76d882052so4529397b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Aug 2023 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691543101; x=1692147901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hkP8KVxVWEZuz28rz7nq8judos7y2G6/jUQzQSjYVC8=;
        b=G+X4/plgxgwuZDMZtKI70MzMDTJf8boCJ0U3cFD8FVizs3tJt0rgY6ONR4L1uH/JvC
         Pmil/Q+F+tP8xNuKvWWLa+N9YaLVLcRI7T+IaayPGu0Cqe78hgkil/UB4ASRBHDO+wWn
         HSQ3lTWMOhksanTOJRmBdK7FVGxJLw7AKKIS6SBURh28/e4LoEiJ/giFJGBvvLYpuQQx
         O/ACCgn65hb6II5xNwQMWvqLm9YiWd4F2DIeF2px/nSDMTxBnv27aScjUVt6GfiC8snI
         r/YoWcLemm4+9BrFrACzm9inRgv2AnxtQ84QsRQahxiyZOg8FWJVZD8bH6Vtkc/pcSXM
         owgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691543101; x=1692147901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkP8KVxVWEZuz28rz7nq8judos7y2G6/jUQzQSjYVC8=;
        b=WKFA1LTEsmIttb+N7SyHuF71gAyyr0aMApfjm0XepInL264XE4siFtUEDlrSNU9nvC
         tQChQ6Ag21+mYHS/s62NF7jrcU+CH59bHHewxTknDcIaOnPMdXtkYnGYdvejKDuUk2ao
         EqsiZQg80rzyMYfwTKLV5y1UMMnTFXEW7pml8EPMtOn24ppJ3x9GUwK1AIK30oj5ykak
         yYAwfChLTufTk++Tv/vV+UK8eFROYj47YqQ+dna1t4xDj39eaCPtWcFek+uHMBsp6iDg
         wS8mAZoFNiYMGYNAaUBwH3Kffsl+lDWaXC+rI3zGp9G1ZYdXsMubAJPk5LkzQNs1kn2D
         9EWQ==
X-Gm-Message-State: AOJu0Yxu9L9TFCjnFdebosjq4jPOA1RXMQMJXTcaRTOTwh3/VsIRsbTp
	H6Ckjn/yzB1c6WkqbZzFX1dHWUwhgdLMzlKFfSM=
X-Google-Smtp-Source: AGHT+IFUcAxtCng3ELjGo6dbuBMYkCo2Fsl4W3eoC/m6bX1bDEk6Uc4iAPRPAsn1x8ikcyzIT77oPfNzsQ1gEPAe1wY=
X-Received: by 2002:a05:6808:98:b0:3a5:98b4:c137 with SMTP id
 s24-20020a056808009800b003a598b4c137mr1343858oic.51.1691543101625; Tue, 08
 Aug 2023 18:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com> <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
In-Reply-To: <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 9 Aug 2023 09:04:03 +0800
Message-ID: <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_180504_469169_F43AD2B1 
X-CRM114-Status: GOOD (  31.12  )
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
> >
> > Patch ID for flash support is a thing that we keep striving to do.
> > Follow the optimization of software architecture, parse SFDP is
> > the mainstream in SPI-NOR subsystem.
> > Label "spi-nor-generic" to the flash which didn't include in ID table
> > but support SFDP, is a good way for flash support.
> > Building upon this fundation, achieve hooking the manufacturer using
> > the
> > 1st ID byte.
>
> This won't work beacuse the manufacturer id is not always
> one byte long, think of continuation codes. In fact, as the
> flash_info table is of now, we cannot even rely on the
> continuation codes, but we have to always check for the
> complete id_len, i.e. there is at least one hack where
> the id is reversed and the manufacturer is the last byte,
> iirc. some oddball cypress mram chip.
According JEDEC standard, 1st byte is manufacture ID.
I check id table, "cy15x104q" with multi manufacture ID in
later bytes by RDID command(9F).
Maybe some old flash didn't follow this but I think it isn't
a high percentage.
Most of all and new product are follow JEDEC.

>
> If you want to get the correct manufacturer for spi-nor-generic,
> you should extract it from the SFDP tables. It seems that the
> BFPT don't include a manufacturer id, but if there are proprietary
> tables, you *might* use that id. I say might, because it only works
> with one byte manufacturer ids, no continuation codes... *sigh*
Unfortunately, Macronix didn't include proprietary tables in SFDP for
octal flashes and as I understanding proprietary table is not a stardard.
So that content and address are not identical each vendor, it will need
a manufacturer fixups for reading.

>
> -michael
>
>
> > Consequently, extend support even for parts not descibed in SFDP.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/core.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 5f29fac8669a..eb0a09c06bf4 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2036,10 +2036,13 @@ static const struct flash_info
> > *spi_nor_match_id(struct spi_nor *nor,
> >       for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
> >               for (j = 0; j < manufacturers[i]->nparts; j++) {
> >                       part = &manufacturers[i]->parts[j];
> > -                     if (part->id_len &&
> > -                         !memcmp(part->id, id, part->id_len)) {
> > -                             nor->manufacturer = manufacturers[i];
> > -                             return part;
> > +                     if (part->id_len) {
> > +                             /* Hook manufacturers when first byte (maf ID) is same as other
> > IDs on ID table */
> > +                             if (!nor->manufacturer && !memcmp(part->id, id, 1))
> > +                                     nor->manufacturer = manufacturers[i];
> > +
> > +                             if (!memcmp(part->id, id, part->id_len))
> > +                                     return part;
> >                       }
> >               }
> >       }

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
