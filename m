Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCC606A321
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4guAjjvh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBrTFKIH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GdlcsNYIQa6PN7IlfGgYLuZ2nPQVD3bvcmBJUMUW3a4=; b=4guAjjvhXJAN52acSNBqBgGgnt
	EnDpw3U21KrQ8Y8LPD3dV3rhkR+WKJDEV0FAoTP7agPOlXymNKPlAZbtnfT8hDieMdpdIZig2esiM
	MyYUDMFeT9vsZ6UOHzfC/4rINMyOEXi8hXIy9mZQ6q+ZMyzJRYro9+BwDvHZQZY6vsEVYpbakOU+t
	BDZVfVgn3oBcbD21bw5UU/6nYvUtje+p07EXeUNSXBLsorEd95ovD1xlcswTwAq4EcLQz5cNB2bK4
	al2oOgLvyJsQGMLzX8obT5n8oCyLEOaiATs8Ogg0aqFWSGnFvyeXObM4qL/pDg0WxCKxTMAjuTWU5
	3Ed7ZXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxAJ-0000000Gbna-0Q1e;
	Fri, 27 Nov 2026 14:43:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxAI-0000000GbnL-04xN;
	Fri, 27 Nov 2026 14:43:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B907D441FF;
	Fri, 27 Nov 2026 14:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE34F1F000C1;
	Fri, 27 Nov 2026 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795790585;
	bh=oWWqZ5Ga7+BMiSg1Mh0sLjfADGHTNfzDFkajJz6BULc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBrTFKIHvYqjGOEJLKQZ0OLNVFYSah/uA5luM2GA5RC4lVw/7Iaq1Ku63HwmYIEmI
	 WKLk/bHV6VPCTA7/uGCwTRTnDOKv+rtuwro/VRTrG7fcw5MNRN1wO2b8gT8xGM8Dxk
	 X9Th/SEF4GsQPESx0W3JmjVRPqlhUBHq/10Rs/8Bdy2W1qoLT3J41GeTtGYcmUHyqe
	 F0IErYNpbOmzEsXXO+VQMVbIZ+Bsr5f3n7F04U+76BvrxKpQ/0gWNxjpIyYlgTjD55
	 A3dCWp3fRg/bg1KoFMsQR3ox4q7hZtlAhubPNK3lqMfKhA9WedjWSqAVMiTEoP6+Y4
	 OsychnkcX6jsg==
Message-ID: <sashiko-outbox-237589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 06/35] spi: spi-mem: Add support for dummy cycles
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
In-Reply-To: <20261127-macronix-upstreaming-spi-mem-cycles-v2-6-5c93f5e5d630@bootlin.com>
References: <20261127-macronix-upstreaming-spi-mem-cycles-v2-0-5c93f5e5d630@bootlin.com>
 <20261127-macronix-upstreaming-spi-mem-cycles-v2-6-5c93f5e5d630@bootlin.com>
