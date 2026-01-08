Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C6D1D483
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaeqXy8hIuhzv8JjisPbCM04Koo5CSyx2QMOQLwW2bs=; b=gwIuKGobAqjA/0
	9MceUbrpo2Z87r1Y5dBMdTk2KApZW/QZZs2WJgNBhcTyzqQDe6s9YTHLkPVuZZWd8GVZ5/GtajU8Z
	vS7T4iDEiAnVLYvRZmbN/NzFMfmx/AscvQnCTeM9hT+ZNUfIRi6Lbx57j16cxmqdOafCigixLO88S
	Dqcr1FKloJIc35oVct9IzW9IyfkDZAV4QObDdWkS/livGJsj0BCOIffeA9pLQuJS3elwobYHilPOw
	l0yEDnI1GyLUB6LvKaZlQticNfALOFrUJq6K4SXT8bUhsuaxbwc8yBkRgi6RWacyXw/we+C1TgUVy
	fjJZBV1CPFTL2EHXDSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtbZ-00000000KdJ-1Adr;
	Thu, 08 Jan 2026 17:15:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtbT-00000000Ka8-329G
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:15:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF63A1A26EC
	for <linux-mtd@lists.infradead.org>; Thu,  8 Jan 2026 17:15:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3D796072B;
	Thu,  8 Jan 2026 17:15:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F272A103C8824;
	Thu,  8 Jan 2026 18:15:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767892517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kkDfqpLC1UGqwwQWtLcaqVsqDaZNNS6aZHk6FZYCaU4=;
	b=1fmmIC4n6kWhI3doeUXipkS43gaLl0anSCyBW2CAlhwePCO9JpZvTS6pH43in8zkQim9v1
	WasdHL9ijCHBojznuFNF4mF1c2HUSkIi0VL8PWnm1+Ro2G8raICEFycgAP361mcotp5DHQ
	RqQgJ8DO95odP4Bpr6qO97Uy1TLc+1DbveyAVBeb4xbtMwU7kZ7P8/C8gGxF23Q9kvC2Kc
	maze076BhR++h8qRXrFtF/Of01bBFvlbF2Gep91Oot4Ww55qc2N8GEGGB4zsXn1aergpP/
	rQZ2KM9vUcjmTKBplqRvorsRymw0606hqNQH5VUZ6/rnx90fkMYFx+g51w35oA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrea Scian <andrea.scian@dave.eu>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: R: mtd_nandbitserr and seed using pl35x NAND controller
In-Reply-To: <MI2P293MB026440FB793D2D9D1E59ADA797A8A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
	(Andrea Scian's message of "Thu, 18 Dec 2025 11:11:19 +0000")
References: <MI2P293MB02644E845892FAFBEC01AD5997D6A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
	<87wm2t57n1.fsf@bootlin.com>
	<MI2P293MB026440FB793D2D9D1E59ADA797A8A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 08 Jan 2026 18:15:15 +0100
Message-ID: <875x9cyqjg.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091519_892074_0A848252 
X-CRM114-Status: GOOD (  10.64  )
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

SGkgQW5kcmVhLAoKPiByb290QHN3MDAwNS1kZXZlbDp+IyBuYW5kZmxpcGJpdHMgL2Rldi9tdGQw
IDVAMAo+IHJvb3RAc3cwMDA1LWRldmVsOn4jIG5hbmRkdW1wIC1jIC1zIDAgLS1sZW5ndGg9MTAw
IC9kZXYvbXRkMCAgfCBoZWFkCj4gRUNDIGZhaWxlZDogMAo+IEVDQyBjb3JyZWN0ZWQ6IDIKPiBO
dW1iZXIgb2YgYmFkIGJsb2NrczogMAo+IE51bWJlciBvZiBiYnQgYmxvY2tzOiA0Cj4gQmxvY2sg
c2l6ZSAxMzEwNzIsIHBhZ2Ugc2l6ZSAyMDQ4LCBPT0Igc2l6ZSA2NAo+IER1bXBpbmcgZGF0YSBz
dGFydGluZyBhdCAweDAwMDAwMDAwIGFuZCBlbmRpbmcgYXQgMHgwMDAwMDA2NC4uLgo+IEVDQzog
MSBjb3JyZWN0ZWQgYml0ZmxpcChzKSBhdCBvZmZzZXQgMHgwMDAwMDAwMAo+IDB4MDAwMDAwMDA6
IDY1IDQyIDQ5IDIzIDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAyICB8ZUJJIy4u
Li4uLi4uLi4uLnwKPiAweDAwMDAwMDEwOiAwMCAwMCAwOCAwMCAwMCAwMCAxMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwMDAwMDAyMDogMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4u
Li4ufAo+IDB4MDAwMDAwMzA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDQw
IDkzIDJkIDhjICB8Li4uLi4uLi4uLi4uQC4tLnwKPiAweDAwMDAwMDQwOiAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4g
MHgwMDAwMDA1MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDAwMDAwNjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDAwMDAw
MDcwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfC4u
Li4uLi4uLi4uLi4uLi58Cj4gMHgwMDAwMDA4MDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDAwMDAwOTA6IDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4u
Li4uLi4uLnwKPgo+IEknbSB3b25kZXJpbmcgaG93IHRoZSBhdXRob3IgaWYgdGhpcyBkcml2ZXIg
KHlvdSwgSUlVQykgaGFzIHRlc3RlZCBpdCBpbml0aWFsbHksCj4gZXNwZWNpYWxseSByZWdhcmRp
bmcgRUNDIGZ1bmN0aW9uYWxpdHkuCgpJIHdhcyB1c2luZyBuYW5kYml0ZXJycyAtaSwgYnV0IEkg
d2FzIG9uIGEgbWFpbmxpbmUga2VybmVsLCBJIG5ldmVyCnRlc3RlZCB0aGUgYmFja3BvcnRzLCBl
dmVuIHRob3VnaCBpZiB0aGV5IHBpY2tlZCB0aGUgZHJpdmVyIGVudGlyZWx5CnRoZXJlIGFyZSBs
aXR0bGUgY2hhbmNlcyB0aGlzIGNvdWxkIGJlIGEgcHJvYmxlbS4KClN1YnBhZ2Ugd3JpdGVzIGFy
ZSBub3JtYWxseSBjb21wbGV0ZWx5IG9ydGhvZ29uYWwgdG8gRUNDIGhhbmRsaW5nLCBzbyBJCnN0
aWxsIGRvIG5vdCB1bmRlcnN0YW5kIHdoYXQgeW91IGdldCBoZXJlLiBNYXliZSB5b3UgY2FuIHRy
YWNrIHRoZQpyZWdpc3RlciBzdGF0dXNlcyBhbmQgbG9vayBhdCB3aGF0IGlzIGRpZmZlcmVudC4K
Ckdvb2QgbHVjayBhbmQgc29ycnkgYnV0IEkgaGF2ZSBubyBpZGVhIHdoYXQgaXMgd3JvbmcgaGVy
ZS4KTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
