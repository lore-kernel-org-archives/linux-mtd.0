Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F2DC7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME/eqSpkYmfcdMAFR4KcK+HxjjjFwS3sd6N6gazq6Mc=; b=tyucqUdMqEexQf
	mcA5p/NU4C302SNn4UVsdJmDdeLb3g49gGf2i1Asq9XZtLHWKt9qsfo34m2jJ6ILda4TUdNjO37VP
	4SB/NgyK08RIQU72PTEP8glw+OjIogbopJ3YCQSfpj7o0g4DywTDs5DiRS9a0oRr0p45tJNuUBhBg
	Bb61yx+JLRTJyIFWtPoCV5iTiamJMZF+qmo/k/vZco9A2k67zjnOCKEbrZmfZVHVfmTGKdMVib7rt
	B4EOPyTgbq9CNdQVUj6JFFHdatNdhMIVG1yLKdqwRRCdZFqPcLKtgPupbXaEbxiTuQDKxtAH6WuSd
	lK/lvvPwNiK17Dcbybdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vb2-001b89-2G;
	Tue, 06 Jun 2023 12:15:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vay-001b6z-1Y;
	Tue, 06 Jun 2023 12:15:30 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 79D6D5FD2E;
	Tue,  6 Jun 2023 15:15:25 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686053725;
	bh=asBvAU17m6rnCMyFdShPaT0xZQytlFc892eOr2H0XMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=iOtjm/dPA7D6QCGBOA61CSi5MTMql/ez72A+JOQhmDZOcNVgHG/gvqp+QHPrRWFye
	 61JMm5v+J8l2fP4NdVVq9K+8+8Lq/1ey20YDs8dFtLoy7cl3VKlh4SJysT+qIzOKJK
	 t47oKMrkVObaTllrsjEAsAriO7kqehIoHCbW7kQwdFgfK+NovR7uCC72hqqg5PnKgd
	 kpCoQiiPMHyQ6AB2WdJowrQSYrh/kdj2c9U5pTTwwqIL1Q3RXbNukx1XpHJVTd7LCv
	 XBo+oi3BqubKDihOSQa21qD/mdIuQiozKnIYvN08tEivQA/Qbz6a/qkDTeJ05mF9fU
	 VkVPFI+uVvTcQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 15:15:24 +0300 (MSK)
Message-ID: <78f8ac23-ee01-6bb1-7275-58380a28425b@sberdevices.ru>
Date: Tue, 6 Jun 2023 15:10:27 +0300
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
 <5c98362c-1808-d7d2-bff8-c2f2f3ae0e89@sberdevices.ru>
 <20230606141145.59e96064@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230606141145.59e96064@xps-13>
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
X-CRM114-CacheID: sfid-20230606_051528_880890_0BBD8A78 
X-CRM114-Status: GOOD (  27.85  )
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

