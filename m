Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323C606A32C
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FzVbt8YC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahtQaV/8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=op9s8MGLz1rGkI+R6yUqs5AW+I3TE35gXfSmUlQXmms=; b=FzVbt8YCqCnfde34wmpfZprjvo
	BTBoHjs46+jqzL9dusfqIzoBfN/P2Dk2i8vb42tCXRCtxfvGpGilvvzFHbqPTwxi6pSF8tFsUGFEl
	UFsQPYY6m0gN0BoJtH2G742Bt7EShlHTunJ73WShp7/QGQTLmHwF20qhkEGnGPYFDoIcKNlV3ND7H
	cBclUSCqcqjpM15ZH/1fIodXbU5nUNZ7nkK5vD0UpwiM1/+UxQSEfs+2IjPb/YNe35TCkq7qLdD2r
	iUFiwB9USiXvyR2QWNq2r+3criKpfeJa2OALpK030cgE4zR1Ij1xVN0tgyNZ/2UDYogcOlnVYKxE1
	yarXU6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnMp-0000000FP3X-1TOI;
	Sat, 07 Nov 2026 20:50:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnMn-0000000FP3I-3YT2;
	Sat, 07 Nov 2026 20:50:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 368D54405D;
	Sat,  7 Nov 2026 20:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358391F0089F;
	Sat,  7 Nov 2026 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084625;
	bh=7UAUebb/g+Wp7CssiwXsKs5HhFn0ypoAy54XK/SwtQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahtQaV/8F25RB4hf2Wvh8+n+4Mpn26NDPP7tsdhsAvP6XKMPxdCqySPAav9T9CFSd
	 i/g8lGs5KFPN0qxPNst1OjFh1cCH3b04JTnUciBJlkf+W6pjonMQYSM2kkt/M4tluF
	 rTEONKyS+fKzpzc9k7xabzQETIkPpoVMXhjyL77zCVI7/IRifAHhVpXaL2aN1kQHAY
	 FoSs2cxlBq46ykefvIpaqO0+bPw+aSpln3BgaVcS0CXwty6NVegxRQSnNAWaEtRjut
	 Wqfcks4OPawm1R46+cFQy64n5OvZmc8BAXM6AU6Pc1jzvKrs0cgIsd2hIjTItdJBkq
	 Z5hOTZV5HSIEw==
