Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50664606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2XIoAS6f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hdp+poGY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S0ShhI0bOIVW0nkVSDw43pcilLsM4xo0JY+L7MOAatQ=; b=2XIoAS6fHsFwU6HLxD2rF17Zz3
	F+/pE750Q2XURrOIl/ONQe/8PYyg+hKGFuqM3TlQZwey9P5G1jZlid1ExSGk3CfjorV5K+3IZUgh3
	Aiguw5q9Riv5j7kvGFZcSAA21snIhBg1+B6VYxc/8VxxeucpgeobX2ClQnW5GXc+S1vgWa3+lT4tu
	CgG5DMt1CRsJI+YXOxKw5PEXRziEWDg5Rb/iXHdgBxFrEe6ad7Od2kxlzUdtd0tYES5Pyzr4tlyaV
	nnLJzCIDDILczXO6Qtwhu8tiT2jGR9v8RjW3tlixTxIOQZ5aAMA//hOaM2/5Sjt75d9VXRW/nJQki
	jrVmFp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDBq-0000000GxDq-1vd7;
	Mon, 09 Nov 2026 00:24:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDBo-0000000GxDj-1UVA
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 00:24:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEEDF44E7D;
	Mon,  9 Nov 2026 00:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635811F008A1;
	Mon,  9 Nov 2026 00:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794183887;
	bh=wgTbmYdbbylREP3ad0b2bpYpKYbNFz3nBy0mrIEJaG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdp+poGY8oZU9fj5H82uPyYeV3do1DOr9H6Jqb479Vu1p8pFMOPZZweqL9pzMbYqk
	 UMNnR+sNaqTR4/hqdbWorw1tTBiGHxhDsgUY3EJn/JKaZj4yD+5nJirCoKaqrl9TXy
	 dnRw5g4Bxr5tRCfKGI2dLn6UJ7QBhpQ6R5CSr13DMZS7YwVD0wsE2Mof7l67tqjV03
	 7tCwwjJ1uXqfjrpM/+FDV5HFnBmO9dDmOl3RrwRIUbHqMhbaxefkXzb50YrPJ91MFW
	 cxEEfEeyZmf4WElIbaKO1t6hZ5KV+oNSo4cGuZkuZhud/WFtI88iyB2jP8BngWVR/c
	 GR1sE3hHgmuyg==
