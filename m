Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C406CD8CAD
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OncT4U3P2VP5XTo7lohX41YbONzr2cnv+nWo//qZ6Y=; b=iCSLgfmdNPPDZQ
	qmYSk+zYpkkGlYKqM78mYNHzXTDjRtjp2PkYHOIN7XViW7uzTrFumv6VO6xyqYPBu5HQHozHUWmeL
	L9bwiHShHzfcjDjTU+r9DDHHknp2TjXzGC3u7Av3cgH/8v66KkLv0o1XTgKi9wBQiqQBmBa/jzoId
	40ZDPoE0IVRy5X0LsgO9l/5JdwJ+nPnHYPchpmYXyFkzFU7YBBg4AUumEti2BC2NRl6RkIs3xCH+f
	OseyOcjCsA3+O+3Dt/fK358uCdv8MQoL+nJcB4JslWhvWHxTRYgmLAP10D//YLvG87qKoVEBhJQd0
	7R6Kw9oXK5KegN+PbHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrJk-000000050sF-3Zon;
	Tue, 09 Jun 2026 07:56:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrJj-000000050rv-1JgV
	for linux-mtd@bombadil.infradead.org;
	Tue, 09 Jun 2026 07:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mb2dnBD/xPkozFuDbis7Gifd5+A09teiekEygmEENbI=; b=oXIDvzV0niRB0AIWxUjimLltW9
	klYlrO5Lkx23FO8lDzoe9Vg3sW6GJQdfjc5iWJUpvVUwZVlbMRQlG6kHQl10AE1/7zFM/T3V2fO8S
	gOFNwtz0P7TW+ltpaBKNdvndYF3uYpDBtJR0TmiWEQRi/4RSWFw8K0aIOX8Tz4qB/VkciHBfuF0Cr
	Rs5wd5n+orFXqnl4GkN86b2QQ912T20FfTlrVn7Kuzz1Tr47VHVKFv6gsh4CQlBzrwfeDa3wX6DqS
	jjmDEOstkc6z+/BWBTJA4XjzbKsSh7WwWKck8kPr1RlXqc6LxV9xm2fj0MBIMyPADsOTX9z9pO+LA
	BEuEWfXg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWrJg-0000000281v-1pFl
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 07:56:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 403C44E42C88;
	Tue,  9 Jun 2026 07:56:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 141BC5FFC1;
	Tue,  9 Jun 2026 07:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C848106A2A14;
	Tue,  9 Jun 2026 09:56:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mb2dnBD/xPkozFuDbis7Gifd5+A09teiekEygmEENbI=;
	b=F6rMLRwG1YGHPPHFu9Lkx5C31IrPBfKdAcVAUBj09KvhQX6xzbD3xkD9TBKq0bckwxrOCH
	zQFnVY6up6wpHX0N1aZnFjKF3swYVLlX+BwY4zyeYs8VSf0Pce3nM32RMMrcKXDa36jqkX
	thikqIrO/jhZqCV6A+BFsSdGbQy/yqqrD4tOC/pLkvkEtSkLLWRu/DX8i0BUpGCvUmjuPZ
	5dexYKlSEKIrFVL/rgmty7T9O6WjxFoBHq+fqvQwEY4jW/74tbBZuV/+663LaVoVRvbS0S
	EQhGBfSpP75Gyky0dlWIjb+LSmUADQMk9K0P4dsNT3v2U+2UQvx32jMumKnDsQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: slram: avoid dangling device list entries
In-Reply-To: <20260608162939.6-1-ruoyuw560@gmail.com> (Ruoyu Wang's message of
	"Tue, 9 Jun 2026 00:29:39 +0800")
References: <20260608162939.6-1-ruoyuw560@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 09:56:04 +0200
Message-ID: <87h5ncb10r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_085608_735288_6DBB12F4 
X-CRM114-Status: UNSURE (   9.52  )
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

SGVsbG8gUnVveXUsCgpPbiAwOS8wNi8yMDI2IGF0IDAwOjI5OjM5ICswOCwgUnVveXUgV2FuZyA8
cnVveXV3NTYwQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHJlZ2lzdGVyX2RldmljZSgpIGxpbmtzIGEg
bmV3IHNscmFtX210ZGxpc3QgZW50cnkgYmVmb3JlIHRoZSBlbnRyeSBpcwo+IGZ1bGx5IGluaXRp
YWxpemVkLiBJZiBhIGxhdGVyIGFsbG9jYXRpb24sIG1lbXJlbWFwKCksIG9yCj4gbXRkX2Rldmlj
ZV9yZWdpc3RlcigpIGZhaWxzLCB0aGUgZmFpbGVkIGVudHJ5IGNhbiByZW1haW4gcmVhY2hhYmxl
IGZyb20KPiB0aGUgZ2xvYmFsIGxpc3QgYW5kIGxhdGVyIGNsZWFudXAgY2FuIGRlcmVmZXJlbmNl
IG9yIGZyZWUgaW52YWxpZCBzdGF0ZS4KPgo+IEJ1aWxkIHRoZSBuZXcgZW50cnkgb2ZmLWxpc3Qs
IHVud2luZCBwYXJ0aWFsIGluaXRpYWxpemF0aW9uIGxvY2FsbHkgb24KPiBmYWlsdXJlLCBhbmQg
b25seSBwdWJsaXNoIHRoZSBlbnRyeSBhZnRlciBtdGRfZGV2aWNlX3JlZ2lzdGVyKCkKPiBzdWNj
ZWVkcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFJ1b3l1IFdhbmcgPHJ1b3l1dzU2MEBnbWFpbC5jb20+
CgpJIGFtIHNvcnJ5IGJ1dCBJIGNhbm5vdCB0YWtlIHRoaXMgcGF0Y2ggYXMtaXMgYmVjYXVzZSBp
dCBkb2VzIHdheSBtb3JlCnRoYW4gd2hhdCB5b3UgY2xhaW0uIEl0IG1ha2VzIGEgbG90IG9mIGNs
ZWFudXAgY2hhbmdlcyB3aGljaCBhcmUgdG90YWxseQp1bnJlbGF0ZWQgKHlldCB3ZWxjb21lKS4g
UGxlYXNlIGNyZWF0ZSBhIHNlcmllcyB3aXRoOgotIHRoZSBmaXggKHRoYXQgY2FuIGJlIGJhY2tw
b3J0ZWQpIGZpcnN0LCB3aXRoIENjOiBzdGFibGUgYW5kIEZpeGVzOiB0YWdzCi0gYWxsIHRoZSBj
bGVhbnVwcyB5b3Ugd2FudCB0byBkbyBhZnRlci4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
