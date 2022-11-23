Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C129BC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8ub4zQXKUtxOLna2QjrAAdSEtgDzeOZrAh9xjPLHJo=; b=WLyMRmLABeHz7L
	2CqyPgz0UcEubEyOodVeBHkGvN0pDrWCBvd7jurpyJCaIYB0OYB0JszrCLyleGsTnDJMbtKSuOPY+
	mBbuqY8nWi4Ii3V0sEIXsFmSu995SexXRGqi4jX2mSG7H40KyH/mksrI7QBV8FrgKkwha3ZeP+Zqs
	RB8gDAcKAw1MZCY5sfWQ4Prf9bYisPBGcGqzDZ2rGAN5jqbQVWPJtWMDn3W18SAhXGowR/EztgZKj
	3PdiygbIWQz9Mcy8NX1WPXwChi62ShQaat/7PlS9s6XyDWzk+3Uxy6jatlENxVMmfuYO/Ixl98izl
	fvKzxbo8bhyPgBixRwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeg4-00Cg4B-Gt; Wed, 23 Nov 2022 01:35:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxefp-00Cfw0-JO; Wed, 23 Nov 2022 01:35:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so536044pjl.3;
        Tue, 22 Nov 2022 17:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aMXbvTa4szYt2+pP730kENx9BC6mONDNIAJzOhCO5eY=;
        b=HP7scXWGWUuUAQpBHAbYGT9Ro4FSzBvlteLDZXmRtKIZTW83yQz3QCmZa2e1V2+0x2
         Pw8YRUKvoQ4DiaSm/YAu6wmnyNScBLJZbD3KIrABeA6kImnOgusYWOUmR/kcS0XT8B9P
         1cL+hQNaxyuve1DQLJxDEdiV3tM0KQavM9pnRQl5dkjJUDRmOiJmgk/Snwqtq9fbneJ6
         501XaE1hYWbuRd4jlIvX1PvZl9pGuG5KgjbXC0nzOtGgAQfzAquf1FCtOSuDF4D8vTiR
         HsFLOv794pyzG5OBIwR2N/Q8Yj34VkSutSr3XEu/KkJ6LoDgNdzwSB8kRI/bCqRFYG1b
         9wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMXbvTa4szYt2+pP730kENx9BC6mONDNIAJzOhCO5eY=;
        b=vZ5tMVr4tg7D2bB68Nk1emM7i2ul2CoToh8L3hoIn9SMvoxftNR8UGxbQq/aHGcqMb
         w60KN/Xp32DNdvdEh/cXTdZT5AyDN8p5cBCSy9wuPp4ajuvlKlB8VhwrOcKKAmjd12oS
         ct4dvFbkWN2WlEAlY8CLq98vVbGUYm+uPQV5rk3/CjFXgGwaBqy/jT1KxgYPOxBhV61y
         XO4+OerO4yR/VkA3fOnJ+vPXpKujtdEU1nCnn8PhXlUNx5JIthDTwZI6L6s4DzCKIAQD
         UptHh5pox9edizTV6J0jts3b3NG/FEkRdi4R3k3C0gzQ9QrW0ej1kSemIS8/xRpuSAZi
         2Yaw==
X-Gm-Message-State: ANoB5pk06Tvoa/g8wIw60yzVLUq77tK11/BUwVI787eOKxOqrI293xei
	eCL6FLXJGWKhJfdQq709ONM=
X-Google-Smtp-Source: AA0mqf6x4fc4IKvIExC1o1e46QIsOPFQfVNfDh9OQF6vDoU8m9LQB2uyX84qmPAg+ZnqxdiG9ViVXg==
X-Received: by 2002:a17:902:f391:b0:186:ac81:2aa9 with SMTP id f17-20020a170902f39100b00186ac812aa9mr6832869ple.95.1669167334579;
        Tue, 22 Nov 2022 17:35:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:af8d:6047:29d5:446c])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090abf8700b00218e5959bfbsm52591pjs.20.2022.11.22.17.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 17:35:33 -0800 (PST)
Date: Tue, 22 Nov 2022 17:35:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: drop redundant part of title (end,
 part three)
Message-ID: <Y3144aAtCaejFDAC@google.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_173537_661450_8D640EF7 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 21, 2022 at 12:06:12PM +0100, Krzysztof Kozlowski wrote:
>  .../bindings/input/touchscreen/cypress,cy8ctma140.yaml          | 2 +-
>  .../bindings/input/touchscreen/cypress,cy8ctma340.yaml          | 2 +-
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml       | 2 +-
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 +-
>  .../devicetree/bindings/input/touchscreen/himax,hx83112b.yaml   | 2 +-
>  .../devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml     | 2 +-
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml  | 2 +-
>  .../devicetree/bindings/input/touchscreen/melfas,mms114.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/mstar,msg2638.yaml    | 2 +-
>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 +-
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml      | 2 +-
>  .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml    | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
