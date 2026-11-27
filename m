Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3146606A680
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bx7DtyWe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MtDzQRjv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MAWXFwSWEf3lI9FKbN/grMN31L5RoPPZd2ckRfifDCw=; b=Bx7DtyWeD+vMXE/j1DREGUI+JD
	x+T3OB6RKdxKlYy4jUjk+0Zbjw7I1/z3E1eP+9niXSFaEcaRaIQEL0ZTVkpadiWi/m3PgxQG0Qy26
	urKtxiM7h9iGYKolP6XEh55oxmWeDxXr4v9LIBl5Y1s2lD2q5dAFNphpIIh6Tao1dIIKFXnOVkLyb
	pLRG1hr/yRRoxWNuY2x8evzVHTHAq15RYXbLlUx3W7mRru4L8IQotjYdEiFghZ5gmJJA8mY+UqZFq
	bjd4NlbBi6eDQC8vFefeYEaMEdCriH090+RIYaWh5MfSJZWMNt4X0JrTAz164yv4ZEEUjKNXHGHnk
	K6yL2ZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx8q-0000000GbOq-1bCS;
	Fri, 27 Nov 2026 14:41:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx8g-0000000GbN6-3enU;
	Fri, 27 Nov 2026 14:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B33B41AA4;
	Fri, 27 Nov 2026 14:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660511F00899;
	Fri, 27 Nov 2026 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790486;
	bh=iBwxQmXSjGr3/gqu7AvvP0Rjc+5sGJ4XbMUAtx8two0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MtDzQRjvYMv9X8QxM4QadsuI11MwnUZF4aJ0/DDKm0vfbvGgov0uacS12aKidW1Gl
	 Iqx7qmx0Wikyei+Fbgiez9j5oWxSuWU++QPGUtfRF6+sNM9oBqsxZr3JikxMqthPzX
	 hybDZB/ZO8uN0qg4IwN9oAO6yucW0v96Vwky1f+mkvuX7oh70Ize39GNvzh2oG7C0a
	 vtw40CM5eV0Xxe2ShXdXZgsFySHqnxs9OBAv4hYnr/L4T541VLWaLbI5TPUwlIYQV/
	 xROM4jr+AoOosGGunpM4aCN6g0l6TaaOuJ+/rIKVO/Erx27uJyxgDIjqPq3SMvsd+l
	 dimkPC12q986A==
