Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E695EE81E10
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWq76zdtiGi6JfO0Z7puk8he20jJS70XW7BczzPBFCM=; b=bo4ZY93rQefncx
	AnxFire/3/iq7ZfFrEda6QpW+qQyKEaTiqNFInsTVI4OhCTLOOKD3Ej/uBze9YaV9v0zf6qNhXfV3
	z98XfCtuHIzDuLN91NmP+tPsuG187oDIWx1B+uADY7wiLFUK+7+9DXg18xjexHi6vOuzkQ67xlOky
	QHSboSzUmAHBPp+rMdslGb5nOkGKKfx7Q4DkXq93PIm42Euxe+S8DsluAfV5esW1dKHc6Fu3sTRgC
	/ZJ8YY7TwgpQy4UCb4YZNVQrEfbyJeNIROLRliiwNVj21D+iX49oHxNZIj5Q1Y+knxTDpzToeppqf
	axet9dDWGvbDDkx84H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qomxb-0066jp-0m;
	Fri, 06 Oct 2023 15:41:51 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qomxY-0066iK-0X
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 15:41:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 754BCFF80A;
	Fri,  6 Oct 2023 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696606899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWgixyze7ly2jxAoSChg1RnG0qY3wYNYv8+NFu8WJl0=;
	b=IKJou9RkycVWCcf7n+d7yoYGr1piTPjh9K5pok60FzRAqerD29qvCVjAUYl1Ss6XmakocD
	LLa3wX7a14toQNvGnFtHPw8G1BLisvCMJ0DWOQoOqefhyP7BYiF7S7kn4ZS5m+cgQve3Op
	2xLQVE7YPmPCCUzHBWldvxcTuU1/I5cYWIkF+eBkDqxa/hyNxoSX3Ui7dQnwyT9ZrHlS8K
	JMuaCJz7VCGiklbJ2OqqMUVs+fIAX1GEsjtA9pQ1OOjX9MQVhHwPL6Uh1ZuqE04m9QZKOC
	SnW4mDUvnxzfzF70eQNtvHv67cJFnxAiqnL2FYBs3g9kERyjNxCNDNN3WkT1Sw==
Date: Fri, 6 Oct 2023 17:41:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: JaimeLiao <jaimeliao.tw@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: rawnand: Remove unused of_gpio.h inclusion
Message-ID: <20231006174137.2e745cb4@xps-13>
In-Reply-To: <ZSAkUMnXw4SbS2pC@smile.fi.intel.com>
References: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
	<CAFBinCAJ5m+NTVry56=0AYMYr9xiM9KS7F837Hqb=ptOG_u54g@mail.gmail.com>
	<ZKvW0yzxU1ktDALd@smile.fi.intel.com>
	<ZSAkUMnXw4SbS2pC@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_084148_373473_0D2933FF 
X-CRM114-Status: GOOD (  14.37  )
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

SGkgQW5keSwKCmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBGcmks
IDYgT2N0IDIwMjMgMTg6MTQ6MjQKKzAzMDA6Cgo+ICtDYzogR1BJTyBtYWludGFpbmVycwo+IAo+
IE9uIE1vbiwgSnVsIDEwLCAyMDIzIGF0IDAxOjAwOjUxUE0gKzAzMDAsIEFuZHkgU2hldmNoZW5r
byB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDE2LCAyMDIzIGF0IDEyOjEwOjUyQU0gKzAyMDAsIE1h
cnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6ICAKPiA+ID4gT24gVGh1LCBKdW4gMTUsIDIwMjMgYXQg
Njo0MuKAr1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPiA8YW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tPiB3cm90ZTogIAo+ID4gPiA+Cj4gPiA+ID4gVGhlIG9mX2dwaW8uaCBpcyBub3Qg
YW5kIHNob3VsZG4ndCBiZSB1c2VkIGluIHRoZSBkcml2ZXJzLiBSZW1vdmUgaXQuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4gIAo+ID4gPiBBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gIAo+ID4gCj4gPiBUaGFuayB5b3Uh
Cj4gPiAKPiA+IENhbiBpdCBiZSBhcHBsaWVkIG5vdz8gIAo+IAo+IFNvLCB0aGlzIGlzIHN0aWxs
IG5vdCBhcHBsaWVkLCBkb2VzIGl0IG1lYW4gd2UgbmVlZCB0byBnbyB2aWEgR1BJTyB0cmVlCj4g
d2l0aCBpdD8KCkkgcmVtZW1iZXIgeW91ciBwaW5nIGFuZCBhbHNvIGFuc3dlcmluZyBpdCwgYnV0
IEkgY2Fubm90IGZpbmQgaXQuIExldAptZSBsb29rIGludG8gdGhpcy4gSW4gYW55IGNhc2UsIGFw
b2xvZ2llcyBmb3IgdGhhdC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
