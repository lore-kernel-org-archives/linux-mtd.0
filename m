Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44300607F296
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ts/AQpDp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY6Z9IJg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X3nyB6zFOgO9/A7twYVbW+CHuN6uni8V5DpcLqpkB6Y=; b=ts/AQpDpoVzgfdOQVYMARrIOUi
	+iyZ4/ntzI4QfzQtRHDx1+zEe759lf+wHl1BQYpaggSDZioZsdyCqc7zO5GziR/2JRZP8cS6VkSU+
	xAdUgegyNSRDuFBv84lnp4jNwNNp0Hmp4BdmhlAiy+SxTDK6+gGBOflebGV+vprEFDyyxKdBEQzjp
	QLlTRWdZiN9wGVpaoLL2BKgRHjtgKQsq4DMXhxPjARMOw8IwWUB5CqyUltOD62J45QpFkCoxcteVG
	7/G3WyeL25dANukWlt7A5TrIz+/qMKlJUaLLwduAnZqGB4TgZh8La3GFkAUNv8CsVMH/YXY3/idOX
	te8BP9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhLI-00000006riy-1y4d;
	Wed, 04 Nov 2026 20:12:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhLH-00000006rio-2dCV
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 20:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1889F601F6;
	Wed,  4 Nov 2026 20:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C861F00919;
	Wed,  4 Nov 2026 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823138;
	bh=wuHyHxhXScutFhV9vaE/iXpIt+Jl28MAClX6i5xZXBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oY6Z9IJgVNBmTUJiSfqnsvEC+6Q43fxqLrjdiVJsz4Bmx3zxpLkE7u9v+c8ImoXP+
	 4nKcgRHdgMvndosQMUff9KgxxoEiPzFRgA3FPlU7zONR0dC2bHb8fTGB2iyv9TwsZl
	 scXbUjS2L3JPxJbUI6ud1cKYhg8AwB2jr8lzLIO4F39iPELQNHk9/h5CONWdbTbzpc
	 xO002CM7/leH4vzeJDrxaiX4G9UYPJohH6g3Xx/LyZy5gwIshR4luKh8zZoYtDcnbR
	 Avxy7VF9ZwUM1/ILH68XPC+UGj+H3ALFjXaFiq2E0OR+RfG6zHKJ5JxtnGVfrOMdAn
	 QCGVrtUbh8wzw==
