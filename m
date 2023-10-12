Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D432CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dQODBEwzpRVvveJuDroQX/36tluLIhskOmaYoeWVkA=; b=PuZq7M6l8PD16Q
	mdq923bQPXpkVQ/8gBHWsaImH+KKN4mPFiZL4xNAtNexEnZn4dUrKDtO1Eyrpyef8cpl9T0HuLOAm
	yeqHcmlmVzglcPQj+3iUql+VyaNwNNp4Zdd+1A8qMNfik75cPxlS9r7NyAsphz6q+OjFZkvbJWtU7
	0T/kyN/jCOnIvJ4dGtFzV1PexL/ZFWxAtL+82dzlyjfp7MhZy3wPvf+mSiP88PZ71kbF4YiHnPeDM
	FcTGGJ2koLiKjjo0+vb9kgQzwpZsJ/dMDRvN4StoREPmHkndJmGy2DUaSw8LiL/qhwHAlCxJWPWBL
	9Ns7EXDV/PsiB/buwi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpmV-0000iJ-2z;
	Thu, 12 Oct 2023 07:06:51 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpmR-0000gB-1E
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 07:06:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 371E2C0006;
	Thu, 12 Oct 2023 07:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697094401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PH/KaqunIddnQRtT02HmdgMfQves6qwGIOzjnE0JjkQ=;
	b=FY+XPJB0L80Aagv0MN6fhAmApIxZB8hFxLsalUUhwZSX/+eYco92ieOuldtUV5uBd03oSR
	tL2UOTYRO0TTOCM/KBUoZila36yX4DLoyyzU49IPzaWdJmzlsET1kugCv3bqPM/jV4OHZB
	f9dMF2zZnzmbLQKefKbOHf2EJ+aOBD+5DOKRFbDW9WVbjvKEWVJ/iKYro6+Y2i8O7CcNI0
	L+WSyWpKICsf/EC1S1EisvmDGEM5PmI7gT5Mk1FVKl298Dzx+zTbUBqmD9hHVWtcNHuhCg
	fGPy1fnVBOkFzV88YoHU+ggrvfyVuli+1kkvZdgGqgZglUpxGTD8aHotui5MPA==
Date: Thu, 12 Oct 2023 09:06:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Message-ID: <20231012090638.1e093fe6@xps-13>
In-Reply-To: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
References: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_000647_870694_02FC7169 
X-CRM114-Status: GOOD (  19.52  )
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

