Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDA7C77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLJjDbHLbe8cz6YGmaYEfFTP7gywWWaL1XJw+DkTRiA=; b=RrGtJHGdSnqEXO
	FZPIfzd/c3R7o2LwA85moFooPeUGmNgcSImCq5kEaNG8CMFQBtXCZdmkTKsvLGoUukw/fsQ7fequB
	QySX4yAqRJw4bNBqEjPBravqbzFNC3kOvuDfQajRG81SkfeeHBTBTtgTSbKfFTVS1uJX+2I8DOu9T
	9vxPNQHPmF1l6e4zY6yzEHtf6JgbXIPB6v6q95KbbZyYXm1vt2aUaybba8QS9uQsK7PfIZ5MX6Dtg
	T0JwMomRPuMNOerlQZ7F4J7kA46xKHHoUThRxGypGCsags24wAb5zRgbC8fqsxWOk2sE3FUTHKnrO
	TNrYvA+1uq0TmKsqB/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66rM-00EuUH-2K;
	Mon, 05 Jun 2023 09:50:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66rH-00EuSK-1m;
	Mon, 05 Jun 2023 09:50:41 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685958636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vR4k2T1RzS/nAoJgjwjD+YGHoaPZBMd9FOOYoMhuzgk=;
	b=HN9OIdfqr8HPnDe8MEurDz64tduduKukc4BoRSI0NlG2bRxrZ7PuUjNAVF1ucfijb3nsx4
	wphBhTKj9bxZWO8vh5sY997759gXymrYvo7HqNXNWidY/lR7hYQ26s59/rwmzfJz+CgW6H
	ATVXgx62U9ZmsRuBbSaQQfPMhMYmaDgSOi2g8OIxPy5bTJ5T+2EJ4Zut7hX/ZQ2kB4k6t9
	UHyQ76RWWQ2TyB1uGh3bU0KYMLv+CBIjRC4wqZB3Qt73B8dbwRTba84YA/VE18qk0+2jsN
	tuEyx+xcyrkPmLTX1GgBLTcS1AU52YJevyNztq4TE0i5k78hvUaDx7m/ulei8A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B6B91C000E;
	Mon,  5 Jun 2023 09:50:34 +0000 (UTC)
Date: Mon, 5 Jun 2023 11:50:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, <stable@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liang
 Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix ready/busy command
Message-ID: <20230605115033.7a9eb4c9@xps-13>
In-Reply-To: <9bea333a-e5fc-af89-29a0-fa01236488a3@sberdevices.ru>
References: <20230605061048.485622-1-AVKrasnov@sberdevices.ru>
	<19f809ab-218e-8da5-6d5e-ac47902fa706@sberdevices.ru>
	<20230605101739.069b98af@xps-13>
	<9bea333a-e5fc-af89-29a0-fa01236488a3@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_025039_848363_0E0DE533 