Message-ID: <sashiko-outbox-197995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: core: reject OOB transfers starting at the device
 end
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com>
References: <20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com>
Date: Wed, 04 Nov 2026 20:12:18 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBjb3JlOiBt
YXhvb2JsZW4gdW5kZXJmbG93IGluIG10ZF9jaGVja19vb2Jfb3BzKCkgb24gdW5hbGlnbmVkIHNp
emUKLS0KCmNvbW1pdCBmMTYxN2Y4OWZhY2Q5ODVlNWVkOWIzMTRhOWFmM2U0NjkzYWIzODAwCkF1
dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IGNv
cmU6IHJlamVjdCBPT0IgdHJhbnNmZXJzIHN0YXJ0aW5nIGF0IHRoZSBkZXZpY2UgZW5kCgpUaGlz
IGNvbW1pdCB1cGRhdGVzIG10ZF9jaGVja19vb2Jfb3BzKCkgdG8gcmVqZWN0IG5vbmVtcHR5IE9P
QiB0cmFuc2ZlcnMKc3RhcnRpbmcgYXQgb3IgYmV5b25kIG10ZC0+c2l6ZSBzbyB0aGF0IG1heG9v
YmxlbiBkb2VzIG5vdCB1bmRlcmZsb3cgd2hlbgpvcHMtPm9vYm9mZnMgaXMgbm9uemVyby4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUu
Ywo+IGluZGV4IDQ5MWEyN2QwMzE1ZmEuLmI4MmZkN2NjZDExMWQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTE2
NzYsNiArMTY3Niw5IEBAIHN0YXRpYyBpbnQgbXRkX2NoZWNrX29vYl9vcHMoc3RydWN0IG10ZF9p
bmZvICptdGQsIGxvZmZfdCBvZmZzLAo+ICAJaWYgKG9wcy0+b29ibGVuKSB7Cj4gIAkJc2l6ZV90
IG1heG9vYmxlbjsKPiAgCj4gKwkJaWYgKG9mZnMgPj0gbXRkLT5zaXplKQo+ICsJCQlyZXR1cm4g
LUVJTlZBTDsKCltTZXZlcml0eTogTWVkaXVtXQpDYW4gbWF4b29ibGVuIHN0aWxsIHVuZGVyZmxv
dyBpbiBtdGRfY2hlY2tfb29iX29wcygpIHdoZW4gbXRkLT5zaXplIGlzIG5vdAphbGlnbmVkIHRv
IG10ZC0+d3JpdGVzaXplPwoKSW4gZHJpdmVycy9tdGQvbXRkcGFydC5jLCBhbGxvY2F0ZV9wYXJ0
aXRpb24oKSBhbGxvd3MgcmVnaXN0ZXJpbmcgcmVhZC1vbmx5CnBhcnRpdGlvbnMgd2hvc2Ugc2l6
ZSBpcyBub3QgYSBtdWx0aXBsZSBvZiB3cml0ZXNpemU6Cgpkcml2ZXJzL210ZC9tdGRwYXJ0LmM6
YWxsb2NhdGVfcGFydGl0aW9uKCkgewoJLi4uCgl0bXAgPSBtdGRfZ2V0X21hc3Rlcl9vZnMoY2hp
bGQsIDApICsgY2hpbGQtPnBhcnQuc2l6ZTsKCXJlbWFpbmRlciA9IGRvX2Rpdih0bXAsIHdyX2Fs
aWdubWVudCk7CglpZiAoKGNoaWxkLT5mbGFncyAmIE1URF9XUklURUFCTEUpICYmIHJlbWFpbmRl
cikgewoJCWNoaWxkLT5mbGFncyAmPSB+TVREX1dSSVRFQUJMRTsKCQlwcmludGsoS0VSTl9XQVJO
SU5HIm10ZDogcGFydGl0aW9uIFwiJXNcIiBkb2Vzbid0IGVuZCBvbiBhbiBlcmFzZS93cml0ZSBi
bG9jayAtLSBmb3JjZSByZWFkLW9ubHlcbiIsCgkJCXBhcnQtPm5hbWUpOwoJfQoKCWNoaWxkLT5z
aXplID0gY2hpbGQtPnBhcnQuc2l6ZTsKCS4uLgp9CgpBbmQgbXRkX2NoZWNrX29vYl9vcHMoKSBj
b21wdXRlcyBtYXhvb2JsZW4gdXNpbmcgZmxvb3IgZGl2aXNpb24gdmlhCm10ZF9kaXZfYnlfd3Mo
KToKCmRyaXZlcnMvbXRkL210ZGNvcmUuYzptdGRfY2hlY2tfb29iX29wcygpIHsKCS4uLgoJCWlm
IChvZmZzID49IG10ZC0+c2l6ZSkKCQkJcmV0dXJuIC1FSU5WQUw7CgoJCWlmIChvcHMtPm9vYm9m
ZnMgPj0gbXRkX29vYmF2YWlsKG10ZCwgb3BzKSkKCQkJcmV0dXJuIC1FSU5WQUw7CgoJCW1heG9v
YmxlbiA9ICgoc2l6ZV90KShtdGRfZGl2X2J5X3dzKG10ZC0+c2l6ZSwgbXRkKSAtCgkJCQkgICAg
ICBtdGRfZGl2X2J5X3dzKG9mZnMsIG10ZCkpICoKCQkJICAgICBtdGRfb29iYXZhaWwobXRkLCBv
cHMpKSAtIG9wcy0+b29ib2ZmczsKCS4uLgp9CgpXaGVuIGEgcmVxdWVzdCBhcnJpdmVzIHZpYSBt
dGRjaGFyX3JlYWRvb2IoKSAtPiBtdGRfcmVhZF9vb2IoKSAtPgptdGRfY2hlY2tfb29iX29wcygp
IHdpdGggYW4gb2Zmc2V0IGluIHRoZSB0cmFpbGluZyBwYXJ0aWFsIHBhZ2UKW210ZF9kaXZfYnlf
d3MobXRkLT5zaXplLCBtdGQpICogbXRkLT53cml0ZXNpemUsIG10ZC0+c2l6ZSkgYW5kIGEgbm9u
emVybwpvcHMtPm9vYm9mZnMsIG9mZnMgPCBtdGQtPnNpemUgaG9sZHMsIGJ1dCBtdGRfZGl2X2J5
X3dzKG9mZnMsIG10ZCkgZXF1YWxzCm10ZF9kaXZfYnlfd3MobXRkLT5zaXplLCBtdGQpLiBTdWJ0
cmFjdGluZyBvcHMtPm9vYm9mZnMgZnJvbSB6ZXJvIHRoZW4KdW5kZXJmbG93cyBtYXhvb2JsZW4g
YW5kIGFsbG93cyByZWFkaW5nIE9PQiBkYXRhIGZyb20gdGhlIHBhZ2UgZXh0ZW5kaW5nCnBhc3Qg
dGhlIHBhcnRpdGlvbiBlbmQuCgpXb3VsZCBjaGVja2luZyBtdGRfZGl2X2J5X3dzKG9mZnMsIG10
ZCkgPj0gbXRkX2Rpdl9ieV93cyhtdGQtPnNpemUsIG10ZCkKaW5zdGVhZCBvZiBvZmZzID49IG10
ZC0+c2l6ZSBhdm9pZCB0aGlzIHVuZGVyZmxvdyBmb3IgdW5hbGlnbmVkIHBhcnRpdGlvbgpzaXpl
cyBhcyB3ZWxsPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MTEwNC1zdWJtaXQtbXRkLW9vYi1lbmQtdjEtdjEtMS01Y2I4YWQ5MjFj
YjBAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
