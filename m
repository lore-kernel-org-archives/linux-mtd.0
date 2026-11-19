Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A987606A331
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7nPJTSE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zPTod43m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KBQEsfyrYfwFeqIGCErbnk60yn4xza6K74WtESmuNWI=; b=m7nPJTSEqpg90tNP1H1gEA3R3N
	RQHDEx6dFxpgMpUvgCugMZFMZHjRoUVxuu9ID1W0ceSSNBicKqq879FxqUwwSq6MRg6aF8oP1b2VB
	XY9IxFR/lDGQOwT/g0Kj5ACJYOcyJAAObnxO8dhOTFRz2LlENMNMas2cAO8mAiQyWjlqHVwmfxBfs
	eXcaMert8+UCv7Dfxonh30FMAz34EPsHRbXlVV/FCJtOOKMr0O9aLOvW5TWhXngSGNy2+EVOsQDUC
	9MvOwt0rMkhCvMZHlJsWznaD9dt+AiLLNuKuMpw8zfIhPWS2GSaMhBAYO198HvPZa+56LdJFLi82B
	jegYHY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OG-0000000BrN0-19i2;
	Thu, 19 Nov 2026 12:37:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OD-0000000BrKs-1o62
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D257C4CBEF;
	Thu, 19 Nov 2026 12:37:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D364760237;
	Thu, 19 Nov 2026 12:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 510D011BC0760;
	Thu, 19 Nov 2026 13:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3t5GjNWjLeDJ7jf+sWjWE+z8pgne1HFP6Z9ewGr3ciM=;
	b=zPTod43mAzLSSRgzVXjEmLAXkDGnxePwHhzkScC5gOoZIjGIKZrN9qQvXbbt1f7+xrC40e
	kWUCCNvwwMyXfEALuAkbI6u43LkZV+KGC2c/ZOzEC/4phQiCmL+YZvS/0THt2ekxxWgacR
	tu7CMv3of0F6uZOdw6R8k2L12mJN5gyaXmuGe1K6spBswNWI3ATX0X/XQ7ZA2z7l13ESfg
	kwKykGxuin8gKfntIgliW+nEo2ixhWg5Bzv5yitkMs863ypkm2GLvGpNgpDzkCG0uUn5xX
	pbht3yp6JD1MYGDKDfPS30lAM6tMEFTzS0HNicPVhEZ+CUIh0fnUDT+oK4PxKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
Subject: Re: [PATCH v10 00/26] mtd: rawnand: sunxi: fix transfers and
 support randomized OOB
