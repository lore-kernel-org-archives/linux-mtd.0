Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F2606A32E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=INJeo8NW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mYJoNCay
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MVJtUARtC2BjHkOIDMf5GxhXEHhwBZs2t4rgWMC1I4Y=; b=INJeo8NWzBUetS9wpFVhOduvT5
	ied4tdG4qIorbH62ZDX+J/N80GqU77WQmUhiyHljrqds4pisyuW+T0mEsYxymc/eVz0iiDeubGhig
	48FU3HEIG6y0gFqEFLNp9Ag6CyLHzINfzaKyMCPtNMIdSwjsvieYHWLNdkUX4EofMs+q8/3BLzzM7
	564CZCWjAfkW/hdTWaUwN8e86R1yhQeJQPowq50o1h3VIsa5qlqQ4IHfzRySJjneFfmbzXBNZKlxR
	S1RCRFyXngFwck8Eiq06bfsQjfbiXr9fkxhLzu3FfQFQGzXZ6RirHAUvxlWcXB9f5q3v70sXQKi4o
	10LCNrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnK3-0000000FOik-3KEH;
	Sat, 07 Nov 2026 20:47:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnK0-0000000FOiT-3umi;
	Sat, 07 Nov 2026 20:47:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35883417C6;
	Sat,  7 Nov 2026 20:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F67A1F0089F;
	Sat,  7 Nov 2026 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084452;
	bh=0KebwVLYB2D2L6loP8NHGLZcG3tV/DtfHEbIAoU8RMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mYJoNCay27RFXMdep+ySASAN5VNIZ5d5/8bbraSiMJjesxQ+flhHAeeLo/POilJH2
	 lIbg7gWtxKy6s4+kCBlSLvhOUVrHRg1Jq3BbQxeoK/1/2XADVNLSemos8qr1zxC7fr
	 vGLU02y7h4gtXmMAnYBUOyIhoauo8XFi0M+ZYWH8Ng8lslGRXWOPjZM9/FyMbEMGCP
	 TyUU1Ufy5fdqvIC2fOo28Ay1ouCYq+tdYUfbrQiaIGWnlvNwggEhVMfg9w+8ujfqn1
	 48P7XWdSOEoigw7Ixq74Oq7cFltc9I6ySeDd27idLc3E0480Tb16dYYi6WDbq6IDvu
	 rlQdAb4eXbmAg==
