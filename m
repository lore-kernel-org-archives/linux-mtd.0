Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F5C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 12:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3lW2fLJIm0M2x7xn2TwzixECR2gh8QpFigQ6qNtnaA=; b=WgWufg7/ZopPni
	r4cGbZDvZdNEY7l2HMx8TebbkizIRBBKffLJIF267A28/VjpvAQ8+Agyht+N/e7b7nbAxEMiE+LB/
	jqQhTvaVIWmuS9X4So4WWn3HavDfDG0f9/znS47MzJvcon8dyHvuNvXDpqsZkYuWXLYrfVFFEJtU8
	Y1fV8ERtS7f6XwwKN4YRelGoX8q6DlO4pHK1H0zozjkFIKiTU1/O6d3Yb3uw872kNC+pFlFbKPyFn
	EGtRU1Sp7LZr+PYMenHTfPck0Ll5cPa2tDDmdYoA/clh1jXiGVG6tUiYwP28TJsy7zHrC9LOZeY73
	tRyYJhJMCBpwakgzX5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFC0k-00000009eQY-44MW;
	Thu, 06 Jun 2024 12:14:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFC0i-00000009eP4-39fN
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 12:14:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-57a2f27090aso3361577a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717676065; x=1718280865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4eR0U8qSC2JKNbsIe9eb3BDB8OBTYCS7ARMldo+loA=;
        b=zYEto2fMyCheJ1fIidlvDAbBeYnTA9ffsFgDsgqWbruHWMENGLr+cRGl19eiBYptfv
         Q1xTnEreOHQiGmhgBfqYuoEHLtr7km8Qulcr4ovIZMYhEhhsdrmJBcIbut3KPSqBcJjG
         cfv92uW4KHboAJYBmyA8GfdA1WHERKsEXJleKhoXREDA0+HKmwsVdKVNFVQovAK/jdqh
         Pi7oHKOfk+y4lS7FUbapoy8Hw7x6HAp+RXi/27NSw3L3hkdIo9P305qQz5gHx3a1ZNa1
         GRzzuGaGgBIjTcW4rEFui/LRmt5yT8shYFe5oftlSNyJRONZSwtSNLfqTD73+3qNRo/Q
         jJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676065; x=1718280865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4eR0U8qSC2JKNbsIe9eb3BDB8OBTYCS7ARMldo+loA=;
        b=T/TPOdhDF3EPB4XLmAaHHBVBRnKleWGJdKlrLySAd0iNb+Mq3WavXXHBl8M5HRE9T5
         bwDuWrL6hHkMuoG99vl3qxV2+bq51Ds1xa0USqUqoTroltP6GRBnF1RNez7q6LRO1Cwu
         rGmI/kSxK/lsS628jP2C0sSYnqzPrqDFEv1xvSRx1I3JaoGFi/+u2XXfjcuHQETDCJPz
         Tt823qII45zyqpoy+7PqgSePSN53P/Hg0jID0EHpKwIIqbY4Xw9/PoVYTQpFbd7qlIWC
         DaPQddldopzjELT1Ld1Io/jauAiwVqOB5/4UJbPcRXBkrXOzIwY9hBc3+Dh08eZqJ6Jy
         F/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVye+TCB7svrxeYf9KdZ9Y8ANyGkSuPaUC/0aBQ9NV4n2ZmuG5bFVBuzPvKRpnQmvSqnIZtxYb6/mvTaCLRpnv5F/gIZ8yjcdLJdfMTOg==
X-Gm-Message-State: AOJu0YwzswH4E8W7Mc4So1xpV0XO+FJzZU9GNxrF/JvyJxwEIy33Kq95
	d7k33uo/Fd3uPuMcj7xSokSjW4X0p8MkBWWyeZAASj5a0LFQJ06NS5woFnT/TqE=
X-Google-Smtp-Source: AGHT+IEhF5VnQ6RnaPOF2ap3H2sWIDZtTNmy4OAYW9J+Tfvg4TS3Uau9eObHLN4jYtjlQ3mlVjyN6g==
X-Received: by 2002:a50:9eeb:0:b0:579:fb7e:2112 with SMTP id 4fb4d7f45d1cf-57aa5425c5cmr2134985a12.11.1717676065035;
        Thu, 06 Jun 2024 05:14:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d28bsm993500a12.19.2024.06.06.05.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:14:24 -0700 (PDT)
Message-ID: <1094fbfd-0ee7-430e-b62c-20764c1fbeec@linaro.org>
Date: Thu, 6 Jun 2024 13:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
To: Thorsten Scherer <T.Scherer@eckelmann.de>,
 Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Marek Vasut <marex@denx.de>, Imre Kaloz <kaloz@openwrt.org>,
 Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi <f.suligoi@asem.it>,
 kernel@pengutronix.de
