Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6523CC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFN8NERmznnR88EsZeO2mNCBlVXYlrYPVuuvVKj4T9A=; b=ecsENGfe5ErFqP
	JFM+hs6rOKHITn1Ohyog7dJo1E9VJM2w2mEpaX9r+TW01FENfRgEET7MmKf2xWjVMK7ChXSm8FSAj
	gKR4oEL5lC9fWOExEBLKfLpH6YiWs0v6PzGXXloDYD4NY/6gpx/8qh8YUNCUICkqPTP7zP8bgVR//
	WtO+dLuDhIuCn+Rxnzd7mQH4Og5HDkvjP91elSzDZiT4sdNeKfDPnov8UX3jIha9fHurac7QqaB8c
	pX7fyvpjfulkC7T3hC50ZCIX3h+mgaLB+5fyk/Ixk99/qX6NpxJp6JDJJAnn638TwaD5yjIX1/U3G
	U9e+oMDPEi0FcJxfUpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvX-0020sP-9k; Thu, 09 Jun 2022 13:10:19 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHub-0020ID-VF
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AEDAC100009;
	Thu,  9 Jun 2022 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+NZWLrr5HqB/mI/cB8JbPiQA6P2EkeW1kTBwmuNp9E=;
	b=cVItfiMmu8f3i9P7KHWGFJVgmJ8baaxUH/QjMXtsgYNbSSYGFHgL3YGKgNTqz5j/1wduNx
	d22qv6U0trfxepXytmgttYiq/M3/++p+KFunJJYfi9DwBBzheCDWRevgA2w4jJhpIq+Wq/
	LAvyB7V9PfJB5aNcd4OXzljwiiF8pqZbf8JovW3np1KT2x36WhsMQNAMVPt4kBlMsi1FdQ
	mdE7vrp7PuF7tCSiTG2OAew2UTxb523z9TpZ10QXr/GNHm8IwNkBjVVuvCWTZQo1AXFkrv
	ygJogUaTsYYopfcgtrbv8kct2F6z+fj1chcprqPIU5fXyHs509wiy9ZOOQKnEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 13/14] mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
Date: Thu,  9 Jun 2022 15:09:19 +0200
Message-Id: <20220609130919.293134-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-14-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bb8236541f496e2a32772071fdb127dce6ac1643'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060922_201473_8A2EBC21 
X-CRM114-Status: UNSURE (   9.40  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjU3IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IElmIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIGZhaWxzICh3
aGljaCBpdCBkb2Vzbid0IHdoZW4gdXNlZCBjb3JyZWN0bHkpLAo+IHRoZSByZXNvdXJjZXMgYm91
bmQgYnkgdGhlIG5hbmQgY2hpcCBzaG91bGQgYmUgZnJlZWQgYW55aG93IGFzIHJldHVybmluZwo+
IGFuIGVycm9yIHZhbHVlIGRvZXNuJ3QgcHJldmVudCB0aGUgZGV2aWNlIGdldHRpbmcgdW5ib3Vu
ZC4KPiAKPiBJbnN0ZWFkIHVzZSBXQVJOX09OIG9uIHRoZSByZXR1cm4gdmFsdWUgc2ltaWxhciB0
byBob3cgb3RoZXIgZHJpdmVycyBkbwo+IGl0Lgo+IAo+IFRoaXMgaXMgYSBwcmVwYXJhdGlvbiBm
b3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZvaWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
