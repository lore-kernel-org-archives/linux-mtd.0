Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EEC606A339
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nxw+xaNw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eU5PjGfK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YkMEC9SHSGqExJdzrEXX3D2uWT3JhvVJd9vTSeA9dEk=; b=Nxw+xaNwTsBxmXhKPDw+VX2mOs
	ETvF9zHlmHJA9CZRSq+8A/Dj3ldyJTKiYXME2JGyhnb1ymtfZsp3cAc6hykinTWbQfdNpA6Eesqm2
	gCvG/X+PSFmqiZ0WV7vOyhtkO/ZweSOGPfhaxcJPikdRXF903Z0TUtFmqygRA+nQdFfqAnBOklvGI
	ovgRB5ELYWOdUWsISyAFKaHTo/WxfGHuNf6ipue5oS722hEg2sXpIyJFVnj0t0s/1IGp6GqEK/kVU
	JfrAtASxSyafgZcRZAHRfargStUFEeoAmkgxGwhDbrRCThkFPDhQ+aoFCwrQkyNn3rq6l/8hhzlyH
	W7pNQkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs6W-0000000FPHf-41Ci;
	Fri, 27 Nov 2026 09:18:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs6R-0000000FPEq-0VVR;
	Fri, 27 Nov 2026 09:18:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDA5F4E41787;
	Fri, 27 Nov 2026 09:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DB3C6049C;
	Fri, 27 Nov 2026 09:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8576D11E69295;
	Fri, 27 Nov 2026 10:18:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qefky8DlOTxPLdU0/wjWVMxmJw9tcsyvpnNkmobea1s=;
	b=eU5PjGfK1Jl0gedKPU+OWMgLDwNMSEJI7XN2PpMliih5+m/3v/15bPtoXKqnsIg1adOG9b
	CX+1sL8sBWMl8FCR2Q1oZXjeuEazaHOJF7d0DBG0D4OK0chVYD9dL3txls4r1kGcE9HATF
	G9eGFbs5Ldi1vJ/asLwHUmi3vbXWtdFbVeGH+JeyOa7gLemLsls7CTjOCUskn3q7I2yp7x
	zDpxxm7HjFc9pvXIJ6jOKHdFsylL0Xww2reWHt31RQuZ65TBRg3s4SFFRHa1kWrHm6/OWp
	oHUl7ffFwhYj/ayjOmKF90LDZzTRdFAyout1I03RP2ifRDoc32vCilMejmHuTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Feng Chen <feng.chen@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
In-Reply-To: <20261127084643.ekeao335mv5n5kow@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:46:43 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
	<20261127084643.ekeao335mv5n5kow@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:18:33 +0100
