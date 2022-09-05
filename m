Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536CFECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktV3TqLW3l+aml3mUKc+tcI3AenJg1gvqcXsnt0BncY=; b=RnmACbZXlX7Qb2
	dibWRdmpU/jQ0l8UKxgWcMw91ysNvfIArk+BE8jawR5vdCCkaezW7oO3JOY6IpamHzUX1POGs3Ms9
	o1XVLyzn4mT6VzfU13YddsbR2R6WUiB3GLmmwD7a477GOWwMikdNcSTIbiUFuLzD+H0F3cKq+dgfK
	k7ojLn9HPrPLWLFaM0RmfHNPOnFZ3jM8w6mmlsGjrrWP9uEe/AX2Iyf1Lm5HChNCbPnTSDUwCR/fp
	qOFONietVOPQlQY8Ia8Y83BMXZn4GAHuXzLLVJj8hmwZWyRENPg2Vwf1AcmBvOdmj9zh7mMLpsi+V
	9auQ/vupd2P1dwIuC7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCvz-004JEQ-Hx; Mon, 05 Sep 2022 14:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0y-000vLc-73; Mon, 05 Sep 2022 11:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=; b=pefP47rufwPcFO6e3hEayLPh/D
	1sdU7PqUnqNM0VOWC1w2GAJZvrhxenHEmPVXw8Afq/pvK72SAeSJG0I2zxFUSJchIZ0oBZdP877xF
	dkvbbB98N+eFRj2oO3IkBwI0DUiFPI1C0207nUGRLfsKxHxREgy7dl+n6WA25bsl2OraslrZaPYO1
	meVAxH9kAwnqqaxsf+54Q26/50Yj5U4LwfDKzsCjoGdsSf8QEKrmjAWOYq9ORR1kiMLqm07TA7DW9
	NkZAntQPm3dVL5tWAQAfOr0PGpkamwAp7/rvpTgMSx/px6TZj/7rEETV/hcc8jULIyK1YonhVX0Nj
	H8xDVXnw==;
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9eR-009XB0-HU; Mon, 05 Sep 2022 10:48:25 +0000
Received: by mail-qt1-x831.google.com with SMTP id e28so5881917qts.1;
        Mon, 05 Sep 2022 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
        b=KeR2rGIjPnYKiKG2aILzh6gWMDTnViE8fXPWXXXixLovTbpx00/oSEAU+Q4L2OCzAK
         GRraxIbhCS4mi4IuRHOlRDlrrUGLqMd7GLM+J1Hc2/d7WSNIQDHGywQYnYEyBYPDgjiz
         uY13i1u0RDIQGheVM8QVFqtoKIkC9biCE4wbzSZrKtBJ1m2pvxKw60ny4f6bBZ/B8u0u
         Zr23UPD2YvAu/KuN+tEjHJX9M8xugOLPnNs4g2YR3PzTM6X60zVPevAOqAjIm6WKdYct
         vHLBCofCn+v7V2zJuE2kdbx3Wmz7GLi7XsxEmH7dNee6uir7hoWh+8c0e9HZN2r8BTuM
         JH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
        b=jieuumRCuW23nlr7PgqrpaSXswbE3L/kRQKDHASNm8iXQXXDtO3fU7bOqes3YMIJOH
         Pxctslrl6TAKkudE4y/FfIVlOIRnp74i7okvdc/OQ0zRh+8U4vaoTjpNdIE6BYVcXwPq
         135lt3gcfuyD0c+4z5Czjwap4GS41R3v65fRXjmXVln6KZZLZd1a4+rr8u2lVpXvUnF/
         wxkjQ9Y8AieSywdWzRHyguWlIje8AYel/Qukygu5l+UODrdXRb/Q+pb597QHzhNBeLrG
         pvabbm4nAhDrSsZBNK4aHHltR+ote9cY2fNcJ3eQzZ71bT7RKZur9Fgj3IcG2NlVlnz6
         ZCWg==
