Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2297C352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 08:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781F0206B9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 08:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXrUN8wE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0/ss7Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781F0206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpuYAcGZfAcjmYMKvrDkcycq/5xnUxuXoqudDhD/5/M=; b=DXrUN8wEHn2SMS
	D5115VxmDb/xpDnDplnW2Q+V8SL+77/Zod1bnGvq2jxVPJdD5CHBrZPTQncqzMuHFME/VL7Ul9iX6
	CPH8Y5/1+U/PmUy+F0MMYzTWe0FxPho0gSLIcUpobZ3qtLV9a82bNF5nmJbnpTv4GvBd8m8yyaV9v
	wDtTeoOaRIk6cu+oFdrvhUqFr3+msMwjHWAaQE2cT3HLINy29g3cpg3rCYJKcTwYGX9405VraT5BX
	sBI96NpIXiUYr2yCXERtvIFyxMz74ISphHQcDcBAdVw+h1zj05QLGMORogp6S/1ydGhzFFvHa/Twd
	KBDPsscEfigINFd5ei1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOzVg-00063v-Fq; Thu, 16 Apr 2020 08:04:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOzVb-00061P-6c
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 08:04:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id u15so6812305ljd.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=X0/ss7BsABjV0v58eUDRQHcZuoc6jZGR8QlxXHm4iMm2jIobcqWr46sIwdS9XtZxjv
 J6lyowndGnsjJ2T09ZLAXy4vuLLuNuWfByvI3ZL89WC2FPNAxvWKs0UVVQzT5Ee2llor
 wzSBTCJVOBt2+9Ohb9KBSlvOhscZ+OiUHUnMWxgzt6ZDO9PVTPdpvuxMydg2t99gu6wZ
 oj37Ec/BUycHap9z0+LYieFHR2fzSSCOI+l9sq7xxfebteYGbDW3WPgbMFAteqOk2bKf
 K6q0mR7VNoF30yy9UA6z33ozE8ZHcOBMgzyIRBgLhkAceDqUT6mHxhpEYBOQpImmHhPe
 fohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=gUCvhOwVj/3NXaYNy/c6vi1I5q8/RWAGMhfHBXKD8BmokVm9zU615X5SkBepf3fVlT
 3jv6nrp272d6q+TGQTF877u/pzyCuxzFThjIVubg7JdrdTVGc9tQ9q96b5r4lybJS0ca
 LZmKv8InApIUKMC1Bpz7xdeDU6Ax8DAAKE8h63flq+bvN/X6MwFfufazo1J3YtyqhW97
 M2A5grr2M7lwxmq5HjW72c7PL3XdU8MGW3o71ptJeayKQ71vCxNCvnnb+I6b5iB+fluy
 77RKFeqLD9ihAZjl9Uh3owk2ZQHj9ceN7wLsptNEZ/uTo6Bh7uKNJWBb3Zh55gp+OMOz
 BUWw==
X-Gm-Message-State: AGi0PuY+/oB4X4hyBSn+Uqr4k2hNCD2dHtIO2d1trlEOpMDe3fyldxsO
 zZauoUQ29qdfnlPTUS6V3LoN7OltjN5V+RbrmoQoqA==
X-Google-Smtp-Source: APiQypJa0ViiE/ZtKOxobDklTprFmqZh7Nrc1Zappo4GrzOsZZrJysLNIrOKRtQLmBogZMZaiR9WSbvdJtt5f/9aPuw=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr5793355ljj.39.1587024265660; 
 Thu, 16 Apr 2020 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 10:04:14 +0200
Message-ID: <CACRpkdYDrytCL3ZX9YeW39t2mb4M8KbCfCFm0Ba67oPpshckLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_010427_260406_58EDEE8D 
X-CRM114-Status: GOOD (  13.36  )
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
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
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

On Thu, Apr 16, 2020 at 2:55 AM Rob Herring <robh@kernel.org> wrote:

> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
