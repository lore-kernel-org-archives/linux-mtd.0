Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305F606A692
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwpONenx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmS9TzoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mcHXZJbwyZIxk6nn1dHw2fYd3vWaV8uOVi5aMEDTE0Y=; b=nwpONenxW7dWd+g2yOU6wx6dwq
	0+SgYQ7DoJEzoXiMmKdbqWGZNi8ZmG3ys1pEb8fhmfz3AObl11p2KiNzQ+9rG03/Hb6TcnKhWUWtV
	YEUcljo1vDq3Wn1xUk3VZEPX+UipsHoGNCf+YxdAWKC00/yyTP7fhOL9XOEtMN98OgL/kfI3s/B13
	uCty84XSFi2jwKor7zRKH3rDlHYJfHJorV9rWt6RcIH6vwuJ4U0birYMn1NONSrjemC8xVTsH+niD
	24yoHC3ZjkPDk9yRENGlIjBzdi6XbqeQs3Tm2c88TboDLg7Lg+LOS9DVx3XTvysO1SyGye4+nXKxC
	59cQWCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHVU-0000000AyCx-3CJZ;
	Wed, 25 Nov 2026 18:14:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHVT-0000000AyCZ-2rXV;
	Wed, 25 Nov 2026 18:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23F3E63280;
	Wed, 25 Nov 2026 18:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954B91F000E1;
	Wed, 25 Nov 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630450;
	bh=Xss2yAo2XUtHtT/HbOssTVw0p9SQ1Jy0dk5U3JbzMf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmS9TzoEYsSvAXEgxzw4FGwSFC+aFI3PGGX/hkmKy/xvLsAk3GsqoA/jNCb76CUxQ
	 sX0sTS3NcFXEC7oHN6vYMbsSvomdJaLmBugZAZMq++5OvwI8OAMjttDE0V1h1L9cqa
	 PkGe1hXx6eMyGzoV1PAoKTbRyiuXbF98RUTBTnoGxRYm5IJiYzQ21FG9L5RAYVUm1x
	 nRfDSvKGkvUDJFRZFApIeE2FexG01Hzt0D6txs/Z853JcIoIimhUe7O0fH7rVu1x5s
	 fYJX6BRRwMmv/5qFLYBACK5UXaAtXuInlW8LL8qljpifxfNRDZ/SQ1R9LWkew5zxhe
	 Rl0hZMEZDpV9w==
