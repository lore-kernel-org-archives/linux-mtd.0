Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8235CA1000
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4I/Pfhbg4X1jQVYZBwMJTMtETObEHWDO/ivgWDbFcY=; b=zZe4bkdJq2HpAF
	n5d2mtl4iAsNWBPq6MyeyMDHWur65SUbnxHeacXY8AN1KAb+QfY+mOIDjQVDg+XQ8fVSctdb+n4hS
	GPfdJOfyOxZ8x3NQRILqT6+tg1jbQW3S7IzG+TrBOCaH0DeYcGMc/zp1RT0iiZtjTWSdsZaoDHwlu
	ZiPM4MVgCC+k2uXkGu39Npt5phDhRdMfxhxqI7/TjabUdf7XC2BURCof1jgpQyydciqCsZHvZ7So0
	zX4+1622k3ovoU57E/t+CaU/zS3OraUPo+SXpacGZXnTD0OmaPLFQ+RnVSLdnjhKlvUMJ69dvmT4e
	mhBztMLB1GZht7k/pfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5ou-0000000CtEU-3ORR;
	Mon, 01 Sep 2025 14:47:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3bq-0000000CQ5M-2vAU
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A7321A0A08;
	Mon,  1 Sep 2025 12:26:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41FBD60699;
	Mon,  1 Sep 2025 12:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2DF91C22D736;
	Mon,  1 Sep 2025 14:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hGKL4FKs6i1GHIz+xvbOKSl/l4umvQsOiUCwcWZt3c=;
	b=ICva/DOhoEqp0sA/6pEKzHDp66jcy4SdmY8zOiDNLM/OAzy2LXngum3o1tpj3CFzbRhWav
	dSu8CrivVDRGAnuO7HUwM7hJ0u1+5nvI74OY9iDBX2wA4uZ1eoFrjKKo6HX5h5LkQ0SQ2o
	kfy5behNlzpFHvhiXPnndYs1DvuU+5jLkPpTu98qEhsMv7E7z2ds8pYwloloJUVcpVcHOr
	V7bbVLfvGGoj108tZnogq9g+yN0rPZxPvUL1sjHC/knOiOujD+aPXCbA5Kf8TPC1MIjN+I
	GS4y0PiZ8HhRTmqzlW8Qya6sZ/6vnxC5IvXiYhpfmFsVHAhNUbYp2FHOcRdqxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <a2a4ca2010ac4aa2aee0bec151d2e57e812510a0.1753904852.git.christophe.jaillet@wanadoo.fr>
References: <a2a4ca2010ac4aa2aee0bec151d2e57e812510a0.1753904852.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] mtd: rawnand: nuvoton: Fix an error handling path in
 ma35_nand_chips_init()
Message-Id: <175672955080.48300.7085440480114483519.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:25:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052606_883087_0FADC50D 
X-CRM114-Status: UNSURE (   7.80  )
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

T24gV2VkLCAzMCBKdWwgMjAyNSAyMTo0Nzo0NiArMDIwMCwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdy
b3RlOgo+IElmIGEgbWEzNV9uYW5kX2NoaXBfaW5pdCgpIGNhbGwgZmFpbHMsIHRoZW4gYSByZWZl
cmVuY2UgdG8gJ25hbmRfbnAnIHN0aWxsCj4gbmVlZHMgdG8gYmUgcmVsZWFzZWQuCj4gCj4gVXNl
IGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgdG8gZml4IHRoZSBpc3N1ZS4KPiAKPiAK
CkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IG51dm90
b246IEZpeCBhbiBlcnJvciBoYW5kbGluZyBwYXRoIGluIG1hMzVfbmFuZF9jaGlwc19pbml0KCkK
ICAgICAgY29tbWl0OiAxZWFlMTEzZGQ1ZmY1MTkyY2ZkM2UxMWI2YWI3Yjk2MTkzYjQyYzAxCgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
