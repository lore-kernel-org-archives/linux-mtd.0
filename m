Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB3606A32E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQzO0Qcs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnwRqj5r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wqSF1JbjpuGg8Knr21HXYPCJVAtvcAbyerUOWZ/a/DQ=; b=LQzO0QcsJYqcJsy5y57Dng3Awn
	qIkUsdPHIeRFBxxA08+s/Rj6siRnmqz2bDueBd8v9zsL3P9kUiYcTLAUyx+axGvUpSESSiRMVpXOH
	cf9fFo8cUIFMQRp8Fe5cB+2pjB8LXBx2wyFzuAZPPQ9LMMk3+dR8sJYRI8fSKaJM7yS2tGvgksPSF
	osN+uHc2E/WW4j4GmUlofu9nLgV5Mq/1FgevRIr4KnxGj68rKZT++pO089GF54Mb5v6hSMJNVn7HU
	B82pHydRoLDc4y0RKMZnKD1VFGo+UMcc+EURPX9FgoQUmJiLCh0wKSx5wKq5kAYYH2sITplOD65EW
	ZP72/mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmv7-0000000FLUm-1p4h;
	Sat, 07 Nov 2026 20:21:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmv5-0000000FLUX-2gIG;
	Sat, 07 Nov 2026 20:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5779B611C0;
	Sat,  7 Nov 2026 20:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E2C1F0089F;
	Sat,  7 Nov 2026 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794082906;
	bh=y3e6ZmJgL3uEs1Y9Rb9f2LR0HYHtdMMlVxFZ0fnS0lk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KnwRqj5rWofc7pbKfyK5Wnh57xzZLxXWfhfaZVzqzsEi0i0ZDYOC2V4cgyx+yEUwl
	 LVN8cI9BR/IJQ58eioEirmvIn0nGNQ4OvzWBgb5X2UMpi12H7pk/CpIDwfP+C6Cfw2
	 tbZ1aqwu9Hf1mUiGR2wFO94plCefFg+ad7skgtL1zEJHoU/WmcH/LhDWn14J8hcMss
	 gUBiWgOkUglDJtlNGJpmSys2gt80lCk2Wt3en+0J9TMnMes03hBb4HVNxRIPCIMxPG
	 22z+nxW/ASf0sjj/CF67qRkoSKpkC0qzFPH7E8jS2fVu7xDrlUMpEcwVY09SnVi1zF
	 4cuXef9yD+GPw==
