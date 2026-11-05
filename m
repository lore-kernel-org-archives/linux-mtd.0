Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C215606A328
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5ozIL9U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqqYthCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PEPfYjJImCkBQ0fzt+l2P7FXigQX07+HRfMJDB6QlFU=; b=R5ozIL9UhbHe7oF1gmCFrt6vzU
	Hw6+XV38Tw1lpGEE0pD3aY6ayGm52U23YXV3MOt8j3/PIB1cYTFTtOHyoiMVZYKGDBmuTmr9PjY9P
	6WtQxzoHD9ulMbKSzdck2hHRDYZVHscjCjxC26VAFHRWzRavdyaaZzbe+VlSMT+Cf4XVEXcg0+oQi
	u4hYOrGYHYKyRJtmFmb3zw7fuXOBTRtwhhxfOrwTH2FaFRa3iJ4avWZ0327YlPlJF4GuF5NviEB0V
	Qqvn1OL8FN4xv8PGc7Z9uBCe+koiLL27VzN8sU/nyHvn/2H99gshslN1MBvbbJU5By92TabRaFion
	vYLWaRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvXE-00000008cvp-479c;
	Thu, 05 Nov 2026 11:21:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvXA-00000008cux-1doA
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 11:21:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2E556062F;
	Thu,  5 Nov 2026 11:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB3C1F00A18;
	Thu,  5 Nov 2026 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877691;
	bh=UlYCDCX2Iogr0PUGCxPccNF1Pd8B2hPqTb3n4aYlwU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jqqYthCl9VEHYtlNF53gGtVihwzF8L+SF0KVoX0JEBLm6KqMaKhu4ahLtNFFiVW6q
	 v6aB2MGM2P1q1cpzeaVhePeq3S9ITteqlG78LPHW/1yj8QznIZ1Cm7ltokhfPFvDJp
	 Z+wKfQeeKBtPcrIQK5el8ua5WW8W56r0skfgdvxFVrtdg/rK82RbFDQCFbxuRPWZBK
	 CIH9FgH54TTNUBXcZhM7RyxVaMuCmXiiAVISFmIg/oBFXj0R2U3WICqwXrH3pxDGjT
	 AJQPOyYtR3n84B4px/3ZmubhlwRcCqA16uygqhQ3MLkXFD+wQWvASlE+ZYUv99B/WT
	 hPPt6ScjmqoPA==