Message-ID: <sashiko-outbox-233930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 15/16] spi: stm32-qspi: Consume dummy cycles
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-15-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-15-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:14:09 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogc3RtMzItcXNwaTog
bWlzc2luZyBkdW1teSBwaGFzZSBvbiBHUElPIENTIGZhbGxiYWNrIGluCiAgc3BpX21lbV9leGVj
X29wKCkKLS0KCmNvbW1pdCBmMmUyYjBiZTk2YmJjYTY0N2FkMjYxMGJmYTdiYWRmODJmNTk5Njdm
CkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCnNwaTog
c3RtMzItcXNwaTogQ29uc3VtZSBkdW1teSBjeWNsZXMgZGlyZWN0bHkKClRoaXMgY29tbWl0IGFk
dmVydGlzZXMgZHVtbXlfY3ljbGVzIGluIHN0bTMyX3FzcGlfbWVtX2NhcHMgYW5kIHVzZXMKb3At
PmR1bW15Lm5jeWNsZXMgZGlyZWN0bHkgaW4gc3RtMzJfcXNwaV9zZW5kKCkgYW5kCnN0bTMyX3Fz
cGlfdHJhbnNmZXJfb25lX21lc3NhZ2UoKS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1zdG0zMi1xc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzItcXNwaS5jCj4gaW5kZXggYjc3
ZGFiYTZkYjgzYS4uOTkzYjA5Y2M1MTI0MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGkt
c3RtMzItcXNwaS5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLXFzcGkuYwpbIC4uLiBd
Cj4gQEAgLTU5Myw3ICs1OTIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3FzcGlfdHJhbnNmZXJfb25l
X21lc3NhZ2Uoc3RydWN0IHNwaV9jb250cm9sbGVyICpjdHJsLAo+ICAJCSAqLwo+ICAJCWlmICh0
cmFuc2Zlci0+ZHVtbXlfZGF0YSkgewo+ICAJCQlvcC5kdW1teS5idXN3aWR0aCA9IHRyYW5zZmVy
LT50eF9uYml0czsKPiAtCQkJb3AuZHVtbXkubmJ5dGVzID0gdHJhbnNmZXItPmxlbjsKPiArCQkJ
b3AuZHVtbXkubmN5Y2xlcyA9IHRyYW5zZmVyLT5sZW4gKiA4IC8gdHJhbnNmZXItPnR4X25iaXRz
Owo+ICAJCQlkdW1teV9ieXRlcyA9IHRyYW5zZmVyLT5sZW47Cj4gIAo+ICAJCQkvKiBpZiBoYXBw
ZW5zLCBtZWFucyB0aGF0IG1lc3NhZ2UgaXMgbm90IGNvcnJlY3RseSBidWlsdCAqLwo+IEBAIC03
NzMsNiArNzcyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29w
cyBzdG0zMl9xc3BpX21lbV9vcHMgPSB7Cj4gIAkucG9sbF9zdGF0dXMJPSBzdG0zMl9xc3BpX3Bv
bGxfc3RhdHVzLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfY29udHJvbGxl
cl9tZW1fY2FwcyBzdG0zMl9xc3BpX21lbV9jYXBzID0gewo+ICsJLmR1bW15X2N5Y2xlcyA9IHRy
dWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IHN0bTMyX3FzcGlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKPiBAQCAtODU2LDYgKzg1OSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcXNwaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJY3RybC0+c2V0dXAgPSBzdG0zMl9xc3BpX3Nl
dHVwOwo+ICAJY3RybC0+YnVzX251bSA9IC0xOwo+ICAJY3RybC0+bWVtX29wcyA9ICZzdG0zMl9x
c3BpX21lbV9vcHM7Cj4gKwljdHJsLT5tZW1fY2FwcyA9ICZzdG0zMl9xc3BpX21lbV9jYXBzOwo+
ICAJY3RybC0+dXNlX2dwaW9fZGVzY3JpcHRvcnMgPSB0cnVlOwo+ICAJY3RybC0+dHJhbnNmZXJf
b25lX21lc3NhZ2UgPSBzdG0zMl9xc3BpX3RyYW5zZmVyX29uZV9tZXNzYWdlOwo+ICAJY3RybC0+
bnVtX2NoaXBzZWxlY3QgPSBTVE0zMl9RU1BJX01BWF9OT1JDSElQOwoKW1NldmVyaXR5OiBIaWdo
XQpEb2VzIGVuYWJsaW5nIGR1bW15X2N5Y2xlcyBkcm9wIHRoZSBkdW1teSBwaGFzZSB3aGVuIGEg
R1BJTyBjaGlwLXNlbGVjdCBpcwp1c2VkPwoKSW4gc3BpX21lbV9leGVjX29wKCksIHNwaV9tZW1f
Y29udmVydF9kdW1teSgpIHJ1bnMgZmlyc3QgYW5kIHNldHMKb3AtPmR1bW15Lm5ieXRlcyA9IDAg
YmVjYXVzZSB0aGUgY29udHJvbGxlciBhZHZlcnRpc2VzIGR1bW15X2N5Y2xlcy4gIFdoZW4Kc3Bp
X2dldF9jc2dwaW9kKG1lbS0+c3BpLCAwKSBpcyBub24tTlVMTCwgc3BpX21lbV9leGVjX29wKCkg
YnlwYXNzZXMKY3Rsci0+bWVtX29wcy0+ZXhlY19vcCBhbmQgZmFsbHMgYmFjayB0byBidWlsZGlu
ZyBzcGlfdHJhbnNmZXJzIGZvcgpzdG0zMl9xc3BpX3RyYW5zZmVyX29uZV9tZXNzYWdlKCksIGJ1
dCB0aGF0IGZhbGxiYWNrIHBhdGggb25seSBjcmVhdGVzIGEKZHVtbXlfZGF0YSB0cmFuc2ZlciB3
aGVuIG9wLT5kdW1teS5uYnl0ZXMgaXMgbm9uLXplcm86Cgpkcml2ZXJzL3NwaS9zcGktbWVtLmM6
c3BpX21lbV9leGVjX29wKCkgewoJLi4uCglpZiAoY3Rsci0+bWVtX29wcyAmJiBjdGxyLT5tZW1f
b3BzLT5leGVjX29wICYmICFzcGlfZ2V0X2NzZ3Bpb2QobWVtLT5zcGksIDApKSB7CgkuLi4KCWlm
IChvcC0+ZHVtbXkubmJ5dGVzKSB7CgkJbWVtc2V0KHRtcGJ1ZiArIG9wLT5hZGRyLm5ieXRlcyAr
IDEsIDB4ZmYsIG9wLT5kdW1teS5uYnl0ZXMpOwoJCXhmZXJzW3hmZXJwb3NdLnR4X2J1ZiA9IHRt
cGJ1ZiArIG9wLT5hZGRyLm5ieXRlcyArIDE7CgkJeGZlcnNbeGZlcnBvc10ubGVuID0gb3AtPmR1
bW15Lm5ieXRlczsKCQl4ZmVyc1t4ZmVycG9zXS50eF9uYml0cyA9IG9wLT5kdW1teS5idXN3aWR0
aDsKCQl4ZmVyc1t4ZmVycG9zXS5kdW1teV9kYXRhID0gMTsKCS4uLgp9CgpBcyBhIHJlc3VsdCwg
bm8gZHVtbXlfZGF0YSB0cmFuc2ZlciBpcyBhZGRlZCB0byB0aGUgbWVzc2FnZSwgc28Kc3RtMzJf
cXNwaV90cmFuc2Zlcl9vbmVfbWVzc2FnZSgpIGxlYXZlcyBvcC5kdW1teS5uY3ljbGVzIGF0IDAg
YW5kIGNvcnJ1cHRzCmZsYXNoIG9wZXJhdGlvbnMgdGhhdCByZXF1aXJlIGR1bW15IGN5Y2xlcyBv
biBib2FyZHMgdXNpbmcgY3MtZ3Bpb3MgKHN1Y2gKYXMgZHVhbC1mbGFzaCBjb25maWd1cmF0aW9u
cykuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYxMTI1LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1tZW0tY3ljbGVzLXYxLTAtZmQw
MzY0MDJmZDM3QGJvb3RsaW4uY29tP3BhcnQ9MTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
