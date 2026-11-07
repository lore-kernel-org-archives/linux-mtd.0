Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0B606A326
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mpyrn7Kf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DH7Yk5Kv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AhpVSspO/Ol7VTjHkdL+dhlCgDct+qa3lqlYBVwNqSY=; b=mpyrn7KfyTTRLMlguu8XX0Nyel
	DUIQ/f944dCkt7wn63M8sbAEdVRpPJxZynz8nyOLz/AhR2znBpS3htvZIE0WSkuxSNCz5pPH7dXRX
	Me3vaf9wCwRA6shuX8ZMZlA2No2q3cZyGDB21OZZsc3WubclLVG3g6MHc783U++EJpXgWKWFZSmu4
	WNaf7rjrSA0NE+55husL9Bd0rjv+vVufTxZR986E4cdE62s27LcmIyzRwphCTK1u49hiWFIfpeTiD
	4VOPpvpkikzSq7X5vACZG0TSZSD8IqFd054iBIt7RUItWMdi5CrACDht+G7VJYEakBxrEU2Z9wp6s
	FEskVQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnVv-0000000FPuD-2f9l;
	Sat, 07 Nov 2026 20:59:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnVu-0000000FPtq-16Eo;
	Sat, 07 Nov 2026 20:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F13061201;
	Sat,  7 Nov 2026 20:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ED51F008A7;
	Sat,  7 Nov 2026 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085188;
	bh=PThdQtpTeh/RmsXeafa5AkNFktPLGhBm7MYbB3f3O1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DH7Yk5KvqaIsiO4Z+fB6WNNP1XnBSphUmIj8KBP0Q4jTYm6g/VBvbeNrbK7vdWU5D
	 QbBtKx+vDKko1hC6Y9gDFOK7kt3ICwl/NhFPgfnBhvPF8o74K0PDNi8+SHrIJEEt89
	 hKWXPwEqPLVQ6kxX90IHiJPyOHI9OgMcsL7+kDFVx8vRKrTsEjdf5wlJa/6W6up1II
	 491L3DgUzuhD+GhgMXO3eWxkbt5mj0K1DB2igvc4Sh9r1rUIG7qiNrUBusoPSPURXy
	 i6e4hcIBTHi2tTiPQTAB0MRMgvY6Z871gPn3/5kHmZwTBBhNjmOB0cBNSff6qovcxu
	 wGSh9grqk9wLQ==
