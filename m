Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52579C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Oct 2022 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaqOeKb+Dqr4M6J+SOUHma0UAYiSY4x8OfPDMrpOtuY=; b=YerEAOb1r2bNST
	45oUlVtz1OYjd42dsydta7mj4gO9ZTNp5tyCZyceoAutckgpLffZWJPBN48ut8LGh2T+zcQ4MzfTK
	2tvrpoMNpdHt2GqxBvIeWKG4ZWSfg7pny6gFCBkUv1WA8JSzY6a3OR/iPhrRFS7f0S+0s3g/nbd9e
	hUhMUQdTIdoUjRXQywtrly8oJc6W5PN079LMv6bR2zVorQqtObULQd94BwmXBO1t9rUqTqES8vxWs
	2IP3G4SpdtCX64FrZUbz6UGpN/o4iwySqh8/aRIVYz6dbWiKi+fvfCEwj6V1X/Kl04E4dhnaLmmz1
	zhXWGYA0y09sLDYQqrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omF5G-00CpzQ-3O; Sat, 22 Oct 2022 14:02:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omF5D-00Cpxc-Qa
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2022 14:02:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b12so15741127edd.6
        for <linux-mtd@lists.infradead.org>; Sat, 22 Oct 2022 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LNVXeM54MuUTzkxW4S+h/avYMDRiH1JNQoeYcnCHBhM=;
        b=GjMO9bieaHDBelf7XPvp7Mm6+ECuPSqx2R6/8PrakF0zbhlcSTaFXUaHjvuZ2PA8oC
         6WcjMZS86zeqIwyvNpGwuo6uT7FBWc0z/XIKRCqsdCIqfvsYU5jrdGwZO3AN/Ut8O2PU
         dVwNs+ZCerEYbOg45w7UYYLixBM2CbHkBDvT80VOQZCglZoEQDqqFHhmGHexg7wLDjKH
         dwidHE+9u/Qqc/ZjBKywjSP+b7eto8KN5KoUI5cL/eSVRiUi9+a4YNFvdbLp0UHLJ6sl
         gO3VAnOCQ8U/s+ZJg38eYK/md92XTywwgTsnnIKU+jdNd8yLoqJqnpyW7AhFA1JN3Ctq
         CMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNVXeM54MuUTzkxW4S+h/avYMDRiH1JNQoeYcnCHBhM=;
        b=m7F/4HtuRznZW6A1u7roH5p5h8LWDQIv9U0VzEGznX8a0S8+2YsoZe5UdLRw5FMjhK
         jImM/UjDz5jSPBe6oLhZlMAli4Um3vQ2K5guS73f5kNEoGmhGaMPTCe0OO79m4am9O3K
         XE9a/1InZIs4Hgm88NIyDLtMNneJVXAA2d7H6H0Zb/RdH3jA2iklJ0xePD/y7SK8ZITQ
         PnS0eJwydMfoCjUXmp1rpflVquJ3JwnZd4rgnNo3fV6KYU5mPaqcN74HqAed3zXvNrt4
         1dKgd8khEaKJgyToN3zYn5eO+bA5gbnNR5RgUzd5yRzv2g8IX4z9XFeoI32xcwCKoyp0
         M8jw==
X-Gm-Message-State: ACrzQf0F/9LEueqy3VgUa4ks0vvSEECfwYwLl+u+Uz3pRxhR6rmQxwOW
	WuPdy1tPYybGv4GOoi13djPfors1MfgATyIEfETN0A==
X-Google-Smtp-Source: AMsMyM7E0Zchl09puiKKoBotMVhULOKYzE0S/e35EOJ4h3CGvH2Wc0rTF+zAD6m+BsOpLEKYent2ulN8cXV4ms8GFBg=
X-Received: by 2002:a05:6402:1d55:b0:45f:c87f:c753 with SMTP id
 dz21-20020a0564021d5500b0045fc87fc753mr14243568edb.32.1666447356997; Sat, 22
 Oct 2022 07:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221021202254.4142411-1-arnd@kernel.org> <20221021203329.4143397-2-arnd@kernel.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Oct 2022 16:02:25 +0200
Message-ID: <CACRpkdacViTuL_gmhWULNm7HCHQeGBXwkonDxQjubSM0=v8vgw@mail.gmail.com>
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_070239_907533_409141AC 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, Oct 21, 2022 at 10:37 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
