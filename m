Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2725C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5brkNY+IKdFQcwTqFuFPLZ6EhDIUCPT0zu9UH//cFg=; b=iAnGbc4Wq5hu4f
	2cutTaWD5ienNdSiQMhcpN54M6xiaA8haHdBpxDHY8GaY0YaQbGIqnVoHY6pn4DbaN5ojuhn82Cfu
	qHkXkGNrLb3w8fFymDuIoIPs4HQvp3wQadpfd6ZzE5mM+FZtT9/ZLZZhoH7Cm/Lu5lfdgjPeBtElk
	q4evMfjzawF8ut8Fg1iiP+/YzqzDjkVX0rB+ChfwYFFE8uPQFuK8WtsqaWAvc34JGaXQ2cR6WLpHL
	xoYgGfWZEAaACW5tjeLPuP9xS3aPzVfs7ryQkCXORGrByM1u8HH886zWEO/j1aw1N0xHrEhwhADs0
	Sm+9kG2sKnJQrAfF+TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm7T-00HW4X-IB; Thu, 17 Nov 2022 21:08:23 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm7C-00HVxl-9w; Thu, 17 Nov 2022 21:08:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4969620007;
	Thu, 17 Nov 2022 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72JrUM6NacHh18cxNPJTokOPFIy2MlvUmUZu6AVg77s=;
	b=kQ3WnKEHtW817TTGo/51w1BLV9fElm+d4PRny19l0Xo5WVvRKUWbYa4RLUCeb4hzAu+blU
	gN78c5WiYd88yo78Tac1K8UgLdjF8sGEUg2eG4K4KIGZ2aSd/NCisT3pEqKgpi8MG9t8wo
	Mhed7VoKwoPF1Ad6rnk8zscQKUda7EVdabBo89uHsVUfKLNbVRCzBabKqvqOG3TKdkeI5N
	elXTmNOrt8pOHvUy7n2mYZBmGVFue71mi4Gp0X7blRdSkQQj+FNRIx2l1Hm3E/1dFZjljQ
	ITXz8XlIez/SUSB6b7UDZFkg18YUByW5VovCJRgF+828mYPwuo2FHFq7f7zwSg==
Date: Thu, 17 Nov 2022 22:07:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <20221117220756.7a1bf734@xps-13>
In-Reply-To: <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
	<20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130806_802727_B24D0BE3 
