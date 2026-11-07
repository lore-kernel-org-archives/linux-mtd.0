Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E56606A32C
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Fu6vdaw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWRuxx+j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zXTM2QlSYT74cJ3mpDDrSeKQ4XjmVDFLRHoe/9gk3sM=; b=0Fu6vdawybU/Wx+ADLmmqB7pgq
	TnMUCEJa6Iv45POSFPneyVBRLSN/dxteAhHCA0sHDCKPVRlkhaZyxUUN3pNqWbojUq5aOkUYEP1U7
	nFkH9lrmBGVhJvWn7vE3l7AWpywKtKfGpG6UJMGnw64fO1tM4b8uDj1yMUd1ZnV7BadGD3CGfuz74
	Anl5Ta3hGc68a0WcH3K9zQsSI0Jo3jBjOhA7A3dZOY2nMLadG7sz9fhdZIQRuGKkViWRiFAPZx8nM
	tGlscjm0bc1PoC+u+LNZ+WmdM/gQXW8DhR0TtV5OSnWarYzFzKjctGMzeMf2Q/XhIKmZ1Ek7biurq
	5vJ11/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmzr-0000000FLrV-2HH3;
	Sat, 07 Nov 2026 20:26:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmzp-0000000FLqm-0DbF;
	Sat, 07 Nov 2026 20:26:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD98B41272;
	Sat,  7 Nov 2026 20:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3551F0089F;
	Sat,  7 Nov 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083200;
	bh=1AESFR6UyewtBByr3oB+241AGrsXkM0X6WiJV3LJUSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mWRuxx+jjVJdW1MPvP4YUaHNMn04vZzAZb3YqyeAjy71jG2GLOYjy5HlGPqQfvd0p
	 zcOuNu+MQiVsOBL61AOO55Hi75o0VScAOQzgcpGLve8bnaMaSR2WxXSHP5F+WAU0G5
	 sZwi4JL8jNc85JZATzW3SWp3sYuR7zIkJ9FVRYO3MI1LrMdYwHeWyBzrkVlJOIc64E
	 6guY3yV3+plltFj67HRkbuVJjk+K56GavhGzbJERhnTVqUWKKB9ZUq7pR6fhKYgnI6
	 A915qqTTFcJztN0GrRclpa1aIJ+92+ReL0Bcdt5OzbQ5JEobwv6TQDvG7yZDCDgC1Y
	 akBtDt6g8jPng==
