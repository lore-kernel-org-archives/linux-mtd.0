Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89846C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H+zgAzEHSZkLUIQlOrS3MK+wZAJhlVeAyuUEsK3KAhg=; b=4g1E9u2Aevjz7P9Q7jJ0iZse4w
	aQs0uYQHvMdjd/kBtyAVJ7t52gPbcygVl44wiDM4cUbM6IzebNd+ezyy4kaRstCvYWsuXPh6SfBUg
	iW9pIr/bifArJDfcSPdXIzyOkB59VYomk3hBQ2mBtf383UExdZGqQ7zVMNw05F7dy2e260dU+cnhy
	3y4HkUD7tmBD4teZz8daWqdp9GTE6snpFKG2zrdvelLqN74FHq3NWeDiAtYYouy/bnBO62Z2QSVsU
	4x20TOzWVvZ/a5XmrgPfiZUu+mMOuc9nkQNFJbeu4ZC/EWp8JYeE6vfIuifqkjWbrOLOP/tzgAM1Z
	NFoaY/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfjS-009LiH-Ej; Tue, 07 Jun 2022 20:23:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyfjO-009Lgy-Vn
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 20:23:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7957D61B8B69;
	Tue,  7 Jun 2022 22:23:13 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9QQEM-g-k7R7; Tue,  7 Jun 2022 22:23:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D08F7608110A;
	Tue,  7 Jun 2022 22:23:12 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7tquQMvYHDkA; Tue,  7 Jun 2022 22:23:12 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9CD0D61B8B5A;
	Tue,  7 Jun 2022 22:23:12 +0200 (CEST)
Date: Tue, 7 Jun 2022 22:23:12 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1710081060.147491.1654633392520.JavaMail.zimbra@nod.at>
In-Reply-To: <20220516070601.11428-2-kernel@kempniu.pl>
References: <20220516070601.11428-1-kernel@kempniu.pl> <20220516070601.11428-2-kernel@kempniu.pl>
Subject: Re: [PATCH 1/2] mtdchar: prevent integer overflow in a safety check
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: prevent integer overflow in a safety check
Thread-Index: JX134mBLLXSr5mg7slOI+t/fmFEWJA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_132315_369070_E4D1DE6F 
X-CRM114-Status: GOOD (  19.69  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhxYIgS8SZcGllxYQi
IDxrZXJuZWxAa2VtcG5pdS5wbD4KPiBBbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCAxNi4gTWFpIDIwMjIgMDk6MDY6MDAKPiBCZXRy
ZWZmOiBbUEFUQ0ggMS8yXSBtdGRjaGFyOiBwcmV2ZW50IGludGVnZXIgb3ZlcmZsb3cgaW4gYSBz
YWZldHkgY2hlY2sKCj4gQ29tbWl0IDY0MjBhYzBhZjk1ZCAoIm10ZGNoYXI6IHByZXZlbnQgdW5i
b3VuZGVkIGFsbG9jYXRpb24gaW4gTUVNV1JJVEUKPiBpb2N0bCIpIGFkZGVkIGEgc2FmZXR5IGNo
ZWNrIHRvIG10ZGNoYXJfd3JpdGVfaW9jdGwoKSB3aGljaCBhdHRlbXB0cyB0bwo+IGVuc3VyZSB0
aGF0IHRoZSB3cml0ZSByZXF1ZXN0IHNlbnQgYnkgdXNlciBzcGFjZSBkb2VzIG5vdCBleHRlbmQg
YmV5b25kCj4gdGhlIE1URCBkZXZpY2UncyBzaXplLiAgSG93ZXZlciwgdGhhdCBjaGVjayBjb250
YWlucyBhbiBhZGRpdGlvbiBvZiB0d28KPiBzdHJ1Y3QgbXRkX3dyaXRlX3JlcSBmaWVsZHMsICdz
dGFydCcgYW5kICdsZW4nLCBib3RoIG9mIHdoaWNoIGFyZSB1NjQKPiB2YXJpYWJsZXMuICBUaGUg
cmVzdWx0IG9mIHRoYXQgYWRkaXRpb24gY2FuIG92ZXJmbG93LCBhbGxvd2luZyB0aGUKPiBzYWZl
dHkgY2hlY2sgdG8gYmUgYnlwYXNzZWQuCj4gCj4gVGhlIGFyZ3VhYmx5IHNpbXBsZXN0IGZpeCAt
IGNoYW5naW5nIHRoZSBkYXRhIHR5cGVzIG9mIHRoZSByZWxldmFudAo+IHN0cnVjdCBtdGRfd3Jp
dGVfcmVxIGZpZWxkcyAtIGlzIG5vdCBmZWFzaWJsZSBhcyBpdCB3b3VsZCBicmVhayB1c2VyCj4g
c3BhY2UuCj4gCj4gRml4IGJ5IG1ha2luZyBtdGRjaGFyX3dyaXRlX2lvY3RsKCkgdHJ1bmNhdGUg
dGhlIHZhbHVlIHByb3ZpZGVkIGJ5IHVzZXIKPiBzcGFjZSBpbiB0aGUgJ2xlbicgZmllbGQgb2Yg
c3RydWN0IG10ZF93cml0ZV9yZXEsIHNvIHRoYXQgb25seSB0aGUgbG93ZXIKPiAzMiBiaXRzIG9m
IHRoYXQgZmllbGQgYXJlIHVzZWQsIHByZXZlbnRpbmcgdGhlIG92ZXJmbG93Lgo+IAo+IFdoaWxl
IHRoZSAnb29ibGVuJyBmaWVsZCBvZiBzdHJ1Y3QgbXRkX3dyaXRlX3JlcSBpcyBub3QgY3VycmVu
dGx5IHVzZWQKPiBpbiBhbnkgc2ltaWxhcmx5IGZsYXdlZCBzYWZldHkgY2hlY2ssIGFsc28gdHJ1
bmNhdGUgaXQgdG8gMzIgYml0cywgZm9yCj4gY29uc2lzdGVuY3kgd2l0aCB0aGUgJ2xlbicgZmll
bGQgYW5kIHdpdGggb3RoZXIgTVREIHJvdXRpbmVzIGhhbmRsaW5nCj4gT09CIGRhdGEuCj4gCj4g
VXBkYXRlIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oIGFjY29yZGluZ2x5Lgo+IAo+IFN1Z2dl
c3RlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KPiAtLS0KPiBkcml2ZXJz
L210ZC9tdGRjaGFyLmMgICAgICB8IDMgKysrCj4gaW5jbHVkZS91YXBpL210ZC9tdGQtYWJpLmgg
fCA0ICsrLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY2hhci5jIGIvZHJpdmVycy9tdGQv
bXRkY2hhci5jCj4gaW5kZXggZDBmOWM0YjAyODVjLi5iMjcwMGY4NDY3ZmYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbXRkY2hhci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY2hhci5jCj4g
QEAgLTYxNSw2ICs2MTUsOSBAQCBzdGF0aWMgaW50IG10ZGNoYXJfd3JpdGVfaW9jdGwoc3RydWN0
IG10ZF9pbmZvICptdGQsCj4gCWlmICghdXNyX29vYikKPiAJCXJlcS5vb2JsZW4gPSAwOwo+IAo+
ICsJcmVxLmxlbiAmPSAweGZmZmZmZmZmOwo+ICsJcmVxLm9vYmxlbiAmPSAweGZmZmZmZmZmOwo+
ICsKClllYWgsIEkgdGhpbmsgaXQgaXMgcmVhc29uYWJsZSB0byBsaW1pdCB3cml0ZSByZXF1ZXN0
cyB0byA0R2lCLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
