Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF3606A326
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IT90KYCC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KggFnsJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ImP0H6x6QBhEeUM38HZy88SQc3pr26Voo3F2r/fX4dQ=; b=IT90KYCCKGvawkPCeBFpoVhnMo
	QTSboze8vbbbb1FgoRtoyQaE/comyLV8JO+B/x+NtrLe2KybWGFt7RR6B4Fj6mBWWlytZt7ZrPqM0
	nZec7hzjd6/j/iz6uW0qS17Ax+WDERC8OAId0LBorpL1btv0+4zqAPXvVgTBkqI/P0Yf5NENH9J1N
	rgHNIkB5dOjqQKScjXygJVGLWeADkUZvOZ10LOGBnVEAVkpqDuuTm0DnQBN98LTDB2PxzlbrD3OzX
	YnoxCmi7NkU7JnIBi5txrM73Nm6F6dsSKKWYqo733LWEXrkC/xyk3Euk0xWILjbCaISb2HX+wU1S8
	P8G2d5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVWN-00000001b5T-0mzq;
	Mon, 09 Nov 2026 19:59:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVWI-00000001b59-3A7k
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:59:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C62E960DB4;
	Mon,  9 Nov 2026 19:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022481F0089F;
	Mon,  9 Nov 2026 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254349;
	bh=XzyvaOKLSpVK36W4ri1lGgl2x5bIJX5j19DGjBaQvEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KggFnsJdfT72XZAtTJG/PvYLPn3DBGv8ZcrMvGIXMDMIAjaUjIA4xpbeE2uC5ep+5
	 e7YLc6bbjbpaZPkaonpXW/XlB8XBlDK7iIadw4QSt1evslaw846pPAEVoRWQoun4Dr
	 K25pXJHshJWWgBR3nfeLHVXV2TIDiBRTxb8wHFnQneMB4C4H95wSPojaUxzFt9gpCz
	 sBGmTbOR3xvhuabwLhNqDMu8k4ZPz3QplMnfWifxGXv7Hq27/9siKzTnXjN0ABzWPG
	 Pis7IqHPwcgMW1P4tmctcDepdGvv17zzSHB3WT4UBMHdLGcev1Ck1ajYIs15gwnHNe
	 ZKDrmPdDKO9oA==
Message-ID: <sashiko-outbox-205518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: drain the IRQ before disabling the
 clock
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
References: <20261108-submit-tegra-nand-irq-teardown-v1-v1-1-2c570ad4a22c@gmail.com>
Date: Mon, 09 Nov 2026 19:59:08 +0000
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
bmQ6IHRlZ3JhOiBkZXZpY2Vfbm9kZSByZWZlcmVuY2UgbGVhayBpbgogIHRlZ3JhX25hbmRfY2hp
cHNfaW5pdCgpIFsxXQotLQoKY29tbWl0IDM2NWE3ZjQ0NTJiOTFiNmYyZDNlZjZhMDVkMGJlYmZh
MWQ4YWNhMWUKQXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4KCm10ZDogcmF3bmFuZDogdGVncmE6IGRyYWluIHRoZSBJUlEgYmVmb3JlIGRpc2FibGluZyB0
aGUgY2xvY2sKClRoaXMgY29tbWl0IG1hc2tzIGNvbnRyb2xsZXIgaW50ZXJydXB0cyBhbmQgZnJl
ZXMgdGhlIG1hbmFnZWQgSVJRIGJlZm9yZQpzdXNwZW5kaW5nIHRoZSBkZXZpY2Ugb24gZHJpdmVy
IHJlbW92YWwgYW5kIHByb2JlIGZhaWx1cmUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy90ZWdyYV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMK
PiBpbmRleCA3ZjllYjVmMDQyYTdlLi4xMTA0ZDc1YjZjYmU2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3RlZ3JhX25hbmQuYwo+IEBAIC0xMjEyLDEwICsxMjEyLDEzIEBAIHN0YXRpYyBpbnQgdGVncmFf
bmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCWVyciA9IHRl
Z3JhX25hbmRfY2hpcHNfaW5pdChjdHJsLT5kZXYsIGN0cmwpOwo+ICAJaWYgKGVycikKPiAtCQln
b3RvIGVycl9wdXRfcG07Cj4gKwkJZ290byBlcnJfZnJlZV9pcnE7CgpbU2V2ZXJpdHk6IE1lZGl1
bV0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2Vz
CnRlZ3JhX25hbmRfY2hpcHNfaW5pdCgpIGxlYWsgdGhlIG5wX25hbmQgZGV2aWNlX25vZGUgcmVm
ZXJlbmNlIFsxXT8KSXQgYWNxdWlyZXMgdGhlIGNoaWxkIG5vZGUgd2l0aCBvZl9nZXRfbmV4dF9j
aGlsZChucCwgTlVMTCkgYW5kIG5ldmVyIGNhbGxzCm9mX25vZGVfcHV0KCkgb24gZWl0aGVyIGl0
cyBlcnJvciBwYXRocyBvciBub3JtYWwgcmV0dXJuLCBsZWFraW5nIGEKcmVmZXJlbmNlIG9uIGV2
ZXJ5IHByb2JlIGF0dGVtcHQuCgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC0z
ZjA1YWE2Yi1mODg5LTQzNzYtOTdmYi0wZjdmMDZiNGU2ODMKCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgtc3VibWl0LXRlZ3Jh
LW5hbmQtaXJxLXRlYXJkb3duLXYxLXYxLTEtMmM1NzBhZDRhMjJjQGdtYWlsLmNvbT9wYXJ0PTEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
