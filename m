Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB02C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B9B32075E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJIuZCY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B9B32075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDg3WgtofBbUnIa+Q2mATaMa59YgNll3XpJI6/XyBGU=; b=lJIuZCY3EqIdVV
	iLJffr9IFZntPxc6JU0vl+ZT2ETkW6a1yV17jVlAGNzfOaLUDuSY/bz3dECHNhTzQF4qzzT/21HsM
	7VHBx4i8b9UBCswU9qzq2VsjkhP7/ijxwIzZm0AlCiWIXxU0hjATUGIxjVoBaK+/NjcqTjF5lLqsK
	G5XsbRyZ8mxe+H4rgFPdwf9T+/v+XEMhTq3UO+EpVDRI3Y5+ahi2gE0DXUaYWgEQ7wYg5jfJygKz8
	+hRAOXI0H8SiyOHiyu7pMHWIA4vQFWWwGY/CdjYOtaEYn62aQZe5u9wsbsPJ0nvBG1T3WBidzMHYG
	pA9YfYtRauBB48kWym+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYBNe-0005nx-6F; Mon, 11 May 2020 16:34:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYBNb-0005nF-1h
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 16:34:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D7F1F20009;
 Mon, 11 May 2020 16:34:02 +0000 (UTC)
Date: Mon, 11 May 2020 18:34:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v2 1/2] nand: brcmnand: improve hamming oob layout
Message-ID: <20200511183401.2ef8b037@xps13>
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
 <20200504185945.2776148-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_093411_222767_563FCDF3 
X-CRM114-Status: GOOD (  16.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIE1vbiwgIDQgTWF5IDIwMjAKMjA6NTk6NDQgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgZ2VuZXJhdGVzIDggb29iIHNlY3Rpb25zOgo+IFMxCTEtNQo+IEVDQwk2LTgKPiBTMgk5
LTE1Cj4gUzMJMTYtMjEKPiBFQ0MJMjItMjQKPiBTNAkyNS0zMQo+IFM1CTMyLTM3Cj4gRUNDCTM4
LTQwCj4gUzYJNDEtNDcKPiBTNwk0OC01Mwo+IEVDQwk1NC01Ngo+IFM4CTU3LTYzCj4gCj4gQ2hh
bmdlIGl0IGJ5IG1lcmdpbmcgY29udGludW91cyBzZWN0aW9uczoKPiBTMQkxLTUKPiBFQ0MJNi04
Cj4gUzIJOS0yMQo+IEVDQwkyMi0yNAo+IFMzCTI1LTM3Cj4gRUNDCTM4LTQwCj4gUzQJNDEtNTMK
PiBFQ0MJNTQtNTYKPiBTNQk1Ny02Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOh
bmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gLS0tCj4gIHYyOiBrZWVwIG9yaWdpbmFs
IGNvbW1lbnQgYW5kIGZpeCBjb3JyZWN0bHkgc2tpcCBieXRlIDYgZm9yIHNtYWxsLXBhZ2UgbmFu
ZAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMzQgKysr
KysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKPiBpbmRleCBlNGUzY2VlYWMzOGYuLjc2NzM0M2UwZTZlNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0xMTAwLDMwICsxMTAwLDMyIEBA
IHN0YXRpYyBpbnQgYnJjbW5hbmRfaGFtbWluZ19vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gIAlzdHJ1Y3QgYnJjbW5hbmRfY2ZnICpjZmcgPSAmaG9z
dC0+aHdjZmc7Cj4gIAlpbnQgc2FzID0gY2ZnLT5zcGFyZV9hcmVhX3NpemUgPDwgY2ZnLT5zZWN0
b3Jfc2l6ZV8xazsKPiAgCWludCBzZWN0b3JzID0gY2ZnLT5wYWdlX3NpemUgLyAoNTEyIDw8IGNm
Zy0+c2VjdG9yX3NpemVfMWspOwo+ICsJdTMyIG5leHQ7Cj4gIAo+IC0JaWYgKHNlY3Rpb24gPj0g
c2VjdG9ycyAqIDIpCj4gKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCj4gIAkJcmV0dXJuIC1FUkFO
R0U7Cj4gIAo+IC0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAvIDIpICogc2FzOwo+ICsJ
bmV4dCA9IChzZWN0aW9uICogc2FzKTsKPiArCWlmIChzZWN0aW9uIDwgc2VjdG9ycykKPiArCQlu
ZXh0ICs9IDY7Cj4gIAo+IC0JaWYgKHNlY3Rpb24gJiAxKSB7Cj4gLQkJb29icmVnaW9uLT5vZmZz
ZXQgKz0gOTsKPiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDc7Cj4gKwlpZiAoc2VjdGlvbikgewo+
ICsJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBzYXMpICsgOTsKPiAgCX0g
ZWxzZSB7Cj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+IC0KPiAtCQkvKiBGaXJzdCBzZWN0
b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAqLwo+IC0JCWlmICghc2VjdGlvbikgewo+IC0J
CQkvKgo+IC0JCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxh
cmdlLXBhZ2UKPiAtCQkJICogTkFORCB1c2UgYnl0ZSAwLgo+IC0JCQkgKi8KPiAtCQkJaWYgKGNm
Zy0+cGFnZV9zaXplID4gNTEyKQo+IC0JCQkJb29icmVnaW9uLT5vZmZzZXQrKzsKPiAtCQkJb29i
cmVnaW9uLT5sZW5ndGgtLTsKPiArCQkvKgo+ICsJCSAqIFNtYWxsLXBhZ2UgTkFORCB1c2UgYnl0
ZSA2IGZvciBCQkkgd2hpbGUgbGFyZ2UtcGFnZQo+ICsJCSAqIE5BTkQgdXNlIGJ5dGUgMC4KPiAr
CQkgKi8KPiArCQlpZiAoY2ZnLT5wYWdlX3NpemUgPiA1MTIpIHsKPiArCQkJb29icmVnaW9uLT5v
ZmZzZXQgPSAxOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMDsKPiAr
CQkJbmV4dC0tOwo+ICAJCX0KPiAgCX0KPiAgCj4gKwlvb2JyZWdpb24tPmxlbmd0aCA9IG5leHQg
LSBvb2JyZWdpb24tPm9mZnNldDsKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKCkknbSBmaW5l
IHdpdGggdGhlIHR3byBwYXRjaGVzIGJ1dCBjb3VsZCB5b3UgcGxlYXNlIGludmVydCB0aGUgb3Jk
ZXIgYW5kCmFkZCBGaXhlczogKyBDYzogc3RhYmxlIHRhZ3Mgb24gYm90aD8gb24gImZpeCBoYW1t
aW5nIG9vYiBsYXlvdXQiCnBsZWFzZT8gVGhpcyB3YXkgdGhlIGZpeCBpcyB2YWxpZCBvbiBvbGRl
ciB2ZXJzaW9ucyBvZiB0aGUgZHJpdmVyIGFuCmNhbiBiZSBiYWNrcG9ydGVkIGVhc2lseS4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