Message-ID: <87bj7avdhy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011847_479774_E7F128A3 
X-CRM114-Status: GOOD (  18.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8sCgo+IE9uIFdlZCwgTm92IDI1LCAyMDI2IGF0IDA2OjUxOjE1UE0gKzAxMDAsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4+IFNvbWUgbWl4ZWQgbW9kZSBvcGVyYXRpb25zIChzdWNoIGFzIDFT
LXhELXlEKSB3aWxsIGJlIGZsYWdnZWQgd2l0aAo+PiBvcF9pc19kdHIgYnV0IHdpbGwgbm90IGVu
dGVyIHRoZSBPRFRSIGNoZWNrcy4gQXMgYSByZXN1bHQsIHRoZSBudW1iZXIgb2YKPj4gY29tbWFu
ZCBieXRlcyB3aWxsIG5ldmVyIGJlIGNoZWNrZWQuCj4+IAo+PiBSZW9yZ2FuaXplIGEgbGl0dGxl
IGJpdCB0aGlzIGhlbHBlcjoKPj4gLSBJZiB0aGUgb3BlcmF0aW9uIGNvbnRhaW5zIGEgRFRSIHBo
YXNlLCBzYW5pdGl6ZSBpdC4KPj4gLSBUaGVuIHNhbml0aXplIHRoZSBvcCwgc2hvdWxkIGl0IGJl
Ogo+PiAgIC0gT0RUUiAoOEQtOEQtOEQpCj4+ICAgLSBhbnl0aGluZyBlbHNlCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvc3BpL3NwaS1tZW0uYyB8IDI4ICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMgYi9kcml2ZXJzL3Nw
aS9zcGktbWVtLmMKPj4gaW5kZXggODA0N2I3NTA4YzhkLi5jNjRlOTA2YmE5MTkgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiArKysgYi9kcml2ZXJzL3NwaS9zcGktbWVt
LmMKPj4gQEAgLTE3MCw2ICsxNzAsNyBAQCBib29sIHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19v
cChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+PiAgCXN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RsciA9
IG1lbS0+c3BpLT5jb250cm9sbGVyOwo+PiAgCWJvb2wgb3BfaXNfZHRyID0KPj4gIAkJb3AtPmNt
ZC5kdHIgfHwgb3AtPmFkZHIuZHRyIHx8IG9wLT5kdW1teS5kdHIgfHwgb3AtPmRhdGEuZHRyOwo+
PiArCWJvb2wgb3BfaXNfb2R0ciA9IG9wLT5jbWQuZHRyICYmIG9wLT5jbWQuYnVzd2lkdGggPT0g
ODsKPj4gIAo+PiAgCWlmIChvcF9pc19kdHIpIHsKPj4gIAkJaWYgKCFzcGlfbWVtX2NvbnRyb2xs
ZXJfaXNfY2FwYWJsZShjdGxyLCBkdHIpICYmICFjdGxyLT5kdHJfY2FwcykKPj4gQEAgLTE3Nywy
MyArMTc4LDIyIEBAIGJvb2wgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKHN0cnVjdCBzcGlf
bWVtICptZW0sCj4+ICAKPj4gIAkJaWYgKG9wLT5kYXRhLnN3YXAxNiAmJiAhc3BpX21lbV9jb250
cm9sbGVyX2lzX2NhcGFibGUoY3Rsciwgc3dhcDE2KSkKPj4gIAkJCXJldHVybiBmYWxzZTsKPj4g
Kwl9Cj4+ICAKPj4gLQkJLyogRXh0cmEgOEQtOEQtOEQgbGltaXRhdGlvbnMgKi8KPj4gLQkJaWYg
KG9wLT5jbWQuZHRyICYmIG9wLT5jbWQuYnVzd2lkdGggPT0gOCkgewo+PiAtCQkJaWYgKG9wLT5j
bWQubmJ5dGVzICE9IDIpCj4+IC0JCQkJcmV0dXJuIGZhbHNlOwo+PiAtCj4+IC0JCQlpZiAoKG9w
LT5hZGRyLm5ieXRlcyAlIDIpIHx8Cj4+IC0JCQkgICAgKG9wLT5kdW1teS5uYnl0ZXMgJSAyKSB8
fAo+PiAtCQkJICAgIChvcC0+ZGF0YS5uYnl0ZXMgJSAyKSkgewo+PiAtCQkJCWRldl9lcnIoJmN0
bHItPmRldiwKPj4gLQkJCQkJIkV2ZW4gYnl0ZSBudW1iZXJzIG5vdCBhbGxvd2VkIGluIG9jdGFs
IERUUiBvcGVyYXRpb25zXG4iKTsKPj4gLQkJCQlyZXR1cm4gZmFsc2U7Cj4+IC0JCQl9Cj4+IC0J
CX0KPj4gLQl9IGVsc2Ugewo+PiArCWlmICghb3BfaXNfb2R0cikgewo+PiAgCQlpZiAob3AtPmNt
ZC5uYnl0ZXMgIT0gMSkKPj4gIAkJCXJldHVybiBmYWxzZTsKPgo+IEhpIE1pcXVlbCwKPgo+IFNv
IHRoaXMgY2hhbmdlIG1lYW5zIG5vIG5ieXRlcyBsaW1pdGF0aW9uIGZvciBtaXhlZCBtb2RlIG9w
YXJhdGlvbnMsIHN1Y2ggYXMgMVMtMUQtOEQuIElzIGl0IGNvcnJlY3Q/Cj4gSSBnbyB0aHJvdWdo
IHNwaS1ub3IgYW5kIHNwaS1uYW5kIGRyaXZlciwgc2VlbXMgZm9yIHNwaS1ub3IsIGZvciBEVFIg
bW9kZSwgaXQgb25seSBzdXBwb3J0IDhELThELThEIG1vZGUsCj4gYnV0IGZvciBzcGktbmFuZCwg
SSBub3RpY2Ugc29tZSB3aW5ib25kIFczNU4gY2hpcHMgZGlkIHN1cHBvcnQgbm90IG9ubHkgOEQt
OEQtOEQgbW9kZSwgYnV0IGFsc28gc29tZSBtaXhlZAo+IG1vZGUsIGluY2x1ZGluZyAxUy0xRC04
RC4gRG9lcyB0aGlzIDFTLTFELThEIG1vZGUgcmVhbGx5IGhhcyBubyBzdWNoIGxpbWl0YXRpb24g
Zm9yIGFkZHJlc3MgYW5kIGRhdGEgbGVuZ3RoPwo+IEFkZHJlc3MgYW5kIGRhdGEgYXJlIGluZGVl
ZCBpbiBEVFIgbW9kZS4KClRoYXQgaXMgYSB2ZXJ5IGdvb2QgcG9pbnQuIEkgZG9uJ3QgdGhpbmsg
dGhlIHNhbml0aXplciBldmVyIGRpZCBjaGVjawp0aGF0IHRob3VnaC4gSSBiZWxpZXZlIHdlIHNo
b3VsZCBpbiB0aGUgZW5kIGhhdmUgYSBtb3JlICJwZXItcGhhc2UiCmFwcHJvYWNoLCB3aGVyZSB3
ZSBjaGVjayBhbGwgdGhlc2UgaW5kaXZpZHVhbGx5LgoKVGhlcmUgaXMgYWxzbyBhbiBpbXBsaWNp
dCBhc3N1bXB0aW9uIHRoYXQgYnVzd2lkdGggd2lsbCBvbmx5IGluY3JlYXNlCihlZyBub3QgMS00
LTEpIGFuZCBEVFIgY2FwYWJpbGl0eSB3aWxsIG5vdCBkaXNhcHBlYXIgKGVnIG5vIFMtRC1TKS4K
CkkgZ3Vlc3Mgd2UgbmVlZCB0byBhZGQgbW9yZSBwYXRjaGVzIHRvIG1ha2UgYWxsIHRoZXNlIHNp
dHVhdGlvbnMgY292ZXJlZAphbmQgYXZvaWQgaGF2aW5nIGRyaXZlcnMgY2hlY2tpbmcgZm9yIHRo
ZW0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
