Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC30606D827
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFauBSk6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9Msolj8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rA04pSjEfvBaqKaJHGyODGE3iQhe9nOfbYQOoKsQ2Hg=; b=lFauBSk69Cac47qf4TyOV3NVlS
	ivbIDTKh51Z0/4ScB9BQ7xdDyB7S2BTPK+qYNEvsJ5beCW+h+aWJGgt2XQnmMGPq/GoHRPCtq3BY/
	F0QYMy816jJ9T18Rd/VM2Tnq/Bw8G/MrE7hpP+QhvhAsyt2V1szw7AhLs8pVQA2o5br9Fu2oMeEn7
	JLfT3TMkvrW5X6G/UpkvYeaqrB0F0JG6QGMVfBkYWhDJYez6yKnvuR+0aqbv4MlEjxZOcK2Jhtafl
	dprEAANJXyJP/NVuLLdAulSrI5ERbT+MFVVx3fAAQwILo9xgJwMbm3MthzjyxeI688oR2Bs+UYsEq
	lylltRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAF1-0000000GhNb-2ciV;
	Sun, 08 Nov 2026 21:15:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAF0-0000000GhNL-2zsd
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:15:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5239344E95;
	Sun,  8 Nov 2026 21:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEFF1F008BE;
	Sun,  8 Nov 2026 21:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172554;
	bh=HVOqgICD598bUeQ4k5CArzX8cbG8VIrjRe7+HmI9ANE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9Msolj8i7aQrtCQEroS78bQSB1xmG+txcUEJWpvB94VmWjmK7qQTLiSKUkJjoCUW
	 VSUBWWrCvLuPCXHPGvkUBtOdhc/wTT9iMhjhDJ4qZSB0w3/t4wllCyQFX1JJM8GG13
	 k+cddXXGfy6K8vNtvfy4q3K+cy10f+/WfHDZpIvbceecLW6SAGONwaUkXr41HHfql8
	 n5vXYqDOwDSLNSE/r/Z+WRpUFifUSh2gOp4pZrz/QWv9lIYiV4/dD0Y9zktDwpeCOB
	 iDiKFmJ0g5oNKqPOrQfj+Ke/Pb8OR7/RVRH0nLNJ9Gjo8E7CzZJvjFoGy9vPRNmTQm
	 uhLd4UQbXggnw==
Message-ID: <sashiko-outbox-204068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: r852: prevent card work from being
 requeued during shutdown
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
References: <20261108-submit-r852-shutdown-work-v1-v1-1-8e448ad7c54c@gmail.com>
Date: Sun, 08 Nov 2026 21:15:53 +0000
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
OiByODUyOiB1bnByb3RlY3RlZCByZWdpc3RlciBhY2Nlc3MgaW4KICByODUyX3VwZGF0ZV9jYXJk
X2RldGVjdCgpIFsxXQotLQoKY29tbWl0IDlkMzEzYWYzY2RiZjEzOTU5M2E4NDVlYzI5ZjU1OWFh
MGRmNWJmNmIKQXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4KCm10ZDogcmF3bmFuZDogcjg1MjogcHJldmVudCBjYXJkIHdvcmsgZnJvbSBiZWluZyByZXF1
ZXVlZCBkdXJpbmcgc2h1dGRvd24KClRoaXMgY29tbWl0IHJlcGxhY2VzIGNhbmNlbF9kZWxheWVk
X3dvcmtfc3luYygpIHdpdGgKZGlzYWJsZV9kZWxheWVkX3dvcmtfc3luYygpIGluIHI4NTJfc2h1
dGRvd24oKSBzbyBjYXJkX2RldGVjdF93b3JrIGNhbm5vdApiZSByZXF1ZXVlZCBiZWZvcmUgaW50
ZXJydXB0cyBhcmUgZGlzYWJsZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9yODUyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yODUyLmMKPiBpbmRleCA5MmM0N2QzNTFj
Mjc4Li5iZjFjMWJlN2YyYWE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4
NTIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+IEBAIC0xMDA3LDcgKzEw
MDcsNyBAQCBzdGF0aWMgdm9pZCByODUyX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2ICpwY2lfZGV2
KQo+ICB7Cj4gIAlzdHJ1Y3Qgcjg1Ml9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwY2lf
ZGV2KTsKPiAgCj4gLQljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmRldi0+Y2FyZF9kZXRlY3Rf
d29yayk7Cj4gKwlkaXNhYmxlX2RlbGF5ZWRfd29ya19zeW5jKCZkZXYtPmNhcmRfZGV0ZWN0X3dv
cmspOwo+ICAJcjg1Ml9kaXNhYmxlX2lycXMoZGV2KTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBw
cm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4Kcjg1Ml91cGRh
dGVfY2FyZF9kZXRlY3QoKSBbMV0gcmFjZSB3aXRoIHI4NTJfaXJxKCkgb24KUjg1Ml9DQVJEX0lS
UV9FTkFCTEUgYW5kIHVubWFzayBkaXNhYmxlZCBpbnRlcnJ1cHRzPwoKZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcjg1Mi5jOnI4NTJfdXBkYXRlX2NhcmRfZGV0ZWN0KCkgewoJaW50IGNhcmRfZGV0ZWN0
X3JlZyA9IHI4NTJfcmVhZF9yZWcoZGV2LCBSODUyX0NBUkRfSVJRX0VOQUJMRSk7CgkuLi4KCXI4
NTJfd3JpdGVfcmVnKGRldiwgUjg1Ml9DQVJEX0lSUV9FTkFCTEUsIGNhcmRfZGV0ZWN0X3JlZyk7
Cn0KCmNhcmRfZGV0ZWN0X3dvcmsgY2FsbHMgcjg1Ml91cGRhdGVfY2FyZF9kZXRlY3QoKSwgd2hp
Y2ggcGVyZm9ybXMgdGhpcwpyZWFkLW1vZGlmeS13cml0ZSB3aXRob3V0IGhvbGRpbmcgZGV2LT5p
cnFsb2NrOgoKQ1BVMCAoa3dvcmtlcikgICAgICAgICAgICAgICAgICAgIENQVTEgKDxoYXJkaXJx
PikKcjg1Ml9jYXJkX2RldGVjdF93b3JrKCkKICByODUyX3VwZGF0ZV9jYXJkX2RldGVjdCgpCiAg
ICByZWcgPSByODUyX3JlYWRfcmVnKC4uLikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHI4NTJfaXJxKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmRldi0+aXJxbG9jaykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcjg1Ml9kaXNhYmxlX2lycXMoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHI4NTJfd3JpdGVfcmVnKC4uLikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2LT5pcnFsb2NrKQogICAgcjg1Ml93cml0
ZV9yZWcoLi4uLCByZWcpICA8LS0gb3ZlcndyaXRlcyBtYXNrZWQgSVJRcwoKV2hlbiB0aGUgd29y
a2VyIHdyaXRlcyBiYWNrIGl0cyBzdGFsZSB2YWx1ZSwgaXQgcmUtZW5hYmxlcyBpbnRlcnJ1cHRz
CnRoYXQgcjg1Ml9pcnEoKSBqdXN0IG1hc2tlZCwgd2hpY2ggY2FuIHRyaWdnZXIgYW4gSVJRIHN0
b3JtLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtYzBmZTc2MDQtMzIxMC00
YWE1LTlhMDAtYjYwMDY2Y2JlMWRiCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA4LXN1Ym1pdC1yODUyLXNodXRkb3duLXdvcmst
djEtdjEtMS04ZTQ0OGFkN2M1NGNAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