Date: Fri, 27 Nov 2026 14:43:03 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBzcGktbWVtOiBt
aXNzaW5nIGR1bW15Lm5jeWNsZXMgY2hlY2tzIGluCiAgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRz
X29wKCkKLS0KCmNvbW1pdCA1Mzk5NjU0NzIxMTk1YmZmNDkzMDNiYzYxOWEwNGRiMjkwYzIyYzUy
CkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCnNwaTog
c3BpLW1lbTogQWRkIHN1cHBvcnQgZm9yIGR1bW15IGN5Y2xlcwoKVGhpcyBjb21taXQgYWRkcyBh
IGR1bW15Lm5jeWNsZXMgZmllbGQgdG8gc3RydWN0IHNwaV9tZW1fb3AgYW5kIGEKZHVtbXlfY3lj
bGVzIGNhcGFiaWxpdHkgdG8gc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9jYXBzLCBjb252ZXJ0
aW5nCmJldHdlZW4gZHVtbXkgYnl0ZXMgYW5kIGR1bW15IGNsb2NrIGN5Y2xlcyBkZXBlbmRpbmcg
b24gY29udHJvbGxlcgpjYXBhYmlsaXRpZXMuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMjA5MTExNzQ1NTEuNjUzNTk5LTEtc2VyZ2l1Lm1vZ2FAbWljcm9jaGlwLmNvbS8K
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTE1MTM0MTU4LjE5OTA4LTEt
cHJhdHl1c2hAa2VybmVsLm9yZy8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1tZW0u
YyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+IGluZGV4IGExZjEyOWM0NzY5ODQuLjE2NDIzODhi
NzAwNDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gKysrIGIvZHJpdmVy
cy9zcGkvc3BpLW1lbS5jCgpbIC4uLiBdCgo+ICsvKgo+ICsgKiBDb250cm9sbGVycyBlaXRoZXIg
cHJvZ3JhbSB0aGUgZHVtbXkgcGhhc2UgaW4gY2xvY2sgY3ljbGVzIG9yIGluIHdob2xlCj4gKyAq
IGJ5dGVzLiBDb252ZXJ0IHRoZSByZXByZXNlbnRhdGlvbiB1c2VkIGJ5IHRoZSBvcGVyYXRpb24g
dG8gdGhlIG9uZSB0aGUKPiArICogY29udHJvbGxlciBleHBlY3RzLgo+ICsgKgo+ICsgKiBSZXR1
cm46IDAgaWYgdGhlIG9wZXJhdGlvbiBpcyBsb3NzbGVzcywgLUVPUE5PVFNVUFAgb3RoZXJ3aXNl
Lgo+ICsgKi8KPiArc3RhdGljIGludCBzcGlfbWVtX2NvbnZlcnRfZHVtbXkoc3RydWN0IHNwaV9t
ZW0gKm1lbSwgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpX2NvbnRy
b2xsZXIgKmN0bHIgPSBtZW0tPnNwaS0+Y29udHJvbGxlcjsKPiArCWludCBuOwo+ICsKPiArCWlm
IChvcC0+ZHVtbXkubmN5Y2xlcykgewo+ICsJCWlmIChzcGlfbWVtX2NvbnRyb2xsZXJfaXNfY2Fw
YWJsZShjdGxyLCBkdW1teV9jeWNsZXMpKQo+ICsJCQlyZXR1cm4gMDsKPiArCj4gKwkJbiA9IHNw
aV9tZW1fZHVtbXlfY3ljbGVzX3RvX2J5dGVzKG9wKTsKPiArCQlpZiAobiA8IDApCj4gKwkJCXJl
dHVybiBuOwo+ICsKPiArCQlvcC0+ZHVtbXkubmJ5dGVzID0gbjsKPiArCQlvcC0+ZHVtbXkubmN5
Y2xlcyA9IDA7Cj4gKwl9IGVsc2UgaWYgKG9wLT5kdW1teS5uYnl0ZXMpIHsKPiArCQlpZiAoIXNw
aV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIGR1bW15X2N5Y2xlcykpCj4gKwkJCXJl
dHVybiAwOwo+ICsKPiArCQluID0gc3BpX21lbV9kdW1teV9ieXRlc190b19jeWNsZXMob3ApOwo+
ICsJCWlmIChuIDwgMCkKPiArCQkJcmV0dXJuIG47Cj4gKwo+ICsJCW9wLT5kdW1teS5uY3ljbGVz
ID0gbjsKPiArCQlvcC0+ZHVtbXkubmJ5dGVzID0gMDsKPiArCj4gKwkJcmV0dXJuIDA7Cj4gKwl9
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KClsgLi4uIF0KCj4gQEAgLTMyMSw2ICs0NDgsOSBAQCBi
b29sIHNwaV9tZW1fc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3Qgc3RydWN0
IHNwaV9tZW1fb3AgKm9wKQo+ICAJaWYgKHNwaV9tZW1fY2hlY2tfb3AoJmV2YWxfb3ApKQo+ICAJ
CXJldHVybiBmYWxzZTsKPiAgCj4gKwlpZiAoc3BpX21lbV9jb252ZXJ0X2R1bW15KG1lbSwgJmV2
YWxfb3ApKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gIAlyZXR1cm4gc3BpX21lbV9pbnRlcm5h
bF9zdXBwb3J0c19vcChtZW0sICZldmFsX29wKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChz
cGlfbWVtX3N1cHBvcnRzX29wKTsKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgc3BpX21lbV9k
ZWZhdWx0X3N1cHBvcnRzX29wKCkgYWxzbyBjaGVjayBvcC0+ZHVtbXkubmN5Y2xlcyBpbiBpdHMK
ZHVtbXktcGhhc2UgRFRSIGFuZCBidXN3aWR0aCBjaGVja3M/CgpXaGVuIGEgY29udHJvbGxlciBh
ZHZlcnRpc2VzIGR1bW15X2N5Y2xlcywgc3BpX21lbV9jb252ZXJ0X2R1bW15KCkgbGVhdmVzCnRo
ZSBkdW1teSBkdXJhdGlvbiBpbiBvcC0+ZHVtbXkubmN5Y2xlcyB3aXRoIG9wLT5kdW1teS5uYnl0
ZXMgc2V0IHRvIDAKYmVmb3JlIHNwaV9tZW1fc3VwcG9ydHNfb3AoKSBhbmQgc3BpX21lbV9leGVj
X29wKCkgY2FsbApzcGlfbWVtX2ludGVybmFsX3N1cHBvcnRzX29wKCkuICBCZWNhdXNlIHNwaV9t
ZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIG9ubHkKdGVzdHMgb3AtPmR1bW15Lm5ieXRlczoKCmRy
aXZlcnMvc3BpL3NwaS1tZW0uYzpzcGlfbWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKSB7CgkuLi4K
CS8qIHhTLXhTLXhELXhTIGlzIG5vdCBhbGxvd2VkICovCglpZiAob3AtPmR1bW15Lm5ieXRlcyAm
JiBvcC0+ZHVtbXkuZHRyKSB7CgkJaWYgKG9wLT5kYXRhLm5ieXRlcyAmJiAhb3AtPmRhdGEuZHRy
KQoJCQlyZXR1cm4gZmFsc2U7Cgl9CgoJLyogQnVzIHdpZHRoIGNhbiBvbmx5IGdyb3cgYWNyb3Nz
IHBoYXNlcywgaWUuIDEtNC0xLCBvciAxLTgtNCBhcmUgbm90IGFsbG93ZWQgKi8KCWlmICgob3At
PmFkZHIubmJ5dGVzICYmIG9wLT5hZGRyLmJ1c3dpZHRoIDwgb3AtPmNtZC5idXN3aWR0aCkgfHwK
CSAgICAob3AtPmR1bW15Lm5ieXRlcyAmJiBvcC0+ZHVtbXkuYnVzd2lkdGggPCBvcC0+Y21kLmJ1
c3dpZHRoKSB8fAoJICAgIChvcC0+ZGF0YS5uYnl0ZXMgJiYgb3AtPmRhdGEuYnVzd2lkdGggPCBv
cC0+Y21kLmJ1c3dpZHRoKSB8fAoJICAgIChvcC0+YWRkci5uYnl0ZXMgJiYgb3AtPmR1bW15Lm5i
eXRlcyAmJiBvcC0+ZHVtbXkuYnVzd2lkdGggPCBvcC0+YWRkci5idXN3aWR0aCkgfHwKCSAgICAo
b3AtPmFkZHIubmJ5dGVzICYmIG9wLT5kYXRhLm5ieXRlcyAmJiBvcC0+ZGF0YS5idXN3aWR0aCA8
IG9wLT5hZGRyLmJ1c3dpZHRoKSB8fAoJICAgIChvcC0+ZHVtbXkubmJ5dGVzICYmIG9wLT5kYXRh
Lm5ieXRlcyAmJiBvcC0+ZGF0YS5idXN3aWR0aCA8IG9wLT5kdW1teS5idXN3aWR0aCkpCgkJcmV0
dXJuIGZhbHNlOwoJLi4uCn0KCnRob3NlIGNoZWNrcyBhcmUgc2tpcHBlZCB3aGVuZXZlciBvcC0+
ZHVtbXkubmN5Y2xlcyBpcyB1c2VkLCBhbGxvd2luZwpvcGVyYXRpb25zIHdpdGggaW52YWxpZCBE
VFIgdHJhbnNpdGlvbnMgb3IgZGVjcmVhc2luZyBidXN3aWR0aCBhY3Jvc3MgdGhlCmR1bW15IHBo
YXNlIHRvIHBhc3Mgc3BpX21lbV9zdXBwb3J0c19vcCgpIGFuZCByZWFjaCBjb250cm9sbGVyIGV4
ZWN1dGlvbi4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjExMjctbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjIt
MC01YzkzZjVlNWQ2MzBAYm9vdGxpbi5jb20/cGFydD02CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
