Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F333C7EE2C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQYWDwEIYBsWTN1gR97OZfQXr4F+7xgPT1nh2cYWi7Y=; b=ta6WsOxeYTtUTc
	LkaZd7oEsNWpEG0M8iNJHLVcy4dPmSxUSBywym4BcVGfy2BQnXMc9P6IEMuiY6cWIt9Oxk3SGwS9R
	3q8heqySilkAFupjNkc8Ci/AAsPf7DrO2uAVw+h1Zx3FH0wj6l+e6Vc6wuBuwlDfAJhIciQr+w1Tt
	bcq9IbO3vu7P60zbOFLgh5QhyMU0D/A2I/VyNCfwAZOEdHwLPvF/B//OdG1L/E11zUQZcGBOZ9DK9
	jsb7t9Nymw46X6GJVFHLiZ8Ft3jdXssTTJvPaZEyFUor8mtdS1q16QQRJ1w7GKanceaDPqCSySvBd
	nR5KHqPr04VjzGyQmCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SOM-000t4X-24;
	Tue, 06 Jun 2023 08:50:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SOJ-000t3V-2q;
	Tue, 06 Jun 2023 08:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L+3OnyXoHiD3efaXF4rWnuZtnIfzpMfSELR5xR2su0g=; b=C747xTP3oGBgjFDE7UdCjZlDYd
	PIdRBqknF+Wu1Q1YQwTDAztwQ/HSgLj+tNO82eVcN9lxifWeAkMqlhk5VWNgkM9waBnwh7TYxqjMF
	0GgCVKQ3SdmnleMZdeNDoHFxN8yN/wVcm/LiaYdLx7y+OzKAsY4p1cWaa0juG6ZBb1QxN8fDiwdWl
	6vckCY3sCG/ZoYcPMTzZYrKqN+HzmJ73FTwrxtEplO/d2se1m1QJXt3TQpt8pvUfxnnxHzliLyd+G
	5mpPpTrUAP3LqWCgojTmMAjOMl5QdPKooedcYvkMawhHoNK0yrWZI04LOeqZcjsJEmXrJG9HfKWKI
	Z9HTAeeg==;
Received: from mx.sberdevices.ru ([45.89.227.171])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RNT-004268-2A;
	Tue, 06 Jun 2023 07:45:20 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E05195FD26;
	Tue,  6 Jun 2023 10:45:13 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686037513;
	bh=L+3OnyXoHiD3efaXF4rWnuZtnIfzpMfSELR5xR2su0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=GwkBenIIDrW9Z/RBsEE9kxzlOvJ8L51nkB94/God97gAzSG+uhSQjiPA/7ZNBzsCB
	 mY27jT+762pjHigjZfQKMJ6MGNrkEVhZx5QaNJ++sVAdqMxxtIGymYH3DhMI6LoqEA
	 AKMxF6igScB7nsw29JISQG3Q/v3Cn0DAREzaCXhKWGCCQJErijtbjpxsoeZIkdUYwr
	 YPlvqKskLC2Cfm35dxe5fXVAOd+yjl3m7J308OOFo1oUIUvuu3dacgmm5oDDlAylYA
	 1lIryJeQb6O1Zn5bkdqSKM/i3xoezfNYpQTuqQidKoo2yeGXISSTsJntyKZ23hPRax
	 0KTweYRaurNAw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 10:45:13 +0300 (MSK)
Message-ID: <19eeb588-f909-8aad-b68c-bcfea8f2e926@sberdevices.ru>
Date: Tue, 6 Jun 2023 10:40:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
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
 <c316961d-6021-1cb4-9ff4-22fe9ca5a18a@sberdevices.ru>
 <20230606090344.3aca96c8@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230606090344.3aca96c8@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 04:28:00 #21442352
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_084516_180211_B1147E42 
X-CRM114-Status: GOOD (  28.70  )
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

