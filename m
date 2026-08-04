Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C9C55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cha31XIUPXGnxtWssh12W53wYCgM9q9gHJdYTouQGIw=; b=FK2Qz4U4KS6pSo
	gQCA92TCKNL6d30GYMkIdGoq8W7v1e7TawivbLs3b9gARdz+2D/wm6Y1F+sFDzYs0PGt6zZOZd0fQ
	zd4CvMUnO1pY57YUHYFZeJPKkIi1/f3SVUbGx/OusJxkcyEuIFg+4lkzuuN5DmZFsAGw3YOJonGyJ
	5uMRvgIhXxO6aHXAxBrCukaTHJt/siW299mCLA9cKmwS59qVYv6y7KwWg06Esh+d2VH4SXl3eip1R
	qNKcvXtn7RAcYLN1TModVjjqkkDkwMIHPPrEY3NCQbdaYLdUep6lp4JJUABzko2NiAyMcv6LlG54L
	up4KhDUUBe4J/MYu6feQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCs7-00000001bmV-1YaU;
	Tue, 04 Aug 2026 10:59:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCs5-00000001bl5-1bFu
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 10:59:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD4A24E410D8;
	Tue,  4 Aug 2026 10:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD2786029E;
	Tue,  4 Aug 2026 10:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA07311C32B30;
	Tue,  4 Aug 2026 12:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841179; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ceoep4DFrRBDKLIvFVPMJoKcvPMZqPAfEkP2bndx0is=;
	b=2Fi4mTZvj2vWlwJx2hekd5WGVM0iMkwejGK78BNiLG1jREuPL+yXtRVkmzm9iv68p7ZfZI
	xTsN20zvr2mS9ZoxZsxN5p8ybRHqDWMXe0gh65tzyZC3YfSqWxfjCHe4PQrG2GFI1DU7Yz
	Ti05oWLyjWshKiK0YD66YJ8xmIJja5S3FQt08dlAFtpXMT6+FcVR9LfWEu5deHVNYnohos
	Dp81v1Fkk9X33U3WghQ/XubNJUaXd02dpqsQ2nbM2R5g+SQeVWGz/zf43e0qJRYnCb+tml
	GfP6Lw5WvqLF3vQeyD1CQtEaIOEE7P9BKY+bN/ObrHLoUjOayebPdzvhXgTQAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:02 +0200
Subject: [PATCH v3 04/27] mtd: spi-nor: Init flags before manufacturer
 late_init() hooks
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-4-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_035945_560425_1E265BFA 
X-CRM114-Status: GOOD (  12.05  )
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

Q3VycmVudCBpbml0IG9yZGVyIGlzOgotIFRoZSBtYW51ZmFjdHVyZXItd2lkZSBsYXRlX2luaXQo
KSBob29rIGlzIGNhbGxlZC4KLSBUaGUgY29yZSBpbml0aWFsaXplcyBzb21lIGNoaXAgZmxhZ3MK
LSBUaGUgY2hpcCBzcGVjaWZpYyBsYXRlX2luaXQoKSBob29rIGlzIGNhbGxlZC4KClRoaXMgZG9l
cyBub3Qgc2VlbSB2ZXJ5IGNvbnNpc3RlbnQgc2luY2UgYm90aCBsYXRlX2luaXQoKSBtYXkgbmVl
ZCB0bwp0b3VjaCBmbGFncywgd2hpY2ggaXMgdGhlbiBub3Qgd29ya2luZyBhcyBleHBlY3RlZCBz
aW5jZSB0aGUgb3JkZXIgaXMgYQpiaXQgaW5jb25zaXN0ZW50LiBNb3Zpbmcgc3BpX25vcl9pbml0
X2ZsYWdzKCkgZWFybGllciwgcmlnaHQgYmVmb3JlIHRoZQptYW51ZmFjdHVyZXIgbGF0ZV9pbml0
KCkgY2FsbCwgZW5zdXJlcyB0aGUgaG9vayBzZWVzIHRoZSBmbGFncyBhZnRlcgp0aGVpciBpbml0
aWFsaXphdGlvbiwgYW5kIGNhbiB0aGVyZWZvcmUgYXBwbHkgY2hhbmdlcyB0byB0aGVtLgoKU2lu
Y2Ugc3BpX25vcl9pbml0X2ZsYWdzKCkgb25seSByZWFkcyAtPmluZm8tPmZsYWdzIGFuZCBEVCBw
cm9wZXJ0aWVzLAppdCBkb2VzIG5vdCBkZXBlbmQgb24gYW55dGhpbmcgYSBsYXRlX2luaXQoKSBo
b29rIHByb2R1Y2VzLiBPbiB0aGUgb3RoZXIKaGFuZCwgbm8gbWFudWZhY3R1cmVyIGxhdGVfaW5p
dCgpIGhvb2sgY3VycmVudGx5IHRvdWNoZXMgYW55IG91dHB1dCBvZgpzcGlfbm9yX2luaXRfZmxh
Z3MoKSBlaXRoZXIuIFJlb3JkZXJpbmcgc2VlbXMgc2FmZeKEoi4KClNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCmluZGV4IDBjODYzMGE1NDk4NS4uNTNkOWE0
ODRlNDM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYworKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwpAQCAtMzAxNCw2ICszMDE0LDkgQEAgc3RhdGljIGludCBz
cGlfbm9yX2xhdGVfaW5pdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikKIAlzdHJ1Y3Qgc3Bp
X25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwogCWludCByZXQ7CiAK
KwkvKiBOZWVkZWQgYnkgc29tZSBsYXRlX2luaXQgaG9va3MgKi8KKwlzcGlfbm9yX2luaXRfZmxh
Z3Mobm9yKTsKKwogCWlmIChub3ItPm1hbnVmYWN0dXJlciAmJiBub3ItPm1hbnVmYWN0dXJlci0+
Zml4dXBzICYmCiAJICAgIG5vci0+bWFudWZhY3R1cmVyLT5maXh1cHMtPmxhdGVfaW5pdCkgewog
CQlyZXQgPSBub3ItPm1hbnVmYWN0dXJlci0+Zml4dXBzLT5sYXRlX2luaXQobm9yKTsKQEAgLTMw
MjEsOSArMzAyNCw2IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKHN0cnVj
dCBzcGlfbm9yICpub3IpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCS8qIE5lZWRlZCBieSBzb21l
IGZsYXNoZXMgbGF0ZV9pbml0IGhvb2tzLiAqLwotCXNwaV9ub3JfaW5pdF9mbGFncyhub3IpOwot
CiAJaWYgKG5vci0+aW5mby0+Zml4dXBzICYmIG5vci0+aW5mby0+Zml4dXBzLT5sYXRlX2luaXQp
IHsKIAkJcmV0ID0gbm9yLT5pbmZvLT5maXh1cHMtPmxhdGVfaW5pdChub3IpOwogCQlpZiAocmV0
KQoKLS0gCjIuNTQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