Message-ID: <sashiko-outbox-237584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 10/35] spi: atmel-quadspi: Consume dummy cycles
 directly
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
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-10-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-10-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 14:41:23 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBhdG1lbC1xdWFk
c3BpOiBpbmNvbXBsZXRlIGR1bW15IGN5Y2xlIGNoZWNrIGluCiAgYXRtZWxfcXNwaV9zdXBwb3J0
c19vcCgpCi0tCgpjb21taXQgMDdiYTEwNTY0M2JjN2YzZjM3MzdkNTYwODRjYTJiZWQ4YjM4MjFm
NgpBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpzcGk6
IGF0bWVsLXF1YWRzcGk6IENvbnN1bWUgZHVtbXkgY3ljbGVzIGRpcmVjdGx5CgpUaGlzIGNvbW1p
dCBhZHZlcnRpc2VzIHRoZSBkdW1teV9jeWNsZXMgc3BpLW1lbSBjYXBhYmlsaXR5IGFuZCBzd2l0
Y2hlcwp0aGUgZHJpdmVyIGZyb20gY29udmVydGluZyBvcC0+ZHVtbXkubmJ5dGVzIHRvIGNvbnN1
bWluZwpvcC0+ZHVtbXkubmN5Y2xlcyBkaXJlY3RseS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BpL2F0bWVsLXF1YWRzcGkuYyBiL2RyaXZlcnMvc3BpL2F0bWVsLXF1YWRzcGkuYwo+IGluZGV4
IDBiNjk1YjBiM2M5OGYuLmFiY2E5OWIzMmI2MTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkv
YXRtZWwtcXVhZHNwaS5jCj4gKysrIGIvZHJpdmVycy9zcGkvYXRtZWwtcXVhZHNwaS5jCj4gQEAg
LTUwMiw3ICs1MDIsNyBAQCBzdGF0aWMgYm9vbCBhdG1lbF9xc3BpX3N1cHBvcnRzX29wKHN0cnVj
dCBzcGlfbWVtICptZW0sCj4gIAo+ICAJLyogc3BlY2lhbCBjYXNlIG5vdCBzdXBwb3J0ZWQgYnkg
aGFyZHdhcmUgKi8KPiAgCWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gMiAmJiBvcC0+Y21kLmJ1c3dp
ZHRoICE9IG9wLT5hZGRyLmJ1c3dpZHRoICYmCj4gLQkgICAgb3AtPmR1bW15Lm5ieXRlcyA9PSAw
KQo+ICsJICAgICFvcC0+ZHVtbXkubmN5Y2xlcykKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+ICAJ
cmV0dXJuIHRydWU7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KU2hvdWxkIHRoaXMgY2hlY2sgcmVqZWN0
IG9wLT5kdW1teS5uY3ljbGVzIDwgOCAvIG9wLT5hZGRyLmJ1c3dpZHRoCmluc3RlYWQgb2YgIW9w
LT5kdW1teS5uY3ljbGVzPwoKRm9yIDItYnl0ZSBhZGRyZXNzZXMgaW4gYXRtZWxfcXNwaV9zZXRf
Y2ZnKCksIHNoaWZ0aW5nIHRoZSBhZGRyZXNzIGludG8KdGhlIGZpcnN0IGR1bW15IGJ5dGUgcmVx
dWlyZXMgYXQgbGVhc3QgOCAvIG9wLT5hZGRyLmJ1c3dpZHRoIGR1bW15CmN5Y2xlczoKCmRyaXZl
cnMvc3BpL2F0bWVsLXF1YWRzcGkuYzphdG1lbF9xc3BpX3NldF9jZmcoKSB7CgkuLi4KCQljYXNl
IDI6CgkJCWlmIChkdW1teV9jeWNsZXMgPCA4IC8gb3AtPmFkZHIuYnVzd2lkdGgpIHsKCQkJCWlm
ciAmPSB+UVNQSV9JRlJfSU5TVEVOOwoJCQkJaWZyIHw9IFFTUElfSUZSX0FERFJFTjsKCQkJCWlh
ciA9IChvcC0+Y21kLm9wY29kZSA8PCAxNikgfAoJCQkJCShvcC0+YWRkci52YWwgJiAweGZmZmYp
OwoJCQl9IGVsc2UgewoJCQkJaWZyIHw9IFFTUElfSUZSX0FERFJFTjsKCQkJCWlhciA9IChvcC0+
YWRkci52YWwgPDwgOCkgJiAweGZmZmZmZjsKCQkJCWR1bW15X2N5Y2xlcyAtPSA4IC8gb3AtPmFk
ZHIuYnVzd2lkdGg7CgkJCX0KCQkJYnJlYWs7CgkuLi4KfQoKV2hlbiBvcC0+Y21kLmJ1c3dpZHRo
ICE9IG9wLT5hZGRyLmJ1c3dpZHRoIGFuZCBvcC0+ZHVtbXkubmN5Y2xlcyBpcwpub24temVybyBi
dXQgbGVzcyB0aGFuIDggLyBvcC0+YWRkci5idXN3aWR0aCAoZm9yIGV4YW1wbGUsIDIgZHVtbXkK
Y3ljbGVzIGluIDEtMi0yIG1vZGUpLCBhdG1lbF9xc3BpX3N1cHBvcnRzX29wKCkgbm93IGFjY2Vw
dHMgdGhlCm9wZXJhdGlvbiwgY2F1c2luZyBhdG1lbF9xc3BpX3NldF9jZmcoKSB0byBwYWNrIG9w
LT5jbWQub3Bjb2RlIGludG8gaWFyCmFuZCB0cmFuc21pdCB0aGUgb3Bjb2RlIG9uIG9wLT5hZGRy
LmJ1c3dpZHRoIGxpbmVzIGluc3RlYWQgb2YKb3AtPmNtZC5idXN3aWR0aCBsaW5lcy4KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEx
MjctbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjItMC01YzkzZjVlNWQ2MzBA
Ym9vdGxpbi5jb20/cGFydD0xMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
