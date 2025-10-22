Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC0CCCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asC/b7Bpwm1yZoe6q8N7r6nYUNc3tPd0sBGzJAR3jjs=; b=VoIDa7O6ygGSkg
	4IexYvcn9cJBhbAU/I3QlUGkmfvpJkaDFhT54gKp9YrN66jCZjC4kUyUmn53llLYlVsb0jpnSWarG
	FtS4Yv13epe8YqUCup0Fxldus86EuGOQGMihB+Kz2WHqm8JdFDSMwl+Lpy+WwQ837WSiQsT1LnBDJ
	agp9qpQm82OZF55Jm5sbqsvl5wccfBw5tFXPAw7rErCZE5J+LTJ8nsiFWc5EofnYZXCtYB5c2lkv+
	c63x1GuwhufUyLj1g1nzngUMcJzLvgV9nsSTYikuQgbjy1Zv61kq0N6uOw3PV6TvgKDQrrAX3EoDE
	gO+VImD7JbVfo3cgsmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUbt-000000029is-1JCU;
	Wed, 22 Oct 2025 08:54:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUbp-000000029hm-1WpN
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 08:54:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 427974E41260;
	Wed, 22 Oct 2025 08:54:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E381606DC;
	Wed, 22 Oct 2025 08:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 557A8102F242F;
	Wed, 22 Oct 2025 10:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UdkqHbshapC7nZY4/zFoditcNqEk/iGcG2EMytEmpUc=;
	b=sz9Wv6lqYxBw+efub1O+67sRO5hj1GJKSrnQlOg8RP6sH79keyWGAzsK4Q+4n1BMEdB7VS
	TYOlusTcal3NLBThus+SARMOan5OGVRHZIorH9GQCpJoigQOUA9yFIoEoNLMT3yx+Sjvdd
	aWFll3rPZFjgq12I1YFpGxjlTEjVrsIAMG94T945WWTouRh4oilP/lVIsQ9J9DYlk3fS0D
	RCns2kaBXugtb8nVvJoIciKphHOiT+lUAdK7dT+UZflZ4C4hdMp+ZOrBIv5J5MOX5exH06
	3pUkH8Zf3TmQhgbiLKKoyN6L/DLMNpHiQDj1Jx5+laX7Shvkj31BB/uuvktcWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] mtd: rawnand: sunxi: introduce reg_user_data
 in sunxi_nfc_caps
