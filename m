Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BA0C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcfaclNcCX5koBfL2HRpRKoTnkdpj6ZZ9XdkAY5MKGc=; b=vfcpxj0QKdGjyP
	NAKwX3icEbNaURtotmiD1kYZjF0UPty1W+DXVlhX1uBJPgqTWbSBsCbC23/TzBlJidupk/gIHqk3m
	2YmCkpFAsjp0MO3kE8nu9i7pQdQCa1UkZVkAZoPp1W3hHUuadlQnG/4WI+jwebXK2Tp0VjgK/CeWc
	EzN1GifkgSgVzkLXP92a0iii1HWwviIL6Ge0pcXlcEBHTDu8JwtpXbTDWinlhmXma/VdkczNeFpCw
	PFOOLKa0ipViJp/RXG7zl4y0M7u71vSBBWTmt3EF1dChCTvAwg8saCdH9qGY63UVbM01wYrADCQpJ
	xXMu7eYsipqXkm5x3Acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8jQ-00FyyS-EV; Fri, 03 Dec 2021 13:36:08 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8jK-00FywI-PI
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 13:36:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 038B5200007;
 Fri,  3 Dec 2021 13:35:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: mpc5121: Remove unused variable in
 ads5121_select_chip()
Date: Fri,  3 Dec 2021 14:35:56 +0100
Message-Id: <20211203133556.1372731-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211122132138.3899138-1-geert@linux-m68k.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'33a0da68fb073360d36ce1a0e852f75fede7c21e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_053603_008933_9404194D 
X-CRM114-Status: UNSURE (   7.08  )
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

T24gTW9uLCAyMDIxLTExLTIyIGF0IDEzOjIxOjM4IFVUQywgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L21wYzUxMjFfbmZjLmM6IEluIGZ1bmN0aW9uIOKA
mGFkczUxMjFfc2VsZWN0X2NoaXDigJk6Cj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9u
ZmMuYzoyOTQ6MTk6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhtdGTigJkgWy1XdW51c2Vk
LXZhcmlhYmxlXQo+ICAgMjk0IHwgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQo
bmFuZCk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICBefn4KPiAKPiBGaXhlczogNzU4YjU2
ZjU4YjY2YmViYyAoIm10ZDogcmF3bmFuZDogUGFzcyBhIG5hbmRfY2hpcCBvYmplY3QgdG8gY2hp
cC0+c2VsZWN0X2NoaXAoKSIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4K
Ck1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
