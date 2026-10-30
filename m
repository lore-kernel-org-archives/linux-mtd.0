Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D6606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUMxoC6N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UD4XL6G0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NrG1JlJobGt2ljXmMZyjngDWmnPwhytnll2g/4RbRqQ=; b=xUMxoC6Nvqx0hiTdyweYuolNit
	3oDe11RF/KhIDEgWfpXvcuvkkweWSomZH9DbfZtX0ibmvjrMggLllG3IlqtljSG6Es+zxc5rBDLR1
	RyRqc2fR9aC+gtsmz9R+hR/jhE3pEHN974y6H2G1G0JFdfG33KPh2hhwOUZLc3yDPQGtKzBI9+FsD
	hwApiuqKRykGEKrElZ0Wq5U6Z5rRYp18gitEmXmwRou1flaByuV3IiKNbvZCFX/EA2cd2OoapLnRV
	qXXXYeski2Caz4H0JUmui7KCqN8li1rmvXHZZERN3BHjN/N5DEcKK3hWGpjSSY7wCdnM58dOXYGCD
	CgK8p/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqll-0000000CJkG-0QHP;
	Fri, 30 Oct 2026 17:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqlj-0000000CJi7-0TuV
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:51:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CBBF40913;
	Fri, 30 Oct 2026 17:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411C01F00A16;
	Fri, 30 Oct 2026 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793382718;
	bh=8WHWm/TycY05zUaN/1zJngDjCMKq0BECIruJBvYLw4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UD4XL6G01hEdf3DrNuD0sxdDoJKYEJPb/HQVqZL72hN+xI8bgugGZJPNwjD0/N2xt
	 1Psd7tTjjPSYc3df3u/xx1UkXgof7Lm5boQzrcMq417wC+fuwAms+QJXhBjxbOc2aR
	 3EcXVRGJiN245AyZSaoT2qaK31lKaq6T/5zZaRzpeJjgxDa+PEEEqCYgkUmVt1kWwA
	 JWPdf854S+w/F+9qDm0WbWeACENuBK1MNEsfmsNimicOLLtCYaqn022k91f9fSFiZG
	 IwlJHCBvCBpmoebX0mO0mKTx/CvBdCZ+9XcAoDuxrynWV9koSdQ24VeLBHw1eid/Ec
	 tIrNDKmfwioEA==
Message-ID: <sashiko-outbox-191362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/13] mtd: spinand: winbond: Generalize the LW OOB
 layout
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Daisuke Mizobuchi" <mizo@atmark-techno.com>, "Dominique
 Martinet" <dominique.martinet@atmark-techno.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <stlin2@winbond.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-3-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
 <20261030-winbond-master-w25nxxlvw-v1-3-91f67407dc8b@bootlin.com>
