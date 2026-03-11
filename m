Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FDF112584F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezJn3xwXDE0N9dOSZFX8Pm8zO0pm5qSwMb14sOx05EA=; b=nzHX9N0jEbp/UW
	//maaPDnBHNAKCeB+E3iPEbmQVGX16v9GUM1wYK3cbI8werravuOW6lAUWFWqYRVbmxaMresW3DYW
	f/exEKqI6amaZYpbi4UPkS9za2fjF02ls24ArWgDYzLNbM80zIWCUZWkZz9lmZcxLYp1+vpj9PeOf
	wYf6GslHuIangTdK6+95jV5RRjr7G54VVpG6BEkf0OBRU9RoglgdmhgyN6/hS0ahBDmlbhxUTDcHb
	2108X3BUfeS4O/J3i5ZIJ20KKesurXQbulZT+GXvjgw0/bfREbAXS/CXYSIH6RkDLITZFgAu0H7AK
	c/+ZsfTC6g8zYShTUuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRY-0000000BoiU-43AJ;
	Wed, 11 Mar 2026 15:25:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LRW-0000000BogP-1bmL
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:25:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 057161A2D8E;
	Wed, 11 Mar 2026 15:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D053860004;
	Wed, 11 Mar 2026 15:25:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5731510369CF8;
	Wed, 11 Mar 2026 16:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773242748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5OW0hen2X3xumMz6+CDqqdmFSpIU00t+KoX9yDahxZ4=;
	b=TLfp3kH0ueoIj2SYieOv0YwFeZu04U9mFbIokviX28QNyVtNv6MRXHdT0jb495ed2JZufB
	JEqaFK8XkhHq939WY4fwToSVVNhr+CQz0k154YwWnq8AHRh0ZZ8tykPGqPghXASEGTTY8k
	10Np6qL44bRwCLpeKiGMpfpMRzj8OxB+kWmbmqpjfRy0t5abxu9TcSdPRyOPuhXEM5u/fN
	UbyTDoSw175FYGGdIQ3FoO0zuzfh4xTuVkxGLm0IcWcbcjkRSz0xBs2/x9DW3ewZax3ZlB
	5hD/vecKIJ1t52ZwkO+pjhfHzHn33/zTXWRHeW8cwmhweQ+L2zBKatDfbfRO5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: robert.jarzmik@free.fr, richard@nod.at, vigneshr@ti.com, 
 James Kim <james010kim@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260309060512.3634570-1-james010kim@gmail.com>
References: <20260309060512.3634570-1-james010kim@gmail.com>
Subject: Re: [PATCH] mtd: docg3: fix use-after-free in docg3_release()
Message-Id: <177324274715.685435.11891174430507900267.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:25:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082550_549685_8182C534 
X-CRM114-Status: UNSURE (   9.28  )
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

T24gTW9uLCAwOSBNYXIgMjAyNiAxNTowNToxMiArMDkwMCwgSmFtZXMgS2ltIHdyb3RlOgo+IElu
IGRvY2czX3JlbGVhc2UoKSwgdGhlIGRvY2czIHBvaW50ZXIgaXMgb2J0YWluZWQgZnJvbQo+IGNh
c2NhZGUtPmZsb29yc1swXS0+cHJpdiBiZWZvcmUgdGhlIGxvb3AgdGhhdCBjYWxscwo+IGRvY19y
ZWxlYXNlX2RldmljZSgpIG9uIGVhY2ggZmxvb3IuIGRvY19yZWxlYXNlX2RldmljZSgpIGZyZWVz
IHRoZQo+IGRvY2czIHN0cnVjdCB2aWEga2ZyZWUoZG9jZzMpIGF0IGxpbmUgMTg4MS4gQWZ0ZXIg
dGhlIGxvb3AsCj4gZG9jZzMtPmNhc2NhZGUtPmJjaCBkZXJlZmVyZW5jZXMgdGhlIGFscmVhZHkt
ZnJlZWQgcG9pbnRlci4KPiAKPiBGaXggdGhpcyBieSBhY2Nlc3NpbmcgY2FzY2FkZS0+YmNoIGRp
cmVjdGx5LCB3aGljaCBpcyBlcXVpdmFsZW50Cj4gc2luY2UgZG9jZzMtPmNhc2NhZGUgcG9pbnRz
IGJhY2sgdG8gdGhlIHNhbWUgY2FzY2FkZSBzdHJ1Y3QsIGFuZAo+IGlzIGFscmVhZHkgYXZhaWxh
YmxlIGFzIGEgbG9jYWwgdmFyaWFibGUuIFRoaXMgYWxzbyByZW1vdmVzIHRoZQo+IG5vdy11bnVz
ZWQgZG9jZzMgbG9jYWwgdmFyaWFibGUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQs
IHRoYW5rcyEKClsxLzFdIG10ZDogZG9jZzM6IGZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBkb2NnM19y
ZWxlYXNlKCkKICAgICAgY29tbWl0OiBjYTE5ODA4YmM2ZmFjN2UyOTQyMGQ4NTA4ZGY1NjliMzQ2
YjNlMzM5CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
