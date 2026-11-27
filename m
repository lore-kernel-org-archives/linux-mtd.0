Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99E606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IukjlwsS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TED4nW9v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tvitHsKlmDbHyrX3c28LFKkBxiPzwv8FtiZU9GxOOZ8=; b=IukjlwsSVD0Ii32xLM+z1l0q6K
	NAdXyHblTe6nQ9HIW5OMXZfmhKwy/Yvfb0tUDhjIsveRHQpGw6WpKvO8/Z8iIANBzZgJP+zcU1kfk
	AvaNdwPPlyN3lbfyg6KmJC9hxv0neGc4bIgJECLHtFRiXO/fDrf/ma0ZOPM3kHRNggeUN+q/0xTcw
	9xDioQr5UFhVxkmgyxbDFxYEeo7/n6dS4Bqjj3MaAq/dX9c5WWkDjY+YlXZBoM+3RCQVHyLbKGFpF
	rldAGIMMlLOn/uVwBOdvj4zg9meEvXtMj3DoItlgeVfW0yVqM8DOU60kiWRTGOGsWhtZVQjg5ZcOF
	p4WDznGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxHY-0000000Gd0C-2Nfa;
	Fri, 27 Nov 2026 14:50:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxHX-0000000Gczg-1Jud;
	Fri, 27 Nov 2026 14:50:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EEB560E2B;
	Fri, 27 Nov 2026 14:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4701F0089B;
	Fri, 27 Nov 2026 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791034;
	bh=gxq3wgw+barjPLXIWEn74CmRmFDc4UPXarLciG8c6xg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TED4nW9vOgPd2OvStCjk2PF00jhZuHuSUvhW879VmLpQmVpXIioWRCoVr0mcM7bcF
	 YVWMtdmXdTlHG28Y+rmPVHxmYB/Z7RG4cgdwOVBdBDLQWpCOhcy40ptKwEmR6UYxu0
	 OaN1zAL2D3arNsLBOpMKLZerpLUPtFATPJy0Oa81PNnhriQcPfDHY3WUV6WxDqGgUw
	 1bF+3AN85o5VC2LjPuU5R0GMsWhDEaXjoIpK2FCMlb9QaViA7MbchUSfHC9EK//uti
	 CLXLy+ainP5AkYjWmCJ9SiAwmhrd6lykH00Sk7jBtKp7xboCkF3EFUIy7eEdzPiWPC
	 lihqnxW6BL9Mw==
