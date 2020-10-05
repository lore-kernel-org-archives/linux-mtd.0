Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8724AC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2DD21527
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ePmRfV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B2DD21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tuqf3BS6Q4KkkJOEI5E4K3wYwqLdK2T/iO9ckGCcX7M=; b=3ePmRfV/mg2KKMWrb+82oiWMM
	GdBrXZCJhpDPUs55RAdDgR557nPrIVAa48TYr99heobSOkGnZteolCKQrM1rA7kKhIE7MLXXW/pNR
	GL79CvfRwb72hFX3EuI7Hl3tExC99gizN7IqYlzOm1uRZvvzj+415AEX0yjqP/SHpYoeO8jQ6zFjA
	ymiU0x5XvZYuqW8x6BhdcVth78DzPls1bVxLGIXDHMOGZ/mLP8M9Td+pY/4qX8Imc1A7FEwmBtHKw
	tthuEhnTy6xjmqYVssjWZcUpeJ71MGDb4QOhWTS6pd8QipJK6z0AsfaqRlzle/TmiOUo2N1JRizgS
	WWkExUrXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXAU-0005pG-7b; Mon, 05 Oct 2020 20:33:10 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXAR-0005oR-LD; Mon, 05 Oct 2020 20:33:08 +0000
Received: by mail-wr1-f66.google.com with SMTP id h7so7423365wre.4;
 Mon, 05 Oct 2020 13:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ARrZ6TB7yXMqpP/+XXhswWetXRSqYRU5CXxzWSIwqA0=;
 b=Q++v3IZQXtJdc9fNtpcYeujb9yeQGc5GIk9yVO0un8Hf5iJtXYVlK4nsdRAQowB28e
 B1InEBgOwjwU36NCpYonhmTb8a1TnAnmay93JOgNfn2532cuGvVr+kqUuqTv07pe+hWN
 CGSRbRbPJCcYzYb1XqkGCkZkN3U90ljB1MqCRzMAmR04lQgIOu8ukp4Iy97ADS02LyCm
 GEHnK/iD0n0WAfF9ppPKfX8EfkoW7rRL4QEJcZEyPg+YxWkap7wm4gcCLgEIRMhhZFAW
 Ea21qox/llTNxcuiDbuAOmspkN8N3fWUtFnUqTUZ/dBRzrjt01rNE8U/NgDzFKBC0LwI
 Rsiw==
X-Gm-Message-State: AOAM5338HNTRh/qoHBS1phCjjMU/enD68/9NjBvbNaRJPllrAO0TnMcf
 +HSSDDoCGMSj4HLOhRj9iOk=
X-Google-Smtp-Source: ABdhPJweyRYGmXLqO/tcc/k2HRzuAg/v1oLgLOtbvTUusAAWSCQYB/uOgoLBn7Xz9zdrfu5geKiRqw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr1245871wrq.254.1601929986334; 
 Mon, 05 Oct 2020 13:33:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id c14sm1265048wrm.64.2020.10.05.13.33.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Oct 2020 13:33:05 -0700 (PDT)
Date: Mon, 5 Oct 2020 22:33:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201005203300.GB23742@kozik-lap>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163307_694303_E272544E 
X-CRM114-Status: GOOD (  15.87  )
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
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-mips@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05, 2020 at 01:38:28PM -0500, Rob Herring wrote:
> In cases where we don't reference another schema, 'additionalProperties'
> can be used instead. This is preferred for now as 'unevaluatedProperties'
> support isn't implemented yet.
> 
> In a few cases, this means adding some missing property definitions of
> which most are for SPI bus properties. 'unevaluatedProperties' is not going
> to work for the SPI bus properties anyways as they are evaluated from the
> parent node, not the SPI child node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
