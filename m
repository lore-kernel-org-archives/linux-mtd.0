Return-Path: <SRS0=Ynzp=NM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A2CC4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 21:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A783F6125F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Aug 2021 21:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A783F6125F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renard.ga
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNnQKEj0SAB8bcBDYKf4NG/OOqQNG2MXk9cxmY8nRPk=; b=nEjkMAr04pmHs1
	7W/nJychl4nF9lnv3kUVJ+k2e/HekPCzgNXYlaqAsVDHfH/d7O2j0Uf2Y9m3E895nlWoRFHhqybpD
	AQ1RkiK7gtkVSUW8ou3QF5O5eXxhmyFjSatMBlCSqJOmQuUIGT8maL/wPOmAj34FbiWyFEXwK9tBJ
	dGm3kzOix2OjIU2E8gQMN+ipDeT6SR5+X2wkktAaQDuNITVSTfgO1KsRFsgU/A5ekwQYH1bbbY5LO
	ee2+BO/kJsjA9HjqTJlcDzDfykzFpoMPshgHcs/aRgsNYEQUTxU601yzOZ0hlLbto/uSc8JwDh4TL
	s7dGUSg+wXEkZ9w20VMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHYNP-00DCOh-2s; Sat, 21 Aug 2021 21:18:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHYNJ-00DCO0-3W
 for linux-mtd@lists.infradead.org; Sat, 21 Aug 2021 21:18:01 +0000
Received: by mail-oo1-xc32.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so4062192ooi.4
 for <linux-mtd@lists.infradead.org>; Sat, 21 Aug 2021 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renard-ga.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8+xNI7Xpt03WJ5wm4IF5YQdJ93Vcgr3CjWcGnJjFvRs=;
 b=fsUx/PwZv+EPcIXoKpyNCsADq6WJXPrPbJ7xhT2XUWIuSqmKILfU9L1dE5f516uKDW
 ipzlssocI1LqF4VpxOx2fUVQHnC/1WF5yci3oV3a8KUsqZoJGAWg00VuD6to+T+fNk7u
 rRl1/5wewAMh4NIFOLczSC6ZFkgfDTyvc3C+zT8M7yWU15GJfEUM5gC3ZNwycQgmwS05
 VMzXjJvwEaDaBEnIBUNp4E0VV2pEjeln6y9W/loAbtT+EXowsju4UqXzhqiusfFhn53k
 N0eafTAcgcZR2i5W9FVyMCpN0u9PhpMccfvWKtXzADhPDuBLit4c5DHloaSXnRFPp6dM
 y9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+xNI7Xpt03WJ5wm4IF5YQdJ93Vcgr3CjWcGnJjFvRs=;
 b=uOVJPM7oQylJrDapTiSr2CcB8jQTwShSJHny8LG9gungg3ym+4ODNMw4lu/YPv4Gaw
 7ENhO0XP66VWw2tmHXjaIcFjFTHyZxawhjkXmMuCdr5PRecrf/4s90BFJXBpZFQEDgo6
 ZmY32VwHtNyZMCNFWPvmxVBD2OH08JR2tD9V/x7c/Zoey+ilcggMT77oquM5KtleBI3c
 Sx8HvvL02OOWnAqhxpb9IWWUR9a7WLlx/xGjj8Kus9dJNmvODjxgD1x9P3PkfD9nQDDq
 mXqz+bhMqXDqbKbW+4Md7XU+9JjMBZYYubJWlJpRTs2iovRkND6UpptZVKyCs8kvZHXL
 LYrw==
X-Gm-Message-State: AOAM5338OXZw9zRDztdrzXs1AWfKlN/19VY2PjgsZS7b7Ce6OTK4B1tZ
 1sr6P8i9MhhZ68lFELAsIdt5VoRDiRNBEp6WrPacLQ==
X-Google-Smtp-Source: ABdhPJy+lDABIJjPinV7SutPTwSSsZ5IJ0963pmXaA5HCjCOhQBXPV2XJf+WfZ0UjAU2WB+NgmefHB5SADXvLM+TrpE=
X-Received: by 2002:a4a:c541:: with SMTP id j1mr20946603ooq.15.1629580671197; 
 Sat, 21 Aug 2021 14:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210630175446.17680-1-rapid_renard@renard.ga>
 <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
In-Reply-To: <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
From: ", R_R" <rapid_renard@renard.ga>
Date: Sun, 22 Aug 2021 06:17:39 +0900
Message-ID: <CACHYknGyR9kmpJQ=DzVPJBFQck7hZQ52d4=M5ypJET+xO=bZOw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: esmt: Add support for F25L16PA
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 Sungbo Eo <mans0n@gorani.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_141757_325303_3C7F4AC9 
X-CRM114-Status: GOOD (  22.56  )
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

Hi, Michael.
Thanks for your feedback!

On Sat, Jul 3, 2021 at 12:11 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi,
>
> Am 2021-06-30 19:54, schrieb Jihoon Han:
> > Add support for F25L16PA which is 2MB SPI-NOR Chip manufactured by
> > ESMT.
> >
> > Tested on Qualcomm QCA9557 based DW02-412H router.
> >
> > Datasheet:
> > https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L16PA_1(2S).pdf
>
> Please put it into one line and just before your Signed-off-by so it
> will be tag.
>

I will fix it for v2.

> >
> > Signed-off-by: Jihoon Han <rapid_renard@renard.ga>
> > ---
> >  drivers/mtd/spi-nor/esmt.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> > index cfc9218c1053..2ebeecd6c957 100644
> > --- a/drivers/mtd/spi-nor/esmt.c
> > +++ b/drivers/mtd/spi-nor/esmt.c
> > @@ -10,6 +10,8 @@
> >
> >  static const struct flash_info esmt_parts[] = {
> >       /* ESMT */
> > +     { "f25l16pa", INFO(0x8c2115, 0, 64 * 1024, 32,
> > +                        SECT_4K | SPI_NOR_HAS_LOCK) },
> >       { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
> >                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
> >       { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
>
> There is a F25L16PA which has a different ID (0x8c2015). So we have to
> agree
> on a different name.
>
> See also
> https://lore.kernel.org/linux-mtd/20210620085639.143694-1-mans0n@gorani.run/
>
> --
> -michael

According to the datasheet, the previously produced F25L16PA has an ID
of 0x8c2015, and the subsequently produced F25L16PA(2S) has an ID of
0x8c2115.
Since I have only tested F25L16PA(2S), I would like to revise the
model name to "f25l16pa-2s" as the conclusion discussed in that patch
and submit the revised patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
