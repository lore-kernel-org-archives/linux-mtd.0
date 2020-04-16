Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08119C2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C434521744
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dB+xzhW1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJtBap6g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C434521744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsWOjD6KVz5BzNsL8RFgyxufYn66s1/ZSYx0PugDQdA=; b=dB+xzhW185E6dV
	FygXotsUADZI83uu1hSFkTs1SIXq/1xi4cM1lwnXS+7S5eyGIT6qcbZmctOwbU3C1nU4empWPMqFC
	ko1qxLP/uusYswhNQAbI0WwOHz3C8Yvp65s4eozHdZtIJnReHc5dnr/v/HLEEB/rIhzVe9SK3FQed
	zv3pGbX93lowgFJcwMsgGEyg5kSxpku8YUSFcqgiJgc0jmTnRsElubTWj2ukcguW/hWYtIrbGwGea
	oHV3dzcEhBwdIwO46AvW6JxrPYpfPiVFcdlLY0Op+wmEp/nRZIR1BYTdieIPujXDpmVLEkrrVrub+
	ODaH24AYmZG4quYYO2iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP4zV-0003x7-Vz; Thu, 16 Apr 2020 13:55:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP4zP-0003oy-5Y; Thu, 16 Apr 2020 13:55:36 +0000
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 154502223D;
 Thu, 16 Apr 2020 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587045334;
 bh=lAG6zzq1Sqen9mJhj5pG0jXwK1qfgmptfKCYtqRavfc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OJtBap6gxkn7B64p6YI3gTyfG+37GXhLma2wex7puLnTvEPVIckcw2EWyHIlGxpbU
 axCPq/uLuHBCHTtrTyk9e9F01ZRfk1h5UwSfOVyg7KnEYG4Mh0g9CUMFFZUUhlg6Dn
 cKIhtKmwFJOdPx1PSLWhEzhafdvl/OQ5lWzBbqUw=
Received: by mail-qv1-f47.google.com with SMTP id v38so2014045qvf.6;
 Thu, 16 Apr 2020 06:55:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuYFwvssOWpHc8m6aID+tOwNfBf9HGPkSKSBbHrXzdixY4ZGxfV8
 m+4yPY3FQFdOV4f/p1Dp095G4Y1QL9yuAm0i9Q==
X-Google-Smtp-Source: APiQypJP5/uECHnZPqCD8aDFNOvB3C1OTKaRvvNdGUWUD6LvJ9HnhAL59x+YqONzfmAtrwzd6yqnrOF4qnSJIJfw8nM=
X-Received: by 2002:a05:6214:a8a:: with SMTP id
 ev10mr9484527qvb.20.1587045333124; 
 Thu, 16 Apr 2020 06:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
 <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
In-Reply-To: <d93f90bbcc99967ed5ba458ba99d7e73de12e3b2.camel@perches.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Apr 2020 08:55:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Message-ID: <CAL_JsqLcJrFow_+-o2CxoPRCv4U-ELb2FHSbUgG=Mzt8PFn_CA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_065535_289106_9B456E80 
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 1:52 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-04-15 at 19:55 -0500, Rob Herring wrote:
> > json-schema versions draft7 and earlier have a weird behavior in that
> > any keywords combined with a '$ref' are ignored (silently). The correct
> > form was to put a '$ref' under an 'allOf'. This behavior is now changed
> > in the 2019-09 json-schema spec and '$ref' can be mixed with other
> > keywords. The json-schema library doesn't yet support this, but the
> > tooling now does a fixup for this and either way works.
> >
> > This has been a constant source of review comments, so let's change this
> > treewide so everyone copies the simpler syntax.
>
> This is a large change.
>
> Was this done manually or by some script?

Scripted with python ruamel yaml, but then I had to filter out all the
re-formatting (hence the first patch to cut down some of that).

> If it was done manually, how likely is it there are defects
> in the conversion?

Either way, the schemas still have to pass the meta-schema checks.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
