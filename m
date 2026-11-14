Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3960606A33D
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PJnlGg8z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8ZTGEn0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lPjh+9fc5I8mYLmCrZ3nVM2zgNqx5cOc44/ZCNl41WY=; b=PJnlGg8zVbZGQjjciZZ2I4UGpP
	+HkuP8mdw/4PtRmnykcy2FIlkojKNBv2/JiSdvEE0lzsQ22TynLil20O0QajQoOhQEiu9sCsRhsPT
	AxFslovPWT7I1FnE9stMdYmyIOJ7xZIiDOOCO3UBGmQckat/IVzY6QEVNq8wlcw523tGXCfGRYGDS
	49ZgNLPeVL7qPgjAugradGXy3j7b6uG+YmAQPn3l2Ew9PmICqdmgbqXetV3nOx6AlMdv1FI9yGlQy
	VcR6qny9TnnayWSq+rmr1N8R/iy1aQ0e/dvYNZydysYxUNuS1rAQW6bIn+M+ZHvADc1338Ykmk63z
	mZ/lFa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTf-0000000Fyqq-3UbT;
	Sat, 14 Nov 2026 12:03:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTe-0000000Fyq6-2Dvb
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7CEB6232A;
	Sat, 14 Nov 2026 12:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B21F000C4;
	Sat, 14 Nov 2026 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657805;
	bh=ALzGtljZmngZ99TYML6vyT57I3K5d0MlyVrwhGLF07s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8ZTGEn0qxni0o2KqxTpTR9WvaZxwMw6wYgcu+OafMRCtiRzDVAXMU7/wZ74rgbDB
	 1LocND40CPQPdchDfZSgOlZusuV2b2Jm6PmSzxbXe+UtcgCZxhq7Cayx0Jg+WQs+5S
	 Fgn0yDEfY6VuTU6Kbg6xIhCMSNZtGpQHRSHQT7Ov+hnlN+QHxRE11/pIkaAJwpMSC3
	 85ZDbU7OiQ6CVDl/omSbOx09QyAE6AQk8ZxkNWDw19sm6FcfmyGeBCn4P7CMz0EUvA
	 NEqvQjJ0iP60FlMW/wnjotiw8rWjZFrDQALOU/tpxLhx8piKaT0N8cCt57zYhs9fOY
	 bSV/RrIKt+71g==
Message-ID: <sashiko-outbox-214456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/33] fs: add a generic emergency read-only state
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, "Jan
 Kara" <jack@suse.cz>, dsterba@suse.cz, tytso@mit.edu, "Mark Fasheh" <mark@fasheh.com>, "Joel
 Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-5-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-5-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:24 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIHZmczogY2hhbmdlX21v