Message-ID: <sashiko-outbox-198937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 12/19] spi: cadence-quadspi: enable PHY for indirect
 writes
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-13-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-13-s-k6@ti.com>
Date: Thu, 05 Nov 2026 11:21:29 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogY2FkZW5jZS1x
dWFkc3BpOiBtaXNzaW5nIGNsb2NrIGZhbGxiYWNrIGluIGNxc3BpX3dyaXRlKCkgd2l0aG91dCBQ
SFkKLS0KCmNvbW1pdCAxYTA0ZjJmYmYzOWZhNmZhZTg0OTE4MDhiNjM2ZmU4OGRiZGM0NGU1CkF1
dGhvcjogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+CgpzcGk6IGNhZGVuY2UtcXVhZHNw
aTogZW5hYmxlIFBIWSBmb3IgaW5kaXJlY3Qgd3JpdGVzCgpUaGlzIGNvbW1pdCBlbmFibGVzIFBI
WSBtb2RlIGZvciBpbmRpcmVjdCB3cml0ZXMgb2YgYXQgbGVhc3QgMSBLaUIgd2hlbiB0aGUKb3Bl
cmF0aW9uIHJ1bnMgYXQgdGhlIGNhbGlicmF0ZWQgcG9zdC1jb25maWd1cmF0aW9uIGNsb2NrIHJh
dGUuIEl0IGFkZHMKY3FzcGlfdHVuZV9waHlfd3JpdGUoKSB0byB0b2dnbGUgUEhZIGFyb3VuZCB0
aGUgaW5kaXJlY3Qgd3JpdGUgdHJhbnNmZXIgYW5kCnBhc3NlcyBwb3N0X2NvbmZpZ19tYXhfc3Bl
ZWRfaHogZnJvbSBjcXNwaV9tZW1fcHJvY2VzcygpIHRocm91Z2gKY3FzcGlfd3JpdGUoKS4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyBiL2RyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+IGluZGV4IDU1YzQ0NmY0MjQ1YWYuLjgwNmJmNDll
ODE0ZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4g
KysrIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCgpbIC4uLiBdCgo+IEBAIC0x
NjAyLDEyICsxNjUzLDE0IEBAIHN0YXRpYyBib29sIGNxc3BpX3VzZV90dW5lZF9waHkoc3RydWN0
IGNxc3BpX2ZsYXNoX3BkYXRhICpmX3BkYXRhLAo+ICB9Cj4gIAo+ICBzdGF0aWMgc3NpemVfdCBj
cXNwaV93cml0ZShzdHJ1Y3QgY3FzcGlfZmxhc2hfcGRhdGEgKmZfcGRhdGEsCj4gLQkJCSAgIGNv
bnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPiArCQkJICAgY29uc3Qgc3RydWN0IHNwaV9tZW1f
b3AgKm9wLAo+ICsJCQkgICB1MzIgcG9zdF9jb25maWdfbWF4X3NwZWVkX2h6KQo+ICB7Cj4gIAlz
dHJ1Y3QgY3FzcGlfc3QgKmNxc3BpID0gZl9wZGF0YS0+Y3FzcGk7Cj4gIAlsb2ZmX3QgdG8gPSBv
cC0+YWRkci52YWw7Cj4gIAlzaXplX3QgbGVuID0gb3AtPmRhdGEubmJ5dGVzOwo+ICAJY29uc3Qg
dV9jaGFyICpidWYgPSBvcC0+ZGF0YS5idWYub3V0Owo+ICsJYm9vbCB1c2VfcGh5Owo+ICAJaW50
IHJldDsKPiAgCj4gIAlyZXQgPSBjcXNwaV93cml0ZV9zZXR1cChmX3BkYXRhLCBvcCk7Cj4gQEAg
LTE2MjksNyArMTY4Miw5IEBAIHN0YXRpYyBzc2l6ZV90IGNxc3BpX3dyaXRlKHN0cnVjdCBjcXNw
aV9mbGFzaF9wZGF0YSAqZl9wZGF0YSwKPiAgCQlyZXR1cm4gY3FzcGlfd2FpdF9pZGxlKGNxc3Bp
KTsKPiAgCX0KPiAgCj4gLQlyZXR1cm4gY3FzcGlfaW5kaXJlY3Rfd3JpdGVfZXhlY3V0ZShmX3Bk
YXRhLCB0bywgYnVmLCBsZW4pOwo+ICsJdXNlX3BoeSA9IGxlbiA+PSBDUVNQSV9QSFlfTUlOX0lO
RElSRUNUX1dSSVRFX0xFTiAmJgo+ICsJCSAgY3FzcGlfdXNlX3R1bmVkX3BoeShmX3BkYXRhLCBv
cCwgcG9zdF9jb25maWdfbWF4X3NwZWVkX2h6KTsKPiArCXJldHVybiBjcXNwaV9pbmRpcmVjdF93
cml0ZV9leGVjdXRlKGZfcGRhdGEsIHRvLCBidWYsIGxlbiwgdXNlX3BoeSk7Cj4gIH0KCltTZXZl
cml0eTogSGlnaF0KV2hlbiBhIHdyaXRlIG9wZXJhdGlvbiBoYXMgb3AtPm1heF9mcmVxID09IHBv
c3RfY29uZmlnX21heF9zcGVlZF9oeiBhbmQKZl9wZGF0YS0+dXNlX3R1bmVkX3BoeSBpcyB0cnVl
LCBjcXNwaV9tZW1fcHJvY2VzcygpIGNvbmZpZ3VyZXMgdGhlIGNvbnRyb2xsZXIKY2xvY2sgdG8g
cG9zdF9jb25maWdfbWF4X3NwZWVkX2h6IGJlZm9yZSBjYWxsaW5nIGNxc3BpX3dyaXRlKCk6Cgpk
cml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmM6Y3FzcGlfbWVtX3Byb2Nlc3MoKSB7Cgku
Li4KCS8qIFR1bmluZyBpbmFjdGl2ZSwgb3IgU1RJRyAobm8gUEhZIGhhbmRsaW5nIG9mIGl0cyBv
d24pOiB1c2Ugc2FmZSByYXRlLiAqLwoJaWYgKHNjbGsgPT0gbWVtLT5zcGktPnBvc3RfY29uZmln
X21heF9zcGVlZF9oeiAmJgoJICAgICghZl9wZGF0YS0+dXNlX3R1bmVkX3BoeSB8fCB1c2Vfc3Rp
ZykpCgkJc2NsayA9IG1lbS0+c3BpLT5tYXhfc3BlZWRfaHo7CgoJY3FzcGlfY29uZmlndXJlKGZf
cGRhdGEsIHNjbGspOwoJLi4uCglpZiAoIW9wLT5hZGRyLm5ieXRlcyB8fCAhb3AtPmRhdGEuYnVm
Lm91dCkKCQlyZXR1cm4gY3FzcGlfY29tbWFuZF93cml0ZShmX3BkYXRhLCBvcCk7CgoJcmV0dXJu
IGNxc3BpX3dyaXRlKGZfcGRhdGEsIG9wLCBtZW0tPnNwaS0+cG9zdF9jb25maWdfbWF4X3NwZWVk
X2h6KTsKfQoKSW4gY3FzcGlfd3JpdGUoKSwgaWYgbGVuIDwgQ1FTUElfUEhZX01JTl9JTkRJUkVD
VF9XUklURV9MRU4gKG9yIGlmIHRoZQpkaXJlY3QtbW9kZSB3cml0ZSBicmFuY2ggaXMgdGFrZW4s
IG9yIGNxc3BpX2NvbW1hbmRfd3JpdGUoKSBpcyBjYWxsZWQgaW4KY3FzcGlfbWVtX3Byb2Nlc3Mo
KSksIFBIWSBtb2RlIGlzIG5vdCBlbmFibGVkLiBVbmxpa2UgY3FzcGlfcmVhZCgpIGFuZApjcXNw
aV9kaXJlY3RfcmVhZF9mYWxsYmFjaygpLCB3aGljaCBjYWxsIGNxc3BpX2NvbmZpZ3VyZShmX3Bk
YXRhLAptYXhfc3BlZWRfaHopIHdoZW4gUEhZIGlzIG5vdCB1c2VkLCB0aGUgd3JpdGUgcGF0aCBu
ZXZlciBkcm9wcyB0aGUgY2xvY2sgYmFjawpkb3duIHRvIG1lbS0+c3BpLT5tYXhfc3BlZWRfaHou
CgpXb24ndCB0aGlzIGNhdXNlIHdyaXRlcyBzaG9ydGVyIHRoYW4gMSBLaUIgKGFzIHdlbGwgYXMg
ZGlyZWN0LW1vZGUgb3IgU1RJRwp3cml0ZXMgYXQgcG9zdF9jb25maWdfbWF4X3NwZWVkX2h6KSB0
byBydW4gYXQgdGhlIHR1bmVkIHBvc3QtY29uZmlndXJhdGlvbgpjbG9jayByYXRlIHdpdGhvdXQg
UEhZIGRlbGF5LWxpbmUgY29tcGVuc2F0aW9uPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNTEwNTgzMi4yMTM0MzEzLTEtcy1r
NkB0aS5jb20/cGFydD0xMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
