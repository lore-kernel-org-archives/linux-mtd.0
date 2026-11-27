Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94D606A31F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0KSJvmhw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gb+PgFDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sJU1wjtOLFL5lLeArROho76kY8UoGDBEtENeQfxwXSs=; b=0KSJvmhwgkpvHJFkFlLh7X09XI
	lxc4Zw7iRRcw9mw6HriK7EbtHDO9QF7lgSX3Y5iGxsS76CzujmzGVr2p5L+e26vv7WXTXsXxauACa
	yaIucu+GQzR4VgTXb8BbBSQwoBoARxW1YmPajALmQEgLlhJ28c4JFc3m+ft/54J8QldawQuvShn+4
	0PHAY7m2ZHSChITNfRbBfv8D4Hl7bsMYSykwuF8J7fi5b36OVxpZmT+HEYg5l7tWHrdfJHI4OGP6U
	bXL93xuCmGVqZjQZD+xjoUPf/uYDIqHXgUuqSZTPPvSxl71XxXDgtPpDUbqgJ9NtY52DT+hRxzhJn
	cIeEfwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxF1-0000000GceG-2srM;
	Fri, 27 Nov 2026 14:47:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxEy-0000000Gcd0-3pxL;
	Fri, 27 Nov 2026 14:47:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76F8C42E1B;
	Fri, 27 Nov 2026 14:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826441F0089A;
	Fri, 27 Nov 2026 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790876;
	bh=oRjIqSWINEkHmDyw4sCziPp6EwjJYhFVjZ6ycoabQMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gb+PgFDdzoHGawX0SYTrnaJtt78i6/E2aEnD03hZO0CxwgyZ4p6u4GySQZnzzG4Pg
	 6CJNSWoyilHSm+kZEbdaKO4voErn4u9PQNr2epJdFTzTmj2NmYs7evhHrh2MibsK2E
	 VHUYzokAUZJZh/wgP0O1wfNkdFVXeBtV07oJpVXIS5QJoNDlaxhLzYTQlqLUpO04N1
	 DwMWg+eEG/rn5OihPzZHhoKm8RDnAbB+qJiL9t2VHqcoNFq2hLvQilLDtiXtm+a8+I
	 swuTMXdnSTEMfxd+s7yItcCM1/S7Jm5OZWxmFpN5VMO8txHs10PScanA/rJrWkCy93
	 sckTuhmUA+9Xg==
Message-ID: <sashiko-outbox-237604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 11/35] spi: atmel-quadspi: Reject excessive dummy
 cycle counts
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
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-11-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-11-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 14:47:54 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogYXRtZWwtcXVhZHNw
aTogYnJva2VuIGR1bW15IGJ1c3dpZHRoIGNoZWNrIGluCiAgYXRtZWxfcXNwaV9zdXBwb3J0c19v
cCgpCi0tCgpjb21taXQgODQxZGMxNjhkYWU2MWJiZTM1OTNlNzAzMzM5ZjM2MjU4N2E1OThmZApB
dXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpzcGk6IGF0
bWVsLXF1YWRzcGk6IFJlamVjdCBleGNlc3NpdmUgZHVtbXkgY3ljbGUgY291bnRzCgpUaGlzIGNv
bW1pdCBhZGRzIGNoZWNrcyB0byBhdG1lbF9xc3BpX3N1cHBvcnRzX29wKCkgdG8gcmVqZWN0IG9w
ZXJhdGlvbnMKd2hvc2UgZHVtbXkgY3ljbGUgY291bnQgZXhjZWVkcyBRU1BJX0lGUl9OQkRVTV9N
QVNLIG9yIHdob3NlIGR1bW15CmJ1c3dpZHRoIGRpZmZlcnMgZnJvbSB0aGUgYWRkcmVzcyBidXN3
aWR0aC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL2F0bWVsLXF1YWRzcGkuYyBiL2RyaXZl
cnMvc3BpL2F0bWVsLXF1YWRzcGkuYwo+IGluZGV4IGFiY2E5OWIzMmI2MTkuLjg5NDZhYmFhZmE4
MWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvYXRtZWwtcXVhZHNwaS5jCj4gKysrIGIvZHJp
dmVycy9zcGkvYXRtZWwtcXVhZHNwaS5jCj4gQEAgLTQ4Nyw5ICs0ODcsMTUgQEAgc3RhdGljIGJv
b2wgYXRtZWxfcXNwaV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ICAJaWYgKCFz
cGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AobWVtLCBvcCkpCj4gIAkJcmV0dXJuIGZhbHNlOwo+
ICAKPiArCWlmIChvcC0+ZHVtbXkubmN5Y2xlcyAmJiBvcC0+ZHVtbXkuYnVzd2lkdGggIT0gb3At
PmFkZHIuYnVzd2lkdGgpCj4gKwkJcmV0dXJuIGZhbHNlOwoKW1NldmVyaXR5OiBIaWdoXQpEb2Vz
IHRoaXMgcmVqZWN0IGV2ZXJ5IG9wZXJhdGlvbiB0aGF0IGhhcyBkdW1teSBjeWNsZXMgYnV0IG5v
IGFkZHJlc3MKcGhhc2U/CgpXaGVuIG9wLT5hZGRyLm5ieXRlcyBpcyAwLCBvcC0+YWRkci5idXN3
aWR0aCBpcyAwIChmb3IgZXhhbXBsZSwgaW4Kc3BpX25vcl9zcGltZW1fc2V0dXBfb3AoKSB3aGVu
IG1pY3Jvbl9zdF9ub3Jfb2N0YWxfZHRyX2VuKCkgaXNzdWVzIGFuCjhELThELThEIFJlYWQgSUQg
d2l0aCAwIGFkZHJlc3MgYnl0ZXMgYW5kIDggZHVtbXkgYnl0ZXMsIG9yIGluIFNQSSBOQU5ECm9w
ZXJhdGlvbnMgdXNpbmcgU1BJX01FTV9PUF9OT19BRERSIHdpdGggZHVtbXkgYnl0ZXMpLCBzbyBj
b21wYXJpbmcKb3AtPmR1bW15LmJ1c3dpZHRoIGFnYWluc3Qgb3AtPmFkZHIuYnVzd2lkdGggd2l0
aG91dCBjaGVja2luZwpvcC0+YWRkci5uYnl0ZXMgY2F1c2VzIGF0bWVsX3FzcGlfc3VwcG9ydHNf
b3AoKSB0byByZXR1cm4gZmFsc2UgYW5kIGZhaWxzCnRob3NlIG9wZXJhdGlvbnMgd2l0aCAtRU9Q
Tk9UU1VQUC4KCkFsc28sIHRoaXMgYnVzd2lkdGggY2hlY2sgaXMgbm90IG1lbnRpb25lZCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI3LW1hY3Jvbml4LXVwc3RyZWFtaW5nLXNwaS1tZW0t
Y3ljbGVzLXYyLTAtNWM5M2Y1ZTVkNjMwQGJvb3RsaW4uY29tP3BhcnQ9MTEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