X-Gm-Message-State: ACgBeo2TRbHeZ7beznXs5DxXmkIfXvvdMF9xKQGu69hSeLZ9bdumNGub
	yeX3EfrX+y5XTt3uwskwDbcMqN70yJugtbYiQAs=
X-Google-Smtp-Source: AA6agR6PNo2Qc8lpj2itrEExN36xqc7ZpSaZEm3ZnHtwljImH3P9PTPtYv87hNYI8E9dEPcysm+pNwOsTzObwqbdpdc=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr38497148qta.429.1662374897323; Mon, 05
 Sep 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com> <20220905070046.46nlhczkck2ufr4x@pali>
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:47:41 +0300
Message-ID: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using devm_gpiod_get_optional()
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_114823_717372_E32429C3 
X-CRM114-Status: GOOD (  19.81  )
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxMDowMiBBTSBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBTdW5kYXkgMDQgU2VwdGVtYmVyIDIwMjIgMjM6MzA6NTggRG1pdHJ5
IFRvcm9raG92IHdyb3RlOgo+ID4gSSB3b3VsZCBsaWtlIHRvIHN0b3AgZXhwb3J0aW5nIE9GLXNw
ZWNpZmljIGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZSgpCj4gPiBzbyB0aGF0IGdwaW9saWIg
Y2FuIGJlIGNsZWFuZWQgYSBiaXQsIHNvIGxldCdzIHN3aXRjaCB0byB0aGUgZ2VuZXJpYwo+ID4g
ZGV2aWNlIHByb3BlcnR5IEFQSS4KPiA+Cj4gPiBJIGJlbGlldmUgdGhhdCB0aGUgb25seSByZWFz
b24gdGhlIGRyaXZlciwgaW5zdGVhZCBvZiB0aGUgc3RhbmRhcmQKPiA+IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCksIHVzZWQgZGV2bV9ncGlvZF9nZXRfZnJvbV9vZl9ub2RlKCkgaXMKPiA+IGJl
Y2F1c2UgaXQgd2FudGVkIHRvIHNldCB1cCBhIHByZXR0eSBjb25zdW1lciBuYW1lIGZvciB0aGUg
R1BJTywKPgo+IElJUkMgY29uc3VtZXIgbmFtZSBpcyBub3QgdXNlZCBhdCBhbGwuCgpJdCdzLiBU
aGUgdXNlciBzcGFjZSB0b29scyB1c2UgaXQgYXMgYSBsYWJlbC4gU28sIEdQSU8gbGluZSBjYW4g
aGF2ZQoibmFtZSIgKHRoaXMgaXMgcHJvdmlkZXIgc3BlY2lmaWMpIGFuZCAibGFiZWwiICh3aGlj
aCBpcyBjb25zdW1lcgpzcGVjaWZpYywgaS5vLncuIGhvdyB3ZSB1c2UgdGhpcyBsaW5lKS4KCi4u
LgoKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCByZXNldC1ncGlvOiAl
aVxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCk7Cj4gPiArICAgICAg
ICAgICAgIHJldHVybiByZXQ7CgpJIHVuZGVyc3RhbmQgdGhhdCBpbiB0aGUgaW5wdXQgc3Vic3lz
dGVtIG1haW50YWluZXIncyBoYXQgeW91IGRvbid0Cmxpa2UgZGV2X2Vycl9wcm9iZSgpLCBidXQg
aXQncyBhIGdvb2QgY2FzZSB0byBoYXZlIGl0IGhlcmUuCgouLi4KCj4gPiArICAgICByZXQgPSBn
cGlvZF9zZXRfY29uc3VtZXJfbmFtZShwY2llLT5yZXNldF9ncGlvLCAicGNpZTEtcmVzZXQiKTsK
PiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gc2V0IHJlc2V0IGdwaW8gbmFtZTogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gPiAgICAgICB9CgpEaXR0by4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
