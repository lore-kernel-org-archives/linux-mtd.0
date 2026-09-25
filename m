Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD406C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2O7aI1fKKs38pIMkrJX1vmKqq4WN8Q+dNrutpQFsiw=; b=sxngHFjfYcqOny
	NhXMQU0zahuToC5+q/nwXakslR/S+Y9UJEc3HdUcwdv/eSWgZ6ib7KpqSpvv/lL05pj5Z3tz/Yoc/
	VqbyoXNojEA3Ba1A9o29bWyx2CgwbOz7wueM4eExN8rg7kN0Rh85GhQIZDQP9i4+0RYqnLrPq0BRG
	Ay59p0VCH0Sv4VUItT+KFK34KVtykHNFIKBx5ZpiwU6Pun5054qoz1A/3cdTgw0dgWSeTBjXaA6lU
	KWZ5VEpd5SgxIffBiq30LVKR3X0REt65LYwW3FMsw9eunmccNmV2EQwgZLfUP/90K64K8hHKITAOP
	m1G6hobnMjBG6ng8U2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5WU-0000000DNxo-1YIO;
	Fri, 25 Sep 2026 12:59:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5WR-0000000DNx1-2wGs
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 12:59:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 254B64E41072;
	Fri, 25 Sep 2026 12:59:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECE5B6073B;
	Fri, 25 Sep 2026 12:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7659810328315;
	Fri, 25 Sep 2026 14:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790341163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cXDwAxiBTSKjZRTzIZgNXvVQ0JvFUHv4d7U2rZECKwM=;
	b=ikz5AgrncugT3B89sXpN2kBZ/KcUkmFMoIJSFhTkHi3NRFYgw2m6zrlHDFpsfQTGyKVZyp
	db9jsC7Ej2PcRRVfK6EU8et9fliotXha2zkRcQSZvEATr55GFlFEW6DBliru+M8OyNS48s
	GO1rrdzaYKKDJI6lUia24hlSoCj6A+RyiiVMYj3Ho+njqOk0+/2raxg6VbV8gybwwHtzZH
	Bw+extoXwLLZA7B8wEoJpdt3qsihEQyofN3sW9OFbSmQ8IjHk6SHDjHmQj+brM4KWRana2
	zQ1D812zW5D11CsuOMtHQjjEsFhs++5ZRnUWkr9JqfRylPrNyYVIqvbA3Lt7WA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,  Fei Xie
 <fei.xie@horizon.auto>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Parshuram Thombare
 <pthombar@cadence.com>,  linux-spi@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] spi: cadence-xspi: add ACMD support for SPI NAND
In-Reply-To: <85dc596e-4378-4d23-b48e-80053cb5166d@sirena.org.uk> (Mark
	Brown's message of "Fri, 25 Sep 2026 12:59:49 +0100")
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
	<20260921093701.1341766-3-fei.xie@horizon.auto>
	<arFEjzkHGMbecWWV@sirena.co.uk>
	<20260923061211.1608907-1-fei.xie@horizon.auto>
	<67f4e1a4-fc0e-4b2b-b41e-8dbb33227302@sirena.org.uk>
	<87pky1ll4g.fsf@bootlin.com> <arZHjbzUEFhydnHt@nsa>
	<87ecehljdy.fsf@bootlin.com>
	<85dc596e-4378-4d23-b48e-80053cb5166d@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 14:59:15 +0200
Message-ID: <87qzihjxlo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_055927_880387_DAFFD759 
X-CRM114-Status: GOOD (  13.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjUvMDkvMjAyNiBhdCAxMjo1OTo0OSArMDEsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgU2VwIDI1LCAyMDI2IGF0IDEyOjIzOjIxUE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4KPj4gPiBBcyBmb3IgUFJPR1JBTSBhbmQgRVJBU0UgY29t
bWFuZHMgSSByZWFsbHkgZGlkIG5vdCBzYXcgYW55IGFkZGVkCj4+ID4gdmFsdWUuCj4KPj4gWWVz
LCBtb3N0IG9mIHRoZSB0aW1lIGlzIHNwZW50IGluIHRoZSB3YWl0X3JlYWR5LCB3aGljaCBpcyBu
b3QgZ2V0dGluZwo+PiBmYXN0ZXIgd2l0aCBoYXJkd2FyZSBhdXRvbWF0aW9uLgo+Cj4gSXQgbWln
aHQgcG90ZW50aWFsbHkgaGVscCBhIGhlYXZpbHkgbG9hZGVkIHN5c3RlbSBpZiB5b3UgY2FuIGRv
IGZld2VyCj4gd2FpdHMsIHRoZSByZXN0IG9mIHRoZSB0YXNrcyBydW5uaW5nIG9uIHRoZSBzeXN0
ZW0gd2lsbCBoYXZlIG1vcmUgdGltZQo+IGlmIHdlJ3JlIGRvaW5nIGZld2VyIHdhaXRzIGZvciBp
bnRlcnJ1cHRzLiAgTm90IHN1cmUgaXQnZCBiZSBlbm91Z2ggdG8KPiB3cml0ZSBob21lIGFib3V0
IHRob3VnaC4KCkRlZmluaXRlbHksIGJ1dCB0aGlzIGlzIGFscmVhZHkgcG9zc2libGUsIG9uZSBt
YXkgaW1wbGVtZW50CmN0bHItPm1lbV9vcHMtPnBvbGxfc3RhdHVzLiBUaGlzIHdheSB0aGUgY29y
ZSBjYW4gbGV2ZXJhZ2UgdGhlIGhhcmR3YXJlCnRvIHBlcmZvcm0gdGhlIHBvbGxpbmcuIEl0IGlz
IG5vdCBkaXJlY3RseSB2aXNpYmxlIG9uIGJlbmNobWFya3MsCmJlY2F1c2UgaXQgd29uJ3QgcmVk
dWNlIG11Y2ggdGhlIHdhaXQgdGltZSwgYnV0IHRoZSBzeXN0ZW0gbG9hZCB3aWxsCmRlY3JlYXNl
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