Message-ID: <sashiko-outbox-237610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 18/35] spi: nxp-fspi: Consume dummy cycles
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
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-18-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-18-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 14:50:31 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogbnhwLWZzcGk6IExV
VF9EVU1NWV9ERFIgb3BlcmFuZCBoYWx2ZWQgaW4KICBueHBfZnNwaV9wcmVwYXJlX2x1dCgpCi0t
Cgpjb21taXQgMTU5OTIyNTE1N2M2NTFkYTdjMzcyODA1ZWMzMGNmNzJjZmU4YjY5YwpBdXRob3I6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpzcGk6IG54cC1mc3Bp
OiBDb25zdW1lIGR1bW15IGN5Y2xlcyBkaXJlY3RseQoKVGhpcyBjb21taXQgZW5hYmxlcyB0aGUg
ZHVtbXlfY3ljbGVzIGNhcGFiaWxpdHkgaW4gdGhlIE5YUCBGbGV4U1BJIGRyaXZlcgphbmQgcmVw
bGFjZXMgdGhlIGR1bW15IGJ5dGUtdG8tY3ljbGUgY29udmVyc2lvbnMgd2l0aCBvcC0+ZHVtbXku
bmN5Y2xlcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jIGIvZHJp
dmVycy9zcGkvc3BpLW54cC1mc3BpLmMKPiBpbmRleCA2NmNiNThmOTVmZGIxLi5lNmZkZGVkNjdh
MDBlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jCj4gKysrIGIvZHJp
dmVycy9zcGkvc3BpLW54cC1mc3BpLmMKWyAuLi4gXQo+IEBAIC01NjcsOCArNTY3LDcgQEAgc3Rh
dGljIGJvb2wgbnhwX2ZzcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCQly
ZXR1cm4gZmFsc2U7Cj4gIAo+ICAJLyogTWF4IDY0IGR1bW15IGNsb2NrIGN5Y2xlcyBzdXBwb3J0
ZWQgKi8KPiAtCWlmIChvcC0+ZHVtbXkuYnVzd2lkdGggJiYKPiAtCSAgICAob3AtPmR1bW15Lm5i
eXRlcyAqIDggLyBvcC0+ZHVtbXkuYnVzd2lkdGggPiA2NCkpCj4gKwlpZiAob3AtPmR1bW15Lm5j
eWNsZXMgPiA2NCkKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+ICAJLyogTWF4IGRhdGEgbGVuZ3Ro
LCBjaGVjayBjb250cm9sbGVyIGxpbWl0cyBhbmQgYWxpZ25tZW50ICovCj4gQEAgLTY1MiwxNiAr
NjUxLDE1IEBAIHN0YXRpYyB2b2lkIG54cF9mc3BpX3ByZXBhcmVfbHV0KHN0cnVjdCBueHBfZnNw
aSAqZiwKPiAgCQlsdXRpZHgrKzsKPiAgCX0KPiAgCj4gLQkvKiBkdW1teSBieXRlcywgaWYgbmVl
ZGVkICovCj4gLQlpZiAob3AtPmR1bW15Lm5ieXRlcykgewo+ICsJLyogZHVtbXkgY3ljbGVzLCBp
ZiBuZWVkZWQgKi8KPiArCWlmIChvcC0+ZHVtbXkubmN5Y2xlcykgewo+ICAJCWx1dHZhbFtsdXRp
ZHggLyAyXSB8PSBMVVRfREVGKGx1dGlkeCwgb3AtPmR1bW15LmR0ciA/IExVVF9EVU1NWV9ERFIg
OiBMVVRfRFVNTVksCj4gIAkJLyoKPiAgCQkgKiBEdWUgdG8gRmxleFNQSSBjb250cm9sbGVyIGxp
bWl0YXRpb24gbnVtYmVyIG9mIFBBRCBmb3IgZHVtbXkKPiAgCQkgKiBidXN3aWR0aCBuZWVkcyB0
byBiZSBwcm9ncmFtbWVkIGFzIGVxdWFsIHRvIGRhdGEgYnVzd2lkdGguCj4gIAkJICovCj4gIAkJ
CQkJICAgICAgTFVUX1BBRChvcC0+ZGF0YS5idXN3aWR0aCksCj4gLQkJCQkJICAgICAgb3AtPmR1
bW15Lm5ieXRlcyAqIDggLwo+IC0JCQkJCSAgICAgIG9wLT5kdW1teS5idXN3aWR0aCk7Cj4gKwkJ
CQkJICAgICAgb3AtPmR1bW15Lm5jeWNsZXMpOwo+ICAJCWx1dGlkeCsrOwo+ICAJfQoKW1NldmVy
aXR5OiBIaWdoXQpEb2VzIHBhc3Npbmcgb3AtPmR1bW15Lm5jeWNsZXMgZGlyZWN0bHkgdG8gTFVU
X0RVTU1ZX0REUiBoYWx2ZSB0aGUgZHVtbXkKY3ljbGVzIHByb2dyYW1tZWQgaW4gRFRSIG1vZGU/
CgpJbiBEVFIgbW9kZSwgRmxleFNQSSBydW5zIHRoZSBzZXJpYWwgcm9vdCBjbG9jayBhdCAyeCB0
aGUgZmxhc2ggU0NMSyByYXRlCmFuZCBMVVRfRFVNTVlfRERSIGNvdW50cyBERFIgaGFsZi1jeWNs
ZXMgKDIgKiBuY3ljbGVzKS4gIFByZXZpb3VzbHksIERUUgpjYWxsZXJzIGRvdWJsZWQgb3AtPmR1
bW15Lm5ieXRlcyB0byBhY2NvdW50IGZvciB0d28gdHJhbnNmZXJzIHBlciBjbG9jaywKYW5kIG9w
LT5kdW1teS5uYnl0ZXMgKiA4IC8gb3AtPmR1bW15LmJ1c3dpZHRoIGludGVudGlvbmFsbHkgZGlk
IG5vdCBkaXZpZGUKYnkgMiwgeWllbGRpbmcgMiAqIG5jeWNsZXMuICBXaXRoIC5kdW1teV9jeWNs
ZXMgc2V0LApzcGlfbWVtX2R1bW15X2J5dGVzX3RvX2N5Y2xlcygpIGRpdmlkZXMgYnkgMiAqIG9w
LT5kdW1teS5idXN3aWR0aCB3aGVuCm9wLT5kdW1teS5kdHIgaXMgdHJ1ZSAoYW5kIGRpcmVjdCBu
Y3ljbGVzIGNhbGxlcnMgcGFzcyBmdWxsIFNDTEsgY3ljbGVzKSwKc28gbnhwX2ZzcGlfcHJlcGFy
ZV9sdXQoKSBub3cgcHJvZ3JhbXMgaGFsZiB0aGUgcmVxdWlyZWQgTFVUX0RVTU1ZX0REUgpvcGVy
YW5kIGFuZCBicmVha3MgRFRSIGZsYXNoIHJlYWRzLgoKRm9yIHRoZSBzYW1lIHJlYXNvbiwgdGhl
ID4gNjQgY2hlY2sgaW4gbnhwX2ZzcGlfc3VwcG9ydHNfb3AoKSBubyBsb25nZXIKYWNjb3VudHMg
Zm9yIHRoZSAyeCBmYWN0b3Igd2hlbiBvcC0+ZHVtbXkuZHRyIGlzIHNldC4KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjctbWFj
cm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjItMC01YzkzZjVlNWQ2MzBAYm9vdGxp
bi5jb20/cGFydD0xOAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
