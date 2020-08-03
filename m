Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8A6C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 12:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EC820678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 12:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zq3Cw7hz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="INrGUnJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EC820678
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dwv2WeeUNaxYETx44wW/R+o9J6rzoSnP1hLDv+ud9DI=; b=zq3Cw7hz+nkivRg/VaYEq/A71
	xI+e7NmJqNbMue53dRUqzV8C4tPitp8nEY7dNxU5E1Df6WqW6GR8G2nYTPUbRuxLffNfaZ+aKU8XQ
	96IA4lq9jy1jDCrdGSitx/PXh4DTG4azMp3cHR8MWDj7iIM5PTCsrPUhdFAejexSx/kw/RgCz4Hnc
	Rysm61uQScFve5Qj/xo7NuU2U4FkG4iT/G76o8TcIVVTfsa6FHk6YlcCsNeXg7BPMvENPfHm3Vk28
	hEyZzKb59hqj5BaouC3ZbJ9+jF4sh8RC9UPDx5vmUNKeZroPv4RCoD0vuYn+iZHlVBMbXdjBARj5e
	k3a1TggHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2a36-0000VY-RF; Mon, 03 Aug 2020 12:58:40 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2a33-0000Tr-N5
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 12:58:38 +0000
Received: by mail-qv1-xf42.google.com with SMTP id y11so14261581qvl.4
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hMT0kXz5t1WlxhKdWYf7H/xItPGzEq+A55WtZ2+D4/I=;
 b=INrGUnJrvvSk6e3+aV2VgzC0XESxwlRZvQcst2jXyBNpTkMHYyvuy8qp9Ut87dDQWG
 y+aqedwp4Taqrqv94K3l9BkpYCF37e6KB/6Oj4roXPBX8SbTKWxSI8eRRlakZfCABbHv
 /NoCR+7jDjWkKTqnC20Z+gEkUV89AAZsKMHcFOtfDeF0tEpSUhJlFUsw2q8dSaAaREX3
 47vNOLCuofipKCY2DWZCOqF4K0DvLXMi+9BwL5eGKp+QaX1hyD9Qn6SWcnMhv7vktN2F
 SINb5Jd0zS03FqG60FE3451vaoVPv23hkZ16Grbojnda2Tfl8EgZkyST1bijDHItC28p
 ydtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMT0kXz5t1WlxhKdWYf7H/xItPGzEq+A55WtZ2+D4/I=;
 b=lHwWcZlyD7lKJZgrSGgfH4CCpxTmWzBJN9Is++11K1rwDCG7G5BvEIEA2GYtcyfYuI
 m8Aj1FCT1MiL23gchZGLTu4x+ezISN04d9oF9toGp32ZVH0/eXHsMe/N/+9NhhypGB46
 gfkKrrZbvj5rMYgupmYK8a3BZWo5V4bA4ehdUN93kRjG+h+xw2MT+cJFBh2t9mOsWaHD
 1dF2yDFWmgHVdqclVaGod8SwygCWNqzHFC8OsIv3hM7967gWPttypDdU66s2mhG/KAbr
 X1QFA4/6wrKv1MInjivSjiOPc4yu5YuOQs9IgXZ6rTqAnYxgMAWM5oBWN20LQtoVZ6/P
 yF+A==
X-Gm-Message-State: AOAM531l0ut7ZBp+lEmIjFCcmPKAFPW9NpZ+LkaynRaI0K5hmO83WzXW
 1XUB4m7pxV0IUwCuUrEqGZ7yrym2WKJ+fxl8FzU5zw==
X-Google-Smtp-Source: ABdhPJxZmIwMOwJq4SwiSkCoJapyo5gtyYk7zA5OkjK+cKoeY/k56q8q8XGjCBAM2maXoOOquYPzasZBhozkWerzxHU=
X-Received: by 2002:ad4:4cc9:: with SMTP id i9mr16260419qvz.131.1596459514234; 
 Mon, 03 Aug 2020 05:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200803095720.GC1375436@lahna.fi.intel.com>
 <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
 <20200803102711.GK1375436@lahna.fi.intel.com>
In-Reply-To: <20200803102711.GK1375436@lahna.fi.intel.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Mon, 3 Aug 2020 09:58:23 -0300
Message-ID: <CAFmMkTHSjQZJNzvUzLHHJ7sUTVX4BV6TwB=P8EO-HNk_cv8RKg@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_085838_066846_4356F51E 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Richard Hughes <hughsient@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 7:27 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Aug 03, 2020 at 11:18:12AM +0100, Richard Hughes wrote:
> > On Mon, 3 Aug 2020 at 10:57, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > I think instead of this we should simply make it so that the driver
> > > never tries to make the chip writable.
> >
> > I think this is a good idea, but I wasn't sure if it was an acceptable
> > behaviour change. Should the driver still try to set BCR_WPD when
> > writing an image (i.e. defer the setting of write enable until later),
> > or just not set the BCR register at all? I think your last comment was
> > the latter, but wanted to check.
>
> I would say not set it at all. I think it was (my) mistake to set it in
> the first place.

Do you want me to remove the module parameter from intel-spi too and
do the same?



-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
