Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B57C30653
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFtR0Ovxi/wsxfXOnmjet4ls+qjdJExgK5ptrgC7FVI=; b=29rUZSF6xeH6kA
	jxzqZl0ZWCN0FH+Sfp+FDc8q1IIFjTpXFc8HPz90f2PPUM4LsZtkHFzZC5QiP00ugXtjgkgKMmpSl
	qmBOfwtp40dDDyDqgzKxsvsDpxOwFOdBhSCNuvVPQBGfk+C0mf4tWPxBAxmC8xSRCdnCNhFvOgrFD
	EOfsZ7G6c5ZbIFNA9mxDspV99g9Wlorv5bcv0hFIzeoBCr47GbaScBAI8ldaMjBm4SQpC3tEvE0Kn
	XCe/OgO3+2zGe50t/lJz+vo74wWHKZKkzOH2ietxWYl+maCUcEcp3D/gmWEwoWnFMTfsGDPpCDwpT
	xSi3+ZEuiosWhVTYuM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGG6-00000003Fgd-1wkA;
	Mon, 01 Jul 2024 12:35:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFqF-000000033YW-38Ci
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:09:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86A046000C;
	Mon,  1 Jul 2024 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NNHFXuboV35aybAAtJgPt+uHy7GJqBm0IfKboXBxs+s=;
	b=gtFWtrtUHiEHXWBUvLvImnMb5SkMPmovx9sNgbE6qtEy+vKdIN/mHwN6GW8VfhDLWURTrY
	yiKOgkscs7FmbNd6B6M5Z59l8RgRPuLcuEUbT0OPVdc+TGjIHnwFhn8HIbmtleLj5xp7ic
	AkA9dSeyaxqatWh7BItC191jY7onPOhqGKsrcLWYnCWPTe5KHqkjjzn5CG9fS36rOX2VBi
	6vmln2BJmV31n9R1/m30wfgiuC0jPIi6+2v8OvK5080kjVv0tvXdTYFAeWtjka+5CWkVvJ
	Hp1+kpS/4EGAtv5wJSEsN0HIpqViNYuPkkys/HbSduTQNFU1lHp9qebFyjcaPg==
Date: Mon, 1 Jul 2024 14:08:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for 6.10-rc7
Message-ID: <20240701140851.307df5e3@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050907_947933_CCD21332 
X-CRM114-Status: UNSURE (   8.09  )
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

SGkgTGludXMsCgpIZXJlIGlzIGEgZml4ZXMgUFIgZm9yIHRoZSBuZXh0IC1yYy4KClRoYW5rcywg
Ck1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTYxM2U2MDRkZjBj
ZDM1OWNmMmE3ZmJkOWJlN2EwYmNmYWNmYWJkMDoKCiAgTGludXggNi4xMC1yYzEgKDIwMjQtMDUt
MjYgMTU6MjA6MTIgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuMTAtcmM3Cgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gYjI3ZDg5NDZiNWVkZDk4MjdlZTNjMmY5ZWExZGQzMDAyMmZiMWViZToKCiAg
bXRkOiByYXduYW5kOiByb2NrY2hpcDogZW5zdXJlIE5WRERSIHRpbWluZ3MgYXJlIHJlamVjdGVk
ICgyMDI0LTA1LTI3IDEzOjQyOjI1ICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSYXcgTkFORDoKClJvY2tjaGlw
IE5BTkQgY29udHJvbGxlciBkcml2ZXIgd2FzIG5vdCBjaGVja2luZyB0aGUgdGltaW5ncyBwcm9w
ZXJseQphbmQgdGhlIGludHJvZHVjdGlvbiBvZiBOVi1ERFIgc3VwcG9ydCBicm9rZSBpdC4KClRo
ZSBjb3JlIHdhcyBhbHNvIG1pc2JlaGF2aW5nIGluIHNvbWUgdmVyeSBzcGVjaWZpYyBjYXNlczog
aW4gY2FzZSBvZgoodW5saWtlbHkpIGJpdGZsaXBzIGluIHRoZSBwYXJhbWV0ZXIgcGFnZSwgdGhl
IGZhbGxiYWNrIG1pZ2h0IGhhdmUKZmFpbGVkIGFzIHdlbGwgYnV0IGZvciBzb2Z0d2FyZSByZWFz
b25zLgoKRmluYWxseSwgdGhlIGNob3NlbiBFQ0MgY29uZmlndXJhdGlvbiB3YXMgbm8gbG9uZ2Vy
IHByb3Blcmx5IHByb3BhZ2F0ZWQKdG8gdXBwZXIgbGF5ZXJzLCBtb3N0bHkgZmFpbGluZyBhbiBp
bmZvIG1lc3NhZ2UgYXQgcHJvYmUgdGltZS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWlxdWVsIFJheW5hbCAoMyk6CiAg
ICAgIG10ZDogcmF3bmFuZDogRW5zdXJlIEVDQyBjb25maWd1cmF0aW9uIGlzIHByb3BhZ2F0ZWQg
dG8gdXBwZXIgbGF5ZXJzCiAgICAgIG10ZDogcmF3bmFuZDogRml4IHRoZSBuYW5kX3JlYWRfZGF0
YV9vcCgpIGVhcmx5IGNoZWNrCiAgICAgIG10ZDogcmF3bmFuZDogQnlwYXNzIGEgY291cGxlIG9m
IHNhbml0eSBjaGVja3MgZHVyaW5nIE5BTkQgaWRlbnRpZmljYXRpb24KClZhbCBQYWNrZXR0ICgx
KToKICAgICAgbXRkOiByYXduYW5kOiByb2NrY2hpcDogZW5zdXJlIE5WRERSIHRpbWluZ3MgYXJl
IHJlamVjdGVkCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgICAg
ICAgfCA2OCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jIHwgIDYgKystLQogMiBmaWxl
cyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
