Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4336EC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OD/9NGZDCMx6Hbc7Fs6CKSFbLZLwOElmFvFMs/RUaQ=; b=zscjwRZgynRT/7
	hb0ctdns/rLSdidgaB0tYpI1IXcd4QiNt0CSkFul0f3rLbj3zXsEpKd24tFID6f89ISIG1fVXVa5w
	k7H3n4vnViFXGINxURdgkMrFl+gHWttAmdJsRTDI4P9Cxam69SN+s3ux5l1Hoc0kssLAWLm3MZyTA
	T65du5YaWC7Jw7fUIYmlUzjlQmOojy7mYVRZLHw4ieAnrGSgRCIAw5PGCBxnxjrzDME0gO94oau8b
	6BG+jE8JMxdGbqM5KJLPLNPy0gDvUDzdJSz7/2y9YIml7VO+9vfUkuHr5Rysq+TmaSfcbJR7m74h7
	9BRswUJNcphjgWAqPdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8sYZ-00CN5V-2m;
	Fri, 01 Dec 2023 01:43:03 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8sYX-00CN4T-07
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 01:43:02 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c2066accc5so34795a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 17:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701394980; x=1701999780; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVoKD8XPNHB/gHpSkXN+ifjciAs04Jc+HBherO2VVLU=;
        b=VWLfGEyyaiBWDiY+auWC2cxAu2kmkMKf35exZaoVRuxSJ7Bdqn0p6TlUPtnkJjy+Ze
         Trnu/SSzWUjB7kywZP2DeiW6/498gnfyvZA3+dGUkVTNR8368v+ujCesIZSNj9/F8MIA
         PxufeHvMlziQNSQYcJ1tYWP9OmxrSCNkT9kz9GeYaMSsgsOLUzP4UjqopY+MxshGSMb/
         0zRF7XC9ZCAB+dcPHADYgXmFxN1DpuCys2sjDWcaPKJzq6ecjI7KzfBaVeYgI2jNOAUn
         88ae1lq9Dlnn/3RUrMHuoO5INFeZWkaB1hZEAxvxox6ed/bdZ9sJJayUv2YjakeWFD2k
         LFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701394980; x=1701999780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVoKD8XPNHB/gHpSkXN+ifjciAs04Jc+HBherO2VVLU=;
        b=fEyb/oSRPq+al3I2rAgyWUMR0PTpNnx2nB2AfIvaF6aCRmrQ2v7Rc8R20lPcgAcSWm
         SZe0FIfKgSajLV1Xl9LjvKLpr3VXZ2bUDEU3dWwkglpteh7qgzqEoP2R0MWJGJA1KARB
         0Uq6e5dCyMi/qZmvlNq0UXGRzBya2zEduqWsYmWMJ6Myrh1XOnOaPrA4ubiJJuvW0KaQ
         /1EUIK/z7ApuVgvPz8uz9Nrg3lIRo9mUwZFQWmfHy/LZgvAQkByeFSbW6KFiwc1VnCTr
         8jRDzcRLP/0WuS7krlMZiQlclS/K6SBov1CQLMrT2nU4G7eHgt9khlfAf+lCEAYRFgRR
         d17w==
X-Gm-Message-State: AOJu0YzTJNd3GwcuMIq+S5EkU1tT4Kw2/URQQUHJJWItBHd0SKUfNOUH
	NCJpx+7m5CH+yvQR+10XnkumTGVYBPeMg/ZyfDM=
X-Google-Smtp-Source: AGHT+IEoo8q1AneKB877HYnhIix/B9ieOFCsxgmppBGznC1JwErupmmEjEqa5OVFR44z2F++Yjo/aVQg+DLpJx3hy6M=
X-Received: by 2002:a05:6a20:729c:b0:18c:7b7:8630 with SMTP id
 o28-20020a056a20729c00b0018c07b78630mr23384791pzk.13.1701394979723; Thu, 30
 Nov 2023 17:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com> <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
In-Reply-To: <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 1 Dec 2023 09:42:40 +0800
Message-ID: <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_174301_098836_5216BE07 
X-CRM114-Status: GOOD (  19.47  )
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
> Hi Jaime,
>
> > Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> > configured in Octal DTR mode. It means data format D0 D1 D2 D3
> > would be swapped to D1 D0 D3 D2. So that whether controller
> > support swapping bytes should be checked before enable Octal
> > DTR mode. Add swap byte support on a 16-bit boundary when
> > configured in Octal DTR mode for Macronix xSPI host controller
> > dirver.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/spi/spi-mxic.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > index 60c9f3048ac9..085c9037d6f5 100644
> > --- a/drivers/spi/spi-mxic.c
> > +++ b/drivers/spi/spi-mxic.c
> > @@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops
> > mxic_spi_mem_ops = {
> >
> >  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
> >       .dtr = true,
> > +     .dtr_swab16 = true,
> >       .ecc = true,
> >  };
>
> I'm confused. How can this swap the bytes depending on the flashes
> requirements? I.e. the controller should look at the spi-mem operation
> and either swap the bytes or it should leave them as is.
Byte order in 8D-8D-8D mode could get by parsing BFPT 18th Dword 31th bit.
I think flash driver should notify controller driver and verify whether the
controller driver support byte swap functionality. If flash requires byte swap
in octal DTR mode but the controller driver doesn't support it, then octal DTR
should not be enabled. The controller driver should indicate in the
description of
"spi_controller_mem_caps" whether this feature is supported. The implementation
of this feature should be handled separately by each controller drive
since the design
may vary for each one.

>
> -michael
>

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
