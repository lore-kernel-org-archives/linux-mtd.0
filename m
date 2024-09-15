Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74EC35FE7
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2024 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EC1bUlVlBsEhHXmyjBeQhikfeZ9V1xW8soY6WFm1iyQ=; b=XtIulED1uzX47J
	wvz2mTy7q9eBuysP5jysFhsA5myBDOLnoq5BrNpf3GOIiJJcJ3X662jkA2ErwbS3f9GqM86FFd5/e
	m8IupaJLzRxVJ/xG53YqXH/T7WiM8G/t5YoQ1aggfS7qaUnzwE+xyYKKQPjkLZcXLNe8Y3JmNcxec
	/34CCxTI4wwygX+mPc8Yp1VYWFzKgbOOh07pan3cYnPrE2lQeb/vp06+QyD8cp9AMfIPSqR8B8CD4
	6zT2zeTKiB+QRy+umm1r+xLKuJeBTx46R6sYK/Ch9Lip+o+SwcZZ3PrEbnXm4VZaPu7N8eNXjcg44
	hCONnUeD6e45lCJ74hhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmdy-00000001yOu-21Wt;
	Sun, 15 Sep 2024 10:38:14 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmdt-00000001yO8-35Ab
	for linux-mtd@lists.infradead.org;
	Sun, 15 Sep 2024 10:38:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26AB660002;
	Sun, 15 Sep 2024 10:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726396682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8iFxqm+NJCbNrEJdw80BZtg/+jKcQxSmZ/5L+JWgwA=;
	b=KUFon1GNzFnYp0lBuZm+7Ffijy2i59JveqSobNycxjxYsItDB8sA6TXztcTCf3gFMoJozY
	NjqR2NBpbAYTUCS/Fkp11i61VwIdxAkuuDLzic0LEr9x8ZxlXdilFD9ZE839CeFe56s4s0
	V/gzAFchQZ+0XyhDEcta+1JN7E+k10ZhRNPMG9H3maj1laJZIbfPQyVAtVNMVamKt2EfbB
	5cxmio+hxUoVpNoaxxqKTD28yDMqVNpSj6YKrD37YL3vOZPmI+CZP6L3001MdmELpU/CXO
	w0NTyjK6KFeSX5inzLzlBM4+nZOXj8t9qYAZvkNJFVaE1EUMzuoVMZWu8QRMMQ==
Date: Sun, 15 Sep 2024 12:37:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
 <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.12
Message-ID: <20240915123758.4c8e423d@xps-13>
In-Reply-To: <mafs0v7yy9qmc.fsf@kernel.org>
References: <mafs0bk0tf9na.fsf@kernel.org>
	<20240913195915.4bd2a88c@xps-13>
	<mafs0v7yy9qmc.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_033810_566925_37BEBCCE 
