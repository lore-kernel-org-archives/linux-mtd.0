Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8A606A682
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bSM60WPu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POHtSeP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m5X5c0p2aFISwqGR2rIuYV4GkPCyIgyigb8WyAHNJks=; b=bSM60WPuvSi5b3R+vChOcTCVE/
	9jIU4hV0xNDIbckjDHxFxIY5agJULJAhmY1IFiCPExoJJod7kiX5cXbusLls5vp/8xwJpjfVaHZmW
	rUEI/yU4GsWfC03nn5acWCZ/j+inrg3qI303Em85MuyTNINl2LWFbUy69mvyN1k+nRHm2tUOEA2cT
	PE53Xoys2lDQpJ73OW2ijFfD6dEVBcvwW7Tda7D3foVqk+NT85ufWPswZTwV0moq8hQs6qPe73o+p
	0Jsd4OkjkhJN2e5zNVxbIn/ZEofo/yK3JMmzRyv5P8nP2y6v/YBvLWJKyAvxeUKETGJEm+LCGX1B6
	478T+67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHOS-0000000Awv2-3QBm;
	Wed, 25 Nov 2026 18:06:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHOO-0000000AwuU-3Xu0;
	Wed, 25 Nov 2026 18:06:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3283363543;
	Wed, 25 Nov 2026 18:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9CF1F000CA;
	Wed, 25 Nov 2026 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630011;
	bh=HHdRWEBXfDf2cU3cyNr1uxBhFCBOQ6B2mKFsYYkFHI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POHtSeP38iBwVU4uIlKqOXshQgc3LsBaaERjLwcH2RsVnaYmjkBcgAPTcibjLgHxs
	 Snxo/B+Tww1zWJC8odpSgWznqQIeCzlVuAc1zjlWRey3QNegoQrF7TIMylbndFBYrU
	 wUOZokfikFQUMUrffOjALxd1X8WrDJpOcZjt79/d1eclXpPWqRsmXQMEhaThW2j8c5
	 uARSuf9sTzRrCLiVd8UtGEsmLh40tfQycYuqWTuOFLov9JVnkjOkfHuw7p6taiz82n
	 TZA/4MoUjlF0liNKsYVqy8TVcqKILadVz6R1eX6WeOC7sHD6kmZEhJ+B0ThyLKhuA3
	 c4tuOGBl4ooSQ==
Message-ID: <sashiko-outbox-233905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/16] spi: microchip-core-qspi: Consume dummy
 cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-9-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-9-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:06:50 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBzcGk6IG1pY3JvY2hpcC1j
