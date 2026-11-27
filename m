Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D21606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgO7E4Z/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilC/3IeW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uem7kq+3VlymNlhLOV6Iv79t60SGxtdPcN62CiYI0Qk=; b=cgO7E4Z/C/MYfY6YSu6ifnlFqK
	6HhU2mLguZbyet8ot9SBp1bH2ADZflsJdnW3gNqjJwquh7pcdnVS8s6PRpWfukSyI6LxRmKQaGHK8
	Jd2vDqeaSLTHdpO2sKxu04ps8krR1JWH0OzYvpaq3VNAsyHNlT5whXfFlpnnp1pYwagM5nQU0f+Lc
	eVpfzoNxUOlDvk/ynxdt2n4A0MYSTx4bHG49H8cniXeCYHwdwio20z7Ad9+WiAgaubaBZp7qZ/3Rt
	wnzpHzT1a2/bnmNeH+kotGHx0hdn2T5wSHfal1znVOKf9ystm1+k60i5h72pCpqLJz9jWAZjPo50R
	sBUheroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxRV-0000000GgJd-1gJ1;
	Fri, 27 Nov 2026 15:00:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxRR-0000000GgJB-1THG;
	Fri, 27 Nov 2026 15:00:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1348441E1;
	Fri, 27 Nov 2026 15:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0051F00893;
	Fri, 27 Nov 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791648;
	bh=eLcbyujfUpUezFzf+dyuSUdvtd7PBrhQqklGwJTYvrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilC/3IeW/OwB3WPoHlf9D6FzDd5BY8aQuQ5HEIWB9Zpomygj8Y8u8aVnq8wDqESVd
	 iPhX9IPRqNWIMFfhEC1TNMH2CGHL5f411aolSajFEptnZU1y622XETeDe1CPwXvGRN
	 0wAncTOlryTyaCCcggFLawODTmIu8ehc1BwZYdU+f7nm+lrJRtksEqRsGKOf9qHIbI
	 9qQwj8uj3FnYrVJVcKOMLZNTvaDr99QOce93z5AnGW4yNnrIfhrB7/FzNjiBg0MVAX
	 IWcpinXAYpJs5fTBo39DyaqEx/3oyeTt7Lhqqvf2aOXAgqcQ4lInNzXakVmnlYUsqT
	 F02xFjf9TG9FQ==
Message-ID: <sashiko-outbox-237658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 19/35] spi: nxp-fspi: Reject mixed DTR modes
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Yogesh Gaur" <yogeshgaur.83@gmail.com>, "Chris
 Packham" <chris.packham@alliedtelesis.co.nz>, =?utf-8?b?Sm9uYXRoYW4gTmV1?=
 =?utf-8?b?c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, "Michal Simek" <michal.simek@amd.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-19-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-19-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 15:00:45 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBueHAtZnNwaTog
