Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B584BC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 23:06:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8162B20675
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 23:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t8i8vZLS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXDZRt76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8162B20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zU00xoTwotKFgwkoagebitc4wmMVTzYYUQW28RhuLRA=; b=t8i8vZLSMTkl1fhzObHFQLOsb
	YwNdRazI/KignBbnf92sH3on0Po5qn/qDBwjnZSP12gm3FssEMOVRaWepcHFFIcnNk0z11apnz6hx
	EEyF63JjJg8YiSJ/sNs5i2waWvvxfN8ymGH7QMumZb8z6qtnLBmMHXmNLWFJDtY4/Xvm3raLKgMiw
	jmySH/JsIb1LcpHwqv0EtdZc4W3chM+aKZ3i/44e5MnEmu+rmon5nBx3BfqXgJc6prKwxkmMHudOC
	hz1BZbbPbVHKtQ2yc69BF3ljR5e7qQIdr0BARJ7UO0EzFTiFdtVpQ6aLXYurtYQsW4p1BBxtWfLve
	rYm7thUlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5zoE-00040J-7F; Wed, 12 Aug 2020 23:05:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5zo9-0003zQ-UC; Wed, 12 Aug 2020 23:05:23 +0000
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F65522BF5;
 Wed, 12 Aug 2020 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597273520;
 bh=6kwxpshrOlbOHxWnmXC6+dWtt2L5X/Drj58h8rpdMCA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pXDZRt76CPWxVlpilBeAf66pO/Ch1+UOaSOgdUpIGMcw2xAS2mFHBEgkKJVucyrd/
 hFrdQmO7EEU0DOv8a5XHHMAntvFEpH8ijK+mCysryubzOS2R2XGypW54K9swm6SsIs
 b7zU39V5JMU64Uhe2oipgDLWWHGgSe5VXnIpigps=
Received: by mail-oi1-f180.google.com with SMTP id j7so3365176oij.9;
 Wed, 12 Aug 2020 16:05:20 -0700 (PDT)
X-Gm-Message-State: AOAM531XDPkzBelDKo8guL8BP+1wZnHRjEzSSCTwwmlkRVitKuhBAwmF
 YUCU4IWwnj2kYLfCaoLMrzBdI6NuelguMRmYYw==
X-Google-Smtp-Source: ABdhPJx2qQebZiNBPQzgE1fpdypeYG9ycnPVX3JxYluiX5nbkNkxeZlpxpCsMAonDMWnL7JIOVI286FePABwvHucHl8=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr1235268oif.106.1597273520003; 
 Wed, 12 Aug 2020 16:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
 <f5dedf2d8d8057de3eaa2f9126f44cebb0653b09.camel@perches.com>
In-Reply-To: <f5dedf2d8d8057de3eaa2f9126f44cebb0653b09.camel@perches.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Aug 2020 17:05:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKBzqMHMMRwBJUjomxOpZAop_+TXBjLCb6ntwZzNMy=3Q@mail.gmail.com>
Message-ID: <CAL_JsqKBzqMHMMRwBJUjomxOpZAop_+TXBjLCb6ntwZzNMy=3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_190522_476188_EC3E9E66 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 4:32 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-08-12 at 14:36 -0600, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
>                                      ^
> > keyword.

keyword is the key part...

> []
> > diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > index 192ded470e32..f0daf990e077 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> > @@ -67,9 +67,9 @@ patternProperties:
> >        compatible:
> >          items:
> >            - enum:
> > -            - arm,integrator-ap-syscon
> > -            - arm,integrator-cp-syscon
> > -            - arm,integrator-sp-syscon
> > +              - arm,integrator-ap-syscon
> > +              - arm,integrator-cp-syscon
> > +              - arm,integrator-sp-syscon
>
> Confused a bit here.
>           - enum:
>         10 spaces to dash
> old line:
>             - arm,integrator-ap-syscon
>         12 spaces to dash
> new line:
>               - arm,integrator-ap-syscon
>         14 spaces to dash
>
> Is it supposed to be 2 spaces more than the preceding line
> or 4 more?

If the preceding line is a list entry (i.e. starts with '-'), then
it's 4 more spaces. It's always 2 more spaces than the preceding
keyword start (aka json-schema vocabulary).

Arguably, this style is a bit inconsistent in that the '-' counts
toward as indentation of the current line, but not the preceding line.
However, I think this style is a bit less error prone and easier to
review. With the other style (always N more spaces) it's harder to
distinguish lists vs. dicts. For example, you can have something like
this:

- key:
  - foo
  - bar

- key:
    foo
    bar

- key:
  - foo
    bar

All 3 of these could be valid. Which one was intended? (Can't really
tell here, but you can with actual DT schema.)

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
