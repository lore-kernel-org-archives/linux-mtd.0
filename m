Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B7C7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 08:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1R2uIOEGXWgp7UM1oOy5auPnryH/XKRwcmalnHdyX0=; b=OBg3k38sP9KNbI
	i8TkIF8KcIfVdOV6DglZjBzOOij4F+flZAmouRwEPDsb9vmgUd9l6ki2BCfo6VTkqOQWq1zc5vgsA
	YtGXnJ6qy8JP1fuO2MXbfmqiuVem73WRRtfQlPznUuSKaaQd2nMRuWXIrbVf0+wY1SBpgkykbDoT4
	HQUofnLCcnLwEy+PdZCvL1nTi4sYbcmNMyqRVRpojL73so5g6inJs5/B5Bh/4oBxYF4K1rZCvS6r5
	XaRGY2SKBd6imTmkZbVXvj8zWHRMznazuQbiw0/QmwOFa9V/h3gdEWtT3ZHlefLme/QOBfn0r4G2i
	XIoUieQxwlY+0KtoxwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q65To-00EhS4-19;
	Mon, 05 Jun 2023 08:22:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q65Tl-00EhQl-2J
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 08:22:19 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685953334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wA0xU7QmwEZWzRDuo37VFnIbazTtYFeQ5ft/6O7tFKk=;
	b=oHGUBOnufDUl9EY24vegbo6x61xjnkj3wFdOBSek+WML6KVMwtJN6Caij3VaA6FX9OATB7
	jIx9/QYt7HMfrqLb+Q8CUhA4LHI0+uOzOvRDpEu97YzjQQ4uC34iDnqQTNKhmsm5GdZA4S
	SKPWdnI/Rc/z3Wpc2KKkc/t3vo7ZwHb8TEuvtmYOS0B8sP7YSpwtv9NNdzXE3opSsnQcJ5
	K/AFGgoV9AD4FLSSCMkuG9zNbFyJX8ODvg7tTgtBnN0E004tjPIuh5vkg0oZvYxxX1i8eL
	JPlOXgWdh8Jp7jMxYYlAVhEd53u1eX5usy2fdCShFsf8AT4TM2is5RbU4lfhkA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 595AAE0004;
	Mon,  5 Jun 2023 08:22:10 +0000 (UTC)
Date: Mon, 5 Jun 2023 10:22:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: andy.shevchenko@gmail.com
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linus
 Walleij <linus.walleij@linaro.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Stephen Boyd <sboyd@kernel.org>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Jean Delvare <jdelvare@suse.de>,
 Liang Yang <liang.yang@amlogic.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Michael Peters <mpeters@embeddedts.com>, Kris
 Bahnsen <kris@embeddedts.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 24/43] mtd: nand: add support for ts72xx
Message-ID: <20230605102208.4e6d26f3@xps-13>
In-Reply-To: <ZHugqa697eGqHnr4@surfacebook>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	<20230601054549.10843-6-nikita.shubin@maquefel.me>
	<ZHugqa697eGqHnr4@surfacebook>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_012218_018678_CFC16E35 
X-CRM114-Status: GOOD (  24.15  )
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