In-Reply-To: <20251020101311.256819-5-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:00 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-5-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 10:54:02 +0200
Message-ID: <87y0p3tiz9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_015417_716719_D94C1851 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKCk9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDAgKzAyLCBSaWNoYXJkIEdlbm91
ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgSDYvSDYxNiBVU0VS
X0RBVEEgcmVnaXN0ZXIgaXMgbm90IGF0IHRoZSBzYW1lIG9mZnNldCBhcyB0aGUKPiBBMTAvQTIz
IG9uZSwgc28gbW92ZSBpdHMgb2Zmc2V0IGludG8gc3VueGlfbmZjX2NhcHMKPgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQu
Z2Vub3VkQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9u
YW5kLmMgfCAxMyArKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gaW5kZXgg
MDI4NWU0ZDBjYTdmLi44ZjVkOGRmMTllMzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFu
ZC5jCj4gQEAgLTQ4LDcgKzQ4LDggQEAKPiAgI2RlZmluZSBORkNfUkVHX0RFQlVHCQkweDAwM0MK
PiAgI2RlZmluZSBORkNfUkVHX0ExMF9FQ0NfRVJSX0NOVAkweDAwNDAKPiAgI2RlZmluZSBORkNf
UkVHX0VDQ19FUlJfQ05UKG5mYywgeCkJKChuZmMtPmNhcHMtPnJlZ19lY2NfZXJyX2NudCArICh4
KSkgJiB+MHgzKQo+IC0jZGVmaW5lIE5GQ19SRUdfVVNFUl9EQVRBKHgpCSgweDAwNTAgKyAoKHgp
ICogNCkpCj4gKyNkZWZpbmUgTkZDX1JFR19BMTBfVVNFUl9EQVRBCTB4MDA1MAo+ICsjZGVmaW5l
IE5GQ19SRUdfVVNFUl9EQVRBKG5mYywgeCkJKG5mYy0+Y2Fwcy0+cmVnX3VzZXJfZGF0YSArICgo
eCkgKiA0KSkKPiAgI2RlZmluZSBORkNfUkVHX1NQQVJFX0FSRUEJMHgwMEEwCj4gICNkZWZpbmUg
TkZDX1JFR19QQVRfSUQJCTB4MDBBNAo+ICAjZGVmaW5lIE5GQ19SRUdfTURNQV9BRERSCTB4MDBD
MAo+IEBAIC0yMTQsNiArMjE1LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3VueGlfbmFuZF9j
aGlwICp0b19zdW54aV9uYW5kKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQpCj4gICAqCQkJdGhyb3Vn
aCBNQlVTIG9uIEEyMy9BMzMgbmVlZHMgZXh0cmEgY29uZmlndXJhdGlvbi4KPiAgICogQHJlZ19p
b19kYXRhOglJL08gZGF0YSByZWdpc3Rlcgo+ICAgKiBAcmVnX2VjY19lcnJfY250OglFQ0MgZXJy
b3IgY291bnRlciByZWdpc3Rlcgo+ICsgKiBAcmVnX3VzZXJfZGF0YToJVXNlciBkYXRhIHJlZ2lz
dGVyCj4gICAqIEBkbWFfbWF4YnVyc3Q6CURNQSBtYXhidXJzdAo+ICAgKiBAZWNjX3N0cmVuZ3Ro
czoJQXZhaWxhYmxlIEVDQyBzdHJlbmd0aHMgYXJyYXkKPiAgICogQG5zdHJlbmd0aHM6CQlTaXpl
IG9mIEBlY2Nfc3RyZW5ndGhzCj4gQEAgLTIyMiw2ICsyMjQsNyBAQCBzdHJ1Y3Qgc3VueGlfbmZj
X2NhcHMgewo+ICAJYm9vbCBoYXNfbWRtYTsKPiAgCXVuc2lnbmVkIGludCByZWdfaW9fZGF0YTsK
PiAgCXVuc2lnbmVkIGludCByZWdfZWNjX2Vycl9jbnQ7Cj4gKwl1bnNpZ25lZCBpbnQgcmVnX3Vz
ZXJfZGF0YTsKPiAgCXVuc2lnbmVkIGludCBkbWFfbWF4YnVyc3Q7Cj4gIAljb25zdCB1OCAqZWNj
X3N0cmVuZ3RoczsKPiAgCXVuc2lnbmVkIGludCBuc3RyZW5ndGhzOwo+IEBAIC03MjMsOCArNzI2
LDggQEAgc3RhdGljIHZvaWQgc3VueGlfbmZjX2h3X2VjY19nZXRfcHJvdF9vb2JfYnl0ZXMoc3Ry
dWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYiwKPiAgewo+ICAJc3RydWN0IHN1bnhpX25mYyAq
bmZjID0gdG9fc3VueGlfbmZjKG5hbmQtPmNvbnRyb2xsZXIpOwo+ICAKPiAtCXN1bnhpX25mY191
c2VyX2RhdGFfdG9fYnVmKHJlYWRsKG5mYy0+cmVncyArIE5GQ19SRUdfVVNFUl9EQVRBKHN0ZXAp
KSwKPiAtCQkJCSAgIG9vYik7Cj4gKwlzdW54aV9uZmNfdXNlcl9kYXRhX3RvX2J1ZihyZWFkbChu
ZmMtPnJlZ3MgKwo+ICsJCQkJCSBORkNfUkVHX1VTRVJfREFUQShuZmMsIHN0ZXApKSwKPiBvb2Ip
OwoKTWlub3Igbml0LCBjb2x1bW4gbGltaXQgaXMgMTAwIG5vdywgc28gdHlwaWNhbGx5IGZvciB0
aGlzIGtpbmQgb2YKc2l0dWF0aW9uIGV2ZXJ5dGhpbmcgd291bGQgZml0IG9uIGEgc2luZ2xlIGxp
bmUuCgpEb24ndCByZXNwaW4ganVzdCBmb3IgdGhhdCBpZiB0aGVyZSBpcyBub3RoaW5nIGVsc2Ug
bGF0ZXIsIGJ1dCBpZiBhIHY0CmlzIG5lZWRlZCB5b3UgY2FuIGNoYW5nZSBpdC4KCkxvb2tzIG5l
YXQgb3RoZXJ3aXNlIHNvIGZhci4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
