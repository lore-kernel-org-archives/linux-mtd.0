Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A535C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 14:52:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51B8207DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 14:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBelvTGu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m3SH83Jh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51B8207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ogK98fhlu79dB389vnJDWNx58vAGOCWKTpUvu6AHCO4=; b=JBelvTGu2rslJY7zUkoMYEmx8
	n3OF0NzxgnAkWKBnk9NKiumd8OwQ/I6isYqJexSLGWxTEfLCSIHIscodTi/0uGZ3TbUOPdNF/GkVk
	mV+8QI/19gKRaF9sGo9JEL/SW4og5VNDJe43M399nv+ZV4RtkLGgduGq0yQMP0Iy1C+yPBxk0Pt2/
	ODvmEwsMixcwxNPeD2GtZQ7g8Xd5f+E6gS59lktymDJJOSCU2BX3SlCCR/K36c09hJjMSPFrSe6Tp
	P0VqcDDGN4ayvJsqsGJxndkgo0tMBCIiyQHeH7aB9PXQ+poUwnr8tMupStMV4BoMzZtuNnz5vZvrb
	YmjsFRrew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBfj7-00064Y-PD; Fri, 28 Aug 2020 14:51:37 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBfj3-00062p-L2
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2020 14:51:34 +0000
Received: by mail-lj1-x242.google.com with SMTP id t6so1603723ljk.9
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2020 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImiWhFwiMiRaDILGK2vYxwtK6H1QbPrDWNEB8Fo5yp0=;
 b=m3SH83JhPp5zysOZ8UGaOASaGvHwyBdy+dMZYhDz9IjeZrOUNDL7DGC2IYkYpae6UT
 FpGAiEisi2hdICi2QBwVlxCRBlQYajQ6kIl3apwv6Zd5zwaMsm+woTJe0VxhXsJCBmVB
 /Krz+up/rlea+pltJEx57NrY0mSwXBmgaoM8eBGVocnnO/EabniaNW7LYGT8om9EynVv
 CIC9WHLTJ4TqH3GGF/DLZDlPvjr7OZ+u5Gmua0OvS7bbxfJ/KVP9l6u2f80iB9oWA4S5
 XcREjqO8mQbwzNglMH6NjTAUpG2SBhzd1ox2KvfQMgaZMf3Rcty3gxm60W7RrjIkgx2T
 DCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImiWhFwiMiRaDILGK2vYxwtK6H1QbPrDWNEB8Fo5yp0=;
 b=U0pqgkgoTCbscjzC8Q4YRQ/QZowUt/HOPXtx82vZSGqeHCkoE1DqLs2BHmfzcr5dPR
 kqRuelj6hSdJubbhASS9gtzPFJPJIgGJziIN7NOD/Ld4qlcEoPPWkQtApe4i2Jwjhkhv
 OZmEr5pBfRCx2cDnUkxdKe1YKs+MWBst/fnuNAjSWlP6RoO9/VajBoW3MT/5vyIMXOuU
 uDZxqNGdW6+0obSdKZOTdR6hM55P6kys2rNJwX1KvHLS/E1PUiBvWSTDUKvdqIl5uNLY
 A8xJSgVsQsUjP5ZheMrhjkOLs8v1/rI7bHyk8YyFmOgr5pcIjrlqxew0msTEXP9ojx/g
 uxJQ==
X-Gm-Message-State: AOAM532ev/9YJxNjUH442bLJM3Dc+WTYQtTvS6B3joxlwLi5MFFAf/sW
 BsXsgIHmD+6DH5DGqTf2kNawjY3U4/5tSB8VF+VhwQ==
X-Google-Smtp-Source: ABdhPJz7nqwPZB2YVbmFth99db1dEuQGwLTN+Hy4/7RmCxHXULzHeBqpJLldBTh4ZZ0VSRoDavwoeUh9uKGkK6yVJPw=
X-Received: by 2002:a2e:9dd0:: with SMTP id x16mr1026817ljj.144.1598626291535; 
 Fri, 28 Aug 2020 07:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200825193536.7332-1-krzk@kernel.org>
 <CACRpkdb4j2kJvpY23G-os9gTktZW5HT287MsvMZxC=ovgn_9LQ@mail.gmail.com>
 <20200828130837.GA14163@kozik-lap>
In-Reply-To: <20200828130837.GA14163@kozik-lap>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 16:51:20 +0200
Message-ID: <CACRpkdaWAzJQz_Z1zsRbyVQNPO2wUogH8U_mDNV2fSkW22zmtQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] dt-bindings / arm64: Cleanup of i.MX 8 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_105133_702261_56EDFCAD 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-pwm@vger.kernel.org, Frank Li <frank.li@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Fugang Duan <fugang.duan@nxp.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 3:08 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Aug 28, 2020 at 02:51:20PM +0200, Linus Walleij wrote:
> > On Tue, Aug 25, 2020 at 9:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > > This is a v3 of cleanup of i.XM 8 bindings and DTSes.
> >
> > If you are going to be working a lot on Freescale SoC code going forward
> > I wouldn't mind if you could add yourself as maintainer for the
> > Freescale pin controller and GPIO at least, I already have high trust
> > in you in general so if the Freescale maintainers also have that I think you
> > should just sign up as maintainer. This makes it easier to do pull requests
> > and things like that.
>
> Thanks for encouragement.  Indeed I am planning to do more work around
> i.MX 8M platforms from NXP/Freescale. However there are already four
> maintainers for Freescale pin controller drivers so I doubt there is
> need for fifth entry :).

I beg to differ. As subsystem maintainer it has happened to me more
than once that the i.MX pin control patches went unreviewed for weeks.
Everyone listed for this driver is a kitchen sink maintainer that get
way too much traffic and things fall over the edge.

> Different question is the GPIO driver which apparently lacks entry in
> Maintainers file.

That's probably just an oversight. Feel free to add it!

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