CgpPbiAwNi4wNi4yMDIzIDE1OjExLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNiBKdW4gMjAyMyAx
NDo0OToxOSArMDMwMDoKPiAKPj4gT24gMDUuMDYuMjAyMyAxNjozMCwgTGlhbmcgWWFuZyB3cm90
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
cGxldGlvbi4gIAo+Pj4KPj4+IFVzZSAibmFuZC1yYiIgaW4gZHRzIHRvIGRlY2lkZSBvbGQgUkJf
SU5UKHBoeXNpY2FsIFJCIHdpcmVzIGlzIG5lZWRlZCkgb3IgbmV3IFJCX0lOVChubyBwaHlzaWNh
bCBSQiB3aXJlcykuIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgZGVjaWRlcyB0aGUgUkIwIG9yIFJC
MSBieSB0aGUgcHJldmlvdXMgY29tbWFuZCB3aXRoIGNlIGFyZ3MuCj4+PiAgIAo+Pj4+ICAKPj4+
Pj4gQXJzZW5peSwgaWYgdGhlIGFuc3dlciB0byBteSBhYm92ZSBxdWVzdGlvbiBpcyBubywgdGhl
biB5b3Ugc2hvdWxkCj4+Pj4+IGV4cGVjdCB0aGUgbmFuZC1yYiBhbmQgcmVnIGFycmF5cyB0byBi
ZSBpZGVudGljYWwuIElmIHRoZXkgYXJlIG5vdCwKPj4+Pj4gdGhlbiB5b3UgY2FuIHJldHVybiAt
RUlOVkFMLgo+Pj4+Pgo+Pj4+PiBJZiB0aGUgbmFuZC1yYiBwcm9wZXJ0eSBpcyBtaXNzaW5nLCB0
aGVuIGZhbGxiYWNrIHRvIHNvZnR3YXJlIHdhaXQuCj4+Pj4+ICAKPj4+Pj4+IDIpIEkgY2FuJ3Qg
dGVzdCBSQiBtb2RlIC0gSSBkb24ndCBoYXZlIHN1Y2ggZGV2aWNlIDooCj4+Pj4+Pgo+Pj4+Pj4g
QWxzbyBmb3IgZXhhbXBsZSBpbiBhcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgcGFyc2VkICduYW5k
LXJiJyB2YWx1ZXMgYXJlIHVzZWQKPj4+Pj4+IGluIGNvbnRyb2xsZXIgc3BlY2lmaWMgcmVnaXN0
ZXIgZm9yIHdhaXRpbmcgKEkgZ3Vlc3MgTWVzb24gY29udHJvbGxlciBoYXMgc29tZXRoaW5nCj4+
Pj4+PiBsaWtlIHRoYXQsIGJ1dCBJIGRvbid0IGhhdmUgZG9jKS4gV2hpbGUgaW4gbWFydmVsbF9u
YW5kLmMgaXQgbG9va3MgbGlrZSB0aGF0IHRoZXkgcGFyc2UKPj4+Pj4+ICduYW5kLXJiJyBwcm9w
ZXJ0eSwgYnV0IG5ldmVyIHVzZSBpdC4gIAo+Pj4+Pgo+Pj4+PiBZZXMsIHRoZSBsb2dpYyBhcm91
bmQgdGhlIHNlY29uZCBSQiBsaW5lICh0YWtpbmcgY2FyZSBvZiBDUzEvQ1MzKSBpcwo+Pj4+PiBz
bGlnaHRseSBicm9rZW4gb3IgYXQgbGVhc3QgYmFkbHkgZG9jdW1lbnRlZCwgYW5kIHRodXMgc2hv
dWxkIG5vdCBiZQo+Pj4+PiB1c2VkLgo+Pj4+PiAgCj4+Pj4+Pj4gSW4gYW55IGNhc2UgeW91J2xs
IG5lZWQgYSBkdC1iaW5kaW5nIHVwZGF0ZSB3aGljaCBtdXN0IGJlIGFja2VkIGJ5Cj4+Pj4+Pj4g
ZHQtYmluZGluZyBtYWludGFpbmVycy4gIAo+Pj4+Pj4KPj4+Pj4+IFlvdSBtZWFuIHRvIGFkZCB0
aGlzIHByb3BlcnR5IGRlc2MgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCA/ICAKPj4+Pj4KPj4+Pj4gWWVzLiBJbiBhIGRlZGlj
YXRlZCBwYXRjaC4gU29tZXRoaW5nIGFsb25nIHRoZSBsaW5lczoKPj4+Pj4KPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCBuYW5kLXJiOiB0cnVlCj4+Pj4+Cj4+Pj4+IGluc2lkZSB0aGUgbmFuZCBjaGlw
IG9iamVjdCBzaG91bGQgYmUgZmluZS4gQW5kIGZsYWcgdGhlIGNoYW5nZSBhcyBhCj4+Pj4+IGZp
eCBiZWNhdXNlIHdlIHNob3VsZCBoYXZlIHVzZWQgYW5kIHBhcnNlZCB0aGlzIHByb3BlcnR5IHNp
bmNlIHRoZQo+Pj4+PiBiZWdpbm5pbmcuICAKPj4KPj4gTWlxdWVsLAo+Pgo+PiBTbWFsbCByZW1h
cmssIGRvIHdlIHJlYWxseSBuZWVkIHRvIGFkZCB0aGlzICduYW5kLXJiJyB0byB0aGUgY2hpcCBv
YmplY3QsIGFzIExpYW5nIHNhaWQsCj4+IHRoYXQgdGhlcmUgaXMgb25seSBvbmUgUkIgd2lyZSAo
ZS5nLiBvbmx5IG9uZSBvciBub3RoaW5nKT8gTWF5YmUgZm9yIE1lc29uIEkgY2FuIGFkZCBpdCB0
byB0aGUKPj4gbWVzb24gY29udHJvbGxlciBzdHJ1Y3R1cmU/Cj4gCj4gWW91IG9ubHkgbmVlZCBh
IGJvb2xlYW4gaW4gdGhlIGNvbnRyb2xsZXIgc3RydWN0dXJlLCBJIGd1ZXNzLgoKR290IGl0IQoK
VGhhbmtzLCBBcnNlbml5Cgo+IAo+Pgo+PiBUaGFua3MsIEFyc2VuaXkKPj4KPj4+Pj4KPj4+Pj4g
VGhhbmtzLAo+Pj4+PiBNaXF1w6hsICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
