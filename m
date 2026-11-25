Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190E606A329
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgyFL1ZS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP+w46Bx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TS3PfsPCsjQbVm9tYIVEbjH6K6bBoKHqRj/9Zck3wuM=; b=WgyFL1ZSrs+qTUTm3aqA58r/Bl
	YiZ/O+7XWyPKhMya29hwbTrdnXiWPp5sQqeiWLxJektKoD38yToda71cTmzkLpc4CXc62QGa+52jW
	whSoVWrXW83UfRfOIEyE12zUs5qpsqu7qPvqUNojdnG4A6VW5QF+Eh6uSA1O0j9VkfrRKAFGr7kIU
	g0t0gKKdgAndpfvXwMQV/wJjYTb1VZeFGBlcq8dS7HYRvHBc1Q0t3HEpcPjwusi6FIKssqTy/q0Nl
	l1oorVs6MFS0aMUvITOFP/58sqlEvKm2UVbjVbl9D7iubEE5QlnH+74orxX2M8fLq3L63J4WhiUDF
	mTLu9aNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHHL-0000000Au8W-3HIv;
	Wed, 25 Nov 2026 17:59:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHH0-0000000Au0A-1N5R;
	Wed, 25 Nov 2026 17:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 114E440DC3;
	Wed, 25 Nov 2026 17:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894101F000D2;
	Wed, 25 Nov 2026 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629553;
	bh=cx0jvhfBI/Pwd8AkeKgKtDRtUq4HLgRmy9OsRYZ8HQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TP+w46BxnsmTR9fWyQOIO2Tlnw0bylG7Qyhd3VoiORepkgGP1KaLo6uUEsaQOh27A
	 1o6COCbGPwJRc5PZ/+xekIXkrLH0WDjWTQZprGtaiEm87wqnz/2W+E0x1uxiEbJuQP
	 yUVBUjvI6iffDcfOujBi9odD0qjYqC2GM5b870p3c418s5+7rFIOOmIawnpUJgXSsP
	 HAs/Y3aL6FRH8gEO0BStNuNpBQqgYz9yulnIc5pQi7qafR1jE//uC5sIjy8dnvBCxD
	 Qsk9TBr4wgSj5ZhdlHVLKrQsNd4H3XrhK+D2fK7XolWrCGXld6ySTFtCahOh6rMoB1
	 duCG4JsGVIi/g==
Message-ID: <sashiko-outbox-233879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/16] spi: amlogic: spifc-a4: Consume dummy cycles
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-6-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-6-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 17:59:12 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBhbWxvZ2ljOiB1
bnVzZWQgZHVtbXlfY3ljbGUgYW5kIGFtbF9zZmNfaXNfeGlvX29wKCkgaW4KICBzcGlmYy1hNAot
LQoKY29tbWl0IGQ1NWZhODVkMDYzNzVmZmNlMjZlMGYxNDdhZGM2NGQ0NzA0Y2E5ODQKQXV0aG9y
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKc3BpOiBhbWxvZ2lj
OiBzcGlmYy1hNDogQ29uc3VtZSBkdW1teSBjeWNsZXMgZGlyZWN0bHkKClRoaXMgY29tbWl0IGVu
YWJsZXMgdGhlIGR1bW15X2N5Y2xlcyBzcGktbWVtIGNhcGFiaWxpdHkgYW5kIHVwZGF0ZXMgdGhl
CmRyaXZlciB0byB1c2Ugb3AtPmR1bW15Lm5jeWNsZXMgZGlyZWN0bHkgaW5zdGVhZCBvZiBjb252
ZXJ0aW5nIGZyb20Kb3AtPmR1bW15Lm5ieXRlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Bp
L3NwaS1hbWxvZ2ljLXNwaWZjLWE0LmMgYi9kcml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlmYy1h
NC5jCj4gaW5kZXggMTYzNDZmNTBjN2Q5OS4uYWMwNmVhNzM1MTMzYiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlmYy1hNC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3Bp
LWFtbG9naWMtc3BpZmMtYTQuYwo+IEBAIC0zNjEsMTMgKzM2MSw4IEBAIHN0YXRpYyBpbnQgYW1s
X3NmY19zZW5kX2NtZF9hZGRyX2R1bW15KHN0cnVjdCBhbWxfc2ZjICpzZmMsIGNvbnN0IHN0cnVj
dCBzcGlfbWVtCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JaWYgKG9wLT5k
dW1teS5uYnl0ZXMpIHsKPiAtCQkvKiAgRHVtbXkgYnVzd2lkdGggY29uZmlndXJhdGlvbiBpcyBu
b3Qgc3VwcG9ydGVkICovCj4gLQkJaWYgKGFtbF9zZmNfaXNfeGlvX29wKG9wKSkKPiAtCQkJZHVt
bXlfY3ljbGUgPSBvcC0+ZHVtbXkubmJ5dGVzICogOCAvIG9wLT5kYXRhLmJ1c3dpZHRoOwo+IC0J
CWVsc2UKPiAtCQkJZHVtbXlfY3ljbGUgPSBvcC0+ZHVtbXkubmJ5dGVzICogODsKPiAtCQljbWQg
PSBDTURfRFVNTVkoc2ZjLT5jc19zZWwsIGR1bW15X2N5Y2xlIC0gMSk7Cj4gKwlpZiAob3AtPmR1
bW15Lm5jeWNsZXMpIHsKPiArCQljbWQgPSBDTURfRFVNTVkoc2ZjLT5jc19zZWwsIG9wLT5kdW1t
eS5uY3ljbGVzIC0gMSk7Cj4gIAkJcmV0dXJuIHJlZ21hcF93cml0ZShzZmMtPnJlZ21hcF9iYXNl
LCBTRkNfQ01ELCBjbWQpOwo+ICAJfQoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgcmVtb3Zpbmcg
dGhpcyBibG9jayBsZWF2ZSB0aGUgbG9jYWwgdmFyaWFibGUgZHVtbXlfY3ljbGUgaW4KYW1sX3Nm
Y19zZW5kX2NtZF9hZGRyX2R1bW15KCkgYW5kIHRoZSBzdGF0aWMgaGVscGVyIGFtbF9zZmNfaXNf
eGlvX29wKCkKdW51c2VkLCBjYXVzaW5nIC1XdW51c2VkLXZhcmlhYmxlIGFuZCAtV3VudXNlZC1m
dW5jdGlvbiB3YXJuaW5ncyAoYW5kIGEKYnVpbGQgZmFpbHVyZSB3aXRoIENPTkZJR19XRVJST1I9
eSk/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYxMTI1LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1tZW0tY3ljbGVzLXYxLTAtZmQw
MzY0MDJmZDM3QGJvb3RsaW4uY29tP3BhcnQ9NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
