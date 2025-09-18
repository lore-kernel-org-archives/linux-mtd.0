Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EEBCAC59A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLtv6QJx+LoqLIvf3KUvgn1f5cAXjdYx4gcWu4xamPQ=; b=OfshLCEKyk08PL
	XPKR3/EUyZ7LIWGsdNFY22SHBxGXAiMEZMbQWw8hz0S+TLshcpjmY9vIZtAc9lry7X9lkN75p9W36
	26pHt4pClB1UE+WSXwO37qn/YsFwOT0dslEfJbZ13n9OKsKiotczo3crmxgIRK/ERctunLlKFL1sl
	DknUJ7x9Lr1aOgDMuJc7RNLlQr5rNo3oBdbAdgaWtWkQVzR0T05OarT8INI54zNBGRlvibalGqroE
	xSBhzIWyo40sWu3WinnA5ZNZRjFjH5hAy5XHi3FqKKH9Q/npJrup7xYqZc1GbgMJMdTHtDGjn+Q7H
	1ZOSM5bJAE6wFmpdkL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5p-0000000GiAK-3DhZ;
	Thu, 18 Sep 2025 08:34:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzA5k-0000000Gi6i-1rCZ
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 08:34:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 08CC34E40D14;
	Thu, 18 Sep 2025 08:34:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D347F6062C;
	Thu, 18 Sep 2025 08:34:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8996102F1CC5;
	Thu, 18 Sep 2025 10:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758184450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QFKgE34XisIGkXrGzZ7Zyz7rn8aIA52XcS41XeXSSy8=;
	b=oOH0Mox5asHMPFZkgx2XdT8fdlhx+GpQjb3RhszgDnMCsGknmurYsqujTaLK5mwyoV/Kvh
	gGKPJH8ShHZ9pCVSTMdZVQ56P1SmYS1PN6Z0DtycR0P09mzCltMnKOULH4gDKX+2E+iIKy
	xja0PwOxdRVV7hMWrUbkQyc8164E48iD9oB4K2abBF33ckhFogZwoIWFQkTYQ/r4h14t9U
	1VVCIadRYj64fyFSTZH5P2ipuociGS0sUieEGIuQ2e17M99jVDcttzXfOhbbFCa6VkeV0l
	qAG2zQK3kkyZ0n6nurbqvqG+92O1t6HCi6ImChFTxniXXsDVeFnTxFeM+J6HbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
In-Reply-To: <20250916-fsmc-v2-1-fd6c86c919ee@linaro.org>
References: <20250916-fsmc-v2-1-fd6c86c919ee@linaro.org>
Subject: Re: [PATCH v2] mtd: rawnand: fsmc: Default to autodetect buswidth
Message-Id: <175818444989.1151539.14951494454855559061.b4-ty@bootlin.com>
Date: Thu, 18 Sep 2025 10:34:09 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_013412_613965_2C1D516A 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCAxNiBTZXAgMjAyNSAxODowNzozNyArMDIwMCwgTGludXMgV2FsbGVpaiB3cm90ZToK
PiBJZiB5b3UgZG9uJ3Qgc3BlY2lmeSBidXN3aWR0aCAyICgxNiBiaXRzKSBpbiB0aGUgZGV2aWNl
Cj4gdHJlZSwgRlNNQyBkb2Vzbid0IGV2ZW4gcHJvYmUgYW55bW9yZToKPiAKPiBmc21jLW5hbmQg
MTAxMDAwMDAuZmxhc2g6IEZTTUMgZGV2aWNlIHBhcnRubyAwOTAsCj4gICBtYW51ZmFjdHVyZXIg
ODAsIHJldmlzaW9uIDAwLCBjb25maWcgMDAKPiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0
dXJlciBJRDogMHgyMCwgQ2hpcCBJRDogMHhiMQo+IG5hbmQ6IFNUIE1pY3JvIDEwMTAwMDAwLmZs
YXNoCj4gbmFuZDogYnVzIHdpZHRoIDggaW5zdGVhZCBvZiAxNiBiaXRzCj4gbmFuZDogTm8gTkFO
RCBkZXZpY2UgZm91bmQKPiBmc21jLW5hbmQgMTAxMDAwMDAuZmxhc2g6IHByb2JlIHdpdGggZHJp
dmVyIGZzbWMtbmFuZCBmYWlsZWQKPiAgIHdpdGggZXJyb3IgLTIyCj4gCj4gWy4uLl0KCkFwcGxp
ZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGZzbWM6IERlZmF1
bHQgdG8gYXV0b2RldGVjdCBidXN3aWR0aAogICAgICBjb21taXQ6IGI4ZGY2MjJjZjdmNjgwOGM4
NTc2NGU2ODE4NDcxNTBlZDZkODVmM2QKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