bWlzc2luZyBkdW1teS5kdHIgY2hlY2sgaW4KICBueHBfZnNwaV9zdXBwb3J0c19vcCgpCi0tCgpj
b21taXQgZDE3ZTczY2QxMzY5MmZjOWFlOTJjYmQxMTc2ZWZlNTZlYTU5NjgyOQpBdXRob3I6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpzcGk6IG54cC1mc3BpOiBS
ZWplY3QgbWl4ZWQgRFRSIG1vZGVzCgpUaGlzIGNvbW1pdCBhZGRzIGNoZWNrcyBpbiBueHBfZnNw
aV9zdXBwb3J0c19vcCgpIHRvIHJlamVjdCBzcGktbWVtCm9wZXJhdGlvbnMgdGhhdCBtaXggU0RS
IGFuZCBEVFIgcGhhc2VzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW54cC1mc3Bp
LmMgYi9kcml2ZXJzL3NwaS9zcGktbnhwLWZzcGkuYwo+IGluZGV4IGU2ZmRkZWQ2N2EwMGUuLjA0
OTk5MzY5ZGQxYmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW54cC1mc3BpLmMKPiAr
KysgYi9kcml2ZXJzL3NwaS9zcGktbnhwLWZzcGkuYwo+IEBAIC01MzYsOCArNTM2LDE4IEBAIHN0
YXRpYyBib29sIG54cF9mc3BpX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gIAkJ
CQkgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ICB7Cj4gIAlzdHJ1Y3QgbnhwX2ZzcGkg
KmYgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShtZW0tPnNwaS0+Y29udHJvbGxlcik7Cj4g
Kwlib29sIGFsbF90cnVlLCBhbGxfZmFsc2U7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCWFsbF90cnVl
ID0gb3AtPmNtZC5kdHIgJiYKPiArCQkgICAoIW9wLT5hZGRyLm5ieXRlcyB8fCBvcC0+YWRkci5k
dHIpICYmCj4gKwkJICAgKCFvcC0+ZGF0YS5uYnl0ZXMgfHwgb3AtPmRhdGEuZHRyKTsKPiArCj4g
KwlhbGxfZmFsc2UgPSAhb3AtPmNtZC5kdHIgJiYgIW9wLT5hZGRyLmR0ciAmJiAhb3AtPmRhdGEu
ZHRyOwo+ICsKPiArCWlmICghYWxsX3RydWUgJiYgIWFsbF9mYWxzZSkKPiArCQlyZXR1cm4gZmFs
c2U7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIGFsbF90cnVlIGFuZCBhbGxfZmFsc2UgYWxz
byBjaGVjayBvcC0+ZHVtbXkuZHRyIHdoZW4Kb3AtPmR1bW15Lm5jeWNsZXMgaXMgbm9uLXplcm8/
CgpCZWNhdXNlIG54cF9mc3BpX21lbV9jYXBzIHNldHMgZHVtbXlfY3ljbGVzID0gdHJ1ZSwKc3Bp
X21lbV9jb252ZXJ0X2R1bW15KCkgY29udmVydHMgb3AtPmR1bW15Lm5ieXRlcyB0byBvcC0+ZHVt
bXkubmN5Y2xlcyBhbmQKY2xlYXJzIG9wLT5kdW1teS5uYnl0ZXMgYmVmb3JlIG54cF9mc3BpX3N1
cHBvcnRzX29wKCkgYW5kCnNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIHJ1bi4gIFNpbmNl
IHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpCm9ubHkgY2hlY2tzIG9wLT5kdW1teS5uYnl0
ZXMsIGFuIG9wZXJhdGlvbiB3aG9zZSBkdW1teSBwaGFzZSBoYXMgYQpkaWZmZXJlbnQgRFRSIHNl
dHRpbmcgZnJvbSB0aGUgY29tbWFuZCwgYWRkcmVzcywgYW5kIGRhdGEgcGhhc2VzIHBhc3Nlcwp2
YWxpZGF0aW9uLgoKVW5saWtlIG90aGVyIGRyaXZlcnMgdGhhdCBpZ25vcmUgb3AtPmR1bW15LmR0
ciBvbmNlIGR1bW15IGJ5dGVzIGFyZQpjb252ZXJ0ZWQgdG8gY3ljbGVzLCB0aGlzIGRyaXZlciBz
dGlsbCB1c2VzIG9wLT5kdW1teS5kdHIgdG8gcHJvZ3JhbSB0aGUKTFVUIGFuZCB0byBzZWxlY3Qg
dGhlIGNvbnRyb2xsZXIgRFRSIG1vZGUgYW5kIGNsb2NrIHJhdGU6Cgpkcml2ZXJzL3NwaS9zcGkt
bnhwLWZzcGkuYzpueHBfZnNwaV9wcmVwYXJlX2x1dCgpIHsKICAgIC4uLgoJaWYgKG9wLT5kdW1t
eS5uY3ljbGVzKSB7CgkJbHV0dmFsW2x1dGlkeCAvIDJdIHw9IExVVF9ERUYobHV0aWR4LCBvcC0+
ZHVtbXkuZHRyID8gTFVUX0RVTU1ZX0REUiA6IExVVF9EVU1NWSwKICAgIC4uLgp9Cgpkcml2ZXJz
L3NwaS9zcGktbnhwLWZzcGkuYzpueHBfZnNwaV9zZWxlY3RfbWVtKCkgewogICAgLi4uCgkvKiBm
bGV4c3BpIG9ubHkgc3VwcG9ydCBvbmUgRFRSIG1vZGU6IDhELThELThEICovCglib29sIG9wX2lz
X2R0ciA9IG9wLT5jbWQuZHRyICYmIG9wLT5hZGRyLmR0ciAmJiBvcC0+ZHVtbXkuZHRyICYmIG9w
LT5kYXRhLmR0cjsKICAgIC4uLgp9CgpBbHNvIG5vdGUgdGhhdCBhbGxfdHJ1ZSBwZXJtaXRzIGVt
cHR5IGFkZHIgb3IgZGF0YSBwaGFzZXMgdG8gaGF2ZSAuZHRyCnNldCB0byBmYWxzZSwgd2hlcmVh
cyBvcF9pc19kdHIgaW4gbnhwX2ZzcGlfc2VsZWN0X21lbSgpIHJlcXVpcmVzIGFsbCBmb3VyCi5k
dHIgZmllbGRzIHRvIGJlIHRydWUgdW5jb25kaXRpb25hbGx5LgoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyNy1tYWNyb25peC11
cHN0cmVhbWluZy1zcGktbWVtLWN5Y2xlcy12Mi0wLTVjOTNmNWU1ZDYzMEBib290bGluLmNvbT9w
YXJ0PTE5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
