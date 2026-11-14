Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32FA606A329
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aIYwzN80;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esVyU56K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OXXRvLWsa7jDKtdQ2wjlblH4urUjVFGBoOpJElF3+AY=; b=aIYwzN805cjKjVcN1RHx7h5ai/
	VxMP6uioy/b17o1a3lJ0Ie5vQ4p2Booi9qtbk7H1JdkbqtJ1ZsjgiLx1INu7907432App7VTl/yZ3
	R05J6iv4P+v7gqi4jPoAz0LYxCwIFOK4gy7oneh7Vgo2ryzuKhnjVjGPP/ix99biH9x1Z1WuS7UHo
	QjjN9rplVSr9dl/y4cwFpbMyImaM+d0A/icn9Q77LT+ncRpmlLmFpQdAxlDVBQTpfxLRsopc1mPBy
	bzw+i/kNbXbK7Z4jtK8m2Ecw22zLgKnHV6alnqMq7brn6dV4XYSZw5X8z0OsHOO0sZb+Rvi6RIoUp
	7gRigzTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJS1-0000000Gg6N-0oPH;
	Sat, 14 Nov 2026 19:30:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJRz-0000000Gg6C-290D
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 19:30:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFEBD43DD2;
	Sat, 14 Nov 2026 19:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AF31F000C4;
	Sat, 14 Nov 2026 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794684610;
	bh=70Pyltyj0g50eXg8Y4TU2n9m2S98khDHAKdgBaMtuu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=esVyU56KYz2OmVvhmZiCgFw95yilf8vSDoIpTQxC1G8Jcpas0qsn2LGZRvSaJbthe
	 rpqmLA3rgqYP+Kh8tFLixJGAHnYJdQfNShwAjueyQccFyNOWoza+7986YFpp1i7fln
	 Wyeheratu4Go/oI57LnlAzRtnP3mfCghCOp6rNE1mR2+PQTAS/8ptN+aDclQ3Dm4Cm
	 ZGuQaUsf+8i1NYn9c8vAna6aAC6JYhL3DbKlXVNYjwDjAKeUuUqafZLz7gL3pX0wEG
	 xi2KJ/fIYu6OPu8AR3Cq+tbppWGLf/nWZKIM9zFt9JUkKhemGkc0eLdnkHOag03ha1
	 rt9j733ZjDHXA==
Message-ID: <sashiko-outbox-214971@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a
 command times out
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Stefan Agner" <stefan@agner.ch>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Brian
 Norris" <computersforpeace@gmail.com>, "Alexey Klimov" <alexey.klimov@linaro.org>, linux-mtd@lists.infradead.org, mehmet.fide@screeningeagle.com
In-Reply-To: <20261114192031.959376-4-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
 <20261114192031.959376-4-mehmet.fide@gmail.com>