X-CRM114-Status: GOOD (  15.81  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIFRo
dSwgMTcgTm92IDIwMjIgMTM6Mzg6NDIgKzAxMDA6Cgo+IFRoZSBEZXZpY2V0cmVlIGJpbmRpbmdz
IGRvY3VtZW50IGRvZXMgbm90IGhhdmUgdG8gc2F5IGluIHRoZSB0aXRsZSB0aGF0Cj4gaXQgaXMg
YSAiYmluZGluZyIsIGJ1dCBpbnN0ZWFkIGp1c3QgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLiAgRm9y
IHNoYXJlZAo+IChyZS11c2FibGUpIHNjaGVtYXMsIG5hbWUgdGhlbSBhbGwgYXMgImNvbW1vbiBw
cm9wZXJ0aWVzIi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9xY29tLGdjYy55YW1sICAgICAgICAgfCAyICstCj4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvZG1hLWNvbW1vbi55YW1sICAgICAgICAg
fCAyICstCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvZG1hLWNvbnRy
b2xsZXIueWFtbCAgICAgfCA0ICsrLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2RtYS9kbWEtcm91dGVyLnlhbWwgICAgICAgICB8IDQgKystLQo+ICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hZGMueWFtbCAgICAgICAgICAgIHwgMiArLQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2UtZGV2aWNlcy55
YW1sICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
dmlkZW8taW50ZXJmYWNlcy55YW1sIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbW1jL21tYy1jb250cm9sbGVyLnlhbWwgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY2hpcC55YW1sICAgICAgICAgIHwgMiAr
LQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxl
ci55YW1sICAgIHwgMiArLQo+ICAuLi4vYmluZGluZ3MvbmV0L2JsdWV0b290aC9ibHVldG9vdGgt
Y29udHJvbGxlci55YW1sICAgICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L2Nhbi9jYW4tY29udHJvbGxlci55YW1sIHwgMiArLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvZXRoZXJuZXQtY29udHJvbGxlci55YW1sICAgICAgICAgIHwg
MiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2V0aGVybmV0LXBo
eS55YW1sICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L21kaW8ueWFtbCAgICAgICAgICAgICAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvb3BwL29wcC12Mi1iYXNlLnlhbWwgICAgICAgIHwgMiArLQo+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9yZXNldC9yZXN0YXJ0LWhhbmRsZXIueWFtbCAgICAg
IHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy55YW1s
ICAgICAgICAgICAgICAgIHwgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZHdp
cmUvc291bmR3aXJlLWNvbnRyb2xsZXIueWFtbCAgIHwgMiArLQo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwgICAgIHwgMiArLQo+ICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvd2F0Y2hkb2cueWFtbCAg
ICAgIHwgMiArLQo+ICAyMSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyMyBkZWxl
dGlvbnMoLSkKPiAKClsuLi5dCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL25hbmQtY2hpcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9uYW5kLWNoaXAueWFtbAo+IGluZGV4IDk3YWMzYTNmYmI1Mi4uMjBiMTk1
ZWY5YjcwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvbmFuZC1jaGlwLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL25hbmQtY2hpcC55YW1sCj4gQEAgLTQsNyArNCw3IEBACj4gICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL25hbmQtY2hpcC55YW1sIwo+ICAkc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiAgCj4gLXRpdGxlOiBO
QU5EIENoaXAgYW5kIE5BTkQgQ29udHJvbGxlciBHZW5lcmljIEJpbmRpbmcKPiArdGl0bGU6IE5B
TkQgQ2hpcCBhbmQgTkFORCBDb250cm9sbGVyIGNvbW1vbiBwcm9wZXJ0aWVzCgpJIG9ubHkgc2Vl
IHRoaXMgbm93IGJ1dCB0aGUgdGl0bGUgc2hvdWxkIGJlCgoJIk5BTkQgY2hpcCBjb21tb24gcHJv
cGVydGllcyIKCj4gIAo+ICBtYWludGFpbmVyczoKPiAgICAtIE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sCj4gaW5kZXggMzU5YTAx
NWQ0ZTVhLi5hMDA0ZWZjNDI4NDIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiBAQCAtNCw3
ICs0LDcgQEAKPiAgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbmFuZC1j
b250cm9sbGVyLnlhbWwjCj4gICRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+ICAKPiAtdGl0bGU6IE5BTkQgQ2hpcCBhbmQgTkFORCBDb250cm9s
bGVyIEdlbmVyaWMgQmluZGluZwo+ICt0aXRsZTogTkFORCBDaGlwIGFuZCBOQU5EIENvbnRyb2xs
ZXIgY29tbW9uIHByb3BlcnRpZXMKCkFuZCBoZXJlIGp1c3QgIk5BTkQgY29udHJvbGxlci4uLiIK
Ck9mIGNvdXJzZSB0aGUgb3JpZ2luYWwgcHVycG9zZSBvZiB5b3VyIHNlcmllcyBpcyBtb3JlIHRv
IGNsZWFuIHRob3NlCnRpdGxlcyByYXRoZXIgdGhhbiBmaXhpbmcgdGhlbSBhbmQgaWYgeW91IGRp
c2FncmVlIEkgYW0gZmluZSBkb2luZyBpdApteXNlbGYgYXNpZGUsIGJ1dCBpZiB5b3UgY291bGQg
YXQgdGhlIHNhbWUgdGltZSBtYWtlIHRoZSB0aXRsZSBtb3JlCmFjY3VyYXRlIHRoYXQgd291bGQg
YmUgcGVyZmVjdC4KCkVpdGhlciB3YXlzOgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+CgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