CgpPbiAwNi4wNi4yMDIzIDEwOjAzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgNSBKdW4gMjAyMyAx
OTo1ODowMiArMDMwMDoKPiAKPj4gT24gMDUuMDYuMjAyMyAxNjozMCwgTGlhbmcgWWFuZyB3cm90
ZToKPj4+Cj4+Pgo+Pj4gT24gMjAyMy82LzUgMjE6MTksIExpYW5nIFlhbmcgd3JvdGU6ICAKPj4+
PiBIaSBNaXF1ZWwgYW5kIEFyc2VuaXksCj4+Pj4KPj4+Pgo+Pj4+IE9uIDIwMjMvNi81IDE3OjA1
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pgo+
Pj4+PiBIaSBBcnNlbml5LAo+Pj4+PiAgCj4+Pj4+Pj4+IEBAIC0xNDEyLDYgKzE0MTksOCBAQCBz
dGF0aWMgaW50IG1lc29uX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+IMKgwqDC
oCB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICvCoCBuZmMtPnVzZV9wb2xsaW5nID0gb2ZfcHJvcGVydHlf
cmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgInBvbGxpbmciKTsgIAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhp
cyBpcyBhIHByb2JsZW0uIFlvdSBjYW5ub3QgYWRkIGEgcG9sbGluZyBwcm9wZXJ0eSBsaWtlIHRo
YXQuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGVyZSBpcyBhbHJlYWR5IGEgbmFuZC1yYiBwcm9wZXJ0eSB3
aGljaCBpcyBzdXBwb3NlZCB0byBjYXJyeSBob3cgYXJlCj4+Pj4+Pj4gd2lyZWQgdGhlIFJCIGxp
bmVzLiBJIGRvbid0IHNlZSBhbnkgaW4tdHJlZSB1c2VycyBvZiB0aGUgY29tcGF0aWJsZXMsIEkK
Pj4+Pj4+PiBkb24ndCBrbm93IGhvdyBhY2NlcHRhYmxlIGl0IGlzIHRvIGNvbnNpZGVyIHVzaW5n
IHNvZnQgZmFsbGJhY2sgd2hlbgo+Pj4+Pj4+IHRoaXMgcHJvcGVydHkgaXMgbWlzc2luZywgb3Ro
ZXJ3aXNlIHRha2UgdGhlIHZhbHVlcyBvZiB0aGUgcmIgbGluZXMKPj4+Pj4+PiBwcm92aWRlZCBp
biB0aGUgRFQgYW5kIHVzZXIgaGFyZHdhcmUgY29udHJvbCwgYnV0IEkgd291bGQgZGVmaW5pdGVs
eQo+Pj4+Pj4+IHByZWZlciB0aGF0LiAgCj4+Pj4+Pgo+Pj4+Pj4gSSBzZWUuIFNvIGkgbmVlZCB0
byBpbXBsZW1lbnQgcHJvY2Vzc2luZyBvZiB0aGlzIHByb3BlcnR5IGhlcmU/IEFuZCBpZiBpdAo+
Pj4+Pj4gaXMgbWlzc2VkIC0+IHVzZSBzb2Z0d2FyZSB3YWl0aW5nLiBJIHRoaW5rIGludGVyZXN0
aW5nIHRoaW5nIHdpbGwgYmUgdGhhdDoKPj4+Pj4+Cj4+Pj4+PiAxKSBFdmVuIHdpdGggc3VwcG9y
dCBvZiB0aGlzIHByb3BlcnR5IGhlcmUsIEkgcmVhbGx5IGRvbid0IGtub3cgaG93IHRvIHBhc3MK
Pj4+Pj4+IMKgwqDCoCBSQiB2YWx1ZXMgdG8gdGhpcyBjb250cm9sbGVyIC0gSSBqdXN0IGhhdmUg
ZGVmaW5lIGZvciBSQiBjb21tYW5kIGFuZCB0aGF0J3MKPj4+Pj4+IMKgwqDCoCBpdC4gSSBmb3Vu
ZCB0aGF0IHRoaXMgcHJvcGVydHkgaXMgYW4gYXJyYXkgb2YgdTMyIC0gSUlVQyBlYWNoIGVsZW1l
bnQgaXMKPj4+Pj4+IMKgwqDCoCBSQiBwaW4gcGVyIGNoaXAuIE1heSBiZSBpIG5lZWQgdG8gZGl2
ZSBpbnRvIHRoZSBvbGQgdmVuZG9yJ3MgZHJpdmVyIHRvIGZpbmQKPj4+Pj4+IMKgwqDCoCBob3cg
dG8gdXNlIFJCIHZhbHVlcyAoYWx0aG91Z2ggdGhpcyBkcml2ZXIgdXNlcyBzb2Z0d2FyZSB3YWl0
aW5nIHNvIEknbSBub3QKPj4+Pj4+IMKgwqDCoCBzdXJlIHRoYXQgSSdsbCBmaW5kIHNvbWV0aGlu
ZyBpbiBpdCkuICAKPj4+Pj4KPj4+Pj4gTGlhbmcsIGNhbiB5b3UgcGxlYXNlIGdpdmUgdXNlIHRo
ZSByZWxldmFudCBpbmZvcm1hdGlvbiBoZXJlPyBIb3cgZG8gd2UKPj4+Pj4gdGFyZ2V0IFJCMCBh
bmQgUkIxPyBJdCBzZWVtcyBsaWtlIHlvdSB1c2UgdGhlIENTIGFzIG9ubHkgaW5mb3JtYXRpb24K
Pj4+Pj4gbGlrZSBpZiB0aGUgUkIgbGluZXMgd2hlcmUgaGFyZHdpcmVkIGludGVybmFsbHkgdG8g
YSBDUy4gQ2FuIHdlIGludmVydAo+Pj4+PiB0aGUgbGluZXMgd2l0aCBhIHNwZWNpZmljIGNvbmZp
Z3VyYXRpb24/ICAKPj4+Pgo+Pj4+IENvbnRyb2xsb3IgaGFzIG9ubHkgb25lIGV4dGVybmFsIFJC
IHBpbm11eCAoTkFORF9SQjApLiBhbGwgdGhlIFJCIHBpbnMKPj4+PiBvZiBkaWZmZXJlbnQgQ0Vz
IG5lZWQgdG8gYmUgYm91bmQgaW50byBvbmUgd2lyZSBhbmQgY29ubmVjdCB3aXRoCj4+Pj4gTkFO
RF9SQjAgaWYgd2FudCB0byB1c2UgY29udHJvbGxlciBwb2xsaW5nIHJiLiB0aGUgY3VycmVudCBv
cGVyYXRpbmcKPj4+PiBDRSBvZiBOQU5EIGlzIGRlY2lkZWQgdG8gImNoaXBfc2VsZWN0Iiwgb2Yg
Y291cnNlIGNvbnRyb2xsZXIgaW50ZXJuYWxseSBoYXMgZGlmZmVyZW50IG5mYyBjb21tYW5kcyB0
byByZWdjb25pemUgd2hpY2ggQ2UncyBSQiBzaWduYWwgaXMgcG9sbGluZy4KPj4+Pgo+Pj4+IDwm
bmFuZF9waW5zPiBpbiBkdHMveWFtbCBzaG91bGQgaW5jbHVkZSB0aGUgTkFORF9SQjAgaWYgaGFy
ZHdhcmUgY29ubmVjdHMsIG9yIHVzZSBzb2Z0d2FyZSBwb2xsaW5nIGhlcmUuCj4+Pj4KPj4+PiBA
QXJzZW5peSwgc29ycnksIGkgZG9uJ3QgdHJhdmVsIGFsbCB0aGUgaW5mb3JtYXRpb25zIHlldC4g
YnV0IHdoeSBkb24ndCB5b3UgdXNlIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgd2l0aCBpcnEgdGhh
dCBpIHByb3ZpZGVkIGluIGFub3RoZXIgdGhyZWFkLiB0aGUgbmV3IFJCX0lOVCBjb21tYW5kIGRv
ZXNuJ3QgZGVwZW5kIG9uIHRoZSBwaHlzaWNhbCBSQiB3aXJlcywgaXQgYWxzbyBzZW5kIHRoZSBS
RUFEIHN0YXR1cyBjb21tYW5kKDB4NzApIGFuZCB3YWl0IGZvciB0aGUgaXJxIHdha2UgdXAgY29t
cGxldGlvbi4gIAo+Pgo+PiBUZWNobmljYWxseSBubyBwcm9ibGVtISBJIGNhbiB1c2UgbmV3IFJC
X0lOVCBpbnN0ZWFkIG9mICduYW5kX3NvZnRfd2FpdHJkeSgpJyBhcyBzb2Z0d2FyZSBmYWxsYmFj
aywgYW5kIGN1cnJlbnRseQo+PiBpbXBsZW1lbnRlZCBSQl9JTlQgYXMgaW50ZXJydXB0IGRyaXZl
biB3YXkuIFdoYXQgZG8gWW91IHRoaW5rIE1pcXVlbCA/Cj4+Cj4+Pgo+Pj4gVXNlICJuYW5kLXJi
IiBpbiBkdHMgdG8gZGVjaWRlIG9sZCBSQl9JTlQocGh5c2ljYWwgUkIgd2lyZXMgaXMgbmVlZGVk
KSBvciBuZXcgUkJfSU5UKG5vIHBoeXNpY2FsIFJCIHdpcmVzKS4gdGhlIG5ldyBSQl9JTlQgY29t
bWFuZCBkZWNpZGVzIHRoZSBSQjAgb3IgUkIxIGJ5IHRoZSBwcmV2aW91cyBjb21tYW5kIHdpdGgg
Y2UgYXJncy4KPj4+ICAgCj4+Cj4+IFNvIEkgY2FuIGltcGxlbWVudCAibmFuZC1yYiIgaW4gZHRz
IGFzIGJvb2xlYW4gdmFsdWUgLSAiZmFsc2UiIG9yIG1pc3NpbmcgbWVhbnMgdXNlICJubyBwaHlz
aWNhbCBSQiB3aXJlcyIsICJ0cnVlIiAtIG1lYW5zIHVzZSAicGh5c2ljYWwgUkIgd2lyZXMiID8K
PiAKPiBBcyBsb25nIGFzIGl0IHdvcmtzIGFuZCBkb2VzIG5vdCBjb250YWluIGFueSBleHRyZW1l
bHkgc3RyYW5nZSBSRUFEMCBvcgo+IFJFQURfU1RBVFVTIGluIHRoZSBtaWRkbGUgb2Ygbm90aGlu
ZywgSSdtIGZpbmUsIHRha2UgdGhlIHNpbXBsZXN0Cj4gYXBwcm9hY2ggd2hpY2ggd2lsbCB3b3Jr
IGZvciBhbGwuCgoiZXh0cmVtZXRlbHkgc3RyYW5nZSBSRUFEMCIgaXMgbWV0aG9kIHdoaWNoIHVz
ZXMgU1RBVFVTLCBpbnRlcnJ1cHQsIFJFQUQwPyBUaGlzIG1ldGhvZCB3YXMKZGVzY3JpYmVkIGJ5
IExpYW5nLgoKQW5kIFlvdSBtZWFuIHRvIHVzZSB0aGUgZm9sbG93aW5nIGxvZ2ljOgppZiAoIm5h
bmQtcmIiID09IHRydWUpCiAgICB1c2UgUkJfSU5UIHdoaWNoIHJlcXVpcmVzIHdpcmUKZWxzZQog
ICAgdXNlICduYW5kX3NvZnRfd2FpdHJkeSgpJwoKPwoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+Pgo+
PiBUaGFua3MsIEFyc2VuaXkKPj4KPj4+PiAgCj4+Pj4+IEFyc2VuaXksIGlmIHRoZSBhbnN3ZXIg
dG8gbXkgYWJvdmUgcXVlc3Rpb24gaXMgbm8sIHRoZW4geW91IHNob3VsZAo+Pj4+PiBleHBlY3Qg
dGhlIG5hbmQtcmIgYW5kIHJlZyBhcnJheXMgdG8gYmUgaWRlbnRpY2FsLiBJZiB0aGV5IGFyZSBu
b3QsCj4+Pj4+IHRoZW4geW91IGNhbiByZXR1cm4gLUVJTlZBTC4KPj4+Pj4KPj4+Pj4gSWYgdGhl
IG5hbmQtcmIgcHJvcGVydHkgaXMgbWlzc2luZywgdGhlbiBmYWxsYmFjayB0byBzb2Z0d2FyZSB3
YWl0Lgo+Pj4+PiAgCj4+Pj4+PiAyKSBJIGNhbid0IHRlc3QgUkIgbW9kZSAtIEkgZG9uJ3QgaGF2
ZSBzdWNoIGRldmljZSA6KAo+Pj4+Pj4KPj4+Pj4+IEFsc28gZm9yIGV4YW1wbGUgaW4gYXJhc2Fu
LW5hbmQtY29udHJvbGxlci5jIHBhcnNlZCAnbmFuZC1yYicgdmFsdWVzIGFyZSB1c2VkCj4+Pj4+
PiBpbiBjb250cm9sbGVyIHNwZWNpZmljIHJlZ2lzdGVyIGZvciB3YWl0aW5nIChJIGd1ZXNzIE1l
c29uIGNvbnRyb2xsZXIgaGFzIHNvbWV0aGluZwo+Pj4+Pj4gbGlrZSB0aGF0LCBidXQgSSBkb24n
dCBoYXZlIGRvYykuIFdoaWxlIGluIG1hcnZlbGxfbmFuZC5jIGl0IGxvb2tzIGxpa2UgdGhhdCB0
aGV5IHBhcnNlCj4+Pj4+PiAnbmFuZC1yYicgcHJvcGVydHksIGJ1dCBuZXZlciB1c2UgaXQuICAK
Pj4+Pj4KPj4+Pj4gWWVzLCB0aGUgbG9naWMgYXJvdW5kIHRoZSBzZWNvbmQgUkIgbGluZSAodGFr
aW5nIGNhcmUgb2YgQ1MxL0NTMykgaXMKPj4+Pj4gc2xpZ2h0bHkgYnJva2VuIG9yIGF0IGxlYXN0
IGJhZGx5IGRvY3VtZW50ZWQsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUKPj4+Pj4gdXNlZC4KPj4+
Pj4gIAo+Pj4+Pj4+IEluIGFueSBjYXNlIHlvdSdsbCBuZWVkIGEgZHQtYmluZGluZyB1cGRhdGUg
d2hpY2ggbXVzdCBiZSBhY2tlZCBieQo+Pj4+Pj4+IGR0LWJpbmRpbmcgbWFpbnRhaW5lcnMuICAK
Pj4+Pj4+Cj4+Pj4+PiBZb3UgbWVhbiB0byBhZGQgdGhpcyBwcm9wZXJ0eSBkZXNjIHRvIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwg
PyAgCj4+Pj4+Cj4+Pj4+IFllcy4gSW4gYSBkZWRpY2F0ZWQgcGF0Y2guIFNvbWV0aGluZyBhbG9u
ZyB0aGUgbGluZXM6Cj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgbmFuZC1yYjogdHJ1ZQo+
Pj4+Pgo+Pj4+PiBpbnNpZGUgdGhlIG5hbmQgY2hpcCBvYmplY3Qgc2hvdWxkIGJlIGZpbmUuIEFu
ZCBmbGFnIHRoZSBjaGFuZ2UgYXMgYQo+Pj4+PiBmaXggYmVjYXVzZSB3ZSBzaG91bGQgaGF2ZSB1
c2VkIGFuZCBwYXJzZWQgdGhpcyBwcm9wZXJ0eSBzaW5jZSB0aGUKPj4+Pj4gYmVnaW5uaW5nLgo+
Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwgIAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
