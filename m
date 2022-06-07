Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3667FC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+v7pK4O+i/a9HOqWJTeiKuJxzrjABHp6+dCfW3Eoek0=; b=vXqWop0VXvxzND
	7cZz+7YJwx8QcrsYalgUBUM6UdXhdd1Lt9rckSmxsLh+5ylAaaGlix38AAaP6mgg3LF9Sk6BibysT
	uZSubFrpll/S+KwVyxVdbe4vpeHHkwwX+GjwolEK6x2Im9yJO8r11R64vDOYROExt8n5cXOqTb8Z9
	R8rUsPAUDQN44XwYHBsv3Cy1iuVCRrEednRWQO+VHygfHyl2RXDo6Un6YW7VsoJj/NFOlRQkAVUAr
	1pbfgN9gIGcTl7XjgJdvz4BOvcREccbBRIca/9xp1wO2N7ac1JjoY1SoYurfaRLd0W797QC1TUmNw
	FfGXk3FNwgheb155zNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWpY-006qRX-03; Tue, 07 Jun 2022 10:53:00 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWkh-006nxr-Cu; Tue, 07 Jun 2022 10:48:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AE33C0005;
	Tue,  7 Jun 2022 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654598874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq5/ssyPN5Y2d5mBYNCD8f8OJkz94AbXsY62iwSKIwk=;
	b=dvnmUkdNBgtcS2a46ed2tT2ngs19//jK3OYvXoJqzMjQ82TTe4fDkUNPnbINTFVZ9ntR03
	6mFmDyJ8H+yeQ4SYlEkluHLVJIUEV41V2AoxNv6REcRquM86cAt1d1s0Md1le6vMfO+2Z9
	kGyiACWguhKIT/NKA25XobYB8QTAi59XEjzZqqiqFhBLzzHuZM/jw++6plY2lpf5XvHDdp
	ElhYpXuRt62LVHSheq9LJ32GKQbTydvJxgwYwaVNXklcN3KO9cvB47IPBZLvI0/3UxdWRi
	ddcVEexyDY7gxd5IvFeEXJ8gueKYWoIk0nSfnbF23xUQmr4N/r5RYFPPenFdlA==
Date: Tue, 7 Jun 2022 12:47:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Joel Stanley <joel@jms.id.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach
 <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Liang Yang <liang.yang@amlogic.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 <kernel@pengutronix.de>, <linux-mtd@lists.infradead.org>, Michael Walle
 <michael@walle.cc>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-tegra@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220607124746.20a2eaf0@xps-13>
In-Reply-To: <20220607093236.67txulke76mi6t75@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
	<20220606151841.682a5939@xps-13>
	<20220607093236.67txulke76mi6t75@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034759_986978_D8F5289E 
X-CRM114-Status: GOOD (  18.66  )
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

SGkgUHJhdHl1c2gsIFV3ZSwKCnAueWFkYXZAdGkuY29tIHdyb3RlIG9uIFR1ZSwgNyBKdW4gMjAy
MiAxNTowMjozNiArMDUzMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDA2LzA2LzIyIDAzOjE4UE0s
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGb2xrcywKPiA+IAo+ID4gdS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIEZyaSwgIDMgSnVuIDIwMjIgMjM6MDc6NDQgKzAy
MDA6Cj4gPiAgIAo+ID4gPiBIZWxsbywKPiA+ID4gCj4gPiA+IHRoaXMgc2VyaWVzIHByZXBhcmVz
IHRvIG1ha2UgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyByZXR1cm4gdm9pZC4KPiA+ID4gVGhl
cmVmb3IgZmlyc3QgdXBkYXRlIHRoZW0gdG8gYWx3YXlzIHJldHVybiAwLiBUaGUgcmF0aW9uYWxl
IGlzIHRoYXQgdGhlCj4gPiA+IExpbnV4IGRldmljZSBtb2RlbCBkb2Vzbid0IGhhbmRsZSBmYWls
dXJlcyBvbiByZW1vdmUgYW5kIGlmIGEgcmVtb3ZlCj4gPiA+IGNhbGxiYWNrIHJldHVybnMgYW4g
ZXJyb3IsIGl0IGp1c3QgZW1pdHMgYSBxdWl0ZSBnZW5lcmljIGVycm9yIG1lc3NhZ2UKPiA+ID4g
YW5kIHN0aWxsIHJlbW92ZXMgdGhlIGRldmljZS4gIAo+ID4gCj4gPiBUdWRvciwgUHJhdHl1c2gs
IFJpY2hhcmQsIFZpZ25lc2gsCj4gPiAKPiA+IFRoZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZSAo
YmVzaWRlcyB0aGUgYXRtZWwgcGF0Y2gpLCBJIHRoaW5rIGl0J3MKPiA+IGJlc3QgdG8gdGFrZSBp
dCBkaXJlY3RseSB0aHJvdWdoIG10ZC9uZXh0IGluc3RlYWQgb2YgZ29pbmcgdGhyb3VnaCBhbGwK
PiA+IHRoZSBkaWZmZXJlbnQgaW50ZXJuYWwgYnJhbmNoZXMsIHBsZWFzZSBsZXQgbWUga25vdyBp
ZiB5b3UgZGlzYWdyZWUKPiA+IHdpdGggdGhlIGlkZWEuICAKPiAKPiBQYXRjaCAyIGRvZXMgbm90
IGxvb2sgZ29vZCB0byBtZS4gSXQgbW9kaWZpZXMgdGhlIGFzcGVlZC1zbWMgZHJpdmVyIGluIAo+
IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvIGJ1dCB0aGUgZHJpdmVyIGhhcyBiZWVu
IG1vdmVkIHRvIAo+IGRyaXZlcnMvc3BpLyBpbiBNYXJrJ3MgbmV4dCBicmFuY2ggWzBdLiBUaGUg
cGF0Y2ggd291bGQgbGlrZWx5IGNvbmZsaWN0IAo+IHdpdGggdGhhdC4KPiAKPiBbMF0gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0
LmdpdC9jb21taXQ/aWQ9OWM2M2I4NDZlNmRmNDNlNWIzZDMxMjYzZjdkYjU0NWYzMmRlZWRhMwoK
UmlnaHQsIEkgYmVsaWV2ZSBVd2UgaXMgc2VuZGluZyBwZXItc3Vic3lzdGVtcyBzZXJpZXMgc28g
bm93IHRoYXQgaGUgaXMKYXdhcmUgd2UgY2FuIHNhZmVseSBkcm9wIHBhdGNoIDIuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
