Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C59C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJzc8WqGXPxiChtnMRNnZ4jSZPTa8Z025wHhyfIbGZw=; b=hbsUhgErqeGsjL
	TvJpv/t3Db8my9zUlOAfHxrK9EEp37eUnrLG1sO+/507xlE9jbxlTsMu2RKOT55wmBwt/OO6GFmCg
	qWVRbHgTgAAOrEOuhh5uU2BySUB4WpHtoAVCs7cFnTyBMV4H7WiidvlxY/yb61FgxHu+gSSMcOGfb
	LCdhD2vi1ANX/1sOzYlXqBuiN1SCHIHQQ4MEqPaprrvHJ45uGNCwC0vP72Ht3Se2ilM9YxXljb9LC
	d3gO08I8Oq9ahW6+RyWht+Itt8H6FQVo8sOrgA0DmhQmkjSNvTObPpTilD00fpv3i/Pvd67BuVGAg
	+FAAWIRmci/4bg7EzP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFX3b-00DXT0-1d;
	Tue, 19 Dec 2023 10:10:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFX3X-00DXRq-1F;
	Tue, 19 Dec 2023 10:10:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50e239c49d0so4076403e87.2;
        Tue, 19 Dec 2023 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702980627; x=1703585427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foo624gNhP6B2vck+wUHJKrF0+6Qr10dtJaccKBfZho=;
        b=T7CyZzemQqI4MpewbPGjOqbDnia+lUsiqqK1Jmf+VSc2zTV1w8u0wm1A7HRHTrN0t4
         DFNUL/rObJssy5D1znoRTWclFx9HqrDcJLZhu0U1w+DtRzbyIpnbRFCvo4BDlFIcx8s9
         rIqltSsOCvPp+azEImm1VR2Hb2Vn7kU5XerD8xroJ+yqCfoEwG+UJRqRnFiGgTrEiUJh
         hc0UhaLTRkSfmtJJky5ajquAXKYDXHQsdm/6mZrRNHbuQn1kcg7yOVBW3j6zODmEjjU8
         Z0wu5eufyFDb/3zjG3uKbFQMe/YZm9dnHJ5l3uMJUaXPSSvd1fxkNvOPEi3ZaLV0lFWh
         Aqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702980627; x=1703585427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foo624gNhP6B2vck+wUHJKrF0+6Qr10dtJaccKBfZho=;
        b=KLsVc1OmoK467RI9Chxf1688tSDsKEvo8D7Q97/u6Dd54bzQmXnlGTELrZI7FH6hTP
         WOooRJoL6JYnHbV6SEChP0LNs4w5p45YYQTKNBc9yGGCdaNqg1+ayxdzEQ1sMEJsEwTN
         0w+t80dI8TvZtCcUg3WtVeabmA/ymBIORrcao7Hm66D9a9u/y6BlrAMxkurMqbDgS2B7
         SFBx8aqDSIWHnU9/+PdxPJkx1toLiyq5ox5pbUxHJDz/CBB7Ycwc3pEKZUr1XA+2yYGm
         WwYnuywJ0wMeHkElPDC0suPLp/MnjQ+NBI+58PJMJIpX2cW5+G14PelC8yhZw/vnYTNb
         H6Xg==
X-Gm-Message-State: AOJu0Yysg8Vc7pIHMrBomyABSu+BjDFj97v7bQ37AHeFo5TpUvQ9d1bX
	/2xqdLyoWbhPjPn32UdSHtU=
X-Google-Smtp-Source: AGHT+IFkyroAQ7mjySdfpPBmGhrbDdeXu9asUFKibcKPVPcwXXuDN6r+1MuCVaByUN3BYEg18wn7JQ==
X-Received: by 2002:ac2:5b9b:0:b0:50c:c7d:9ef2 with SMTP id o27-20020ac25b9b000000b0050c0c7d9ef2mr8094238lfn.131.1702980622319;
        Tue, 19 Dec 2023 02:10:22 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id cn24-20020a0564020cb800b005532f5abaedsm2550873edb.72.2023.12.19.02.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 02:10:21 -0800 (PST)
