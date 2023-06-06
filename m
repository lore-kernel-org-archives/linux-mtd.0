Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64E0C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESvSrkHLsyU1dR8FvgH80Bsv8V1j4EqJi6Go6TlOfrw=; b=gw7tZqeGIg9NvV
	mqHQV0K5B/KomjRafMHNt2Ek+yYr+7NttFnXsKpfmxcy9a73PvN+No7UX1bha15e+5XqU4HKFigO/
	kZKD+Y7Cj3Y5P72gQjlVtl/xnqu+3XmuInFSsRdQpVdW/SyX4yiOkdOTZ/FweYoH6v01YB6sp88Tp
	6HAKUcoFgXF0jKEERnwusWU47wiaYH28fA5ouRfOn0W3jLc72n7p3ij3DnM+dTzWwce9WLtHqRfka
	x0Ia7vrObno/Bdn5JOZ2fWK4j/hBc2MLMgIAPYJsn5ZYNl2mWKFm5wGanENTXDwESNy0yiJjT67WS
	jhBpRDihVw3OD+lgwsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VGc-001Voj-1I;
	Tue, 06 Jun 2023 11:54:26 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VGV-001Vk1-20;
	Tue, 06 Jun 2023 11:54:23 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7684D5FD1B;
	Tue,  6 Jun 2023 14:54:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686052453;
	bh=+ZZfKmQj6/YLWqBngVi0EkQ9ZjUSOi285N/+oCXONrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=GPR3O3h0XKEek0LjFeWDuk/NcU99TDjPaCUJr8vGd+9TYzv4aXmazirIoUziHUwKJ
	 jw9P8gLEmRrc6mo4AOSr7TM1SASrvscD0y3FxUGF8zk7wqg5f5Fa63sYpOD773WAr/
	 a0vIT8R0W4YbVOy7pIe+daG3svT7/AanFxKBdi0R3m5vqDLASRBFtbBqRcmX+rFAXo
	 U2rf1h3xupdXQYUoT22jo3eN+iY4PwONOSS9312hBVatTYXB9YpeIf63gb4I/RMb05
	 Wbe695HdSzT3DlUYbTBCDSkx9BCPwsK03FnjJ7frPleC4lmIR2zO7hkdudHPSR9T9F
	 3QZ5uG+enFNZA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 14:54:11 +0300 (MSK)
Message-ID: <5c98362c-1808-d7d2-bff8-c2f2f3ae0e89@sberdevices.ru>
Date: Tue, 6 Jun 2023 14:49:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
 <20230601100751.41c3ff0b@xps-13>
 <9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
 <20230605110546.6cb00a8d@xps-13>
 <2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
 <163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 07:40:00 #21442908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_045420_352482_0185DF55 
X-CRM114-Status: GOOD (  26.63  )
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

