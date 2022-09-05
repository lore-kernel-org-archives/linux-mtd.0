Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C5AECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar5kvoAuh2nqOY470B3AlAR+/aop6573RItezGhYE9k=; b=cbmR839IEvETl9
	9DT+CqZLArI/4gsZGzjisHkRNkNhPCoil6Io0GTq8WS2ZN5CQO2qNaRyCXxmijlQK9R4PL8K58bYt
	32VWLrzUN5xQflpKJrWbEJPU5ogkMUvKkTmmpBLnnMbBri96UTU4ghGxjjVOhMoh18gwuIczgQZPr
	mCioSjOPrvDMz4S/t8z1R43rkYqVcM52r2q3cK8xKWX82bVJmztDahk2bV+hgLyesE0AwRRJmlIqW
	ZMevUH2Hczr3LZuHy1slLTP+HQnIRFx2TwrUuqLeqMoNnJPksbznl9Ea4vNZXorv7EhqyntYpYIoF
	70V1WQhjqe8YPMArDDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCt2-004Gc5-Bn; Mon, 05 Sep 2022 14:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0L-000vM7-HH; Mon, 05 Sep 2022 11:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=; b=Pd7VmL7M1Wn7B4QGCjWUi+lgHN
	h0gMQKwqiVeR4WMM8tZouXE+irVD3CxgdVt2dtbHi4bCaeotK/LxtART3GYE+qQUzyWxKcYHCcmc1
	GH9/i3vYZi3L7JMKgEpegynfhp3HLyhVlaCpF0DQ7cJhlTnI5yiKIe1wUFPGLx2Oz6uItdRQ70QPW
	fZUiyt8JQ/I+nhErtVixzQQSr48VqqHjTzrdU9YiEQzHWZbpeavufUvSaS7/4C16lcDQ5KwrZLfZA
	wFh3stLiNv5KASuzCTczuMZntcb8QuK6ToaaqGPLnP2KdjMUVZM9RoTe/HCvFH8x0f++Y0+rpxh84
	HYtEHXAg==;
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9kV-009YBj-7f; Mon, 05 Sep 2022 10:54:41 +0000
Received: by mail-qv1-xf30.google.com with SMTP id v15so3417350qvi.11;
        Mon, 05 Sep 2022 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
        b=BT3xLpeH3RjbxWQzTHtluGWFLcpz2c3gkUTiSpzfoPpU7gaIO6czvS8W4reMZ4cCO4
         3eMf/g+K3UKbJS6Jk0JxrWeNOy6+42NuOyskDMGWojnEiJoNCccaKDrBXpafZBuULjuW
         dYcA7PiA983MMDKcYZKgKx3pSqByFVARqZpiSeVPU2Zd8gAbIKhjyD904CbNMtAzjOUC
         uG1HJFkRMuzcZrZpIhoUBQgxwknWCtImNXXD19IvU58Ts2K5UQm4oyao9nlr1q38XCd5
         l4cO9hdybc4SBkJmevuxR16Y4XsOdXf+9PHct3p0BX/cs/X4ebLeTYqHTloP7bvoOCLm
         luuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
        b=GtYgAcjFDJO16HpoSjJVtrFB3JiOxH+0QLP3lDMfppqyU44Ysk3nRgePramo6BGbSM
         NJ/tnbNaxvXq/SXIlBGzeEjxzDqymUzR/E7CppEBCmLqLURbe4broxJNHfIa6po3XB5l
         Pkf+ftOsScAYJ9zf+0I1Imfm3ymcGQ2u+MpiisKn59WKlrqdCI2rAf1ON6OGOUTdnyTt
         xuTNT8UevQJmqzYHaaEOxT0Z5IaKxJEU3hpSyOiOUfJrgS6aGEdMFSYBuY0jyTN6uN0D
         W+PbEkas+fNH/95FSKpy/YoAmQCpsaG+4KtsdQJC0I6xoajs/8GNaFvMzv/Pkw7bRS4v
         ZSKA==
X-Gm-Message-State: ACgBeo1+gEyoB3r5Sgc/3cB06p1GH035H6w05HBQntSrfqUTkFj/1nop
	K0vBg4SuPqWu4eAVtQwsQgbAgogNUCp2rquNgH8=
X-Google-Smtp-Source: AA6agR5qY7QHGswD32uCDWcX3OPsA9Qr7QwZIbiYbOgQNRx+s2EA487X6YBau9sHW1SCIA7Zbx5vkCR0pqATT7Z+4Es=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr757802qvb.82.1662375277275; Mon, 05
 Sep 2022 03:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali> <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:00 +0300
Message-ID: <CAHp75VfDZXzRQjTZSYO6tb3k6WDWmPz1Fpw8Y_RBx8cz79j2=Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220905_115439_703084_65CFD124 
X-CRM114-Status: GOOD (  16.33  )
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxOjQ5IFBNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5zaGV2
Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCA1LCAyMDIyIGF0IDEwOjIz
IEFNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gU3VuZGF5IDA0
IFNlcHRlbWJlciAyMDIyIDIzOjMwOjUzIERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPgo+IC4uLgo+
Cj4gPiA+IC0gICAgICAgICAgICAgcnAtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9mcm9t
X29mX25vZGUoZGV2LCBwb3J0LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNldC1ncGlvcyIsIDAsCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1BJ
T0RfT1VUX0xPVywKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsYWJlbCk7Cj4gPiA+ICsgICAgICAgICAgICAgcnAtPnJlc2V0
X2dwaW8gPSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoZGV2LAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mX2Z3bm9kZV9oYW5kbGUocG9y
dCksCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInJlc2V0IiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsKTsKPiA+Cj4gPiBXaHkgaW4g
cGNpLWFhcmR2YXJrLmMgZm9yIFBFUlNUIyByZXNldC1ncGlvIHlvdSBoYXZlIHVzZWQKPiA+IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkgYW5kIGhlcmUgaW4gcGNpLXRlZ3JhLmMgeW91IGhhdmUg
dXNlZAo+ID4gZGV2bV9md25vZGVfZ3Bpb2RfZ2V0KCk/IEkgdGhpbmsgdGhhdCBQRVJTVCMgbG9n
aWMgaXMgc2FtZSBpbiBib3RoCj4gPiBkcml2ZXJzLgo+Cj4gSXQncyBub3QgdGhlIHNhbWUgZGV2
IGFuZCBpdHMgbm9kZSBpbiB0aGlzIGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldAo+IGZvciBfYWxs
XyBwb3J0cywgaGVyZSBpcyB0aGUgcmVzZXQgb24gX3BlciBwb3J0XyBiYXNpcy4KCkFjdHVhbGx5
IEknbSB3cm9uZywgdGhlIGFhcmR2YXJrIGhhcyBvbmx5IG9uZSBwb3J0ICg/KSB0byBzZXJ2ZSB0
aGVyZS4KSW4gYW55IGNhc2UsIGhlcmUgZGV2ID09IGRldi0+b2Zfbm9kZSwgaGVyZSBkZXYgIT0g
cG9ydC4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
