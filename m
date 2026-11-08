Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F17606A323
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wk2ZOdia;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbrhX1Mb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2hm40pAW0Axoskhx0vGtvm86azdLOwH83oLQ3/N4j5k=; b=Wk2ZOdiayhurm/D2STsEj12hg4
	C1Y4IRxjTYPtWScQz943tHe5gX44guOqlO1URJfzJFEKiO5vnRLhRz+OAuuTD/dG8Y+CDLvJvql6B
	OFTjxvvCIkctftWDw8k51J6QSXbK4jkQ3qzAELSopo2BSJCVon3rYc1MDxZnL5hvAzLO6w02Tj6Xw
	SyYfnI4GvYSkOqF2A/miamQbqEVZw6jQgBC+SQJ+N9CWOdAcx0xbYCt7sQ9UtTmQfmBI7cpDAXeOQ
	/imruDYQasFZZMdVosabaNd8a7N4YVhQbxYd+mrJt6HSiDAhwRYBVnWfT9NPIDscII4f+vr2TrOX1
	PrdZNnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMw-0000000GiF9-0XDP;
	Sun, 08 Nov 2026 21:24:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMu-0000000GiDu-1d6a
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:24:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A7AC44E97;
	Sun,  8 Nov 2026 21:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B46F1F008BC;
	Sun,  8 Nov 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794173044;
	bh=IEAGekji3VdleZTq8jZjwACH7EFeiDvCSWeActRTe8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SbrhX1Mb7R/q0ljoizByY70ZofqjldWWoKKoZwrB+Lmr8xi/yoOzeq8PBAwi3XInU
	 YxDYEiBApEwnDzpVSxRyzOEiJziE70646VcTrw676WDOqZ75FyRC99AqShrjpieS7E
	 QN4zBU+KKlzwz3EHgtIGfJYEzOVzkFXvB32C7TW3Bjn3jIzB+fSIIeZArAXcaTtVkZ
	 7S4SuW8ogivAO8kPyJ26FnIh+ZivTgxf4lKOLhiu0XJLmgosDeKDjM0UMzsA62FVUY
	 rp1kt1Wijy6xQgBpU7S0YmryoxDEa0GKWb3l/APHavjYKDq+6fSBVYMpLl/qud/Jl3
	 Xe7T0dxMbeoEg==
Message-ID: <sashiko-outbox-204074@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Christian Marangi" <ansuelsmth@gmail.com>, "Sricharan
 R" <quic_srichara@quicinc.com>, "Md Sadre Alam" <quic_mdalam@quicinc.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-1-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
 <20261108-submit-qcom-nand-child-probe-errors-v1-v1-1-509f30a9e14d@gmail.com>