CgpPbiAwNS4wNi4yMDIzIDE2OjMwLCBMaWFuZyBZYW5nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ni81IDIxOjE5LCBMaWFuZyBZYW5nIHdyb3RlOgo+PiBIaSBNaXF1ZWwgYW5kIEFyc2VuaXksCj4+
Cj4+Cj4+IE9uIDIwMjMvNi81IDE3OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4+Pgo+Pj4gSGkgQXJzZW5peSwKPj4+Cj4+Pj4+PiBAQCAtMTQxMiw2ICsx
NDE5LDggQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+Pj4+
IMKgwqDCoCB9Cj4+Pj4+Pgo+Pj4+Pj4gK8KgIG5mYy0+dXNlX3BvbGxpbmcgPSBvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2woZGV2LT5vZl9ub2RlLCAicG9sbGluZyIpOwo+Pj4+Pgo+Pj4+PiBUaGlzIGlz
IGEgcHJvYmxlbS4gWW91IGNhbm5vdCBhZGQgYSBwb2xsaW5nIHByb3BlcnR5IGxpa2UgdGhhdC4K
Pj4+Pj4KPj4+Pj4gVGhlcmUgaXMgYWxyZWFkeSBhIG5hbmQtcmIgcHJvcGVydHkgd2hpY2ggaXMg
c3VwcG9zZWQgdG8gY2FycnkgaG93IGFyZQo+Pj4+PiB3aXJlZCB0aGUgUkIgbGluZXMuIEkgZG9u
J3Qgc2VlIGFueSBpbi10cmVlIHVzZXJzIG9mIHRoZSBjb21wYXRpYmxlcywgSQo+Pj4+PiBkb24n
dCBrbm93IGhvdyBhY2NlcHRhYmxlIGl0IGlzIHRvIGNvbnNpZGVyIHVzaW5nIHNvZnQgZmFsbGJh
Y2sgd2hlbgo+Pj4+PiB0aGlzIHByb3BlcnR5IGlzIG1pc3NpbmcsIG90aGVyd2lzZSB0YWtlIHRo
ZSB2YWx1ZXMgb2YgdGhlIHJiIGxpbmVzCj4+Pj4+IHByb3ZpZGVkIGluIHRoZSBEVCBhbmQgdXNl
ciBoYXJkd2FyZSBjb250cm9sLCBidXQgSSB3b3VsZCBkZWZpbml0ZWx5Cj4+Pj4+IHByZWZlciB0
aGF0Lgo+Pj4+Cj4+Pj4gSSBzZWUuIFNvIGkgbmVlZCB0byBpbXBsZW1lbnQgcHJvY2Vzc2luZyBv
ZiB0aGlzIHByb3BlcnR5IGhlcmU/IEFuZCBpZiBpdAo+Pj4+IGlzIG1pc3NlZCAtPiB1c2Ugc29m
dHdhcmUgd2FpdGluZy4gSSB0aGluayBpbnRlcmVzdGluZyB0aGluZyB3aWxsIGJlIHRoYXQ6Cj4+
Pj4KPj4+PiAxKSBFdmVuIHdpdGggc3VwcG9ydCBvZiB0aGlzIHByb3BlcnR5IGhlcmUsIEkgcmVh
bGx5IGRvbid0IGtub3cgaG93IHRvIHBhc3MKPj4+PiDCoMKgwqAgUkIgdmFsdWVzIHRvIHRoaXMg
Y29udHJvbGxlciAtIEkganVzdCBoYXZlIGRlZmluZSBmb3IgUkIgY29tbWFuZCBhbmQgdGhhdCdz
Cj4+Pj4gwqDCoMKgIGl0LiBJIGZvdW5kIHRoYXQgdGhpcyBwcm9wZXJ0eSBpcyBhbiBhcnJheSBv
ZiB1MzIgLSBJSVVDIGVhY2ggZWxlbWVudCBpcwo+Pj4+IMKgwqDCoCBSQiBwaW4gcGVyIGNoaXAu
IE1heSBiZSBpIG5lZWQgdG8gZGl2ZSBpbnRvIHRoZSBvbGQgdmVuZG9yJ3MgZHJpdmVyIHRvIGZp
bmQKPj4+PiDCoMKgwqAgaG93IHRvIHVzZSBSQiB2YWx1ZXMgKGFsdGhvdWdoIHRoaXMgZHJpdmVy
IHVzZXMgc29mdHdhcmUgd2FpdGluZyBzbyBJJ20gbm90Cj4+Pj4gwqDCoMKgIHN1cmUgdGhhdCBJ
J2xsIGZpbmQgc29tZXRoaW5nIGluIGl0KS4KPj4+Cj4+PiBMaWFuZywgY2FuIHlvdSBwbGVhc2Ug
Z2l2ZSB1c2UgdGhlIHJlbGV2YW50IGluZm9ybWF0aW9uIGhlcmU/IEhvdyBkbyB3ZQo+Pj4gdGFy
Z2V0IFJCMCBhbmQgUkIxPyBJdCBzZWVtcyBsaWtlIHlvdSB1c2UgdGhlIENTIGFzIG9ubHkgaW5m
b3JtYXRpb24KPj4+IGxpa2UgaWYgdGhlIFJCIGxpbmVzIHdoZXJlIGhhcmR3aXJlZCBpbnRlcm5h
bGx5IHRvIGEgQ1MuIENhbiB3ZSBpbnZlcnQKPj4+IHRoZSBsaW5lcyB3aXRoIGEgc3BlY2lmaWMg
Y29uZmlndXJhdGlvbj8KPj4KPj4gQ29udHJvbGxvciBoYXMgb25seSBvbmUgZXh0ZXJuYWwgUkIg
cGlubXV4IChOQU5EX1JCMCkuIGFsbCB0aGUgUkIgcGlucwo+PiBvZiBkaWZmZXJlbnQgQ0VzIG5l
ZWQgdG8gYmUgYm91bmQgaW50byBvbmUgd2lyZSBhbmQgY29ubmVjdCB3aXRoCj4+IE5BTkRfUkIw
IGlmIHdhbnQgdG8gdXNlIGNvbnRyb2xsZXIgcG9sbGluZyByYi4gdGhlIGN1cnJlbnQgb3BlcmF0
aW5nCj4+IENFIG9mIE5BTkQgaXMgZGVjaWRlZCB0byAiY2hpcF9zZWxlY3QiLCBvZiBjb3Vyc2Ug
Y29udHJvbGxlciBpbnRlcm5hbGx5IGhhcyBkaWZmZXJlbnQgbmZjIGNvbW1hbmRzIHRvIHJlZ2Nv
bml6ZSB3aGljaCBDZSdzIFJCIHNpZ25hbCBpcyBwb2xsaW5nLgo+Pgo+PiA8Jm5hbmRfcGlucz4g
aW4gZHRzL3lhbWwgc2hvdWxkIGluY2x1ZGUgdGhlIE5BTkRfUkIwIGlmIGhhcmR3YXJlIGNvbm5l
Y3RzLCBvciB1c2Ugc29mdHdhcmUgcG9sbGluZyBoZXJlLgo+Pgo+PiBAQXJzZW5peSwgc29ycnks
IGkgZG9uJ3QgdHJhdmVsIGFsbCB0aGUgaW5mb3JtYXRpb25zIHlldC4gYnV0IHdoeSBkb24ndCB5
b3UgdXNlIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgd2l0aCBpcnEgdGhhdCBpIHByb3ZpZGVkIGlu
IGFub3RoZXIgdGhyZWFkLiB0aGUgbmV3IFJCX0lOVCBjb21tYW5kIGRvZXNuJ3QgZGVwZW5kIG9u
IHRoZSBwaHlzaWNhbCBSQiB3aXJlcywgaXQgYWxzbyBzZW5kIHRoZSBSRUFEIHN0YXR1cyBjb21t
YW5kKDB4NzApIGFuZCB3YWl0IGZvciB0aGUgaXJxIHdha2UgdXAgY29tcGxldGlvbi4KPiAKPiBV
c2UgIm5hbmQtcmIiIGluIGR0cyB0byBkZWNpZGUgb2xkIFJCX0lOVChwaHlzaWNhbCBSQiB3aXJl
cyBpcyBuZWVkZWQpIG9yIG5ldyBSQl9JTlQobm8gcGh5c2ljYWwgUkIgd2lyZXMpLiB0aGUgbmV3
IFJCX0lOVCBjb21tYW5kIGRlY2lkZXMgdGhlIFJCMCBvciBSQjEgYnkgdGhlIHByZXZpb3VzIGNv
bW1hbmQgd2l0aCBjZSBhcmdzLgo+IAo+Pgo+Pj4gQXJzZW5peSwgaWYgdGhlIGFuc3dlciB0byBt
eSBhYm92ZSBxdWVzdGlvbiBpcyBubywgdGhlbiB5b3Ugc2hvdWxkCj4+PiBleHBlY3QgdGhlIG5h
bmQtcmIgYW5kIHJlZyBhcnJheXMgdG8gYmUgaWRlbnRpY2FsLiBJZiB0aGV5IGFyZSBub3QsCj4+
PiB0aGVuIHlvdSBjYW4gcmV0dXJuIC1FSU5WQUwuCj4+Pgo+Pj4gSWYgdGhlIG5hbmQtcmIgcHJv
cGVydHkgaXMgbWlzc2luZywgdGhlbiBmYWxsYmFjayB0byBzb2Z0d2FyZSB3YWl0Lgo+Pj4KPj4+
PiAyKSBJIGNhbid0IHRlc3QgUkIgbW9kZSAtIEkgZG9uJ3QgaGF2ZSBzdWNoIGRldmljZSA6KAo+
Pj4+Cj4+Pj4gQWxzbyBmb3IgZXhhbXBsZSBpbiBhcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgcGFy
c2VkICduYW5kLXJiJyB2YWx1ZXMgYXJlIHVzZWQKPj4+PiBpbiBjb250cm9sbGVyIHNwZWNpZmlj
IHJlZ2lzdGVyIGZvciB3YWl0aW5nIChJIGd1ZXNzIE1lc29uIGNvbnRyb2xsZXIgaGFzIHNvbWV0
aGluZwo+Pj4+IGxpa2UgdGhhdCwgYnV0IEkgZG9uJ3QgaGF2ZSBkb2MpLiBXaGlsZSBpbiBtYXJ2
ZWxsX25hbmQuYyBpdCBsb29rcyBsaWtlIHRoYXQgdGhleSBwYXJzZQo+Pj4+ICduYW5kLXJiJyBw
cm9wZXJ0eSwgYnV0IG5ldmVyIHVzZSBpdC4KPj4+Cj4+PiBZZXMsIHRoZSBsb2dpYyBhcm91bmQg
dGhlIHNlY29uZCBSQiBsaW5lICh0YWtpbmcgY2FyZSBvZiBDUzEvQ1MzKSBpcwo+Pj4gc2xpZ2h0
bHkgYnJva2VuIG9yIGF0IGxlYXN0IGJhZGx5IGRvY3VtZW50ZWQsIGFuZCB0aHVzIHNob3VsZCBu
b3QgYmUKPj4+IHVzZWQuCj4+Pgo+Pj4+PiBJbiBhbnkgY2FzZSB5b3UnbGwgbmVlZCBhIGR0LWJp
bmRpbmcgdXBkYXRlIHdoaWNoIG11c3QgYmUgYWNrZWQgYnkKPj4+Pj4gZHQtYmluZGluZyBtYWlu
dGFpbmVycy4KPj4+Pgo+Pj4+IFlvdSBtZWFuIHRvIGFkZCB0aGlzIHByb3BlcnR5IGRlc2MgdG8g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQu
eWFtbCA/Cj4+Pgo+Pj4gWWVzLiBJbiBhIGRlZGljYXRlZCBwYXRjaC4gU29tZXRoaW5nIGFsb25n
IHRoZSBsaW5lczoKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIG5hbmQtcmI6IHRydWUKPj4+Cj4+
PiBpbnNpZGUgdGhlIG5hbmQgY2hpcCBvYmplY3Qgc2hvdWxkIGJlIGZpbmUuIEFuZCBmbGFnIHRo
ZSBjaGFuZ2UgYXMgYQo+Pj4gZml4IGJlY2F1c2Ugd2Ugc2hvdWxkIGhhdmUgdXNlZCBhbmQgcGFy
c2VkIHRoaXMgcHJvcGVydHkgc2luY2UgdGhlCj4+PiBiZWdpbm5pbmcuCgpNaXF1ZWwsCgpTbWFs
bCByZW1hcmssIGRvIHdlIHJlYWxseSBuZWVkIHRvIGFkZCB0aGlzICduYW5kLXJiJyB0byB0aGUg
Y2hpcCBvYmplY3QsIGFzIExpYW5nIHNhaWQsCnRoYXQgdGhlcmUgaXMgb25seSBvbmUgUkIgd2ly
ZSAoZS5nLiBvbmx5IG9uZSBvciBub3RoaW5nKT8gTWF5YmUgZm9yIE1lc29uIEkgY2FuIGFkZCBp
dCB0byB0aGUKbWVzb24gY29udHJvbGxlciBzdHJ1Y3R1cmU/CgpUaGFua3MsIEFyc2VuaXkKCj4+
Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
