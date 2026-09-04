Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C2C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWOR6H5Y/I1SXMOSjOE5b6v+KB8VOckZORzPNpbLyww=; b=iK73XRcbw4uigM
	105FschNdK4aawBfrY04v/jvkMAYDS7W9rWNllwDoEgWdIdQXOdUqI3TyKquLekUP9ow0YKIxJvne
	jW6BDOx7FAv9tOlQYPY1qKM6h15zqGvAIi9S+NRT8o/fKudpdbA5B89ZUUsAnQudJCWsdSSz37tyl
	otIfvie3NbkmWDC83Uo5cwkezx1vihCQsQdLITDUC6jlEEjAgcvBHoloBEcX0PKZ3ThgEGAbJfxdg
	SiVz2j76eVTr/etqi9DLW7c8puyPM2p61mbiHP/Zpp9zxhdudLrMIcTt0V+5UpmbCV3DlhyUdtU25
	XLFUouWwvkccakBmNuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZS-00000002qj5-0WP1;
	Fri, 04 Sep 2026 17:19:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZQ-00000002qiL-0ySI
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF2AA1A19B0;
	Fri,  4 Sep 2026 17:19:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 840B56057F;
	Fri,  4 Sep 2026 17:19:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 398E311C783E9;
	Fri,  4 Sep 2026 19:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xTQcDpPMuDinI2Tj7TOvylmqU2iIXxdrXUnFujqV36o=;
	b=N/nY2YBwl9DE6SeG+YFEEvBs/yEVJsbuEvSkCDTJsfg4UbXlvsD0fPC3MkVewN6rm3gXlK
	Up0XvGzaOW+ByrzsDyMkpePIr6yk3033anQ1fDIBaAtVExagmnEKGSRZcFi7I94KIviw+W
	WdGU2M0YtX1X2/clZnQPe39RP+NzMXqY9trzjXZ5ZNTt5PMGCBSteTDXYS4u/MCv0OaRNa
	ZcXsBKLiqCrBelqsbeQz6L82f65VVZyCK5Jag+nGIBfdefLPuI0DlizmMXVYuj5m4VkPDe
	zBeV6QQrxuK7bK5ZJgKSkWZT77TqXfyKaucRtIt1baR9vVdZm8rhz7hq7as2zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:56 +0200
Subject: [PATCH v6 03/26] mtd: spi-nor: Init flags before manufacturer
 late_init() hooks
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-3-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_101920_418838_E35B4374 
X-CRM114-Status: GOOD (  11.73  )
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
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCmluZGV4IGZjYTBkNjVhNmYwNi4uZDk4MjE2
MjBmNTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYworKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwpAQCAtMzAwNyw2ICszMDA3LDkgQEAgc3RhdGljIGludCBz
cGlfbm9yX2xhdGVfaW5pdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikKIAlzdHJ1Y3Qgc3Bp
X25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwogCWludCByZXQ7CiAK
KwkvKiBOZWVkZWQgYnkgc29tZSBsYXRlX2luaXQgaG9va3MgKi8KKwlzcGlfbm9yX2luaXRfZmxh
Z3Mobm9yKTsKKwogCWlmIChub3ItPm1hbnVmYWN0dXJlciAmJiBub3ItPm1hbnVmYWN0dXJlci0+
Zml4dXBzICYmCiAJICAgIG5vci0+bWFudWZhY3R1cmVyLT5maXh1cHMtPmxhdGVfaW5pdCkgewog
CQlyZXQgPSBub3ItPm1hbnVmYWN0dXJlci0+Zml4dXBzLT5sYXRlX2luaXQobm9yKTsKQEAgLTMw
MTQsOSArMzAxNyw2IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKHN0cnVj
dCBzcGlfbm9yICpub3IpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCS8qIE5lZWRlZCBieSBzb21l
IGZsYXNoZXMgbGF0ZV9pbml0IGhvb2tzLiAqLwotCXNwaV9ub3JfaW5pdF9mbGFncyhub3IpOwot
CiAJaWYgKG5vci0+aW5mby0+Zml4dXBzICYmIG5vci0+aW5mby0+Zml4dXBzLT5sYXRlX2luaXQp
IHsKIAkJcmV0ID0gbm9yLT5pbmZvLT5maXh1cHMtPmxhdGVfaW5pdChub3IpOwogCQlpZiAocmV0
KQoKLS0gCjIuNTQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
