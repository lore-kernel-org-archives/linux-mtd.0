Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4ACECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjzN1E1cLUyyknVD+e/KxfhTh163eyEzsFmSYOcHJXU=; b=YAtGpyPgeR8cV0
	WnZSUk10uTlAIlNzVu762i/MeA7+CrovCzd05GLNbYte0CqDUe0FV3nlRl9WtJPMU+exrZ1eEX2LL
	G6yeeoWdeXE1hN8xMFu4gRUElfm2GH1efjcHDqthwglBIRAmPfPgX35egjFposUxaiuxa6k2q9f/y
	Fhz6z5osCsLSO1dGWyOrTplyP3iwrUB6X5gCewk5BLDrMerEtvgUGf+ktxysXbRWh2cpBcPlLQmQa
	xx7UNMV7ekWD7cIxk6qkSSxRcjswoHIzp1YpZjL3RcSVBuImnicV7I2w5e27+ayv0KHtlIA/311yi
	lf4Yr1qZNhfHhL3TFG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCvC-004Ida-89; Mon, 05 Sep 2022 14:17:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0p-000vM7-BS; Mon, 05 Sep 2022 11:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=; b=oiHEwTHveR/1z7/ePVImp2vMRU
	bpkdXdEdGRI6ADhX1xuTqdNXOzxlXsPPiKvkuOyhrcpguA64wyn3+0i6b6iCeq3JxhytsLG5v8Nxq
	8VjUMHxj5ebtc10jJryTg8LrSl+TC8KMQxcxtVpu8+Jme8qKd/cIwSo4BUGeIsc5gVwHg62yGs/9H
	NRK4xou9Mm/VXKm2YGUyzG39t6AeAOfUBCNDvt9gefEdhKDxvcVWT4KvfCTfV/qRN4diMGlqBukxY
	e3jp8Fi2cEq9iMMZOdUbHv0j7q3rtrUJLcNQJPUgdb0gInXZo+E/htG/FucOA7GBAdxpaGlBx1Jat
	RkZp+C7A==;
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9fz-009XPS-Kv; Mon, 05 Sep 2022 10:50:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id m9so3527524qvv.7;
        Mon, 05 Sep 2022 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
        b=bJcqTGACtFXLmXsUFqpw+PFDufx4FlXQ9j/RFhHUQVHKZqoTndY/JkV19g6BLOeeUo
         4hwSoSeec32Tbw+OMHEGG0r6M3e1GMJ/NJcg/FZwHW1SClzced4lWIu+/ZShrdu3JDTD
         V762GqyZZIhqeYexr860HlDH8BBXqi/Xiv+2j3KgGGGsMmOP08meZgz/a8ltQBauY42v
         3tIliUsfRb5Lb2wvCwZlmuODmHlyxQTZ+r40eHwZ7AsK+hrNiFx9jEpz+HZY8XcSMnnB
         5QEIV3Pay913kDLF3Na3+KE+sGrpwp4YFq2VvbdqUoXS9I37A0JHt+Mwwdcik+o8Vvzp
         uBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
        b=dZB5Jwsu3Hi2GG6YnbxKVJwEpiia/TfTUjrGds5k9fuc+oKKypFyCpVYd9T+xe/5bY
         KqlJPS3GFn7+FligR3Gz3U5bjn/O6nAUQK+JtKKBwVeqa7lJlDl3TrySImnmsQ9DGQNY
         SCOuXkoSKqMHpbgPgQIv6VOg0tdN4wItkeSFcvcZa5NmW/6oP7b2v6lvsgt5mHteH9UM
         FNkJa50JfYxKGyZDgNReYVoBqHOeiBT8STinwPNHTvagzbGT7PiIOt+vWPVUdCkX2q5h
         yrNgY0hth8ZxleQapoyi9KjvEdVesUfEhOiT8SRorixqeIgDbmvryKiCgbD9gZ9AZEcO
         POpg==
X-Gm-Message-State: ACgBeo1myscfO4L3TP5yaoacZGXs7Jx+OTNNoMssrCBIexfFTB1oiK7+
	HGA2c7d/GPsD8bz/u+ITKp5M+tr/cWisdVXREqY=
X-Google-Smtp-Source: AA6agR4zgtLgNA+6EPAv70W9Z01Gulpe7vTobIsUEmKS5Gup9hLVk95/eNnOn1IhVSGIautSBTqi9ZJMAl53duUVpgY=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr746972qvb.82.1662374997159; Mon, 05
 Sep 2022 03:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com> <20220905071902.fv4uozrsttk3mosu@pali>
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:49:21 +0300
Message-ID: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
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
X-CRM114-CacheID: sfid-20220905_115000_125389_83B306C6 
X-CRM114-Status: GOOD (  14.34  )
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxMDoyMyBBTSBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBTdW5kYXkgMDQgU2VwdGVtYmVyIDIwMjIgMjM6MzA6NTMgRG1pdHJ5
IFRvcm9raG92IHdyb3RlOgoKLi4uCgo+ID4gLSAgICAgICAgICAgICBycC0+cmVzZXRfZ3BpbyA9
IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIHBvcnQsCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNldC1ncGlv
cyIsIDAsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdQSU9EX09VVF9MT1csCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsKTsKPiA+ICsgICAgICAgICAg
ICAgcnAtPnJlc2V0X2dwaW8gPSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoZGV2LAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZl9md25vZGVf
aGFuZGxlKHBvcnQpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAicmVzZXQiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCk7Cj4KPiBXaHkgaW4g
cGNpLWFhcmR2YXJrLmMgZm9yIFBFUlNUIyByZXNldC1ncGlvIHlvdSBoYXZlIHVzZWQKPiBkZXZt
X2dwaW9kX2dldF9vcHRpb25hbCgpIGFuZCBoZXJlIGluIHBjaS10ZWdyYS5jIHlvdSBoYXZlIHVz
ZWQKPiBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoKT8gSSB0aGluayB0aGF0IFBFUlNUIyBsb2dpYyBp
cyBzYW1lIGluIGJvdGgKPiBkcml2ZXJzLgoKSXQncyBub3QgdGhlIHNhbWUgZGV2IGFuZCBpdHMg
bm9kZSBpbiB0aGlzIGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldApmb3IgX2FsbF8gcG9ydHMsIGhl
cmUgaXMgdGhlIHJlc2V0IG9uIF9wZXIgcG9ydF8gYmFzaXMuCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