Message-Id: <179509183211.2889394.16825117934214735151.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043721_633896_6353E145 
X-CRM114-Status: GOOD (  10.06  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAwNSBOb3YgMjAyNiAxMTo1NToxNiAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gUGF0Y2hlcyAxLTI0IGFkZHJlc3MgdGhlIGV4aXN0aW5nIGRyaXZlciBpbmRlcGVuZGVudGx5
IG9mIHRoZSBBbGx3aW5uZXIKPiByYW5kb21pemVkLU9PQiBmb3JtYXQgaW4gcGF0Y2hlcyAyNS0y
Ni4gUGxlYXNlIHJldmlldyBhbmQgYXBwbHkgdGhhdCBwcmVmaXgKPiByZWdhcmRsZXNzIG9mIHdo
ZXRoZXIgdGhlIGZvcm1hdCBleHRlbnNpb24gaXMgYWNjZXB0ZWQuIFN1cHBvcnRlZCBnZW9tZXRy
aWVzCj4ga2VlcCB0aGVpciBleGlzdGluZyBvbi1mbGFzaCBFQ0MgbGF5b3V0LCBiYWQtYmxvY2st
bWFya2VyIHJlcHJlc2VudGF0aW9uCj4gYW5kIHJhdyBjYWxsYmFja3MuCj4gCj4gUGF0Y2hlcyAx
LTMgcHJlcGFyZSB0aGUgc2hhcmVkIHBhdGhzOiBjZW50cmFsaXplIE9PQiBoYW5kbGluZywgc2hh
cmUgdGhlCj4gTk9STUFMLWNvbW1hbmQgY2h1bmstc2l6ZSBjYWxjdWxhdGlvbiwgYW5kIHJlbW92
ZSBkdXBsaWNhdGUgY2hpcCBzZXR1cAo+IGltbWVkaWF0ZWx5IGJlZm9yZSBjb3JlIHBhZ2UgY29t
bWFuZHMuIFRoZSBETUEgd3JpdGVyIHJldGFpbnMgaXRzIGVhcmx5Cj4gc2V0dXAgYmVjYXVzZSBp
dCBhY2Nlc3NlcyBjb250cm9sbGVyIHJlZ2lzdGVycyBiZWZvcmUgcHJvZ3JhbS1iZWdpbi4KPiAK
PiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClswMS8yNl0gbXRkOiByYXdu
YW5kOiBzdW54aTogY2VudHJhbGl6ZSBPT0IgaGFuZGxpbmcKICAgICAgICAobm8gY29tbWl0IGlu
Zm8pClswMi8yNl0gbXRkOiByYXduYW5kOiBzdW54aTogc2hhcmUgdGhlIGJ1ZmZlciB0cmFuc2Zl
ciBjaHVuayBzaXplCiAgICAgICAgY29tbWl0OiA1MzAxM2M2Nzg3MWYzZjMxYjAxODFmZmVkOGEx
NGJhNmI5NDY2NDI3ClswMy8yNl0gbXRkOiByYXduYW5kOiBzdW54aTogYXZvaWQgZHVwbGljYXRl
IGNoaXAgc2V0dXAgYmVmb3JlIHBhZ2UgY29tbWFuZHMKICAgICAgICBjb21taXQ6IDJiZDRhY2Fi
MWUwZTE2YzA2YWM2NGY2MGFhMDFhNzJkMGU2NTE2MTYKWzA0LzI2XSBtdGQ6IHJhd25hbmQ6IHN1
bnhpOiByZWplY3QgcGFnZXMgZXhjZWVkaW5nIHRoZSBFQ0Mgc3RlcCBsaW1pdAogICAgICAgIGNv
bW1pdDogNWViMjhkNjhkNjdhMjJmNWIyZjlkOThkOTU2N2IwMWY0MzJiYjg4ZApbMDUvMjZdIG10
ZDogcmF3bmFuZDogc3VueGk6IHVzZSB0aGUgbG9naWNhbCBzdGVwJ3MgT09CIGxlbmd0aCBpbiBQ
SU8KICAgICAgICAobm8gY29tbWl0IGluZm8pClswNi8yNl0gbXRkOiByYXduYW5kOiBzdW54aTog
cHJvcGFnYXRlIHBhZ2Utc2V0dXAgYW5kIGVyYXNlZC1jaGVjayBlcnJvcnMKICAgICAgICAobm8g
Y29tbWl0IGluZm8pClswNy8yNl0gbXRkOiByYXduYW5kOiBzdW54aTogZHJhaW4gaW50ZXJydXB0
cyBiZWZvcmUgcmV1c2luZyB0aGUgY29tcGxldGlvbgogICAgICAgIChubyBjb21taXQgaW5mbykK
WzA4LzI2XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBzdG9wIGZhaWxlZCBwcm9ncmFtIG9wZXJhdGlv
bnMgYW5kIGRpc2FibGUgRUNDCiAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDkvMjZdIG10ZDog
cmF3bmFuZDogc3VueGk6IHNlbGVjdCB0aGUgcGF0dGVybiBJRCBmb3IgdGhlIGN1cnJlbnQgRUND
IHN0ZXAKICAgICAgICAobm8gY29tbWl0IGluZm8pClsxMC8yNl0gbXRkOiByYXduYW5kOiBzdW54
aTogcHJlc2VydmUgc3ludGhlc2l6ZWQgemVyby1wYXR0ZXJuIGRhdGEgYW5kIE9PQgogICAgICAg
IChubyBjb21taXQgaW5mbykKWzExLzI2XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBwcm9wYWdhdGUg
YnVmZmVyIGFuZCBjb2x1bW4gdHJhbnNmZXIgZXJyb3JzCiAgICAgICAgKG5vIGNvbW1pdCBpbmZv
KQpbMTIvMjZdIG10ZDogcmF3bmFuZDogc3VueGk6IGF2b2lkIGEgc2Vjb25kIHByb2dyYW0gY29u
ZmlybSBmb3IgT09CIHdyaXRlcwogICAgICAgIChubyBjb21taXQgaW5mbykKWzEzLzI2XSBtdGQ6
IHJhd25hbmQ6IHN1bnhpOiB1c2UgcGFnZSByZWFkcyB0byByZXBvc2l0aW9uIHNtYWxsLXBhZ2Ug
TkFORAogICAgICAgIChubyBjb21taXQgaW5mbykKWzE0LzI2XSBtdGQ6IHJhd25hbmQ6IHN1bnhp
OiBib3VuZCBETUEgYmF0Y2hlcyBieSB0aGUgdXNlci1kYXRhIHJlZ2lzdGVyIGJhbmsKICAgICAg
ICAobm8gY29tbWl0IGluZm8pClsxNS8yNl0gbXRkOiByYXduYW5kOiBzdW54aTogc2VuZCBhbGwg
YWRkcmVzcyBjeWNsZXMgaW4gc3BsaXQgb3BlcmF0aW9ucwogICAgICAgIChubyBjb21taXQgaW5m
bykKWzE2LzI2XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBwcm9wYWdhdGUgY2hpcCBjbG9jayBzZXR1
cCBlcnJvcnMKICAgICAgICAobm8gY29tbWl0IGluZm8pClsxNy8yNl0gbXRkOiByYXduYW5kOiBz
dW54aTogbGltaXQgYnVmZmVyIHRyYW5zZmVycyB0byB0aGUgY29tbWFuZCBieXRlIGNvdW50CiAg
ICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMTgvMjZdIG10ZDogcmF3bmFuZDogc3VueGk6IHNraXAg
dW5hdmFpbGFibGUgTkFORCBjaGlsZCBub2RlcwogICAgICAgIChubyBjb21taXQgaW5mbykKWzE5
LzI2XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBzY2FuIGFsbCBjaGlwcyBiZWZvcmUgcmVnaXN0ZXJp
bmcgTVREIGRldmljZXMKICAgICAgICAobm8gY29tbWl0IGluZm8pClsyMC8yNl0gZHQtYmluZGlu
Z3M6IG10ZDogc3VueGk6IHJlcXVpcmUgdGhlIEg2MTYgQUhCIHJlc2V0CiAgICAgICAgKG5vIGNv
bW1pdCBpbmZvKQpbMjEvMjZdIG10ZDogcmF3bmFuZDogc3VueGk6IHJlc2V0IHRoZSBINjE2IGRh
dGEgcGF0aCBhZnRlciBETUEgYWJvcnRzCiAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMjIvMjZd
IG10ZDogcmF3bmFuZDogc3VueGk6IHJldXNlIEVDQyBzdGF0dXMgd2l0aGluIGVhY2ggdHJhbnNm
ZXIKICAgICAgICAobm8gY29tbWl0IGluZm8pClsyMy8yNl0gbXRkOiByYXduYW5kOiBzdW54aTog
YXZvaWQgcmVkdW5kYW50IGNvbHVtbiBjaGFuZ2VzIGZvciBleHRyYSBPT0IKICAgICAgICAobm8g
Y29tbWl0IGluZm8pClsyNC8yNl0gbXRkOiByYXduYW5kOiBzdW54aTogcmVkdWNlIHVzZXItZGF0
YSBsZW5ndGggcmVnaXN0ZXIgYWNjZXNzZXMKICAgICAgICAobm8gY29tbWl0IGluZm8pClsyNS8y
Nl0gZHQtYmluZGluZ3M6IG10ZDogc3VueGk6IEFkZCByYW5kb21pemVkIE9PQiBmbGFnCiAgICAg
ICAgKG5vIGNvbW1pdCBpbmZvKQpbMjYvMjZdIG10ZDogcmF3bmFuZDogc3VueGk6IHN1cHBvcnQg
dGhlIEFsbHdpbm5lciByYW5kb21pemVkIE9PQiBmb3JtYXQKICAgICAgICAobm8gY29tbWl0IGlu
Zm8pCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
