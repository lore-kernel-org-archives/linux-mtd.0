Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8126C606A329
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 18:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2nNCqSQj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilnC9Iav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GYRv+z4COGZ6z/EL4uNIPVeDISuikeAuCwqwyzQvWaI=; b=2nNCqSQjmRDhGN+Uq9RBXV2cv0
	j1YNuysFiNagQrRKnjLLkGOawMnrBNtJE4lvnui6bfW+ONyN+COzANyFCIzwhnxbIRbYz5pLiq0+W
	uRCUB1dmx5s5cLdZsjBWfZV7e+yzMpHSWkS3BGEfPN8arB3ynZtzLpv1uneyMZ/lFXFfMlPFzsuUM
	U6oaOQiQi023JPOGcXy757rYrK70QjA4n4Tlo2CILMC6uICDn0yaa1mYoEjb4ktI9ozsNHMYexMwT
	1F4uKvgXdGExx/E/BBJ1SZ5QRC/XxLvuJPPOQee2VYcZBtV0Ovmd14+DfGhAxSAMZJPiKOqNHyDVb
	pm17aX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNweX-0000000HZm5-1W5I;
	Mon, 02 Nov 2026 18:21:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNweV-0000000HZlU-2UjW
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 18:21:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B27C0609D5;
	Mon,  2 Nov 2026 18:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFD21F00A18;
	Mon,  2 Nov 2026 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643662;
	bh=qkCDx7kN+UeggCGbXHX7RwF1lcFrZoOnuHXhHxJg5mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilnC9Iavzsslfu/EM2SDbhf6g8QvXYL8Wgl8U7eaAuUXV0zfk1NVxo6SmQRFLAWAV
	 NDdDoxijOTZJvY/2qhHBfZFSg0aguTzDJ6vpsjwEwB+z7cF3Qy3GJ0V3bV9oxEoo0c
	 uESmMDg0PMqyEw+n3OJ3+y4Qfa6Ny9ikOTOpmGf/HNA2DICJxKjPG2Odzw1KrCgbhQ
	 XvkXTE4FgtWhVmyny0JtzWETcdmAtmSYKI4e1jAgUc1qRNYluQM5fW5zB/2TdphCLH
	 GTseLjZa9zDsCssFXxJSYba1DJ0F288pEgoOAdekEEGdv/vhSRxOQylEnQOoyXwo/V
	 tm7bVDWCiOyRA==
Message-ID: <sashiko-outbox-193928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, "Han Xu" <han.xu@nxp.com>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Vladimir Zapolskiy" <vz@mleia.com>, "Piotr
 Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Rosen Penev" <rosenp@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Wentao Liang" <vulab@iscas.ac.cn>,
 =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Chen
 Ni" <nichen@iscas.ac.cn>, "Runyu Xiao" <runyu.xiao@seu.edu.cn>, "Hemanth
 Selam" <hemanth.selam@gmail.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>, "Triet
 Hoang" <triet.hoang.dev@gmail.com>, =?utf-8?b?b3BlbiBsaXN0OkhZUEVSQlVT?=
 =?utf-8?b?IFNVUFBPUlQ=?= <linux-mtd@lists.infradead.org>, =?utf-8?b?b3Bl?=
 =?utf-8?b?biBsaXN0OkZSRUVTQ0FMRSBHUE1JIE5BTkQgRFJJVkVS?= <imx@lists.linux.dev>,
 =?utf-8?b?bW9kZXJhdGVkIGxpc3Q6QVJNL1NUTTMyIEFSQ0hJVEVDVFVSRQ==?= <linux-stm32@st-md-mailman.stormreply.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