Date: Sat, 14 Nov 2026 19:30:09 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiB2
ZjYxMF9uZmM6IC1FVElNRURPVVQgc3dhbGxvd2VkIGluCiAgdmY2MTBfbmZjX3JlYWRfcGFnZSgp
Ci0tCgpjb21taXQgNzRlOTc5NzViMDQzOWYyYjMwYzc5M2UzZGJhNDk4MjQ5ZmI0NzA1YQpBdXRo
b3I6IE1laG1ldCBGaWRlIDxtZWhtZXQuZmlkZUBzY3JlZW5pbmdlYWdsZS5jb20+CgptdGQ6IHJh
d25hbmQ6IHZmNjEwX25mYzogcmV0dXJuIGFuIGVycm9yIHdoZW4gYSBjb21tYW5kIHRpbWVzIG91
dAoKVGhpcyBjb21taXQgcmV0dXJucyAtRVRJTUVET1VUIGZyb20gdmY2MTBfbmZjX2RvbmUoKSBv
biBjb21tYW5kIHRpbWVvdXQgYW5kCnByb3BhZ2F0ZXMgdGhlIGVycm9yIHRocm91Z2ggdmY2MTBf
bmZjX3J1bigpLCB2ZjYxMF9uZmNfY21kKCksIGFuZCB0aGUgcGFnZQpyZWFkIGFuZCB3cml0ZSBo
b29rcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKPiBpbmRleCA1NDdlYjE1MTM4OTM5Li5k
NmQ0YTE4NDMyY2U4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25m
Yy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKClsgLi4uIF0KCj4g
QEAgLTU3Miw3ICs1NzcsNyBAQCBzdGF0aWMgaW50IHZmNjEwX25mY19yZWFkX3BhZ2Uoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgdWludDhfdCAqYnVmLAo+ICAJc3RydWN0IG10ZF9pbmZvICptdGQg
PSBuYW5kX3RvX210ZChjaGlwKTsKPiAgCWludCB0cmZyX3N6ID0gbXRkLT53cml0ZXNpemUgKyB2
ZjYxMF9uZmNfc3BhcmVfc2l6ZShtdGQpOwo+ICAJdTMyIHJvdyA9IDAsIGNtZDEgPSAwLCBjbWQy
ID0gMCwgY29kZSA9IDA7Cj4gLQlpbnQgc3RhdDsKPiArCWludCBzdGF0LCByZXQ7Cj4gIAo+ICAJ
dmY2MTBfbmZjX3NlbGVjdF90YXJnZXQoY2hpcCwgY2hpcC0+Y3VyX2NzKTsKPiAgCj4gQEAgLTU4
Nyw4ICs1OTIsMTAgQEAgc3RhdGljIGludCB2ZjYxMF9uZmNfcmVhZF9wYWdlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwKPiAgCWNtZDIgfD0gY29kZSA8PCBDTURfQ09ERV9T
SElGVDsKPiAgCj4gIAl2ZjYxMF9uZmNfZWNjX21vZGUobmZjLCBuZmMtPmVjY19tb2RlKTsKPiAt
CXZmNjEwX25mY19ydW4obmZjLCAwLCByb3csIGNtZDEsIGNtZDIsIHRyZnJfc3opOwo+ICsJcmV0
ID0gdmY2MTBfbmZjX3J1bihuZmMsIDAsIHJvdywgY21kMSwgY21kMiwgdHJmcl9zeik7Cj4gIAl2
ZjYxMF9uZmNfZWNjX21vZGUobmZjLCBFQ0NfQllQQVNTKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0
dXJuIHJldDsKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHZmNjEwX25mY19yZWFkX3BhZ2UoKSBz
d2FsbG93IC1FVElNRURPVVQgd2hlbiBhIHRpbWVvdXQgb2NjdXJzIGR1cmluZwp0aGUgcmF3IHJl
LXJlYWQgaW4gdmY2MTBfbmZjX2NvcnJlY3RfZGF0YSgpPwoKV2hlbiBoYXJkd2FyZSBFQ0MgcmVw
b3J0cyBhIGRlY29kZSBmYWlsdXJlIChzdWNoIGFzIG9uIGFuIGVyYXNlZCBwYWdlKSwKdmY2MTBf
bmZjX2NvcnJlY3RfZGF0YSgpIHJlLXJlYWRzIHRoZSBwYWdlIGFuZCBPT0IgdmlhIG5hbmRfcmVh
ZF9wYWdlX29wKCkKYW5kIG5hbmRfcmVhZF9vb2Jfb3AoKSwgd2hpY2ggbm93IHJldHVybiAtRVRJ
TUVET1VUIHRocm91Z2ggdmY2MTBfbmZjX2NtZCgpOgoKZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2
MTBfbmZjLmM6dmY2MTBfbmZjX2NvcnJlY3RfZGF0YSgpIHsKCS4uLgoJbmZjLT5kYXRhX2FjY2Vz
cyA9IHRydWU7CglyZXQgPSBuYW5kX3JlYWRfcGFnZV9vcCgmbmZjLT5jaGlwLCBwYWdlLCAwLCBk
YXQsIG10ZC0+d3JpdGVzaXplKTsKCWlmICghcmV0KQoJCXJldCA9IG5hbmRfcmVhZF9vb2Jfb3Ao
Jm5mYy0+Y2hpcCwgcGFnZSwgMCwgb29iLAoJCQkJICAgICAgIHZmNjEwX25mY19zcGFyZV9zaXpl
KG10ZCkpOwoJbmZjLT5kYXRhX2FjY2VzcyA9IGZhbHNlOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0
OwoJLi4uCn0KCmRyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jOnZmNjEwX25mY19yZWFk
X3BhZ2UoKSB7CgkuLi4KCXN0YXQgPSB2ZjYxMF9uZmNfY29ycmVjdF9kYXRhKGNoaXAsIGJ1Ziwg
Y2hpcC0+b29iX3BvaSwgcGFnZSk7CgoJaWYgKHN0YXQgPCAwKSB7CgkJbXRkLT5lY2Nfc3RhdHMu
ZmFpbGVkKys7CgkJcmV0dXJuIDA7Cgl9IGVsc2UgewoJLi4uCn0KCkJlY2F1c2UgdmY2MTBfbmZj
X3JlYWRfcGFnZSgpIHRyZWF0cyBhbnkgbmVnYXRpdmUgc3RhdCBhcyBhbiB1bmNvcnJlY3RhYmxl
CkVDQyBmYWlsdXJlLCBhIHRpbWVvdXQgaW4gdmY2MTBfbmZjX2NvcnJlY3RfZGF0YSgpIGluY3Jl
bWVudHMKbXRkLT5lY2Nfc3RhdHMuZmFpbGVkIGFuZCByZXR1cm5zIDAsIGxlYXZpbmcgdGhlIGJv
Z3VzIEVDQy1jb3JyZWN0ZWQgU1JBTQpkYXRhIGluIGJ1ZiBhbmQgcmVwb3J0aW5nIC1FQkFETVNH
IHRvIHRoZSBjYWxsZXIgaW5zdGVhZCBvZiBhYm9ydGluZyB3aXRoCi1FVElNRURPVVQuICBPbmx5
IHN0YXQgPT0gLUVCQURNU0cgc2hvdWxkIGJlIGNvdW50ZWQgYXMgYW4gRUNDIGZhaWx1cmUsCndo
aWxlIG90aGVyIG5lZ2F0aXZlIGVycm9ycyBzaG91bGQgYmUgcmV0dXJuZWQgZGlyZWN0bHkuCgot
LSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYxMTE0MTkyMDMxLjk1OTM3Ni0xLW1laG1ldC5maWRlQGdtYWlsLmNvbT9wYXJ0PTMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
