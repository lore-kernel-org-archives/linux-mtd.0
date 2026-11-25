Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28863606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQd3dcxs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lli4x+QG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3yclXjeSsUsVCQJpCs0eFgqcjI5TpRzhe6kloQ07zWQ=; b=yQd3dcxs5tWzpt4APkCjNkUEtT
	PYeJQad+ktbHC+DALX0xJETqFJ8W1jfr439ZQCrf8wPPqkqPS/EzKA+o47VTGT0hbBCcIvxwTfa/H
	Y0P51Fx+QA0MnPC8rWeQ/S0ASXgdDzpbIPRbmC6rW7CGjO6DIVBwEFXPDZ2wTmlcvc7C/fjtFBggb
	SIZ0phGGHbts6tPxKFY3treQW2Or4JhmK8empdV4fs0ub7mXpd1BW8WjklDFXY1LGvPpcjUr6deXB
	ThnNy8XotP29gh0AgF4N3DE2eUWUJkrsNHvL1TqxXwrcxtHvfWf5/n+lgdrrzNUUBcdkmqw0rmyMG
	wu3B/Ung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHQB-0000000AxT8-3JQm;
	Wed, 25 Nov 2026 18:08:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHQ8-0000000AxRB-3l0N;
	Wed, 25 Nov 2026 18:08:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57D0862D06;
	Wed, 25 Nov 2026 18:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D28E1F000CF;
	Wed, 25 Nov 2026 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630119;
	bh=gqX5XC9FvJ8RTI8oh/HTX9+Z3FxwlghL3GovzCr+sHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lli4x+QGdkGzm3hBrWb1Xd0tADBkjOjJD5bUI0qfKErInfukbrwaKhUYlV0AghPtx
	 SRcHXuHNlGm47LH9O8XETY+cEifFwaGfutCM7onB929DogZM7Ba8ucmLRD2wSFeJgb
	 Pq/sS58Py6eTZstIi/QdzRDaID+Lxbsmbd15eRSiQUNmAB4wJDHyFxKTxbuyGLRdYM
	 pIOFHF7a1BvN5f59FJ/J/2h46rz5U7PhmeBQdZZW/qrI//R3vO7oHRL6aO6Y72k+Mt
	 fsRNaH8E/VXkhpHjuY85ijCWkHsXJuY3CiIgRJXxZYno30+b/Sr0kltrqyaooruMyT
	 fVmGHoNnZQqnw==
