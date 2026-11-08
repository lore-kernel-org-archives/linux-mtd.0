Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62E606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPP4UQrg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P4RjrBnN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=drBNEhFhF4NuIWKTIXYBT5c4vlRTBGFaAwrXeF0sbVQ=; b=zPP4UQrgxaVWjuUk1X5fDqmcO8
	NM7lIFl7sOZcJJ7GymSEXGvcdtlvHIlGoxrf392IrrtrPfiZz8So7NYH7Po0nInDDGqMtJwl1hzUU
	uinmVA2DkS0BJVrxsbqCtuEceYqrRWnPGg1ZJdPGCC0hQMB1Oc7OOO0lVvFLYQ3v+6BhS6SmJ6A10
	fs3qMyC0sXz3aGemjqj56izpXPc45mjSM04OMknFd1A1wB/P/jL3tx7HNnPj+dfmo2Ou4DxRp5Vqp
	MLqcWz4bcS8MOGZMZzWB5KBWSpjDsgqPYNAtt/E8CtisTfpd/EXXJ3CkIZjWCZQnVUawtz8CvYzSo
	im4itayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAGa-0000000Ghmr-2EuN;
	Sun, 08 Nov 2026 21:17:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAGZ-0000000Ghml-1h4b
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:17:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E0961D89;
	Sun,  8 Nov 2026 21:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294181F008A1;
	Sun,  8 Nov 2026 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172650;
	bh=3eG7JoY8DKHIfvaH7mikr0YCaFSehRyPBYbxAS4dXKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4RjrBnN8btPcTCPiiaGjdwtVzTKHBuX8xPXN5NSSxnDbwIMkvIDdAMyiYP99i992
	 SbBC61mDjD1MyScdCd7sbQm2y32wtbcPhA/QhOTfT+4gGDM5u34SypwBLACmkilZ7J
	 VGjpzziTilUY4X3ZbFwVvuHdacdUAihXUtPGaO5PSQtJ8pvyro9LAwfdPgpluodqcS
	 EN/HfONzzHgkSMjpSYJ4cremfi+gtLuO2F4zjj7adVL/f/DwJT4vsnXQJwjWK7f9W1
	 ljNiRnyu2BHp2hTTwfoIFR1Vv6GWivXWJX4Xf2eL0/B6hRwCZA/GPW2o6TNIEO/4/I
	 oCChI+qSVwkQg==
Message-ID: <sashiko-outbox-204070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: retain the partition node reference across device
 registration
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Christian
 Marangi" <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-mtd-partition-node-reference-v1-v1-1-ad30359569d4@gmail.com>
