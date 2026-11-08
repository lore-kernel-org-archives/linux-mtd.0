Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C6606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HOJqoL2G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrmPpubN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5qS6ODNLQEOGSGaWfeo3bi3jgB4t0CKbX0u1MBAzBAE=; b=HOJqoL2GX0an53KarYuRWnCjic
	IqkBcH6SqXcOWZeEv0RDRyUuNbet0Y2bCf/pAabnE6Po9F0ER4x/3lckkwl4T+PRenRkfib/7hxJI
	/J0i70/3bqqrjULc+NsG+QCh28qc594H0pwmcCV8Qd0ib5a3DPIjsvLrxZ0SXl5u1VvtrBR8U6lHh
	ELkpIYx4ixQuTxbgy40jYR5svASrEUGR325jh7l+3rdtXYGipCckkLjxABbTnoyFNuYR80YgOAX4K
	gkF1YKOQfboTNJIgTFjtFZ51tIPcuZ8PMFS+WRBguew6JjnobbH2ga3aEAXyixVzPVSU7plG0phbV
	27x7VxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAVB-0000000Gjir-0f5U;
	Sun, 08 Nov 2026 21:32:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAV7-0000000Gjii-3Ipy
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:32:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C24C601F8;
	Sun,  8 Nov 2026 21:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BE11F0089F;
	Sun,  8 Nov 2026 21:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794173552;
	bh=7Sb5zx/QOe6LyAnW6VI3H12P2h8br/1fKhRYFJEDwec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrmPpubNcL604JdqBm905kMPVkOFwNiI4Myg06yNQURlnq+Umg0KNS9LSnDZKpjr5
	 tT4enrgQLYe+Dvu7OwuywLbBdvb4Tg6dLYUGhPaPkh94X/9/jU29ANTbJoQahAr1qj
	 QxbNMA1Z9ntqe5psjDnpJBlT+PHldsMnM0cowr4YcMJc2jAFB9cYzKu63lhNp7Qn0c
	 cglGLILmSehF4uYSOQYjUhMg0NUJF0KBzrgKrwCoIAkKccP34hVw35Dq0rNYXQ+c28
	 B6XTcjTVKDJq6u6JM7+nU//cf+IRkJj3JNtYKavH+rUnEthypMtJ2WdoBL5b7TS/g0
	 CU2Y0He1WnUsg==
Message-ID: <sashiko-outbox-204080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Boris Brezillon" <bbrezillon@kernel.org>, "Kyle
 Roeschley" <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-rawnand-operation-locking-v1-v1-1-565010fc5f8b@gmail.com>
References: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
 <20261108-submit-rawnand-operation-locking-v1-v1-1-565010fc5f8b@gmail.com>
