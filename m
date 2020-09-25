Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33188C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:30:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15A920717
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZvSzx9Q4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="lCOusS8h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15A920717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5i/EZ6Ms9/BjrZVQcbwVsgDqewptQcLTzm/cexNLqyM=; b=ZvSzx9Q4JyNPg3el6ygm9gMUo
	TXpYF/yPVJFe9b6zgQCh/DrC3Shw5pHVSMyrT1aFw+IlDAVs2CKmDD8cUm3dUS1if+7bz7WX2rtaE
	EgtmJzDwryZc7WnJS9RTlmna+bC2lsJF9HIHp6lTxJ+wBYxU5rvg5mILzAWEAMSSgRllIWc8DscZ1
	KCcVTXBZa+2UhKxNjX7GP4VaPe6YQeCW2WhUM0XVRME6lU6jnFbtNVRYN1MLh//rwB9HaFDdC0P7p
	CwHw5c27Wzf4lJoGpVbczDZPrEwbew/s+eICMPX08jI3vNcuwzKOnyUe5k/VrY00Eywhv6pJf+sTy
	B5vZM2I6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLluz-00043n-E9; Fri, 25 Sep 2020 11:29:37 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLluv-00041r-Qb
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 11:29:35 +0000
Received: by mail-ot1-x342.google.com with SMTP id c2so1941904otp.7
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VATywaeCtSZal4icWJrV1Gr0nCEObC/TuWU6wNtTQEE=;
 b=lCOusS8hZtrC9qZoQGY3Ser/7yrF9BU9gLkQV5qqjgvZ8Y7dRiT7BIrvn9GiSrSH0L
 5FncwH4gjLeePETztJ4Q610W1/s0fBPAyxRobyznOWI530KgtGCx5ekOPFIRZIr551VG
 I3RqFyCSDX39gtr3FlhfhZceeKJBJNWFbR8iJWxFkpDhPr6IO1E6zyM7sTmxQcVz0Rk7
 VmOMVSSJTcVvmWPjjXa0nn8SDOurSrILPGYIaKa1OtU7J2Pa288YjGyLvZMIp3Dm4LNO
 a6JfdlgGyF1rDIHSaNYHpI+CXqUCxZqxv08OjquJ5V0Q3rlnyUFXrLziXR3w2JFgrIUm
 iHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VATywaeCtSZal4icWJrV1Gr0nCEObC/TuWU6wNtTQEE=;
 b=fPJSqxuc8xcXygsBv6mKyiNiJeq34v9XzsIT7hlo7SENl7kYOgRWIDeXdPu0QT+xIg
 59Z78OKmBqi3WpEM1e340DIFKaEja+msNPBIBYGqwcTJRs2R3CWhc88xsaOO24jlFt4+
 SotPapwanZzGlpTOcuhXYPWrtLJespNpvgYdL9h0tb1PNZSAnvORGrfZYdtKRirjF02Q
 vfAbmTWrLR8SUumhQ8q0rKW9otwEFsIG6ZmG96wqVVfrvDQnWEMM8pmWU/p7jZZzq1LW
 9mq+sdwjKCoTvdi/xK5WVxVieGM7nPfLiCuVmbQfUdbWYOBHnjv7r0EUADSdHiGoaI4v
 SP/A==
X-Gm-Message-State: AOAM531OOZvS4W/FAg9p25o8vXPh/Xk5I5F0w2pKbEOCnhXcIvTBSPB4
 GjFlCt1aCsgdGqAf2Y/hk49oHSCfxO3Is97Szky/9w==
X-Google-Smtp-Source: ABdhPJzE3K5xm1eViWbfi0ZoJZKCUt9N8Q3Hq1ZW+DlbeaaZM4VGEsGgYmRjWMfgQH8SjBMIwkPzlPlgFzTmLVtNvK0=
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr2566408otj.66.1601033369873;
 Fri, 25 Sep 2020 04:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200915100623.708736-1-robert.marko@sartura.hr>
 <6693ac3b-bf07-4a02-caca-5285dabdbb14@ti.com>
In-Reply-To: <6693ac3b-bf07-4a02-caca-5285dabdbb14@ti.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 25 Sep 2020 13:29:19 +0200
Message-ID: <CA+HBbNEWsPvrx5U8dYfJ=Tsc4+ujCXzDJk0S_Jd5OKtVrQ0AqA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add SECT_4K to mx25l12805d
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_072933_881586_ED9924B9 
X-CRM114-Status: GOOD (  17.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Luka Perkov <luka.perkov@sartura.hr>, tudor.ambarus@microchip.com,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 1:27 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi,
>
> On 9/15/20 3:36 PM, Robert Marko wrote:
> > According to the mx25l12805d datasheet it supports using 4K or 64K sectors.
> > So lets add the SECT_4K to enable 4K sector usage.
> >
> > Datasheet: https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf
>
> Have you tested this feature on a real HW?
Hi,
Yes, this has been tested on Alfa AP120C-AC which uses mx25l12805d.
I have not spotted any issues with it.

Regards,
Robert
>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> > index f97f3d127575..9203abaac229 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -50,7 +50,7 @@ static const struct flash_info macronix_parts[] = {
> >       { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> >       { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
> >       { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> > -     { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
> > +     { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
> >       { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >       { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
> >                             SECT_4K | SPI_NOR_DUAL_READ |
> >
>
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
