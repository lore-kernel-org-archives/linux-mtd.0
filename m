Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F349606A326
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4eauJbgy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6kKbraB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CIFRJVNQ0XyaSVkLsZ2/B5vwF622v87PCDOvcF5UTGE=; b=4eauJbgyunbqqG8Sceq6KQ/ppi
	jT6HrnhGgSCudux2afF5mvlhlmG1eDHQy2H/W0OLltbYYhxxeyXERhwAXlcu+jAmIgIuVxK+kVv8r
	4nIotur1Ubpr4JfmdUFwM3UW2W1sFDGP8q3T6JBh2Vd3euR/MHaa+hf+FJfMl5dFFpwPiGmqUxuP8
	yvKOaezWjEEdypvKQcqhC1PW2Bn6c0KVtm4lV79LrpOiTBNCV9cLm5XWxk73fWkNitd5QuAirZSHx
	sDMFWKgXKE7TgA8tQ3SnMo0llDHM6RpX1I2CRlnTNYXzW37t30a9IdLwVHQKMYn6yHnNmtx3dZCvv
	VRVriigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn4Z-0000000FMVG-0YAm;
	Sat, 07 Nov 2026 20:31:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn4Y-0000000FMU3-1Azy;
	Sat, 07 Nov 2026 20:31:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40886611C2;
	Sat,  7 Nov 2026 20:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304411F008A3;
	Sat,  7 Nov 2026 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794083493;
	bh=KGb8SVWOFv1GGt7zAoqUc7R+seHi6woH5xUp6hhO/kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C6kKbraBbSFZWfZop4ncnKX4ewSiAEope7D2MZkS9KsQt5e2x/eugwCKq8eF5/zqG
	 kUhiNXMvB1zI4HGCCGU6xEnQT5/1scKIdFIsngP/vaO2swMuwWoPVY+4iNkDuCEbdt
	 gPzuzyH+qBdQPa+1wfaTjb34fU4JWYZVxWQs9clHdjqwUQ+QuWMkqHQGBp3GoQbnSd
	 Rxv/mPP9jqAqE7m3fvBLUu1ocWv151DLzwoIG6mZagbrC46hLbkDnoaO8GihCc+zgN
	 TPfzFCv56oEPBelgLGrEOOqRbRbR/PF5n4PtHQ7Alyt0MCiKrJY9bd5eqFQopIU+Gj
	 JgiMa2wrpHpDQ==
