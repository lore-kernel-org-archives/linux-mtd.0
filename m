Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38319C43602
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpgCElFUnGdRWguI/IWdm4MKYQmyJl7g1eAHzQO4Pgc=; b=J1EKv+xpYEWn+A
	g+mJrX6lH9HN/MP9FrXP4BesQy/0KajJL7mrauMbZ2qSxm0/lYt0dM4+Lg9ktBirPVjZnsfTlOuPN
	zY/hYjFTmc00UzktcjFwpWdNvTVl1DKzwedhcNneqybEcCnZmEKmJT8TtWraYbRltVMT81tozjY+n
	OkKAi5SI+q34nys9gz+EMle0p9P5gWydDtX+h/zDSTMS1X2eQxl1D6m4vEVUYGvUl3qzeELfpQztP
	nEAGscXUERJ3mB4qfoA8Lzs8wvcmi9Gza8AXLfQuQYbje1TZTHsN8AeGQf7FJLrX278H6l/3geWMH
	pdh17RfschTOIL1OdWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDc-0000000Euxl-1Bwv;
	Mon, 29 Jun 2026 14:44:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDDY-0000000Euwe-2Zv8
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:44:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F078D1A0C79;
	Mon, 29 Jun 2026 14:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDF475FF96;
	Mon, 29 Jun 2026 14:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA155106F18AE;
	Mon, 29 Jun 2026 16:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744250; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DBiM6pvkra22acjpE+JaleT13JoqYI1Ldd7orKK9FaE=;
	b=Dx4uUPEX/2+hN6S7cOfGo86yWetcvw4kyPVLwKeQQEj3yB0zG+pWXWEcEMj4P1bP9bRACK
	t9w62tyQ4sSbUQxHwq96pDiVdgR7ubnduNs27UlhyTXggsoGiIJpceihqDzGQtP+wyqSWI
	UBnwLTfrU8keEOk+NbyWGxac1dqi1KgHwuKs0Lv9tvy81tNg/PsmrNan+Xxeb8Uj/h4zU6
	ug/XKrJiqB9JA8ijxlcy6FYUtbrqIwulK2kIHvZqQpLQawH7fGYQ35eRrQmEUCk7wZt8VZ
	xB1+wsndpv0qneB01nXRrwUNy9L65GlcGyo/2jFyw2E7v7BS86CCwFXkIJXnzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ruoyu Wang <ruoyuw560@gmail.com>
In-Reply-To: <20260617183750.1103221-1-ruoyuw560@gmail.com>
References: <20260617183750.1103221-1-ruoyuw560@gmail.com>
Subject: Re: [PATCH] mtd: spinand: initialize ret in regular page reads
Message-Id: <178274424967.260178.13581734730951115704.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:44:09 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074412_791070_7154667E 
X-CRM114-Status: UNSURE (   5.14  )
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

T24gVGh1LCAxOCBKdW4gMjAyNiAwMjozNzo0OSArMDgwMCwgUnVveXUgV2FuZyB3cm90ZToKPiBz
cGluYW5kX210ZF9yZWd1bGFyX3BhZ2VfcmVhZCgpIHJldHVybnMgcmV0IGFmdGVyIGl0ZXJhdGlu
ZyBvdmVyIHRoZQo+IHJlcXVlc3RlZCBwYWdlcy4gSWYgdGhlIHJlcXVlc3QgY29udGFpbnMgbm8g
ZGF0YSBvciBPT0IgYnl0ZXMsIHRoZQo+IGl0ZXJhdG9yIGRvZXMgbm90IHJ1biBhbmQgcmV0IGlz
IG5vdCBhc3NpZ25lZC4gSW5pdGlhbGl6ZSBpdCB0byAwIGZvciB0aGUKPiBlbXB0eSByZXF1ZXN0
IHBhdGguCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiBz
cGluYW5kOiBpbml0aWFsaXplIHJldCBpbiByZWd1bGFyIHBhZ2UgcmVhZHMKICAgICAgY29tbWl0
OiA1ZDdhMDgxMjVlNjk2MzBkYzExNjhkM2U5Y2E1NjI2ZGVkM2RhODA3CgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
