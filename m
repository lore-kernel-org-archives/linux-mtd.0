Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EC60A263D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 04:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SS3PKpn0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXJsWqxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0DMn/s8g6oZLTl5Jy4KQbrHGqe9dVN86TaMekC4xnVA=; b=SS3PKpn0BOI9XQCJGcpsWaT1Tt
	Ew88BXfJkIVoALQ8rJnDnOIfTV6zlBgFUTVpyLuJ03WQzhDPoeNaoXUIqNTgv/KM7Z0ECm18i7flD
	OKvVONzuNAMCTSXhg+kVzBL23nHBYCVoQ+Jve1WiJFqtnYM/j/ESjkLxWpSbPzh1fG0H2wgvgKdCZ
	Dn1/818QjPmJV4owBAjt+J1/uCmA1K+lI9ui8pACcfb6J3YOqNE7oqwa3UmGhXyDwpeh8KPSid96e
	3hGou37RZCDpyVHZSWPzlTPwHU9gu7xHAMRolVd9KBCsmBtn+oFVL3yy1zZ/8fo468oARq7rLGOZ6
	aX3fGu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGX6-0000000E2u1-3r5b;
	Fri, 20 Nov 2026 04:47:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGX5-0000000E2th-0Iqs
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 04:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8179246B54;
	Fri, 20 Nov 2026 04:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038251F00A00;
	Fri, 20 Nov 2026 04:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795150050;
	bh=DvfMw/WfiZgSpYYlXGzjUdOTbh6gwIkkF/LcC+pn4eU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZXJsWqxYLqJaIHvDWdv9z87yIY0hewnR0QDAvxbRBizRCpxFeXUvTuCKpvIw7l+3/
	 DM9InH0D7d+2ftl3yn/mrMwuZX8ZURzj8Ihumb6WwL8MJrcZFx0cnOT1rk21wJoziI
	 6HSlFgS1cGV3UatiB1cwVi5SVvYexA8OhunJZRH7msOcEAHQIBUFL3GBKR7mCBoyM4
	 0O6FxVaUvs/wBmaYDvY42iQjuaXPbiiQ/1wFBM544o0GqR6bJWkI1CsuZX6l8ecZuv
	 R/pELEl1PfzBOOhID77G+jObBJ+z2sE8AfIlTugRqahM7ejaCbsgXSKVSaTtPw0Uqs
	 CETBIt6aX7CpA==
Message-ID: <sashiko-outbox-224471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: Use I/O memory accessors when in an uncached
To: "Edward Adam Davis" <eadavis@sina.com>, syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Cc: joern@lazybastard.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
In-Reply-To: <20261120043709.99845-1-eadavis@sina.com>
References: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
 <20261120043709.99845-1-eadavis@sina.com>
