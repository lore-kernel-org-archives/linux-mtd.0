Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FDDCC6B2D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XtopW4gXkN57B6EztbMFAd0liiTnbWK5c4z0sagJSY=; b=y26sKob5eVQSUC
	KpaCNAs2zJ6MH+O6D5aB3wv8IzTJxWuxhXdEbHZira4/ooGVyR9u2IxRoAlaPxYkc55AZdIyVfJod
	eskRviGOnIzQ8hFr1HqvNE44yX5DrVO1XS13Jmb//u0u1qymQWr9/JmBQiWG3vh51yGBXknKgbiCk
	NN9rJ8zNjPy1KmCKiyTvX/xI35fGBXBx7XlrzGC223yjAvrr3tztoo3LXTC78L9Yqp9g/N3dCq0K4
	H4Gmejp1pEFp7jVZ+2PeGlRtZPPXzSNRmJXAt1G/MXc0KiZ+KotjuiLKPUjOruEuEyG2PisTWVIfM
	6EOsy9leNAt5rJkfCgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAbs-0000000Gcg4-299p;
	Thu, 15 Oct 2026 01:50:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAbr-0000000Gcfp-3gTn
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:50:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C30B43265;
	Thu, 15 Oct 2026 01:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A73B1F000C4;
	Thu, 15 Oct 2026 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792029019;
	bh=XqCsBBDToclNhntWS7LwgwCgD6io3q7EceQlCXtUiuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PGJf06ngwaQwr3biaCaU9TpAVmbFprp7n3Ipjgw+QnNJyDJ6lP8jJISWbjlWWJsTa
	 R4RnmmLTaQliAuKDYnjo3ypOGMbGxsfj+RMFnYjUcWW3bzl9BaQ5I0esD/h9ePfMHb
	 nRY17QRgTs9OdkABkpahY0OK4HO82/qPvVlZKtB06Mckthp7Vq/FQzBScGiNcbOZmy
	 2P5NykZAhpS4+7brbXgufHXsK839w8P4xnvYIGRtHHfw+7oSyHH0GDGYx9pxMcL+fW
	 9Eb+VF+d+U3mHcBgLwxvNNLOUO44ZX5amNIGycT8tAl16/mZ1Xi9XwXYcl6Y9HWqMy
	 7zXqFugGYiDvw==
Message-ID: <sashiko-outbox-172123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/16] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Maxime Ripard" <mripard@kernel.org>, "Richard
 Genoud" <richard.genoud@bootlin.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Masahiro
 Yamada" <yamada.masahiro@socionext.com>, "Brian Norris" <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-6-5d3fc6ad2da1@gmail.com>
