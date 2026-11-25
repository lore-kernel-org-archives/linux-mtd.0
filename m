Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD27A606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TmmvlpdJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFQ82qw+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BGFGQGqg3lOkKDHt6D8LcGxbQ9TnjxTrdRUtssUmvJw=; b=TmmvlpdJvcteE7JZb3nTWPuZxW
	xSLSw1PTfWfwIDGIqu6eBYEyyOgVoASG6+BjyG/oyfJDVuX5E3Q36LGkNVqcVdj6E5MK4NzUf1p2/
	GnpUDdaTjNx0Z5/P+DCq/0Uqx6gRdNwkr4wbYrNBIFdA08zLLWDqEOAIra8BWxL6f4Qc9oDWWPalM
	PC9p+1OY4Ol2LJF1aQ2WPmi5urojvi/bKkufJ+V3IEnxdh64t8rvRIIeRv5TeeoGW/bJY1Ttcgppn
	9caDkY6KDnjCMibDoTwoS619z5VBuygEr2clwINfbShvAtUMXublTuQBj+INzQ40c8LhhJvk37wrZ
	d7Yhwtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHGE-0000000Atap-1MXR;
	Wed, 25 Nov 2026 17:58:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHGC-0000000Atac-3v8a;
	Wed, 25 Nov 2026 17:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61C6961DDE;
	Wed, 25 Nov 2026 17:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D871F000C6;
	Wed, 25 Nov 2026 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629504;
	bh=gIlN+r8h9Pbt/yzQjLsXmvUyreMp7XomyI06MZZutuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFQ82qw++FHkfGeiEic72JcJDsGOJ+faMyFoqIyfCTPoLBaWH9EcQyHnYEkTINXgK
	 6g8iBjOpi/howEqqxu2E3goRwdI41Q82FSZl6dTfDoEL4iDmzlPWzuZIYKLqAnq1X8
	 WEyArPdn9gu+DXwh0gvWPHxAvU7XYGyUKTpomRviL3Vlw/Zc8fIgYa06Rc+W8CrjHU
	 tQOQbxzzfu1IDru6nqV1Bz+e0gEnDLWlqy5YnHaUIBvQkcm4oa2+lWs/DKtiGpL4du
	 HgjQN7ANNSIk+UHmMI0BwVmYPXGY0N/18huuBWycMhTidS9gEXwn9oqH6N1/SiaIYG
	 ELJFE+E5dF4AQ==