Date: Fri, 20 Nov 2026 04:47:29 +0000
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
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBtdGQ6IHBocmFtOiB3cm9u
ZyBJL08gYWNjZXNzb3IgbWVtY3B5X2Zyb21pbygpIHVzZWQgaW4KICBwaHJhbV93cml0ZSgpCi0g
W0xvd10gbXRkOiBwaHJhbTogbWlzc2luZyBfX2lvbWVtIGNhc3RzIGluIHBocmFtX2VyYXNlKCks
CiAgcGhyYW1fcmVhZCgpLCBwaHJhbV93cml0ZSgpCi0gW0xvd10gbXRkOiBwaHJhbTogcmVkdW5k
YW50IERUIGxvb2t1cCBvbiBldmVyeSBJL08gaW5zdGVhZCBvZiB1c2luZwogIHBocmFtLT5jYWNo
ZWQKLS0KCmNvbW1pdCA2NTJjODg2ZTkxZmE0MjVlNDEyMmYxZWJjYjllZjBmMmI4NzRmZDI4CkF1
dGhvcjogRWR3YXJkIEFkYW0gRGF2aXMgPGVhZGF2aXNAc2luYS5jb20+CgptdGQ6IFVzZSBJL08g
bWVtb3J5IGFjY2Vzc29ycyB3aGVuIGluIGFuIHVuY2FjaGVkCgpUaGlzIGNvbW1pdCB1c2VzIEkv
TyBtZW1vcnkgYWNjZXNzb3JzIGluc3RlYWQgb2Ygc3RhbmRhcmQgbWVtc2V0KCkgYW5kCm1lbWNw
eSgpIGluIHBocmFtX2VyYXNlKCksIHBocmFtX3JlYWQoKSwgYW5kIHBocmFtX3dyaXRlKCkgd2hl
biB0aGUgcGhyYW0KbWFwcGluZyBpcyB1bmNhY2hlZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL2RldmljZXMvcGhyYW0uYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+IGluZGV4
IGI0MmNhZGNkNzZiMTEuLjk1YmQ1YTlkN2U0ODIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9waHJhbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gQEAg
LTQzLDggKzQzLDEzIEBAIHN0YXRpYyBMSVNUX0hFQUQocGhyYW1fbGlzdCk7Cj4gIHN0YXRpYyBp
bnQgcGhyYW1fZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICpp
bnN0cikKPiAgewo+ICAJdV9jaGFyICpzdGFydCA9IG10ZC0+cHJpdjsKPiArCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnAgPSBtdGRfZ2V0X29mX25vZGUobXRkKTsKPiArCWJvb2wgY2FjaGVkID0gbnAg
PyAhb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAibm8tbWFwIikgOiBmYWxzZTsKCltTZXZlcml0
eTogTG93XQpDYW4gcGhyYW1fZXJhc2UoKSwgcGhyYW1fcmVhZCgpLCBhbmQgcGhyYW1fd3JpdGUo
KSByZWFkCmNvbnRhaW5lcl9vZihtdGQsIHN0cnVjdCBwaHJhbV9tdGRfbGlzdCwgbXRkKS0+Y2Fj
aGVkIGluc3RlYWQgb2YgY2FsbGluZwpvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBvbiBldmVyeSBJ
L08/ICByZWdpc3Rlcl9kZXZpY2UoKSBhbHJlYWR5IGNvbXB1dGVzCnRoaXMgZmxhZyBvbmNlIGFu
ZCBzdG9yZXMgaXQgaW4gbmV3LT5jYWNoZWQuCgo+IC0JbWVtc2V0KHN0YXJ0ICsgaW5zdHItPmFk
ZHIsIDB4ZmYsIGluc3RyLT5sZW4pOwo+ICsJaWYgKGNhY2hlZCkKPiArCQltZW1zZXQoc3RhcnQg
KyBpbnN0ci0+YWRkciwgMHhmZiwgaW5zdHItPmxlbik7Cj4gKwllbHNlCj4gKwkJbWVtc2V0X2lv
KHN0YXJ0ICsgaW5zdHItPmFkZHIsIDB4ZmYsIGluc3RyLT5sZW4pOwoKW1NldmVyaXR5OiBMb3dd
ClNpbmNlIHN0YXJ0IGlzIHVfY2hhciAqLCBwYXNzaW5nIHN0YXJ0ICsgb2Zmc2V0IHRvIG1lbXNl
dF9pbygpLAptZW1jcHlfZnJvbWlvKCksIGFuZCBtZW1jcHlfdG9pbygpIHdpdGhvdXQgYSAodm9p
ZCBfX2lvbWVtICopIGNhc3QKdHJpZ2dlcnMgc3BhcnNlIGFkZHJlc3Mtc3BhY2Ugd2FybmluZ3Mg
YWNyb3NzIHBocmFtX2VyYXNlKCksIHBocmFtX3JlYWQoKSwKYW5kIHBocmFtX3dyaXRlKCkuCgo+
ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gQEAgLTY2LDggKzcxLDEzIEBAIHN0YXRpYyBpbnQgcGhy
YW1fcmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4sCj4g
IAkJc2l6ZV90ICpyZXRsZW4sIHVfY2hhciAqYnVmKQo+ICB7Cj4gIAl1X2NoYXIgKnN0YXJ0ID0g
bXRkLT5wcml2Owo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCA9IG10ZF9nZXRfb2Zfbm9kZSht
dGQpOwo+ICsJYm9vbCBjYWNoZWQgPSBucCA/ICFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJu
by1tYXAiKSA6IGZhbHNlOwo+ICAKPiAtCW1lbWNweShidWYsIHN0YXJ0ICsgZnJvbSwgbGVuKTsK
PiArCWlmIChjYWNoZWQpCj4gKwkJbWVtY3B5KGJ1Ziwgc3RhcnQgKyBmcm9tLCBsZW4pOwo+ICsJ
ZWxzZQo+ICsJCW1lbWNweV9mcm9taW8oYnVmLCBzdGFydCArIGZyb20sIGxlbik7Cj4gIAkqcmV0
bGVuID0gbGVuOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiBAQCAtNzYsOCArODYsMTMgQEAgc3RhdGlj
IGludCBwaHJhbV93cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLCBzaXplX3Qg
bGVuLAo+ICAJCXNpemVfdCAqcmV0bGVuLCBjb25zdCB1X2NoYXIgKmJ1ZikKPiAgewo+ICAJdV9j
aGFyICpzdGFydCA9IG10ZC0+cHJpdjsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBtdGRf
Z2V0X29mX25vZGUobXRkKTsKPiArCWJvb2wgY2FjaGVkID0gbnAgPyAhb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAibm8tbWFwIikgOiBmYWxzZTsKPiAgCj4gLQltZW1jcHkoc3RhcnQgKyB0bywg
YnVmLCBsZW4pOwo+ICsJaWYgKGNhY2hlZCkKPiArCQltZW1jcHkoc3RhcnQgKyB0bywgYnVmLCBs
ZW4pOwo+ICsJZWxzZQo+ICsJCW1lbWNweV9mcm9taW8oc3RhcnQgKyB0bywgYnVmLCBsZW4pOwoK
W1NldmVyaXR5OiBIaWdoXQpTaG91bGQgcGhyYW1fd3JpdGUoKSBjYWxsIG1lbWNweV90b2lvKCkg
aW5zdGVhZCBvZiBtZW1jcHlfZnJvbWlvKCk/CgptZW1jcHlfZnJvbWlvKGRzdCwgc3JjLCBjb3Vu
dCkgdHJlYXRzIHNyYyAoYnVmKSBhcyBfX2lvbWVtIGFuZCBkc3QKKHN0YXJ0ICsgdG8pIGFzIG5v
cm1hbCBSQU06IGl0IGFsaWducyBzcmMgcmF0aGVyIHRoYW4gZHN0IGFuZCB3cml0ZXMgdG8KZHN0
IHZpYSBwdXRfdW5hbGlnbmVkKCkuICBXaGVuIHN0YXJ0ICsgdG8gaXMgbm90IGFsaWduZWQgdG8g
c2l6ZW9mKGxvbmcpLAp3cml0aW5nIHRvIGFuIHVuY2FjaGVkIHBocmFtIGRldmljZSBpc3N1ZXMg
dW5hbGlnbmVkIHdvcmQgc3RvcmVzIHRvCkRldmljZSBtZW1vcnkgYW5kIHRyaWdnZXJzIGFuIGFs
aWdubWVudCBmYXVsdCBvbiBhcm02NC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjAwNDM3MDkuOTk4NDUtMS1lYWRhdmlzQHNp
bmEuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
