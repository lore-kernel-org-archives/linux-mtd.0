Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2A606A32E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QF1v7Hb9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRcMOH/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eUoB5vYnvLfA0z60OVXgv+4FqYULXI9NPr7hyBizaGU=; b=QF1v7Hb9hyEQIYjtgRXoZUK54Y
	fWYs+lUn06QJLpRbxo6VuvRS9fQcMMM8kqf6FWmXq/IlL1DY12R+KbNmLfrN8S8/f//1ztRbXHqGb
	figf5zh0Z2b8J7NBRMtn1gPKblnZ5DMT9oFgnHNx6VvysHDWsz17QxURtsqbzaaRV7ob6hnfWfW1y
	CajcHiTXymCW4nVF2mOyKv3atcOU4P3W2kgkqhRvYTuGYiRNAgdtcAZD2nJ6Zk6WruT5TyrsNUeLg
	BlkUI5pE5EPpSsz5rXD7NvX/ehZYjdZaUqmGauBcsCP3zXnrTfLcfdStMxllCYIbBBm8cjgogkyf2
	gquQSFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn5E-0000000FMlF-3aTL;
	Sat, 07 Nov 2026 20:32:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn5D-0000000FMkl-11Oo;
	Sat, 07 Nov 2026 20:32:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E20F543FDD;
	Sat,  7 Nov 2026 20:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F341F0089F;
	Sat,  7 Nov 2026 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083534;
	bh=ZLqHvanQhVbtqziyQ4DuDfUd8pXVp5/u5iaRuc3S1QM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRcMOH/HcA8S4LSqPnxPdStAt+Df/BqkpjzLIDhYQAiI/1GfOzIlac9ORMaQyLbNA
	 VuoF+BeTKEOjkh7jBqby1Es+6xDTMFXnL2VER7ImjLLurwLu+2A662fl4dhYd8kTkP
	 CEi0Q4g+Y6sLPpHvqZ97356XdG2mZN7IZtfOhiYTVmoTGxW5rL98DzVrIJTUTlIMGV
	 Tcjrz39WFGD27FLWEeEpSMnBqd59kuEwbUMcf7EWV7ncmClaK++ErTkWKici3NBqr0
	 EyxJNFYMqGIPYVaKpgmHhJfivVyQ/8csTug+v0S4xpDMrGfNhYV0VuNu4II6YXHfJU
	 SJlOBKu3vXefA==
Message-ID: <sashiko-outbox-203299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/58] mtd: rawnand: tegra: retain open-handle state on
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:32:11 +0000
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
OiB0ZWdyYTogdW5jbG9ja2VkIHJlZ2lzdGVyIGFjY2VzcyBpbgogIHRlZ3JhX25hbmRfaXJxKCkg
WzFdCi0tCgpjb21taXQgNjE2NGVlZGUzMjRlZDgwZjRiYjJjMWEwZWVhMGY4NjM1YWYyOGU1NwpB
dXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRkOiBy
YXduYW5kOiB0ZWdyYTogcmV0YWluIG9wZW4taGFuZGxlIHN0YXRlIG9uIHJlbW92YWwKClRoaXMg
Y29tbWl0IHN3aXRjaGVzIHRoZSBUZWdyYSBOQU5EIGNoaXAgYW5kIGNvbnRyb2xsZXIgYWxsb2Nh
dGlvbnMgdG8KcmVmZXJlbmNlLWNvdW50ZWQgcmVsZWFzZSBjYWxsYmFja3MgYW5kIGRpc2Nvbm5l
Y3RzIHRoZSBjaGlwIGJlZm9yZQpzdXNwZW5kaW5nIHRoZSBjb250cm9sbGVyIG9uIHJlbW92YWwu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMKPiBpbmRleCA3ZjllYjVmMDQyYTdlLi5kYTc3
OTE3NDFiOWQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYwoKWyAuLi4gXQoKPiBA
QCAtMTIzMiwxMCArMTI1NCwxMSBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9uYW5kX3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCVdBUk5fT04obXRkX2RldmljZV91bnJl
Z2lzdGVyKG10ZCkpOwo+ICAKPiAtCW5hbmRfY2xlYW51cChjaGlwKTsKPiArCW5hbmRfZGlzY29u
bmVjdChjaGlwKTsKPiAgCj4gIAlwbV9ydW50aW1lX3B1dF9zeW5jX3N1c3BlbmQoY3RybC0+ZGV2
KTsKPiAgCXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChjdHJsLT5kZXYpOwo+ICsJbXRkX3B1dF9t
YXN0ZXIobXRkKTsKPiAgfQoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIHByb2JsZW0gd2Fzbid0IGlu
dHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGNhbiB0ZWdyYV9uYW5kX2lycSgpCmFjY2VzcyB1
bmNsb2NrZWQgcmVnaXN0ZXJzIGFmdGVyIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgpIFsxXT8K
CnRlZ3JhX25hbmRfcHJvYmUoKSByZWdpc3RlcnMgdGVncmFfbmFuZF9pcnEoKSB3aXRoIGRldm1f
cmVxdWVzdF9pcnEoKSwgc28KdGhlIElSUSByZW1haW5zIGFjdGl2ZSB1bnRpbCBkZXZyZXMgY2xl
YW51cCBydW5zIGFmdGVyIHRlZ3JhX25hbmRfcmVtb3ZlKCkKKGFuZCBhZnRlciB0aGUgZXJyX3B1
dF9wbSBwYXRoIGluIHRlZ3JhX25hbmRfcHJvYmUoKSkgcmV0dXJucy4gIEluIHRoZQptZWFudGlt
ZSwgcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKCkgZGlzYWJsZXMgY3RybC0+Y2xrLCBhbmQgYW55
IHBlbmRpbmcgb3IKc3B1cmlvdXMgaW50ZXJydXB0IGJlZm9yZSBkZXZyZXMgZnJlZXMgdGhlIElS
USBjYXVzZXMgdGVncmFfbmFuZF9pcnEoKSB0bwpyZWFkIElTUiBhbmQgRE1BX01TVF9DVFJMIHdo
aWxlIHRoZSBjb250cm9sbGVyIGlzIHVuY2xvY2tlZCwgdHJpZ2dlcmluZyBhbgphc3luY2hyb25v
dXMgZXh0ZXJuYWwgYWJvcnQgb24gVGVncmEuCgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1
Zy9saW51eC1hZTM4NWM1YS01Y2ZiLTQ2MmEtYWI5NS1kZDEzZDZmNWUxMDcKCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDctc3Vi
bWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYxLXYxLTAtMDE4MWVmMGNjNGM4
QGdtYWlsLmNvbT9wYXJ0PTE1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
