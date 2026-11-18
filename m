Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89109606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qsp39wuo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLFOm50+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fNU2dV/DS6lEhkkvypLhrzVyCZq87klX4c2LjI9RWig=; b=Qsp39wuoSPvrKawS4FEbCAXaqk
	WRzUh9TzegZ1CnPQLubOgCEm+XckfXT2zh7PcknLDf8XYp5R0NbvS0eKD1m5d3NONbDGzYe49DkCF
	OVWjceJWHgNqlqg9W7sp1okXWMN+DdXZ1m40Vy50gvC7L02DNSgYGFsD0rX07ur33R5RjCfgb1mDT
	AcSYm4zByXFZ3Mj6EOBLbSlliBxg4mU+t0leaUwyT/TAqA51hMt/2n8h1X2kYa8ZSRp42BIQlG5dl
	jdDiDN3cKm2v2QantOxcpOwsZgsaOTBeKeQGtOAHIrNfDBVhyubs8uap6Pf84vzTyrVCTW1WPIBzQ
	GlwamBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTeL-00000007Mw2-17IC;
	Wed, 18 Nov 2026 00:35:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTeJ-00000007Mvs-1gZv
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:35:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A9C5612EE;
	Wed, 18 Nov 2026 00:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D901F000C4;
	Wed, 18 Nov 2026 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962142;
	bh=hqUMkp5Rr+0Qewh73PCpylQ+JwLLzC+N6hofSg1nMQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLFOm50+b0fEgYPxiRcmtZpBifAmzWSkgaDcAyBWWLpOCY7OLGt7P5zzzitoZJ2YH
	 5tlf0rIjLj9L2v54weomCPvFhB4paWCrz8jA2co9nFs6fRvnJWm5rP4Azm0fTkgTED
	 ZdfYGXZL7KMRJ0QEhHDnvJS7DvdYHFnYJZ0a72mvOEQBWHnI7a91bd8WiYUcDn+PLC
	 hOQxF7A6k5zQTdYsm365pkOWksPIZ0w2g74X9xllH5KTzstT0/CblFb6KGsT6RcyAw
	 8y95fe1uzCw+PH2Kjno+LQjfoya6Ho49LNHOH6/p+m53FA75oaAedJFserrgxhO9bu
	 agun7i4mVfZdg==
Message-ID: <sashiko-outbox-219856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ubifs: Use FSTR() in ubifs_xattr_{set,get,remove}()
To: "Thorsten Blum" <blum@kernel.org>, "David Sterba" <dsterba@suse.com>, "Chris
 Mason" <mason@kernel.org>, "Jaegeuk Kim" <jaegeuk@kernel.org>, "Chao Yu" <chao@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Zhihao Cheng" <chengzhihao1@huawei.com>, "Eric
 Biggers" <ebiggers@kernel.org>, =?utf-8?b?VGhlb2RvcmUgWS4gVHMnbw==?= <tytso@mit.edu>
Cc: linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org, dsterba@suse.cz
In-Reply-To: <20261118002845.574426-10-blum@kernel.org>
References: <20261118002845.574426-6-blum@kernel.org>
 <20261118002845.574426-10-blum@kernel.org>
Date: Wed, 18 Nov 2026 00:35:41 +0000
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gdWJpZnM6IG1pc3Np
bmcgcmVhZC1vbmx5IGFuZCBlcnJvciBzdGF0ZSBjaGVja3MgaW4gZmlsZWF0dHIgYW5kCiAgeGF0
dHIgc2V0dGVycyBbMV0KLS0KClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlz
IHBhdGNoLCBidXQgY2FuIHViaWZzX3hhdHRyX3NldCgpLAp1Ymlmc194YXR0cl9yZW1vdmUoKSwg
YW5kIHNldGZsYWdzKCkgKHZpYSB1Ymlmc19maWxlYXR0cl9zZXQoKSkgbXV0YXRlCnN0YXRlIG9u
IGEgcmVhZC1vbmx5IG9yIGVycm9yZWQgVUJJRlMgZmlsZXN5c3RlbSBbMV0/CgpBIHN0YWNrZWQg
ZmlsZXN5c3RlbSBzdWNoIGFzIGVjcnlwdGZzIGNhbiBjYWxsIHZmc19zZXR4YXR0cigpLAp2ZnNf
cmVtb3ZleGF0dHIoKSwgb3IgdmZzX2ZpbGVhdHRyX3NldCgpIG9uIGEgbG93ZXIgVUJJRlMgbW91
bnQgd2l0aG91dAphY3F1aXJpbmcgd3JpdGUgYWNjZXNzIG9uIHRoZSBsb3dlciBtb3VudCwgYW5k
IHRob3NlIFZGUyBoZWxwZXJzCmRpc3BhdGNoIGludG8gVUJJRlMgd2l0aG91dCByZWplY3Rpbmcg
cmVhZC1vbmx5IG9yIGVtZXJnZW5jeSByZWFkLW9ubHkKbG93ZXIgc3VwZXJibG9ja3MuCgp1Ymlm
c194YXR0cl9zZXQoKSBhbmQgdWJpZnNfeGF0dHJfcmVtb3ZlKCkgdGhlbiBjYWxsIGNyZWF0ZV94
YXR0cigpLApjaGFuZ2VfeGF0dHIoKSwgYW5kIHJlbW92ZV94YXR0cigpLCB3aGljaCBtdXRhdGUg
aW4tbWVtb3J5IGhvc3QgYW5kCnhhdHRyIGlub2RlIHN0YXRlIGJlZm9yZSByZWFjaGluZyByZXNl
cnZlX3NwYWNlKCksIHdoZXJlIHViaWZzX2Fzc2VydChjLAohYy0+cm9fbWVkaWEgJiYgIWMtPnJv
X21vdW50KSBmaXJlcywgYy0+cm9fZXJyb3IgaXMgc2V0LCBhbmQgdGhlIHhhdHRyCmlub2RlIGlz
IG1hcmtlZCBiYWQuIFNpbWlsYXJseSwgc2V0ZmxhZ3MoKSBpbiBmcy91Ymlmcy9pb2N0bC5jIGFs
bG9jYXRlcwpkaXJ0eSBpbm9kZSBidWRnZXQgdmlhIHViaWZzX2J1ZGdldF9zcGFjZSgpIGFuZCBk
aXJ0aWVzIHRoZSBpbm9kZQp3aXRob3V0IGNoZWNraW5nIGMtPnJvX21vdW50LCBjLT5yb19tZWRp
YSwgb3IgYy0+cm9fZXJyb3IsIGxlYWtpbmcKYy0+YmkuZGRfZ3Jvd3RoIG9uIGEgcmVhZC1vbmx5
IG1vdW50IGFuZCB0cmlwcGluZyB1Ymlmc19hc3NlcnQoYywKYy0+YmkuZGRfZ3Jvd3RoID09IDAp
IGF0IHVubW91bnQuCgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC01YmIyMjc1
ZC03NmU1LTRkNmEtYjgxNC1hN2FjOTIxNzc4YmYKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTgwMDI4NDUuNTc0NDI2LTctYmx1
bUBrZXJuZWwub3JnP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
