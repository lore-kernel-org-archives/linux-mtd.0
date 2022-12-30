Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BC2C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Dec 2022 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOWMnyGMaG5stsUcgXA0j3Pwx7ejdDH8ky2bg2JtWP8=; b=kBrnb3y3sjlhry
	lV4kHHr5jK5KIo+0HZmRwmjNvXhiXxuytCjxIOndR7hcwMkPvXDfInc4hqIIT6PJ++7SEDcOwZAEL
	Ze6XG1UVhEEuQ5y6HGvVo+g77gKxtQ+pQQe7vZFd62FveZwCFcTTL18xT5HEBd+3VeVFd1tz0Twfd
	wC1RrD3av+fmI+Ur/WBveN8hxh513fKfdkP5BU2chMA9oojESGBZFmXD44B9OYxPGTNIq7cJ3OCzX
	z6Trm0Zpx0WVUtD/HLcTu/vLvL5bG4NpAqjqCu0ybuhA0uqtz+im90lEjX7X1UDMuxB90kaBTMYIv
	EHrXadDTgwHLJ0CZkqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEvQ-009Bkr-5y; Fri, 30 Dec 2022 12:55:52 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEqE-009854-M7
	for linux-mtd@lists.infradead.org; Fri, 30 Dec 2022 12:50:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EDB60240004;
	Fri, 30 Dec 2022 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672404625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHjxCa2Edd0gHDw+qV8rTm16FhBycGbJZc+nok1Yk3A=;
	b=Zjio9gxyKAP2R3MIkjzFnaxZsGGp+keQGk5zo+7UJfjmzZYJLW0/umDCwzddbrZgv/RxcQ
	F8uPzhmAUArYcpZkg8vJFnSlL9v6bm1HhY+2tt0K50wNAzC5SqKpKnGE+0yaEK2cWO6Jmt
	LQ45M/OPL1QYxTJZ8Z+yBYzAhMl1tCkUxJUO0VSev0ws6PicgSVS92d/ol4tIRx51cg7nM
	1ueNb4MjexNaBHWMStgQB9uzAzbrblQI5Z5LesMQmD2ZeFI4dCvp3pOMgsoyg0OD94vvgo
	joycyzaUa+M7uIqazcF1cRdxJkPq9gCNQkzvFjydYnY+pfW5DDToLyf7pZOtzQ==
Date: Fri, 30 Dec 2022 13:50:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Message-ID: <20221230135020.485a3efc@xps-13>
In-Reply-To: <32ddf1f8-eda1-da00-a3dc-901c4ee61217@linaro.org>
References: <20221220141352.1486360-1-arnd@kernel.org>
	<cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
	<20221220165701.5696df1a@xps-13>
	<026225c6-f17f-e9da-b7c0-5d3473a97e89@linaro.org>
	<32ddf1f8-eda1-da00-a3dc-901c4ee61217@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_045031_077974_EAE54CFC 