Message-ID: <sashiko-outbox-203279@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/58] nvmem: retain provider context through final
 device release
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:26:37 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbnZtZW06IHVucGlubmVk
IG1vZHVsZSBjYWxsYmFjayBleGVjdXRpb24gaW4gbnZtZW1fcmVsZWFzZSgpCi0tCgpjb21taXQg
NjIyM2E2MDdmYzMwNDY3NmZhOWUwNzBjOWE1OTMwNjAzOTMxZTBlNwpBdXRob3I6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbnZtZW06IHJldGFpbiBwcm92aWRl
ciBjb250ZXh0IHRocm91Z2ggZmluYWwgZGV2aWNlIHJlbGVhc2UKClRoaXMgY29tbWl0IGFkZHMg
b3B0aW9uYWwgcHJpdl9nZXQoKSBhbmQgcHJpdl9wdXQoKSBjYWxsYmFja3MgdG8gc3RydWN0Cm52
bWVtX2NvbmZpZyBzbyBwcm92aWRlcnMgY2FuIHJldGFpbiB0aGVpciBwcml2YXRlIGNvbnRleHQg
dW50aWwgZmluYWwKZGV2aWNlIHJlbGVhc2UgaW4gbnZtZW1fcmVsZWFzZSgpLgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IGluZGV4
IDA1NTZkMTQwMTcwYTQuLjg1MWZhNWNhYmVjYjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1l
bS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IEBAIC01NDEsNiArNTQxLDgg
QEAgc3RhdGljIHZvaWQgbnZtZW1fcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAo+ICAJ
aWRhX2ZyZWUoJm52bWVtX2lkYSwgbnZtZW0tPmlkKTsKPiAgCWdwaW9kX3B1dChudm1lbS0+d3Bf
Z3Bpbyk7Cj4gKwlpZiAobnZtZW0tPm9wcy0+cHJpdl9wdXQpCj4gKwkJbnZtZW0tPm9wcy0+cHJp
dl9wdXQobnZtZW0tPnByaXYpOwo+ICAJa2ZyZWUobnZtZW0tPm9wcyk7Cj4gIAlrZnJlZShudm1l
bSk7Cj4gIH0KCltTZXZlcml0eTogTWVkaXVtXQpDYW4gZXhlY3V0aW5nIG52bWVtLT5vcHMtPnBy
aXZfcHV0KCkgaGVyZSByYWNlIHdpdGggbW9kdWxlIHVubG9hZCBhbmQgcnVuCnVubWFwcGVkIG1v
ZHVsZSB0ZXh0PwoKVGhlIGtlcm5lbC1kb2Mgbm90ZSBpbiBpbmNsdWRlL2xpbnV4L252bWVtLXBy
b3ZpZGVyLmggc3RhdGVzIHRoYXQgdGhlCmNhbGxiYWNrcyBtdXN0IHJldGFpbiBhbnkgbW9kdWxl
IG5lZWRlZCB0byBleGVjdXRlIHByaXZfcHV0KCkgdW50aWwgaXQKcmV0dXJucywgYW5kIGNvbW1p
dCAibXRkOiBhZGQgb3B0LWluIGxpZmV0aW1lIG93bmVyc2hpcCBmb3IgYmFja2luZwpvYmplY3Rz
IiBpbXBsZW1lbnRzIHRoaXMgYnkgY2FsbGluZyBfX21vZHVsZV9nZXQoVEhJU19NT0RVTEUpIGlu
Cm10ZF9vdHBfbnZtZW1fZ2V0KCkgYW5kIG1vZHVsZV9wdXQoVEhJU19NT0RVTEUpIGluIG10ZF9v
dHBfbnZtZW1fcHV0KCkuCkhvd2V2ZXIsIGEgY2FsbGJhY2sgaW4gYSBsb2FkYWJsZSBtb2R1bGUg
Y2Fubm90IHNhZmVseSBkcm9wIHRoZSBsYXN0CnJlZmVyZW5jZSB0byBpdHMgb3duIG1vZHVsZSBi
ZWZvcmUgcmV0dXJuaW5nOgoKQ1BVMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEK
bnZtZW1fcmVsZWFzZSgpCiAgbXRkX290cF9udm1lbV9wdXQoKQogICAgbW9kdWxlX3B1dChUSElT
X01PRFVMRSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlbGV0ZV9tb2R1bGUo
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmVlX21vZHVsZSgpCiAgICBy
ZXR1cm47ICA8LS0gdXNlLWFmdGVyLWZyZWUKCm52bWVtLT5vd25lciBpcyBvbmx5IGhlbGQgYnkg
YWN0aXZlIGNvbnN1bWVycyBhbmQgaXMgYWxyZWFkeSBkcm9wcGVkIGluCm52bWVtX2RldmljZV9w
dXQoKSBiZWZvcmUgbnZtZW1fcmVsZWFzZSgpIHJ1bnMuICBUaGUgTlZNRU0gY29yZSBzaG91bGQg
cGluCnRoZSBtb2R1bGUgb3duaW5nIHByaXZfcHV0KCkgaW4gbnZtZW1fcmVnaXN0ZXIoKSBhbmQg
Y2FsbCBtb2R1bGVfcHV0KCkgaW4KbnZtZW1fcmVsZWFzZSgpIGFmdGVyIG52bWVtLT5vcHMtPnBy
aXZfcHV0KCkgcmV0dXJucy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDctc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxl
LWxpZmV0aW1lLXYxLXYxLTAtMDE4MWVmMGNjNGM4QGdtYWlsLmNvbT9wYXJ0PTIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
