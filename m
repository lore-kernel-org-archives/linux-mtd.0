Return-Path: <SRS0=Ynzp=NM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEEFC4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 21:54:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DE161262
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 21:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87DE161262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renard.ga
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhVln2ibdl0UHMShYusXQR5jyLyqGd088xrcTaHpGEI=; b=ChgaxJU2nN3YL1
	GyF9IvChB/uYoPKHIFMCkrSPFtTt+trSkBloXx4gUBJBfHov4kKA0MsR/q0yKfYBkPjN0TG+Cx8hM
	PFW6wDR60pEHSE32DJ92SB0YRlsy/ZoR82BSNNazjMQAXZC0/VxvHc7Z16f7XkEp88qYrgEk07aHQ
	ePlvlzsm19qOBtPyXlRiytc63AYFEeaWVvrNn6GcQLEAYabxGnNRBzHpKTx2opugctCCeiGyaXoXV
	bWo3EiSaU8glW5m78D5CBjKWXgSYCR4tg1Y6WsedMS/2LA08JZ9ZPIFgGZG18KmGiHHH4HY/EAe4u
	ZSrWzXhLPU5ENlQ5oj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHYvx-00DDSq-Q9; Sat, 21 Aug 2021 21:53:45 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHYvs-00DDRy-1Z
 for linux-mtd@lists.infradead.org; Sat, 21 Aug 2021 21:53:44 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id
 v20-20020a4a2554000000b0028f8cc17378so390616ooe.0
 for <linux-mtd@lists.infradead.org>; Sat, 21 Aug 2021 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renard-ga.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ma7o8Kr8IFG+mMHy2XPhG/2ykIogRzncfem8D765t2U=;
 b=wF22UJcqDIwARHOZ5m3+QpS12xUe4SdWsRf4A8sYeWYlydJpFOPYnZWSbufa5E3mTI
 HvtztkCKxv7Ibg4YP0kBqLgQ+PnwEaPdSnW9YKORg9AOYAi7bV7fYGPYgiFExtTO9nxn
 dGdxkHH2q7qFtjwZ7UlRHN2VTNNzDc9DfEAAvJRAkd9QR+7b4QAAVjBWOGJ/PPZUUqHN
 VBXKJEgl5spoak3xyAIoYQqcSUnH9Q7jhOKgxQ4qdxEvrmM+21MuZ/Mbp4VyQUC4bfPm
 NgRFnSqT0joGaDCjYkjmcvwhLoxF2liDHQlSSAuxKj9xa9pYY8FSZzig2G3t2L0RnrOo
 4j2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ma7o8Kr8IFG+mMHy2XPhG/2ykIogRzncfem8D765t2U=;
 b=ObSrBcTBACoH/qQZEESTcoM+FeD8SRRlepd/l8v0NBzbkSXYEXlKUd5YBWdte7oDcV
 +DG6JQzNHv8lVdTZqdiI+JwSxMRKGVvwMQpf95PUGjKTs5DXrddJ74ZYuw/TOdHexKpV
 D5GrNK0Wslq4lvEl54AnKdadqsFVwMpw6B3cVMqLrvB1tKXGb39WLusTr/lkH0891RUo
 5XjK+2h4w8PiyNhgQQEv1MrSGnw3c6devrOi6dEed1KEZ6uLYsP+Nsny3ZpbCx7ihNod
 BV3oKCyWYL0AsDzM0Cb4FSuO3yJHJUT6/kEO67vbr4ZWYXY0ZSXlJpw6rS59Lp0nnnuu
 ByCg==
X-Gm-Message-State: AOAM5301jjxJKmVUwkSCA+oLK6+ajUb5MoQIUCVneDONrPmbwKuSPWm+
 5jSLcqVYIh7KItLEi0ihw7zoizNjCgpAgB+zEdIBfg==
X-Google-Smtp-Source: ABdhPJz3JqMoxK8/CIGTFm+Wmy/PnmVoH+3M2j59BREXFPs06jGRG+zN4W5yvkDFcNQN8BwgRSa62ke3cKvaTIZG6Hw=
X-Received: by 2002:a4a:c541:: with SMTP id j1mr21006159ooq.15.1629582818837; 
 Sat, 21 Aug 2021 14:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210630175446.17680-1-rapid_renard@renard.ga>
 <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
 <CACHYknGyR9kmpJQ=DzVPJBFQck7hZQ52d4=M5ypJET+xO=bZOw@mail.gmail.com>
In-Reply-To: <CACHYknGyR9kmpJQ=DzVPJBFQck7hZQ52d4=M5ypJET+xO=bZOw@mail.gmail.com>
From: Jihoon Han <rapid_renard@renard.ga>
Date: Sun, 22 Aug 2021 06:53:02 +0900
Message-ID: <CACHYknE7KL6h3WEO1ULokLYCZe9VdoVkoCwwtnPP8Xb8j=8_pQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: esmt: Add support for F25L16PA
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 Sungbo Eo <mans0n@gorani.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_145340_135120_A0475439 
X-CRM114-Status: GOOD (  28.10  )
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

On Sun, Aug 22, 2021 at 6:17 AM , R_R <rapid_renard@renard.ga> wrote:
>
> Hi, Michael.
> Thanks for your feedback!
>
> On Sat, Jul 3, 2021 at 12:11 AM Michael Walle <michael@walle.cc> wrote:
> >
> > Hi,
> >
> > Am 2021-06-30 19:54, schrieb Jihoon Han:
> > > Add support for F25L16PA which is 2MB SPI-NOR Chip manufactured by
> > > ESMT.
> > >
> > > Tested on Qualcomm QCA9557 based DW02-412H router.
> > >
> > > Datasheet:
> > > https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L16PA_1(2S).pdf
> >
> > Please put it into one line and just before your Signed-off-by so it
> > will be tag.
> >
>
> I will fix it for v2.
>
> > >
> > > Signed-off-by: Jihoon Han <rapid_renard@renard.ga>
> > > ---
> > >  drivers/mtd/spi-nor/esmt.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> > > index cfc9218c1053..2ebeecd6c957 100644
> > > --- a/drivers/mtd/spi-nor/esmt.c
> > > +++ b/drivers/mtd/spi-nor/esmt.c
> > > @@ -10,6 +10,8 @@
> > >
> > >  static const struct flash_info esmt_parts[] = {
> > >       /* ESMT */
> > > +     { "f25l16pa", INFO(0x8c2115, 0, 64 * 1024, 32,
> > > +                        SECT_4K | SPI_NOR_HAS_LOCK) },
> > >       { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
> > >                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
> > >       { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
> >
> > There is a F25L16PA which has a different ID (0x8c2015). So we have to
> > agree
> > on a different name.
> >
> > See also
> > https://lore.kernel.org/linux-mtd/20210620085639.143694-1-mans0n@gorani.run/
> >
> > --
> > -michael
>
> According to the datasheet, the previously produced F25L16PA has an ID
> of 0x8c2015, and the subsequently produced F25L16PA(2S) has an ID of
> 0x8c2115.
> Since I have only tested F25L16PA(2S), I would like to revise the
> model name to "f25l16pa-2s" as the conclusion discussed in that patch
> and submit the revised patch.

I didn't check to send an e-mail with my real name by mistake.
I'm sorry for the confusion.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