Message-ID: <sashiko-outbox-203330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/58] mtd: add opt-in lifetime ownership for backing
 objects
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-3-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-3-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:50:21 +0000
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
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIG10ZDogcmVmY291bnQg
aW1iYWxhbmNlIGluIF9fcHV0X210ZF9kZXZpY2UoKSB3aGVuCiAgbWFzdGVyLT5kZXYudHlwZSBj
aGFuZ2VzCi0gW01lZGl1bV0gbXRkOiBtdGRfYWRkX3BhcnRpdGlvbigpIGFsbG93cyBhZGRpbmcg
cGFydGl0aW9ucyB0byBhbgogIHVucmVnaXN0ZXJlZCBtYXN0ZXIKLSBbTWVkaXVtXSBtdGQ6IGFk
ZF9tdGRfZGV2aWNlKCkgbGVhdmVzIG10ZC0+ZGV2LnR5cGUgc2V0IHdoZW4KICBkZXZfc2V0X25h
bWUoKSBmYWlscwpJdCBhbHNvIG5vdGljZWQgMSByZWxhdGVkIHByZS1leGlzdGluZyBpc3N1ZSB0
aGlzIHBhdGNoIGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG10ZDogY29yZTogdXNl
LWFmdGVyLWZyZWUgaW4gYWRkX210ZF9kZXZpY2UoKSBbMV0KLS0KCmNvbW1pdCBkYTEyMzk0NTEx
ZDQzODMzNWZiMjVjZTYwMTU2YzMzMDcxNjNlZDhmCkF1dGhvcjogSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IGFkZCBvcHQtaW4gbGlmZXRpbWUgb3duZXJz
aGlwIGZvciBiYWNraW5nIG9iamVjdHMKClRoaXMgY29tbWl0IGludHJvZHVjZXMgb3B0LWluIHJl
ZmVyZW5jZS1jb3VudGVkIGxpZmV0aW1lIG1hbmFnZW1lbnQgZm9yCm1hc3RlciBNVEQgYmFja2lu
ZyBvYmplY3RzIHZpYSBtdGRfc2V0X3JlbGVhc2UoKSBhbmQgbXRkX3B1dF9tYXN0ZXIoKSwKcmV0
YWluaW5nIHRoZSBtYXN0ZXIgYW5kIHBhcnRpdGlvbiBoaWVyYXJjaHkgd2hpbGUgTVREIGhhbmRs
ZXMsIGRldmljZQpub2Rlcywgb3IgT1RQIE5WTUVNIHByb3ZpZGVycyByZW1haW4gYWN0aXZlLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29y
ZS5jCj4gaW5kZXggNTU4YTYwNWJhNzQ5NS4uNDJjMDZhMDJjZDk5ZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9tdGRjb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKWyAuLi4g
XQo+IEBAIC03NDgsMTYgKzg0MCwyOCBAQCBpbnQgYWRkX210ZF9kZXZpY2Uoc3RydWN0IG10ZF9p
bmZvICptdGQpClsgLi4uIF0KPiAgCW10ZC0+aW5kZXggPSBpOwo+ICAJa3JlZl9pbml0KCZtdGQt
PnJlZmNudCk7Cj4gKwlpZiAobWFzdGVyLT5tYXN0ZXIucmVsZWFzZSkgewo+ICsJCW10ZF9nZXRf
bGlmZXRpbWUobWFzdGVyKTsKPiArCQltdGQtPnJlZl9tYXN0ZXIgPSBtYXN0ZXI7Cj4gKwkJaWYg
KG10ZC0+cGFyZW50ICYmIG10ZC0+cGFyZW50ICE9IG1hc3RlcikKPiArCQkJZ2V0X2RldmljZSgm
bXRkLT5wYXJlbnQtPmRldik7Cj4gKwl9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQ2FuIGEgcGFydGl0
aW9uIHN0aWxsIGJlIGFkZGVkIHRocm91Z2ggbXRkX2FkZF9wYXJ0aXRpb24oKSBhZnRlciB0aGUK
cGFyZW50IG9yIG1hc3RlciBoYXMgYmVlbiB1bnJlZ2lzdGVyZWQ/CgpJZiBhIHByb2Nlc3Mga2Vl
cHMgYW4gb3BlbiBmaWxlIGRlc2NyaXB0b3IgdG8gL2Rldi9tdGQwIGFjcm9zcyBkcml2ZXIKdW5i
aW5kIChtdGRfZGV2aWNlX3VucmVnaXN0ZXIoKSBhbmQgbXRkX3B1dF9tYXN0ZXIoKSkgYW5kIGlz
c3VlcwpCTEtQR19BRERfUEFSVElUSU9OLCBtdGRjaGFyX2Jsa3BnX2lvY3RsKCkgLT4gbXRkX2Fk
ZF9wYXJ0aXRpb24oKSBjYWxscwphZGRfbXRkX2RldmljZShjaGlsZCkgd2l0aG91dCBjaGVja2lu
ZyB3aGV0aGVyIHBhcmVudC0+cmVnaXN0ZXJlZCBpcyBzdGlsbAp0cnVlLiAgQmVjYXVzZSBkZWxf
bXRkX3BhcnRpdGlvbnMoKSBoYXMgYWxyZWFkeSBydW4sIHRoZSBuZXcgcGFydGl0aW9uIGlzCm5l
dmVyIGNsZWFuZWQgdXAsIGxlYWtpbmcgdGhlIHBhcnRpdGlvbiwgaXRzIE1URCBJRCwgVEhJU19N
T0RVTEUsIGFuZAptYXN0ZXIubGlmZV9yZWZjbnQuICBGdXJ0aGVybW9yZSwgb25jZSB0aGUgb3Bl
biBoYW5kbGUgb24gdGhlIG1hbmFnZWQKbWFzdGVyIGlzIGNsb3NlZCwgbXRkX2RldmljZV9yZWxl
YXNlKCkgbGVhdmVzIG1hc3Rlci0+ZGV2LnR5cGUgc2V0LCBzbwpvcGVuaW5nIGFuZCBjbG9zaW5n
IHRoZSBsZWFrZWQgY2hpbGQgcGFydGl0aW9uIHdpbGwgZG8ga3JlZl9nZXQoKSBvbiBhCnplcm8g
bWFzdGVyLT5yZWZjbnQgYW5kIGNhbGwgbXRkX2RldmljZV9yZWxlYXNlKCkgYSBzZWNvbmQgdGlt
ZS4KCj4gQEAgLTgzOSwyOSArOTQ2LDM4IEBAIGludCBhZGRfbXRkX2RldmljZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCkKPiAgCQl9Cj4gIAl9Cj4gIAo+IC0JLyogV2UgX2tub3dfIHdlIGFyZW4ndCBi
ZWluZyByZW1vdmVkLCBiZWNhdXNlCj4gLQkgICBvdXIgY2FsbGVyIGlzIHN0aWxsIGhvbGRpbmcg
dXMgaGVyZS4gU28gbm9uZQo+IC0JICAgb2YgdGhpcyB0cnlfIG5vbnNlbnNlLCBhbmQgbm8gYml0
Y2hpbmcgYWJvdXQgaXQKPiAtCSAgIGVpdGhlci4gOikgKi8KPiAtCV9fbW9kdWxlX2dldChUSElT
X01PRFVMRSk7Cj4gIAlyZXR1cm4gMDsKPiAgCj4gIGZhaWxfbnZtZW1fYWRkOgo+ICAJZGV2aWNl
X2RlbCgmbXRkLT5kZXYpOwo+ICBmYWlsX2FkZGVkOgo+ICAJLyoKPiAtCSAqIENsZWFyIHR5cGUg
YW5kIHNldCBub3AgcmVsZWFzZSB0byBwcmV2ZW50IG10ZF9yZWxlYXNlKCkgLT4KPiArCSAqIENs
ZWFyIHR5cGUgYW5kIG92ZXJyaWRlIHJlbGVhc2UgdG8gcHJldmVudCBtdGRfcmVsZWFzZSgpIC0+
Cj4gIAkgKiByZWxlYXNlX210ZF9wYXJ0aXRpb24oKSAtPiBmcmVlX3BhcnRpdGlvbigpIGZyb20g
ZnJlZWluZyBtdGQuCj4gIAkgKiBUaGUgY2FsbGVyIGhhbmRsZXMgY2xlYW51cCBvbiBmYWlsdXJl
Lgo+ICAJICovCj4gIAltdGQtPmRldi50eXBlID0gTlVMTDsKPiAtCW10ZC0+ZGV2LnJlbGVhc2Ug
PSBtdGRfZGV2X3JlbGVhc2Vfbm9wOwo+ICsJbXRkLT5kZXYucmVsZWFzZSA9IG10ZF9kZXZfcmVs
ZWFzZV9kb25lOwo+ICsJZGV2X3NldF9kcnZkYXRhKCZtdGQtPmRldiwgJnJlbGVhc2VkKTsKPiAr
CXdhaXRfZm9yX3JlbGVhc2UgPSB0cnVlOwo+ICAJcHV0X2RldmljZSgmbXRkLT5kZXYpOwo+ICAJ
b2Zfbm9kZV9wdXQobXRkX2dldF9vZl9ub2RlKG10ZCkpOwo+ICBmYWlsX2Rldm5hbWU6Cj4gIAlp
ZHJfcmVtb3ZlKCZtdGRfaWRyLCBpKTsKPiArCWlkYV9mcmVlKCZtdGRfaWRzLCBpKTsKPiArCWlm
IChtdGQtPnJlZl9tYXN0ZXIpIHsKPiArCQltdGQtPnJlZl9tYXN0ZXIgPSBOVUxMOwo+ICsJCWlm
IChtdGQtPnBhcmVudCAmJiBtdGQtPnBhcmVudCAhPSBtYXN0ZXIpCj4gKwkJCXB1dF9kZXZpY2Uo
Jm10ZC0+cGFyZW50LT5kZXYpOwo+ICsJCW10ZF9wdXRfbGlmZXRpbWUobWFzdGVyKTsKPiArCX0K
CltTZXZlcml0eTogQ3JpdGljYWxdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0
aGlzIHBhdGNoLCBidXQgY2FuIGFkZF9tdGRfZGV2aWNlKCkKdHJpZ2dlciBhIHVzZS1hZnRlci1m
cmVlIG9uIHRoZSBkZXZpY2Vfbm9kZSBbMV0gd2hlbgptdGRfY2hlY2tfb2Zfbm9kZSgpIG1hdGNo
ZXMgYSBwYXJ0aXRpb24gbm9kZT8KCmRyaXZlcnMvbXRkL210ZGNvcmUuYzptdGRfY2hlY2tfb2Zf
bm9kZSgpIHsKICAgIC4uLgoJCWlmIChwbGVuID09IG10ZF9uYW1lX2xlbiAmJgoJCSAgICAhc3Ry
bmNtcChtdGQtPm5hbWUsIHBuYW1lICsgb2Zmc2V0LCBwbGVuKSkgewoJCQltdGRfc2V0X29mX25v
ZGUobXRkLCBtdGRfZG4pOwoJCQlvZl9ub2RlX3B1dChtdGRfZG4pOwoJCQlicmVhazsKCQl9CiAg
ICAuLi4KfQoKbXRkX2NoZWNrX29mX25vZGUoKSBzdG9yZXMgbXRkX2RuIGluIG10ZCBhbmQgaW1t
ZWRpYXRlbHkgZHJvcHMgaXRzCnJlZmVyZW5jZSB2aWEgb2Zfbm9kZV9wdXQobXRkX2RuKSBiZWZv
cmUgYWRkX210ZF9kZXZpY2UoKSBjYWxscwpvZl9ub2RlX2dldChtdGRfZ2V0X29mX25vZGUobXRk
KSkuICBJbiBhIGR5bmFtaWMgRFQgZW52aXJvbm1lbnQsIGlmIHRoZQpub2RlIGlzIHJlbW92ZWQg
aW4gdGhhdCB3aW5kb3csIG9mX25vZGVfcHV0KCkgZnJlZXMgbXRkX2RuIGFuZApvZl9ub2RlX2dl
dCgpIGRlcmVmZXJlbmNlcyBmcmVlZCBtZW1vcnkuCgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBq
dW1waW5nIHRvIGZhaWxfZGV2bmFtZSB3aGVuIGRldl9zZXRfbmFtZSgpIGZhaWxzIGxlYXZlIG10
ZC0+ZGV2LnR5cGUKc2V0IHRvICZtdGRfZGV2dHlwZT8KCm10ZC0+ZGV2LnR5cGUgaXMgYXNzaWdu
ZWQgcmlnaHQgYmVmb3JlIGRldl9zZXRfbmFtZSgpLCBhbmQgY2xlYXJpbmcgaXQgb25seQpoYXBw
ZW5zIHVuZGVyIGZhaWxfYWRkZWQuICBMZWF2aW5nIG10ZC0+ZGV2LnR5cGUgbm9uLU5VTEwgY2F1
c2VzIGFueSByZXRyeQpvZiBhZGRfbXRkX2RldmljZSgpIHRvIGZhaWwgYXQgV0FSTl9PTkNFKG10
ZC0+ZGV2LnR5cGUsIC4uLiksIGFuZCBjYXVzZXMKX19wdXRfbXRkX2RldmljZSgpIG9uIGFuIG9w
ZW4gcGFydGl0aW9uIHRvIGNhbGwga3JlZl9wdXQoJm1hc3Rlci0+cmVmY250LAptdGRfZGV2aWNl
X3JlbGVhc2UpIG9uIGEgbWFzdGVyIHdob3NlIHN0cnVjdCBkZXZpY2Ugd2FzIG5ldmVyIHJlZ2lz
dGVyZWQuCgpbIC4uLiBdCgo+IEBAIC0xMzQ4LDEzICsxNDg0LDE0IEBAIGludCBfX2dldF9tdGRf
ZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJCXJldHVybiAtRU5PREVWOwo+ICAJfQo+
ICAKPiArCW10ZF9nZXRfbGlmZXRpbWUobWFzdGVyKTsKPiAgCXdoaWxlIChtdGQpIHsKPiAgCQlp
ZiAobXRkICE9IG1hc3RlcikKPiAgCQkJa3JlZl9nZXQoJm10ZC0+cmVmY250KTsKPiAgCQltdGQg
PSBtdGQtPnBhcmVudDsKPiAgCX0KPiAgCj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BB
UlRJVElPTkVEX01BU1RFUikpCj4gKwlpZiAobWFzdGVyLT5kZXYudHlwZSkKPiAgCQlrcmVmX2dl
dCgmbWFzdGVyLT5yZWZjbnQpOwo+ICAKPiAgCXJldHVybiAwOwo+IEBAIC0xNDQxLDYgKzE1Nzgs
NyBAQCB2b2lkIF9fcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlzdHJ1
Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7Cj4gIAkvKiBtYXN0ZXIg
Y2FuIGJlIGZyZWVkIGluIF9wdXRfZGV2aWNlICovCj4gIAlzdHJ1Y3QgbW9kdWxlICpvd25lciA9
IG1hc3Rlci0+b3duZXI7Cj4gKwlib29sIG1hbmFnZWQgPSBtYXN0ZXItPm1hc3Rlci5yZWxlYXNl
Owo+ICAKPiAgCXdoaWxlIChtdGQpIHsKPiAgCQkvKiBrcmVmX3B1dCgpIGNhbiByZWxlc2UgbXRk
LCBzbyBrZWVwIGEgcmVmZXJlbmNlIG10ZC0+cGFyZW50ICovCj4gQEAgLTE0NTEsMTIgKzE1ODks
MTQgQEAgdm9pZCBfX3B1dF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJCW10
ZCA9IHBhcmVudDsKPiAgCX0KPiAgCj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJ
VElPTkVEX01BU1RFUikpCj4gKwlpZiAobWFzdGVyLT5kZXYudHlwZSkKPiAgCQlrcmVmX3B1dCgm
bWFzdGVyLT5yZWZjbnQsIG10ZF9kZXZpY2VfcmVsZWFzZSk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0K
Q2FuIG1hc3Rlci0+ZGV2LnR5cGUgY2hhbmdlIGZyb20gTlVMTCB0byBub24tTlVMTCBiZXR3ZWVu
Cl9fZ2V0X210ZF9kZXZpY2UoKSBhbmQgX19wdXRfbXRkX2RldmljZSgpLCBjYXVzaW5nIGFuIHVu
bWF0Y2hlZAprcmVmX3B1dCgmbWFzdGVyLT5yZWZjbnQsIG10ZF9kZXZpY2VfcmVsZWFzZSk/CgpX
aGVuIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPW4sIG1hc3Rlci0+ZGV2LnR5cGUgaXMg
TlVMTCB3aGlsZQptdGRfZGV2aWNlX3BhcnNlX3JlZ2lzdGVyKCkgcnVucyBwYXJzZV9tdGRfcGFy
dGl0aW9ucygpLiAgSWYgYSBmaXJzdApwYXJ0aXRpb24gaXMgcmVnaXN0ZXJlZCBhbmQgb3BlbmVk
IGJ5IGEgbm90aWZpZXIgb3IgdXNlcnNwYWNlIChzZWVpbmcKbWFzdGVyLT5kZXYudHlwZSA9PSBO
VUxMIGluIF9fZ2V0X210ZF9kZXZpY2UoKSksIGFuZCBhIGxhdGVyIHBhcnRpdGlvbgpmYWlscyB0
byByZWdpc3RlciBpbiBhZGRfbXRkX3BhcnRpdGlvbnMoKSwgZGVsX210ZF9wYXJ0aXRpb25zKCkg
dW5yZWdpc3RlcnMKdGhlIGZpcnN0IHBhcnRpdGlvbiB3aGlsZSBpdCByZW1haW5zIG9wZW46Cgpk
cml2ZXJzL210ZC9tdGRjb3JlLmM6bXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpIHsKICAgIC4u
LgoJcmV0ID0gcGFyc2VfbXRkX3BhcnRpdGlvbnMobXRkLCB0eXBlcywgcGFyc2VyX2RhdGEpOwoJ
aWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQoJCWdvdG8gb3V0OwoKCWlmIChyZXQgPiAwKQoJCXJl
dCA9IDA7CgllbHNlIGlmIChucl9wYXJ0cykKCQlyZXQgPSBhZGRfbXRkX3BhcnRpdGlvbnMobXRk
LCBwYXJ0cywgbnJfcGFydHMpOwoJZWxzZSBpZiAoIWRldmljZV9pc19yZWdpc3RlcmVkKCZtdGQt
PmRldikpCgkJcmV0ID0gYWRkX210ZF9kZXZpY2UobXRkKTsKICAgIC4uLgp9CgpXaGVuIG5yX3Bh
cnRzID09IDAgYW5kIHBhcnNlX210ZF9wYXJ0aXRpb25zKCkgcmV0dXJucyBhIG5vbi1kZWZlciBl
cnJvciwKbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpIGZhbGxzIGJhY2sgdG8gYWRkX210ZF9k
ZXZpY2UobXRkKSwgd2hpY2ggc2V0cwptYXN0ZXItPmRldi50eXBlID0gJm10ZF9kZXZ0eXBlIGFu
ZCBpbml0aWFsaXplcyBtYXN0ZXItPnJlZmNudCB0byAxLgpDbG9zaW5nIHRoZSBvcGVuIHBhcnRp
dGlvbiBoYW5kbGUgdGhlbiBzZWVzIG1hc3Rlci0+ZGV2LnR5cGUgIT0gTlVMTCBpbgpfX3B1dF9t
dGRfZGV2aWNlKCkgYW5kIGRyb3BzIG1hc3Rlci0+cmVmY250IHRvIDAgd2hpbGUgdGhlIG1hc3Rl
ciBpcyBzdGlsbApyZWdpc3RlcmVkLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGlu
dXgtMTFmZGIzODMtMTMyZi00NzNiLTkyODQtMTAxYjQ3NTNmY2Q2CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTA3LXN1Ym1pdC1y
YXduYW5kLXJldGFpbmVkLWhhbmRsZS1saWZldGltZS12MS12MS0wLTAxODFlZjBjYzRjOEBnbWFp
bC5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