Message-ID: <b56399f5-03fe-4bf1-b9dc-1bd81ef76e12@gmail.com>
Date: Tue, 19 Dec 2023 11:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] nvmem: layouts: add U-Boot env layout
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231218133722.16150-1-zajec5@gmail.com>
 <20231218133722.16150-4-zajec5@gmail.com> <20231218152116.59d59bad@xps-13>
 <13bc621c-5fcb-4710-912c-06e3e80d7337@gmail.com>
 <20231219085517.4b6ec4fc@xps-13>
 <ba8abaf6-6f16-4742-a3ea-ad00d4151698@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ba8abaf6-6f16-4742-a3ea-ad00d4151698@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_021031_451425_0FF74050 
X-CRM114-Status: GOOD (  31.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTkuMTIuMjAyMyAxMDo1NSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDE5LjEyLjIw
MjMgMDg6NTUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIFJhZmHFgiwKPj4KPj4gemFqZWM1
QGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDE4IERlYyAyMDIzIDIzOjEwOjIwICswMTAwOgo+Pgo+
Pj4gT24gMTguMTIuMjAyMyAxNToyMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+PiBIaSBSYWZh
xYIsCj4+Pj4KPj4+PiB6YWplYzVAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMTggRGVjIDIwMjMg
MTQ6Mzc6MjIgKzAxMDA6Cj4+Pj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCBtb3ZlcyBhbGwgZ2VuZXJpYyAoTlZNRU0gZGV2
aWNlcyBpbmRlcGVuZGVudCkgY29kZSBmcm9tIE5WTUVNCj4+Pj4+IGRldmljZSBkcml2ZXIgdG8g
TlZNRU0gbGF5b3V0IGRyaXZlci4gVGhlbiBpdCBhZGRzIGEgc2ltcGxlIE5WTUVNIGxheW91dAo+
Pj4+PiBjb2RlIG9uIHRvcCBvZiBpdC4KPj4+Pj4KPj4+Pj4gVGhhbmtzIHRvIHByb3BlciBsYXlv
dXQgaXQncyBwb3NzaWJsZSB0byBzdXBwb3J0IFUtQm9vdCBlbnYgZGF0YSBzdG9yZWQKPj4+Pj4g
b24gYW55IGtpbmQgb2YgTlZNRU0gZGV2aWNlLgo+Pj4+Pgo+Pj4+PiBGb3IgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSB3aXRoIG9sZCBEVCBiaW5kaW5ncyB3ZSBuZWVkIHRvIGtlZXAgb2xkCj4+Pj4+
IE5WTUVNIGRldmljZSBkcml2ZXIgZnVuY3Rpb25hbC4gVG8gYXZvaWQgY29kZSBkdXBsaWNhdGlv
biBhIHBhcnNpbmcKPj4+Pj4gZnVuY3Rpb24gaXMgZXhwb3J0ZWQgYW5kIHJldXNlZCBpbiBpdC4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IEkgaGF2ZSBhIGNvdXBsZSBvZiBjb21tZW50cyBhYm91
dCB0aGUgb3JpZ2luYWwgZHJpdmVyIHdoaWNoIGdldHMKPj4+PiBjb3B5LXBhc3RlZCBpbiB0aGUg
bmV3IGxheW91dCBkcml2ZXIsIG1heWJlIHlvdSBjb3VsZCBjbGVhbiB0aGVzZQo+Pj4+ICh0aGUg
bWVtb3J5IGxlYWsgc2hvdWxkIGJlIGZpeGVkIGJlZm9yZSB0aGUgbWlncmF0aW9uIHNvIGl0IGNh
biBiZQo+Pj4+IGJhY2twb3J0ZWQgZWFzaWx5LCB0aGUgb3RoZXJzIGFyZSBqdXN0IHN0eWxlIHNv
IGl0IGNhbiBiZSBkb25lIGFmdGVyLCBJCj4+Pj4gZG9uJ3QgbWluZCkuCj4+Pj4KPj4+PiAuLi4K
Pj4+Pj4gK2ludCB1X2Jvb3RfZW52X3BhcnNlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG52
bWVtX2RldmljZSAqbnZtZW0sCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSB1
X2Jvb3RfZW52X2Zvcm1hdCBmb3JtYXQpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgc2l6ZV90IGNy
YzMyX2RhdGFfb2Zmc2V0Owo+Pj4+PiArwqDCoMKgIHNpemVfdCBjcmMzMl9kYXRhX2xlbjsKPj4+
Pj4gK8KgwqDCoCBzaXplX3QgY3JjMzJfb2Zmc2V0Owo+Pj4+PiArwqDCoMKgIHNpemVfdCBkYXRh
X29mZnNldDsKPj4+Pj4gK8KgwqDCoCBzaXplX3QgZGF0YV9sZW47Cj4+Pj4+ICvCoMKgwqAgc2l6
ZV90IGRldl9zaXplOwo+Pj4+PiArwqDCoMKgIHVpbnQzMl90IGNyYzMyOwo+Pj4+PiArwqDCoMKg
IHVpbnQzMl90IGNhbGM7Cj4+Pj4+ICvCoMKgwqAgdWludDhfdCAqYnVmOwo+Pj4+PiArwqDCoMKg
IGludCBieXRlczsKPj4+Pj4gK8KgwqDCoCBpbnQgZXJyOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAg
ZGV2X3NpemUgPSBudm1lbV9kZXZfc2l6ZShudm1lbSk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBi
dWYgPSBrY2FsbG9jKDEsIGRldl9zaXplLCBHRlBfS0VSTkVMKTsKPj4+Pgo+Pj4+IE91dCBvZiBj
dXJpb3NpdHksIHdoeSBrY2FsbG9jKDEsLi4uKSByYXRoZXIgdGhhbiBremFsbG9jKCkgPwo+Pj4K
Pj4+IEkgdXNlZCBrY2FsbG9jKCkgaW5pdGlhbGx5IGFzIEkgZGlkbid0IG5lZWQgYnVmZmVyIHRv
IGJlIHplcm9lZC4KPj4KPj4gSSB0aGluayBrY2FsbG9jKCkgaW5pdGlhbGl6ZXMgdGhlIG1lbW9y
eSB0byB6ZXJvLgo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2luY2x1ZGUvbGludXgvc2xhYi5oI0w2NTkKPj4KPj4gSWYgeW91IGRvbid0IG5lZWQgaXQg
eW91IGNhbiBzd2l0Y2ggdG8ga21hbGxvYygpIGluc3RlYWQsIEkgZG9uJ3QgbWluZCwKPj4gYnV0
IGtjYWxsb2MoKSBpcyBtZWFudCB0byBiZSB1c2VkIHdpdGggYXJyYXlzLCBJIGRvbid0IHNlZSB0
aGUgcG9pbnQgb2YKPj4gdXNpbmcga2NhbGxvYygpIGluIHRoaXMgY2FzZS4KPj4KPj4+Cj4+PiBJ
IHNlZSB0aGF0IG1lbW9yeS1hbGxvY2F0aW9uLnJzdCBob3dldmVyIHNheXM6Cj4+PiDCoCA+IEFu
ZCwgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSBpdCdzIGJlc3QgdG8gdXNlIHJvdXRpbmVzIHRoYXQg
c2V0IG1lbW9yeSB0byB6ZXJvLCBsaWtlIGt6YWxsb2MoKS4KPj4+Cj4+PiBJdCdzIHByb2JhYmx5
IGNsb3NlIHRvIHplcm8gY29zdCB0byB6ZXJvIHRoYXQgYnVmZmVyIHNvIGl0IGNvdWxkIGJlIGt6
YWxsb2MoKS4KPj4+Cj4+Pgo+Pj4+PiArwqDCoMKgIGlmICghYnVmKSB7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBlcnIgPSAtRU5PTUVNOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfb3V0
Owo+Pj4+Cj4+Pj4gV2UgY291bGQgZGlyZWN0bHkgcmV0dXJuIEVOT01FTSBoZXJlIEkgZ3Vlc3Mu
Cj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgYnl0ZXMgPSBudm1lbV9kZXZp
Y2VfcmVhZChudm1lbSwgMCwgZGV2X3NpemUsIGJ1Zik7Cj4+Pj4+ICvCoMKgwqAgaWYgKGJ5dGVz
IDwgMCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBieXRlczsKPj4+Pj4gK8KgwqDCoCBl
bHNlIGlmIChieXRlcyAhPSBkZXZfc2l6ZSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlPOwo+Pj4+Cj4+Pj4gRG9uJ3Qgd2UgbmVlZCB0byBmcmVlIGJ1ZiBpbiB0aGUgYWJvdmUgY2Fz
ZXM/Cj4+Pj4+ICvCoMKgwqAgc3dpdGNoIChmb3JtYXQpIHsKPj4+Pj4gK8KgwqDCoCBjYXNlIFVf
Qk9PVF9GT1JNQVRfU0lOR0xFOgo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY3JjMzJfb2Zmc2V0ID0g
b2Zmc2V0b2Yoc3RydWN0IHVfYm9vdF9lbnZfaW1hZ2Vfc2luZ2xlLCBjcmMzMik7Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBjcmMzMl9kYXRhX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3Rf
ZW52X2ltYWdlX3NpbmdsZSwgZGF0YSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkYXRhX29mZnNl
dCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3NpbmdsZSwgZGF0YSk7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gK8KgwqDCoCBjYXNlIFVfQk9PVF9GT1JNQVRf
UkVEVU5EQU5UOgo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY3JjMzJfb2Zmc2V0ID0gb2Zmc2V0b2Yo
c3RydWN0IHVfYm9vdF9lbnZfaW1hZ2VfcmVkdW5kYW50LCBjcmMzMik7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBjcmMzMl9kYXRhX29mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2lt
YWdlX3JlZHVuZGFudCwgZGF0YSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkYXRhX29mZnNldCA9
IG9mZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX3JlZHVuZGFudCwgZGF0YSk7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4gK8KgwqDCoCBjYXNlIFVfQk9PVF9GT1JNQVRf
QlJPQURDT006Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjcmMzMl9vZmZzZXQgPSBvZmZzZXRvZihz
dHJ1Y3QgdV9ib290X2Vudl9pbWFnZV9icm9hZGNvbSwgY3JjMzIpOwo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgY3JjMzJfZGF0YV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgdV9ib290X2Vudl9pbWFn
ZV9icm9hZGNvbSwgZGF0YSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkYXRhX29mZnNldCA9IG9m
ZnNldG9mKHN0cnVjdCB1X2Jvb3RfZW52X2ltYWdlX2Jyb2FkY29tLCBkYXRhKTsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoCBjcmMzMiA9
IGxlMzJfdG9fY3B1KCooX19sZTMyICopKGJ1ZiArIGNyYzMyX29mZnNldCkpOwo+Pj4+Cj4+Pj4g
TG9va3MgYSBiaXQgY29udm9sdXRlZCwgYW55IGNoYW5jZXMgd2UgY2FuIHVzZSBpbnRlcm1lZGlh
dGUgdmFyaWFibGVzCj4+Pj4gdG8gaGVscCBkZWNpcGhlciB0aGlzPwo+Pj4+PiArwqDCoMKgIGNy
YzMyX2RhdGFfbGVuID0gZGV2X3NpemUgLSBjcmMzMl9kYXRhX29mZnNldDsKPj4+Pj4gK8KgwqDC
oCBkYXRhX2xlbiA9IGRldl9zaXplIC0gZGF0YV9vZmZzZXQ7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDC
oCBjYWxjID0gY3JjMzIofjAsIGJ1ZiArIGNyYzMyX2RhdGFfb2Zmc2V0LCBjcmMzMl9kYXRhX2xl
bikgXiB+MEw7Cj4+Pj4+ICvCoMKgwqAgaWYgKGNhbGMgIT0gY3JjMzIpIHsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiSW52YWxpZCBjYWxjdWxhdGVkIENSQzMyOiAweCUwOHgg
KGV4cGVjdGVkOiAweCUwOHgpXG4iLCBjYWxjLCBjcmMzMik7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBlcnIgPSAtRUlOVkFMOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfa2ZyZWU7Cj4+
Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgYnVmW2Rldl9zaXplIC0gMV0gPSAn
XDAnOwo+Pj4+PiArwqDCoMKgIGVyciA9IHVfYm9vdF9lbnZfcGFyc2VfY2VsbHMoZGV2LCBudm1l
bSwgYnVmLCBkYXRhX29mZnNldCwgZGF0YV9sZW4pOwo+Pj4+PiArwqDCoMKgIGlmIChlcnIpCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhZGQgY2VsbHM6ICVk
XG4iLCBlcnIpOwo+Pj4+Cj4+Pj4gUGxlYXNlIGRyb3AgdGhpcyBlcnJvciBtZXNzYWdlLCB0aGUg
b25seSByZWFzb24gZm9yIHdoaWNoIHRoZSBmdW5jdGlvbgo+Pj4+IGNhbGwgd291bGQgZmFpbCBp
cyBhcHBhcmVudGx5IGFuIEVOT01FTSBjYXNlLgo+Pj4+PiArCj4+Pj4+ICtlcnJfa2ZyZWU6Cj4+
Pj4+ICvCoMKgwqAga2ZyZWUoYnVmKTsKPj4+Pj4gK2Vycl9vdXQ6Cj4+Pj4+ICvCoMKgwqAgcmV0
dXJuIGVycjsKPj4+Pj4gK30KPj4+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKHVfYm9vdF9lbnZfcGFy
c2UpOwo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgaW50IHVfYm9vdF9lbnZfYWRkX2NlbGxzKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW0pCj4+Pj4+ICt7Cj4+Pj4+
ICvCoMKgwqAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7Cj4+Pj4+ICvCoMKgwqAg
c3RydWN0IGRldmljZV9ub2RlICpsYXlvdXRfbnA7Cj4+Pj4+ICvCoMKgwqAgZW51bSB1X2Jvb3Rf
ZW52X2Zvcm1hdCBmb3JtYXQ7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBsYXlvdXRfbnAgPSBvZl9u
dm1lbV9sYXlvdXRfZ2V0X2NvbnRhaW5lcihudm1lbSk7Cj4+Pj4+ICvCoMKgwqAgaWYgKCFsYXlv
dXRfbnApCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0VOVDsKPj4+Pj4gKwo+Pj4+
PiArwqDCoMKgIG1hdGNoID0gb2ZfbWF0Y2hfbm9kZSh1X2Jvb3RfZW52X29mX21hdGNoX3RhYmxl
LCBsYXlvdXRfbnApOwo+Pj4+PiArwqDCoMKgIGlmICghbWF0Y2gpCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVOT0VOVDsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGZvcm1hdCA9ICh1aW50
cHRyX3QpbWF0Y2gtPmRhdGE7Cj4+Pj4KPj4+PiBJbiB0aGUgY29yZSB0aGVyZSBpcyBjdXJyZW50
bHkgYW4gdW51c2VkIGhlbHBlciBjYWxsZWQKPj4+PiBudm1lbV9sYXlvdXRfZ2V0X21hdGNoX2Rh
dGEoKSB3aGljaCBkb2VzIHRoYXQuIEkgdGhpbmsgdGhlIG9yaWdpbmFsCj4+Pj4gaW50ZW50IG9m
IHRoaXMgZnVuY3Rpb24gd2FzIHRvIGJlIHVzZWQgaW4gdGhpcyBkcml2ZXIsIHNvIGRlcGVuZGlu
ZyBvbgo+Pj4+IHlvdXIgcHJlZmVyZW5jZSwgY2FuIHlvdSBwbGVhc2UgZWl0aGVyIHVzZSBpdCBv
ciByZW1vdmUgaXQ/Cj4+Pgo+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCBudm1lbV9sYXlvdXRfZ2V0
X21hdGNoX2RhdGEoKSB1c2VzOgo+Pj4gbGF5b3V0LT5kZXYuZHJpdmVyCj4+Cj4+IEknbSBzdXJw
cmlzZWQgLmRyaXZlciBpcyB1bnNldC4gV2VsbCBhbnl3YXksIHBsZWFzZSBlaXRoZXIgZml4IHRo
ZSBjb3JlCj4+IGhlbHBlciBhbmQgdXNlIGl0IG9yIGRyb3AgdGhlIGNvcmUgaGVscGVyLCBiZWNh
dXNlIHdlIGhhdmUgbm8gdXNlciBmb3IKPj4gaXQgb3RoZXJ3aXNlPwo+IAo+IEkgYmVsaWV2ZSBp
dCdzIGJlY2F1c2Ugb2YgYSB2ZXJ5IG1pbmltYWxpc3RpYyAibnZtZW1fYnVzX3R5cGUiIGJ1cwo+
IGltcGxlbWVudGF0aW9uLgoKU2NyYXRjaCB0aGF0LCBJIHdhcyBsb29raW5nIGF0ICJudm1lbV9i
dXNfdHlwZSIgaW5zdGVhZCBvZgoibnZtZW1fbGF5b3V0X2J1c190eXBlIi4gSSdsbCBzZWUgaWYg
SSBjYW4gZGVidWcgdGhhdC4KCgo+ICBGcm9tIGEgcXVpY2sgbG9vayBpdCBzZWVtcyB0aGF0IGRl
ZmF1bHQgZXhwZWN0ZWQgRk9SV0FSRC10cmFjZSBpczoKPiBkcml2ZXJfcmVnaXN0ZXIoKQo+IGJ1
c19hZGRfZHJpdmVyKCkKPiBkcml2ZXJfYXR0YWNoKCkKPiBfX2RyaXZlcl9hdHRhY2goKQo+IGRy
aXZlcl9wcm9iZV9kZXZpY2UoKQo+IF9fZHJpdmVyX3Byb2JlX2RldmljZSgpCj4gcmVhbGx5X3By
b2JlKCkKPiAKPiBJdCdzIHJlYWxseV9wcm9iZSgpIHRoYXQgc2VlbXMgdG8gc2V0IGRldi0+ZHJp
dmVyIHBvaW50ZXIuCj4gCj4gCj4+PiBJdCBkb2Vzbid0IHdvcmsgd2l0aCBsYXlvdXRzIGRyaXZl
ciAoc2luY2UgcmVmYWN0b3Jpbmc/KSBhcyBkcml2ZXIgaXMKPj4+IE5VTEwuIFRoYXQgcmVzdWx0
cyBpbiBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0cnlpbmcgdG8gcmVhY2gKPj4+IG9m
X21hdGNoX3RhYmxlLgo+Pj4KPj4+IFRoYXQgaXMgd2h5IEkgdXNlZCB1X2Jvb3RfZW52X29mX21h
dGNoX3RhYmxlIGRpcmVjdGx5Lgo+Pj4KPj4+IElmIHlvdSBrbm93IGhvdyB0byBmaXggbnZtZW1f
bGF5b3V0X2dldF9tYXRjaF9kYXRhKCkgdGhhdCB3b3VsZCBiZQo+Pj4gZ3JlYXQuIERvIHdlIG5l
ZWQgZHJpdmVyX3JlZ2lzdGVyKCkgc29tZXdoZXJlIGluIE5WTUVNIGNvcmU/Cj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
