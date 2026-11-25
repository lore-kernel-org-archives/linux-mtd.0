Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3FD606A32D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDhS45Xd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9JTte2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mYlnKA3GfW0bV8jCEIZglEmO+iLW41JS0gXHf+lf1Bg=; b=qDhS45XdZXdV/0Qixu9Ub1onsB
	veGn/Onwa9+AgH77NZsLyAPEprhNjxlZ4D/O0HRll47mUIaKIgC23hzRd2ykgQFF1gxOAjOwSzZgh
	dycfbnmuRciA8lZvm90TdGf1N9TIpqvc9tk0osqBTUCjHCYb5qcDzqPG79P6QZBeA07z8ATArQTKE
	av94hNG3Fpj85PGjf6owQ10PwJF9WUH7NecqZv1Kkmkt3cSROq57ysI/s5tccq1zy0fU3O7a/7/qv
	jZ/EzVj7c/LzdV+bRJlZm0uJGw/K2NhJ56xk4n4kNMPGaX/lhjUQXEWMP9ij/6RlmtcLUs1e8plYn
	NHfznu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHTd-0000000Axvg-2a9b;
	Wed, 25 Nov 2026 18:12:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHTX-0000000Axv3-0eki;
	Wed, 25 Nov 2026 18:12:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA90B40375;
	Wed, 25 Nov 2026 18:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF011F000C4;
	Wed, 25 Nov 2026 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630330;
	bh=JolNVXLCb/kxSvf+gc0N3du+6tZnrU3rkjWd9T1EqXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9JTte2TL8kBhxsHChmLionlUjwi00UHQkbr0xQn6+CDlt2vKwW1kj8jKMlLKa4/k
	 GKwP3GRFFni0sqwQzL28nD+gz+1jMHJXMdh1Dt7zF4NJpO0jr4lN+PzfppM5I9OxqF
	 Q9fkeTflERJNRXbigsI2sYndxMka+xzw2Jw0vX2Ev8skuWOf1pophSeNnDkdqEsbb9
	 lI/xKtBivSMquEdBq4Uf6oX+CALJY+n4q7t2idid0JgdToCL20AJOgeTws/xEHo67h
	 eK6bFW3suDLNllngC5KqEaXb9gTyUIy4E9KzbNhF2wVvYuscV4DszUalb2SdvDJbB3
	 aoNRHYZ+dwRFQ==
Message-ID: <sashiko-outbox-233923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 14/16] spi: stm32-ospi: Consume dummy cycles
 directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-14-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-14-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:12:07 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogc3RtMzItb3NwaTog