Date: Mon, 02 Nov 2026 18:21:00 +0000
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZG1hZW5naW5lX2Rlc2Nfc2V0X2NhbGxiYWNrKCkgYnJlYWtzIGJ1aWxk
Ci0gW0xvd10gbXRkOiBjb21taXQgbWVzc2FnZSBpbmFjY3VyYXRlbHkgc3RhdGVzIGNoYW5nZSBp
cyBhY3Jvc3Mgc291bmQgZHJpdmVycwotLQoKY29tbWl0IDMyNDg0ZTk2MGYxY2U3YzZjNjdjMjdm
MmJjMmE2YTYzNzBmNjFjNTkKQXV0aG9yOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KCm10
ZDogdXNlIGRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjaygpCgpUaGlzIGNvbW1pdCByZXBsYWNl
cyBvcGVuLWNvZGVkIGFzc2lnbm1lbnRzIHRvIHRoZSBjYWxsYmFjayBhbmQKY2FsbGJhY2tfcGFy
YW0gZmllbGRzIG9mIHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciB3aXRoIGNhbGxzIHRv
CmRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjaygpIGFjcm9zcyAxNCBNVEQgZHJpdmVycy4KCj4g
ICAgIG10ZDogdXNlIGRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjaygpCj4gICAgIAo+ICAgICBS
ZXBsYWNlIG9wZW4tY29kZWQgYXNzaWdubWVudHMgdG8gY2FsbGJhY2sgYW5kIGNhbGxiYWNrX3Bh
cmFtIGZpZWxkcwo+ICAgICBvZiBzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3Igd2l0aCBj
YWxscyB0byB0aGUKPiAgICAgZG1hZW5naW5lX2Rlc2Nfc2V0X2NhbGxiYWNrKCkgaGVscGVyIGFj
cm9zcyBzb3VuZCBkcml2ZXJzLgo+ICAgICAKPiAgICAgTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50
ZW5kZWQuIFByZXBhcmUgdG8gbWFrZSBzdHJ1Y3QKPiAgICAgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0
b3IgcHJpdmF0ZSB0byB0aGUgRE1BIGVuZ2luZS4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKW1NldmVyaXR5OiBMb3ddClRoaXMgaXNuJ3Qg
YSBidWcsIGJ1dCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2F5cyAiYWNyb3NzIHNvdW5kIGRyaXZlcnMi
IHdoZW4gYWxsCjE0IG1vZGlmaWVkIGZpbGVzIGFyZSBNVEQgZHJpdmVycyB1bmRlciBkcml2ZXJz
L210ZC8uIFNob3VsZCB0aGlzIHNheSAiYWNyb3NzCk1URCBkcml2ZXJzIiBpbnN0ZWFkPwoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvaHlwZXJidXMvaGJtYy1hbTY1NC5jIGIvZHJpdmVycy9t
dGQvaHlwZXJidXMvaGJtYy1hbTY1NC5jCj4gaW5kZXggOGExNGU5MDhkMGI1My4uNTZiMjY1MTI1
YzdlOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9oeXBlcmJ1cy9oYm1jLWFtNjU0LmMKPiAr
KysgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9oYm1jLWFtNjU0LmMKPiBAQCAtMTAwLDggKzEwMCw3
IEBAIHN0YXRpYyBpbnQgYW02NTRfaGJtY19kbWFfcmVhZChzdHJ1Y3QgYW02NTRfaGJtY19kZXZp
Y2VfcHJpdiAqcHJpdiwgdm9pZCAqdG8sCj4gIAl9Cj4gIAo+ICAJcmVpbml0X2NvbXBsZXRpb24o
JnByaXYtPnJ4X2RtYV9jb21wbGV0ZSk7Cj4gLQl0eC0+Y2FsbGJhY2sgPSBhbTY1NF9oYm1jX2Rt
YV9jYWxsYmFjazsKPiAtCXR4LT5jYWxsYmFja19wYXJhbSA9IHByaXY7Cj4gKwlkbWFlbmdpbmVf
ZGVzY19zZXRfY2FsbGJhY2sodHgsIGFtNjU0X2hibWNfZG1hX2NhbGxiYWNrLCBOVUxMLCBwcml2
KTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIGJyZWFrIHRoZSBidWlsZCBmb3IgdGhlc2Ug
TVREIGRyaXZlcnM/CgpJbiBpbmNsdWRlL2xpbnV4L2RtYWVuZ2luZS5oLCBzdHJ1Y3QgZG1hX2Fz
eW5jX3R4X2Rlc2NyaXB0b3Igc3RpbGwgZGVmaW5lcyB0aGUKY2FsbGJhY2sgZmllbGRzIGRpcmVj
dGx5OgoKICAgIGRtYV9hc3luY190eF9jYWxsYmFjayBjYWxsYmFjazsKICAgIGRtYV9hc3luY190
eF9jYWxsYmFja19yZXN1bHQgY2FsbGJhY2tfcmVzdWx0OwogICAgdm9pZCAqY2FsbGJhY2tfcGFy
YW07CgphbmQgZG1hZW5naW5lX2Rlc2Nfc2V0X2NhbGxiYWNrKCkgaXMgbmVpdGhlciBkZWNsYXJl
ZCBub3IgZGVmaW5lZCBhbnl3aGVyZSBpbgppbmNsdWRlL2xpbnV4L2RtYWVuZ2luZS5oIG9yIHRo
ZSBrZXJuZWwgdHJlZSBhdCB0aGlzIGNvbW1pdC4KCkJ1aWxkaW5nIGFueSBvZiB0aGUgMTQgbW9k
aWZpZWQgZHJpdmVycyBmYWlscyB3aXRoIGFuIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mCmZ1bmN0
aW9uIGRtYWVuZ2luZV9kZXNjX3NldF9jYWxsYmFjaygpIGVycm9yIGluOgoKICAtIGRyaXZlcnMv
bXRkL2h5cGVyYnVzL2hibWMtYW02NTQuYzogYW02NTRfaGJtY19kbWFfcmVhZCgpCiAgLSBkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9vbWFwMi5jOiBvbWFwMl9vbmVuYW5kX2RtYV90
cmFuc2ZlcigpCiAgLSBkcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmM6IHFjb21fc3VibWl0
X2Rlc2NzKCkKICAtIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
OiBhdG1lbF9uYW5kX2RtYV90cmFuc2ZlcigpCiAgLSBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRl
bmNlLW5hbmQtY29udHJvbGxlci5jOiBjYWRlbmNlX25hbmRfc2xhdmVfZG1hX3RyYW5zZmVyKCkK
ICAtIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbWNfbmFuZC5jOiBkbWFfeGZlcigpCiAgLSBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmM6IGdwbWlfbmZjX2V4ZWNfb3Ao
KQogIC0gZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVyLmM6IGVidV9k
bWFfc3RhcnQoKQogIC0gZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9s
bGVyLmM6IGxvb25nc29uX25hbmRfZG1hX3RyYW5zZmVyKCkKICAtIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2xwYzMyeHhfbWxjLmM6IGxwYzMyeHhfeG1pdF9kbWEoKQogIC0gZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbHBjMzJ4eF9zbGMuYzogbHBjMzJ4eF94bWl0X2RtYSgpCiAgLSBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9vbWFwMi5jOiBvbWFwX25hbmRfZG1hX3RyYW5zZmVyKCkKICAtIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3NoX2ZsY3RsLmM6IGZsY3RsX2RtYV9maWZvMF90cmFuc2ZlcigpCiAgLSBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYzogc3RtMzJfZm1jMl9uZmNfeGZlcigp
CgpJcyB0aGlzIGNvbW1pdCBtaXNzaW5nIGEgcHJlcmVxdWlzaXRlIHBhdGNoIHRoYXQgaW50cm9k
dWNlcwpkbWFlbmdpbmVfZGVzY19zZXRfY2FsbGJhY2soKSBpbiBpbmNsdWRlL2xpbnV4L2RtYWVu
Z2luZS5oPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MTEwMjE4MTQwNi4zOTk0NDIyLTEtRnJhbmsuTGlAb3NzLm54cC5jb20/cGFy
dD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