Message-ID: <sashiko-outbox-203338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 55/58] mtd: rawnand: r852: retain chip state across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-55-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-55-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:59:45 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBy
ODUyOiByODUyX2lycSgpIG1pc2hhbmRsZXMgY2FyZCBJUlFzIHdoZW4KICByZW1vdmluZyBpcyBz
ZXQKSXQgYWxzbyBub3RpY2VkIDEgcmVsYXRlZCBwcmUtZXhpc3RpbmcgaXNzdWUgdGhpcyBwYXRj
aCBkb2VzIG5vdAppbnRyb2R1Y2U6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDogcjg1Mjogd29yayBy
ZS1xdWV1ZSByYWNlIGNvbmRpdGlvbiBpbgogIHI4NTJfc2h1dGRvd24oKSBbMV0KLS0KCmNvbW1p
dCA4NWMwNWNiZTRhZmUyOTdkNmY3ZTJhNTcxZjkzNmRkMmRjOTE1YzYxCkF1dGhvcjogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IHJhd25hbmQ6IHI4NTI6
IHJldGFpbiBjaGlwIHN0YXRlIGFjcm9zcyByZW1vdmFsCgpUaGlzIGNvbW1pdCBhbGxvY2F0ZXMg
YSBzZXBhcmF0ZSBuYW5kX2NoaXAgcGVyIGNhcmQgaW5zZXJ0aW9uLCB0aWVzIGNoaXAgYW5kCmNv
bnRyb2xsZXIgbGlmZXRpbWVzIHRvIE1URCByZWxlYXNlIGNhbGxiYWNrcywgYW5kIHN0b3BzIGNh
cmQtZGV0ZWN0aW9uIHdvcmsKc2NoZWR1bGluZyBpbiByODUyX2lycSgpIGR1cmluZyBQQ0kgcmVt
b3ZhbC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+IGluZGV4IDkyYzQ3ZDM1MWMyNzguLjBmYjMyMGNkN2I3
NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jClsgLi4uIF0KPiBAQCAtNzM0LDcgKzc3Myw4IEBAIHN0
YXRpYyBpcnFyZXR1cm5fdCByODUyX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAJY2FyZF9z
dGF0dXMgPSByODUyX3JlYWRfcmVnKGRldiwgUjg1Ml9DQVJEX0lSUV9TVEEpOwo+ICAJcjg1Ml93
cml0ZV9yZWcoZGV2LCBSODUyX0NBUkRfSVJRX1NUQSwgY2FyZF9zdGF0dXMpOwo+ICAKPiAtCWlm
IChjYXJkX3N0YXR1cyAmIChSODUyX0NBUkRfSVJRX0lOU0VSVHxSODUyX0NBUkRfSVJRX1JFTU9W
RSkpIHsKPiArCWlmICghZGV2LT5yZW1vdmluZyAmJgo+ICsJICAgIChjYXJkX3N0YXR1cyAmIChS
ODUyX0NBUkRfSVJRX0lOU0VSVCB8IFI4NTJfQ0FSRF9JUlFfUkVNT1ZFKSkpIHsKPiAgCj4gIAkJ
cmV0ID0gSVJRX0hBTkRMRUQ7Cj4gIAkJZGV2LT5jYXJkX2RldGVjdGVkID0gISEoY2FyZF9zdGF0
dXMgJiBSODUyX0NBUkRfSVJRX0lOU0VSVCk7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBjaGVj
a2luZyAhZGV2LT5yZW1vdmluZyBvbiB0aGUgb3V0ZXIgY29uZGl0aW9uIGNhdXNlIHI4NTJfaXJx
KCkgdG8KbWlzaGFuZGxlIGNhcmQgaW50ZXJydXB0cyB0aGF0IGZpcmUgZHVyaW5nIHI4NTJfcmVt
b3ZlKCk/CgpIYXJkd2FyZSBpbnRlcnJ1cHRzIHJlbWFpbiBlbmFibGVkIHdoaWxlIHI4NTJfcmVt
b3ZlKCkgY2FuY2VscyB0aGUgd29ya3F1ZXVlCmFuZCBydW5zIHI4NTJfdW5yZWdpc3Rlcl9uYW5k
X2RldmljZSgpLiAgSWYgYSBjYXJkIGluc2VydCBvciByZW1vdmUgaW50ZXJydXB0CmFycml2ZXMg
YWZ0ZXIgZGV2LT5yZW1vdmluZyBpcyBzZXQsIHI4NTJfaXJxKCkgY2xlYXJzIFI4NTJfQ0FSRF9J
UlFfU1RBIGluCmhhcmR3YXJlIGJ1dCBza2lwcyB0aGUgaGFuZGxlciBibG9jaywgcmV0dXJuaW5n
IElSUV9OT05FIG9uIGEgc2hhcmVkIElSUSBsaW5lCmFuZCBmYWlsaW5nIHRvIHNldCBkZXYtPmNh
cmRfdW5zdGFibGUgb3IgY2FsbCByODUyX2Rpc2FibGVfaXJxcygpIHRvIGFib3J0CmluLWZsaWdo
dCBJL08uICBTaG91bGQgZGV2LT5yZW1vdmluZyBvbmx5IGd1YXJkIHF1ZXVlX2RlbGF5ZWRfd29y
aygpPwoKWyAuLi4gXQo+IEBAIC05NzYsNiArMTAwMywxMSBAQCBzdGF0aWMgaW50ICByODUyX3By
b2JlKHN0cnVjdCBwY2lfZGV2ICpwY2lfZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
aWQpCj4gIHN0YXRpYyB2b2lkIHI4NTJfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwY2lfZGV2KQo+
ICB7Cj4gIAlzdHJ1Y3Qgcjg1Ml9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwY2lfZGV2
KTsKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmRl
di0+aXJxbG9jaywgZmxhZ3MpOwo+ICsJZGV2LT5yZW1vdmluZyA9IHRydWU7Cj4gKwlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZkZXYtPmlycWxvY2ssIGZsYWdzKTsKPiAgCj4gIAkvKiBTdG9wIGRl
dGVjdCB3b3JrcXVldWUgLQo+ICAJCXdlIGFyZSBnb2luZyB0byB1bnJlZ2lzdGVyIHRoZSBkZXZp
Y2UgYW55d2F5Ki8KCltTZXZlcml0eTogSGlnaF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1
Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4gcjg1Ml9pcnEoKSByZS1xdWV1ZQpkZXYtPmNhcmRf
ZGV0ZWN0X3dvcmsgZHVyaW5nIHI4NTJfc2h1dGRvd24oKSBhbmQgcjg1Ml9zdXNwZW5kKCkgWzFd
PwoKQm90aCBmdW5jdGlvbnMgY2FsbCBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoKSBiZWZvcmUg
cjg1Ml9kaXNhYmxlX2lycXMoKQp3aXRob3V0IHNldHRpbmcgZGV2LT5yZW1vdmluZzoKCmRyaXZl
cnMvbXRkL25hbmQvcmF3L3I4NTIuYzpyODUyX3NodXRkb3duKCkgewoJc3RydWN0IHI4NTJfZGV2
aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGNpX2Rldik7CgoJY2FuY2VsX2RlbGF5ZWRfd29y
a19zeW5jKCZkZXYtPmNhcmRfZGV0ZWN0X3dvcmspOwoJcjg1Ml9kaXNhYmxlX2lycXMoZGV2KTsK
CXN5bmNocm9uaXplX2lycShkZXYtPmlycSk7CglwY2lfZGlzYWJsZV9kZXZpY2UocGNpX2Rldik7
Cn0KCkFuIGludGVycnVwdCBhcnJpdmluZyBiZXR3ZWVuIGNhbmNlbF9kZWxheWVkX3dvcmtfc3lu
YygpIGFuZApyODUyX2Rpc2FibGVfaXJxcygpIGNhbiByZS1xdWV1ZSBjYXJkX2RldGVjdF93b3Jr
OgoKQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKcjg1Ml9zaHV0ZG93bigp
CiAgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHI4NTJfaXJxKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcXVl
dWVfZGVsYXllZF93b3JrKCkKICByODUyX2Rpc2FibGVfaXJxcygpCiAgc3luY2hyb25pemVfaXJx
KCkKICBwY2lfZGlzYWJsZV9kZXZpY2UoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcjg1Ml9jYXJkX2RldGVjdF93b3JrKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcjg1Ml9yZWFkX3JlZygpICA8LS0gTU1JTyBhZnRlciBkaXNhYmxlCgpXaGVuIHRoZSBk
ZWxheWVkIHdvcmsgcnVucyBhZnRlciBwY2lfZGlzYWJsZV9kZXZpY2UoKSwgaXQgYWNjZXNzZXMg
ZGlzYWJsZWQKUENJIE1NSU8gc3BhY2UuCgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9s
aW51eC1jZTI4Y2EyYi0xYmYxLTRkMjctOGJjZC1hMGVjMTRiOTkyODEKCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDctc3VibWl0
LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYxLXYxLTAtMDE4MWVmMGNjNGM4QGdt
YWlsLmNvbT9wYXJ0PTU1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
