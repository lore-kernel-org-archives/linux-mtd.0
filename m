Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8210C48298
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/45i1cRLdbL86DlViy/l9/ZY/yBpU618sYhHM1LXKU=; b=0iJk0Gy3Rap5cC
	S7HSi7pkRUvuxngEDbO5WJiRIe1BEkmkkGotbK53VlRcj65begN0g9lHQq1Xfbeo1x28micyUUYDU
	d96G8vBNYEPEeZRFaI3jF6TjBVYbKwMdQGxAliJlEsD7naReMzM9K0/1VZlUezkr3qQgzHW3W4hrv
	zg9mk1CHbDo7IMQVZLUQzrj69KHLGhnwnuVpTp6n/KbRwv63C11nC0dF51/Y9BEhkWkI24Sb8F4Rv
	uKVslvV5IydEqoRVc9T94yt5hYUzKQwN42xEocPqwRFDDGPlPP0sT9fR/z5y5fZOaZ2BGpdZviFsB
	2QK+xFzwEjFYQ5sA1ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyNq-00000003HdC-3Yp9;
	Mon, 05 Feb 2024 12:47:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyNo-00000003HbO-3oqj
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 12:47:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54F75FF809;
	Mon,  5 Feb 2024 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707137249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET8uh9uAOFr1YPquku+zPAdYd3BxeGgKu/GKeuvI1dQ=;
	b=nk9NB+l/NSbIMTT/Tpo2f9/5lMu1OD78Y6BO3XwTeIR4IVWsTC4+Y++4u1czEx4/H01pA0
	T+AFMxAFFvURxe30z7+4hP7BTVprwEgaFDwXJvkhFaX26iNoXzQbed6vOdSBfk0C1uXaq3
	XqJpzwUQ64NUYbLBKSHXJs/lBWGdL+VDrLPwDsLlPMa3kSJ2P6CZk262p/oin3S9NM8M7/
	tb6NVJwuAGZyN3JddIwVjzwLIWcVpHGyCxMmE+/eML/Ro6CqzDo7neJ++PjPzlyrXoBQ1T
	CWDA5OyemRWk12U/e0XYlctTSyMIceNj29Ri5fQ9Fz2iQYWcH3s94fsZBCOUvg==
Date: Mon, 5 Feb 2024 13:47:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Elad Nachman <enachman@marvell.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <vadym.kochan@plvision.eu>,
 <aviramd@marvell.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: fix layouts
Message-ID: <20240205134727.50a02e10@xps-13>
In-Reply-To: <20240103133740.1233405-1-enachman@marvell.com>
References: <20240103133740.1233405-1-enachman@marvell.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_044733_109207_15E76D16 
X-CRM114-Status: GOOD (  10.06  )
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

SGkgRWxhZCwKCmVuYWNobWFuQG1hcnZlbGwuY29tIHdyb3RlIG9uIFdlZCwgMyBKYW4gMjAyNCAx
NTozNzo0MCArMDIwMDoKCj4gRnJvbTogRWxhZCBOYWNobWFuIDxlbmFjaG1hbkBtYXJ2ZWxsLmNv
bT4KPiAKPiBUaGUgY2hlY2sgaW4gbmFuZF9iYXNlLmMsIG5hbmRfc2Nhbl90YWlsKCkgOiBoYXMg
dGhlIGZvbGxvd2luZyBjb2RlOgo+IChlY2MtPnN0ZXBzICogZWNjLT5zaXplICE9IG10ZC0+d3Jp
dGVzaXplKSB3aGljaCBmYWlscyBmb3Igc29tZSBOQU5EIGNoaXBzLgo+IFJlbW92ZSBFQ0MgZW50
cmllcyBpbiB0aGlzIGRyaXZlciB3aGljaCBhcmUgbm90IGludGVncmFsIG11bHRpcGxpY2F0aW9u
cywKPiBhbmQgYWRqdXN0IHRoZSBudW1iZXIgb2YgY2h1bmtzIGZvciBlbnRyaWVzIHdoaWNoIGZh
aWxzIHRoZSBhYm92ZQo+IGNhbGN1bGF0aW9uIHNvIGl0IHdpbGwgY2FsY3VsYXRlIGNvcnJlY3Rs
eSAodGhpcyB3YXMgcHJldmlvdXNseSBkb25lCj4gYXV0b21hdGljYWxseSBiZWZvcmUgdGhlIGNo
ZWNrIGFuZCB3YXMgcmVtb3ZlZCBpbiBhIGxhdGVyIGNvbW1pdCkuCj4gCj4gRml4ZXM6IDY4YzE4
ZGFlNjg4OCAoIm10ZDogcmF3bmFuZDogbWFydmVsbDogYWRkIG1pc3NpbmcgbGF5b3V0cyIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBFbGFkIE5hY2htYW4g
PGVuYWNobWFuQG1hcnZlbGwuY29tPgoKRm9yIHNvbWUgcmVhc29ucywgeW91ciBwYXRjaCByZWFj
aGVkIHRoZSBsa21sIGJ1dCBub3QKbGludXgtbXRkLi4uIEF0IGxlYXN0IGl0IGRvZXMgbm90IGFw
cGVhciBvbiBsb3JlIG5vcgpwYXRjaHdvcmsuIENhbiB5b3UgcGxlYXNlIHJlc2VuZD8KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
