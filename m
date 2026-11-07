Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8598606A32E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VBnFlMWq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQmQRM64
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wo9p5/6IEvNh9rOdXCAyE+34mJ74pGoAl/nTkHrXjy0=; b=VBnFlMWqRxwEXO8HPIWdhjncds
	AijQl3MF+vzkGM+asEmdp1IlpK4Mto3u/nXc4dZX0mq7ZGva0mrFecipzXQVbWBdKNvXSMp/JW5D6
	ZdbS+sVA6acJb7rX09PtjKEkwkrPM34582B7imfMp+3qMZR0M6b/+4HG70DxJre7njto8ia9unYxQ
	8s4bgqlzlvHWdpZPjs76y8oet9ovAkDTJ9iU7GVI69YtBXVU+ToV6VCcUnS/MjZAv7XbG4I0Us+cB
	BvjP8Md9u6bVtFQHPmfIp7sfGBTUVDkVj1ZrTowBfY0F16yBSruBcWmz6kU3oozHXIKkVIGoHuazo
	mgsHKj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn4c-0000000FMXw-2CVt;
	Sat, 07 Nov 2026 20:31:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn4b-0000000FMWv-1Z5n;
	Sat, 07 Nov 2026 20:31:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F58743747;
	Sat,  7 Nov 2026 20:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A051F008BD;
	Sat,  7 Nov 2026 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083496;
	bh=uVfYL/crgHpwOKUheIhGq2v1ptnfI5IGAlA37cvNCeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQmQRM64W6hKVHx476szHYttXvElu2yKjqim0wVAyHoli4626joyKYUgVYMqtaADH
	 1QBuB/kEEowdmnTQc+aEdpRB38EG5zEeYEnfcjjnK3h9Nn8POX2ggl5NPn2bmDUfFJ
	 SoUr1BE8TTsvuiEPz1w23DBvxmA0xMYYMZmD88gnv6xcMN+oM4IGs2lp1DRVin/FTu
	 v4lQ2UV4OmH7jnotAuqn68sfH95q0tJtLTLaRVF3UnBagrJLfY9G0CKltXhi1JZNoh
	 paXuaFhFVZ7wEAC9WDZyXIeFRTSqDGbPqzUSSNhOpCW+7IQSTaLXpD4AiVkgAPN7Hs
	 PzVimKFWPkKiA==
Message-ID: <sashiko-outbox-203295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:31:33 +0000
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
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBtdGQ6IHJhd25h
bmQ6IGludGVsOiBtaXNzaW5nIGhhcmR3YXJlIGRpc2FibGUgaW4KICBlYnVfbmFuZF9wcm9iZSgp
IFsxXQotLQoKY29tbWl0IDQyMTE1YjJiODE1ZGMwYTQzZmEyNDlmMWFlOTVkN2VlZWZiYjAyYTUK
QXV0aG9yOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCm10ZDog
cmF3bmFuZDogaW50ZWw6IHJldGFpbiBvcGVuLWhhbmRsZSBzdGF0ZSBvbiByZW1vdmFsCgpUaGlz
IGNvbW1pdCBkaXNjb25uZWN0cyBOQU5EIG9wZXJhdGlvbnMgb24gcmVtb3ZhbCBhbmQgdGllcyB0
aGUgbGlmZXRpbWUgb2YKdGhlIEludGVsIEVCVSBOQU5EIGNvbnRyb2xsZXIgYW5kIGNoaXAgc3Rh
dGUgdG8gdGhlIGxhc3QgTVREIHJlZmVyZW5jZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW50ZWwtbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCA0NzdhNDI3ZGFjMWYwLi5lNGEyNGU2OWVi
YmNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJv
bGxlci5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVy
LmMKClsgLi4uIF0KCj4gQEAgLTY5Miw5ICs2OTksMTUgQEAgc3RhdGljIGludCBlYnVfbmFuZF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKHJldCkKPiAgCQlnb3Rv
IGVycl9jbGVhbnVwX2RtYTsKPiAgCj4gLQlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVyKG10ZCwg
TlVMTCwgMCk7Cj4gKwlyZXQgPSBuYW5kX3NldF9yZWxlYXNlKG5hbmQsIE5VTEwpOwo+ICAJaWYg
KHJldCkKPiAgCQlnb3RvIGVycl9jbGVhbl9uYW5kOwo+ICsJcmV0ID0gbXRkX2RldmljZV9yZWdp
c3RlcihtdGQsIE5VTEwsIDApOwo+ICsJaWYgKHJldCkgewo+ICsJCW5hbmRfZGlzY29ubmVjdChu
YW5kKTsKPiArCQltdGRfcHV0X21hc3RlcihtdGQpOwo+ICsJCWdvdG8gZXJyX2NsZWFudXBfZG1h
Owo+ICsJfQoKW1NldmVyaXR5OiBNZWRpdW1dClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNl
ZCBieSB0aGlzIHBhdGNoLCBidXQgaWYgcHJvYmUgZmFpbHMgZHVyaW5nIG9yCmFmdGVyIG5hbmRf
c2NhbigpIFsxXSwgZG9lc24ndCBqdW1waW5nIHRvIGVycl9jbGVhbl9uYW5kIG9yCmVycl9jbGVh
bnVwX2RtYSBsZWF2ZSBFQlVfQ09OX05BTkRNX0VOIGVuYWJsZWQgaW4gRUJVX0NPTj8KCm5hbmRf
c2NhbigpIHJ1bnMgZWJ1X25hbmRfZXhlY19vcCgpIC0+IGVidV9zZWxlY3RfY2hpcCgpLCB3aGlj
aCBlbmFibGVzIHRoZQpjb250cm9sbGVyIGluIEVCVV9DT04sIGJ1dCB1bmxpa2UgZWJ1X25hbmRf
cmVtb3ZlKCksIHRoZSBwcm9iZSBlcnJvciBwYXRocwpuZXZlciBjYWxsIGVidV9uYW5kX2Rpc2Fi
bGUoJmVidV9ob3N0LT5jaGlwKSBiZWZvcmUgY2xlYW5pbmcgdXAgRE1BIGFuZApyZXR1cm5pbmcu
CgpbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC0zNDk4NDgyNy01MjdjLTRiZjct
YmFhOC0xMGRmZmVlNjkxNmQKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDctc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxl
LWxpZmV0aW1lLXYxLXYxLTAtMDE4MWVmMGNjNGM4QGdtYWlsLmNvbT9wYXJ0PTE0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
