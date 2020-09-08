Return-Path: <SRS0=nfXs=CR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84593C43461
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2020 16:52:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1257B2075A
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2020 16:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6alINAR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgS6w9TK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1257B2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hnCdLE/8F5eu58S7rMIikzO1MP5n5RT1koaIeAAKxwg=; b=V6alINARdibPVVxJBAWlm62zv
	elZ/RQPN6pOanCk9Kj9tr3pNVEV0q9uuy6LmJeZx/NSJFAgtqrq2eypKqqymTYM0FZrtANEshfB0m
	TaEcKc1SHoxXMaypwbT/BxrNwJAfBcwlhDf3SHo5Sgt8WBHENFtyUlPYY5xbjedX4BEGtUKkg/n7v
	08jlCfdA4KKpRJvZzqU8+gksv1XA0cOVu6vz7j/DdjnFcZQe5MaBGrmaGvJ4k+cQBUVEhANckaMZY
	U9gDX9efO0+zTwMQOfW18oKszLmw5rhfPm3jET6ZRHcTpFFtmIr6bLtQibWfmdvgGJT6N3NgMzX9s
	nU+N9MkqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFgpu-0008E8-W3; Tue, 08 Sep 2020 16:51:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgpq-0008Cz-Qg; Tue, 08 Sep 2020 16:51:11 +0000
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC10121741;
 Tue,  8 Sep 2020 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599583868;
 bh=pW1S8wYQ7shAS4VTkFPTvct/ClWzUHOw3xWhbsYQUNo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FgS6w9TKkNIumIokoiwznLHegSZ8da9H6/tyCUONyA8D6mS4MC5L9U2z22U5vpbaJ
 F9LBw9H3U/ZQfNzWt6ceq2QpbMCME12qMJBPAnufXbEXaMdXUN5OQTdjSiBIy0r3bk
 7U2jnKRg1UiTm9IReOgbeVZRQG6XO2kMrq5x8Ajs=
Received: by mail-oo1-f46.google.com with SMTP id h9so4076858ooo.10;
 Tue, 08 Sep 2020 09:51:08 -0700 (PDT)
X-Gm-Message-State: AOAM533IGNO1/1syUhYS2kYUely0tHOw+eC4OJt0VpwjOoRSJrHPwot/
 oi1lALcG/24c+yHpUbrZTxgOmtXayd3+6fHk1A==
X-Google-Smtp-Source: ABdhPJyVFdSAOgZ7160kEJoAezjYnztio3h9Ino2moi2r5NNuCCiGtHqBpSUtvivi5rsYhCBevOSckk/m/8RpCmF5Go=
X-Received: by 2002:a4a:d306:: with SMTP id g6mr19090952oos.25.1599583867914; 
 Tue, 08 Sep 2020 09:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-13-krzk@kernel.org>
 <CAL_Jsq+tGQhkqtQszOx7nvr1PR=YFz2p1=OnWQ8JxmSg4qNkHA@mail.gmail.com>
 <20200907060958.GA4525@kozik-lap>
In-Reply-To: <20200907060958.GA4525@kozik-lap>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Sep 2020 10:50:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZ=PxDxH-=GUUg7WadZrAKjYbtE0sQ8h9YDGOGx6Ykwg@mail.gmail.com>
Message-ID: <CAL_JsqJZ=PxDxH-=GUUg7WadZrAKjYbtE0sQ8h9YDGOGx6Ykwg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] dt-bindings: mtd: gpmi-nand: Fix matching of
 clocks on different SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_125110_937793_5B82F40C 
X-CRM114-Status: GOOD (  18.90  )
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

On Mon, Sep 7, 2020 at 12:10 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Sep 04, 2020 at 04:36:39PM -0600, Rob Herring wrote:
> > On Fri, Sep 4, 2020 at 9:25 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Driver requires different amount of clocks for different SoCs.  Describe
> > > these requirements properly to fix dtbs_check warnings like:
> > >
> > >     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Do not require order of clocks (use pattern).
> >
> > To the extent that you can, you should fix the order in dts files
> > first. If we just adjust the schemas to match the dts files, then
> > what's the point?
>
> The DTSes do not have mixed order of clocks between each other, as fair
> as I remember. It was fix after Sasha Hauer comment that order is not
> necessarily good.
>
> We have the clock-names property, why enforcing the order?

Because DT/OpenFirmware has always had a defined order for property
values. '*-names' is just extra information.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
