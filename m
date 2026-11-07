Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E4606A332
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2da19A6L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/kxUGPN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hKW4zhxxXWw+AunaFJjAIJZN8oHQifWDOUchC/TLt3k=; b=2da19A6LjS5+lHXX1kNuWtu8wz
	qwu8ECysAOaPF6phGYKzpeyA2b8ZxwjeZ6fIp+Hr0iVyfcCSMXsfVuT+jeWpOJTrmLEvMbupPd8rp
	P42OCWyhGmYPd9FmXHwCFiut9WuQVaJlJb70alDigmz2nce923BbDr8yJa7EHM0vR4771HBUDgb4/
	I2tSTBIN9QKWvfuRiMRV7PwoAvR4uS8xZGsPXMKHS7KGqdbGk4vpvmOX6/L7tQn55z9gLd5PF2DOI
	ZNHZtHepC7WsEC8dpHTnSN9ivPksYC4hY/Szfxx6TmqYYKpN3dMyk62EyT8yhp/LILIEbteoDl9Op
	aSi8mqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmyp-0000000FLjw-1L9u;
	Sat, 07 Nov 2026 20:25:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmyn-0000000FLji-3Nsm;
	Sat, 07 Nov 2026 20:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EAB87434E2;
	Sat,  7 Nov 2026 20:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D5F1F008A4;
	Sat,  7 Nov 2026 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083136;
	bh=D9/dBRPi0s88VvIK111ru1vQLcmn42LnKhUI0WPNA+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/kxUGPNVjCLjTnQDqT+AKT7T/6AILEa8h6G3gx2eiR+DJhkd1geJFNP7FwFwz8YW
	 CNVpG2Zgv4UtOzk71eZ+eWFYR8M48rGBhaDghuunpyV5bBwi3j5Dpzx+O5+YHd/KII
	 IddzrvLIG5VFN0d+537tAPnpUnsnq3Gr1EF/CYVCvbqdXmzwoH1GEss7/tVcYrZLR5
	 s5EEETtVJFPRYcWgeC4TjRPB5Ys0EKOMiWvYJp46O3Rt/SHRIHa2gnG9fS7uJ1Eubx
	 YPS1iwU3ogN/2I/Rl76Hit53CJEcWTnHQgR/gAeiwUguzO49lzeAtLFRsqTlWD+p0X
	 Me72AWvbwZDnA==
Message-ID: <sashiko-outbox-203277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/58] mtd: rawnand: denali: retain chips across
 controller removal
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:25:33 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBkZW5h
bGk6IHNlcGFyYXRlIF9fZnJlZShrZnJlZSkgaW5pdCBpbgogIGRlbmFsaV9kdF9jaGlwX2luaXQo
KQotLQoKY29tbWl0IDZlNzU1ZWU1OWNlNTdiZTNmNWNmODBmZjNkZmVlMGY3Mzc2NGM2MWIKQXV0
aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCm10ZDogcmF3
bmFuZDogZGVuYWxpOiByZXRhaW4gY2hpcHMgYWNyb3NzIGNvbnRyb2xsZXIgcmVtb3ZhbAoKVGhp
cyBjb21taXQgc3dpdGNoZXMgdGhlIERlbmFsaSBOQU5EIGNvbnRyb2xsZXIgYW5kIGNoaXAgYWxs
b2NhdGlvbnMgZnJvbQpkZXZpY2UtbWFuYWdlZCBzdG9yYWdlIHRvIHJlZmVyZW5jZS1jb3VudGVk
IG9iamVjdHMgc28gdGhhdCBjaGlwcyBhbmQgdGhlaXIKY29udHJvbGxlciByZW1haW4gbGl2ZSB1
bnRpbCBhbGwgTVREIHJlZmVyZW5jZXMgYXJlIGRyb3BwZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfZHQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFs
aV9kdC5jCj4gaW5kZXggOGM4MjJlYWU3MmU3OC4uOGQ4MTNjYzA1ZDA0OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfZHQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2RlbmFsaV9kdC5jClsgLi4uIF0KPiBAQCAtODEsNyArODIsNyBAQCBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBkZW5hbGlfbmFuZF9kdF9pZHMpOwo+ICBzdGF0aWMgaW50IGRlbmFsaV9k
dF9jaGlwX2luaXQoc3RydWN0IGRlbmFsaV9jb250cm9sbGVyICpkZW5hbGksCj4gIAkJCSAgICAg
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaXBfbnApCj4gIHsKPiAtCXN0cnVjdCBkZW5hbGlfY2hp
cCAqZGNoaXA7Cj4gKwlzdHJ1Y3QgZGVuYWxpX2NoaXAgKmRjaGlwIF9fZnJlZShrZnJlZSkgPSBO
VUxMOwo+ICAJdTMyIGJhbms7Cj4gIAlpbnQgbnNlbHMsIGksIHJldDsKPiAgCj4gQEAgLTg5LDgg
KzkwLDcgQEAgc3RhdGljIGludCBkZW5hbGlfZHRfY2hpcF9pbml0KHN0cnVjdCBkZW5hbGlfY29u
dHJvbGxlciAqZGVuYWxpLAo+ICAJaWYgKG5zZWxzIDwgMCkKPiAgCQlyZXR1cm4gbnNlbHM7Cj4g
IAo+IC0JZGNoaXAgPSBkZXZtX2t6YWxsb2MoZGVuYWxpLT5kZXYsIHN0cnVjdF9zaXplKGRjaGlw
LCBzZWxzLCBuc2VscyksCj4gLQkJCSAgICAgR0ZQX0tFUk5FTCk7Cj4gKwlkY2hpcCA9IGt6YWxs
b2Moc3RydWN0X3NpemUoZGNoaXAsIHNlbHMsIG5zZWxzKSwgR0ZQX0tFUk5FTCk7CgpbU2V2ZXJp
dHk6IExvd10KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IGNsZWFudXAuaCBjb252ZW50aW9uIGlzIHRv
IGRlZmluZSBhbmQgaW5pdGlhbGl6ZQpfX2ZyZWUoKSB2YXJpYWJsZXMgaW4gYSBzaW5nbGUgc3Rh
dGVtZW50IGF0IHRoZSBhbGxvY2F0aW9uIHNpdGUgcmF0aGVyIHRoYW4KaW5pdGlhbGl6aW5nIGRj
aGlwIHRvIE5VTEwgYXQgdGhlIHRvcCBvZiBkZW5hbGlfZHRfY2hpcF9pbml0KCkuCgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA3
LXN1Ym1pdC1yYXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAxODFlZjBj
YzRjOEBnbWFpbC5jb20/cGFydD0xMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