SGkgYW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbSwKCmFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20g
d3JvdGUgb24gU2F0LCAzIEp1biAyMDIzIDIzOjIwOjU3ICswMzAwOgoKPiBUaHUsIEp1biAwMSwg
MjAyMyBhdCAwODo0NToyOUFNICswMzAwLCBOaWtpdGEgU2h1YmluIGtpcmpvaXR0aToKPiA+IFRl
Y2hub2xvZ2ljIFN5c3RlbXMgaGFzIGl0J3Mgb3duIG5hbmQgY29udHJvbGxlciBpbXBsZW1lbnRh
dGlvbiBpbiBDUExELgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgVFMtNzJY
WCBib2FyZHMgZmFtaWx5LiAgCj4gCj4gVXNlIGltcGVyYXRpdmUgbW9kZSwgdGhpcyBpcyBkb2N1
bWVudGVkIGluIHRoZSBTdWJtaXR0aW5nIFBhdGNoZXMsCj4gCj4gLi4uCj4gCj4gPiArLyoKPiA+
ICsgKiBUZWNobm9sb2dpYyBTeXN0ZW1zIFRTNzJ4eCBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyCj4g
PiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgTmlraXRhIFNodWJpbiA8bmlraXRhLnNo
dWJpbkBtYXF1ZWZlbC5tZT4KPiA+ICsgKgo+ID4gKyAqIGRlcml2ZWQ6IHBsYXRfbmFuZC5jICAK
PiAKPiBEZXJpdmVkIGZyb206Cj4gCj4gPiArICogIEF1dGhvcjogVml0YWx5IFdvb2wgPHZpdGFs
eXdvb2xAZ21haWwuY29tPgo+ID4gKyAqLyAgCj4gCj4gLi4uCj4gCj4gPiArI2luY2x1ZGUgPGxp
bnV4L2Vyci5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ID4gKyNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4gIAo+IAo+ICsgQmxhbmsgbGluZT8KPiAKPiA+ICsjaW5j
bHVkZSA8bGludXgvbXRkL210ZC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tdGQvcGxhdG5hbmQu
aD4gIAo+IAo+IC4uLgo+IAo+ID4gKwkJYml0cyA9IHJlYWRiKGFkZHIpICYgfjB4MDc7ICAKPiAK
PiBHRU5NQVNLKCk/Cj4gCj4gLi4uCj4gCj4gPiArCWFkZHIgKz0gKDEgPDwgVFM3MlhYX05BTkRf
QlVTWV9BRERSX0xJTkUpOyAgCj4gCj4gQklUKCkgPwo+IAo+IC4uLgo+IAo+ID4gKwlyZXR1cm4g
ISEocmVhZGIoYWRkcikgJiAweDIwKTsgIAo+IAo+IEJJVCgpID8KPiAKPiAuLi4KPiAKPiA+ICsJ
c3RydWN0IHRzNzJ4eF9uYW5kX2RhdGEgKmRhdGE7Cj4gPiArCXN0cnVjdCBtdGRfaW5mbyAqbXRk
Owo+ID4gKwlpbnQgZXJyID0gMDsgIAo+IAo+IFJlZHVuZGFudCBhc3NpZ25tZW50Lgo+IAo+ID4g
KwkvKiBBbGxvY2F0ZSBtZW1vcnkgZm9yIHRoZSBkZXZpY2Ugc3RydWN0dXJlIChhbmQgemVybyBp
dCkgKi8KPiA+ICsJZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2Yoc3RydWN0
IHRzNzJ4eF9uYW5kX2RhdGEpLCAgCj4gCj4gc2l6ZW9mKCpkYXRhKSBhbmQgbWFrZSBpdCBhIHNp
bmdsZSBsaW5lLgo+IAo+ID4gKwkJCSAgICBHRlBfS0VSTkVMKTsKPiA+ICsJaWYgKCFkYXRhKQo+
ID4gKwkJcmV0dXJuIC1FTk9NRU07ICAKPiAKPiAuLi4KPiAKPiA+ICsJbmFuZF9zZXRfZmxhc2hf
bm9kZSgmZGF0YS0+Y2hpcCwgcGRldi0+ZGV2Lm9mX25vZGUpOyAgCj4gCj4gSG1tLi4uIHdvbmRl
cmluZyB3aHkgdGhpcyB1c2VzIE9GIG5vZGUgaW5zdGVhZCBvZiBmd25vZGUuLi4gQnV0IG9rYXks
IHRoaXMgaXMKPiBxdWVzdGlvbiB0byB0aGUgc3Vic3lzdGVtIG1haW50YW5lcnMuCj4gCj4gCj4g
PiArCWVyciA9IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIobXRkLCBOVUxMLCBOVUxMLAo+ID4g
KwkJCQkJTlVMTCwgMCk7ICAKPiAKPiBUaGVyZSBpcyBwbGVudHkgb2Ygc3BhY2Ugb24gdGhlIHBy
ZXZpb3VzIGxpbmUuCj4gCj4gPiArICAKPiAKPiBSZWR1bmRhbnQgYmxhbmsgbGluZS4KPiAKPiA+
ICsJaWYgKCFlcnIpCj4gPiArCQlyZXR1cm4gZXJyOwo+ID4gKwo+ID4gKwluYW5kX2NsZWFudXAo
JmRhdGEtPmNoaXApOwo+ID4gKwo+ID4gKwlyZXR1cm4gMDsgIAo+IAo+IFRoaXMgc2VlbXMgYXQg
bGVhc3Qgd2VpcmQgYW5kIHJhdGhlciBicm9rZW4uCgpZZWFoLCBJIG1hZGUgdGhlIHNhbWUgY29t
bWVudC4KCj4gVG8gbWUgaXQgbG9va3MgbGlrZQo+IAo+IAlpZiAoZXJyKSB7Cj4gCQluYW5kX2Ns
ZWFudXAoJmRhdGEtPmNoaXApOwo+IAkJcmV0dXJuIGVycjsKPiAJfQo+IAo+IAlyZXR1cm4gMDsK
PiAKPiBoYXMgdG8gYmUgaGVyZS4KPiAKPiA+ICt9ICAKPiAKPiAuLi4KPiAKPiA+ICsJcmV0ID0g
bXRkX2RldmljZV91bnJlZ2lzdGVyKG5hbmRfdG9fbXRkKGNoaXApKTsKPiA+ICsJV0FSTl9PTihy
ZXQpOyAgCj4gCj4gV0FSTl9PTigpPyEgV2h5PwoKVGhpcyBpcyBhY3R1YWxseSBzb21ldGhpbmcg
dGhhdCBpcyBleHBlY3RlZCBmb3Igbm93LCB0aGUgZGV2aWNlCnVucmVnaXN0cmF0aW9uIHNob3Vs
ZCBub3QgZmFpbCBhbmQgdGhlIHJldHVybiB2YWx1ZSBzaG91bGQgbm90IGJlIHVzZWQKdG8gc2tp
cCBvdGhlciBjbGVhbnVwcy4gSSBjYW5ub3QgZmluZCB0aGUgb3JpZ2luYWwgZGlzY3Vzc2lvbiBh
bnltb3JlCmJ1dCB3ZSBkZWNpZGVkIHRvIHVzZSB0aGF0IGNvbnN0cnVjdGlvbi4gV2UgbWlnaHQg
YWN0dWFsbHkgc3dpdGNoIHRoYXQKb25lIHRvIHZvaWQgc29tZWRheS4KCj4gCj4gPiArCW5hbmRf
Y2xlYW51cChjaGlwKTsKPiA+ICt9ICAKPiAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