References: <20261108-submit-mtd-partition-node-reference-v1-v1-1-ad30359569d4@gmail.com>
Date: Sun, 08 Nov 2026 21:17:29 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBpbmNvcnJlY3QgRml4
ZXMgdHJhaWxlciBjb21taXQgaW4gbXRkX2ZpbmRfb2Zfbm9kZSgpIGNoYW5nZQotLQoKY29tbWl0
IDQzMzIzZTk5YTQ2YTg0Y2ZmMDE5NWM1MzA5OWNhNmE3YTcyMTU0MzIKQXV0aG9yOiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCj4gbXRkOiByZXRhaW4gdGhlIHBh
cnRpdGlvbiBub2RlIHJlZmVyZW5jZSBhY3Jvc3MgZGV2aWNlIHJlZ2lzdHJhdGlvbgo+Cj4gbXRk
X2NoZWNrX29mX25vZGUoKSBvYnRhaW5zIGEgY2hpbGQgbm9kZSByZWZlcmVuY2Ugd2hpbGUgbG9v
a2luZyB1cCBhCj4gcGFydGl0aW9uLCBzdG9yZXMgdGhlIG5vZGUgaW4gdGhlIE1URCBkZXZpY2Us
IGFuZCBkcm9wcyB0aGUgcmVmZXJlbmNlLgo+IGFkZF9tdGRfZGV2aWNlKCkgb25seSB0YWtlcyBp
dHMgb3duIHJlZmVyZW5jZSBhZnRlciB0aGUgaGVscGVyIHJldHVybnMuCj4gQSBjb25jdXJyZW50
IGR5bmFtaWMgRFQgcmVtb3ZhbCBjYW4gcmVsZWFzZSB0aGUgbm9kZSBpbiB0aGF0IGdhcC4KPgo+
IFJldHVybiBhIHJlZmVyZW5jZWQgbm9kZSBmcm9tIHRoZSBsb29rdXAgaGVscGVyIGFuZCB0cmFu
c2ZlciB0aGF0IHJlZmVyZW5jZQo+IHRvIHRoZSBNVEQgZGV2aWNlLiBGb3IgYW4gYWxyZWFkeSBz
dXBwbGllZCBub2RlLCBhY3F1aXJlIHRoZSByZWZlcmVuY2UgaW4KPiB0aGUgc2FtZSBoZWxwZXIu
IFRoZSBleGlzdGluZyByZWdpc3RyYXRpb24gdW53aW5kIGFuZCBkZXZpY2UgcmVsZWFzZSBwYXRo
cwo+IHJlbWFpbiByZXNwb25zaWJsZSBmb3IgcHV0dGluZyBpdC4KPgo+IEZpeGVzOiBhZDliMTBk
MWVhYWQgKCJtdGQ6IGNvcmU6IGludHJvZHVjZSBvZiBzdXBwb3J0IGZvciBkeW5hbWljIHBhcnRp
dGlvbnMiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpbU2V2ZXJpdHk6IExvd10K
U2hvdWxkIHRoZSBGaXhlczogdGFnIHBvaW50IHRvIDVhYjliYmY2YzY3OCAoIm10ZDogRml4IHBv
c3NpYmxlIHJlZmNvdW50aW5nCmlzc3VlIHdoZW4gZ29pbmcgdGhyb3VnaCBwYXJ0aXRpb24gbm9k
ZXMiKSBpbnN0ZWFkPwoKQ29tbWl0IGFkOWIxMGQxZWFhZCAoIm10ZDogY29yZTogaW50cm9kdWNl
IG9mIHN1cHBvcnQgZm9yIGR5bmFtaWMKcGFydGl0aW9ucyIpIGJyb2tlIG91dCBvZiBmb3JfZWFj
aF9jaGlsZF9vZl9ub2RlKCkgd2l0aG91dCBjYWxsaW5nCm9mX25vZGVfcHV0KG10ZF9kbiksIGtl
ZXBpbmcgdGhlIHJlZmVyZW5jZSBoZWxkIGFjcm9zcyB0aGUgcmV0dXJuIHRvCmFkZF9tdGRfZGV2
aWNlKCkuICBDb21taXQgNWFiOWJiZjZjNjc4ICgibXRkOiBGaXggcG9zc2libGUgcmVmY291bnRp
bmcgaXNzdWUKd2hlbiBnb2luZyB0aHJvdWdoIHBhcnRpdGlvbiBub2RlcyIpIGFkZGVkIHRoZSBv
Zl9ub2RlX3B1dChtdGRfZG4pIGNhbGwgaW4KbXRkX2NoZWNrX29mX25vZGUoKSwgY3JlYXRpbmcg
dGhlIHdpbmRvdyB3aGVyZSB0aGUgcmVmZXJlbmNlIGlzIGRyb3BwZWQKYmVmb3JlIGFkZF9tdGRf
ZGV2aWNlKCkgY2FsbHMgb2Zfbm9kZV9nZXQoKS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgtc3VibWl0LW10ZC1wYXJ0aXRp
b24tbm9kZS1yZWZlcmVuY2UtdjEtdjEtMS1hZDMwMzU5NTY5ZDRAZ21haWwuY29tP3BhcnQ9MQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