SGVsbG8sCgpkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxMiBPY3QgMjAyMyAwMjo0MDoz
NSArMDIwMDoKClRoZSBhdXRob3Igc2hvdWxkIGJlIEJvcmlzIGFzIHdlbGwgKGdpdCBjb21taXQg
LS1hbWVuZCAtLWF1dGhvcj0uLi4pCgo+IEVyYXNlIGFuZCBwcm9ncmFtIG9wZXJhdGlvbnMgbmVl
ZCB0aGUgd3JpdGUgcHJvdGVjdCAod3ApIHBpbiB0byBiZQo+IGRlLWFzc2VydGVkIHRvIHRha2Ug
ZWZmZWN0LiBBZGQgdGhlIGNvbmNlcHQgb2YgZGVzdHJ1Y3RpdmUKPiBvcGVyYXRpb24gYW5kIHBh
c3MgdGhlIGluZm9ybWF0aW9uIHRvIGV4ZWNfb3AoKSBzbyBjb250cm9sbGVycyBrbm93Cj4gd2hl
biB0aGV5IHNob3VsZCBkZS1hc3NlcnQgdGhpcyBwaW4gd2l0aG91dCBoYXZpbmcgdG8gZGVjb2Rl
Cj4gdGhlIGNvbW1hbmQgb3Bjb2RlLgo+IAo+IENyZWF0ZWQgYnkgQm9yaXMgQnJlemlsbG9uLgoK
VGhpcyBjYW4gZ28gYXdheS4KCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGlu
dXgvY29tbWl0L2U2MTJlMWYyYzY5YTMzYWM1ZjJjOTFkMTM2NjlmMGYxNzJkNTg3MTcKClRoaXMg
YXMgd2VsbC4KCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KClBsZWFzZSB1c2UgQm9yaXMnIGtlcm5lbC5vcmcgZS1tYWlsIGZv
ciB0aGUgYXV0aG9yc2hpcCBhbmQgU29CCgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFJlZ2FuIDxk
cmVnYW5AbWFpbC5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjogZ2F2ZSBjcmVkaXQg
dG8gQm9yaXMgQnJlemlsbG9uCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jIHwgNiArKysrLS0KPiAgaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgfCA5ICsr
KysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCBkNGI1NTE1NWFlYWUuLjQ3
Y2MyYzM1MTUzYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTE0OTQsNyAr
MTQ5NCw4IEBAIHN0YXRpYyBpbnQgbmFuZF9leGVjX3Byb2dfcGFnZV9vcChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgcGFnZSwKPiAgCQkJICAgIE5BTkRfQ09NTU9OX1RJTUlO
R19OUyhjb25mLCB0V0JfbWF4KSksCj4gIAkJTkFORF9PUF9XQUlUX1JEWShOQU5EX0NPTU1PTl9U
SU1JTkdfTVMoY29uZiwgdFBST0dfbWF4KSwgMCksCj4gIAl9Owo+IC0Jc3RydWN0IG5hbmRfb3Bl
cmF0aW9uIG9wID0gTkFORF9PUEVSQVRJT04oY2hpcC0+Y3VyX2NzLCBpbnN0cnMpOwo+ICsJc3Ry
dWN0IG5hbmRfb3BlcmF0aW9uIG9wID0gTkFORF9ERVNUUlVDVElWRV9PUEVSQVRJT04oY2hpcC0+
Y3VyX2NzLAo+ICsJCQkJCQkJICAgICAgaW5zdHJzKTsKPiAgCWludCBuYWRkcnMgPSBuYW5kX2Zp
bGxfY29sdW1uX2N5Y2xlcyhjaGlwLCBhZGRycywgb2Zmc2V0X2luX3BhZ2UpOwo+IAo+ICAJaWYg
KG5hZGRycyA8IDApCj4gQEAgLTE5MTcsNyArMTkxOCw4IEBAIGludCBuYW5kX2VyYXNlX29wKHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBlcmFzZWJsb2NrKQo+ICAJCQlOQU5E
X09QX1dBSVRfUkRZKE5BTkRfQ09NTU9OX1RJTUlOR19NUyhjb25mLCB0QkVSU19tYXgpLAo+ICAJ
CQkJCSAwKSwKPiAgCQl9Owo+IC0JCXN0cnVjdCBuYW5kX29wZXJhdGlvbiBvcCA9IE5BTkRfT1BF
UkFUSU9OKGNoaXAtPmN1cl9jcywgaW5zdHJzKTsKPiArCQlzdHJ1Y3QgbmFuZF9vcGVyYXRpb24g
b3AgPSBOQU5EX0RFU1RSVUNUSVZFX09QRVJBVElPTihjaGlwLT5jdXJfY3MsCj4gKwkJCQkJCQkJ
ICAgICAgaW5zdHJzKTsKPiAKPiAgCQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfUk9XX0FERFJf
MykKPiAgCQkJaW5zdHJzWzFdLmN0eC5hZGRyLm5hZGRycysrOwo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L210ZC9yYXduYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiBp
bmRleCA5MGExNDFiYTJhNWEuLjMxYWNlZGE4NjE2YyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L210ZC9yYXduYW5kLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiBA
QCAtMTAwOCw2ICsxMDA4LDcgQEAgc3RydWN0IG5hbmRfb3BfcGFyc2VyIHsKPiAgICovCj4gIHN0
cnVjdCBuYW5kX29wZXJhdGlvbiB7Cj4gIAl1bnNpZ25lZCBpbnQgY3M7Cj4gKwlib29sIGRlYXNz
ZXJ0X3dwOwo+ICAJY29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyczsKPiAgCXVuc2ln
bmVkIGludCBuaW5zdHJzOwo+ICB9Owo+IEBAIC0xMDE5LDYgKzEwMjAsMTQgQEAgc3RydWN0IG5h
bmRfb3BlcmF0aW9uIHsKPiAgCQkubmluc3RycyA9IEFSUkFZX1NJWkUoX2luc3RycyksCQkJXAo+
ICAJfQo+IAo+ICsjZGVmaW5lIE5BTkRfREVTVFJVQ1RJVkVfT1BFUkFUSU9OKF9jcywgX2luc3Ry
cykJCVwKPiArCXsJCQkJCQkJXAo+ICsJCS5jcyA9IF9jcywJCQkJCVwKPiArCQkuZGVhc3NlcnRf
d3AgPSB0cnVlLAkJCQlcCj4gKwkJLmluc3RycyA9IF9pbnN0cnMsCQkJCVwKPiArCQkubmluc3Ry
cyA9IEFSUkFZX1NJWkUoX2luc3RycyksCQkJXAo+ICsJfQo+ICsKPiAgaW50IG5hbmRfb3BfcGFy
c2VyX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCQkJICAgY29uc3Qgc3RydWN0
IG5hbmRfb3BfcGFyc2VyICpwYXJzZXIsCj4gIAkJCSAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJh
dGlvbiAqb3AsIGJvb2wgY2hlY2tfb25seSk7Cj4gLS0KPiAyLjM3LjMKPiAKPiAKCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
