Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC9606A331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=al2ygtw/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgO/4R8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Ey/q0E+SIR6CfM/CkVdBG+SrFBI0ZNYGtOcoX4Eji0=; b=al2ygtw/oMjtxZPcsv2JleaO/O
	hDVXDZ4wwFSQDp1cj/UeflNPPSZpQX9IzlA6mIgr/VsejGZSnGj4nZuYAEAO+z8n+Vc007pDs28Ah
	zrl0Be+k3KGpjWUR5h/A4oe5YlLRMKHafD4sW3PWSQPY9WErrWshWm69JDnLxH3DzIDjs3TavszpW
	w2xEA/4YTCplDfkU//EI7gLv30XG01Ogw+pSXMarlqv1B3Jbfn3UMki3A8j2Q23wXyxj90lzCdxN0
	ifJkM+h9jWDtGsDyQyHEmAe5coslDUd2Z8kqN6Qj7EvYCcjatKzgentWOop2UJlScRL8lrP8JeNP+
	abRK/0Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHK2-0000000AvJa-2bOK;
	Wed, 25 Nov 2026 18:02:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHJn-0000000AvAg-2acE;
	Wed, 25 Nov 2026 18:02:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD5D263500;
	Wed, 25 Nov 2026 18:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294941F000CF;
	Wed, 25 Nov 2026 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629726;
	bh=NR8kPtL7fWba57Aw01s+W/eWyi2it+pqLm6YFuaUa6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AgO/4R8BYBJe0S3TCx+w0Fo8nFpVdeZ1BLuxLlcOJ/lcZh9CPTRaNcbswsa1vZKAg
	 vIOiMwE96Smc3wQcP6P3UiM3rxwrmJ2OulRPj6igx6yMKe/ECWB+7I3PzATf5wJa0B
	 HM0AmEp9KVkHRcUTLyhW/toFmV+f3nhY0PTyLrUPiKWtoqgH4uPGap396bEzis2ahe
	 8nXSjL+MpcOGWt07HatKDQAyvE30Awo19X8Vtu67vLzr9MzordUgiyt1Xo0PRwJWgW
	 e2jwonigcBeAuodvo1pEtcYSJ8kSQxJR6Xdsn6S/lEMTlpYXf0KrGnuQ2YGQRR/9id
	 oKXiMhDMpyGaQ==
Message-ID: <sashiko-outbox-233890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/16] spi: rtk-nor: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:02:04 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogcnRrLW5vcjogYnVp
bGQgZmFpbHVyZSBpbiBydGtfc3BpX2NvbW1hbmRfcmVhZCgpIGZyb20gZG90CiAgb24gcG9pbnRl
ciBvcAotLQoKY29tbWl0IDMzNDgyYWYzNzAxZTc3YTI4NjYwMjUwYzg5Y2ZiYTZiYmFkOGI0YTcK
QXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKc3BpOiBy
dGstbm9yOiBDb25zdW1lIGR1bW15IGN5Y2xlcyBkaXJlY3RseQoKVGhpcyBjb21taXQgYWR2ZXJ0
aXNlcyBzcGktbWVtIGR1bW15X2N5Y2xlcyBzdXBwb3J0IGluIHRoZSBSZWFsdGVrIFNQSSBOT1IK
Y29udHJvbGxlciBkcml2ZXIgYW5kIHJlcGxhY2VzIHRoZSBieXRlLXRvLWN5Y2xlIGhlbHBlciB3
aXRoIGRpcmVjdCB1c2Ugb2YKb3AtPmR1bW15Lm5jeWNsZXMuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9zcGktcnRrLW5vci5jIGIvZHJpdmVycy9zcGkvc3BpLXJ0ay1ub3IuYwo+IGluZGV4
IDU1ZWE3YzM3MTg1NDMuLjZmZWJlZWUyNTQxZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkv
c3BpLXJ0ay1ub3IuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1ydGstbm9yLmMKClsgLi4uIF0K
Cj4gQEAgLTE5Miw3ICsxODIsNyBAQCBzdGF0aWMgaW50IHJ0a19zcGlfY29tbWFuZF9yZWFkKHN0
cnVjdCBydGtfc3BpX2hvc3QgKmhvc3QsIGNvbnN0IHN0cnVjdCBzcGlfbWVtXwo+ICAJc2l6ZV90
IGxlbiA9IG9wLT5kYXRhLm5ieXRlczsKPiAgCWxvZmZfdCBvZmZzZXQgPSBvcC0+YWRkci52YWw7
Cj4gIAl1OCBvcGNvZGUgPSBvcC0+Y21kLm9wY29kZTsKPiAtCXUzMiBkdW1teV9jeWNsZXMsIHZh
bDsKPiArCXUzMiB2YWw7Cj4gIAo+ICAJd3JpdGVsKG9wY29kZSwgaG9zdC0+cmVnYmFzZSArIFNG
Q19PUENPREUpOwo+ICAKPiBAQCAtMjAzLDggKzE5Myw3IEBAIHN0YXRpYyBpbnQgcnRrX3NwaV9j
b21tYW5kX3JlYWQoc3RydWN0IHJ0a19zcGlfaG9zdCAqaG9zdCwgY29uc3Qgc3RydWN0IHNwaV9t
ZW1fCj4gIAlpZiAob3AtPmFkZHIubmJ5dGVzID4gMCkKPiAgCQl2YWwgfD0gQUREUl9FTjsKPiAg
Cj4gLQlkdW1teV9jeWNsZXMgPSBydGtfc3BpX2NhbGNfZHVtbXlfY3ljbGVzKG9wKTsKPiAtCXZh
bCB8PSAoZHVtbXlfY3ljbGVzIDw8IFNGQ19DVExfRE1ZQ05UX1NISUZUKSAmIFNGQ19DVExfRE1Z
Q05UX01BU0s7Cj4gKwl2YWwgfD0gKG9wLmR1bW15Lm5jeWNsZXMgPDwgU0ZDX0NUTF9ETVlDTlRf
U0hJRlQpICYgU0ZDX0NUTF9ETVlDTlRfTUFTSzsKCltTZXZlcml0eTogSGlnaF0KU2hvdWxkIHRo
aXMgYmUgb3AtPmR1bW15Lm5jeWNsZXMgaW5zdGVhZCBvZiBvcC5kdW1teS5uY3ljbGVzPyAgb3Ag
aXMgYQpjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqLCBzbyB1c2luZyB0aGUgZG90IG9wZXJhdG9y
IGZhaWxzIHRvIGNvbXBpbGUuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI1LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1tZW0t
Y3ljbGVzLXYxLTAtZmQwMzY0MDJmZDM3QGJvb3RsaW4uY29tP3BhcnQ9MTIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
