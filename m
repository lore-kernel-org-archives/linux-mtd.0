Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649D606A32E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 19:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kKa+YYO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lCgVm33R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PHCkakb/TcmDUWcGRY5t8jt224jdXO//0JF05RTveHw=; b=3kKa+YYOSLt2HYCdEXpn6fMqqK
	sRe2j0JhyNB4Hrmb/1uhwmMaICVOnWKoVS5pij9RrO3RXZxgv0Gcvz4uqDGrXlqxiNxA9PF0rM72K
	noT0CRGaoQ7gOynY86Gwvl7MYJDE84l4620Ea+W4/zBlDNVvNATt2kIT+6llL5ezWP/LVr+ags63Y
	0c1z5R59ssGIweUkc8Gv6WIE7u/gZd79oUDaWEeQhdmgy1ShbW5FsZ183UGovBgDcM4DsGetkCeVT
	lUEUbTKFApNbwkuHkTM2JSn5vvErUXXv7jtLtiXhup7v2fWnPYwliM7/CQ8/hLznqEVVwdTiX73lz
	uGW+afCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2tn-0000000AIg4-1q0p;
	Thu, 05 Nov 2026 19:13:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2tm-0000000AIfx-32jR
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 19:13:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0502441B33;
	Thu,  5 Nov 2026 19:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C151F000C1;
	Thu,  5 Nov 2026 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906001;
	bh=bWoUw0v85zV3qDcWRLloegiWXI8H90sykJZsNR/TAqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lCgVm33RLYIh8TNpmuCn12/xAde129MgnsOWokB3gB6Rv91jNMzmtOSM257Ty9a7N
	 2e/SKFKpw1DOZe70ojYG0BZqOUu/bOxnqFqPKtSfGkfEDaakQFFeoQ6C4uiT3eIX+m
	 FUVnkJnAIULk52NAqho+YjViL9OsMWyVhVU6dKdskJOqEt7fpnQJVTyHjAO2V+nFDA
	 dhgTSRbkn4RZzfNe+5+HAHoPmopQe0uGJn1ylama7Q1583QpQpqYqTguX4twG4mfvr
	 dsr9nonV2SFJUqJAgK5Lewr2vtbCbR65T5vRCoLXUS23ND2em+CVCdH+J0b2uAkdZq
	 FcztQSYXaouUA==
Message-ID: <sashiko-outbox-199823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/26] mtd: rawnand: sunxi: centralize OOB handling
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams" <clrkwllms@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Cc: "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Maxime Ripard" <mripard@kernel.org>, "Richard
 Genoud" <richard.genoud@bootlin.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Masahiro
 Yamada" <yamada.masahiro@socionext.com>, "Brian Norris" <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-1-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-1-dca1f6ed29a8@gmail.com>
