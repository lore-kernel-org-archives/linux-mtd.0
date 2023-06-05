Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D3FC7EE24
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+lvKwujmLoRK+dT2bA/463D+V2WPWYsW/AIZqEFM5I=; b=1DHvrGIVtx3WPP
	ZOrC+Baz+RhQfi823dxl+RMkEnzifw7WZ7naQGqTbw8onh5GGacl4LIAVl7QMQi9PlYSUkBIJiG5W
	PI7xLMGGf3MhUPI54pSHnTWX9dsJlRNgoy6GVbaj9YxhsF8dalskKfjTkj4aisD3NW7S6Lg3lYgxt
	92FuO7Tss9pLt70ksBqX8Et3waIDsAPxDd6+SuwIuaU9AGyzxvbMmVZoF6Em/ywWW0stsOGhz99ED
	PSdVShi7VmY+ZTobW+xePUH8eaSzB2cGfCVPmSvBBxU/SAMQN3unzHU9uAdYc6jEleScJG/u90ABg
	PAqeZ1qbKsNoiz6Q/+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Dbn-00GDw5-1m;
	Mon, 05 Jun 2023 17:03:07 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Dbi-00GDsx-0C;
	Mon, 05 Jun 2023 17:03:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E17AB5FD20;
	Mon,  5 Jun 2023 20:02:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685984575;
	bh=x+1qHC0v4b7AQgdBgAH1V4V1aQW5KU1oALYhRBo8Ldg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=szx0Wa+/T+P+pgW/v719qCHdQla1J6fdYiEPy8CnaFRJBfN6Y3fKTQGrfNeK9Emut
	 T0pIsV1dVy+ClkyXlrgP6FJseHwWB79w1jjkhF2UB2iLT6UecHcbcA8t7Y9AfGHUsR
	 71DM4KKQyUuJiVfsrnfJE4v9zL4yBcQGpRvw+VnZhLWYBX0tpKF71GzEY5jkZyTBtd
	 NXD/KNzwGWLCbGCePdgs54gNzIwb63POmEJNqQeEnEuLjBsg75cDNwmeUqG2auBPJ5
	 r+aqeq7WRtoAgU5Niyor+JjNCtHLx6Q511S70muXH/36ZhogpNNNoEFEKEfRfz3K5n
	 YQz/d5LnMK37A==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  5 Jun 2023 20:02:53 +0300 (MSK)
