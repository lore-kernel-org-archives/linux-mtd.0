Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14692606A33B
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8edc896;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=trvrwwFz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6PSCEJQhcagn5gCWt2Oc1k2dbDGOZ48ZfwTBKjAP8g4=; b=C8edc896/T6fPCPO8m8a+gGKtm
	D+S4crCUPuM3PUTYxgeJJuwOh+kpLb/5G8XEpEzOPxDUxBqNukfV3rgMe0e6BCoFARQ1Zb6yA9VB/
	Oao8KMlRDqqh0M7QTaDIk3OFOHxcFdFMfITnBhQAGJCZBXA/WKEDz6EfEgTc4Uyg3uRVGSJY9yEEr
	l1iQXMG7ElxJUsIRzCSrIWd9Q8NHyxjey2+eJKf5p3IIK3gE+qR5FYb4xSy9y8Z/7AEuKwjR96GSM
	ldbEFiCK9LBM0HMMyyKDocnSzdct7PCbgjKF3VsLaxLas8IRoxJs5BIXaP+GftbE93jgj8FqVkn9t
	u84cRagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsEg-0000000FR5l-3Pbd;
	Fri, 27 Nov 2026 09:27:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsEe-0000000FR3z-1Mjo
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 09:27:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C257C1A1827;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95EA86049C;
	Fri, 27 Nov 2026 09:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F000911E68208;
	Fri, 27 Nov 2026 10:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o20Chm5YYzyaeShfBE58QenD/TWPt7pCsFjGMWvzNHA=;
	b=trvrwwFzIqo2mUgfCxEptebF7FC7y/AzHQOQ5RYBZaN48jnVYFsV/W4buUoneXleDhApJs
	vKj9Tb5BKKmMalB7t0LOb41kEqiwtLp5HFo9hMHopgo8OqljYBPJuJMXa25LEBh2INj+va
	DkmJxqNVBnIGI8opMsNR3eDy74fDKL+2EeLWr6H0DM2XZALMh206vlO6x0vp1kyX/JY9PH
	8UCnxY7D6c2rl2LrUicu9sNjUDirGuGp7ZgEUq1NLQNRX2kA6b7NyfK1tU7raQHJThee1E
	arIMOI6DDxRJ6iZD50GBDIPaMPaJ3j0kNzryMJKcEwlN/XLan7X4jHmV9lykbg==
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
Subject: Re: [PATCH RFC 10/16] spi: nxp-xspi: Consume dummy cycles directly
In-Reply-To: <20261127090720.2zu37yavojz7fze6@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 17:07:20 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-10-fd036402fd37@bootlin.com>
	<20261127090720.2zu37yavojz7fze6@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:27:04 +0100
Message-ID: <87tsl2tyjb.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012716_505761_D93DE3C4 
X-CRM114-Status: GOOD (  11.19  )
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

SGVsbG8sCgo+IE9uIFdlZCwgTm92IDI1LCAyMDI2IGF0IDA2OjUxOjI0UE0gKzAxMDAsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4+IFRoZSBzcGktbWVtIGxheWVyIGlzIG5vdyBjYXBhYmxlIG9mIHBy
b3ZpZGluZyB0aGUgZHVtbXkgcGhhc2UgaW4gY3ljbGUKPj4gdW5pdHMgcmF0aGVyIHRoYW4gYnl0
ZXMsIHByb3ZpZGVkIHRoYXQgZHJpdmVycyBhZHZlcnRpemUgdGhlIGR1bW15X2N5Y2xlCj4+IGNh
cGFiaWxpdHkuIFNpbmNlIHRoaXMgY29udHJvbGxlciBpcyBjb25zdW1pbmcgY3ljbGVzIGFuZCBj
dXJyZW50bHkKPj4gY29udmVydHMgYnl0ZXMgaW50byBjeWNsZXMsIGZsYWcgaXQgY2FwYWJsZSB0
byBjb25zdW1lIGN5Y2xlcyBkaXJlY3RseQo+PiBhbmQgZHJvcCB0aGUgZXh0cmEgY29udmVyc2lv
bnMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvc3BpL3NwaS1ueHAteHNwaS5jIHwgMTIgKysr
KystLS0tLS0tCj4KPiBIaSBNaXF1ZWwsCj4KPiBDYW4geW91IGhlbHAgYWxzbyBhZGQgdGhlIGNo
YW5nZXMgZm9yIHNwaS1ueHAtZnNwaS5jPwo+IGZsZXhzcGkgYW5kIHhzcGkgb2YgTlhQIGhhdmUg
dGhlIHNpbWlsYXIgZHJpdmVyIHN0cnVjdHVyZS4KClllcywgZmxleHNwaSB3aWxsIGFsc28gYmUg
cGFydCBvZiB2Mi4gSSB3b3VsZCBiZSB2ZXJ5IGhhcHB5IGlmIHlvdSBjb3VsZApwcm92aWRlIHRl
c3QgcmVzdWx0cyBmb3IgdGhlIE5YUCBjb250cm9sbGVycyEKClRoYW5rcyBmb3IgdGhlIGZlZWRi
YWNrLCBJIHdpbGwgc2VuZCBhIHYyIHNvb24uCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