ZHVtbXlfY3ljbGVzIGJyZWFrcyBHUElPLUNTIGR1bW15IHBoYXNlIGluCiAgc3BpX21lbV9leGVj
X29wKCkKLS0KCmNvbW1pdCA2MjExYzZmOGI0ODYwNDI0YzlkYjliYmY1NzMzODI2OTljN2RhZTEw
CkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCnNwaTog
c3RtMzItb3NwaTogQ29uc3VtZSBkdW1teSBjeWNsZXMgZGlyZWN0bHkKClRoaXMgY29tbWl0IGVu
YWJsZXMgdGhlIGR1bW15X2N5Y2xlcyBzcGktbWVtIGNhcGFiaWxpdHkgaW4gdGhlIFNUTTMyIE9T
UEkKZHJpdmVyIGFuZCB1cGRhdGVzIGl0IHRvIHByb2dyYW0gZHVtbXkgY3ljbGVzIGRpcmVjdGx5
IGZyb20Kb3AtPmR1bW15Lm5jeWNsZXMgaW5zdGVhZCBvZiBjb252ZXJ0aW5nIGZyb20gb3AtPmR1
bW15Lm5ieXRlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMg
Yi9kcml2ZXJzL3NwaS9zcGktc3RtMzItb3NwaS5jCj4gaW5kZXggZmEwZThlODNjYjFiZS4uOWIy
OGQxZjI0NDgyMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktc3RtMzItb3NwaS5jCj4g
KysrIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYwoKWyAuLi4gXQoKPiBAQCAtNjkxLDcg
KzY5MCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfb3NwaV90cmFuc2Zlcl9vbmVfbWVzc2FnZShzdHJ1
Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0cmwsCj4gIAkJICovCj4gIAkJaWYgKHRyYW5zZmVyLT5kdW1t
eV9kYXRhKSB7Cj4gIAkJCW9wLmR1bW15LmJ1c3dpZHRoID0gdHJhbnNmZXItPnR4X25iaXRzOwo+
IC0JCQlvcC5kdW1teS5uYnl0ZXMgPSB0cmFuc2Zlci0+bGVuOwo+ICsJCQlvcC5kdW1teS5uY3lj
bGVzID0gdHJhbnNmZXItPmxlbiAqIDggLyB0cmFuc2Zlci0+dHhfbmJpdHM7Cj4gIAkJCWR1bW15
X2J5dGVzID0gdHJhbnNmZXItPmxlbjsKPiAgCj4gIAkJCS8qIElmIGhhcHBlbnMsIG1lYW5zIHRo
YXQgbWVzc2FnZSBpcyBub3QgY29ycmVjdGx5IGJ1aWx0ICovCj4gQEAgLTc4NCw2ICs3ODMsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1fb3BzIHN0bTMyX29zcGlf
bWVtX29wcyA9IHsKPiAgCS5wb2xsX3N0YXR1cwk9IHN0bTMyX29zcGlfcG9sbF9zdGF0dXMsCj4g
IH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9jYXBzIHN0
bTMyX29zcGlfbWVtX2NhcHMgPSB7Cj4gKwkuZHVtbXlfY3ljbGVzID0gdHJ1ZSwKPiArfTsKCltT
ZXZlcml0eTogSGlnaF0KRG9lcyBzZXR0aW5nIC5kdW1teV9jeWNsZXMgPSB0cnVlIGRyb3AgdGhl
IGR1bW15IHBoYXNlIHdoZW4gYSBHUElPCmNoaXAtc2VsZWN0IChjcy1ncGlvcykgaXMgdXNlZD8K
CkF0IHRoZSBzdGFydCBvZiBzcGlfbWVtX2V4ZWNfb3AoKSwgc3BpX21lbV9jb252ZXJ0X2R1bW15
KCkgY29udmVydHMgYW55CmR1bW15IGJ5dGVzIHRvIG9wLT5kdW1teS5uY3ljbGVzIGFuZCBjbGVh
cnMgb3AtPmR1bW15Lm5ieXRlcyB0byAwIHdoZW4KZHVtbXlfY3ljbGVzIGlzIGFkdmVydGlzZWQu
ICBXaGVuIHNwaV9nZXRfY3NncGlvZChtZW0tPnNwaSwgMCkgaXMKbm9uLU5VTEwsIHNwaV9tZW1f
ZXhlY19vcCgpIHRoZW4gc2tpcHMgY3Rsci0+bWVtX29wcy0+ZXhlY19vcCgpIGFuZCBmYWxscwpi
YWNrIHRvIHNwaV9zeW5jKCkgLT4gc3RtMzJfb3NwaV90cmFuc2Zlcl9vbmVfbWVzc2FnZSgpLCBi
dXQgdGhhdCBmYWxsYmFjawpvbmx5IGNyZWF0ZXMgdGhlIGR1bW15X2RhdGEgdHJhbnNmZXIgaWYg
b3AtPmR1bW15Lm5ieXRlcyBpcyBub24temVybzoKCmRyaXZlcnMvc3BpL3NwaS1tZW0uYzpzcGlf
bWVtX2V4ZWNfb3AoKSB7CgkuLi4KCXJldCA9IHNwaV9tZW1fY29udmVydF9kdW1teShtZW0sIG9w
KTsKCWlmIChyZXQpCgkJcmV0dXJuIHJldDsKCS4uLgoJaWYgKGN0bHItPm1lbV9vcHMgJiYgY3Rs
ci0+bWVtX29wcy0+ZXhlY19vcCAmJiAhc3BpX2dldF9jc2dwaW9kKG1lbS0+c3BpLCAwKSkgewoJ
CS4uLgoJfQoJLi4uCglpZiAob3AtPmR1bW15Lm5ieXRlcykgewoJCW1lbXNldCh0bXBidWYgKyBv
cC0+YWRkci5uYnl0ZXMgKyAxLCAweGZmLCBvcC0+ZHVtbXkubmJ5dGVzKTsKCQl4ZmVyc1t4ZmVy
cG9zXS50eF9idWYgPSB0bXBidWYgKyBvcC0+YWRkci5uYnl0ZXMgKyAxOwoJCXhmZXJzW3hmZXJw
b3NdLmxlbiA9IG9wLT5kdW1teS5uYnl0ZXM7CgkJeGZlcnNbeGZlcnBvc10udHhfbmJpdHMgPSBv
cC0+ZHVtbXkuYnVzd2lkdGg7CgkJeGZlcnNbeGZlcnBvc10uZHVtbXlfZGF0YSA9IDE7CgkuLi4K
fQoKQmVjYXVzZSBvcC0+ZHVtbXkubmJ5dGVzIGlzIG5vdyAwLCBubyBkdW1teV9kYXRhIHRyYW5z
ZmVyIGlzIGFkZGVkIHRvIHRoZQptZXNzYWdlLCBzdG0zMl9vc3BpX3RyYW5zZmVyX29uZV9tZXNz
YWdlKCkgbmV2ZXIgZW50ZXJzIHRoZQppZiAodHJhbnNmZXItPmR1bW15X2RhdGEpIGJsb2NrLCBh
bmQgc3RtMzJfb3NwaV9zZW5kKCkgZXhlY3V0ZXMgZmxhc2gKb3BlcmF0aW9ucyB3aXRoIDAgZHVt
bXkgY3ljbGVzIG9uIGJvYXJkcyB1c2luZyBjcy1ncGlvcy4KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBz
dHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjEtMC1mZDAzNjQwMmZkMzdAYm9vdGxpbi5jb20/cGFy
dD0xNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
