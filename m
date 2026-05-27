Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D3ACD5BD0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpoNK77drrTltX51BIgEuB6WEtPmadH/e3vLtREoH/c=; b=y/Cx6C1nxfM92t
	vNylW0mLosqIa43LjQq/VbUJQdKmc1NvLcNjS7efL2vWfXw8nJ9bxhFh4fOSxAu1UIJshUABwUX6F
	oU4G6KJitexQTKGUv54dv1wxdPRcne502iR6CHrfjgU3QcGCwG6wZ24yWOp6ufHykptg61cfKrRRH
	luNZlVEvCHacIcz917AIdL950BImnoImEYw2UmP9GfZwIOshv2kCVo+SK9t1m2L6i0ZosyHChbTKZ
	hjEVH22biW6VlJhY1+xRYfSkxq7eitx6AagvXGo2OuePZfYCl+EfYu1hppu7rILXQKmF4otE3HzPr
	/4jGLpote2oaUDPgvwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDQQ-000000045rD-1nMk;
	Wed, 27 May 2026 12:31:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDQO-000000045qh-25rg
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 12:31:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1706F4E42D68;
	Wed, 27 May 2026 12:31:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D76FF601A1;
	Wed, 27 May 2026 12:31:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9ED2210888057;
	Wed, 27 May 2026 14:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779885110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lxHtVaQbf91eKij/kgLnjYMNpqvqM6I7+CyEk9qbUmo=;
	b=hkILlpvDNpFJbi7EIYdgHX6HQ+VgiBZbvXFqw9/Q88AbMAyCFqt+jwEyTax/2cwXLNbswE
	MXW7FYlYfkRa8GA/cqANgDS7I6qGN8UXmqdmtYV7enwW70fEsJ7HnRK/OvxDYQOdAIV0tK
	FJeb0aP4P6+Cv5y9rLVINC1jsbw1OME9U4XDb2mY5CwQQEaDbhWsviBfv8mnwbp+guYp+D
	b3FEKoFhet7BfaJNiRXOy3PTtKXQeUVibjnhA9ZVTvXHdQSoI6KDnQoLx7tIDszWhWrapA
	5MjYiOXiCZ5ZMe6tZpEhubxtw1S2Dr+96U7nLa0hrV6co/zJ6ZUOM1w8RT1QEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: maps: remove AMD =?utf-8?Q?=C3=89lan?=
 specific drivers
In-Reply-To: <6909a1ef-355b-41a9-9ce5-ae0c9c993b25@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 27 May 2026 11:34:30 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
	<87fr3djjhl.fsf@bootlin.com>
	<6909a1ef-355b-41a9-9ce5-ae0c9c993b25@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 14:31:47 +0200
Message-ID: <87pl2hhw3w.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_053152_671696_CB334891 
X-CRM114-Status: UNSURE (   7.43  )
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

SGkgQXJuZCwKCk9uIDI3LzA1LzIwMjYgYXQgMTE6MzQ6MzAgKzAyLCAiQXJuZCBCZXJnbWFubiIg
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgoKPiBPbiBXZWQsIE1heSAyNywgMjAyNiwgYXQgMTE6MjEs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDI2LzA1LzIwMjYgYXQgMTI6MzI6MDQgKzAyLCBB
cm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAgICAgIDMgZmlsZXMgY2hh
bmdlZCwgNDY5IGRlbGV0aW9ucygtKQo+Pgo+Pgo+PiBJcyBpdCBva2F5IGZvciB5b3U/Cj4KPiBM
b29rcyBnb29kIHRvIG1lLCB0aGFua3MgYSBsb3QgZm9yIHJlYmFzaW5nIHRoZSBwYXRjaC4KCk5v
IHByb2JsZW0gOiksIG5vdyBwdXNoZWQgdG8gbGludXgtbXRkIGJyYW5jaCBtdGQvbmV4dC4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