dW50X3JvX3N0YXRlKCkgc2tpcHMgbW50X21ha2VfcmVhZG9ubHkoKSBvbgogIHNiX2VtZXJnZW5j
eV9ybygpCi0gW0xvd10gcXVvdGE6IGRvX3F1b3RhY3RsKCkgbWlzc2VzIHNiX2VtZXJnZW5jeV9y
bygpIGluIFFfWFFVT1RBU1lOQwogIGFuZCBRX1NZTkMKLS0KCmNvbW1pdCBhYTE2N2QzNTZiNDE2
YzFjNDBkYTcyZmIyMTViOWQ5ODhjYjQxMWJjCkF1dGhvcjogQ2hyaXN0aWFuIEJyYXVuZXIgPGJy
YXVuZXJAa2VybmVsLm9yZz4KCmZzOiBhZGQgYSBnZW5lcmljIGVtZXJnZW5jeSByZWFkLW9ubHkg
c3RhdGUKClRoaXMgY29tbWl0IGFkZHMgYW4gU0JfU1RBVEVfRU1FUkdFTkNZX1JPIHN1cGVyYmxv
Y2sgc3RhdGUgZmxhZyBhbmQKdXBkYXRlcyBWRlMgcGF0aHMgdG8gcmVqZWN0IG1vZGlmaWNhdGlv
bnMgd2l0aCAtRVJPRlMgd2hlbiBhIGZpbGVzeXN0ZW0Kc3dpdGNoZXMgdG8gZW1lcmdlbmN5IHJl
YWQtb25seSBtb2RlIHdpdGhvdXQgc2V0dGluZyBTQl9SRE9OTFkuCgo+IGRpZmYgLS1naXQgYS9m
cy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFjZS5jCj4gaW5kZXggOWY2ZWMzNWM3YjljZC4uNTVm
YTA5ODE4ZWY5MCAxMDA2NDQKPiAtLS0gYS9mcy9uYW1lc3BhY2UuYwo+ICsrKyBiL2ZzL25hbWVz
cGFjZS5jCj4gQEAgLTM5Niw3ICszOTYsNyBAQCBzdGF0aWMgc3RydWN0IG1vdW50ICphbGxvY192
ZnNtbnQoY29uc3QgY2hhciAqbmFtZSkKPiAgICovCj4gIGJvb2wgX19tbnRfaXNfcmVhZG9ubHko
Y29uc3Qgc3RydWN0IHZmc21vdW50ICptbnQpCj4gIHsKPiAtCXJldHVybiAobW50LT5tbnRfZmxh
Z3MgJiBNTlRfUkVBRE9OTFkpIHx8IHNiX3Jkb25seShtbnQtPm1udF9zYik7Cj4gKwlyZXR1cm4g
KG1udC0+bW50X2ZsYWdzICYgTU5UX1JFQURPTkxZKSB8fCBzYl9yZG9ubHlfYW55KG1udC0+bW50
X3NiKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChfX21udF9pc19yZWFkb25seSk7CgpbU2V2
ZXJpdHk6IE1lZGl1bV0KRG9lcyBjaGFuZ2luZyBfX21udF9pc19yZWFkb25seSgpIHRvIGNoZWNr
IHNiX3Jkb25seV9hbnkoKSBjYXVzZQpjaGFuZ2VfbW91bnRfcm9fc3RhdGUoKSB0byBza2lwIG1u
dF9tYWtlX3JlYWRvbmx5KCkgd2hlbiBzYl9lbWVyZ2VuY3lfcm8oKQppcyBzZXQ/Cgpmcy9uYW1l
c3BhY2UuYzpjaGFuZ2VfbW91bnRfcm9fc3RhdGUoKSB7Cglib29sIHJlYWRvbmx5X3JlcXVlc3Qg
PSAobW50X2ZsYWdzICYgTU5UX1JFQURPTkxZKTsKCglpZiAocmVhZG9ubHlfcmVxdWVzdCA9PSBf
X21udF9pc19yZWFkb25seSgmbW50LT5tbnQpKQoJCXJldHVybiAwOwoKCWlmIChyZWFkb25seV9y
ZXF1ZXN0KQoJCXJldHVybiBtbnRfbWFrZV9yZWFkb25seShtbnQpOwogICAgLi4uCn0KCldoZW4g
YSByZWFkLXdyaXRlIG1vdW50IGhhcyBvcGVuIHdyaXRhYmxlIGZpbGVzIG9yIGFjdGl2ZSB3cml0
ZXJzIGFuZCB0aGUKZmlsZXN5c3RlbSBlbnRlcnMgU0JfU1RBVEVfRU1FUkdFTkNZX1JPLCBhIG1v
dW50KDIpIGNhbGwgd2l0aApNU19SRU1PVU5UIHwgTVNfQklORCB8IE1TX1JET05MWSAoZG9fcmVj
b25maWd1cmVfbW50KCkpIHNlZXMKX19tbnRfaXNfcmVhZG9ubHkoKSA9PSB0cnVlLCBza2lwcyBt
bnRfbWFrZV9yZWFkb25seSgpLCBhbmQgc2V0cwpNTlRfUkVBRE9OTFkgdmlhIHNldF9tb3VudF9h
dHRyaWJ1dGVzKCkgd2l0aG91dCBjYWxsaW5nCm1udF9ob2xkX3dyaXRlcnMoKS4gIElmIHJlY29u
ZmlndXJlX3N1cGVyKCkgaXMgbGF0ZXIgY2FsbGVkIHRvIHJlbW91bnQgdGhlCnN1cGVyYmxvY2sg
cmVhZC1vbmx5LCBzYl9wcmVwYXJlX3JlbW91bnRfcmVhZG9ubHkoKSBza2lwcyBtb3VudHMgdGhh
dAphbHJlYWR5IGhhdmUgTU5UX1JFQURPTkxZIHNldCBhbmQgdHJhbnNpdGlvbnMgdGhlIHN1cGVy
YmxvY2sgdG8gU0JfUkRPTkxZCndoaWxlIGFjdGl2ZSB3cml0ZXJzIHJlbWFpbiBvbiB0aGF0IG1v
dW50LgoKWyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZnMvcXVvdGEvcXVvdGEuYyBiL2ZzL3F1b3Rh
L3F1b3RhLmMKPiBpbmRleCAzM2JhY2Q3MDc1ODAwLi5iNDg4ZmIxZjljYzQ0IDEwMDY0NAo+IC0t
LSBhL2ZzL3F1b3RhL3F1b3RhLmMKPiArKysgYi9mcy9xdW90YS9xdW90YS5jCj4gQEAgLTc4Myw2
ICs3ODMsMTkgQEAgc3RhdGljIGludCBkb19xdW90YWN0bChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNi
LCBpbnQgdHlwZSwgaW50IGNtZCwgcWlkX3QgaWQsCj4gIAlpZiAocmV0IDwgMCkKPiAgCQlyZXR1
cm4gcmV0Owo+ICAKPiArCS8qIEFuIGVycm9yIG1hZGUgdGhlIGZpbGVzeXN0ZW0gcmVhZC1vbmx5
LiAqLwo+ICsJaWYgKHNiX2VtZXJnZW5jeV9ybyhzYikpIHsKPiArCQlzd2l0Y2ggKGNtZCkgewo+
ICsJCWNhc2UgUV9RVU9UQU9OOgo+ICsJCWNhc2UgUV9TRVRJTkZPOgo+ICsJCWNhc2UgUV9TRVRR
VU9UQToKPiArCQljYXNlIFFfWFFVT1RBT046Cj4gKwkJY2FzZSBRX1hRVU9UQVJNOgo+ICsJCWNh
c2UgUV9YU0VUUUxJTToKPiArCQkJcmV0dXJuIC1FUk9GUzsKPiArCQl9Cj4gKwl9Cj4gKwo+ICAJ
c3dpdGNoIChjbWQpIHsKPiAgCWNhc2UgUV9RVU9UQU9OOgo+ICAJCXJldHVybiBxdW90YV9xdW90
YW9uKHNiLCB0eXBlLCBpZCwgcGF0aCk7CgpbU2V2ZXJpdHk6IExvd10KU2hvdWxkIFFfWFFVT1RB
U1lOQyBhbmQgUV9TWU5DIGFsc28gYmUgcmVqZWN0ZWQgaGVyZSB3aGVuCnNiX2VtZXJnZW5jeV9y
byhzYikgaXMgc2V0IChhbmQgcXVvdGFfc3luY19vbmUoKSBndWFyZGVkIGJ5CiFzYl9yZG9ubHlf
YW55KHNiKSk/CgpJbiBkb19xdW90YWN0bCgpLCBRX1hRVU9UQVNZTkMgc3RpbGwgY2hlY2tzIHNi
X3Jkb25seShzYikgaW5zdGVhZCBvZgpzYl9yZG9ubHlfYW55KHNiKSwgcmV0dXJuaW5nIDAgcmF0
aGVyIHRoYW4gLUVST0ZTIGluIGVtZXJnZW5jeSByZWFkLW9ubHkKbW9kZToKCmZzL3F1b3RhL3F1
b3RhLmM6ZG9fcXVvdGFjdGwoKSB7CiAgICAuLi4KCWNhc2UgUV9YUVVPVEFTWU5DOgoJCWlmIChz
Yl9yZG9ubHkoc2IpKQoJCQlyZXR1cm4gLUVST0ZTOwoJCS8qIFhGUyBxdW90YXMgYXJlIGZ1bGx5
IGNvaGVyZW50IG5vdywgbWFraW5nIHRoaXMgY2FsbCBhIG5vb3AgKi8KCQlyZXR1cm4gMDsKICAg
IC4uLgp9CgpRX1NZTkMgYW5kIHF1b3RhX3N5bmNfb25lKCkgYWxzbyBjYWxsIC0+cXVvdGFfc3lu
YygpIGRpcmVjdGx5LCByZWx5aW5nIG9uCmRxdW90X3F1b3RhX3N5bmMoKSByYXRoZXIgdGhhbiBk
b19xdW90YWN0bCgpIHRvIHJlamVjdCBlbWVyZ2VuY3kgcmVhZC1vbmx5CnN1cGVyYmxvY2tzLgoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MTExMy13b3JrLWZzLXNiX3Jkb25seS12My0wLTBiZTkyYmI3MzcwOUBrZXJuZWwub3JnP3Bh
cnQ9NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
