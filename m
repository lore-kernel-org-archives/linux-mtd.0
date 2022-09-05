Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5764ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 23:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jLjUb1XiJ8URnY2e5iO4IbpNdJ3l2xsdF+lL4XCRPM=; b=Rth/G7Lk+IXUkD
	D634Nmlw49A4K8wHz6PvpBWLExykEYJq0bJhQbWeVV/srIa0U5O6Zxe+yHFwE9Y2OLIvz0Z+2g0Oz
	4sbBoNEmScV/FtZ5qmcoyHuAwH2cygqc6th+v/ZP3/GUHWg5UFLfhrzO27rWC0xndYBKxKUcyu1Ho
	wmthtByDB8dAUWH5dkjhQ8+IXAgBFwVHU1M2WhGex7dKmtZO2pXustbO41TydhBOFObzpzeorbj9C
	BTGjjHWPwLUUueFgothbsXMI00gtvhqrK0ZZ7oyklx6rJHG2N4gJBEizOrhNQgdo3jpk/giCf2SKz
	9rwZU+iEkIrDIMe3xLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVLEh-0006Zb-SG; Mon, 05 Sep 2022 23:10:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVLEP-0006Ph-Ca; Mon, 05 Sep 2022 23:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C60E3B81598;
	Mon,  5 Sep 2022 23:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323CBC433D7;
	Mon,  5 Sep 2022 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662419413;
	bh=QhxqwrmKqk3hcDpE+kAWZJMWXWXiMx7OLmYa5+ea15I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRSoeEfIVpvF6cCwlub3pnSJQf8zKCY4aEUPtHMtOkNaxfZe1+RUfK+stOROQ5pnl
	 7FbU956qU800+Jb6U6hwdOBoxO4x2FzlbVVVUaZEp0hQquPlSpxbMl7gPJHmGlip/q
	 WXeDk2lh/TK49oBj/AAQP6Dst1Z5bl84IrLyRgMJAafIN0kMLxsIsEAjQNvYyihGG9
	 h4xRjXdkiTaHf2hIJ2Yatpca7TxPs6KBGxO+xPjerqLTUmJvu4k28lZ30772rihPEH
	 I7n720bv3M7ihVFZNddbLANnIMiG1BrKlgvb+eKgjpWzR8KT6CpP2IYFa+iRtTPNF6
	 YocV+oaaQMIFA==
Received: by pali.im (Postfix)
	id 400A37D7; Tue,  6 Sep 2022 01:10:10 +0200 (CEST)
Date: Tue, 6 Sep 2022 01:10:10 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>, linux-watchdog@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
Message-ID: <20220905231010.ojl4i4ph27qtebiy@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <YxZ+PSDRYZnVKfFO@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxZ+PSDRYZnVKfFO@google.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_161017_773425_2E50D2E6 
X-CRM114-Status: GOOD (  35.04  )
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

