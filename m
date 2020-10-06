Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F74C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 05:43:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285722078A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 05:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RTv2FeqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scAXD8Yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285722078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGv0UT0aAxvQZbLhSOBs/mLr4kUxSBatL+eNNH9shjc=; b=RTv2FeqVizQOed8s0eoKivHL3
	JpaBtX98V1YE0NEAc4939YpponqFc05xKX/kkvoImUsoOEpJ44t0pkEtyk0u5FRFHsm1/Aq5xwJkS
	BANAWINKDpphLzH5i1thdf+EZmH1T5oIiVFgL+dz+lvzlXUbGv3oWHJdkzi26w+l6/eMcR43Telj4
	jg3Js3aspvriULU5GoClk3NbMiMGN5ktqLMcWWocGEVCgJyv+m1LZIidLkH6OyoUTLEyTRKgP1Z2+
	sKfzRRzGD3xEi6C/9AzGOM9eDZjpLExOPSFzJNMegM/5ucVpJmB4dA40FpikO+qie2ZfKK+FSnBZb
	hZHbJhAUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPfkC-0004HN-5e; Tue, 06 Oct 2020 05:42:36 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPfk8-0004Fi-PU
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 05:42:34 +0000
Received: by mail-pj1-x1043.google.com with SMTP id j8so1063703pjy.5
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 22:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
 b=scAXD8YuBk8j/NF0iYDdCeaAVj2lJqU4ekQ7XmxKGRZD9n7rlAL/7uG23DDE1fcZ56
 zF72mU8P6EdMfXizzEbowAVRT7aqB90B0ZPahldWPyAERYWd6msUiWvIw5u5I68GC10s
 2mfO8dqRM6oWZLB0Q6RNjtouVvMzAMtCqHytHKbKwrjH25Far6tK8oMk2FL/+Ytm6yFo
 ix24Oh/3R7FZgjcOmnnbZhO2Rnj4pwkEjTGIWiz4UAhFCmHcKJq5fJPHDGVhMb52+bja
 GRW+sJiWWq/RfS6N9j6fS0MlegpQS8J4O6R0p/6fHQbNSKo6Dg2SOD+ESIa+qx/GxTp7
 QQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FYOEybxQ9Y8nUxVZmzLLg+Qyso2tjlpbGNthFRqblLc=;
 b=Zo0Ha/mFhC//BpoZXce12gIcuFldMrSqEP1vB8jZEjXJV/jZ+gB8+9OJeI6jcUx9bx
 +gDSRCDz4TDJ4Kki9cNj49EQQtfstvz87ODqgvVFpwoj/qdpA054Kwgs4ZPS/jVQ18Hw
 miV6w3Hz+bxYlnkW0k0eOz7WQMMhU1o6QOzcMtdqUNi8wOqsEXOvrZrX5ZZdZMT5//Hm
 RFDep6GRI1h8BN7CEF2SwdahjtfcKGRBbeOg+NOLyZ4MxBnQPB+1j+B2+ZN94cMhsoXw
 8AsFGBnXNy4ofJHV2KyZIMMMbaoQd0AM0CxPOsusbqZDnRRdsLh5jYaT1+Hp3jaaU+In
 hppw==
X-Gm-Message-State: AOAM530m71euF9wwdXhHL6HWQD/NNRC5xobNJBDZIelQvKfqnmdsWyEx
 t8gDwM2hx3wI4N6YJr9+qrixGw==
X-Google-Smtp-Source: ABdhPJzo+T1F54fl8q16F3SuWBffglk48PEytQu7/wpxM8oR5iYvbOQGglf6EbVoa0EICQ893qG+lw==
X-Received: by 2002:a17:90b:950:: with SMTP id
 dw16mr2661711pjb.200.1601962950652; 
 Mon, 05 Oct 2020 22:42:30 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id d145sm2005503pfd.136.2020.10.05.22.42.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2020 22:42:29 -0700 (PDT)
Date: Tue, 6 Oct 2020 11:12:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: Explicitly allow additional properties
 in board/SoC schemas
Message-ID: <20201006054228.ho3ajzfgpiew32ft@vireshk-i7>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-4-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_014232_905555_A54EAAF4 
X-CRM114-Status: GOOD (  15.43  )
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

On 05-10-20, 13:38, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As the top-level
> board/SoC schemas always have additional properties, add
> 'additionalProperties: true'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/spear.yaml               | 3 +++

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
