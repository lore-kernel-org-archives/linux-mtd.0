Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D7606A32C
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fARJ0Pfh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fW9X6j0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yiNzSEOGKDRgoLavX/7/X1z0V3xKg2dW/lesJNXFwE4=; b=fARJ0Pfhr+CRnzSFTGYOZqP0fY
	pkdRWj6Mby7flLNWEz2VnyvbPqdUbBYhk3YinI7ZyVBhHA4QNhuCZ/ET625r741OyTX5rZli2z8Uh
	fX1fWlmUkZYqKH+7klDIYiRehnzJxuDYjnpwCtyuwMHCeUpXsLNovTklLE2jaOgyx6WjZqkFx8ZRw
	ptmQfg8uPnlWgOtkoQSUGqrBid3CzruLdguUGg4ltNHi2kfqDFGFdU+pBA33Ndvnx1hrF4h8RD0/n
	IMraPQEwlOCGyxVppRl+i9zcH+hat++NXoAK0hr8QQK6pQ/5M58EBOZ69ovAMi2lhUW9UFtzvrzzW
	5ADKnvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnOv-0000000FPKm-3Od7;
	Sat, 07 Nov 2026 20:52:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnOu-0000000FPKS-1wUZ;
	Sat, 07 Nov 2026 20:52:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2C241632;
	Sat,  7 Nov 2026 20:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967C51F0089F;
	Sat,  7 Nov 2026 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084754;
	bh=5/yAbnSlT796zo6/LxI3k/ssH+kUZUnYtFmT5XnFCro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fW9X6j0t4J83x/radFZsJ5F/wcRHLrWKavr+S7Vr2Tl6udtBGD4FTMEyo281qdzbT
	 xuHuBJNvCDn8S6NOmEvftEBZ3yCw7rAg19u1q96kk0JHcwtxeevlKZQBz7iKcpalxl
	 rEPJhacWGxLQlE7FLGspZn9DmCyjZ7SSDXwB1fbq5XnvOm6V/R356z5n0J9Ym+cVYe
	 Lbi8CKzokYJlV6wuETANH9A2rBzisWEYyOJTL4E2GDADjQWUg6k+aiA7vLncA0mlNW
	 1s9RJJ41CUacldI2rQc/ielsN8oBmVxIhIAJ4bkS9d+Wxdsn1sTXW3UETxaKTBjG38
	 X8ZdsldmBVFKA==
Message-ID: <sashiko-outbox-203333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:52:29 +0000
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
OiBuYW5kc2ltOiBzaGlmdC1vdXQtb2YtYm91bmRzIGluIG5zX2luaXRfbW9kdWxlKCkKICBbMV0K
LS0KCmNvbW1pdCBjNmY3OTk4NTc4ZDFhMWMzYjUyZWJlZmY1ZTk2NjRjNmU3MjdkZTNlCkF1dGhv
cjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IHJhd25h
bmQ6IG5hbmRzaW06IHJldGFpbiBjaGlwIHN0YXRlIGFjcm9zcyByZW1vdmFsCgpUaGlzIGNvbW1p
dCBkaXNjb25uZWN0cyB0aGUgTkFORCBjaGlwIGJlZm9yZSBmcmVlaW5nIHNpbXVsYXRlZCBtZWRp
YSBhbmQKcmV0YWlucyB0aGUgY2hpcCBtZXRhZGF0YSB1bnRpbCB0aGUgZmluYWwgTVREIHJlZmVy
ZW5jZSBpcyBkcm9wcGVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZHNpbS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gaW5kZXggZmU5NjgwMzdm
NzVhMi4uMzlmZWZkODNjZDg1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kc2ltLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMKWyAuLi4gXQo+
IEBAIC0yMzc2LDYgKzIzODIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgbnNfaW5pdF9tb2R1bGUo
dm9pZCkKPiAgCXJldCA9IG5zX3BhcnNlX2JhZGJsb2NrcyhucywgbnNtdGQpOwo+ICAJaWYgKHJl
dCkKPiAgCQlnb3RvIGZyZWVfbnNfb2JqZWN0Owo+ICsJcmV0ID0gbmFuZF9zZXRfcmVsZWFzZShj
aGlwLCBuc19jaGlwX3JlbGVhc2UpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIGZyZWVfbnNfb2Jq
ZWN0Owo+ICsJcmV0YWluZWQgPSB0cnVlOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIHByb2JsZW0g
d2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbiBzZXR0aW5nIHRoZQpvdmVy
cmlkZXNpemUgbW9kdWxlIHBhcmFtZXRlciB0byAzMSBvciBoaWdoZXIgdHJpZ2dlciBhCnNoaWZ0
LW91dC1vZi1ib3VuZHMgWzFdIGVhcmxpZXIgaW4gbnNfaW5pdF9tb2R1bGUoKT8KCmRyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRzaW0uYzpuc19pbml0X21vZHVsZSgpIHsKCS4uLgoJaWYgKG92ZXJy
aWRlc2l6ZSkgewoJCXVpbnQ2NF90IG5ld19zaXplID0gKHVpbnQ2NF90KW5zbXRkLT5lcmFzZXNp
emUgPDwgb3ZlcnJpZGVzaXplOwoJCS4uLgoJCWlmIChuZXdfc2l6ZSA+PiBvdmVycmlkZXNpemUg
IT0gbnNtdGQtPmVyYXNlc2l6ZSkgewoJCQlOU19FUlIoIm92ZXJyaWRlc2l6ZSBpcyB0b28gYmln
XG4iKTsKCQkJcmV0ID0gLUVJTlZBTDsKCQkJZ290byBjbGVhbnVwX25hbmQ7CgkJfQoKCQkvKiBO
LkIuIFRoaXMgcmVsaWVzIG9uIG5hbmRfc2NhbiBub3QgZG9pbmcgYW55dGhpbmcgd2l0aCB0aGUg
c2l6ZSBiZWZvcmUgd2UgY2hhbmdlIGl0ICovCgkJbnNtdGQtPnNpemUgPSBuZXdfc2l6ZTsKCQlt
ZW1vcmctPmVyYXNlYmxvY2tzX3Blcl9sdW4gPSAxIDw8IG92ZXJyaWRlc2l6ZTsKCS4uLgp9CgpC
ZWNhdXNlIG5ld19zaXplIGlzIDY0LWJpdCwgdGhlIGJvdW5kcyBjaGVjayBwYXNzZXMgZm9yIG92
ZXJyaWRlc2l6ZQp2YWx1ZXMgdXAgdG8gNjMsIHdoaWxlICIxIDw8IG92ZXJyaWRlc2l6ZSIgc2hp
ZnRzIGEgMzItYml0IHNpZ25lZCBpbnQuCkFuIG92ZXJyaWRlc2l6ZSBvZiAzMSBvciBtb3JlIG92
ZXJmbG93cyBvciBpbnZva2VzIHVuZGVmaW5lZCBiZWhhdmlvciwKbGVhdmluZyBlcmFzZWJsb2Nr
c19wZXJfbHVuIHplcm8gb3IgYm9ndXMgYW5kIGxlYWRpbmcgdG8gYSBkaXZpZGUtYnktemVybwpk
dXJpbmcgTVREIEkvTyBvcGVyYXRpb25zLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcv
bGludXgtODVlMjk3NjMtZDcyMS00ZTNiLTkyNTMtN2I2NWY5ZGFkYTNhCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA3LXN1Ym1p
dC1yYXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAxODFlZjBjYzRjOEBn
bWFpbC5jb20/cGFydD01NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