Date: Sun, 08 Nov 2026 21:32:32 +0000
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
bmQ6IG1hY3Jvbml4OiBjbG9iYmVyZWQgZXJyb3IgcmV0dXJuIGluCiAgX19tYWNyb25peF8zMGxm
eGcxOGFjX3J3X290cCgpIFsxXQotLQoKY29tbWl0IGM2ZDJhM2M0ZmRhYjAyYzBmN2Q4MWJkOTJh
MTk5ODg5OGFhYTJiODMKQXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KCm10ZDogcmF3bmFuZDogbWFjcm9uaXg6IHNlcmlhbGl6ZSBPVFAgYWNjZXNzIHdp
dGggTkFORCBvcGVyYXRpb25zCgpUaGlzIGNvbW1pdCBleHBvc2VzIG5hbmRfZ2V0X2RldmljZSgp
IGFuZCBuYW5kX3JlbGVhc2VfZGV2aWNlKCkgd2l0aGluIHRoZQpyYXcgTkFORCBjb3JlIGFuZCB1
c2VzIHRoZW0gdG8gc2VyaWFsaXplIE1hY3Jvbml4IE9UUCB0cmFuc2FjdGlvbnMgd2l0aApub3Jt
YWwgTkFORCBvcGVyYXRpb25zIGFuZCBzdXNwZW5kIGhhbmRsaW5nLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9tYWNyb25peC5jCj4gaW5kZXggMDMyMzczMTA4NTJjYi4uNGZlNzAzNmFlOTkyMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKPiBAQCAtMzgwLDYgKzM4MCw3
IEBAIHN0YXRpYyBpbnQgX19tYWNyb25peF8zMGxmeGcxOGFjX3J3X290cChzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKPiAgCWludCByZXQ7Cj4gIAo+ICAJbmFuZCA9IG10ZF90b19uYW5kKG10ZCk7Cj4g
KwluYW5kX2dldF9kZXZpY2UobmFuZCk7Cj4gIAluYW5kX3NlbGVjdF90YXJnZXQobmFuZCwgMCk7
Cj4gIAo+ICAJcmV0ID0gbWFjcm9uaXhfMzBsZnhnMThhY19vdHBfZW5hYmxlKG5hbmQpOwo+IEBA
IC00MjYsNiArNDI3LDcgQEAgc3RhdGljIGludCBfX21hY3Jvbml4XzMwbGZ4ZzE4YWNfcndfb3Rw
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJCQl3cml0ZSA/ICJ3cml0ZSIgOiAicmVhZCIpOwo+
ICAKPiAgCW5hbmRfZGVzZWxlY3RfdGFyZ2V0KG5hbmQpOwo+ICsJbmFuZF9yZWxlYXNlX2Rldmlj
ZShuYW5kKTsKPiAgCj4gIAlyZXR1cm4gcmV0Owo+ICB9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhp
cyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2Vzbid0IHRo
ZSBvdXRfb3RwCmNsZWFudXAgcGF0aCBjbG9iYmVyIHJldCBbMV0gd2l0aCB0aGUgcmVzdWx0IG9m
Cm1hY3Jvbml4XzMwbGZ4ZzE4YWNfb3RwX2Rpc2FibGUoKT8KCmRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbWFjcm9uaXguYzpfX21hY3Jvbml4XzMwbGZ4ZzE4YWNfcndfb3RwKCkgewoJLi4uCgly
ZXQgPSBtYWNyb25peF8zMGxmeGcxOGFjX290cF9lbmFibGUobmFuZCk7CglpZiAocmV0KQoJCWdv
dG8gb3V0X290cDsKCS4uLgpvdXRfb3RwOgoJaWYgKHJldCkKCQlkZXZfZXJyKCZtdGQtPmRldiwg
ImZhaWxlZCB0byBwZXJmb3JtIE9UUCBJTzogJWlcbiIsIHJldCk7CgoJcmV0ID0gbWFjcm9uaXhf
MzBsZnhnMThhY19vdHBfZGlzYWJsZShuYW5kKTsKCWlmIChyZXQpCgkJZGV2X2VycigmbXRkLT5k
ZXYsICJmYWlsZWQgdG8gbGVhdmUgT1RQIG1vZGUgYWZ0ZXIgJXNcbiIsCgkJCXdyaXRlID8gIndy
aXRlIiA6ICJyZWFkIik7CgoJbmFuZF9kZXNlbGVjdF90YXJnZXQobmFuZCk7CgluYW5kX3JlbGVh
c2VfZGV2aWNlKG5hbmQpOwoKCXJldHVybiByZXQ7Cn0KCldoZW4gbWFjcm9uaXhfMzBsZnhnMThh
Y19vdHBfZW5hYmxlKCksIG5hbmRfcHJvZ19wYWdlX29wKCksIG9yCm5hbmRfcmVhZF9wYWdlX29w
KCkgZmFpbHMgYW5kIG1hY3Jvbml4XzMwbGZ4ZzE4YWNfb3RwX2Rpc2FibGUoKSB0aGVuCnN1Y2Nl
ZWRzLCBfX21hY3Jvbml4XzMwbGZ4ZzE4YWNfcndfb3RwKCkgcmV0dXJucyAwIHdpdGhvdXQgdXBk
YXRpbmcKKnJldGxlbiwgY2F1c2luZyBjYWxsZXJzIHN1Y2ggYXMgbXRkX3JlYWRfdXNlcl9wcm90
X3JlZygpIHRvIHRyZWF0IE9UUCBJL08KZXJyb3JzIGFzIDAtYnl0ZSB0cmFuc2ZlcnMuICBKdW1w
aW5nIHRvIG91dF9vdHAgd2hlbgptYWNyb25peF8zMGxmeGcxOGFjX290cF9lbmFibGUoKSBmYWls
cyBhbHNvIGNhbGxzCm1hY3Jvbml4XzMwbGZ4ZzE4YWNfb3RwX2Rpc2FibGUoKSBldmVuIHRob3Vn
aCBPVFAgbW9kZSB3YXMgbmV2ZXIgZW5hYmxlZC4KClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMv
YnVnL2xpbnV4LWM2MzllYTQ5LWI5ODAtNDVjNy05ZDc3LWIwZTI2NDk3MDEyNQoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwOC1z
dWJtaXQtcmF3bmFuZC1vcGVyYXRpb24tbG9ja2luZy12MS12MS0wLTU2NTAxMGZjNWY4YkBnbWFp
bC5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
