Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0BECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hdedn0p1qfPLksZ6+LCj9/sn6wSr1OgJ5R3ZGbQczcs=; b=UdIteSsopOK8Vi
	IbQsDfo2F4oiilDsM13Kh/4DgDafxNeefRsspibTC7HwC0Sd80rpZePbmjok6z3z5/MUJTQOdBZgu
	LvLUvWoWPfyBFqop8i4b8eZHUAuwn5ORy+IxB2lNL3B3FX9Spps0UQbNBTscy8Zg0nrdruPOrN4ZJ
	J++0JEFo0mw139Gp7DeBoPAOWLWefL3zc0allBQeqib5knmlCsA9Z3h5plj7ELETRCBhnGDSvW6JM
	FznHfWSFHkEGj9tNcn48yvAESnFLs0+ASFezJVWSDW1LLqo5w6OV1ZdUNRGBMTzWSW/ClhIBV5Mkh
	8vMYrxYS9s34usTbGHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVClc-004AMo-Ft; Mon, 05 Sep 2022 14:08:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9rI-000ne5-Ha; Mon, 05 Sep 2022 11:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98186611CC;
	Mon,  5 Sep 2022 10:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD170C43141;
	Mon,  5 Sep 2022 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662375225;
	bh=KnM89UV/QXbr+bD5uW61IQuouhORuL6HjctA/n6mRg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXsW4xMlqP5G1yqVn2Vnp7wQDcPAoNf58U0cr8myKFBfvUzkhpC+Iscqcyg5rEIhZ
	 0PMTgWItYJNmw8Z400ucNJ5B0XE0lekJpX4qyetV4qePiVhpwNvYixfPDpcUp14ikB
	 22T/9xIpoVj9aJjbUdIR8NPhsD59irNN093isONgtwU/IDqAU6CwhROyPAZqKJ3Ax2
	 Sj/95TQsCXTmoey/B358xD1yE1qexDQ+Le/UUWfUT+rUg92OQbc5mebVHkcJj3e8vm
	 1Cb0U86VmYuGN9CH7WKr97gNp1kG1ChXDQHt2IQgh1P4RW98tzTzb6AB6Z4u/ySvYP
	 V7b5ELppG5LAQ==
Received: by pali.im (Postfix)
	id E35A67D7; Mon,  5 Sep 2022 12:53:41 +0200 (CEST)
Date: Mon, 5 Sep 2022 12:53:41 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
	David Airlie <airlied@linux.ie>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
Message-ID: <20220905105341.z2pjlpljitws3j6l@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_040145_325594_3D340ACE 
X-CRM114-Status: GOOD (  18.95  )
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

T24gTW9uZGF5IDA1IFNlcHRlbWJlciAyMDIyIDEzOjQ5OjIxIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToKPiBPbiBNb24sIFNlcCA1LCAyMDIyIGF0IDEwOjIzIEFNIFBhbGkgUm9ow6FyIDxwYWxpQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gU3VuZGF5IDA0IFNlcHRlbWJlciAyMDIyIDIzOjMwOjUz
IERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPiAKPiAuLi4KPiAKPiA+ID4gLSAgICAgICAgICAgICBy
cC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIHBvcnQsCj4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInJlc2V0LWdwaW9zIiwgMCwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxh
YmVsKTsKPiA+ID4gKyAgICAgICAgICAgICBycC0+cmVzZXRfZ3BpbyA9IGRldm1fZndub2RlX2dw
aW9kX2dldChkZXYsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb2ZfZndub2RlX2hhbmRsZShwb3J0KSwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVzZXQiLAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQSU9E
X09VVF9MT1csCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGFiZWwpOwo+ID4KPiA+IFdoeSBpbiBwY2ktYWFyZHZhcmsuYyBmb3IgUEVS
U1QjIHJlc2V0LWdwaW8geW91IGhhdmUgdXNlZAo+ID4gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwo
KSBhbmQgaGVyZSBpbiBwY2ktdGVncmEuYyB5b3UgaGF2ZSB1c2VkCj4gPiBkZXZtX2Z3bm9kZV9n
cGlvZF9nZXQoKT8gSSB0aGluayB0aGF0IFBFUlNUIyBsb2dpYyBpcyBzYW1lIGluIGJvdGgKPiA+
IGRyaXZlcnMuCj4gCj4gSXQncyBub3QgdGhlIHNhbWUgZGV2IGFuZCBpdHMgbm9kZSBpbiB0aGlz
IGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldAo+IGZvciBfYWxsXyBwb3J0cywgaGVyZSBpcyB0aGUg
cmVzZXQgb24gX3BlciBwb3J0XyBiYXNpcy4KCmFhcmR2YXJrIGlzIHNpbmdsZSBwb3J0IGNvbnRy
b2xsZXIuIFNvIGl0IGlzIGJhc2ljYWxseSBzYW1lLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
