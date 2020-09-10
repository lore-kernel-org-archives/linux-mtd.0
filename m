Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D71C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 18:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB9C2080A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 18:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ilCcrmOv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRRR8DCE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB9C2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cym78WZ2rw+ia4iY5Z1bueLTYAQJQcmHN18w9bh7dQI=; b=ilCcrmOvtRQpQ2hrTe5ZTnM9G
	jx5nEaVCIoBV7sBg1tOGs8Y/f5Ex38Mi00jfg4KCrkmqXrzQstAM+PvTRR3JHBv4nfsL8FPpPhsZh
	ebbtBvpa6g4kzrMH+eG/805M+CSuwkLzhFXl654Cd94H/zU1EECtSF2uasr8ITaQDwfoNqVAV3yiz
	DDDzukDy/3t3qutHbVuyQKsIKgDoVyr1hwNJyOq1ru/bVP7NukeDD56NLzejzVAv0oDV+o4aVyaEr
	nKjblwbQ21zuG992iQgmoK2p0iRNO800OE9Mdn0hDRCePW8f0ofXCEnpHZpUc51dGUxI6nSTG89SA
	FQLSVHO3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGRP1-0004pH-1t; Thu, 10 Sep 2020 18:34:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGROw-0004oI-FN; Thu, 10 Sep 2020 18:34:31 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46FA72080A;
 Thu, 10 Sep 2020 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599762869;
 bh=SRgE3e+cWOee6V2K0Aw2EKLPOh+GtgrkQeeqC/WhKkI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iRRR8DCEphKxCESUIOWKSYOGUMgScZXbeOeEcg0yOyRFJbnqmaYlOsiksuwiLjobQ
 M4uyBus+mshUVHZZ3JgPrAGSIFrgxOqZoEzzZ37YKf8U3tBk8av9U+Y8144ibkRREk
 PXnrMHTG6GY6MWdGQ00DeKQVPH9cYf3H7WrJDCZw=
Received: by mail-ej1-f54.google.com with SMTP id p9so10200380ejf.6;
 Thu, 10 Sep 2020 11:34:29 -0700 (PDT)
X-Gm-Message-State: AOAM531suYC+eozCvj3Sge3AqHnU5m7eZ/mJiTPDNeM4jhIMMrzyKfZa
 fmOKFAOZqKuCgWM03XQe+bccHCjqosKW5UrRcFw=
X-Google-Smtp-Source: ABdhPJyqKY0eU5W2IUZveRSdHihYXkn66844ltcGWOZGAN2rPhOWdGk7NLfovjoBdKlH8jBLp9/fUyrxxJec5WeF4cE=
X-Received: by 2002:a17:906:af53:: with SMTP id
 ly19mr9924685ejb.503.1599762867837; 
 Thu, 10 Sep 2020 11:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-13-krzk@kernel.org>
 <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
 <20200907060958.GA4525@kozik-lap>
 <CAL_JsqJZ=PxDxH-=GUUg7WadZrAKjYbtE0sQ8h9YDGOGx6Ykwg@mail.gmail.com>
In-Reply-To: <CAL_JsqJZ=PxDxH-=GUUg7WadZrAKjYbtE0sQ8h9YDGOGx6Ykwg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 10 Sep 2020 20:34:15 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdVDGhdD5hMuXBDBa6XiaYRAK86E2G1gpGZSqnMLiY+Lg@mail.gmail.com>
Message-ID: <CAJKOXPdVDGhdD5hMuXBDBa6XiaYRAK86E2G1gpGZSqnMLiY+Lg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_143430_655531_6049879D 
X-CRM114-Status: GOOD (  20.58  )
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 8 Sep 2020 at 18:51, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Sep 7, 2020 at 12:10 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Fri, Sep 04, 2020 at 04:36:39PM -0600, Rob Herring wrote:
> > > On Fri, Sep 4, 2020 at 9:25 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > Driver requires different amount of clocks for different SoCs.  Describe
> > > > these requirements properly to fix dtbs_check warnings like:
> > > >
> > > >     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > ---
> > > >
> > > > Changes since v1:
> > > > 1. Do not require order of clocks (use pattern).
> > >
> > > To the extent that you can, you should fix the order in dts files
> > > first. If we just adjust the schemas to match the dts files, then
> > > what's the point?
> >
> > The DTSes do not have mixed order of clocks between each other, as fair
> > as I remember. It was fix after Sasha Hauer comment that order is not
> > necessarily good.
> >
> > We have the clock-names property, why enforcing the order?
>
> Because DT/OpenFirmware has always had a defined order for property
> values. '*-names' is just extra information.

Thanks for the explanation. There are few nonobvious requirements
about writing schema which seems many (including me) miss. It might be
a good topic for some conference. Too bad ELCE CFP ended some time
ago. :)

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
