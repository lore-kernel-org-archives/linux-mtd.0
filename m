Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D14606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjeQn4Cx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RyH6ZLwx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L/c+d5BlknrKe4LXWsEa9Zj+p+PEhx1bN0YbSH6MswQ=; b=qjeQn4CxT6HB2FS+2QyAomLFlC
	mRxNQdONtgaVoo8AlLVxD2K3W4EldPvSi48uY7j/7juQK/swLX+g1uoNylAx1VzaC32p9tGduJb+l
	DHDwf596rBV8+VCfG+Ej/JNmsHdpJjRCCn1hBQyiE6ckxjAednxgoTJZf3PhChQeYvY1XowcYsSbl
	b9lNXJr/0wEPY5gUxuzN8poCt/4t/22FAbAwxSUKZVTZfRycrXoKquZMvSz0K9EEVcxEbd0Eh+ysJ
	kG6kt0HDRBKBzOP+FCTYB3A8BBCJh2ntx5Oz0Zz3qW32D4h1pzpcLUC6cCG7BLgsUQKsF8stkdvrv
	euVfkq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJO2-00000005yhq-32E7;
	Tue, 17 Nov 2026 13:38:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNZ-00000005yFs-0nKM
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A550D4E41570;
	Tue, 17 Nov 2026 13:37:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77AAF5FC81;
	Tue, 17 Nov 2026 13:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 699A411BC0024;
	Tue, 17 Nov 2026 14:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rnB0xV40D7sFrEbhmOXs6h8oLu3ZRD0P5eWWboGxYiM=;
	b=RyH6ZLwxdVYvCSRenJ86aNLOsQnB5ocRCEdI9Q9aUJFAPjnYv8vO4b8b2eW93RjASqIzhu
	g9Sm7ISduvfnA1vaziz5XqZ9X6DPbnR1j1h+VDrQehW/qVRN0tVxJTq0FT+NBRN62OayRO
	SpyzTb8yrS/njFRR+HNVqlfKUiM+JrT/nESQfsCFvvaJ8K/rsOq7E+DLtRDI1J4nh3/kEf
	CcDxMy3W/Hc71rGIBkSEoA+qavUpI/KavKP6j1tXi9IrNbBQGxeEXNmnbjV1Rncv9TMfZJ
	OHn/efXYZYeDfXZuTAJANjvx/zbs8+3NorWi4pEQUiy5XvXwsICTWC1jvA1oPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Simon Wunderlich <sw@simonwunderlich.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Hauke Mehrtens <hauke@hauke-m.de>, Aleksander Jan Bajkowski <olek2@wp.pl>, 
 John Crispin <john@phrozen.org>, Sebastien Decourriere <sebtx452@gmail.com>, 
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
Subject: Re: [PATCH 0/5] mtd: maps: lantiq-flash: support boot loaders
 using the EBU endianness swap
Message-Id: <179492265833.2237190.2315954934306792460.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053745_412932_32D27F28 
X-CRM114-Status: GOOD (  11.09  )
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

T24gU2F0LCAxNCBOb3YgMjAyNiAxMTowNjowMiArMDEwMCwgU2ltb24gV3VuZGVybGljaCB3cm90
ZToKPiBTb21lIExhbnRpcSBib2FyZHMsIGxpa2UgdGhlIGJpbnRlYyBlbG1lZyBSUzEyMyBhbmQg
UlMzNTMsIGhhdmUgYSBib290Cj4gbG9hZGVyIHRoYXQgZW5hYmxlcyB0aGUgRUJVJ3Mgb3duIGVu
ZGlhbm5lc3Mgc3dhcHBpbmcgZm9yIHRoZSBOT1IgZmxhc2gKPiBjaGlwIHNlbGVjdC4gbGFudGlx
LWZsYXNoIHRoZW4gZmFpbHMgdG8gcHJvYmUgdGhlIGZsYXNoLiBQYXRjaCA0IGxldHMKPiBzdWNo
IGJvYXJkcyBvcHQgaW4gdG8gaG9ub3VyaW5nIHRoYXQgYml0IHdpdGggYSBuZXcKPiAibGFudGlx
LGVidS1zd2FwLWNoZWNrIiBwcm9wZXJ0eS4gVGhlIGJpdCBvbmx5IHdvcmtzIG9uIFZSOSBmcm9t
Cj4gcmV2aXNpb24gMS4yIGFuZCBvbiBBUjEwLCBzbyB0aGUgZHJpdmVyIGNhbm5vdCByZWx5IG9u
IGl0IG9uIGV2ZXJ5IFNvQy4KPiBUaGUgcHJvcGVydHkgZm9sbG93cyBIYXVrZSdzIHJldmlldyBv
ZiBhbiBlYXJsaWVyIGF0dGVtcHQgYXQgdGhpcyBmaXgKPiBpbiAyMDE3IFsxXS4KPiAKPiBbLi4u
XQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvNV0gbXRkOiBtYXBzOiBsYW50aXEt
Zmxhc2g6IGZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugb24gcHJvYmUKICAgICAgY29tbWl0
OiBmZDFjYzViMWRjNGYyZjk5OTE3YmM1YzAxNmEyNTkzYTk1MWMyNjcwClsyLzVdIGR0LWJpbmRp
bmdzOiBtdGQ6IEFkZCBsYW50aXEsbm9yCiAgICAgIChubyBjb21taXQgaW5mbykKWzMvNV0gbWlw
czogbGFudGlxOiB4d2F5OiBzeXNjdHJsOiBleHBvcnQgbHRxX2VidV9tZW1iYXNlCiAgICAgIChu
byBjb21taXQgaW5mbykKWzQvNV0gbXRkOiBtYXBzOiBsYW50aXEtZmxhc2g6IGhvbm91ciB0aGUg
RUJVJ3Mgb3duIGVuZGlhbm5lc3Mgc3dhcAogICAgICAobm8gY29tbWl0IGluZm8pCls1LzVdIG1p
cHM6IGxhbnRpcTogZGFudWJlOiByZW5hbWUgTk9SIG5vZGUgb24gRUFTWTUwNzEyIHJlZmVyZW5j
ZSBib2FyZAogICAgICAobm8gY29tbWl0IGluZm8pCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWls
YWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHBy
b3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApN
aXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
