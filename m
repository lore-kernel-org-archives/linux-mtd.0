Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19445C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRnYrp2hM5Ks3wjimRnztXdPwMdpO6nPljrMP+m4tLs=; b=UWuGbtJsUmwQZI
	X5nq2OuTZao7rQVMePzCX5BmRU4Eju+hTXEzJv6DL2F1xo3ZNv3knnq1DsytM6AAvKPn/b0+54be2
	s4t7ZvXHHhPLsqZl0vWry9C2RWJmVOy3b+k5oTdsAFE/0we+YKiMWQyzwvzmuRr3gt3PjcXd44BHR
	5nh2p2Isni6YCnmSVZ9xm0krB1lj1di0cGeASYee1hRTbDgepGaOjJlc9PfO24MbNkGFnWVXGZnCn
	EGw5a5GDwpc+lLKnk/qTApqE7ZK1v72qn+g5imvCNFvCsUCll0bzhUEAwJn3NDvHfrNxxR9fg9TUQ
	q5e23hzqLVoKf+UAcLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiOC-00GdG6-Hd; Wed, 09 Feb 2022 08:31:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHiO8-00GdE0-Fe
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 08:31:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2BB6C000B;
 Wed,  9 Feb 2022 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644395501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yn/tDzsvR67+hM5dhzHnFqmkUv46YSHjaLURannh73M=;
 b=FFM4bbu7zjLpioUf4sgYhH0feSKroqMddbwES59Cisxhrz0HVINB0uo61wvlbEntoL1fAv
 ThQ3oxeJfm3wLHvj2sj3Vfei6jWTHvpl7YhGeRA3PQ1cmz7B8BkusoYFpHsruNLXdZeYPi
 BD9u0h+IlvLHyQ2bNT9ZL3jn4MeYfxarLDO4NLEvc7rElndZJeibGD6ndrXy2MZh8Mo7PY
 5NiTTFntZBtfsC9R9ecmh7oBVWvFzhBZ+IofbDj187bkHYaNzSzEYCaPucut0ksMIeVP7g
 /zaFKi2rzeOV563L65rzt/9Ds+R8TLOwwagbpN98b3RB+N9m9QSowZh/v3S6rw==
Date: Wed, 9 Feb 2022 09:31:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: protect access to rawnand devices
 while in suspend
Message-ID: <20220209093138.4104a874@xps13>
In-Reply-To: <20220207153940.710464-1-miquel.raynal@bootlin.com>
References: <20220131215138.2013649-1-sean@geanix.com>
 <20220207153940.710464-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_003144_705173_3242849A 
X-CRM114-Status: UNSURE (   9.48  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgIDcgRmViIDIw
MjIgMTY6Mzk6NDAgKzAxMDA6Cgo+IE9uIE1vbiwgMjAyMi0wMS0zMSBhdCAyMTo1MTozOCBVVEMs
IFNlYW4gTnlla2phZXIgd3JvdGU6Cj4gPiBQcmV2ZW50IHJhd25lbmQgYWNjZXNzIHdoaWxlIGlu
IGEgc3VzcGVuZGVkIHN0YXRlLgo+ID4gCj4gPiBDb21taXQgMDEzZTYyOTJhYWY1ICgibXRkOiBy
YXduYW5kOiBTaW1wbGlmeSB0aGUgbG9ja2luZyIpIGFsbG93cyB0aGUKPiA+IHJhd25hbmQgbGF5
ZXIgdG8gcmV0dXJuIGVycm9ycyByYXRoZXIgdGhhbiB3YWl0aW5nIGluIGEgYmxvY2tpbmcgd2Fp
dC4KPiA+IAo+ID4gVGVzdGVkIG9uIGEgaU1YNlVMTC4KPiA+IAo+ID4gRml4ZXM6IDAxM2U2Mjky
YWFmNSAoIm10ZDogcmF3bmFuZDogU2ltcGxpZnkgdGhlIGxvY2tpbmciKQo+ID4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ICAKPiAKPiBBcHBs
aWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210
ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpEcm9wcGVkIGJlY2F1c2Ugb2YgdGhlIGtk
b2Mgd2FybmluZy9zdGFibGUgc3R5bGUgaXNzdWVzLiBJIHdpbGwgc29vbgphcHBseSB0aGUgdjQg
aW5zdGVhZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