Message-ID: <c316961d-6021-1cb4-9ff4-22fe9ca5a18a@sberdevices.ru>
Date: Mon, 5 Jun 2023 19:58:02 +0300
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
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/05 13:50:00 #21435193
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_100302_797188_DFE9CED5 
X-CRM114-Status: GOOD (  26.31  )
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
YW5kKDB4NzApIGFuZCB3YWl0IGZvciB0aGUgaXJxIHdha2UgdXAgY29tcGxldGlvbi4KClRlY2hu
aWNhbGx5IG5vIHByb2JsZW0hIEkgY2FuIHVzZSBuZXcgUkJfSU5UIGluc3RlYWQgb2YgJ25hbmRf
c29mdF93YWl0cmR5KCknIGFzIHNvZnR3YXJlIGZhbGxiYWNrLCBhbmQgY3VycmVudGx5CmltcGxl
bWVudGVkIFJCX0lOVCBhcyBpbnRlcnJ1cHQgZHJpdmVuIHdheS4gV2hhdCBkbyBZb3UgdGhpbmsg
TWlxdWVsID8KCj4gCj4gVXNlICJuYW5kLXJiIiBpbiBkdHMgdG8gZGVjaWRlIG9sZCBSQl9JTlQo
cGh5c2ljYWwgUkIgd2lyZXMgaXMgbmVlZGVkKSBvciBuZXcgUkJfSU5UKG5vIHBoeXNpY2FsIFJC
IHdpcmVzKS4gdGhlIG5ldyBSQl9JTlQgY29tbWFuZCBkZWNpZGVzIHRoZSBSQjAgb3IgUkIxIGJ5
IHRoZSBwcmV2aW91cyBjb21tYW5kIHdpdGggY2UgYXJncy4KPiAKClNvIEkgY2FuIGltcGxlbWVu
dCAibmFuZC1yYiIgaW4gZHRzIGFzIGJvb2xlYW4gdmFsdWUgLSAiZmFsc2UiIG9yIG1pc3Npbmcg
bWVhbnMgdXNlICJubyBwaHlzaWNhbCBSQiB3aXJlcyIsICJ0cnVlIiAtIG1lYW5zIHVzZSAicGh5
c2ljYWwgUkIgd2lyZXMiID8KClRoYW5rcywgQXJzZW5peQoKPj4KPj4+IEFyc2VuaXksIGlmIHRo
ZSBhbnN3ZXIgdG8gbXkgYWJvdmUgcXVlc3Rpb24gaXMgbm8sIHRoZW4geW91IHNob3VsZAo+Pj4g
ZXhwZWN0IHRoZSBuYW5kLXJiIGFuZCByZWcgYXJyYXlzIHRvIGJlIGlkZW50aWNhbC4gSWYgdGhl
eSBhcmUgbm90LAo+Pj4gdGhlbiB5b3UgY2FuIHJldHVybiAtRUlOVkFMLgo+Pj4KPj4+IElmIHRo
ZSBuYW5kLXJiIHByb3BlcnR5IGlzIG1pc3NpbmcsIHRoZW4gZmFsbGJhY2sgdG8gc29mdHdhcmUg
d2FpdC4KPj4+Cj4+Pj4gMikgSSBjYW4ndCB0ZXN0IFJCIG1vZGUgLSBJIGRvbid0IGhhdmUgc3Vj
aCBkZXZpY2UgOigKPj4+Pgo+Pj4+IEFsc28gZm9yIGV4YW1wbGUgaW4gYXJhc2FuLW5hbmQtY29u
dHJvbGxlci5jIHBhcnNlZCAnbmFuZC1yYicgdmFsdWVzIGFyZSB1c2VkCj4+Pj4gaW4gY29udHJv
bGxlciBzcGVjaWZpYyByZWdpc3RlciBmb3Igd2FpdGluZyAoSSBndWVzcyBNZXNvbiBjb250cm9s
bGVyIGhhcyBzb21ldGhpbmcKPj4+PiBsaWtlIHRoYXQsIGJ1dCBJIGRvbid0IGhhdmUgZG9jKS4g
V2hpbGUgaW4gbWFydmVsbF9uYW5kLmMgaXQgbG9va3MgbGlrZSB0aGF0IHRoZXkgcGFyc2UKPj4+
PiAnbmFuZC1yYicgcHJvcGVydHksIGJ1dCBuZXZlciB1c2UgaXQuCj4+Pgo+Pj4gWWVzLCB0aGUg
bG9naWMgYXJvdW5kIHRoZSBzZWNvbmQgUkIgbGluZSAodGFraW5nIGNhcmUgb2YgQ1MxL0NTMykg
aXMKPj4+IHNsaWdodGx5IGJyb2tlbiBvciBhdCBsZWFzdCBiYWRseSBkb2N1bWVudGVkLCBhbmQg
dGh1cyBzaG91bGQgbm90IGJlCj4+PiB1c2VkLgo+Pj4KPj4+Pj4gSW4gYW55IGNhc2UgeW91J2xs
IG5lZWQgYSBkdC1iaW5kaW5nIHVwZGF0ZSB3aGljaCBtdXN0IGJlIGFja2VkIGJ5Cj4+Pj4+IGR0
LWJpbmRpbmcgbWFpbnRhaW5lcnMuCj4+Pj4KPj4+PiBZb3UgbWVhbiB0byBhZGQgdGhpcyBwcm9w
ZXJ0eSBkZXNjIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dp
YyxtZXNvbi1uYW5kLnlhbWwgPwo+Pj4KPj4+IFllcy4gSW4gYSBkZWRpY2F0ZWQgcGF0Y2guIFNv
bWV0aGluZyBhbG9uZyB0aGUgbGluZXM6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBuYW5kLXJi
OiB0cnVlCj4+Pgo+Pj4gaW5zaWRlIHRoZSBuYW5kIGNoaXAgb2JqZWN0IHNob3VsZCBiZSBmaW5l
LiBBbmQgZmxhZyB0aGUgY2hhbmdlIGFzIGEKPj4+IGZpeCBiZWNhdXNlIHdlIHNob3VsZCBoYXZl
IHVzZWQgYW5kIHBhcnNlZCB0aGlzIHByb3BlcnR5IHNpbmNlIHRoZQo+Pj4gYmVnaW5uaW5nLgo+
Pj4KPj4+IFRoYW5rcywKPj4+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