b3JlLXFzcGk6IGR1bW15X2N5Y2xlcyBkcm9wcyBkdW1teSBwaGFzZSBvbgogIEdQSU8tQ1MgZmFs
bGJhY2sKLSBbTWVkaXVtXSBzcGk6IG1pY3JvY2hpcC1jb3JlLXFzcGk6IHVuY2hlY2tlZCBuY3lj
bGVzIHNoaWZ0IGluCiAgbWNocF9jb3JlcXNwaV9jb25maWdfb3AoKQotLQoKY29tbWl0IDIzMTc5
MTEzMDlhOWEwZDkwZmMyMTM0N2M1M2EzYjdjMjc5N2ZkZTQKQXV0aG9yOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKc3BpOiBtaWNyb2NoaXAtY29yZS1xc3BpOiBD
b25zdW1lIGR1bW15IGN5Y2xlcyBkaXJlY3RseQoKVGhpcyBjb21taXQgYWR2ZXJ0aXNlcyB0aGUg
ZHVtbXlfY3ljbGVzIGNhcGFiaWxpdHkgaW4KbWNocF9jb3JlcXNwaV9tZW1fY2FwcyBhbmQgdXNl
cyBvcC0+ZHVtbXkubmN5Y2xlcyBkaXJlY3RseSBpbgptY2hwX2NvcmVxc3BpX2NvbmZpZ19vcCgp
IGluc3RlYWQgb2YgY29udmVydGluZyBvcC0+ZHVtbXkubmJ5dGVzLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zcGkvc3BpLW1pY3JvY2hpcC1jb3JlLXFzcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS1t
aWNyb2NoaXAtY29yZS1xc3BpLmMKPiBpbmRleCBjMGVhNjUwMTRkMmVhLi4yZmMxZGY3MzgwNjIw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1taWNyb2NoaXAtY29yZS1xc3BpLmMKPiAr
KysgYi9kcml2ZXJzL3NwaS9zcGktbWljcm9jaGlwLWNvcmUtcXNwaS5jCj4gQEAgLTQyMCw3ICs0
MjAsNiBAQCBzdGF0aWMgaW50IG1jaHBfY29yZXFzcGlfc2V0dXBfY2xvY2soc3RydWN0IG1jaHBf
Y29yZXFzcGkgKnFzcGksIHN0cnVjdCBzcGlfZGV2aQo+ICAKPiAgc3RhdGljIHZvaWQgbWNocF9j
b3JlcXNwaV9jb25maWdfb3Aoc3RydWN0IG1jaHBfY29yZXFzcGkgKnFzcGksIGNvbnN0IHN0cnVj
dCBzcGlfbWVtX29wICpvcCkKPiAgewo+IC0JdTMyIGlkbGVfY3ljbGVzID0gMDsKPiAgCWludCB0
b3RhbF9ieXRlcywgY21kX2J5dGVzLCBmcmFtZXMsIGN0cmw7Cj4gIAo+ICAJY21kX2J5dGVzID0g
b3AtPmNtZC5uYnl0ZXMgKyBvcC0+YWRkci5uYnl0ZXM7Cj4gQEAgLTQ1OSwxMSArNDU4LDcgQEAg
c3RhdGljIHZvaWQgbWNocF9jb3JlcXNwaV9jb25maWdfb3Aoc3RydWN0IG1jaHBfY29yZXFzcGkg
KnFzcGksIGNvbnN0IHN0cnVjdCBzcGkKPiAgCXdyaXRlbF9yZWxheGVkKGZyYW1lcywgcXNwaS0+
cmVncyArIFJFR19GUkFNRVNVUCk7Cj4gIAlmcmFtZXMgPSB0b3RhbF9ieXRlcyAmIEJZVEVTTE9X
RVJfTUFTSzsKPiAgCWZyYW1lcyB8PSBjbWRfYnl0ZXMgPDwgRlJBTUVTX0NNREJZVEVTX1NISUZU
Owo+IC0KPiAtCWlmIChvcC0+ZHVtbXkuYnVzd2lkdGgpCj4gLQkJaWRsZV9jeWNsZXMgPSBvcC0+
ZHVtbXkubmJ5dGVzICogOCAvIG9wLT5kdW1teS5idXN3aWR0aDsKPiAtCj4gLQlmcmFtZXMgfD0g
aWRsZV9jeWNsZXMgPDwgRlJBTUVTX0lETEVfU0hJRlQ7Cj4gKwlmcmFtZXMgfD0gb3AtPmR1bW15
Lm5jeWNsZXMgPDwgRlJBTUVTX0lETEVfU0hJRlQ7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQ2FuIG9w
LT5kdW1teS5uY3ljbGVzIDw8IEZSQU1FU19JRExFX1NISUZUIG92ZXJmbG93IHRoZSA0LWJpdApG
UkFNRVNfSURMRV9NQVNLIGZpZWxkIGluIFJFR19GUkFNRVM/Cgpkcml2ZXJzL3NwaS9zcGktbWlj
cm9jaGlwLWNvcmUtcXNwaS5jOgogICAgI2RlZmluZSBGUkFNRVNfSURMRV9NQVNLCUdFTk1BU0so
MjksIDI2KQogICAgI2RlZmluZSBGUkFNRVNfSURMRV9TSElGVAkyNgogICAgI2RlZmluZSBGUkFN
RVNfRkxBR0JZVEUJCUJJVCgzMCkKICAgICNkZWZpbmUgRlJBTUVTX0ZMQUdXT1JECQlCSVQoMzEp
CgptY2hwX2NvcmVxc3BpX3N1cHBvcnRzX29wKCkgZG9lcyBub3QgcmVqZWN0IG9wLT5kdW1teS5u
Y3ljbGVzID4gMTUuCldoZW4gYSBmbGFzaCBvcGVyYXRpb24gcmVxdWVzdHMgbW9yZSB0aGFuIDE1
IGR1bW15IGN5Y2xlcyAoc3VjaCBhcyBTRkRQCkJGUFQgcmVhZCBtb2RlcyB3aXRoIDE2IG9yIDIw
IGN5Y2xlcyksIHNoaWZ0aW5nIHU4IG9wLT5kdW1teS5uY3ljbGVzIChhcyBhCnNpZ25lZCBpbnQp
IGJ5IDI2IG92ZXJmbG93cyBpbnRvIEZSQU1FU19GTEFHQllURSBhbmQgRlJBTUVTX0ZMQUdXT1JE
IChhbmQKaXMgdW5kZWZpbmVkIGJlaGF2aW9yIHdoZW4gbmN5Y2xlcyA+PSAzMiksIHdoaWxlIHRy
dW5jYXRpbmcgdGhlIHByb2dyYW1tZWQKaWRsZSBjeWNsZXMgdG8gb3AtPmR1bW15Lm5jeWNsZXMg
JiAweGYuCgpTaG91bGQgbWNocF9jb3JlcXNwaV9zdXBwb3J0c19vcCgpIHJlamVjdCBvcC0+ZHVt
bXkubmN5Y2xlcyA+IDE1PwoKPiAgCWN0cmwgPSByZWFkbF9yZWxheGVkKHFzcGktPnJlZ3MgKyBS
RUdfQ09OVFJPTCk7Cj4gIAo+ICAJaWYgKGN0cmwgJiBDT05UUk9MX01PREUxMl9NQVNLKQo+IEBA
IC02MDEsNiArNTk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1f
b3BzIG1jaHBfY29yZXFzcGlfbWVtX29wcyA9IHsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c3BpX2NvbnRyb2xsZXJfbWVtX2NhcHMgbWNocF9jb3JlcXNwaV9tZW1fY2FwcyA9IHsKPiAgCS5w
ZXJfb3BfZnJlcSA9IHRydWUsCj4gKwkuZHVtbXlfY3ljbGVzID0gdHJ1ZSwKPiAgfTsKCltTZXZl
cml0eTogSGlnaF0KRG9lcyBzZXR0aW5nIC5kdW1teV9jeWNsZXMgPSB0cnVlIGRyb3AgdGhlIGR1
bW15IHBoYXNlIHdoZW4gYSBTUEkgbWVtb3J5CmRldmljZSB1c2VzIGEgR1BJTyBjaGlwLXNlbGVj
dD8KCm1jaHBfY29yZXFzcGlfcHJvYmUoKSBzZXRzIGN0bHItPnVzZV9ncGlvX2Rlc2NyaXB0b3Jz
ID0gdHJ1ZS4gIEluCnNwaV9tZW1fZXhlY19vcCgpLCBzcGlfbWVtX2NvbnZlcnRfZHVtbXkoKSBy
dW5zIGJlZm9yZSB0aGUKIXNwaV9nZXRfY3NncGlvZChtZW0tPnNwaSwgMCkgY2hlY2s6Cgpkcml2
ZXJzL3NwaS9zcGktbWVtLmM6c3BpX21lbV9leGVjX29wKCkgewogICAgLi4uCglzcGlfbWVtX2Nv
bnZlcnRfZHVtbXkobWVtLCBvcCk7CiAgICAuLi4KCWlmIChjdGxyLT5tZW1fb3BzICYmIGN0bHIt
Pm1lbV9vcHMtPmV4ZWNfb3AgJiYgIXNwaV9nZXRfY3NncGlvZChtZW0tPnNwaSwgMCkpIHsKICAg
IC4uLgoJaWYgKG9wLT5kdW1teS5uYnl0ZXMpIHsKCQltZW1zZXQodG1wYnVmICsgb3AtPmFkZHIu
bmJ5dGVzICsgMSwgMHhmZiwgb3AtPmR1bW15Lm5ieXRlcyk7CgkJeGZlcnNbeGZlcnBvc10udHhf
YnVmID0gdG1wYnVmICsgb3AtPmFkZHIubmJ5dGVzICsgMTsKCQl4ZmVyc1t4ZmVycG9zXS5sZW4g
PSBvcC0+ZHVtbXkubmJ5dGVzOwogICAgLi4uCn0KCldpdGggLmR1bW15X2N5Y2xlcyA9IHRydWUs
IHNwaV9tZW1fY29udmVydF9kdW1teSgpIHN0b3JlcyB0aGUgZHVtbXkgcGhhc2UKaW4gb3AtPmR1
bW15Lm5jeWNsZXMgYW5kIHNldHMgb3AtPmR1bW15Lm5ieXRlcyA9IDAuICBXaGVuIGEgR1BJTyBD
UyBpcwp1c2VkLCBzcGlfbWVtX2V4ZWNfb3AoKSBmYWxscyBiYWNrIHRvIHNwaV9zeW5jKCksIHdo
aWNoIG9ubHkgY3JlYXRlcyBhCmR1bW15IHRyYW5zZmVyIHdoZW4gb3AtPmR1bW15Lm5ieXRlcyBp
cyBub24temVybywgd2hpbGUKbWNocF9jb3JlcXNwaV9wcmVwYXJlX21lc3NhZ2UoKSBoYXJkY29k
ZXMgaWRsZV9jeWNsZXMgPSAwLiAgQXMgYSByZXN1bHQsCm5vIGR1bW15IGN5Y2xlcyBhcmUgdHJh
bnNtaXR0ZWQgb24gdGhlIGJ1cywgY29ycnVwdGluZyBmbGFzaCByZWFkcyBvbgpib2FyZHMgd2l0
aCBHUElPIGNoaXAtc2VsZWN0cy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1l
bS1jeWNsZXMtdjEtMC1mZDAzNjQwMmZkMzdAYm9vdGxpbi5jb20/cGFydD05CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
