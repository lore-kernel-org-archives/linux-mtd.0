Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E9C4363D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:05:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B4C206F7
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 01:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z14gYtcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3Pwy5wY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B4C206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B36QR5o5+jsvFdrNz7SpL+1kQop/PHttMGuuw7TbaPA=; b=Z14gYtccOSby/HErc97zPwn/S
	O+aX1lDhTEVsDv9gG/NbbOC4NVeqLn0p7+ZURJnL3IIDZ48twt6Cfk2faTVV+D8uK7JU6BQSH+kfg
	Zd95x8gDepm+FMRLg+hVmLM6qup34bHC9qdvFoa0RW1ElE34s7FCNk+KgvhKYr2L5dt87w9gSGyJ/
	/cTXiKItRdpVche4UZdsM4nwVSxfa5kOdqWTak8yAbHqF3k861c3kpI8Rp2vyOeZM4HphWWsc5CVR
	2Fh+DRzNzPftp0LXmwK2ZHKpkNn+IRGmymmPWl3UZ9gP/1WCjPOuXBIpUoueDm1loqO35oumvZN3L
	8vVBWocxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPxt7-0005Gv-DK; Wed, 07 Oct 2020 01:05:01 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPxt4-0005Fm-S8; Wed, 07 Oct 2020 01:04:59 +0000
Received: by mail-pg1-x542.google.com with SMTP id j33so329240pgj.5;
 Tue, 06 Oct 2020 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0/bWrGoCkUT1XKG15S3LcPCeuj/9H6SulVmeatRXh2o=;
 b=o3Pwy5wYAD2KjHFxqx8zJn29Vs5mbvXSBjNxI6P7OabTpsU/U0SGpYd4FsvkK/Ndjy
 o6haFaQLhrlga1BZAonVWdmnYb32RwDlKDv1iNZSfD0mkYhL6AlLSFycnS+oYFh7ZUp1
 TkX5mqfIN4mnxWvwmM0DfqKMDy+og8IZ+jNqBte63Si7LyqSrYcSS5VQLfQgB80bmtjl
 SLVjNURG8b+QRtDeh3cy+5wKhP+/ucXDk7OVxpSlq1MvLPkb9wEBt0slTTHRiZnkT43r
 0Da6jEuUUaW5qy0DOhRMGh0Fme25JQoAZtM8rFDZY+jZY5w1aTzbtncjcS61sVCE0zAC
 N0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0/bWrGoCkUT1XKG15S3LcPCeuj/9H6SulVmeatRXh2o=;
 b=WWMCJic8BbfaGPBBFcl75PoVmSH+jffvNWuInRQJ2zwFi7YI3VwFDkJZhAU0b+mjGM
 jVCwrcnIgklqLvDSonzmzO+f3Ry9r+OYOjef+WL3l2+eRifJgfFpdYCECyCTBKIB9uKg
 disvuCdEOxlVt5X6XMhaUUVCM2zGYsLo4JcIKU7P3EYzeRLK2f1fAD+M7GJsEVXmnkIe
 icMl2OLkxgOMvtWOLGIIjuzzmaAS+a91gS+X43+/5zZhaha6cre6HaQwqdOM9Sw/4yxf
 DK9FynIAp1/k3CMymR20qDk1mgNGZmmdF65MMPEgiMhmjAVuqly4fCnYdOc+KEIpcJuD
 i8Sg==
X-Gm-Message-State: AOAM532qxrl4IIvGQvdHJ/Jp4TYI36vYUMTFshaHl/TXb1RNaCQdLQrD
 F77fZPg4eRKQ+DhXna91bGw=
X-Google-Smtp-Source: ABdhPJwHBE/6svDofq3JI1Nvl9AaFlg1oX0F7Zhinc7Yx4XbSqxrhmfr8wUc0v2ZFV5xqE5jZ9MdIA==
X-Received: by 2002:aa7:9e4a:0:b029:152:54d1:bffa with SMTP id
 z10-20020aa79e4a0000b029015254d1bffamr663621pfq.6.1602032696538; 
 Tue, 06 Oct 2020 18:04:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id o62sm458923pfb.172.2020.10.06.18.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 18:04:55 -0700 (PDT)
Date: Tue, 6 Oct 2020 18:04:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201007010449.GQ1009802@dtor-ws>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_210458_931414_8C48A790 
X-CRM114-Status: GOOD (  14.44  )
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

On Mon, Oct 05, 2020 at 01:38:30PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