Date: Thu, 15 Oct 2026 01:50:16 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5k
OiBzdW54aTogUElPIG1vZGUgb3ZlcndyaXRlcyB6ZXJvIHBhdHRlcm4gd2l0aCBTUkFNIGdhcmJh
Z2UKLS0KCmNvbW1pdCA2YzM1NGVmM2JjODhhYzk1Y2RmNDBiMDkyZTVjMTQ2ZGU3NWFhNzg5CkF1
dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+ClN1YmplY3Q6
IG10ZDogcmF3bmFuZDogc3VueGk6IHNlbGVjdCB0aGUgcGF0dGVybiBJRCBmb3IgdGhlIGN1cnJl
bnQgRUNDIHN0ZXAKClRoaXMgY29tbWl0IGZpeGVzIHRoZSBwYXR0ZXJuLUlEIHJlZ2lzdGVyIGNo
ZWNrIGR1cmluZyBFQ0MgZXhjZXB0aW9uIG1vZGUuCkl0IHVwZGF0ZXMgdGhlIGNvcnJlY3Rpb24g
aGVscGVyIHRvIHRlc3QgdGhlIGJpdCBjb3JyZXNwb25kaW5nIHRvIHRoZQpjdXJyZW50IGhhcmR3
YXJlIHN0ZXAgcmF0aGVyIHRoYW4gYWx3YXlzIGNoZWNraW5nIGJpdCB6ZXJvLCB3aGljaCBlbnN1
cmVzCkRNQSBwcm9jZXNzaW5nIGNsYXNzaWZpZXMgcGh5c2ljYWwgYWxsLXplcm8gYW5kIGFsbC1v
bmVzIGRhdGEgYmxvY2tzCmNvcnJlY3RseS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+
IGluZGV4IDU3ZGY4ODA5OTIwNmEuLjgyNTY5ODJkMWQ1NjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jCj4gQEAgLTExMDEsNyArMTEwMSw3IEBAIHN0YXRpYyBpbnQgc3VueGlfbmZj
X2h3X2VjY19jb3JyZWN0KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpkYXRhLCB1OCAqb29i
LAo+ICAJaWYgKHBhdHRlcm5fZm91bmQgJiBCSVQoc3RlcCkpIHsKPiAgCQl1OCBwYXR0ZXJuOwo+
ICAKPiAtCQlpZiAodW5saWtlbHkoIShyZWFkbChuZmMtPnJlZ3MgKyBORkNfUkVHX1BBVF9JRChu
ZmMpKSAmIDB4MSkpKSB7Cj4gKwkJaWYgKHVubGlrZWx5KCEocmVhZGwobmZjLT5yZWdzICsgTkZD
X1JFR19QQVRfSUQobmZjKSkgJiBCSVQoc3RlcCkpKSkgewo+ICAJCQlwYXR0ZXJuID0gMHgwOwoK
W1NldmVyaXR5OiBNZWRpdW1dCldoZW4gdGhlIHBhdHRlcm4gaXMgaWRlbnRpZmllZCBhcyAweDAs
IHRoZSAqZXJhc2VkIG91dCBwYXJhbWV0ZXIgcmVtYWlucwpmYWxzZS4gTGF0ZXIgaW4gc3VueGlf
bmZjX29vYl9yZWFkX2JhdGNoKCksIHRoZSBjb2RlIGNoZWNrcyB0aGlzIGJvb2xlYW4KYW5kIGhh
bmRsZXMgUElPIG1vZGUgKCFyZWFkLT5kbWEpIGJ5IGNvcHlpbmcgZGlyZWN0bHkgZnJvbSBTUkFN
OgoKc3VueGlfbmZjX29vYl9yZWFkX2JhdGNoKCkgewogICAgLi4uCiAgICBpZiAoZXJhc2VkKSB7
CiAgICAgICAgcmVhZC0+aGFzX2VyYXNlZF9jaHVuayA9IHRydWU7CiAgICAgICAgY29udGludWU7
CiAgICB9CgogICAgaWYgKCFyZWFkLT5kbWEpCiAgICAgICAgbWVtY3B5X2Zyb21pbyhkYXRhLCBu
ZmMtPnJlZ3MgKyBORkNfUkFNMF9CQVNFLCBlY2MtPnNpemUpOwogICAgLi4uCn0KCklmIHNjcmFt
YmxpbmcgaXMgZW5hYmxlZCBmb3IgYSBwaHlzaWNhbCBhbGwtemVybyBibG9jayByZWFkIGluIFBJ
TyBtb2RlLAp3aWxsIHRoaXMgbWVtY3B5X2Zyb21pbygpIG92ZXJ3cml0ZSB0aGUgdmFsaWQgemVy
b3MgcG9wdWxhdGVkIGluCnN1bnhpX25mY19od19lY2NfY29ycmVjdCgpIHdpdGggZGVzY3JhbWJs
ZWQgcHNldWRvLXJhbmRvbSBnYXJiYWdlIGZyb20KdGhlIFNSQU0/CgpJdCBhcHBlYXJzIHRoaXMg
cmVncmVzc2lvbiBsZWF2ZXMgUElPIGJyb2tlbiB3aGlsZSBmaXhpbmcgRE1BIHplcm8KcGF0dGVy
biByZWFkcy4KCj4gIAkJfSBlbHNlIHsKPiAgCQkJcGF0dGVybiA9IDB4ZmY7CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDE0LXN1
Ym1pdC1zdW54aS1uYW5kLXZlbmRvci1vb2ItbGF5b3V0LXYxLXY3LTAtNWQzZmM2YWQyZGExQGdt
YWlsLmNvbT9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
