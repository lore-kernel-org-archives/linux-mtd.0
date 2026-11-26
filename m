Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882FE606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rVxTkAfT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CT0q90WV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3Ktw2k+X3aHJRaUJ8wFLHlTBfNFJU7EY/w68Ip9wHic=; b=rVxTkAfTyPogLrLy4FBazGhsRO
	r30OBtvxfg+9O1uSnV5JJslQ7RShOp+zPdslidZ2VsarnCExdDq5cltLQzf8yC17/WTn62jwWBdIO
	bUUU2HuT4gIXYY/7ev92xyO6syUBLMl8AQXARgUTZYNUy2cVaPNkp5TgRrINBwKwSFxgA0OBX3Rcv
	9CB8u+eCliNGQLF68Lx7J8L2LadeYMphc8RbtNb/j1Mz28fZBoKp+SN0XVxIaxb8mn66SdbWvxJkF
	APBuxtGUtWFaCk2bvUtSFeGKClPAVoWIMZ8egGt0JSOpfwbY9JL2Sd1UV1yuSFJQe0pVZdhFPNJRl
	Lit2wgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXLx-0000000Cp0v-2VEu;
	Thu, 26 Nov 2026 11:09:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXLt-0000000Cozf-40iS;
	Thu, 26 Nov 2026 11:09:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEA2C4E4179C;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CAF460237;
	Thu, 26 Nov 2026 11:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A61D211E6B368;
	Thu, 26 Nov 2026 12:09:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y1/wD7Wi9STowuQTsl3HDTiGkdek0lFr2Qc9ETyKkHc=;
	b=CT0q90WVIJc4zyZoQOxtFRwovUp/lD1tvYC8y28IdlSTZHylCR+SJOmgbdnavDoSIkKJZ7
	UQHzhfp1dRSy6+1mQ58pLkQKWb6rDLC50feZHn9Pd5znOcWpj7D5Q9l8chtedbMZd2oDLJ
	ZmLDRvMzlrHQxZPH5Eic6XzwoJQMgIXhdfgkIsLG7EiBT8CbTTjEdoIHRCvVjU+Te4B3r8
	AQFb4tWn9rZC2cYUS3f3KjYpHTHLUb6guHhBk2tbVLMW1Bfs4Eaee4bo7sjgUwuMgJ4yos
	1IXLZNk6X6lqfWFueUY4owHyk7QJ2sJAxW6L5yGfOuj+wpDnU0wIA23rihiUPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liang Yang <liang.yang@amlogic.com>,  Feng Chen <feng.chen@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Valentina Fernandez
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
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	(Miquel Raynal's message of "Wed, 25 Nov 2026 18:51:14 +0100")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:09:05 +0100
Message-ID: <87wlpzx31q.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030922_128792_9EA3DE7A 
X-CRM114-Status: UNSURE (   9.80  )
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

Cj4gQ29udmVydCBzcGktbWVtLCBhbGwgdGhlIHRyaXZpYWwgc3BpLW1lbSBjb250cm9sbGVyIGRy
aXZlcnMgYW5kIHRoZW4KPiBTUEkgTk9SIHRvIHVzZSBkdW1teSBjeWNsZXMgaW5zdGVhZCBvZiBk
dW1teSBieXRlcy4gU1BJIE5BTkQgbWF5IGNvbWUKPiBsYXRlci4KPgo+IFRoaXMgaXMgb25seSBi
dWlsZCB0ZXN0ZWQgZm9yIHRoZSBtb21lbnQgYW5kIHNlbnQgYXMgYW4gUkZDIGJlY2F1c2UgdGhp
cwo+IHRvcGljIGhhcyByYWlzZWQgYSBsb3Qgb2YgcXVlc3Rpb25zLCB0aGVyZSBtYXkgYmUgdGhp
bmdzIEkgaGF2ZQo+IGZvcmdvdHRlbiBhYm91dCwgc28gSSB3b3VsZCBsaWtlIGFsbCBwYXJ0aWVz
IHRvIGFncmVlIG9uIHRoZSBkaXJlY3Rpb24KPiBiZWZvcmUgSSBjb21taXQgaW50byBzb21ldGhp
bmcgY2xlYW5lci4gSSBiZXQgU2FzaGlrbyB3aWxsIGFsc28gaGF2ZQo+IGludGVyZXN0aW5nIGZl
ZWRiYWNrIHRvIG1ha2UuLi4KCkkgbWFkZSBzZXZlcmFsIHRyaXZpYWwgaXNzdWVzIGluIHRoZSBj
b250cm9sbGVyJ3MgY29udmVyc2lvbnMgd2hpY2gKdHJpZ2dlcmVkIGEgbG90IG9mIFNhc2hpa28g
YW5zd2VycyBleHByZXNzaW5nIHRoZSBmZWVsaW5nIHRoYXQgdGhlCnBhdGNoc2V0IHdhcyBub3Qg
cmVhZHkuIFRoZSBpbXBvcnRhbnQgcGFydCBjbGVhcmx5IGFyZSB0aGUgc3BpLW1lbQpjaGFuZ2Vz
LCB0aGUgbW9kaWZpY2F0aW9ucyBvbiB0b3AgYXJlIGFsbW9zdCBpbmRlcGVuZGVudCBmb2xsb3ct
dXBzCnNob3dpbmcgd2h5IHRoaXMgbWF5IGJlIHVzZWZ1bC4gTmV2ZXJ0aGVsZXNzLCBJJ20gZ29u
bmEgYWRkcmVzcyBhbGwKdGhvc2UgaXNzdWVzIGFuZCBzZW5kIGEgdjIgd2l0aCBob3BlZnVsbHkg
bGVzcyBvYnZpb3VzIGlzc3Vlcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
