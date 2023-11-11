Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF1C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Nov 2023 21:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoXTD2hYOssZmNzRdOl6kKaanrS7kMTN/iEX2M/lpl4=; b=mG/06AuUxgRUWr
	DkwlmxKxGhM09HExzemToEpimR1CKKV6HGZj1FTaOFj5yziwkaZtEeN6EmaoU8CcUQbIOPY9uklu0
	zr10Dn3nZnpjJcbSiyK1UOxQPd9Iw1siv2cejuz0ZbDGIPf8HoyF3xrfPcxLPe0PXSYrYVao+LSfL
	HK41Y+OPqFxRV2L3QsCey9ei2RupPFuso62rW9BGdgBl8vnP4CBNJgTyKVKi2G2dOKkxtummbCJUQ
	n+CmfAJWCh78XPmdcLXx+f8YqQ7nElAdqIW5A4JuIjYYYODv//g4E09qIl0NjY2TBnn298815013H
	TTrcUGQJfIxe+Uh7jCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1vbw-00BOOO-2P;
	Sat, 11 Nov 2023 21:33:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1vbs-00BONJ-2R;
	Sat, 11 Nov 2023 21:33:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40a48775c58so12288455e9.3;
        Sat, 11 Nov 2023 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699738422; x=1700343222; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjJpwKGCecxdkQ5LjdaCff64J4ZeBO10oL7F7MwcVn4=;
        b=j0p9WBw+NFxdOEmrc0ZPcoiIv/T7hor7eFbUeZ9Dpj2GiVA90kEZNhQikNeQuxzDsE
         yk1hpuImwsVsMeAKwtmFnw/dOQVMBKvjEu7JTe596AaotMEtmo6CrmH+E/QjY04nS6Vc
         dGwOjNuDORRuLFnmEjtsh3/klm4MnMb65bfDZ5j5QzlTLtD8T8nw8moGYLThXstMUAfv
         qtfzR1fRVO2Gf0De1hDKfSZMAQPGJR2cHIIALe+Lb+pCUwKTX9gKRzX7kymu0jefKOdu
         HJOhnpb5MYsIAyoL9JjEI2rAqgXaGAhDaIcIbMJeVZ/lpIEQQ3f1YDZ/jUd0qnwwtUXj
         Ys8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699738422; x=1700343222;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjJpwKGCecxdkQ5LjdaCff64J4ZeBO10oL7F7MwcVn4=;
        b=o3XIX0kogTeoFVvtSXIWb0Lq9v+RLChje5Oerka9ZZgLLEoNjdODTArpI6MH6VRzN9
         2Oj27CQCrwnO9EPhrp9Zxp3yUIGK1pNhH+pNtIvexJ9kOEuxgafDvKAv2dOqVr0omd5Y
         8gnY607wrMN3RXicW1Yj5RlU8oLt4f7E3XS18CBSB0NL9lax5+6kBQdY3KvbpYXZjeyU
         mOkUZ95a8/gyAYnwxrr2E8pZjgDps6hbXu3aIXCKFmxZq7zdq7S5HSq5SdJNJfxMMBSS
         /gS/pHgLUKrze4kLf2XctQ8rbOzyDibCcz45sUTTIbb48/rWNhdIsOV9qLqHBVsE/kYD
         O0JA==
X-Gm-Message-State: AOJu0Ywmn00Xb7dsgzwxQPnnRnLJ6MLFPiXCBzUEyL0a1sijnxWVR6Oz
	Oqc+6sPoh5+ejnGuAE+cmq4=
X-Google-Smtp-Source: AGHT+IGcspAIBmQE8uECroiT5zYPxAfvcuIKjKOjZDZOhwNchFn+oYO8zOgLHmFyk1hPD+Lg8347oA==
X-Received: by 2002:a05:600c:5121:b0:408:57bb:ef96 with SMTP id o33-20020a05600c512100b0040857bbef96mr2147252wms.30.1699738422278;
        Sat, 11 Nov 2023 13:33:42 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id be14-20020a05600c1e8e00b00401b242e2e6sm8935242wmb.47.2023.11.11.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 13:33:41 -0800 (PST)
