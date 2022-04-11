Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86FBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06677nNUI8l/JrfDU44Rbz35UOu3FTgxB8neKUC3nsk=; b=FDoHlRViIjIhDJ
	1zB4CBrGQjNSzbYUvekJMJYP5hieec+NRMmcDV4VSHCxxxQb36w2hgk1TMOMYvibqHYPHP+zmvumw
	KxkYf+N7kju9TU69hNIeQilTgmQJj7wpXfAA4FvElYBC+j5cQFqoKWjRK5bsemXYWN8YT0mVqRm1U
	NJ+ByZq9yWr+5X6F8yKDdaTAFVFmxiUCho31qeXuCI45yZKxKwXyFOOxOlSfSfsUIlac98ECzUzvh
	YzBGm3NaZ6KPMq25AoG3xLFpux5cbS8kcMkdeD18dyj+zh51vB8tVAcDMZRJXSwcHOyH4XZRdNSlc
	YzUpkSKQcMF0+UJvdaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndog7-007KdW-45; Mon, 11 Apr 2022 07:41:39 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndofK-007KK7-Ra
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 07:40:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B125200012;
 Mon, 11 Apr 2022 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649662848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMslGI0Nk9+SOvYSj6cm9qNbzp4T8QUhXk3AKMJi01s=;
 b=aoaiccUvduO6o44p0B1qYzKY0Wis3SgXfQ+09cO3ZHeQBe5nmVUeKuzHdtX+BrmUCv3uac
 dIu/yEj9qgQAdlmTLtZTbWcHxhMVHf2gPbFFjq6PW1igag3YxxwSiPa1RlCbn8ele1NV30
 FmOxhX8WKVhORHJKrcxC9gdac6eyddcdzhaWRjsZ8ezOC39iYXIouYdm/B15DMU9QSq/dZ
 MxZ1/WHCRGRNN93S9T9QDjdrV3xHwrNo3bdCeLTdIhlV/EYLjgYozqW0irIW/4lLB9ZhAm
 nyOm6IMpSTEPyP8D6ld74i+mmioeuieFa0WNPqqRkpZUmRw9XUVq5LOdksfiOw==
Date: Mon, 11 Apr 2022 09:40:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220411094047.06556ee1@xps13>
In-Reply-To: <6b09d10e-2098-9fb7-be4c-ae67d802cd2d@leemhuis.info>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
 <6b09d10e-2098-9fb7-be4c-ae67d802cd2d@leemhuis.info>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_004051_248133_259CE5E8 
X-CRM114-Status: GOOD (  19.73  )
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