Message-ID: <sashiko-outbox-233875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 17:58:22 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogZnNsLXFzcGk6IG1p
c3NpbmcgZHVtbXlfY3ljbGVzIGluIGZzbF9xc3BpX21lbV9jYXBzIHplcm9lcwogIG5jeWNsZXMK
LS0KCmNvbW1pdCA5NmYwNzQxY2EyZDcxZjdmYzNiMjZiOWYwODg0NTc3Njg1NGViOGE0CkF1dGhv
cjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCnNwaTogZnNsLXFz
cGk6IENvbnN1bWUgZHVtbXkgY3ljbGVzIGRpcmVjdGx5CgpUaGlzIGNvbW1pdCBjb252ZXJ0cyBm
c2xfcXNwaV9zdXBwb3J0c19vcCgpIGFuZCBmc2xfcXNwaV9wcmVwYXJlX2x1dCgpIHRvCnVzZSBv
cC0+ZHVtbXkubmN5Y2xlcyBkaXJlY3RseSBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgb3AtPmR1bW15
Lm5ieXRlcyBpbnRvCmNsb2NrIGN5Y2xlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1mc2wtcXNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWZzbC1xc3BpLmMKPiBpbmRleCBkMmMyMDkw
NDQyZjg0Li5hMWQ2MzU3ZTMyMDNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1mc2wt
cXNwaS5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWZzbC1xc3BpLmMKPiBAQCAtMzk5LDcgKzM5
OSw3IEBAIHN0YXRpYyBib29sIGZzbF9xc3BpX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICpt
ZW0sCj4gIAlpZiAob3AtPmFkZHIubmJ5dGVzKQo+ICAJCXJldCB8PSBmc2xfcXNwaV9jaGVja19i
dXN3aWR0aChxLCBvcC0+YWRkci5idXN3aWR0aCk7Cj4gIAo+IC0JaWYgKG9wLT5kdW1teS5uYnl0
ZXMpCj4gKwlpZiAob3AtPmR1bW15Lm5jeWNsZXMpCj4gIAkJcmV0IHw9IGZzbF9xc3BpX2NoZWNr
X2J1c3dpZHRoKHEsIG9wLT5kdW1teS5idXN3aWR0aCk7Cj4gIAo+ICAJaWYgKG9wLT5kYXRhLm5i
eXRlcykKPiBAQCAtNDEzLDEzICs0MTMsMTIgQEAgc3RhdGljIGJvb2wgZnNsX3FzcGlfc3VwcG9y
dHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCSAqIHRvIGZpdCBpbnRvIGEgc2luZ2xlIExV
VCBlbnRyeS4KPiAgCSAqLwo+ICAJaWYgKG9wLT5hZGRyLm5ieXRlcyArCj4gLQkgICAob3AtPmR1
bW15Lm5ieXRlcyA/IDE6MCkgKwo+ICsJICAgKG9wLT5kdW1teS5uY3ljbGVzID8gMTowKSArCj4g
IAkgICAob3AtPmRhdGEubmJ5dGVzID8gMTowKSA+IDYpCj4gIAkJcmV0dXJuIGZhbHNlOwo+ICAK
PiAgCS8qIE1heCA2NCBkdW1teSBjbG9jayBjeWNsZXMgc3VwcG9ydGVkICovCj4gLQlpZiAob3At
PmR1bW15Lm5ieXRlcyAmJgo+IC0JICAgIChvcC0+ZHVtbXkubmJ5dGVzICogOCAvIG9wLT5kdW1t
eS5idXN3aWR0aCA+IDY0KSkKPiArCWlmIChvcC0+ZHVtbXkubmN5Y2xlcyA+IDY0KQo+ICAJCXJl
dHVybiBmYWxzZTsKPiAgCj4gIAkvKiBNYXggZGF0YSBsZW5ndGgsIGNoZWNrIGNvbnRyb2xsZXIg
bGltaXRzIGFuZCBhbGlnbm1lbnQgKi8KPiBAQCAtNDYwLDExICs0NTksMTAgQEAgc3RhdGljIHZv
aWQgZnNsX3FzcGlfcHJlcGFyZV9sdXQoc3RydWN0IGZzbF9xc3BpICpxLAo+ICAJCWx1dGlkeCsr
Owo+ICAJfQo+ICAKPiAtCWlmIChvcC0+ZHVtbXkubmJ5dGVzKSB7Cj4gKwlpZiAob3AtPmR1bW15
Lm5jeWNsZXMpIHsKPiAgCQlsdXR2YWxbbHV0aWR4IC8gMl0gfD0gTFVUX0RFRihsdXRpZHgsIExV
VF9EVU1NWSwKPiAgCQkJCQkgICAgICBMVVRfUEFEKG9wLT5kdW1teS5idXN3aWR0aCksCj4gLQkJ
CQkJICAgICAgb3AtPmR1bW15Lm5ieXRlcyAqIDggLwo+IC0JCQkJCSAgICAgIG9wLT5kdW1teS5i
dXN3aWR0aCk7Cj4gKwkJCQkJICAgICAgb3AtPmR1bW15Lm5jeWNsZXMpOwo+ICAJCWx1dGlkeCsr
Owo+ICAJfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGZzbF9xc3BpX21lbV9jYXBzIGFsc28gbmVl
ZCAuZHVtbXlfY3ljbGVzID0gdHJ1ZT8KCmZzbF9xc3BpX21lbV9jYXBzIG9ubHkgc2V0cyAucGVy
X29wX2ZyZXEgPSB0cnVlLiAgV2l0aG91dCAuZHVtbXlfY3ljbGVzID0KdHJ1ZSwgc3BpX21lbV9j
b252ZXJ0X2R1bW15KCkgY29udmVydHMgYW55IGR1bW15IGN5Y2xlcyB0byBvcC0+ZHVtbXkubmJ5
dGVzCmFuZCBzZXRzIG9wLT5kdW1teS5uY3ljbGVzID0gMCBiZWZvcmUgaW52b2tpbmcgdGhlIGRy
aXZlciBjYWxsYmFja3MuICBBcyBhCnJlc3VsdCwgb3AtPmR1bW15Lm5jeWNsZXMgaXMgYWx3YXlz
IDAgaW4gZnNsX3FzcGlfc3VwcG9ydHNfb3AoKSBhbmQKZnNsX3FzcGlfcHJlcGFyZV9sdXQoKSwg
c28gZHVtbXkgdmFsaWRhdGlvbiBpcyBza2lwcGVkIGFuZCBMVVRfRFVNTVkgaXMKbmV2ZXIgcHJv
Z3JhbW1lZCBpbnRvIHRoZSBoYXJkd2FyZSBMVVQgZm9yIG9wZXJhdGlvbnMgcmVxdWlyaW5nIGR1
bW15CmN5Y2xlcy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMt
djEtMC1mZDAzNjQwMmZkMzdAYm9vdGxpbi5jb20/cGFydD04CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