X-CRM114-Status: GOOD (  31.54  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFNhdCwgMTQgU2VwIDIw
MjQgMTc6NTU6MzkgKzAyMDA6Cgo+IE9uIEZyaSwgU2VwIDEzIDIwMjQsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gCj4gPiBIaSBQcmF0eXVzaCwKPiA+Cj4gPiBwcmF0eXVzaEBrZXJuZWwub3JnIHdy
b3RlIG9uIFRodSwgMTIgU2VwIDIwMjQgMTI6Mjg6NTcgKzAyMDA6Cj4gPiAgCj4gPj4gSGkgTWlx
dWVsLAo+ID4+IAo+ID4+IEhlcmUgYXJlIHRoZSBTUEkgTk9SIGNoYW5nZXMgZm9yIHY2LjEyLiBJ
IHVzdWFsbHkgYmFzZSBteSBicmFuY2ggb24gdG9wCj4gPj4gb2YgLXJjMSwgYnV0IHRoaXMgdGlt
ZSBhcm91bmQgaXQgc2VlbXMgSSBkaWQgaXQgYSBmZXcgY29tbWl0cyBhZnRlcgo+ID4+IHY2LjEx
LXJjMS4gUHJvYmFibHkganVzdCBkaWRuJ3Qgbm90aWNlIHRvcnZhbGRzL21hc3RlciBoYWQgbW92
ZWQuIFNob3VsZAo+ID4+IG1ha2Ugbm8gZGlmZmVyZW5jZSBpbiBwcmFjdGljZSBhbnl3YXkuICAK
PiA+Cj4gPiBJIGRvbid0IHRoaW5rIEkgY2FuIG1lcmdlIHlvdXIgdGFnIHdpdGhvdXQgdGhlIDQg
bWlubWF4IHBhdGNoZXMsIHdoaWNoCj4gPiBtZWFucyB0aGV5IHdpbGwgYXBwZWFyIGluIG15IGZp
bmFsIG1lcmdlIHJlcXVlc3QgdG8gTGludXMsIHVubGVzcyBJCj4gPiBleHBsaWNpdGx5IGRvbid0
IHVzZSBhbiAtcmMgYXMgYSBiYXNlLCBidXQgdGhpcyBtdXN0IGJlIGp1c3RpZmllZCBJCj4gPiBi
ZWxpZXZlLiBDYW4geW91IHBsZWFzZSBmaXggdGhlIGJyYW5jaCBhbmQgcmVnZW5lcmF0ZSB0aGUg
dGFnPyBJIGRvbid0Cj4gPiBtaW5kIHBlcnNvbmFsbHkgaWYgeW91IGZvcmNlIHB1c2gsIGlmIGl0
IG1ha2VzIHRoZSBoaXN0b3J5IG1vcmUgY2xlYXIuICAKPiAKPiBUTDtEUjogSSdsbCByZWJhc2Ug
YW5kIHNlbmQgeW91IGEgbmV3IHB1bGwgcmVxdWVzdC4KPiAKPiBJIHRob3VnaHQgaXQgd291bGRu
J3QgbWF0dGVyIHNpbmNlIExpbnVzJyB0cmVlIGFscmVhZHkgaGFzIHRob3NlIG1pbm1heAo+IGNv
bW1pdHMgYW55d2F5LiBJIGRpZCBhIHRlc3QgbWVyZ2UganVzdCBub3cgYW5kIHNlZW1zIEkgd2Fz
IHJpZ2h0LiBXaGVuCj4gSSBtZXJnZSBjdXJyZW50IHNwaS1ub3IvbmV4dCBpbnRvIG10ZC9uZXh0
LCBhbmQgdGhlbiBtZXJnZSBtdGQvbmV4dCBpbnRvCj4gdG9ydmFsZHMvbWFzdGVyLCBoZXJlJ3Mg
dGhlIG1lcmdlIEkgZ2V0Ogo+IAo+ICAgICBNZXJnZSBicmFuY2ggJ210ZC9tZXJnZS10ZXN0Jwo+
IAo+ICAgICAqIG10ZC9tZXJnZS10ZXN0Ogo+ICAgICBtdGQ6IHNwaS1ub3I6IGZpeCBmbGFzaCBw
cm9iaW5nCj4gICAgIG10ZDogcG93ZXJudjogQWRkIGNoZWNrIGRldm1fa2FzcHJpbnRmKCkgcmV0
dXJuZWQgdmFsdWUKPiAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogQWRkIHN1cHBvcnQgZm9y
IFMyOEhTMjU2VAo+ICAgICBtdGQ6IGNvbmNhdDogVXNlIGttZW1kdXBfYXJyYXkgaW5zdGVhZCBv
ZiBrbWVtZHVwIGZvciBtdWx0aXBsZSBhbGxvY2F0aW9uCj4gICAgIG10ZDogcGFyc2VyczogYmNt
NDd4eHBhcnQ6IG1ha2UgcmVhZC1vbmx5IGFycmF5IHBvc3NpYmxlX252cmFtX3NpemVzIHN0YXRp
YyBjb25zdAo+ICAgICBtdGQ6IFVzZSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woKQo+ICAgICBtdGQ6
IHNscmFtOiBpbnNlcnQgYnJlYWsgYWZ0ZXIgZXJyb3JzIGluIHBhcnNpbmcgdGhlIG1hcAo+ICAg
ICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IGFkZCBaZXR0YSBaRDI1UTEyOEMgc3VwcG9ydAo+ICAg
ICBtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogQWRkIG4yNXEwNjRhIFdQIHN1cHBvcnQKPiAgICAg
bXRkOiBzcGktbm9yOiBzc3Q6IEZhY3RvciBvdXQgY29tbW9uIHdyaXRlIG9wZXJhdGlvbiB0byBg
c3N0X25vcl93cml0ZV9kYXRhKClgCj4gCj4gQnV0IHNpbmNlIG10ZC9uZXh0IGRvZXNuJ3QgaGF2
ZSB0aGUgbWlubWF4IGNvbW1pdHMsIGhlcmUgaXMgd2hhdCB0aGUKPiBtZXJnZSBvZiBzcGktbm9y
L25leHQgaW50byBtdGQvbmV4dCBsb29rcyBsaWtlOgo+IAo+ICAgICBNZXJnZSBicmFuY2ggJ3Nw
aS1ub3IvbmV4dCcgaW50byBtdGQvbWVyZ2UtdGVzdAo+IAo+ICAgICAqIHNwaS1ub3IvbmV4dDoK
PiAgICAgbXRkOiBzcGktbm9yOiBmaXggZmxhc2ggcHJvYmluZwo+ICAgICBtdGQ6IHNwaS1ub3I6
IHNwYW5zaW9uOiBBZGQgc3VwcG9ydCBmb3IgUzI4SFMyNTZUCj4gICAgIG10ZDogc3BpLW5vcjog
d2luYm9uZDogYWRkIFpldHRhIFpEMjVRMTI4QyBzdXBwb3J0Cj4gICAgIG10ZDogc3BpLW5vcjog
bWljcm9uLXN0OiBBZGQgbjI1cTA2NGEgV1Agc3VwcG9ydAo+ICAgICBtdGQ6IHNwaS1ub3I6IHNz
dDogRmFjdG9yIG91dCBjb21tb24gd3JpdGUgb3BlcmF0aW9uIHRvIGBzc3Rfbm9yX3dyaXRlX2Rh
dGEoKWAKPiAgICAgbWlubWF4OiBzaW1wbGlmeSBtaW4oKS9tYXgoKS9jbGFtcCgpIGltcGxlbWVu
dGF0aW9uCj4gICAgIG1pbm1heDogZG9uJ3QgdXNlIG1heCgpIGluIHNpdHVhdGlvbnMgdGhhdCB3
YW50IGEgQyBjb25zdGFudCBleHByZXNzaW9uCj4gICAgIG1pbm1heDogc2NzaTogZml4IG1pcy11
c2Ugb2YgJ2NsYW1wKCknIGluIHNyLmMKPiAgICAgbWlubWF4OiBtYWtlIGdlbmVyaWMgTUlOKCkg
YW5kIE1BWCgpIG1hY3JvcyBhdmFpbGFibGUgZXZlcnl3aGVyZQoKWWVzLCB0aGlzIG9uZSBsb29r
cyBiYWQsIGJ1dCB5b3UncmUgcmlnaHQgdGhlIGZpbmFsIG1lcmdlIHJlcXVlc3Qgd291bGQKaGF2
ZSBiZWVuIGNsZWFuLgoKPiBFc3NlbnRpYWxseSwgeW91ciBtZXJnZSB0byBMaW51cyB3b3VsZCBi
ZSBmaW5lIGJ1dCBteSBtZXJnZSB0byB5b3VyCj4gYnJhbmNoIHdpbGwgKGFwcGVhciB0bykgaGF2
ZSB0aGVzZSBleHRyYSBjb21taXRzLgo+IAo+IEkgZG9uJ3QgdGhpbmsgYW55IG9mIHRoaXMgaXMg
d29ydGggdGhlIGV4dHJhIGNvbmZ1c2lvbiBzbyBJIHdpbGwganVzdAo+IHJlYmFzZSBteSBicmFu
Y2ggb24gdjYuMTEtcmMxIGZvcmNlIHB1c2guIFdpbGwgc2VuZCB5b3UgYSB2MiBvZiB0aGUgcHVs
bAo+IHJlcXVlc3Qgc29vbi4KPiAKPiBTaWRlIG5vdGU6Cj4gCj4gPiBbLi4uXXVubGVzcyBJIGV4
cGxpY2l0bHkgZG9uJ3QgdXNlIGFuIC1yYyBhcyBhIGJhc2UsIGJ1dCB0aGlzIG11c3QgYmUKPiA+
IGp1c3RpZmllZCBJIGJlbGlldmUuICAKPiAKPiBJIGFtIGN1cmlvdXMgd2h5IHRoYXQgaXMgc28u
IEkgZG9uJ3Qgc2VlIGhvdyB1c2luZyBhbiAtcmMgYXMgYmFzZSBpcyBhbnkKPiBiZXR0ZXIgdGhh
biB1c2luZyBhbnkgb3RoZXIgY29tbWl0IGluIExpbnVzJyB0cmVlLiBGb3IgZ2l0IGl0IGRvZXNu
J3QKPiBtYXR0ZXIgc2luY2UgYW4gLXJjIGNvbW1pdCBpcyB0aGUgc2FtZSBhcyBhbnkgb3RoZXIg
Y29tbWl0LiBJIHN1cHBvc2UgaWYKPiBldmVyeW9uZSBkb2VzIGl0LCB0aGUgaGlzdG9yeSBtaWdo
dCBiZSBhIGJpdCBjbGVhbmVyLCBidXQgSSBkb24ndCBzZWUKPiBob3cgaXQgd291bGQgbWFrZSBt
dWNoIG9mIGEgZGlmZmVyZW5jZSBpbiBwcmFjdGljZS4KClllcywgSSBndWVzcyBmb3IgY2xlYW5s
aW5lc3MgcHVycG9zZXMgaXQgaXMgZXhwZWN0ZWQgdGhhdCBwZW9wbGUgYmFzZQp0aGVpciBicmFu
Y2hlcyBvbiAtcmMgdGFncywgc28gaXQgaXMgZWFzaWVyIHRvIGNhdGNoIHdoYXQgaXMgcGFydCBv
Zgp0aGVpciB3b3JrPyBPdGhlcndpc2UgaWYgeW91IF9uZWVkXyBhbm90aGVyIHBhdGNoIGluLWJl
dHdlZW4gSSBiZWxpZXZlCml0IHNob3VsZCBiZSBzdGF0ZWQgd2h5IHlvdSBuZWVkIGl0LgoKQW55
d2F5LCB0aGFua3MgZm9yIHRoZSB2MiEKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
