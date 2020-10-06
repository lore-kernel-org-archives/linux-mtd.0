Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0006C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 06:59:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7285620760
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 06:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZSTO5Jl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxVBGe9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7285620760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RN7+cecI6WZqzaiAeCNe+bYcd+0zlx8kmlp9GiNKUZc=; b=GZSTO5Jl+Q+jvDCtbbH81tdWV
	HJWbNLeYWJtepG3mNXWQrrEYruym25kStPvEqgW71HeoQcpnJUwfxW+Ff0cp6O8TCLemta8MJyISw
	aJPv7e58C8e4Geb3mjIvFtosHRnaS+qBDqiTVv4Bpq6qLxpYqwzvqMvA4t6jYuwZ/nmahgijKbcYp
	i2HUvrbRXU6gAD6H9S29paeyYm2BryGMQ7I5OcqREWUentvyQYOvTOWZxZ0qWNzK906+5AE9BcqRC
	0ckkSxV6TqWxrSUC5dEY54CUVPPsdOf58lnCM18OpPfqCB59g8TPZYh1Mg5k1ZJ1VgKVTYpZ6B3by
	rHN4WUcxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPgwX-0003Kn-NZ; Tue, 06 Oct 2020 06:59:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPgwV-0003JK-4T
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 06:59:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id o5so12131881wrn.13
 for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2020 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CJt8sMvkLfzd8pVfQzeKwrD9wQt2ezco6HzjCXU2Seg=;
 b=JxVBGe9v20fI1rWZ+LblFSymah+5lDcEzko2dpzuxH2sV76ZNSZuJMvGzdxBOU4EEE
 016bYoBGw9BoWO2uYbYpJh2Spqfe+txcbLLwj0dDMlR/N5yVsSaJVMqeu9en2rycu/TT
 n1jnC4KuJCiEYEIdFvD/egT0iBvuzR0aC8sGAuxTCPbkVANitwk76rko2yla+Dj7q7e8
 sZCK0Cx3psrp4tVRMioIbzifJSWNfJENU2wQrZHVs830d0ZwDclsCeY3DZLdaTt0c5D8
 BR0YmsLI9C2kzSZ+GpT1D4lBMiJpvLvJ21dr2n2+YN+vRiNGtA+lOfa8qajAa2TyKNwy
 4j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CJt8sMvkLfzd8pVfQzeKwrD9wQt2ezco6HzjCXU2Seg=;
 b=ROSuV/DkprKGbW+h1Wp/gXkWfp0u1XSa7XApDG4GoB0ccrRsM1qMiikk0JXCeOFOcA
 x9I2dgFyfVL//vh+5GIwfkssPTKIO/xSFLHCswA73YmSVYvkQSid0W9sohpJbeWqknhV
 SXl3p3507p+LdAL8EyDwRij8/6QJHUa5m/oCXKHWXykVgwJ4n/JIEu5xfuLqDrHFJiMA
 nbdZr9SXylVExnC+G0RIFwq6+HYBOyOjUZLB7IPpu9K4mKj5qHfKaL0dBf//AS8J9XVD
 Ltb7SminnKPXVMsMKmHd5wtbgTc58atZ8VH7ZrwJ8to9Dn0s93IK4SNKVWAKcKUMrLDD
 EFfA==
X-Gm-Message-State: AOAM533wpA3L9LYCMIiGC4MPQp6B+7mFdIJqBsT08L71qqQ51jGdl1Cr
 sTmr4VlBPdAQyg2oUjCDft9uMA==
X-Google-Smtp-Source: ABdhPJw9aVlQCFJI6s9KKSTQz6LD1w2/gTI0uxeBSfs6H68t2v5l2G/j/zLB0TtAX8AL+VsxEknjwQ==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr3347103wrn.117.1601967562086; 
 Mon, 05 Oct 2020 23:59:22 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id m3sm2805162wrs.83.2020.10.05.23.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 23:59:21 -0700 (PDT)
Date: Tue, 6 Oct 2020 07:59:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201006065918.GZ6148@dell>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_025923_232656_1BCE8491 
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
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwNSBPY3QgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEluIGNhc2VzIHdoZXJl
IHdlIGRvbid0IHJlZmVyZW5jZSBhbm90aGVyIHNjaGVtYSwgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVz
Jwo+IGNhbiBiZSB1c2VkIGluc3RlYWQuIFRoaXMgaXMgcHJlZmVycmVkIGZvciBub3cgYXMgJ3Vu
ZXZhbHVhdGVkUHJvcGVydGllcycKPiBzdXBwb3J0IGlzbid0IGltcGxlbWVudGVkIHlldC4KPiAK
PiBJbiBhIGZldyBjYXNlcywgdGhpcyBtZWFucyBhZGRpbmcgc29tZSBtaXNzaW5nIHByb3BlcnR5
IGRlZmluaXRpb25zIG9mCj4gd2hpY2ggbW9zdCBhcmUgZm9yIFNQSSBidXMgcHJvcGVydGllcy4g
J3VuZXZhbHVhdGVkUHJvcGVydGllcycgaXMgbm90IGdvaW5nCj4gdG8gd29yayBmb3IgdGhlIFNQ
SSBidXMgcHJvcGVydGllcyBhbnl3YXlzIGFzIHRoZXkgYXJlIGV2YWx1YXRlZCBmcm9tIHRoZQo+
IHBhcmVudCBub2RlLCBub3QgdGhlIFNQSSBjaGlsZCBub2RlLgoKQWNrZWQtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