Date: Thu, 05 Nov 2026 19:13:20 +0000
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDog
c3VueGk6IHByZW1hdHVyZSBvb2Jfb3BzIHNlbGVjdGlvbiBpbiBzdW54aV9uYW5kX2F0dGFjaF9j
aGlwKCkKLSBbTWVkaXVtXSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiB1bmFkZHJlc3NlZCBtYWludGFp
bmVyIE5BQ0sgb24gdmVuZG9yIE9PQiBsYXlvdXQgb3BzCi0tCgpjb21taXQgOGZkYTVjOTlkOWJl
ZmExNzcxNDE4NTE2ODI4ZjA0MGRlNjBjNTg0NQpBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRkOiByYXduYW5kOiBzdW54aTogY2VudHJhbGl6ZSBP
T0IgaGFuZGxpbmcKClRoaXMgY29tbWl0IGNlbnRyYWxpemVzIGhhcmR3YXJlIEVDQyByZXN1bHQg
aW50ZXJwcmV0YXRpb24sIHByb3RlY3RlZCBPT0IKcmV0cmlldmFsLCBlcmFzZWQtY2h1bmsgY2hl
Y2tpbmcsIGFuZCB1c2VyLWRhdGEgbGF5b3V0IHJlc2VydmF0aW9uIGJlaGluZApwZXItY2hpcCBz
dW54aV9uZmNfb29iX29wcyBjYWxsYmFja3MgZm9yIGJvdGggUElPIGFuZCBETUEgcGF0aHMuCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiBpbmRleCBmNDFmZWViZTQyNTcxLi44MDAwNmQx
YTMzZDY4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwpbIC4uLiBdCj4gQEAgLTIw
NjYsNiArMjA5Niw1OCBAQCBzdGF0aWMgaW50IHN1bnhpX25mY19tYXhpbWl6ZV91c2VyX2RhdGEo
c3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdWludDMyX3Qgb29ic2l6ZQpbIC4uLiBdCj4gKy8qCj4g
KyAqIEJvdGggbW9kZXMgdXNlIHRoZSBzYW1lIGxheW91dCBhbmQgRUNDIHBvbGljeS4gU2NyYW1i
bGVkIHRyYW5zZmVycyBhbHNvCj4gKyAqIGNvbXBlbnNhdGUgdGhlIGZpcnN0IHR3byB1c2VyIGJ5
dGVzIHRvIGtlZXAgdGhlIG9uLWZsYXNoIEJCTSB1bm1vZGlmaWVkLgo+ICsgKi8KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfb29iX29wcyBzdW54aV9uZmNfcGxhaW5fb29iX29wcyA9
IHsKPiArCS5taW5fdXNlcl9kYXRhID0gc3VueGlfbmZjX29vYl9taW5fdXNlcl9kYXRhLAo+ICsJ
LmluaXRfdXNlcl9kYXRhID0gc3VueGlfbmZjX29vYl9pbml0X3VzZXJfZGF0YSwKPiArCS5yZWFk
X2JhdGNoID0gc3VueGlfbmZjX29vYl9yZWFkX2JhdGNoLAo+ICsJLmZpbmlzaF9yZWFkID0gc3Vu
eGlfbmZjX29vYl9maW5pc2hfcmVhZCwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3VueGlfbmZjX29vYl9vcHMgc3VueGlfbmZjX3NjcmFtYmxlZF9wbGFpbl9iYm1fb29iX29wcyA9
IHsKPiArCS5taW5fdXNlcl9kYXRhID0gc3VueGlfbmZjX29vYl9taW5fdXNlcl9kYXRhLAo+ICsJ
LmluaXRfdXNlcl9kYXRhID0gc3VueGlfbmZjX29vYl9pbml0X3VzZXJfZGF0YSwKPiArCS50cmFu
c2Zvcm1fYmJtID0gc3VueGlfbmZjX3JhbmRvbWl6ZV9iYm0sCj4gKwkucmVhZF9iYXRjaCA9IHN1
bnhpX25mY19vb2JfcmVhZF9iYXRjaCwKPiArCS5maW5pc2hfcmVhZCA9IHN1bnhpX25mY19vb2Jf
ZmluaXNoX3JlYWQsCj4gK307CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQXMgcmVwb3J0ZWQgYnkgTWlx
dWVsIFJheW5hbCBvbiB2NiBbMV0sIHRoZSBzZXJpZXMgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZQp2
ZW5kb3Itc3BlY2lmaWMgQWxsd2lubmVyIHJhbmRvbWl6ZWQgT09CIGxheW91dCB3YXMgZGVjbGlu
ZWQgZHVlIHRvCm1haW50YWluYWJpbGl0eSBjb25jZXJucyBhbmQga2VybmVsIHBvbGljeSBhZ2Fp
bnN0IHZlbmRvci1zcGVjaWZpYyBOQU5ECmxheW91dHMsIHdpdGggYW4gaW52aXRhdGlvbiB0byBz
dWJtaXQgb25seSB0aGUgc3RhbmRhbG9uZSBmaXhlcyBvdXRzaWRlIG9mCnRoZSByYW5kb21pemVk
IGxheW91dCBzdXBwb3J0LgoKSGVyZSwgc3VueGlfbmZjX3BsYWluX29vYl9vcHMgYW5kIHN1bnhp
X25mY19zY3JhbWJsZWRfcGxhaW5fYmJtX29vYl9vcHMgdXNlCmlkZW50aWNhbCBjYWxsYmFja3Mg
Zm9yIG1pbl91c2VyX2RhdGEsIGluaXRfdXNlcl9kYXRhLCByZWFkX2JhdGNoLCBhbmQKZmluaXNo
X3JlYWQsIGRpZmZlcmluZyBvbmx5IGluIHRyYW5zZm9ybV9iYm0uIFRoZSByZW1haW5pbmcgaW5k
aXJlY3Rpb24gaW4Kc3RydWN0IHN1bnhpX25mY19vb2Jfb3BzIGlzIG9ubHkgdXNlZCBieSB0aGUg
dmVuZG9yLXNwZWNpZmljIHJhbmRvbWl6ZWQgT09CCmxheW91dCBwYXRjaCBsYXRlciBpbiB0aGUg
c2VyaWVzLgoKQ291bGQgdGhlIFBJTyBhbmQgRE1BIEVDQyByZWFkIGhlbHBlcnMgYmUgc2hhcmVk
IGRpcmVjdGx5IGFuZCB0aGUgc3RhbmRhbG9uZQpmaXhlcyBzcGxpdCBvdXQgd2l0aG91dCBpbnRy
b2R1Y2luZyB0aGUgc3RydWN0IHN1bnhpX25mY19vb2Jfb3BzIHZ0YWJsZT8KClsgLi4uIF0KPiBA
QCAtMjI1NCw2ICsyMzAzLDkgQEAgc3RhdGljIGludCBzdW54aV9uYW5kX2F0dGFjaF9jaGlwKHN0
cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gIAlpZiAoIWVjYy0+c2l6ZSB8fCAhZWNjLT5zdHJlbmd0
aCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gKwlzdW54aV9uYW5kLT5vb2Jfb3BzID0gbmFu
ZC0+b3B0aW9ucyAmIE5BTkRfTkVFRF9TQ1JBTUJMSU5HID8KPiArCQkmc3VueGlfbmZjX3NjcmFt
YmxlZF9wbGFpbl9iYm1fb29iX29wcyA6ICZzdW54aV9uZmNfcGxhaW5fb29iX29wczsKCltTZXZl
cml0eTogSGlnaF0KRG9lcyBzZWxlY3Rpbmcgc3VueGlfbmFuZC0+b29iX29wcyBpbiBzdW54aV9u
YW5kX2F0dGFjaF9jaGlwKCkgYnJlYWsgYmFkCmJsb2NrIG1hcmtlciBjb21wZW5zYXRpb24gZm9y
IGNoaXBzIHRoYXQgc2V0IE5BTkRfTkVFRF9TQ1JBTUJMSU5HIGR1cmluZwpuYW5kX21hbnVmYWN0
dXJlcl9pbml0KCk/CgpJbiBuYW5kX3NjYW5fd2l0aF9pZHMoKSwgbmFuZF9hdHRhY2goKSBydW5z
IGJlZm9yZSBuYW5kX3NjYW5fdGFpbCgpOgoKICBuYW5kX3NjYW5fd2l0aF9pZHMoKQogICAgLT4g
bmFuZF9zY2FuX2lkZW50KCkKICAgIC0+IG5hbmRfYXR0YWNoKCkKICAgICAgLT4gc3VueGlfbmFu
ZF9hdHRhY2hfY2hpcCgpCiAgICAtPiBuYW5kX3NjYW5fdGFpbCgpCiAgICAgIC0+IG5hbmRfbWFu
dWZhY3R1cmVyX2luaXQoKQoKRm9yIE9ORkktY29tcGxpYW50IGNoaXBzIHdoZXJlIG5hbmRfb25m
aV9kZXRlY3QoKSBzdWNjZWVkcyBpbiBuYW5kX2RldGVjdCgpCmFuZCBqdW1wcyB0byBpZGVudF9k
b25lIHdpdGhvdXQgc2V0dGluZyBOQU5EX05FRURfU0NSQU1CTElORywgdGhlIGZsYWcgY2FuCmJl
IHNldCBsYXRlciBpbiBuYW5kX21hbnVmYWN0dXJlcl9pbml0KCksIHN1Y2ggYXMgaW4KZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF90b3NoaWJhLmM6CgogIHRvc2hpYmFfbmFuZF9pbml0KCkKICAg
IC0+IHRjNTh0ZWc1ZGNsdGEwMF9pbml0KCkKICAgICAgY2hpcC0+b3B0aW9ucyB8PSBOQU5EX05F
RURfU0NSQU1CTElORzsKCkJlY2F1c2Ugc3VueGlfbmFuZF9hdHRhY2hfY2hpcCgpIHJ1bnMgYmVm
b3JlIG5hbmRfbWFudWZhY3R1cmVyX2luaXQoKSwKc3VueGlfbmFuZC0+b29iX29wcyBpcyBsYXRj
aGVkIHRvIHN1bnhpX25mY19wbGFpbl9vb2Jfb3BzICh3aGVyZQp0cmFuc2Zvcm1fYmJtIGlzIE5V
TEwpLiBMYXRlciwgZHVyaW5nIHBhZ2UgYW5kIE9PQiByZWFkcyBhbmQgd3JpdGVzLApzdW54aV9u
ZmNfcmFuZG9taXplcl9jb25maWcoKSBhbmQgc3VueGlfbmZjX3JhbmRvbWl6ZXJfZW5hYmxlKCkg
ZHluYW1pY2FsbHkKY2hlY2sgbmFuZC0+b3B0aW9ucyAmIE5BTkRfTkVFRF9TQ1JBTUJMSU5HIGFu
ZCBlbmFibGUgaGFyZHdhcmUgc2NyYW1ibGluZywKd2hpbGUgc3VueGlfbmZjX2h3X2VjY19nZXRf
cHJvdF9vb2JfYnl0ZXMoKSBhbmQKc3VueGlfbmZjX2h3X2VjY19zZXRfcHJvdF9vb2JfYnl0ZXMo
KSBjaGVjayBzdW54aV9uYW5kLT5vb2Jfb3BzLT50cmFuc2Zvcm1fYmJtCmFuZCBza2lwIGNhbGxp
bmcgc3VueGlfbmZjX3JhbmRvbWl6ZV9iYm0oKS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzg3MXA5djRhMXguZnNmQGJvb3RsaW4uY29tCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA1LXN1Ym1pdC1zdW54aS1uYW5k
LXZlbmRvci1vb2ItbGF5b3V0LXYxLXYxMC0wLWRjYTFmNmVkMjlhOEBnbWFpbC5jb20/cGFydD0x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
