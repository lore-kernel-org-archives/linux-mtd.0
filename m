Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60241C54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D2C206D6
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cApkkr9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D2C206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxXUg1Or1DqLk4xyTzlEe7WBiCoxLlPsej5vNVoal0U=; b=cApkkr9dE9ql0Z
	z4iV1bALf4BMXFrA/2k2/PkhxC+ZZYKvw3ahMlHxL44nRwA9BXb6x5SNBbiqQi3gqMsTL9GOyyxWL
	7SZ1BHiZDx20Sz7PKzkzfYACCPeCLq3L3cPUpVOIk6HVv2HeKThWlOa7/YnHLsZsXoYQRtOeo760G
	bEZVA8T427zFQdD142SaaXE9iiNqosS7/JxKN9v73PeYSyuxRkR00wdQWOk8Le5N2S5UyEPVBOuBx
	KO07LrxenLWBAAI6VIe5rDXqLiS1D1XEyJMBnUwEeXYkQ/picXK6h1NDnMx1r7f2qL1KzWuawi8H0
	jvIDRYA8AW5JGY6aZxyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYP26-0003hO-4L; Tue, 12 May 2020 07:08:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYP22-0003g7-Mz
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:08:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C58C6C000C;
 Tue, 12 May 2020 07:08:45 +0000 (UTC)
Date: Tue, 12 May 2020 09:08:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Message-ID: <20200512090844.21bcaf22@xps13>
In-Reply-To: <20200512060023.684871-3-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_000850_884657_824650EC 
X-CRM114-Status: GOOD (  15.85  )
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
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDg6MDA6MjMgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgZ2VuZXJhdGVzIDggb29iIHNlY3Rpb25zOgo+IFMxCTEtNQo+IEVDQwk2LTgKPiBTMgk5
LTE1Cj4gUzMJMTYtMjEKPiBFQ0MJMjItMjQKPiBTNAkyNS0zMQo+IFM1CTMyLTM3Cj4gRUNDCTM4
LTQwCj4gUzYJNDEtNDcKPiBTNwk0OC01Mwo+IEVDQwk1NC01Ngo+IFM4CTU3LTYzCj4gCj4gQ2hh
bmdlIGl0IGJ5IG1lcmdpbmcgY29udGludW91cyBzZWN0aW9uczoKPiBTMQkxLTUKPiBFQ0MJNi04
Cj4gUzIJOS0yMQo+IEVDQwkyMi0yNAo+IFMzCTI1LTM3Cj4gRUNDCTM4LTQwCj4gUzQJNDEtNTMK
PiBFQ0MJNTQtNTYKPiBTNQk1Ny02Mwo+IAo+IEZpeGVzOiBlZjVlZWVhNmU5MTEgKCJtdGQ6IG5h
bmQ6IGJyY206IHN3aXRjaCB0byBtdGRfb29ibGF5b3V0X29wcyIpCgpTb3JyeSBmb3IgbGVhZGlu
ZyB5b3UgdGhlIHdyb25nIHdheSwgYWN0dWFsbHkgdGhpcyBwYXRjaCBkb2VzIG5vdApkZXNlcnZl
IGEgRml4ZXMgdGFnLgoKPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMg
PG5vbHRhcmlAZ21haWwuY29tPgo+IC0tLQo+ICB2MzogaW52ZXJ0IHBhdGNoIG9yZGVyCj4gIHYy
OiBrZWVwIG9yaWdpbmFsIGNvbW1lbnQgYW5kIGZpeCBjb3JyZWN0bHkgc2tpcCBieXRlIDYgZm9y
IHNtYWxsLXBhZ2UgbmFuZAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jIHwgMzcgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmMKPiBpbmRleCAxYzEwNzAxMTFlYmMuLjBhMWQ3NmZkZTM3YiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0xMTAw
LDMzICsxMTAwLDMyIEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfaGFtbWluZ19vb2JsYXlvdXRfZnJl
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gIAlzdHJ1Y3QgYnJjbW5hbmRf
Y2ZnICpjZmcgPSAmaG9zdC0+aHdjZmc7Cj4gIAlpbnQgc2FzID0gY2ZnLT5zcGFyZV9hcmVhX3Np
emUgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xazsKPiAgCWludCBzZWN0b3JzID0gY2ZnLT5wYWdlX3Np
emUgLyAoNTEyIDw8IGNmZy0+c2VjdG9yX3NpemVfMWspOwo+ICsJdTMyIG5leHQ7Cj4gIAo+IC0J
aWYgKHNlY3Rpb24gPj0gc2VjdG9ycyAqIDIpCj4gKwlpZiAoc2VjdGlvbiA+IHNlY3RvcnMpCj4g
IAkJcmV0dXJuIC1FUkFOR0U7Cj4gIAo+IC0Jb29icmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAv
IDIpICogc2FzOwo+ICsJbmV4dCA9IChzZWN0aW9uICogc2FzKTsKPiArCWlmIChzZWN0aW9uIDwg
c2VjdG9ycykKPiArCQluZXh0ICs9IDY7Cj4gIAo+IC0JaWYgKHNlY3Rpb24gJiAxKSB7Cj4gLQkJ
b29icmVnaW9uLT5vZmZzZXQgKz0gOTsKPiAtCQlvb2JyZWdpb24tPmxlbmd0aCA9IDc7Cj4gKwlp
ZiAoc2VjdGlvbikgewo+ICsJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gKChzZWN0aW9uIC0gMSkgKiBz
YXMpICsgOTsKPiAgCX0gZWxzZSB7Cj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+IC0KPiAt
CQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAqLwo+IC0JCWlmICgh
c2VjdGlvbikgewo+IC0JCQkvKgo+IC0JCQkgKiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBm
b3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiAtCQkJICogTkFORCB1c2UgYnl0ZXMgMCBhbmQgMS4K
PiAtCQkJICovCj4gLQkJCWlmIChjZmctPnBhZ2Vfc2l6ZSA+IDUxMikgewo+IC0JCQkJb29icmVn
aW9uLT5vZmZzZXQgKz0gMjsKPiAtCQkJCW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Cj4gLQkJCX0g
ZWxzZSB7Cj4gLQkJCQlvb2JyZWdpb24tPmxlbmd0aC0tOwo+IC0JCQl9Cj4gKwkJLyoKPiArCQkg
KiBTbWFsbC1wYWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiAr
CQkgKiBOQU5EIHVzZSBieXRlcyAwIGFuZCAxLgo+ICsJCSAqLwo+ICsJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ICsJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7Cj4gKwkJfSBlbHNlIHsK
PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+ICsJCQluZXh0LS07CgpUaGlzIG5leHQtLSBz
ZWVtcyB2ZXJ5IHN0cmFuZ2UsIGNhbiB5b3UgZXhwbGFpbj8KCj4gIAkJfQo+ICAJfQo+ICAKPiAr
CW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAtIG9vYnJlZ2lvbi0+b2Zmc2V0Owo+ICsKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