Message-ID: <c49f77492cacc5a30079720af58a9f2fca761609.camel@gmail.com>
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Lennert Buytenhek
 <kernel@wantstofly.org>, Russell King <linux@armlinux.org.uk>, Lukasz
 Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, Sergey
 Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,  Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Peters
 <mpeters@embeddedts.com>, Kris Bahnsen <kris@embeddedts.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Sat, 11 Nov 2023 22:33:38 +0100
In-Reply-To: <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
	 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
	 <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_133344_796969_D7E0ADA9 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gQW5keSwKCk9uIEZyaSwgMjAyMy0wNy0yMSBhdCAxNzoxMyArMDMwMCwgQW5keSBTaGV2
Y2hlbmtvIHdyb3RlOgo+ID4gK8KgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycXNhdmUoJmVwOTN4
eF9zd2xvY2ssIGZsYWdzKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF9yZWFkKG1h
cCwgRVA5M1hYX1NZU0NPTl9ERVZDRkcsICZ2YWwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgdmFsICY9
IH5jbGVhcl9iaXRzOwo+ID4gK8KgwqDCoMKgwqDCoMKgdmFsIHw9IHNldF9iaXRzOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgcmVnbWFwX3dyaXRlKG1hcCwgRVA5M1hYX1NZU0NPTl9TV0xPQ0ssIEVQOTNY
WF9TV0xPQ0tfTUFHSUNLKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF93cml0ZShtYXAsIEVQ
OTNYWF9TWVNDT05fREVWQ0ZHLCB2YWwpOwo+IAo+IElzIHRoaXMgc2VxdWVuY2UgYSBtdXN0Pwo+
IEkuby53LiBjYW4geW91IGZpcnN0IHN1cHBseSBtYWdpYyBhbmQgdGhlbiB1cGRhdGUgZGV2Y2Zn
Pwo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZXA5M3h4X3N3
bG9jaywgZmxhZ3MpOwo+IAo+IC4uLgo+IAo+ID4gK3ZvaWQgZXA5M3h4X3N3bG9ja2VkX3VwZGF0
ZV9iaXRzKHN0cnVjdCByZWdtYXAgKm1hcCwgdW5zaWduZWQgaW50IHJlZywKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgbWFzaywgdW5zaWduZWQgaW50IHZhbCkKPiA+ICt7Cj4gCj4gU2FtZSBRIGFz
IGFib3ZlLgoKRVA5M3h4IFVzZXIgTWFudWFsIFsxXSBoYXMgbW9zdCB2ZXJib3NlIGRlc2NyaXB0
aW9uIG9mIFNXTG9jayBmb3IgQURDCmJsb2NrOgoiV3JpdGluZyAweEFBIHRvIHRoaXMgcmVnaXN0
ZXIgd2lsbCB1bmxvY2sgYWxsIGxvY2tlZCByZWdpc3RlcnMgdW50aWwgdGhlCm5leHQgYmxvY2sg
YWNjZXNzLiBUaGUgQVJNIGxvY2sgaW5zdHJ1Y3Rpb24gcHJlZml4IHNob3VsZCBiZSB1c2VkIGZv
ciB0aGUKdHdvIGNvbnNlcXV0aXZlIHdyaXRlIGN5Y2xlcyB3aGVuIHdyaXRpbmcgdG8gbG9ja2Vk
IGNoaXAgcmVnaXN0ZXJzLiIKCk9uZSBtYXkgY29uY2x1ZGUgdGhhdCBSbVcgKHR3byBhY2Nlc3Nl
cyB0byB0aGUgcGFydGljdWxhciBibG9jaykgc2VxdWVuY2UKaXMgbm90IGFwcHJvcHJpYXRlLgoK
WzFdwqBodHRwczovL2Nkbi5lbWJlZGRlZHRzLmNvbS9yZXNvdXJjZS1hdHRhY2htZW50cy90cy03
MDAwX2VwOTMwMS11Zy5wZGYgCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
