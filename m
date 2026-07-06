Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C16C44500
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4tOE64//d5Cb+EBrJ22qMpz8KWTP0NCWzcyUe0SUnM=; b=03sPZp7F9L/f+u
	2r4FWwnZvUZ55T79l/308Mrv+0PAOfpriLFfVt55FHDNgqQxJGTFTsz/1z8qLLxHyzMi0wFqccmZY
	WenAIRdPGclUiam6fSzgIKKDwaIJjh5NN0xKpZcF3EAwvcBOOIzkA6h0cfb+J+5ChnYAdqQ1E4xaz
	vp0kCqxVvleHqUs3L15mlqbaYn+7nUdYze5vxVOWsXtpallPpmqAbjoMsSwH/w3O7EWokqokn1vq5
	Xs8Zvn/QpCKcTJaAp6oHWQYg8xAfnytMMQEGxIxxD8OkCbjVlzU0NBQ3TOPtyZRPz1q1p6V0ZKqbR
	gcqB9N7QYYx/WB7BI5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckp-0000000Bbtj-28uO;
	Mon, 06 Jul 2026 06:24:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckl-0000000Bbo1-1XYI
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F26F31A0E80;
	Mon,  6 Jul 2026 06:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C7E601A2;
	Mon,  6 Jul 2026 06:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F06411BB98B6;
	Mon,  6 Jul 2026 08:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HQei6Rt5rAEMgiyIOtihLA9S2prQeFUyFlrKQtRHLZg=;
	b=R/6JwtiE4Jj7hU39SNi7mGJGuIuBacFdPrO2BUFGV8homnrNckLDsYwNZZVT8QhKa9yMlf
	2XnrMc8Swt3bbv8aqp7NUXNhDVO2GApBVyrxwXCXD5E+oR3NufMihm86LjY7Je+1Gw8bJy
	ZeaL322QaedI+2S7SgMx5KALqGn3StOxCbw8syjye8AE468jTHUOm9h7YSVzpw8Kj07YIA
	qPeWXCu+m6mv7l4mKd41rEaWN5wKrXrZUEqhidDdIFzaG/Fw0F3EWS4MU5ChEUcJwnpgEe
	xk5cRyjba/JdFtea8rKid2RBTE7C3oVu/jTeRHdc2osmE3fWFWwgp6BWgNKtOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@kernel.org>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703073759.31388-1-pengpeng@iscas.ac.cn>
References: <20260703073759.31388-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_mlc: fail DMA transfers on
 timeout
Message-Id: <178331906145.868671.2640165529145419553.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232427_558666_B7C48EEC 
X-CRM114-Status: UNSURE (   7.54  )
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

T24gRnJpLCAwMyBKdWwgMjAyNiAxNTozNzo1OSArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IGxwYzMyeHhfeG1pdF9kbWEoKSBzdGFydHMgYSBETUEgdHJhbnNmZXIgYW5kIHdhaXRzIHVwIHRv
IG9uZSBzZWNvbmQKPiBmb3IgaXRzIGNvbXBsZXRpb24sIGJ1dCBpdCBpZ25vcmVzIHRoZSB3YWl0
IHJlc3VsdCBhbmQgcmV0dXJucyBzdWNjZXNzCj4gYWZ0ZXIgdW5tYXBwaW5nIHRoZSBidWZmZXIu
Cj4gCj4gQSB0aW1lZCBvdXQgcmVhZCBjYW4gdGhlcmVmb3JlIHJldHVybiBzdWNjZXNzIHdpdGgg
aW5jb21wbGV0ZSBkYXRhLCBhbmQKPiBhIHRpbWVkIG91dCB3cml0ZSBjYW4gY29udGludWUgdGhl
IE5BTkQgb3BlcmF0aW9uIHdpdGhvdXQgcHJvb2YgdGhhdCB0aGUKPiBETUEgcGF5bG9hZCByZWFj
aGVkIHRoZSBjb250cm9sbGVyLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhh
bmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBscGMzMnh4X21sYzogZmFpbCBETUEgdHJhbnNmZXJz
IG9uIHRpbWVvdXQKICAgICAgY29tbWl0OiBkYmY1OTBiNjYyNjk1YjE2ZmJmNTkxN2VmMTI5Njk3
YmU0NDEwZWE5CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0
IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3Qg
Y29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
