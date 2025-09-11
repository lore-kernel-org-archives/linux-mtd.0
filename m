Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDED4CAC587
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeVFKzu9lbSiNbR8LZjMFieHmH8fv0p4YqsS03TQg0Q=; b=W7wUO4+py3h3mE
	BfnCpBlN4/Lmsd10CF0nazyHMqQnQBSVAo7LCHlH6kdjVVYpHMiQmKlC3sEQaB5RrWUV7U1YZwSOw
	rrEKCg/rfBmWPPvszcfa5hlvhBujeDbrH/+uHLRVFNnQBITQpJfh8PpfDh/aq/Oq4MLXvMODCEuVF
	LbPQ8YBehwaalO3D06tZnA8e5TiiMhCgBHOdgaiPdS9DywCzdZO2PO9VUrA2OOuDrVHOPaI304UHJ
	PF7wCEkzGnsA6e46Bx0tV1kvLy0CCGMTEGDY8/LwS/A5qFGX53n7ZtsjzE8N/dpXLBZGSOLt09aEm
	sz0ngSwpKDG0O1i/T7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbQE-00000001Oup-0XuA;
	Thu, 11 Sep 2025 07:08:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbQC-00000001OuO-1rKG
	for linux-mtd@bombadil.infradead.org;
	Thu, 11 Sep 2025 07:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eAKEcYhJqeo3WpbpnN9yL0ePD0pDirbDTpiQAUZj6l8=; b=Gt/rcO49um0IVBowp7redIciMu
	siphnBgwy2EHRKu0ze7wdzWjNeaHJ6KopP+3BNIMXbI5pMjY0WKS3/y6QYelFG6X6XIHb+YJN7iPM
	oHYMQ8Y7uMKU4NOykfwWrgn/jHSzlyLhTWXAOvYSEEWwns/S4zgEHwFWUeb0iPm8U9O7BfQzPlC5V
	xXp8QrmxieoHJxowA8IBBTBYZt+sI8LfChDgFuDV33dKV0qEoB4siWGLvrqCeEw8eSGP43S+dye7C
	wuqGmTWhXw5IFo3DZgLaCSk9UqAE2CHc8aNUKkFLOapk0y/kvpsDEDVKUPimEUWFe1zPkmn18OVNk
	LYPsbOpw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbQ7-000000061mT-3ziz
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 07:08:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A178E4E40B52;
	Thu, 11 Sep 2025 07:08:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70A53606BB;
	Thu, 11 Sep 2025 07:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CA29102F28AF;
	Thu, 11 Sep 2025 09:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757574515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eAKEcYhJqeo3WpbpnN9yL0ePD0pDirbDTpiQAUZj6l8=;
	b=KG+eNPYXCREyj3lyG85m4mI9JA/fjr6GoroXKBsJ71JPWT8Htfbsh8sGzHliQlySONeGxD
	Z445mci8fK8dZlZSDbtbc/z/+ay+J+bpqXg5k/1/yoWuMt7FhJKNSYF1F+Ua6BbNhgVbsp
	5nKy9ec9Xq+9Pa1JUC/3L+lzRqrZw/6gSmr6tLp0Be1tpOk1mXN4Mv9Ne+CNUcncZevkoH
	NqX+mfL1VbteQgbhA62OHhhk3ItozgUcFlJQA2gqdKK/V5cIKwew82zpi2BtDqvP8RXbfh
	6rU/GipcfqLoM/UUS9pJOW7Outko6AewFsJLlNeYbsMrPjErQO8fhFwVBE9otw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  tudor.ambarus@linaro.org,  mmkurbanov@salutedevices.com,
  Takahiro.Kuwano@infineon.com,  pratyush@kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
In-Reply-To: <20250910163631.GA142639-robh@kernel.org> (Rob Herring's message
	of "Wed, 10 Sep 2025 11:36:31 -0500")
References: <20250910030301.1368372-1-linchengming884@gmail.com>
	<20250910030301.1368372-2-linchengming884@gmail.com>
	<87wm66d67k.fsf@bootlin.com> <20250910163631.GA142639-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 11 Sep 2025 09:08:12 +0200
Message-ID: <87jz25bh5v.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_080840_570537_62085A85 
X-CRM114-Status: GOOD (  14.38  )
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

SGksCgpPbiAxMC8wOS8yMDI1IGF0IDExOjM2OjMxIC0wNSwgUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDExOjA5OjM1QU0gKzAy
MDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhlbGxvIENoZW5nIE1pbmcsCj4+IAo+PiBPbiAx
MC8wOS8yMDI1IGF0IDExOjAyOjU5ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxpbmNoZW5nbWluZzg4
NEBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdt
aW5nbGluQG14aWMuY29tLnR3Pgo+PiA+Cj4+ID4gQWRkIGEgbmV3IGJvb2xlYW4gcHJvcGVydHkg
ImVuYWJsZS1yYW5kb21pemVyLW90cCIgdG8gZW5hYmxlIHRoZQo+PiA+IHJhbmRvbWl6ZXIgZmVh
dHVyZSBvbiBzdXBwb3J0ZWQgU1BJLU5BTkQgZGV2aWNlcy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYt
Ynk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4+ID4gLS0tCj4+
ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQueWFtbCB8
IDQgKysrKwo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+ID4KPj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFu
ZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55
YW1sCj4+ID4gaW5kZXggNzdhODcyN2M3Li40MzJiYzc5ZTkgMTAwNjQ0Cj4+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55YW1sCj4+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55YW1sCj4+
ID4gQEAgLTIxLDYgKzIxLDEwIEBAIHByb3BlcnRpZXM6Cj4+ID4gICAgICBkZXNjcmlwdGlvbjog
RW5jb2RlIHRoZSBjaGlwLXNlbGVjdCBsaW5lIG9uIHRoZSBTUEkgYnVzCj4+ID4gICAgICBtYXhJ
dGVtczogMQo+PiA+ICAKPj4gPiArICBlbmFibGUtcmFuZG9taXplci1vdHA6Cj4+IAo+PiBUaGlz
IGlzIGEgTkFORCB3aWRlIGZlYXR1cmUsIHNvIHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBwcmVm
aXgsIHN1Y2ggYXMKPj4gIm5hbmQsIi4KPgo+ICduYW5kJyBpcyBub3QgYSB2ZW5kb3IsIHNvIG5v
LgoKU29ycnkgZm9yIHRoZSBjb25mdXNpb24gSSBtZWFudCAibmFuZC0iLCBsaWtlIHdlIGFscmVh
ZHkgaGF2ZToKLSBuYW5kLWVjYy1lbmdpbmUKLSBuYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmUKLSBu
YW5kLWVjYy1zdHJlbmd0aAotIG5hbmQtZWNjLXN0ZXAtc2l6ZQpldGMKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