SGVsbG8sCgpyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvIHdyb3RlIG9uIFN1biwgMTAgQXByIDIw
MjIgMTA6NTE6MTcgKzAyMDA6Cgo+IEhpLCB0aGlzIGlzIHlvdXIgTGludXgga2VybmVsIHJlZ3Jl
c3Npb24gdHJhY2tlci4gVG9wLXBvc3RpbmcgZm9yIG9uY2UsCj4gdG8gbWFrZSB0aGlzIGVhc2ls
eSBhY2Nlc3NpYmxlIHRvIGV2ZXJ5b25lLgo+IAo+IE1pcXVlbCwgUmljaGFyZCwgVmlnbmVzaDog
d2hhdCdzIHVwIGhlcmU/IFRoaXMgcGF0Y2hzZXQgZml4ZXMgYQo+IHJlZ3Jlc3Npb24uIEl0J3Mg
cXVpdGUgb2xkLCBzbyBpdCdzIG5vdCB0aGF0IHVyZ2VudCwgYnV0IGl0IGxvb2tlZCBsaWtlCj4g
bm90aGluZyBoYXBwZW5lZCBmb3IgdHdvIGFuZCBhIGhhbGYgd2VlayBub3cuIE9yIHdhcyBwcm9n
cmVzcyBtYWRlCj4gc29tZXdoZXJlPwoKVmlnbmVzaCwgSSdtIHdhaXRpbmcgZm9yIHlvdXIgcmV2
aWV3L2FjayA7KQoKPiBDaWFvLCBUaG9yc3RlbiAod2VhcmluZyBoaXMgJ3RoZSBMaW51eCBrZXJu
ZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkKCk5pY2UgJ3Rvb2wnIDopCgo+IFAuUy46IEFz
IHRoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXIgSSdtIGdldHRpbmcgYSBsb3Qg
b2YKPiByZXBvcnRzIG9uIG15IHRhYmxlLiBJIGNhbiBvbmx5IGxvb2sgYnJpZWZseSBpbnRvIG1v
c3Qgb2YgdGhlbSBhbmQgbGFjawo+IGtub3dsZWRnZSBhYm91dCBtb3N0IG9mIHRoZSBhcmVhcyB0
aGV5IGNvbmNlcm4uIEkgdGh1cyB1bmZvcnR1bmF0ZWx5Cj4gd2lsbCBzb21ldGltZXMgZ2V0IHRo
aW5ncyB3cm9uZyBvciBtaXNzIHNvbWV0aGluZyBpbXBvcnRhbnQuIEkgaG9wZQo+IHRoYXQncyBu
b3QgdGhlIGNhc2UgaGVyZTsgaWYgeW91IHRoaW5rIGl0IGlzLCBkb24ndCBoZXNpdGF0ZSB0byB0
ZWxsIG1lCj4gaW4gYSBwdWJsaWMgcmVwbHksIGl0J3MgaW4gZXZlcnlvbmUncyBpbnRlcmVzdCB0
byBzZXQgdGhlIHB1YmxpYyByZWNvcmQKPiBzdHJhaWdodC4KPiAKPiAjcmVnemJvdCBwb2tlCj4g
Cj4gT24gMjMuMDMuMjIgMTg6MDQsIFRva3Vub3JpIElrZWdhbWkgd3JvdGU6Cj4gPiBTaW5jZSBj
b21taXQgZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdlIHdyaXRlIGJ1
ZmZlciB0bwo+ID4gY2hlY2sgY29ycmVjdCB2YWx1ZSIpIGJ1ZmZlcmVkIHdyaXRlcyBmYWlsIG9u
IFMyOUdMMDY0Ti4gVGhpcyBpcwo+ID4gYmVjYXVzZSwgb24gUzI5R0wwNjROLCByZWFkcyByZXR1
cm4gMHhGRiBhdCB0aGUgZW5kIG9mIERRIHBvbGxpbmcgZm9yCj4gPiB3cml0ZSBjb21wbGV0aW9u
LCB3aGVyZSBhcywgY2hpcF9nb29kKCkgY2hlY2sgZXhwZWN0cyBhY3R1YWwgZGF0YQo+ID4gd3Jp
dHRlbiB0byB0aGUgbGFzdCBsb2NhdGlvbiB0byBiZSByZXR1cm5lZCBwb3N0IERRIHBvbGxpbmcg
Y29tcGxldGlvbi4KPiA+IEZpeCBpcyB0byByZXZlcnQgdG8gdXNpbmcgY2hpcF9nb29kKCkgZm9y
IFMyOUdMMDY0TiB3aGljaCBvbmx5IGNoZWNrcwo+ID4gZm9yIERRIGxpbmVzIHRvIHNldHRsZSBk
b3duIHRvIGRldGVybWluZSB3cml0ZSBjb21wbGV0aW9uLgo+ID4gCj4gPiBGaXhlczogZGZlYWUx
MDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdlIHdyaXRlIGJ1ZmZlciB0byBjaGVj
ayBjb3JyZWN0IHZhbHVlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlr
ZWdhbWkudEBnbWFpbC5jb20+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9iNjg3YzI1OS02NDEzLTI2YzktZDRjOS1iM2Fm
YTY5ZWExMjRAcGVuZ3V0cm9uaXguZGUvCj4gPiAKPiA+IFRva3Vub3JpIElrZWdhbWkgKDQpOgo+
ID4gICBtdGQ6IGNmaV9jbWRzZXRfMDAwMjogTW92ZSBhbmQgcmVuYW1lCj4gPiAgICAgY2hpcF9j
aGVjay9jaGlwX3JlYWR5L2NoaXBfZ29vZF9mb3Jfd3JpdGUKPiA+ICAgbXRkOiBjZmlfY21kc2V0
XzAwMDI6IFVzZSBjaGlwX3JlYWR5KCkgZm9yIHdyaXRlIG9uIFMyOUdMMDY0Tgo+ID4gICBtdGQ6
IGNmaV9jbWRzZXRfMDAwMjogQWRkIFMyOUdMMDY0TiBJRCBkZWZpbml0aW9uCj4gPiAgIG10ZDog
Y2ZpX2NtZHNldF8wMDAyOiBSZW5hbWUgY2hpcF9yZWFkeSB2YXJpYWJsZXMKPiA+IAo+ID4gIGRy
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMTEyICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9jZmkuaCAgICAgICAgICAgICB8ICAg
MSArCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMo
LSkKPiA+ICAgCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
