Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A6DC55822
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgafcGpQDbcTQH2AWA+kBXKl3L+Od7aW8LQLMgNln9Q=; b=fBck4oXRBbqWqr
	0XZ7XUn6Zhm/9P3dL/O7XGNLc0L8xMyjzmTtVeH9H4QWL//Dmt8SWjiIPfLDpFPSvvyONF3YYmrNw
	PqgIQ6aexi7ZbQap4YPmBJA35Smm2PICTjtoiZLtVl+sRGGbnRkJGAGqdugkrqLn8Z4bR/s50DR+8
	g6qtPAiiifZF0GKuIzzcyMxpCYlqIKgfXGiRX1RmXawk5fXu0hEBarmvNlwOW2V5hAaHUw7xW0tZ2
	5loFLXGpq2Cxosq6CAP+1Z5LtaE0U5MYd/UjV8Gb9CEq1B6wvz9JRl0PVG93ZUEhPX4D7zdoIDv4U
	NQppghsHSZr+4o2bCv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaU-00000003SX3-0rUs;
	Wed, 05 Aug 2026 08:02:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaR-00000003STO-1NyR
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:02:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DAFA21A1436;
	Wed,  5 Aug 2026 08:02:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B01AB602AB;
	Wed,  5 Aug 2026 08:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC3EB11C33817;
	Wed,  5 Aug 2026 10:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fd/aDjeEfnnm6kU3tUkNFm0RI2r2lxwNzxa4rFpwOJA=;
	b=Hol8OfC5t9QQ0PpkwKiPvg13M7dIIAWu19Ic4oObTR63F4b4DhNsx0wE9FgqCA4cFb/xZC
	MnjmG2dJrWG7mXvJTGPF0ywa6gbun0K76IW4vxFX2oT1Pkh/pkYbsMI5RgALfLUv1hwPa1
	wi/arq2HKR3bHDa2OBfvURByvLPUW8gGbTN0Qbaau0fz1Cpyigu8FUUjzUjqZLyuq7P6eJ
	0T9c4TElPjiyoal59j3VTQBOf6hEqUfKvG7CBit5nWtIeipofqacdQa9RX3/LJtvSlfzDy
	LtXBCRFwe3+V4B6idFDygOafviM7nWFAhbIVCpXZnrJacuFfpslouwfgbvP52Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:30 +0200
Subject: [PATCH v5 05/28] mtd: spi-nor: Init flags before manufacturer
 late_init() hooks
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-5-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010251_529700_69B78222 
X-CRM114-Status: GOOD (  12.09  )
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
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCmluZGV4IGI0ZDA5ZjE0ZmZmNy4uZmVmN2Y0
MjZhM2EyIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYworKysgYi9kcml2
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
