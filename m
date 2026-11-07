Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F43606A32D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=flzmYKJF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNWucWpk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ibBbjVz/E9zWn1HfK99SkL7TLChvZuzLK3hLeY9P6wU=; b=flzmYKJF7emUtfmHUlB1TAMGbc
	2MPF1HVCKhG0THvJyZX9ftxPfPtd2VMnPz2H0jTMJkXSMrC1Kx58PkgxG1e18m8ZfD07kRvOeKRGV
	BYdyliCvCTQe+wRpJovdyAMJy4T9XHVqs7TMcNZtWn6b8RkJ2AGbdM502j/4avoXRphicrjadClHT
	Cx0P8AC8n53WQtQcwCnW+xfZEvf6gPQC9kY2ugfyZc/C8VZkNeVX6i1Q7F8e58tnbo6TJLIUGVkky
	PVVXZZ4XRtR4eH62HyaVsG/xNp8FieZCQAnkkb6llcianTMydqISAAfrOw3J3nhB2a9wWi68EEbNE
	be38Cu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnHG-0000000FOS6-18if;
	Sat, 07 Nov 2026 20:44:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnHE-0000000FORV-1Br1;
	Sat, 07 Nov 2026 20:44:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E4F4124B;
	Sat,  7 Nov 2026 20:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03E61F0089F;
	Sat,  7 Nov 2026 20:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084279;
	bh=IPm3mqNZ6e+qAhw2GbfDLGuo9LmeBSigrixHpfLPFj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VNWucWpkETSDTR5IVj0MisZFv0GDxKS9e9reNOmDtEGwhfwbNubu8DAnlJ6VTCNPK
	 45oWTq3zRGDOr7iDTAKHk8GV1JXGXIb5rYS357JDhbWO9NBu+ar+0DDr/G9cEK0CSy
	 sRu3bK93XQwk27CasNRLFSumWgE3MLcciQKMuRKbCozlhKxsy7k0PFuIvNij31raz3
	 /8rTddyg7K4bWXBcfWQUjvcTzPdSUJAMjP76GPbDY0hlfxY1G5vt67uG8yFzWsqvB1
	 3DpO5ufNY3vtWo198fVq/m7zy/iZmF8O/3Lv1pog/FCl6ht3+sO/orznDSweP9QKRf
	 pKy71kcoVpFSg==
Message-ID: <sashiko-outbox-203322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 42/58] mtd: rawnand: au1550nd: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-42-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:44:36 +0000
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
OiBhdTE1NTBuZDogaW52ZXJ0ZWQgcmVxdWVzdF9tZW1fcmVnaW9uIGNoZWNrIGluCiAgYXUxNTUw
bmRfcHJvYmUoKSBbMV0KLS0KCmNvbW1pdCBiZTNiZGNhN2FhMzdiZjllNzBlNDNiZTI5YjBiOTlh
OWFmNGJmYTEzCkF1dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+CgptdGQ6IHJhd25hbmQ6IGF1MTU1MG5kOiByZXRhaW4gY2hpcCBzdGF0ZSBhY3Jvc3MgcmVt
b3ZhbAoKVGhpcyBjb21taXQgc3dpdGNoZXMgdGhlIGF1MTU1MG5kIGRyaXZlciB0byByZWZlcmVu
Y2UtY291bnRlZCBOQU5ECmNvbnRyb2xsZXIgYW5kIGNoaXAgbGlmZXRpbWUgbWFuYWdlbWVudCwg
ZGlzY29ubmVjdGluZyB0aGUgY2hpcCBiZWZvcmUKdW5tYXBwaW5nIE1NSU8gYW5kIGNoZWNraW5n
IG10ZF9kZXZpY2VfcmVnaXN0ZXIoKSBlcnJvcnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYwo+
IGluZGV4IGYxZTk5MTk3YWI4NDUuLmJkNzhiY2M4NDI4MjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYXUxNTUwbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F1
MTU1MG5kLmMKClsgLi4uIF0KCj4gQEAgLTMzMyw3ICszNTAsNiBAQCBzdGF0aWMgaW50IGF1MTU1
MG5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIG91dDI6Cj4gIAlyZWxl
YXNlX21lbV9yZWdpb24oci0+c3RhcnQsIHJlc291cmNlX3NpemUocikpOwo+ICBvdXQxOgo+IC0J
a2ZyZWUoY3R4KTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KCltTZXZlcml0eTogSGlnaF0KVGhpcyBw
cm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBpc24ndCB0aGUKcmVx
dWVzdF9tZW1fcmVnaW9uKCkgY2hlY2sgaW4gYXUxNTUwbmRfcHJvYmUoKSBpbnZlcnRlZCBbMV0/
Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdTE1NTBuZC5jOmF1MTU1MG5kX3Byb2JlKCkgewogICAg
Li4uCglpZiAocmVxdWVzdF9tZW1fcmVnaW9uKHItPnN0YXJ0LCByZXNvdXJjZV9zaXplKHIpLCAi
YXUxNTUwLW5hbmQiKSkgewoJCWRldl9lcnIoJnBkZXYtPmRldiwgImNhbm5vdCBjbGFpbSBOQU5E
IG1lbW9yeSBhcmVhXG4iKTsKCQlyZXQgPSAtRU5PTUVNOwoJCWdvdG8gb3V0MTsKCX0KICAgIC4u
Lgp9CgpyZXF1ZXN0X21lbV9yZWdpb24oKSByZXR1cm5zIGEgbm9uLU5VTEwgcG9pbnRlciBvbiBz
dWNjZXNzLCBzbyBhCnN1Y2Nlc3NmdWwgcmVzZXJ2YXRpb24ganVtcHMgdG8gb3V0MSwgZmFpbHMg
cHJvYmUgd2l0aCAtRU5PTUVNLCBhbmQgbGVha3MKdGhlIGNsYWltZWQgbWVtb3J5IHJlZ2lvbi4g
Q29udmVyc2VseSwgYSBmYWlsZWQgcmVzZXJ2YXRpb24gcHJvY2VlZHMgdG8KaW9yZW1hcCgpIHVu
b3duZWQgbWVtb3J5LgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtNGU0MDE2
OTctNDk5OC00ZTQwLWE3ZTQtNjBjYzIxOTgzZmI0CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA3LXN1Ym1pdC1yYXduYW5kLXJl
dGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAxODFlZjBjYzRjOEBnbWFpbC5jb20/cGFy
dD00MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