X-CRM114-Status: GOOD (  19.16  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNiBEZWMg
MjAyMiAxNjoyMjowMiArMDIwMDoKCj4gT24gMjEuMTIuMjAyMiAwODo0OSwgVHVkb3IgQW1iYXJ1
cyB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAyMC4xMi4yMDIyIDE3OjU3LCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOiAgCj4gPj4gSGkgVHVkb3IsCj4gPj4gIAo+ID4gCj4gPiBIaSwKPiA+ICAgCj4gPj4g
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIFR1ZSwgMjAgRGVjIDIwMjIgMTc6NDQ6
NDkgKzAyMDA6Cj4gPj4gIAo+ID4+PiBIaSwgQXJuZCwKPiA+Pj4KPiA+Pj4gT24gMjAuMTIuMjAy
MiAxNjoxMywgQXJuZCBCZXJnbWFubiB3cm90ZTogIAo+ID4+Pj4gRnJvbTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4KPiA+Pj4+Cj4gPj4+PiBXaGVuIE1URCBvciBNVERfQ0ZJX0dFT01F
VFJZIGlzIGRpc2FibGVkLCB0aGUgc3BpLWludGVsIGRyaXZlcgo+ID4+Pj4gZmFpbHMgdG8gYnVp
bGQsIGFzIGl0IGluY2x1ZGVzIHRoZSBzaGFyZWQgQ0ZJIGhlYWRlcjoKPiA+Pj4+Cj4gPj4+PiBp
bmNsdWRlL2xpbnV4L210ZC9jZmkuaDo2MjoyOiBlcnJvcjogI3dhcm5pbmcgTm8gQ09ORklHX01U
RF9DRklfSXggPj4+PiBzZWxlY3RlZC4gTm8gTk9SIGNoaXAgc3VwcG9ydCBjYW4gd29yay4gWy1X
ZXJyb3I9Y3BwXQo+ID4+Pj4gwqDCoMKgwqAgNjIgfCAjd2FybmluZyBObyBDT05GSUdfTVREX0NG
SV9JeCBzZWxlY3RlZC4gTm8gTk9SIGNoaXAgPj4+PiBzdXBwb3J0IGNhbiB3b3JrLgo+ID4+Pj4K
PiA+Pj4+IGxpbnV4L210ZC9zcGktbm9yLmggZG9lcyBub3QgYWN0dWFsbHkgbmVlZCB0byBpbmNs
dWRlIGNmaS5oLCBzbwo+ID4+Pj4gcmVtb3ZlIHRoZSBpbmNsdXNpb24gaGVyZSB0byBmaXggdGhl
IHdhcm5pbmcuIFRoaXMgdW5jb3ZlcnMgYQo+ID4+Pj4gbWlzc2luZyAjaW5jbHVkZSBpbiBzcGkt
bm9yL2NvcmUuYyBzbyBhZGQgdGhhdCB0aGVyZSB0bwo+ID4+Pj4gcHJldmVudCBhIGRpZmZlcmVu
dCBidWlsZCBpc3N1ZS4KPiA+Pj4+Cj4gPj4+PiBGaXhlczogZTIzZTVhMDVkMWZkICgibXRkOiBz
cGktbm9yOiBpbnRlbC1zcGk6IENvbnZlcnQgdG8gU1BJIE1FTSIpCj4gPj4+PiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiAgCj4gPj4+Cj4gPj4+IExvb2tzIGdv
b2QgdG8gbWUuIEknbGwgbGV0IHRoZSBsaW51eC0wZGF5IGJvdCBydW4gb3ZlciBpdCBhbmQgYXBw
bHkgaXQKPiA+Pj4gb25jZSAtcmMxIGlzIG91dC4gIAo+ID4+Cj4gPj4gVGhlIGlzc3VlIHNvbWV0
aW1lcyBwcm9kdWNlcyBidWlsZCBlcnJvcnMsIHNoYWxsIEkgc2VuZCBpdCB0aHJvdWdoIGEKPiA+
PiBmaXhlcyBQUiBpbnN0ZWFkPwo+ID4+ICAKPiA+IAo+ID4gWWVzLCB0aGF0IEkgd2FzIHRoaW5r
aW5nIGFib3V0Lgo+ID4gICAKPiAKPiBTZWVtcyB0aGF0IEkgc2hvdWxkbid0IHB1c2ggdG8gbXRk
L2ZpeGVzLCBzbzoKPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0Bs
aW5hcm8ub3JnPgoKT2ggeWVzIHlvdSBjYW4sIHNvcnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGlu
ZywgYnV0IGFzIEkgYW0gb2Z0ZW4gYWxvbmUKdG8gZG8gaXQsIEkgcmVhZCB5b3VyICJJIHdpbGwg
YXBwbHkiIG1lc3NhZ2UgbGFzdCB0aW1lIGFuZCB1bmRlcnN0b29kICJJCndpbGwgYXBwbHkgb24g
c3BpLW5vci9uZXh0Ii4gCgpZb3UgY2FuIHVwZGF0ZSBtdGQvZml4ZXMgdG8gLXJjMSBhbmQgcHVz
aCB0aGUgcGF0Y2gsIGFzIGxvbmcgYXMgd2Uga2VlcAplYWNoIG90aGVyIGluIHN5bmMgOykKClRo
YW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