References: <20240604074231.1874972-1-mwalle@kernel.org>
 <kl4ikwh4fpkhhlpneuujyk2j4a2byif7l27n7kgb4pm72hb4an@akhbc4jg6hyq>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <kl4ikwh4fpkhhlpneuujyk2j4a2byif7l27n7kgb4pm72hb4an@akhbc4jg6hyq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_051428_833733_5F722702 
X-CRM114-Status: GOOD (  29.10  )
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

CgpPbiA2LzUvMjQgMTQ6NTgsIFRob3JzdGVuIFNjaGVyZXIgd3JvdGU6Cj4gSGVsbG8sCj4gCgpI
aSEKCj4gaW4gdGhlIHBhc3QgSSBtb3JlIGFjdGl2ZWx5IHdvcmtlZCBvbiB0aGUgY2k0eDEwLiAg
VGhhdCBjaGFuZ2VkIGFmdGVyIHN3aXRjaGluZwo+IGRlcGFydG1lbnRzLiAgQW55d2F5LCBJIHRo
b3VnaHQgbWF5YmUgaXQncyB1c2VmdWwgaWYgSSBzaGFyZSBteSBwb2ludCBvZiB2aWV3Lgo+IAo+
IE9uIFR1ZSwgSnVuIDA0LCAyMDI0IGF0IDA5OjQyOjMxQU0gKzAyMDAsIE1pY2hhZWwgV2FsbGUg
d3JvdGU6Cj4+IFRoZXNlIGRldmljZXMgYXJlIG1vcmUgbGlrZSBhbiBBVDI1IGNvbXBhdGlibGUg
RUVQUk9NIGluc3RlYWQgb2YKPj4gZmxhc2hlcy4gTGlrZSBhbiBFRVBST00gdGhlIHVzZXIgZG9l
c24ndCBuZWVkIHRvIGV4cGxpY2l0bHkgZXJhc2UgdGhlCj4+IG1lbW9yeSwgbm9yIGFyZSB0aGVy
ZSBzZWN0b3JzIG9yIHBhZ2VzLiBUaHVzLCBpbnN0ZWFkIG9mIHRoZSBTUEktTk9SCj4+IChmbGFz
aCkgZHJpdmVyLCBvbmUgc2hvdWxkIGluc3RlYWQgdXNlIHRoZSBhdDI1IEVFUFJPTSBkcml2ZXIu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgo+
PiBDYzogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
PiAKPiBZb3UgY2Fubm90IHJlYWNoIFV3ZSB2aWEgdGhpcyBhZGRyZXNzIGFueW1vcmUuCj4gCj4g
SU1ITyBtaXNzaW5nIGluIHRoaXMgZGlzY3Vzc2lvbiBpcyAKPiAKPiAgICAga2VybmVsQHBlbmd1
dHJvbml4LmRlCj4gCj4gLCB3aGljaCBJIGFkZGVkIHRvIENDLgo+IAo+PiBDYzogVGhvcnN0ZW4g
U2NoZXJlciA8dC5zY2hlcmVyQGVja2VsbWFubi5kZT4KPj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPgo+PiBDYzogSW1yZSBLYWxveiA8a2Fsb3pAb3BlbndydC5vcmc+Cj4+IENjOiBB
bmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4+IENjOiBGbGF2aW8gU3VsaWdvaSA8Zi5zdWxp
Z29pQGFzZW0uaXQ+Cj4+IC0tLQo+PiBUaGUgcmVmZXJlbmNlZCBiaW5kaW5nIG9ubHkgc3VwcG9y
dHMgdGhlIHRydWUgQVQyNSBjb21wYXRpYmxlIEVFUFJPTXMKPj4gd2hlcmUgeW91IGhhdmUgdG8g
c3BlY2lmeSBhZGRpdGlvbmFsIHByb3BlcnRpZXMgbGlrZSBzaXplIGFuZCBwYWdlIHNpemUKPj4g
b3IgY3lwcmVzcyBGUkFNIGRldmljZXMgd2hlcmUgYWxsIHRoZSBwcm9wZXJ0aWVzIGFyZSBkaXNj
b3ZlcmVkIGJ5IHRoZQo+PiBkcml2ZXIuIEkgZG9uJ3QgaGF2ZSB0aGUgYWN0dWFsIGhhcmR3YXJl
LCB0aGVyZWZvcmUgSSBjYW4ndCB3b3JrIG9uIGEKPj4gcHJvcGVyIGRyaXZlciBhbmQgYmluZGlu
Zy4gQnV0IEkgcmVhbGx5IHdhbnQgdG8gZGVwcmVjYXRlIHRoZSB1c2Ugb2YKPj4gdGhlc2UgRUVQ
Uk9NIGxpa2UgZGV2aWNlcyBpbiBTUEktTk9SLiBTbyBhcyBhIGZpcnN0IHN0ZXAsIG1hcmsgdGhl
Cj4+IGRldmljZXMgaW4gdGhlIERUIGJpbmRpbmdzIGFzIGRlcHJlY2F0ZWQuCj4+Cj4+IFRoZXJl
IGFyZSB0aHJlZSBpbi10cmVlIHVzZXJzIG9mIHRoaXMuIEkgaG9wZSBJJ3ZlIENDZWQgYWxsIHRo
ZSByZWxldmFudAo+PiBwZW9wbGUuIFdpdGggdGhlIHN3aXRjaCB0byB0aGUgYXQyNSBkcml2ZXIg
YWxzbyBjb21lcyBhIHVzZXItc3BhY2UKPj4gZmFjaW5nIGNoYW5nZTogdGhlcmUgaXMgbm8gbW9y
ZSBNVEQgZGV2aWNlLiBJbnN0ZWFkIHRoZXJlIGlzIGFuICJlZXByb20iCj4+IGZpbGUgaW4gL3N5
cyBub3csIGp1c3QgbGlrZSBmb3IgZXZlcnkgb3RoZXIgRUVQUk9NLgo+IAo+IE15IHZhZ3VlIG1l
bW9yeSB0ZWxscyBtZSAoYXQgbGVhc3Qgc29tZSBvZikgdGhlIGRvbWFpbiBzcGVjaWZpYyBhcHBs
aWNhdGlvbnMKPiBydW5uaW5nIG9uIGNpNHgxMCByZWx5IG9uIE1URChibG9jaz8pIGRldmljZXMu
ICBTbyB0aGlzIGNoYW5nZSB3b3VsZCBicmVhawo+IHVzZXItc3BhY2UuCgppdCdzIGEgcG9zc2li
aWxpdHksIGluZGVlZC4gSSBhc3N1bWUgd2UgZG9uJ3Qga25vdyBmb3Igc3VyZSwgcmlnaHQ/Cj4g
Cj4+IE1hcmVrIGFscmVhZHkgZXhwcmVzc2VkLCB0aGF0IHRoZSBzcHMxIGR0cyBjYW4gbGlrZWx5
IGJlIHJlbW92ZWQKPj4gYWx0b2dldGhlci4gSSdkIGxpa2UgdG8gaGVhciBmcm9tIHRoZSBvdGhl
ciBib2FyZCBEVFMgbWFpbnRhaW5lcnMgaWYKPj4gdGhleSBzZWVtIHNvbWUgcHJvYmxlbXMgbW92
aW5nIHRvIHRoZSBFRVBST00gaW50ZXJmYWNlIC0gb3IgbWF5YmUgdGhhdAo+PiBkZXZpY2UgaXNu
J3QgdXNlZCBhdCBhbGwgYW55d2F5LiBTbyBpbiB0aGUgZW5kLCB3ZSBjYW4gaG9wZWZ1bGx5IG1v
dmUKCmlmIGl0J3Mgbm90IHVzZWQgYXQgYWxsIHdlIGNhbiByZW1vdmUgaXQgZW50aXJlbHkuCgo+
PiBhbGwgdGhlIHVzZXJzIG92ZXIgdG8gdGhlIGF0MjUgZHJpdmVyLgo+IAo+IFRoZSBjaTR4MTAg
aXMgc3RpbGwgYmVpbmcgdXNlZCBhbmQgc29sZC4gIFJpZ2h0IG5vdyBJIGRvIG5vdCBoYXZlIGEg
Y2xlYXIKPiB2aWV3IG9uIHRoZSBpbXBsaWNhdGlvbnMgb2YgbW92aW5nIHRvIHRoYXQgZHJpdmVy
LiAgSSdkIGxpa2UgdG8gaW52ZXN0IHNvbWUKPiB0aW1lIHRvIHNoYXJwZW4gbXkgcGljdHVyZSAo
b3IgZmluZCB0aGUgcGVyc29uIHRoYXQgY2xhaW1zIHJlc3BvbnNpYmlsaXR5KSwgYnV0Cj4gdGhp
cyB3aWxsIHByb3BhYmx5IG5vdCBoYXBwZW4gdGhpcyB3ZWVrLgo+IAoKaWYgaXQncyB1c2VkIHRo
ZW4gd2UgYXJlIGZvcmNlZCB0byBrZWVwIHRoZSBlbnRyeSBpbiBTUEkgTk9SIGZvcgpiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5LiBCdXQgd2UgY2FuIHN0aWxsIGRlcHJlY2F0ZSB0aGUgdXNlIGFuZCBm
b3JiaWQKbmV3IHN1cHBvcnQgaW4gU1BJIE5PUiB3aGlsZSBkaXJlY3RpbmcgdXNlcnMgdG8gdGhl
IG90aGVyIGRyaXZlci4KCj4gSG9wZSB0aGlzIGhlbHBzLgo+IApUaGFua3MhCnRhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
