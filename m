Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D7C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPh+2iEwt3QLHRz3WIixVR5/o+saptK3jmw/qriSXtk=; b=b1wlF86JJKUrKK
	utfWGYIxl/RH3845nOraqR0y6yDRGeCdexACTp8ftJlt0D1N2ULHwsM0cnTtqo9r8msmDr+8BSGgt
	u5+d2a+KzfE7768fquGa+gw0PTNuSYMZcvcUSrzATCzwLIGCXP/bpPMQtFEIU1EkN/ZM4xSc/Xq9s
	vY+xPa+aO0Y40IYmpfs07AWSg9efGzE3JwErC2lH3KM2wjit2Xw8nF1EMaCwsc2ierZLlio2eFC+A
	xjfdm09zB1IQSRBttZRwH2ALMV7KB8FPTVYVpnkvWsmTYnwWZw5xCuNdvfPxLCUkoRIlChhb78yiO
	0qokk6vDmUFFzVf+gYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNbv-00EN1S-23;
	Mon, 31 Jul 2023 07:46:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQNbr-00EMzM-30
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 07:46:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB4FBE000C;
	Mon, 31 Jul 2023 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690789584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzcoTOLofuT5l+F4dsnq95rIrhWtOgZ0f/pwXq6XCE4=;
	b=KObbDznBnsplRWxyhwVqdnRPjnADo5d9EIZsP0fXIZGpIoBhjzpO9Mtg8to6BQCOrxL8Kz
	zec8azFwupM46dqsGbtVyorEpXp9fuZqpEmz8XqWU1g5E3S7mR2SjzrTKz+USUH9OoByhV
	XFlzhlqtlEFB9cDRwuqEoW0RrRdi10nKoOjJBFNDBkXSVbQYMvW5QrZT9wkXIbHQXBYb0v
	pHGh3yj9HC7EdyNPfQQDHrpXFQyYqJu0xVqzor+vq5BsnU9X8Ur3CkS95ffI4+VV1rpaqQ
	9ghYJS95Eh5jhv6az3KBu2nNIwz/IlHL4l7HGE+PWTz5Y+ZmzxpHQn+el+yUEA==
Date: Mon, 31 Jul 2023 09:46:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zheng Zhang <zheng.zhang@email.ucr.edu>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: kernel BUG in __put_mtd_device
Message-ID: <20230731094619.760e92a6@xps-13>
In-Reply-To: <89021294.889167.1690781715755.JavaMail.zimbra@nod.at>
References: <CAC_GQSpE5nbj7Lt=8sXu8GoSQTRd+=fpZb_zpVKQOJ4MxRHzsw@mail.gmail.com>
	<89021294.889167.1690781715755.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_004632_282356_1E872BCE 
X-CRM114-Status: GOOD (  16.79  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIE1vbiwgMzEgSnVsIDIwMjMgMDc6
MzU6MTUgKzAyMDAgKENFU1QpOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiBWb246ICJaaGVuZyBaaGFuZyIgPHpoZW5nLnpoYW5nQGVtYWlsLnVjci5lZHU+Cj4gPiBBbjog
Ik1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxy
aWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwK
PiA+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1r
ZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+ID4gR2VzZW5kZXQ6IE1vbnRh
ZywgMzEuIEp1bGkgMjAyMyAwMToyNzowOQo+ID4gQmV0cmVmZjoga2VybmVsIEJVRyBpbiBfX3B1
dF9tdGRfZGV2aWNlICAKPiAKPiA+IE1pcXVlbCwgUmljaGFyZCwgVmlnbmVzaCAgYW5kICB0byB3
aG9tIGl0IG1heSBjb25jZXJuOgo+ID4gCj4gPiBIZWxsbyEgV2UgaGF2ZSBmb3VuZCBhIGJ1ZyBp
biBNVEQgZHJpdmVyIGluIHRoZSBMaW51eCBrZXJuZWwgdmVyc2lvbiA2LjIuMAo+ID4gYnkgU3l6
a2FsbGVyIHdpdGggb3VyIG93biB0ZW1wbGF0ZXMuCj4gPiBJdCdzIHRyaWdnZXJlZCBmb3IgbXVs
dGlwbGUgdGltZXMuIFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3QgZ2VuZXJhdGUgYQo+ID4gcmVw
cm9kdWNlci4KPiA+IEF0dGFjaGVkIGlzIHRoZSByZXBvcnQsIGxvZyBnZW5lcmF0ZWQgYnkgc3l6
a2FsbGVyLgo+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uIHRoYXQgSSBjYW4KPiA+IHByb3ZpZGUgdG8gaGVscCBkZWJ1ZyB0aGlzIGlz
c3VlLiAgCj4gCj4gSXNuJ3QgdGhpcyByZWxhdGVkIHRvICJbUEFUQ0hdIG10ZDogZml4IHVzZS1h
ZnRlci1mcmVlIGluIG10ZCByZWxlYXNlIj8KClllcywgcHJvYmFibHksIHdlIHJlY2VpdmVkIHR3
byBwYXRjaGVzIHJlZ2FyZGluZyB0aGUgc2FtZSBpc3N1ZSwgYnV0IHNvCmZhciBubyBhZ3JlZW1l
bnQgb24gdGhlbSBiZWNhdXNlIG5vbmUgZnVsbHkgZml4ZXMgdGhlIGlzc3VlCmFwcGFyZW50bHku
Li4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