X-CRM114-Status: GOOD (  23.21  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDUgSnVu
IDIwMjMgMTE6Mjc6MzQgKzAzMDA6Cgo+IE9uIDA1LjA2LjIwMjMgMTE6MTcsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnUgd3JvdGUgb24gTW9uLCA1IEp1biAyMDIzIDA5OjM5OjQwICswMzAwOgo+ID4gICAKPiA+PiBI
ZWxsbyBNaXF1ZWwhCj4gPj4KPiA+PiBJIGV4Y2x1ZGUgdGhpcyBwYXRjaCBmcm9tIHRoZSByZWNl
bnQgTWVzb24gcGF0Y2hzZXQsIGFzIGl0IGlzIGZpeCBhbmQgbm90IHJlbGF0ZWQgdG8gYW5vdGhl
ciBwYXRjaGVzLgo+ID4+IEFsc28gSSB0aGluayB0aGF0IEkgY2FuIHNwbGl0IE1lc29uIHBhdGNo
c2V0IChmcm9tIGxpbmtzIGJlbG93KSBpbiB0aGUgZm9sbG93aW5nIHdheToKPiA+PiAxKSBQYXRj
aC9wYXRjaHNldCBmb3IgT09CIGxheW91dAo+ID4+IDIpIFBhdGNoc2V0IGZvciAibmFuZC1yYiIg
bG9naWMgKG1lc29uX25hbmQuYyArIERUIGJpbmRpbmdzKQo+ID4+IFRoZXNlIHR3byBjYW4gYWxz
byBnbyBpbmRlcGVuZGVudGx5Ogo+ID4+IDMpIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW10ZC8yMDIzMDYwMTA2MTg1MC4zOTA3ODAwLTYtQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Lwo+
ID4+IDQpIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDYwMTA2MTg1MC4z
OTA3ODAwLTctQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1LyAgCj4gPiAKPiA+IExHVE0uICAKPiAK
PiBJIHRoaW5rIHdlIGRvbid0IG5lZWQgdGhpcyBwYXRjaCB3aXRoIG5ldyBSQl9JTlQgdmFsdWUu
IEkgZGl2ZSBpbnRvIGNvbnZlcnNhdGlvbnMgd2l0aCBMaWFuZyBZYW5nIC0gYXV0aG9yIG9mIHRo
aXMgZHJpdmVyLiBIZSBzYWlkLAo+IHRoYXQgdGhpcyBkZWZpbmUgaXMgInNwZWNpYWwiIHBvbGxp
bmcgbW9kZS4gTm93IEknbSBhIGxpdHRsZSBiaXQgbW9yZSBleHBlcmllbmNlZCBpbiBOQU5EIGFy
ZWEsIHNvIElJVUMgd2UgaGF2ZSB0d28gYmFzaWMgd2FpdGluZyBtb2RlczoKPiAxKSBTb2Z0d2Fy
ZSwgYnkgc2VuZGluZyBzdGF0dXMgY29tbWFuZCwgdGhlbiBwb2xsaW5nIHJlcGx5IGZyb20gY29u
dHJvbGxlciwgYW5kIHRoZW4gZmluYWxseSBzZW5kIFJFQUQwIHRvIGV4aXQgc3RhdHVzIHJlYWRp
bmcgbW9kZSAobmFuZF9zb2Z0X3dhaXRyZHkoKSkuCgpUaGlzIGlzIHVzZWZ1bC4uLgoKPiAyKSBC
eSBSQiBwaW4gYW5kIGludGVycnVwdCAtIGluIHRoaXMgbW9kZSB3ZSBzZW5kIHZlbmRvciBzcGVj
aWZpYyBjb21tYW5kIHRvIHRoZSBjb250cm9sbGVyIGFuZCBpdCB0cmlnZ2VycyBpbnRlcnJ1cHQg
b24gUkIgcGluIHVwZGF0ZS4KPiAgICBJbiB0aGlzIGNhc2UgUkIgcGluIG11c3QgYmUgY29ubmVj
dGVkIHRvIHRoZSBjb250cm9sbGVyLiBUaGlzIG1vZGUgaXMgYWxyZWFkeSBpbXBsZW1lbnRlZCBi
eSBMaWFuZyBZYW5nLgoKLi4udGhpcyBpcyB1c2VmdWwuLi4KCj4gCj4gTm93LCBjb21tYW5kIHdp
dGggdGhpcyBuZXcgZGVmaW5lIHdvcmtzIGluIHRoZSBmb2xsb3dpbmcgd2F5OiB3ZSBzZW5kIHN0
YXR1cyBjb21tYW5kLCBieSBpbnN0ZWFkIG9mIHJlYWRpbmcgcmVwbHkgZnJvbSBpdCBieSBzb2Z0
d2FyZSwKPiBjb250cm9sbGVyIGl0c2VsZiBjaGVja3MgUkIgcGluIGFuZCBzdGF0dXMgcmVhZHkg
Yml0IGluIElPIGJ1cy4gRHJpdmVyIGp1c3Qgd2FpdHMgb24gY29tcGxldGlvbi4gQWZ0ZXIgd2Fp
dGluZyB3ZSBuZWVkIHRvIHNlbmQKPiBSRUFEMCBjb21tYW5kIGFnYWluIHRvIG1ha2UgY29udHJv
bGxlciBsZWF2ZSBzdGF0dXMgcmVhZGluZyBtb2RlLiBJIHRoaW5rIHRoaXMgaXMgbGlrZSAiaW50
ZXJtZWRpYXRlIiBtb2RlIGJldHdlZW4gc29mdHdhcmUgcG9sbGluZwo+IGFuZCBoYXJkd2FyZSBp
bnRlcnJ1cHQgLSB0aGVyZSBpcyBubyBuZWVkIHRvIHNwaW4gaW4gbG9vcCwgd2FpdGluZyBmb3Ig
c3RhdHVzIHJlYWR5IGJpdCwgYnV0IHN0aWxsIG5lZWQgdG8gbGVhdmUgc3RhdHVzIG1vZGUgYnkg
c2VuZGluZwo+IFJFQUQwIGNvbW1hbmQuIEknbSBub3Qgc3VyZSB0aGF0IHdlIG5lZWQgdGhpcyBh
cyB0aGlyZCBtb2RlIG9mIHdhaXRpbmcgZm9yIGNvbW1hbmQgaXMgZG9uZS4gTWF5IGJlIGF0IGxl
YXN0IG5vdCBpbiB0aGlzIHdvcmsgb24gTWVzb24gZHJpdmVyLAo+IHNvIEkgZ3Vlc3MgdG8gZHJv
cCB0aGlzIHBhdGNoIGF0ICB0aGlzIG1vbWVudCBhbmQgYWRkICduYW5kX3NvZnRfd2FpdHJkeSgp
JyBzdXBwb3J0LgoKLi4uSSBhZ3JlZSB3ZSBjYW4gc2tpcCB0aGlzIG9uZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