Message-ID: <sashiko-outbox-203269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/58] mtd: clear OTP provider pointers after
 unregistering them
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:21:42 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG10ZDogbWVt
b3J5IGxlYWsgYW5kIHVzZS1hZnRlci1mcmVlIG9uCiAgbXRkX2RldmljZV9wYXJzZV9yZWdpc3Rl
cigpIGZhaWx1cmUgWzFdCi0tCgpjb21taXQgZDAwNDEzOWQ4ZDVlZjRiZWEzNTFlYWEwNzAzMzMx
Y2ZmNDU2YTc3ZApBdXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgoKbXRkOiBjbGVhciBPVFAgcHJvdmlkZXIgcG9pbnRlcnMgYWZ0ZXIgdW5yZWdpc3Rlcmlu
ZyB0aGVtCgpUaGlzIGNvbW1pdCBjZW50cmFsaXplcyBPVFAgbnZtZW0gcHJvdmlkZXIgcmVtb3Zh
bCBpbnRvCm10ZF9vdHBfbnZtZW1fcmVtb3ZlKCkgYW5kIGNsZWFycyB0aGUgcHJvdmlkZXIgcG9p
bnRlcnMgYWZ0ZXIKdW5yZWdpc3RlcmluZyB0aGVtIHRvIHByZXZlbnQgZHVwbGljYXRlIHVucmVn
aXN0cmF0aW9ucyBvbiBlcnJvciBhbmQKZGV2aWNlIHRlYXJkb3duIHBhdGhzLgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5k
ZXggOGVmYTJkODg1NTZlOS4uNTU4YTYwNWJhNzQ5NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKClsgLi4uIF0KCj4gQEAg
LTExODAsMTAgKzExODgsOCBAQCBpbnQgbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcihzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgY29uc3QgY2hhciAqIGNvbnN0ICp0eXBlcywKPiAgCX0KPiAgCj4gIG91
dDoKPiAtCWlmIChyZXQpIHsKPiAtCQludm1lbV91bnJlZ2lzdGVyKG10ZC0+b3RwX3VzZXJfbnZt
ZW0pOwo+IC0JCW52bWVtX3VucmVnaXN0ZXIobXRkLT5vdHBfZmFjdG9yeV9udm1lbSk7Cj4gLQl9
Cj4gKwlpZiAocmV0KQo+ICsJCW10ZF9vdHBfbnZtZW1fcmVtb3ZlKG10ZCk7Cj4gIAo+ICAJaWYg
KHJldCAmJiBkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmbXRkLT5kZXYpKSB7Cj4gIAkJZXJyID0gZGVs
X210ZF9kZXZpY2UobXRkKTsKCltTZXZlcml0eTogQ3JpdGljYWxdClRoaXMgcHJvYmxlbSB3YXNu
J3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgY2FuIGEgZmFpbHVyZSBpbgptdGRfdmly
dF9jb25jYXRfY3JlYXRlX2pvaW4oKSBsZWFrIHBhcnRpdGlvbnMgYW5kIGxlYXZlIGRhbmdsaW5n
IHBvaW50ZXJzCmluIGNvbmNhdC0+c3ViZGV2W10gWzFdPwoKSW4gbXRkX2RldmljZV9wYXJzZV9y
ZWdpc3RlcigpLCBwYXJzZV9tdGRfcGFydGl0aW9ucygpIG9yCmFkZF9tdGRfcGFydGl0aW9ucygp
IHJ1bnMgYmVmb3JlIG10ZF92aXJ0X2NvbmNhdF9jcmVhdGVfam9pbigpLiBXaGVuCm10ZF92aXJ0
X2NvbmNhdF9hZGQoKSBjbGFpbXMgYSBjaGlsZCBwYXJ0aXRpb24sIGl0IHN0b3JlcyB0aGUgcG9p
bnRlciBpbgpjb25jYXQtPnN1YmRldltdIGFuZCBhZGRfbXRkX3BhcnRpdGlvbnMoKSBza2lwcyBh
ZGRpbmcgdGhlIGNoaWxkIHRvCnBhcmVudC0+cGFydGl0aW9ucy4KCklmIG10ZF92aXJ0X2NvbmNh
dF9jcmVhdGVfam9pbigpIHRoZW4gZmFpbHMgYW5kIGp1bXBzIHRvIG91dCwgdGhpcyB1bndpbmQK
cGF0aCByZXR1cm5zIHdpdGhvdXQgY2FsbGluZyBtdGRfdmlydF9jb25jYXRfZGVzdHJveSgpIG9y
CmRlbF9tdGRfcGFydGl0aW9ucyhtdGQpLiBCZWNhdXNlIGNhbGxlcnMgZnJlZSB0aGUgbWFzdGVy
IG10ZF9pbmZvIHdoZW4KbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpIGZhaWxzLCByZWdpc3Rl
cmVkIHBhcnRpdGlvbnMgYXJlIGxlYWtlZCBhbmQKY29uY2F0LT5zdWJkZXZbXSByZXRhaW5zIHBh
cnRpdGlvbnMgd2hvc2UgcGFyZW50IHBvaW50ZXJzIHJlZmVyZW5jZSB0aGUKZnJlZWQgbWFzdGVy
IG10ZF9pbmZvLCBjYXVzaW5nIGEgdXNlLWFmdGVyLWZyZWUgdmlhIG10ZF9nZXRfbWFzdGVyKCkg
d2hlbgphIGxhdGVyIGRldmljZSByZWdpc3RyYXRpb24gY2FsbHMgbXRkX3ZpcnRfY29uY2F0X2Ny
ZWF0ZV9qb2luKCkuIChUaGUKZXJyX2RlbF9wYXJ0aXRpb25zIHBhdGggaW4gYWRkX210ZF9wYXJ0
aXRpb25zKCkgc2ltaWxhcmx5IGNhbGxzIG9ubHkKZGVsX210ZF9wYXJ0aXRpb25zKCksIGxlYXZp
bmcgYW55IHBhcnRpdGlvbnMgYWxyZWFkeSBjbGFpbWVkIGJ5Cm10ZF92aXJ0X2NvbmNhdF9hZGQo
KSBpbiBjb25jYXQtPnN1YmRldltdLikKClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xp
bnV4LWViMTg0ZDkxLTBjMTctNDAxNS05OWE0LTEwYjU0MDYwYTc0NwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNy1zdWJtaXQt
cmF3bmFuZC1yZXRhaW5lZC1oYW5kbGUtbGlmZXRpbWUtdjEtdjEtMC0wMTgxZWYwY2M0YzhAZ21h
aWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
