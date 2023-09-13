Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40BAEDEC73
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUQvpTohs2FL9iahnf3ovhf80Xj0rNqNU2bYJWZRVfg=; b=EckuL8RVV2sHRB
	OXo3hXipiOBY2oDk8j5mmU/6kZfLHrF5mivOhHEJyPLwI/2GOI3ZixdS12zSWtoZBJ/ZuZuyD8yXJ
	mc18UHudF184HnlSpK3lnSV5sT/hbHM/xGcH/w7vY6/Fl1SdRxccQNIoi8IpJvlnTL4XN0KCJJSj7
	gqL8t4V52ByaFb+fnoVGkyQMWGsmOAoAj3FziJFqsyCOYI6n3tzqu+QtYzTALZZHFWiyDQtAQ4p5t
	o7C6nhgLhehjBUqiI345A6Kq11GS3b4+6CX/H5INBEM0tuGWSxEcNil/XlZgaE1FJzh28i/gyOyo7
	fXZM0ysZn/YCH0Xj/gnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRw9-006G14-1h;
	Wed, 13 Sep 2023 15:37:53 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRw6-006FxJ-0x
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 15:37:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCDFFF805;
	Wed, 13 Sep 2023 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694619461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDuZH+uvutfHgzRCfxDkmOKfULSH31Y70SqnVTdAeGk=;
	b=iTv6IPZ5VJ6ivejmv38YJcRCQo4Bk742r5mSjfamtnlAULg3m5HGMB8U+owY39f6WMVb0b
	1pS4JKckO5+cvma/c7QPR8yQ8z30gBdbSVHME8MYCQR+cO+G1853ASCKJqjO69AoIc5qfn
	ZUFUu5xx9Sup0UTmjl6Pnm1h4DmSklI5ymlYQbBLpOOEQ4WjR3LT++w3kfOfeNJ60KM1UA
	Q8V25gbjIOj8MziacdZ0D2/yl3Se9FFa/x6/lTR7mBlaCjz6ZdCWpKBySBo/A4lk4+e8AR
	r0A6QTwhz/lts1oACqie3EZBrFgebCCFCkbODHPc/UgsOUSA/zKFmqo+rbZF0w==
Date: Wed, 13 Sep 2023 17:37:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel
 Scally <djrscally@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Mark
 Gross <markgross@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
Message-ID: <20230913173724.60ed3b8d@xps-13>
In-Reply-To: <a3c8b1eaba0e7aae190cb5f2ffd8a360fab0251c.camel@crapouillou.net>
References: <20230913115001.23183-1-brgl@bgdev.pl>
	<20230913115001.23183-3-brgl@bgdev.pl>
	<a3c8b1eaba0e7aae190cb5f2ffd8a360fab0251c.camel@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_083750_485744_6CD888D7 
X-CRM114-Status: GOOD (  11.35  )
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

SGkgQmFydG9zeiwKCnBhdWxAY3JhcG91aWxsb3UubmV0IHdyb3RlIG9uIFdlZCwgMTMgU2VwIDIw
MjMgMTQ6MDE6NDcgKzAyMDA6Cgo+IEhpLAo+IAo+IExlIG1lcmNyZWRpIDEzIHNlcHRlbWJyZSAy
MDIzIMOgIDEzOjQ5ICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIGEKPiDDqWNyaXTCoDoKPiA+
IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9y
Zz4KPiA+IAo+ID4gVXNlIHRoZSBuZXcsIGxlc3MgY3VtYmVyc29tZSBpbnRlcmZhY2UgZm9yIHNl
dHRpbmcgdGhlIEdQSU8gYXMKPiA+IGFjdGl2ZS1oaWdoIHRoYXQgZG9lc24ndCByZXF1aXJlIGZp
cnN0IGNoZWNraW5nIHRoZSBjdXJyZW50IHN0YXRlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+ICAKPiAK
PiBXb3JrcyBmb3IgbWUuCj4gCj4gQWNrZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PgoKRm9yIG1lIGFzIHdlbGwsIHRoZSBuZXcgQVBJIGxvb2tzIG11Y2ggYmV0dGVy
LgoKSSBzYXcgSGFucyBpcyBmaW5lIHdpdGggeW91IG1lcmdpbmcgdGhlIHBsYXRmb3JtL3g4NiBw
YXRjaC4gSSBhbSBhbHNvCmZpbmUgaWYgYWxsIG1haW50YWluZXJzIGFncmVlIG9uIHRoYXQuIElu
IHRoaXMgY2FzZToKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgoKSG93ZXZlciwgaWYgeW91IGZpbmFsbHkgbmVlZCB0byBwcm9kdWNlIGFuIGltbXV0
YWJsZSB0YWcsIGxldCBtZSBrbm93CmFuZCBJIHdpbGwgdGFrZSB0aGUgcGF0Y2ggdGhyb3VnaCBv
dXIgdHJlZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
