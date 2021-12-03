Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F72C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5VmK/Pb+0lyiD10k8AaiC+3JFi8KzUoXurvi7kIKM8=; b=lgvhI6S6R/l7Xz
	/Wp29Ns/YcbXKpuXYy/OiDdhq8oOz91OTbmRncys1evgomfbC24Brwv3DQs3tNcWkqnpRQ2kdkOWR
	u6wsgX4aVp//lt1AQhaseqxEHd9CpD3BpHZla0geEuefOPgYMUQgFKnfaDVyJIs/kBIE739CIWDKe
	NbttGZFDqpvRgyKiTzBqTfl/BBOWXQzlCu3WCA51whL4MI1ceJ1WAnVKrnIhSwOnal6gZhC+altmu
	ZuIKIwAu+qLKUfzyFrXOsvZX19PYAtiz1qqvERZKOScchaBa98h+VNTHg3NjjRuZPIBQphzPY2MiY
	da5E3xSbAQw3IHzfmEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8kg-00FzJV-SI; Fri, 03 Dec 2021 13:37:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8ke-00FzI0-3A
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 13:37:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8F904240009;
 Fri,  3 Dec 2021 13:37:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtdchar: prevent unbounded allocation in MEMWRITE ioctl
Date: Fri,  3 Dec 2021 14:37:20 +0100
Message-Id: <20211203133721.1449880-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211130113149.21848-1-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ab14a0c836f88996e4151381a06b632e1524cec7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_053724_294867_15825510 
X-CRM114-Status: UNSURE (   9.93  )
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

T24gVHVlLCAyMDIxLTExLTMwIGF0IDExOjMxOjQ5IFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IEluIHRoZSBtdGRjaGFyX3dyaXRlX2lvY3RsKCkgZnVu
Y3Rpb24sIG1lbWR1cF91c2VyKCkgaXMgY2FsbGVkIHdpdGggaXRzCj4gJ2xlbicgcGFyYW1ldGVy
IHNldCB0byB2ZXJiYXRpbSB2YWx1ZXMgcHJvdmlkZWQgYnkgdXNlciBzcGFjZSB2aWEgYQo+IHN0
cnVjdCBtdGRfd3JpdGVfcmVxLiAgQm90aCB0aGUgJ2xlbicgYW5kICdvb2JsZW4nIGZpZWxkcyBv
ZiB0aGF0Cj4gc3RydWN0dXJlIGFyZSA2NC1iaXQgdW5zaWduZWQgaW50ZWdlcnMsIHdoaWNoIG1l
YW5zIHRoZSBNRU1XUklURSBpb2N0bAo+IGNhbiB0cmlnZ2VyIHVuYm91bmRlZCBrZXJuZWwgbWVt
b3J5IGFsbG9jYXRpb24gcmVxdWVzdHMuCj4gCj4gRml4IGJ5IGl0ZXJhdGluZyBvdmVyIHRoZSBi
dWZmZXJzIHByb3ZpZGVkIGJ5IHVzZXIgc3BhY2UgaW4gYSBsb29wLAo+IHByb2Nlc3NpbmcgYXQg
bW9zdCBtdGQtPmVyYXNlc2l6ZSBieXRlcyBpbiBlYWNoIGl0ZXJhdGlvbi4gIEFkb3B0IHNvbWUK
PiBjaGVja3MgZnJvbSBtdGRfY2hlY2tfb29iX29wcygpIHRvIHJldGFpbiBiYWNrd2FyZCB1c2Vy
IHNwYWNlCj4gY29tcGF0aWJpbGl0eS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGHF
giBLxJlwaWXFhCA8a2VybmVsQGtlbXBuaXUucGw+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQs
IHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