Date: Fri, 30 Oct 2026 17:51:56 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5k
OiB3aW5ib25kOiBXMjVOMDRMVyBsZWZ0IHVzaW5nIHcyNW54eGt2X2t3X29vYmxheW91dAotLQoK
Y29tbWl0IDY0NzYwOTA2ZGE3ZmJjMWZhZjMwMzZjYWY5MWNiNjQ1ZmYwMGU1MDgKQXV0aG9yOiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRkOiBzcGluYW5kOiB3
aW5ib25kOiBHZW5lcmFsaXplIHRoZSBMVyBPT0IgbGF5b3V0CgpUaGlzIGNvbW1pdCByZW5hbWVz
IHRoZSBXMjVOMDhMVyBPT0IgbGF5b3V0IGhlbHBlcnMgYW5kIG9wcyBzdHJ1Y3R1cmUgdG8KdzI1
bnh4bHZfbHdfb29ibGF5b3V0KiBzbyB0aGV5IGNhbiBiZSBzaGFyZWQgYWNyb3NzIFcyNU54eExW
IGFuZCBXMjVOeHhMVwpjaGlwcywgYW5kIHVwZGF0ZXMgdzI1bnh4bHZfbHdfb29ibGF5b3V0X2Zy
ZWUoKSB0byBjb21wdXRlIHRoZSBzZWN0aW9uIGxpbWl0CmZyb20gbXRkLT53cml0ZXNpemUuCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBpbmRleCA0ZWYzMGYxYTRhYThlLi5lM2JlOTM2OTBiYjcx
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwoKWyAuLi4gXQoKPiBAQCAtODUyLDcgKzg1NSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIHdpbmJvbmRfc3BpbmFuZF90YWJs
ZVtdID0gewo+ICAJCQkJCQkJJnVwZGF0ZV9jYWNoZV92YXJpYW50cywKPiAgCQkJCQkJCSZjb250
X3JlYWRfY2FjaGVfdmFyaWFudHMpLAo+ICAJCSAgICAgMCwKPiAtCQkgICAgIFNQSU5BTkRfRUND
SU5GTygmdzI1bjA4bHdfb29ibGF5b3V0LCB3MjVuMDJrdl9lY2NfZ2V0X3N0YXR1cyksCj4gKwkJ
ICAgICBTUElOQU5EX0VDQ0lORk8oJncyNW54eGx2X2x3X29vYmxheW91dCwgdzI1bjAya3ZfZWNj
X2dldF9zdGF0dXMpLAo+ICAJCSAgICAgU1BJTkFORF9DT05UX1JFQUQodzI1bjB4andfc2V0X2Nv
bnRfcmVhZCkpLAo+ICB9OwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3VsZCB0aGUgVzI1TjA0TFcg
ZW50cnkgaW4gd2luYm9uZF9zcGluYW5kX3RhYmxlIGFsc28gYmUgdXBkYXRlZCB0byB1c2UKdzI1
bnh4bHZfbHdfb29ibGF5b3V0IGhlcmU/CgpFYXJsaWVyIGluIHRoaXMgc2VyaWVzLCBjb21taXQg
NGMzN2Y0Y2IzNzA0ICgibXRkOiBzcGluYW5kOiB3aW5ib25kOiBGaXggYW4KT09CIGxheW91dCBp
bmNvbnNpc3RlbmN5IHdpdGggVzI1Tnh4TFcgY2hpcHMiKSBzd2l0Y2hlZCBXMjVOMDRMVyBmcm9t
CncyNW4wMmt2X29vYmxheW91dCB0byB3MjVuMDhsd19vb2JsYXlvdXQsIGJ1dCB0aGUgZm9sbG93
aW5nIGNvbW1pdApjN2JjMzY2NjJjNzUgKCJtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEdlbmVyYWxp
emUgdGhlIEtWIE9PQiBsYXlvdXQiKQpyZXBsYWNlZCBpdCB3aXRoIHcyNW54eGt2X2t3X29vYmxh
eW91dDoKCmRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYzp3aW5ib25kX3NwaW5hbmRfdGFi
bGVbXSB7CgkuLi4KCVNQSU5BTkRfSU5GTygiVzI1TjA0TFciLCAvKiAxLjhWICovCgkJICAgICBT
UElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4YjIsIDB4MjMp
LAoJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEp
LAoJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJ
QU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFu
dHMsCgkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCgkJICAgICAwLAoJCSAgICAg
U1BJTkFORF9FQ0NJTkZPKCZ3MjVueHhrdl9rd19vb2JsYXlvdXQsIHcyNW4wMmt2X2VjY19nZXRf
c3RhdHVzKSksCgkuLi4KfQoKV2hlbiBhIFcyNU4wNExXIGNoaXAgaXMgcHJvYmVkLCBsZWF2aW5n
IGl0IG9uIHcyNW54eGt2X2t3X29vYmxheW91dCBleHBvc2VzCnRoZSAyIG5vbi1FQ0MtcHJvdGVj
dGVkIFVzZXIgRGF0YSBJSSBieXRlcyBwZXIgc2VjdGlvbiB2aWEKdzI1bnh4a3Zfa3dfb29ibGF5
b3V0X2ZyZWUoKSBhbmQgcmVwb3J0cyBFQ0MgcmVnaW9ucyBpbiB0aGUgdXBwZXIgaGFsZiBvZgpP
T0IgdmlhIHcyNW54eGt2X2t3X29vYmxheW91dF9lY2MoKSwgZXZlbiB0aG91Z2ggdGhlIHNlY29u
ZCBoYWxmIG9mIE9PQiBpcwpub3QgYWNjZXNzaWJsZSB3aGVuIHRoZSBvbi1kaWUgRUNDIGVuZ2lu
ZSBpcyBlbmFibGVkLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MTAzMC13aW5ib25kLW1hc3Rlci13MjVueHhsdnctdjEtMC05MWY2
NzQwN2RjOGJAYm9vdGxpbi5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