Message-ID: <sashiko-outbox-203326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-39-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:47:28 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBx
Y29tOiBicm9rZW4gZXJyb3IgaGFuZGxpbmcgaW4KICBxY29tX3Byb2JlX25hbmRfZGV2aWNlcygp
Ci0tCgpjb21taXQgMGE5MDg0Y2Y1ZmVjNzkyZmY0ODMzZmU2YzJkNWM4Zjk3ODBjNjBhMQpBdXRo
b3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRkOiByYXdu
YW5kOiBxY29tOiByZXRhaW4gb3Blbi1oYW5kbGUgc3RhdGUgb24gcmVtb3ZhbAoKVGhpcyBjb21t
aXQgdGllcyB0aGUgbGlmZXRpbWUgb2YgcWNvbV9uYW5kX2hvc3QgYW5kIHFjb21fbmFuZF9jb250
cm9sbGVyIHRvCnRoZSBNVEQgYW5kIE5BTkQgY29udHJvbGxlciByZWxlYXNlIGNhbGxiYWNrcywg
dmFsaWRhdGVzIGJvb3QgcGFydGl0aW9ucwpiZWZvcmUgcmVnaXN0ZXJpbmcgTVREIGRldmljZXMs
IGFuZCBhZGRzIGNsZWFudXAgb2YgcmVnaXN0ZXJlZCBjaGlwcyBvbgpwcm9iZSBmYWlsdXJlIGFu
ZCByZW1vdmFsLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMmQ5OGY3OWI0
OTJkNi4uZjgxMmRlMWQ3NzZmYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9x
Y29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKClsg
Li4uIF0KCj4gQEAgLTIwNzcsMTUgKzIwOTEsMTMgQEAgc3RhdGljIGludCBxY29tX3Byb2JlX25h
bmRfZGV2aWNlcyhzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjKQo+ICAJaW50IHJl
dCA9IC1FTk9ERVY7Cj4gIAo+ICAJZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGVfc2Nv
cGVkKGRuLCBjaGlsZCkgewo+IC0JCWhvc3QgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmhv
c3QpLCBHRlBfS0VSTkVMKTsKPiArCQlob3N0ID0ga3phbGxvY19vYmooKmhvc3QpOwo+ICAJCWlm
ICghaG9zdCkKPiAgCQkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJCXJldCA9IHFjb21fbmFuZF9o
b3N0X2luaXRfYW5kX3JlZ2lzdGVyKG5hbmRjLCBob3N0LCBjaGlsZCk7Cj4gLQkJaWYgKHJldCkg
ewo+IC0JCQlkZXZtX2tmcmVlKGRldiwgaG9zdCk7Cj4gKwkJaWYgKHJldCkKPiAgCQkJY29udGlu
dWU7Cj4gLQkJfQo+ICAKPiAgCQlsaXN0X2FkZF90YWlsKCZob3N0LT5ub2RlLCAmbmFuZGMtPmhv
c3RfbGlzdCk7Cj4gIAl9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHFjb21fcHJvYmVfbmFu
ZF9kZXZpY2VzKCkgcmV0dXJuIHJldCBpbnN0ZWFkIG9mIGNvbnRpbnVpbmcgd2hlbgpxY29tX25h
bmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcigpIGZhaWxzPwoKQ29udGludWluZyB0aGUgbG9vcCBt
ZWFucyB0aGF0IGlmIGFuIGVhcmxpZXIgY2hpbGQgbm9kZSBmYWlscyAoZm9yIGV4YW1wbGUKd2l0
aCAtRVBST0JFX0RFRkVSIG9yIGludmFsaWQgYm9vdCBwYXJ0aXRpb25zKSBhbmQgYSBsYXRlciBj
aGlsZCBzdWNjZWVkcywKcmV0IGlzIG92ZXJ3cml0dGVuIHdpdGggMCBhbmQgdGhlIHBhcnRpYWwg
cHJvYmUgaXMgbm90IHVud291bmQgdmlhCmVycl9zZXR1cC4KCldvcnNlLCBpZiB0aGUgZWFybGll
ciBjaGlsZCBmYWlscyBpbiBxY29tX25hbmRfYXR0YWNoX2NoaXAoKSB3aGVuCnFjb21fYWxsb2Nf
YmFtX3RyYW5zYWN0aW9uKCkgcmV0dXJucyBOVUxMIGFmdGVyIHFjb21fZnJlZV9iYW1fdHJhbnNh
Y3Rpb24oKQpmcmVlZCBuYW5kYy0+YmFtX3R4bjoKCmRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21f
bmFuZGMuYzpxY29tX25hbmRfYXR0YWNoX2NoaXAoKSB7CiAgICAuLi4KCWlmIChuYW5kYy0+cHJv
cHMtPnN1cHBvcnRzX2JhbSkKCQlxY29tX2ZyZWVfYmFtX3RyYW5zYWN0aW9uKG5hbmRjKTsKCglu
YW5kYy0+bWF4X2N3cGVycGFnZSA9IG1heF90KHVuc2lnbmVkIGludCwgbmFuZGMtPm1heF9jd3Bl
cnBhZ2UsCgkJCQkgICAgIGN3cGVycGFnZSk7CgoJLyogTm93IGFsbG9jYXRlIHRoZSBCQU0gdHJh
bnNhY3Rpb24gYmFzZWQgb24gdXBkYXRlZCBtYXhfY3dwZXJwYWdlICovCglpZiAobmFuZGMtPnBy
b3BzLT5zdXBwb3J0c19iYW0pIHsKCQluYW5kYy0+YmFtX3R4biA9IHFjb21fYWxsb2NfYmFtX3Ry
YW5zYWN0aW9uKG5hbmRjKTsKCQlpZiAoIW5hbmRjLT5iYW1fdHhuKSB7CgkJCWRldl9lcnIobmFu
ZGMtPmRldiwKCQkJCSJmYWlsZWQgdG8gYWxsb2NhdGUgYmFtIHRyYW5zYWN0aW9uXG4iKTsKCQkJ
cmV0dXJuIC1FTk9NRU07CgkJfQoJfQogICAgLi4uCn0KCmNvbnRpbnVpbmcgdG8gdGhlIG5leHQg
Y2hpbGQgbm9kZSBjYWxscyBuYW5kX3NjYW4oKSwgd2hpY2ggcnVucwpxY29tX2NsZWFyX2JhbV90
cmFuc2FjdGlvbigpIGFuZCBkZXJlZmVyZW5jZXMgbmFuZGMtPmJhbV90eG4gd2hpbGUgaXQgaXMK
TlVMTC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjExMDctc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYx
LXYxLTAtMDE4MWVmMGNjNGM4QGdtYWlsLmNvbT9wYXJ0PTM5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
