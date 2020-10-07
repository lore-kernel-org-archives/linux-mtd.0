Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC33C4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:04:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9544B206F7
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tk1cepct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJLKmtpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9544B206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zb2DKbV8U3pcdD2k269UigObN2lNJ8a24u8IE1BkvXI=; b=Tk1cepctn4WXsGaaTvsSXvaG6
	lXSBAu3B+yAdYbTk+0HO+0mU1dupuQmAQApJ57A4e0QVFW7VkrEP47mOnpfpdtoKVbg4F1s+C0g4C
	mRTwpAIUuH+o271t3bdUQGWqhD1/309BAkTB73GhOhfSNGalZ5E1VhWvTSir850d3F6aYRZkvCvMi
	JpJJz/6fAL1JcV2tnbrNiFpVuWIiS8dNqFhW7hAo3vXeZ/5uboKZ/IHKBywVx5oEgBIVvw4f/r0xd
	E9WMoQ0ayXuV8mfbQ9pWYMQE89yceNdr0lD3mwSl17wTLhlHng8JV4vmxoxDl5xHhq5CGpREdccTM
	IHPTo/N2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPxrW-00053I-5L; Wed, 07 Oct 2020 01:03:22 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPxrS-00051n-RW; Wed, 07 Oct 2020 01:03:19 +0000
Received: by mail-pl1-x642.google.com with SMTP id c6so141750plr.9;
 Tue, 06 Oct 2020 18:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
 b=rJLKmtpwxzsaHKtX12nq3eP9neu2dOXEPi6LomqB2knE6KHEDjpS2vUrKJtGSZmd01
 7ezWLLISEJuqEQ8aBgOjVvVwuIROWJaVvqWMDhdkIrMnEJj3xWoT+mLh9Gs8gEuP17Q2
 UgfknJPVfYtwgcFCoBnLf1OmUFSxA0fdjd+qay5y6bkYLt8ainoMJawHK24rtd7lPeI2
 jVsq0CkG7qufIYkkx+FdQj1K8q292mstggL5gEg1P6qasdKVPWKLR/DK34HZkI0mADY7
 HUlcFEZ59O0+agAIIrpY+D6Sh+41M2ydy4oYO2vKHgH/8RKm2d5YK6721Lon3s9UNXTV
 sAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FbVt6UIsanorUvecNc8pgO4I7nA5/YzrR4KBsZs3/tw=;
 b=hENsV5yOwW3gpt2TzNEf9FlOjwhU1Vn6HbxGGt/tzGG5d8awMZBkvt2iYNPSrY6zOL
 JMi/HXwx5MphC3hQ74BXVArM6ZqkCudftF7CRmbExeCIjHd64ApcVmS9qEFQeZ0huuhh
 Yy4IYhoRt5U8UN9fD/Q0t/xZ/1jMZtzpABpgRdWZVejxyg/+WuYBdUJkU7jO23CCY5fR
 3/Uo5sThPYRGSD3KgJKOGMCrwzlL9WJZYj3wEwnPDyvH5MGFC36X/UwLkktr6ofV6QrV
 E0pbIRk3RQm1jAq7TG2kwondwSCtbJirpGfkvgcoHXWApA2JQQFlpqioFIAkBbA4S/0j
 JCIQ==
X-Gm-Message-State: AOAM531dKL4f1XymBOwLyuGdiqA7I4wttUqk5OaOanjXJkS6cGi8dnFH
 IUxDtwOu4XKdFhIRZmK8FY4=
X-Google-Smtp-Source: ABdhPJzVLf6DlrNk5/q9fRno4e12My/InOM1G44QmO8+GKR2G8WgtPD5wnjL1TK4h+y4iW9ZX7bL0Q==
X-Received: by 2002:a17:90b:692:: with SMTP id
 m18mr667588pjz.182.1602032595239; 
 Tue, 06 Oct 2020 18:03:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id fa2sm213768pjb.51.2020.10.06.18.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 18:03:14 -0700 (PDT)
Date: Tue, 6 Oct 2020 18:03:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Message-ID: <20201007010308.GP1009802@dtor-ws>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_210318_919525_E228BD0A 
X-CRM114-Status: GOOD (  18.63  )
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
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05, 2020 at 01:38:27PM -0500, Rob Herring wrote:
> This doesn't yet do anything in the tools, but make it explicit so we can
> check either 'unevaluatedProperties' or 'additionalProperties' is present
> in schemas.
> 
> 'unevaluatedProperties' is appropriate when including another schema (via
> '$ref') and all possible properties and/or child nodes are not
> explicitly listed in the schema with the '$ref'.
> 
> This is in preparation to add a meta-schema to check for missing
> 'unevaluatedProperties' or 'additionalProperties'. This has been a
> constant source of review issues.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
