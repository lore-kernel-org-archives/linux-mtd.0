Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADD606A330
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kLOMrafS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYfwsF3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IUncUTGVwPGkoSgtkLtNj49Wwv5gHpzElaPqo1NcchA=; b=kLOMrafS6dugjo+24DT1LLJEyp
	A1+58urGDgtuvTzxAq5MAn5DSMQdytGKhPzfP1TGBJpcEd+VINTN+/grgzQ132FoR3r38BRonm6VB
	xQuj2PbGjwxAFVBuwLGAh9FPemm0/9+B1bZ8GpX2/ZdB5E0O3kkXDi0M8TFIBjjnSz/lQS8toCCYs
	foXEa2denmrWm5/uVrLpeBoBMwdFEuSqdnX24qfBw6ZGGrg34NHQMF/QGrAKpNfdkqCHhyWYBQXEv
	1ZQ3Iw3KWrodBvlx+SoiD/Q2ClIs79jg7BbZA8uEt0ZR23ymNipMhdjfKTF04V03EoHQ+JjLqlqCn
	OKrljweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqVD-00000001KqB-2KGe;
	Mon, 16 Nov 2026 06:47:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqVC-00000001KpT-3Vt0
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:47:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00118626B0;
	Mon, 16 Nov 2026 06:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FEF1F000C7;
	Mon, 16 Nov 2026 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811661;
	bh=DF5hukhiNITbkxRO73tTSNArz5kYHfygOs2SZDaU7Bc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jYfwsF3lKW6jmrIyWdfVA5mCWpZgxC0Q9WTlOcTplJ1kXnPBSBHMcrhk4GZyS9JER
	 rSBxUGJUXQnPPEgrmErymAMxhbYFyL1EVkOpj4RrvxisKarBmt+KGiF7yTQUfUzxVa
	 JAwEEakpM+CABU2zudCck+/Sat3XC+Jw2wjw+FD1ddEuyZGcLefABM6eb9Hk6sqFJc
	 07jGonzMXMzyE3lCzfDkjtexy3UmH8Q2/2dq7ZbVw3ASN7eDf/AmOb6kHGBY55Ig3s
	 In0dBtCGCt720FWspLpX/cr1qOdTlkINGclF8L27v45z6+KJweWdXkD9moWDBWGXiE
	 4cuiCIJAkn86A==
Message-ID: <sashiko-outbox-216318@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 24/58] mtd: rawnand: xway: retain open-handle state
 on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-24-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-24-cbc49c5c5e74@gmail.com>
Date: Mon, 16 Nov 2026 06:47:38 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiB4d2F5
OiBtaXNzaW5nIEZpeGVzIHRyYWlsZXIgZm9yIHJlbW92YWwgbGlmZXRpbWUKICBmaXgKLS0KCmNv
bW1pdCBiNTE5NDhkMzBkODJjOWVmODQwOTg0MzZjNjkyOTkyNDQ4ZjY2NmRkCkF1dGhvcjogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgo+IG10ZDogcmF3bmFuZDog
eHdheTogcmV0YWluIG9wZW4taGFuZGxlIHN0YXRlIG9uIHJlbW92YWwKPgo+IEtlZXAgY2hpcCBt
ZXRhZGF0YSBhbmQgY29udHJvbGxlciBzdG9yYWdlIGFsaXZlIHVudGlsIHRoZSBmaW5hbCBNVEQK
PiByZWZlcmVuY2UgaXMgcmVsZWFzZWQuIFVucmVnaXN0ZXIgYW5kIGRpc2Nvbm5lY3QgZWFjaCBw
dWJsaXNoZWQgY2hpcAo+IGJlZm9yZSByZWxlYXNpbmcgdGhlIHJlc291cmNlcyB1c2VkIGJ5IGl0
cyBoYXJkd2FyZSBvcGVyYXRpb25zLgo+Cj4gUmV0YWluIHRoZSBlbWJlZGRlZCBjb250cm9sbGVy
IGFuZCBjaGlwIGFjcm9zcyBwbGF0Zm9ybS1kZXZpY2UgcmVtb3ZhbC4KPgo+IFJ1biBOQU5EIGNs
ZWFudXAgZHVyaW5nIGRpc2Nvbm5lY3Rpb247IHRoZSBmaW5hbCBjb3JlLW93bmVkIHB1dCBvbmx5
Cj4gcmVsZWFzZXMgcmV0YWluZWQgYWxsb2NhdGlvbiBhbmQgbGF5b3V0IGRhdGEuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCltT
ZXZlcml0eTogTG93XQpTaW5jZSB0aGlzIGZpeGVzIGZyZWVpbmcgc3RydWN0IHh3YXlfbmFuZF9k
YXRhIHZpYSBkZXZyZXMgb24gZGV2aWNlIHJlbW92YWwKd2hpbGUgb3BlbiBNVEQgaGFuZGxlcyBj
YW4gc3RpbGwgcmVmZXJlbmNlIGl0LCBzaG91bGQgaXQgaW5jbHVkZSBhIEZpeGVzCnRhZz8KCiAg
Rml4ZXM6IDAyNDM2Njc1MGMyZSAoIm10ZDogbmFuZDogeHdheTogY29udmVydCB0byBub3JtYWwg
cGxhdGZvcm0gZHJpdmVyIikKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTUtc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxl
LWxpZmV0aW1lLXYxLXY1LTAtY2JjNDljNWM1ZTc0QGdtYWlsLmNvbT9wYXJ0PTI0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