Message-ID: <sashiko-outbox-233911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/16] mtd: spi-nor: Express the dummy phase in
 cycles
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-16-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-16-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:08:38 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjogc3Bh
bnNpb246IHMyNWZzMjU2dF9sYXRlX2luaXQoKSBwYXNzZXMgMSBkdW1teQogIGN5Y2xlIGluc3Rl
YWQgb2YgOAotLQoKY29tbWl0IGE5ZDNhMWUwMjRmM2E0MzA2ZTVmYjI3Y2IwNTRlM2FiMzgzZjc2
NzMKQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRk
OiBzcGktbm9yOiBFeHByZXNzIHRoZSBkdW1teSBwaGFzZSBpbiBjeWNsZXMKClRoaXMgY29tbWl0
IHVwZGF0ZXMgdGhlIFNQSSBOT1IgY29yZSBhbmQgbWFudWZhY3R1cmVyIGRyaXZlcnMgdG8gcG9w
dWxhdGUKc3BpX21lbV9vcCBkdW1teSBwaGFzZXMgaW4gY2xvY2sgY3ljbGVzIHJhdGhlciB0aGFu
IGNvbnZlcnRpbmcgdGhlbSB0bwpieXRlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BhbnNpb24uYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+IGluZGV4
IGIxYjE0ZWQwZmQ0NjcuLjcyY2MxMWQzZjFkMzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
c3BpLW5vci9zcGFuc2lvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5j
Cj4gQEAgLTUzLDEwICs1MywxMCBAQAo+ICAJCSAgIFNQSV9NRU1fT1BfTk9fRFVNTVksCQkJCQlc
Cj4gIAkJICAgU1BJX01FTV9PUF9EQVRBX09VVChuZGF0YSwgYnVmLCAwKSkKPiAgCj4gLSNkZWZp
bmUgQ1lQUkVTU19OT1JfUkRfQU5ZX1JFR19PUChuYWRkciwgYWRkciwgbmR1bW15LCBidWYpCQlc
Cj4gKyNkZWZpbmUgQ1lQUkVTU19OT1JfUkRfQU5ZX1JFR19PUChuYWRkciwgYWRkciwgbmN5Y2xl
cywgYnVmKQkJXAo+ICAJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRChTUElOT1JfT1BfUkRfQU5Z
X1JFRywgMCksCQlcCj4gIAkJICAgU1BJX01FTV9PUF9BRERSKG5hZGRyLCBhZGRyLCAwKSwJCQlc
Cj4gLQkJICAgU1BJX01FTV9PUF9EVU1NWShuZHVtbXksIDApLAkJCQlcCj4gKwkJICAgU1BJX01F
TV9PUF9EVU1NWV9DWUNMRVMobmN5Y2xlcywgMCksCQkJXAo+ICAJCSAgIFNQSV9NRU1fT1BfREFU
QV9JTigxLCBidWYsIDApKQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGNoYW5naW5nIENZUFJFU1Nf
Tk9SX1JEX0FOWV9SRUdfT1AoKSB0byB0YWtlIGR1bW15IGNsb2NrIGN5Y2xlcwpicmVhayBzMjVm
czI1NnRfbGF0ZV9pbml0KCk/Cgpkcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmM6czI1ZnMy
NTZ0X2xhdGVfaW5pdCgpIHsKICAgIC4uLgoJLyogUmVhZCBBcmNoaXRlY3R1cmUgQ29uZmlndXJh
dGlvbiBSZWdpc3RlciAoQVJDRk4pICovCglvcCA9IChzdHJ1Y3Qgc3BpX21lbV9vcCkKCQlDWVBS
RVNTX05PUl9SRF9BTllfUkVHX09QKG5vci0+cGFyYW1zLT5hZGRyX21vZGVfbmJ5dGVzLAoJCQkJ
CSAgU1BJTk9SX1JFR19DWVBSRVNTX0FSQ0ZOLCAxLAoJCQkJCSAgbm9yLT5ib3VuY2VidWYpOwoJ
cmV0ID0gc3BpX25vcl9yZWFkX2FueV9yZWcobm9yLCAmb3AsIG5vci0+cmVnX3Byb3RvKTsKICAg
IC4uLgp9CgpSZWFkaW5nIFNQSU5PUl9SRUdfQ1lQUkVTU19BUkNGTiBpbiAxUy0xUy0xUyBtb2Rl
IHJlcXVpcmVzIDggZHVtbXkgY2xvY2sKY3ljbGVzIChwcmV2aW91c2x5IDEgZHVtbXkgYnl0ZSku
ICBXaXRoIG5jeWNsZXMgc2V0IHRvIDEgYXQgMS1iaXQgYnVzd2lkdGgsCnNwaV9tZW1fZHVtbXlf
Y3ljbGVzX3RvX2J5dGVzKCkgZmFpbHMgd2l0aCAtRU9QTk9UU1VQUCBvbiBieXRlLWdyYW51bGFy
CmNvbnRyb2xsZXJzLCBvciBjeWNsZS1jYXBhYmxlIGNvbnRyb2xsZXJzIGNsb2NrIG9ubHkgMSBk
dW1teSBjeWNsZSBpbnN0ZWFkCm9mIDgsIGNhdXNpbmcgUzI1RlMyNTZUIHByb2JlIHRvIGZhaWwu
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMTI1LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1tZW0tY3ljbGVzLXYxLTAtZmQwMzY0
MDJmZDM3QGJvb3RsaW4uY29tP3BhcnQ9MTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
