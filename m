Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A184C7112B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfeyUee22Xe/HRyzU8/gOCE0cKCXivo1fQ7/F9bIrGE=; b=Uu4kd1wjM1IorW
	IBL9WhWKHEqCHKk+WeOoK/ctX9L+mxpy38V6VPCW8yYSJ/aCMNF84zXQXNMSYTWBLvOMldzNkqx4A
	ye5/BK8cfjlO0Gce01MKTNNIpg1uh8YuKFKwpSH5moSyNwy70NHxqKJI4aORTo56KYCsFXfL6AO/V
	nkMXF3iAhQiG6fZ2vke9fHN65qIx4vS6++oM/yypgbIBHHf4yjjFPGTAqSzBEyiNpJ4r//V38R+y6
	jpzIcP3avYhlkog/FjQiagapySvRhkeP4pJozouxvhTTt7UWeMxAIZabBAIgSvknWjstaCqUGy9vs
	5XMXfvQAgXnxSPyqaWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWubM-007xom-1Q;
	Fri, 18 Aug 2023 08:13:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWubE-007xmi-1e;
	Fri, 18 Aug 2023 08:12:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2973FF803;
	Fri, 18 Aug 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692346367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzCVM+bK0VlZhouGuHfDfVW0KdhBecM197MixCtRvfQ=;
	b=Jmp83XkDTC2MO6piwR/S+JMNYHW0Y17nyiWqjHmyKqLeJqK0dnwSYn4/4EZ8nhuwB95D6l
	DK6mzVDiQeV2or5bZ/qCdESjI+eJ0d5I35Y4K+n1kp7aV0dBDct1+0GnUjTinv72HIAIuJ
	GXIKPdqOkWIdD19loGNKnSoo5AKAzWMX+58BKdjhkYcEZeQI9RFkgdggJNxO8z27J43LKK
	ztYe9QtVJymUiC+HoooqV10fY6+WTU0F2yUV3rd5jWJpzak1WbkF1rSa4beE/zB0TIv1ad
	+StZn7GOnXF/njiTIb/fCXUqwnHVKZyH3c7ML+WKoXdBACeSHBlBedQMaOaVMw==
Date: Fri, 18 Aug 2023 10:12:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
 <pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
 <rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
 <vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
 <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2 02/12] mtd: rawnand: arasan: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230818101242.12f54b5d@xps-13>
In-Reply-To: <20230818101004.4f2cd343@xps-13>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230818074642.308166-1-lizetao1@huawei.com>
	<20230818074642.308166-3-lizetao1@huawei.com>
	<20230818101004.4f2cd343@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011252_744574_7B557082 
X-CRM114-Status: GOOD (  12.08  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAxOCBBdWcgMjAyMyAxMDox
MDowNCArMDIwMDoKCj4gSGkgTGksCj4gCj4gbGl6ZXRhbzFAaHVhd2VpLmNvbSB3cm90ZSBvbiBG
cmksIDE4IEF1ZyAyMDIzIDE1OjQ2OjMyICswODAwOgo+IAo+ID4gU2luY2UgY29tbWl0IDdlZjk2
NTFlOTc5MiAoImNsazogUHJvdmlkZSBuZXcgZGV2bV9jbGsgaGVscGVycyBmb3IgcHJlcGFyZWQK
PiA+IGFuZCBlbmFibGVkIGNsb2NrcyIpLCBkZXZtX2Nsa19nZXQoKSBhbmQgY2xrX3ByZXBhcmVf
ZW5hYmxlKCkgY2FuIG5vdyBiZSAgCj4gCj4gPiByZXBsYWNlZCBieSBkZXZtX2Nsa19nZXRfZW5h
YmxlZCgpIHdoZW4gZHJpdmVyIGVuYWJsZSAoYW5kIHBvc3NpYmx5ICAKPiAKPiBGb3IgYWxsIHRo
ZSBjb21taXQgbG9nczoJCSAgdGhlIGRyaXZlciBlbmFibGVzIChhbmQgcG9zc2libHkgcHJlcGFy
ZXMpCj4gCj4gPiBwcmVwYXJlKSB0aGUgY2xvY2tzIGZvciB0aGUgd2hvbGUgbGlmZXRpbWUgb2Yg
dGhlIGRldmljZS4gTW9yZW92ZXIsIGl0IGlzCj4gPiBubyBsb25nZXIgbmVjZXNzYXJ5IHRvIHVu
cHJlcGFyZSBhbmQgZGlzYWJsZSB0aGUgY2xvY2sgZXhwbGljaXRseSwgc28gZHJvcCAgCj4gCj4g
Rm9yIGFsbCB0aGUgY29tbWl0IGxvZ3M6CQkgICAgICAgdGhlIGNsb2Nrcwo+IAo+IFRoZSAiLHNv
IGRyb3AgdGhlIGxhYmVsIHh4eCIgaXMgbm90IG5lZWRlZCBJIGJlbGlldmUuCj4gCj4gPiB0aGUg
bGFiZWwgImRpc2FibGVfYnVzX2NsayIgYW5kICJkaXNhYmxlX2NvbnRyb2xsZXJfY2xrIi4KCkFj
dHVhbGx5IGl0IGRvZXMgbm90IGJvdGhlciwganVzdCBrZWVwIGl0LgoKPiA+IFNpZ25lZC1vZmYt
Ynk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+ID4gLS0tICAKPiAKPiBUaGFua3Ms
Cj4gTWlxdcOobAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