T24gTW9uZGF5IDA1IFNlcHRlbWJlciAyMDIyIDE1OjU0OjUzIERtaXRyeSBUb3Jva2hvdiB3cm90
ZToKPiBPbiBNb24sIFNlcCAwNSwgMjAyMiBhdCAwOTowMDo0NkFNICswMjAwLCBQYWxpIFJvaMOh
ciB3cm90ZToKPiA+IE9uIFN1bmRheSAwNCBTZXB0ZW1iZXIgMjAyMiAyMzozMDo1OCBEbWl0cnkg
VG9yb2tob3Ygd3JvdGU6Cj4gPiA+IEkgd291bGQgbGlrZSB0byBzdG9wIGV4cG9ydGluZyBPRi1z
cGVjaWZpYyBkZXZtX2dwaW9kX2dldF9mcm9tX29mX25vZGUoKQo+ID4gPiBzbyB0aGF0IGdwaW9s
aWIgY2FuIGJlIGNsZWFuZWQgYSBiaXQsIHNvIGxldCdzIHN3aXRjaCB0byB0aGUgZ2VuZXJpYwo+
ID4gPiBkZXZpY2UgcHJvcGVydHkgQVBJLgo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIHRoYXQgdGhl
IG9ubHkgcmVhc29uIHRoZSBkcml2ZXIsIGluc3RlYWQgb2YgdGhlIHN0YW5kYXJkCj4gPiA+IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCksIHVzZWQgZGV2bV9ncGlvZF9nZXRfZnJvbV9vZl9ub2Rl
KCkgaXMKPiA+ID4gYmVjYXVzZSBpdCB3YW50ZWQgdG8gc2V0IHVwIGEgcHJldHR5IGNvbnN1bWVy
IG5hbWUgZm9yIHRoZSBHUElPLAo+ID4gCj4gPiBJSVJDIGNvbnN1bWVyIG5hbWUgaXMgbm90IHVz
ZWQgYXQgYWxsLgo+ID4gCj4gPiBUaGUgcmVhc29uIHdhcyB0byBzcGVjaWZ5IGZ1bGwgbmFtZSBv
ZiBEVFMgcHJvcGVydHksIGZvciBlYXNpZXIKPiA+IGlkZW50aWZpY2F0aW9uIG9mIHRoZSBjb2Rl
LiBEVFMgcHJvcGVydHkgaXMgInJlc2V0LWdwaW9zIiBidXQgQVBJCj4gPiBzcGVjaWZ5IG9ubHkg
InJlc2V0Ii4KPiAKPiBJIHNlZS4gRG8geW91IHdhbnQgbWUgdG8gcmVzZXQgdGhlIHBhdGNoIHdp
dGggdXBkYXRlZCBkZXNjdGlwdGlvbiBhcyB0bwo+IHRoZSByZWFzb24gZGV2bV9ncGlvZF9nZXRf
ZnJvbV9vZl9ub2RlKCkgd2FzIHVzZWQ/CgpJIHRoaW5rIGl0IGlzIGZpbmUuIFNvIGFkZCBteToK
CkFja2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgoKQW55d2F5IGFzIGFub3Ro
ZXIgaW1wcm92ZW1lbnQgZm9yIGZ1dHVyZSBJIHdvdWxkIHN1Z2dlc3Qgc29tZSBBUEkKZnVuY3Rp
b24gd2l0aCBfb3B0aW9uYWxfIGxvZ2ljLCBzbyBpdCBjb3VsZCBiZSB1c2VkIGZvciBtb3JlIFBD
SWUKY29udHJvbGxlciBkcml2ZXJzIChlLmcuIGFsc28gdGVncmEpIHdpdGhvdXQgbmVlZCB0byBy
ZWltcGxlbWVudAotRU5PRU5UIGhhbmRsaW5nLiBJdCBpcyByZWFsbHkgc3RyYW5nZSBpZiBmb3Ig
YWNxdWlyaW5nIHNhbWUgUEVSU1QjCmxpbmUgdmlhIEdQSU8gKCJyZXNldC1ncGlvcyIgRFQgcHJv
cGVydHkpIGFyZSB1c2VkIG1vcmUgQVBJIGZ1bmN0aW9ucwppbiBkaWZmZXJlbnQgUENJZSBkcml2
ZXJzLgoKPiA+IAo+ID4gPiBhbmQgd2Ugbm93IGhhdmUgYSBzcGVjaWFsIEFQSSBmb3IgdGhhdC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9r
aG92QGdtYWlsLmNvbT4KPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS1hYXJkdmFyay5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZh
cmsuYwo+ID4gPiBpbmRleCA0ODM0MTk4Y2M4NmIuLjRhOGE0YTg1MjJjYiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYwo+ID4gPiArKysgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCj4gPiA+IEBAIC0xODU2LDIwICsx
ODU2LDE5IEBAIHN0YXRpYyBpbnQgYWR2a19wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPiA+ICAJCXJldHVybiByZXQ7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+IC0J
cGNpZS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIGRldi0+
b2Zfbm9kZSwKPiA+ID4gLQkJCQkJCSAgICAgICAicmVzZXQtZ3Bpb3MiLCAwLAo+ID4gPiAtCQkJ
CQkJICAgICAgIEdQSU9EX09VVF9MT1csCj4gPiA+IC0JCQkJCQkgICAgICAgInBjaWUxLXJlc2V0
Iik7Cj4gPiA+ICsJcGNpZS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRl
diwgInJlc2V0IiwgR1BJT0RfT1VUX0xPVyk7Cj4gPiA+ICAJcmV0ID0gUFRSX0VSUl9PUl9aRVJP
KHBjaWUtPnJlc2V0X2dwaW8pOwo+ID4gPiAgCWlmIChyZXQpIHsKPiA+ID4gLQkJaWYgKHJldCA9
PSAtRU5PRU5UKSB7Cj4gPiA+IC0JCQlwY2llLT5yZXNldF9ncGlvID0gTlVMTDsKPiA+ID4gLQkJ
fSBlbHNlIHsKPiA+ID4gLQkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiA+ID4gLQkJCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgcmVzZXQtZ3BpbzogJWlcbiIsCj4gPiA+IC0JCQkJ
CXJldCk7Cj4gPiA+IC0JCQlyZXR1cm4gcmV0Owo+ID4gPiAtCQl9Cj4gPiA+ICsJCWlmIChyZXQg
IT0gLUVQUk9CRV9ERUZFUikKPiA+ID4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBy
ZXNldC1ncGlvOiAlaVxuIiwKPiA+ID4gKwkJCQlyZXQpOwo+ID4gPiArCQlyZXR1cm4gcmV0Owo+
ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldCA9IGdwaW9kX3NldF9jb25zdW1lcl9uYW1lKHBj
aWUtPnJlc2V0X2dwaW8sICJwY2llMS1yZXNldCIpOwo+ID4gPiArCWlmIChyZXQpIHsKPiA+ID4g
KwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IHJlc2V0IGdwaW8gbmFtZTogJWRcbiIsIHJl
dCk7Cj4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJcmV0ID0g
b2ZfcGNpX2dldF9tYXhfbGlua19zcGVlZChkZXYtPm9mX25vZGUpOwo+ID4gPiAKPiA+ID4gLS0g
Cj4gPiA+IGI0IDAuMTAuMC1kZXYtZmM5MjEKPiAKPiBUaGFua3MuCj4gCj4gLS0gCj4gRG1pdHJ5
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