Message-ID: <sashiko-outbox-204208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: r852: disable the engine when card
 registration fails
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-r852-registration-unwind-v1-v1-1-e54be2c652c2@gmail.com>
References: <20261108-submit-r852-registration-unwind-v1-v1-1-e54be2c652c2@gmail.com>
Date: Mon, 09 Nov 2026 00:24:46 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gbXRkOiByYXduYW5k
OiByODUyOiBpZ25vcmVkIHNtX2NvbnRyb2xsZXJfb3BzIGluCiAgc21fcmVnaXN0ZXJfZGV2aWNl
KCkgWzFdCi0tCgpjb21taXQgYjBkYjI1NmMwZTdlOTVhNTc3ODhlZjM3N2I0OTNmMWRhZTlkMjIx
OApBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRk
OiByYXduYW5kOiByODUyOiBkaXNhYmxlIHRoZSBlbmdpbmUgd2hlbiBjYXJkIHJlZ2lzdHJhdGlv
biBmYWlscwoKVGhpcyBjb21taXQgY2FsbHMgcjg1Ml9lbmdpbmVfZGlzYWJsZSgpIGluIHRoZSBl
cnJvciBwYXRoIG9mCnI4NTJfcmVnaXN0ZXJfbmFuZF9kZXZpY2UoKSB3aGVuIHNtX3JlZ2lzdGVy
X2RldmljZSgpIG9yCmRldmljZV9jcmVhdGVfZmlsZSgpIGZhaWxzLgoKTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci9zYXNoaWtvLW91dGJveC0yMDQxNjlAa2VybmVsLm9yZy8KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3I4NTIuYwo+IGluZGV4IDkyYzQ3ZDM1MWMyNzguLjA3M2Y5NmY3M2JlMzYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcjg1Mi5jCj4gQEAgLTY1Niw2ICs2NTYsNyBAQCBzdGF0aWMgaW50IHI4NTJfcmVnaXN0
ZXJfbmFuZF9kZXZpY2Uoc3RydWN0IHI4NTJfZGV2aWNlICpkZXYpCj4gIAlXQVJOX09OKG10ZF9k
ZXZpY2VfdW5yZWdpc3RlcihuYW5kX3RvX210ZChkZXYtPmNoaXApKSk7Cj4gIAluYW5kX2NsZWFu
dXAoZGV2LT5jaGlwKTsKPiAgZXJyb3IxOgo+ICsJcjg1Ml9lbmdpbmVfZGlzYWJsZShkZXYpOwo+
ICAJLyogRm9yY2UgY2FyZCByZWRldGVjdCAqLwo+ICAJZGV2LT5jYXJkX2RldGVjdGVkID0gMDsK
PiAgCXJldHVybiAtMTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRy
b2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHNtX3JlZ2lzdGVyX2RldmljZSgpCmNhbGxl
ZCBlYXJsaWVyIGluIHI4NTJfcmVnaXN0ZXJfbmFuZF9kZXZpY2UoKSBoYXZlIGl0cyBzbV9jb250
cm9sbGVyX29wcwppZ25vcmVkIFsxXT8KCnI4NTJfcHJvYmUoKSBpbml0aWFsaXplcyBjaGlwLT5j
b250cm9sbGVyIHRvICZkZXYtPmNvbnRyb2xsZXIgKHdpdGgKcjg1Ml9vcHMpLCB3aGlsZSBzbV9y
ZWdpc3Rlcl9kZXZpY2UoKSBzZXRzIHNtX2NvbnRyb2xsZXJfb3BzIG9uCmNoaXAtPmxlZ2FjeS5k
dW1teV9jb250cm9sbGVyOgoKZHJpdmVycy9tdGQvbmFuZC9yYXcvc21fY29tbW9uLmM6c21fcmVn
aXN0ZXJfZGV2aWNlKCkgewogICAgLi4uCgljaGlwLT5sZWdhY3kuZHVtbXlfY29udHJvbGxlci5v
cHMgPSAmc21fY29udHJvbGxlcl9vcHM7CglmbGFzaF9pZHMgPSBzbWFydG1lZGlhID8gbmFuZF9z
bWFydG1lZGlhX2ZsYXNoX2lkcyA6IG5hbmRfeGRfZmxhc2hfaWRzOwoJcmV0ID0gbmFuZF9zY2Fu
X3dpdGhfaWRzKGNoaXAsIDEsIGZsYXNoX2lkcyk7CiAgICAuLi4KfQoKQmVjYXVzZSBjaGlwLT5j
b250cm9sbGVyIGlzIGFscmVhZHkgbm9uLU5VTEwsIG5hbmRfc2V0X2RlZmF1bHRzKCkgaWdub3Jl
cwpkdW1teV9jb250cm9sbGVyLCBzbyBuYW5kX2F0dGFjaCgpIGNhbGxzIHI4NTJfYXR0YWNoX2No
aXAoKSB3aXRob3V0IGNhbGxpbmcKc21fYXR0YWNoX2NoaXAoKSwgbGVhdmluZyB0aGUgY2FyZCdz
IE9PQiBsYXlvdXQsIGJhZC1ibG9jayBtYXJrZXIKcGFyYW1ldGVycywgYW5kIHBhZ2Utc2l6ZSB2
YWxpZGF0aW9uIHVuY29uZmlndXJlZC4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xp
bnV4LTRkNGY5Y2ZhLTA3YWMtNDMxOS05OTI3LTNhY2Y0Y2Y3MGNhMwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwOC1zdWJtaXQt
cjg1Mi1yZWdpc3RyYXRpb24tdW53aW5kLXYxLXYxLTEtZTU0YmUyYzY1MmMyQGdtYWlsLmNvbT9w
YXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