Message-ID: <sashiko-outbox-203294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/58] mtd: rawnand: atmel: retain chips across
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
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-18-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:31:28 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBhdG1l
bDogaW5pdGlhbGl6ZSBfX2ZyZWUoa2ZyZWUpIHZhcmlhYmxlcyBhdAogIGRlY2xhcmF0aW9uCkl0
IGFsc28gbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIHRoaXMgcGF0Y2ggZG9l
cyBub3QKaW50cm9kdWNlOgotIFtIaWdoXSBtdGQ6IHJhd25hbmQ6IGF0bWVsOiB1bmNsb2NrZWQg
cmVnaXN0ZXIgYWNjZXNzIGluCiAgYXRtZWxfbmZjX2ludGVycnVwdCgpIFsxXQotLQoKY29tbWl0
IGI3NzA4MmViZTE1NGI1YjU5MDUzZmE2YzhmZDg5N2YxOWE1Njg1YjYKQXV0aG9yOiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCm10ZDogcmF3bmFuZDogYXRtZWw6
IHJldGFpbiBjaGlwcyBhY3Jvc3MgY29udHJvbGxlciByZW1vdmFsCgpUaGlzIGNvbW1pdCByZXRh
aW5zIE5BTkQgY2hpcCBhbmQgY29udHJvbGxlciBhbGxvY2F0aW9ucyB1bnRpbCBhbGwgTVRECnJl
ZmVyZW5jZXMgYXJlIHJlbGVhc2VkIGFuZCBkaXNjb25uZWN0cyBjaGlwcyBiZWZvcmUgdGVhcmlu
ZyBkb3duIGNvbnRyb2xsZXIKcmVzb3VyY2VzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9h
dG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+IGluZGV4IDBiZGJjYmI1MGQ5NGMuLjEwYjcyNWZhNjFk
ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9s
bGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIu
YwoKWyAuLi4gXQoKPiBAQCAtMTYzOCw3ICsxNjQwLDcgQEAgc3RhdGljIHN0cnVjdCBhdG1lbF9u
YW5kICphdG1lbF9uYW5kX2NyZWF0ZShzdHJ1Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYywK
PiAgCQkJCQkgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgCQkJCQkgICAgaW50IHJlZ19j
ZWxscykKPiAgewo+IC0Jc3RydWN0IGF0bWVsX25hbmQgKm5hbmQ7Cj4gKwlzdHJ1Y3QgYXRtZWxf
bmFuZCAqbmFuZCBfX2ZyZWUoa2ZyZWUpID0gTlVMTDsKPiAgCXN0cnVjdCBncGlvX2Rlc2MgKmdw
aW87Cj4gIAlpbnQgbnVtY3MsIHJldCwgaTsKPiAgCj4gQEAgLTE2NDksNyArMTY1MSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgYXRtZWxfbmFuZCAqYXRtZWxfbmFuZF9jcmVhdGUoc3RydWN0IGF0bWVsX25h
bmRfY29udHJvbGxlciAqbmMsCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gIAl9Cj4g
IAo+IC0JbmFuZCA9IGRldm1fa3phbGxvYyhuYy0+ZGV2LCBzdHJ1Y3Rfc2l6ZShuYW5kLCBjcywg
bnVtY3MpLCBHRlBfS0VSTkVMKTsKPiArCW5hbmQgPSBremFsbG9jKHN0cnVjdF9zaXplKG5hbmQs
IGNzLCBudW1jcyksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFuYW5kKQo+ICAJCXJldHVybiBFUlJf
UFRSKC1FTk9NRU0pOwoKWyAuLi4gXQoKPiBAQCAtMTc5MSw3ICsxODA5LDcgQEAgYXRtZWxfbmFu
ZF9jb250cm9sbGVyX2xlZ2FjeV9hZGRfbmFuZHMoc3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxl
ciAqbmMpCj4gIHsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IG5jLT5kZXY7Cj4gIAlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7Cj4gLQlzdHJ1
Y3QgYXRtZWxfbmFuZCAqbmFuZDsKPiArCXN0cnVjdCBhdG1lbF9uYW5kICpuYW5kIF9fZnJlZShr
ZnJlZSkgPSBOVUxMOwo+ICAJc3RydWN0IGdwaW9fZGVzYyAqZ3BpbzsKPiAgCXN0cnVjdCByZXNv
dXJjZSAqcmVzOwo+ICAKPiBAQCAtMTc5OSw3ICsxODE3LDcgQEAgYXRtZWxfbmFuZF9jb250cm9s
bGVyX2xlZ2FjeV9hZGRfbmFuZHMoc3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxlciAqbmMpCj4g
IAkgKiBMZWdhY3kgYmluZGluZ3Mgb25seSBhbGxvdyBjb25uZWN0aW5nIGEgc2luZ2xlIE5BTkQg
d2l0aCBhIHVuaXF1ZSBDUwo+ICAJICogbGluZSB0byB0aGUgY29udHJvbGxlci4KPiAgCSAqLwo+
IC0JbmFuZCA9IGRldm1fa3phbGxvYyhuYy0+ZGV2LCBzdHJ1Y3Rfc2l6ZShuYW5kLCBjcywgMSks
IEdGUF9LRVJORUwpOwo+ICsJbmFuZCA9IGt6YWxsb2Moc3RydWN0X3NpemUobmFuZCwgY3MsIDEp
LCBHRlBfS0VSTkVMKTsKPiAgCWlmICghbmFuZCkKPiAgCQlyZXR1cm4gLUVOT01FTTsKCltTZXZl
cml0eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgcGVyIHRoZSBDbGVhbnVwIEFQSSBjb252
ZW50aW9ucyBpbgppbmNsdWRlL2xpbnV4L2NsZWFudXAuaCwgX19mcmVlKCkgdmFyaWFibGVzIHNo
b3VsZCBiZSBkZWZpbmVkIGFuZAppbml0aWFsaXplZCBpbiBhIHNpbmdsZSBzdGF0ZW1lbnQgYXQg
dGhlaXIgYWxsb2NhdGlvbiBwb2ludCByYXRoZXIgdGhhbgpkZWNsYXJlZCBhcyAiPSBOVUxMIiBh
dCB0aGUgdG9wIG9mIGF0bWVsX25hbmRfY3JlYXRlKCkgYW5kCmF0bWVsX25hbmRfY29udHJvbGxl
cl9sZWdhY3lfYWRkX25hbmRzKCkgYW5kIGFzc2lnbmVkIGxhdGVyLgoKWyAuLi4gXQoKPiBAQCAt
MjM0OSw2ICsyMzY2LDExIEBAIGF0bWVsX2hzbWNfbmFuZF9jb250cm9sbGVyX3JlbW92ZShzdHJ1
Y3QgYXRtZWxfbmFuZF9jb250cm9sbGVyICpuYykKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgdm9pZCBhdG1lbF9oc21jX25hbmRfY29udHJvbGxlcl9yZWxlYXNlKHN0cnVjdCBuYW5k
X2NvbnRyb2xsZXIgKmNvbnRyb2xsZXIpCj4gK3sKPiArCWtmcmVlKHRvX2hzbWNfbmFuZF9jb250
cm9sbGVyKGNvbnRyb2xsZXIpKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBhdG1lbF9oc21jX25h
bmRfY29udHJvbGxlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCQkJ
Y29uc3Qgc3RydWN0IGF0bWVsX25hbmRfY29udHJvbGxlcl9jYXBzICpjYXBzKQo+ICB7Cj4gQEAg
LTIzNTYsOSArMjM3OCwxMyBAQCBzdGF0aWMgaW50IGF0bWVsX2hzbWNfbmFuZF9jb250cm9sbGVy
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIAlzdHJ1Y3QgYXRtZWxfaHNt
Y19uYW5kX2NvbnRyb2xsZXIgKm5jOwo+ICAJaW50IHJldDsKPiAgCj4gLQluYyA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqbmMpLCBHRlBfS0VSTkVMKTsKPiArCW5jID0ga3phbGxvY19vYmoo
Km5jKTsKPiAgCWlmICghbmMpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gKwlyZXQgPSBkZXZtX25h
bmRfY29udHJvbGxlcl9pbml0KGRldiwgJm5jLT5iYXNlLmJhc2UsCj4gKwkJCQkJYXRtZWxfaHNt
Y19uYW5kX2NvbnRyb2xsZXJfcmVsZWFzZSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlz
IHBhdGNoLCBidXQgY2FuIGF0bWVsX25mY19pbnRlcnJ1cHQoKQpwZXJmb3JtIGFuIHVuY2xvY2tl
ZCByZWdpc3RlciByZWFkIGR1cmluZyB0ZWFyZG93biBbMV0/CgphdG1lbF9oc21jX25hbmRfY29u
dHJvbGxlcl9wcm9iZSgpIHJlZ2lzdGVycyBhdG1lbF9uZmNfaW50ZXJydXB0KCkgd2l0aApkZXZt
X3JlcXVlc3RfaXJxKC4uLiwgSVJRRl9TSEFSRUQsIC4uLiksIHdoaWxlCmF0bWVsX2hzbWNfbmFu
ZF9jb250cm9sbGVyX3JlbW92ZSgpIG1hbnVhbGx5IGRpc2FibGVzIGhzbWNfbmMtPmNsayBiZWZv
cmUKZGV2cmVzIHJlbGVhc2VzIHRoZSBJUlE6Cgpkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9u
YW5kLWNvbnRyb2xsZXIuYzphdG1lbF9oc21jX25hbmRfY29udHJvbGxlcl9yZW1vdmUoKSB7CiAg
ICAuLi4KCWlmIChoc21jX25jLT5jbGspIHsKCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaHNtY19u
Yy0+Y2xrKTsKCQljbGtfcHV0KGhzbWNfbmMtPmNsayk7Cgl9CiAgICAuLi4KfQoKQ1BVMCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVTEKYXRtZWxfaHNtY19uYW5kX2NvbnRy
b2xsZXJfcmVtb3ZlKCkKICBjbGtfZGlzYWJsZV91bnByZXBhcmUoaHNtY19uYy0+Y2xrKQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHNoYXJlZCBJUlEgZmlyZXM+CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG1lbF9uZmNfaW50ZXJydXB0
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX3JlYWQo
Li4uLCBBVE1FTF9IU01DX05GQ19TUiwgLi4uKQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwtLSB1bmNsb2NrZWQgcmVnaXN0ZXIgYWNjZXNzCjxkZXZyZXMgY2xl
YW51cD4KICBkZXZtX2lycV9yZWxlYXNlKCkKCklmIGFub3RoZXIgZGV2aWNlIG9uIHRoZSBzaGFy
ZWQgSVJRIGxpbmUgcmFpc2VzIGFuIGludGVycnVwdCBiZWZvcmUgZGV2cmVzCmZyZWVzIHRoZSBo
YW5kbGVyLCByZWFkaW5nIEFUTUVMX0hTTUNfTkZDX1NSIHdpdGggdGhlIGNsb2NrIGRpc2FibGVk
IGNhbgp0cmlnZ2VyIGEgc3luY2hyb25vdXMgZXh0ZXJuYWwgYWJvcnQuCgpbMV0gaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL2J1Zy9saW51eC05NGQyN2NkNi1mNmZlLTQ1MmEtODYzZS0zNmNiYjg3ZTlh
ZGMKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjExMDctc3VibWl0LXJhd25hbmQtcmV0YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYxLXYx
LTAtMDE4MWVmMGNjNGM4QGdtYWlsLmNvbT9wYXJ0PTE4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