Date: Sun, 08 Nov 2026 21:24:03 +0000
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
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBtdGQ6IHJhd25h
bmQ6IHFjb206IHVubG9ja2VkIGJhbV90eG4gcmVhbGxvY2F0aW9uIGluCiAgcWNvbV9uYW5kX2F0
dGFjaF9jaGlwKCkgWzFdCi0tCgpjb21taXQgYWVjZmIzOTE2MGRhMzdmNjhiYzliNTU3ZmNmZTg0
NDZiODcxOTM5ZQpBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgoKbXRkOiByYXduYW5kOiBxY29tOiBwYXJzZSBib290IHBhcnRpdGlvbnMgYmVmb3JlIHJl
Z2lzdGVyaW5nIE1URAoKVGhpcyBjb21taXQgcGFyc2VzIGJvb3QgcGFydGl0aW9ucyBpbiBxY29t
X25hbmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcigpCmJlZm9yZSBjYWxsaW5nIG10ZF9kZXZpY2Vf
cGFyc2VfcmVnaXN0ZXIoKSBzbyB0aGF0IHBhcnNpbmcgZXJyb3JzIGRvIG5vdApjYWxsIG5hbmRf
Y2xlYW51cCgpIG9uIGFuIGFscmVhZHkgcmVnaXN0ZXJlZCBNVEQgZGV2aWNlLgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMmQ5OGY3OWI0OTJkNi4uZjI0MGQxZWZmYTA0MyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjA1MiwxNiArMjA1MiwxNiBA
QCBzdGF0aWMgaW50IHFjb21fbmFuZF9ob3N0X2luaXRfYW5kX3JlZ2lzdGVyKHN0cnVjdCBxY29t
X25hbmRfY29udHJvbGxlciAqbmFuZGMsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4g
IAo+IC0JcmV0ID0gbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcihtdGQsIHByb2JlcywgTlVMTCwg
TlVMTCwgMCk7Cj4gLQlpZiAocmV0KQo+IC0JCWdvdG8gZXJyOwo+IC0KPiAgCWlmIChuYW5kYy0+
cHJvcHMtPnVzZV9jb2Rld29yZF9maXh1cCkgewo+ICAJCXJldCA9IHFjb21fbmFuZF9ob3N0X3Bh
cnNlX2Jvb3RfcGFydGl0aW9ucyhuYW5kYywgaG9zdCwgZG4pOwo+ICAJCWlmIChyZXQpCj4gIAkJ
CWdvdG8gZXJyOwo+ICAJfQo+ICAKPiArCXJldCA9IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIo
bXRkLCBwcm9iZXMsIE5VTEwsIE5VTEwsIDApOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGVycjsK
CltTZXZlcml0eTogTWVkaXVtXQpUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhp
cyBwYXRjaCwgYnV0IGNhbiBxY29tX25hbmRfYXR0YWNoX2NoaXAoKQpmcmVlIGFuZCByZWFsbG9j
YXRlIG5hbmRjLT5iYW1fdHhuIFsxXSB3aGlsZSBhbiBlYXJsaWVyIGNoaXAgaXMgYWxyZWFkeQpy
ZWdpc3RlcmVkIGFuZCBzZXJ2aWNpbmcgSS9PPwoKcWNvbV9wcm9iZV9uYW5kX2RldmljZXMoKSBj
YWxscyBxY29tX25hbmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcigpIGZvciBlYWNoCmNoaWxkIG5v
ZGUgaW4gdHVybi4gIE9uY2UgdGhlIGZpcnN0IGNoaXAgaXMgcmVnaXN0ZXJlZCwgTVREIG9wZXJh
dGlvbnMgb24gaXQKdGFrZSBuYW5kYy0+Y29udHJvbGxlci5sb2NrIGFuZCB1c2UgdGhlIGNvbnRy
b2xsZXItd2lkZSBuYW5kYy0+YmFtX3R4biwgd2hpbGUKcHJvYmluZyBhIHNlY29uZCBjaGlwIHJ1
bnMgcWNvbV9uYW5kX2F0dGFjaF9jaGlwKCkgd2l0aG91dCBob2xkaW5nCm5hbmRjLT5jb250cm9s
bGVyLmxvY2s6Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6cWNvbV9uYW5kX2F0
dGFjaF9jaGlwKCkgewoJLi4uCglpZiAobmFuZGMtPnByb3BzLT5zdXBwb3J0c19iYW0pCgkJcWNv
bV9mcmVlX2JhbV90cmFuc2FjdGlvbihuYW5kYyk7CgoJbmFuZGMtPm1heF9jd3BlcnBhZ2UgPSBt
YXhfdCh1bnNpZ25lZCBpbnQsIG5hbmRjLT5tYXhfY3dwZXJwYWdlLAoJCQkJICAgICBjd3BlcnBh
Z2UpOwoKCS8qIE5vdyBhbGxvY2F0ZSB0aGUgQkFNIHRyYW5zYWN0aW9uIGJhc2VkIG9uIHVwZGF0
ZWQgbWF4X2N3cGVycGFnZSAqLwoJaWYgKG5hbmRjLT5wcm9wcy0+c3VwcG9ydHNfYmFtKSB7CgkJ
bmFuZGMtPmJhbV90eG4gPSBxY29tX2FsbG9jX2JhbV90cmFuc2FjdGlvbihuYW5kYyk7CgkJaWYg
KCFuYW5kYy0+YmFtX3R4bikgewoJCQlkZXZfZXJyKG5hbmRjLT5kZXYsCgkJCQkiZmFpbGVkIHRv
IGFsbG9jYXRlIGJhbSB0cmFuc2FjdGlvblxuIik7CgkJCXJldHVybiAtRU5PTUVNOwoJCX0KCX0K
CS4uLgp9CgpUaGlzIGFsbG93cyB0aGUgc2Vjb25kIGNoaXAncyBzY2FuIHRvIGZyZWUgbmFuZGMt
PmJhbV90eG4gdW5kZXJuZWF0aCBhbgppbi1mbGlnaHQgb3BlcmF0aW9uIG9uIHRoZSBmaXJzdCBj
aGlwOgoKQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKcWNvbV9w
cm9iZV9uYW5kX2RldmljZXMoKQogIHFjb21fbmFuZF9ob3N0X2luaXRfYW5kX3JlZ2lzdGVyKCkK
ICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIoKSBbY2hpcCAwXQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbmFuZF9yZWFkX29vYigpIFtjaGlwIDBdCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbmRfZ2V0X2RldmljZSgpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHFjb21fbmFuZGNfcmVhZF9wYWdl
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuLi4KICBxY29t
X25hbmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcigpIFtjaGlwIDFdCiAgICBuYW5kX3NjYW4oKQog
ICAgICAuLi4KICAgICAgICBxY29tX25hbmRfYXR0YWNoX2NoaXAoKQogICAgICAgICAgcWNvbV9m
cmVlX2JhbV90cmFuc2FjdGlvbigpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcWNvbV9jbGVhcl9iYW1fdHJhbnNhY3Rpb24oKQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPC0tIHVzZS1hZnRlci1mcmVlCiAgICAgICAgICBx
Y29tX2FsbG9jX2JhbV90cmFuc2FjdGlvbigpCgpBbHNvLCBpZiBxY29tX2FsbG9jX2JhbV90cmFu
c2FjdGlvbigpIGZhaWxzIGZvciB0aGUgc2Vjb25kIGNoaXAsCm5hbmRjLT5iYW1fdHhuIGlzIGxl
ZnQgTlVMTCB3aGlsZSB0aGUgZmlyc3QgY2hpcCByZW1haW5zIHJlZ2lzdGVyZWQsIGNhdXNpbmcK
c3Vic2VxdWVudCBvcGVyYXRpb25zIG9uIHRoZSBmaXJzdCBjaGlwIHRvIGhpdCBhIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZS4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LWY1
ZWMwOGRiLWEwMzktNGJlNi1iYTY2LTk0NWNmYzZkMTRmNQoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwOC1zdWJtaXQtcWNvbS1u
YW5kLWNoaWxkLXByb2JlLWVycm9ycy12MS12MS0wLTUwOWYzMGE5ZTE0ZEBnbWFpbC5jb20/cGFy
dD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
