Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57710C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A03061B5E
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A03061B5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06s2LSf3NyogP7MQPd7fC1sAZTjjWU/73mMmCI+aM2M=; b=EWCx5AQ2KbAiil
	g8jsuXr56IA2E7zEduEhi17S0yWjoP71ogW/gUywFb9gvkWluzUy4lfEoArq5num1K8+jcScL4FH9
	2pGaIhjgFQuIWxU41biZ3J4W9kW9nuA5zQL8grGC7M0pqdTkOj2awFcu1ZUyUm6aU6RjxYOp8k/9h
	6a3kvXh/pWCjSCy7C3kxhl5N/n7vyHGBDm/FvQF6lfz7Y2PMaEzG01I75G11Q9X9EtIXtPVh+gNF1
	BSSHy0Bt2ttzKeICY0Cdu6bGeSPCKVxgkamcHPuSvfBE+GxTxVOfSJG0v0kK9Q5mb46tOvpQj5ISD
	w0vg8v/TsTQrUx/SaBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8jS-00BIGF-9V; Fri, 19 Nov 2021 18:35:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jB-00BI9O-33
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DA493FF804;
 Fri, 19 Nov 2021 18:35:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: mchp23k256: Warn about failure to unregister mtd
 device
Date: Fri, 19 Nov 2021 19:35:10 +0100
Message-Id: <20211119183510.1329796-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211108093153.63792-2-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'45c26c1f6b2d995ba44c20186ee72bfb561bdc9b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103513_344034_347C1C9B 
X-CRM114-Status: UNSURE (   8.51  )
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

T24gTW9uLCAyMDIxLTExLTA4IGF0IDA5OjMxOjUwIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHNob3VsZG4ndCBm
YWlsLiBXYWlsIGxvdWRseSBpZiBpdCBkb2VzIGFueWhvdy4KPiAKPiBUaGlzIG1hdGNoZXMgaG93
IG90aGVyIGRyaXZlcnMgKGUuZy4gbmFuZC9yYXcvbmFuZHNpbS5jKSB1c2UKPiBtdGRfZGV2aWNl
X3VucmVnaXN0ZXIoKS4KPiAKPiBCeSByZXR1cm5pbmcgMCBpbiB0aGUgc3BpIHJlbW92ZSBjYWxs
YmFjayBhIGdlbmVyaWMgZXJyb3IgbWVzc2FnZSBieSB0aGUKPiBzcGkgZnJhbWV3b3JrIChhbmQg
bm90aGluZyBlbHNlKSBpcyBzdXBwcmVzc2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpBcHBsaWVkIHRvIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
