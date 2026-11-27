Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90723606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nIk5PHV2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ff2U6hPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+DBgXrpPh/yhnAJ7iMvEZMHg+dA5livDhI93d2v8RRU=; b=nIk5PHV2eg2eTKdgs8Jvw1Bo2H
	0FGnPVDveMUWBYEAp7u+KHdhMoI5VJi8nqhOmbzbkHscZBVg3Yq3xL+CQlayCFWOreD8qm7XYhLAW
	/Y3p3ef5kHbgf63ckYIUyNY1DqgKQCA5ww5SPfiNd4/JP2dvqm7xALCluIu3F3TR6SAXbqnyRRtqp
	dVPT3R1emka9qPM32aE6KZKDHrL4Jc+3FRflt6P2+dryzyx8LaDCzUrl0YgJZDFgZSd0u1Uiupm06
	Yr50de2JP7+xl7/vpiH+c7y55SrVRMYeCLkQ0M54nVX0iIRQM7tCqXUNGfN2VDFAlql8tWxZ8Dceq
	2fNGPCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBG-0000000FPwd-006S;
	Fri, 27 Nov 2026 09:23:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBD-0000000FPvg-1xAp;
	Fri, 27 Nov 2026 09:23:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 723151A1827;
	Fri, 27 Nov 2026 09:23:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FD5D6049C;
	Fri, 27 Nov 2026 09:23:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997C311E69295;
	Fri, 27 Nov 2026 10:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PH+l0IfQ28b7UEDSOlC/cTnR6aoCEbyBOr2fiW8TlTU=;
	b=ff2U6hPnfdWAVrHeE+QURp8p7spbk1dJChI6RpTqx3eZ6Z3NSmqEVqcsrKBWqUpqwxoqWW
	zc/fJA/3RG5rOfbi3GI0F41sSS9iHwSig5LSCGt1aXBDcpRxI3DT8e8RJknK0sQbIl5kfU
	fdQvbBmJgmrJbK1tkN+JTKCuLjWJUt8EV3cO/KgSmj55J+HF2kejPGpxpzQJlPHmgFegnn
	gT98jrBXT2PzOH6AL4wHjqlAbY+tfPkFyNcwy0ZMUmc8pSVOvdPYHQMXQlEU96yCUjPdH1
	ZbVOCf20wWo+PSdFfV0SZC2WzOlKgPtH9tgx0ynelI4M7dV1719v3WkwGWwZmw==
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
Subject: Re: [PATCH RFC 02/16] spi: spi-mem: Stop checking the dummy
 buswidth against board wiring
In-Reply-To: <20261127085359.euu6z5rydr655ycr@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:53:59 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-2-fd036402fd37@bootlin.com>
	<20261127085359.euu6z5rydr655ycr@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:23:30 +0100
Message-ID: <875wxivd9p.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012343_640594_1AC944E6 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cj4+IC0JaWYgKG9wLT5kdW1teS5uYnl0ZXMgJiYKPj4gLQkgICAgc3BpX2NoZWNrX2J1c3dpZHRo
X3JlcShtZW0sIG9wLT5kdW1teS5idXN3aWR0aCwgdHJ1ZSkpCj4+IC0JCXJldHVybiBmYWxzZTsK
Pj4gKwkvKgo+PiArCSAqIFRoZSBkdW1teSBwaGFzZSBpbXBsaWVzIG5vIGFjdHVhbCB0cmFuc21p
c3Npb24gbm9yIHJlY2VwdGlvbi4KPj4gKwkgKiBJdHMgYnVzd2lkdGggdGhlcmVmb3JlIGRvZXMg
bm90IG1hdHRlciBtdWNoLgo+PiArCSAqLwo+PiAgCj4gSGkgTWlxdWVsLAo+Cj4gV2l0aCB0aGlz
IGNoYW5nZSwgZG8geW91IHBsYW4gdG8gYWRkIHRoZSBsaW5rZWQgcGF0Y2ggYmFjaz8KPiBTZXR0
aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0byBtYXRjaCB0aGUgZGF0YSBidXN3aWR0aCBpcyBtb3Jl
IHJlYXNvbmFibGUuCgpObyBJIGRvIG5vdC4gRG9pbmcgdGhpcyB3b3VsZCBvbmx5IHBhcGVyIG92
ZXIgdGhlIHByb2JsZW0gZm9yIGNlcnRhaW4KY2FzZXMgYW5kIHdvdWxkIGZvciBpbnN0YW5jZSBi
cmVhayBtYW55IG9mIHRoZSBTUEkgTkFORCBjYXNlcy4gVGhvc2UKY2hpcHMgY3VycmVudGx5IGRl
cml2ZSBhIG51bWJlciBvZiBkdW1teSBieXRlcyBiYXNlZCBvbiB0aGUgZHVtbXkKYnVzd2lkdGgs
IHdoaWNoIGlzIHRoZSBzYW1lIGFzIGluIHRoZSBhZGRyZXNzIHBoYXNlLiBTbyBjaGFuZ2luZyB0
aGlzIGluCnNwaS1tZW0gb3IgZHJpdmVycyB3b3VsZCBicmVhayB0aGlzIGFzc3VtcHRpb24uIEVp
dGhlciB5b3VyIGNvbnRyb2xsZXIKaGFzIGEgY3ljbGUgb3JpZW50ZWQgZHVtbXkgcGhhc2UsIGlu
IHdoaWNoIGNhc2UgdGhlcmUgc2hvdWxkIGJlIG5vCnByb2JsZW0gb25jZSBjb252ZXJ0ZWQgKHNl
ZSB0aGUgcGF0Y2hlcyBiZWxvdykgb3IgaXQgaXMgYnl0ZSBvcmllbnRlZAphbmQgdGhlIG1vZGUg
c2hvdWxkIGxpa2VseSBiZSByZWZ1c2VkLgoKQnV0IG1heWJlIGlmIHlvdSB0ZWxsIG1lIHdoYXQg
eW91IGhhdmUgaW4gbWluZCB3ZSBjYW4gc2VhcmNoIGZvciBhCnNvbHV0aW9uIGZvciBpdC4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
