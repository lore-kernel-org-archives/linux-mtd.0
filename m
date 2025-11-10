Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435ECCFA13
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJQHsKDBOjIOWA/nLqDUwltHC4azCw1wG2hAagXAXfA=; b=LFdJb6fE87JV9g
	HA/pu476wOmFDI40HaCAVxgCQUxhDGO9WKBRhLPpItSC3gOW/dVDJL3nPpLze/YudP4XKy2pZAZEI
	heMYR/UfxSEXgY5C9EJJeIOomliAYNm+t/soOATPszbF0hzvb+cQ/f6wQG5fM9j52QKqa22/YuN0K
	32BCqp7he7bveNejzmhE3HNz+gR+d4Dzd4V+TfuoQQpbooac6ugw79KaN8nwgv5WQ1LhNC25++f0N
	XLkPjQ5SpHZQ6Lj6gHtfYqGHocKXVLBij6qrpthKRNx6+SO+ZUV1bJIVymh9tceeDVLMEidM34AD2
	dQKiCo98H11vPqzCWilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIONi-000000056XK-3Fl4;
	Mon, 10 Nov 2025 09:40:14 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIONe-000000056Wh-2NZU
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 09:40:11 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ddaff87c82so2237241137.3
        for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2025 01:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767609; x=1763372409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lsrcVDrEohRhH3DeIYD/Jz8ulaHSwnUzTLywFA/cyng=;
        b=Mu9uZL33peVAnbiOj2as313W4NkDptZ4wJRUrw3d3fTS6vF/3zjB5R/a1mSrU4mOjd
         Wx3D4dSxbLPXTud6SXmQ0qGaYBTb1RqpI9z/wQKpLCzqzWpaRmKqI8BJBIp8gtkhs34R
         3Kd6bmb58MKZd7BgaxPYSdzBMon2z3rlCdyh+4WyggkxTEFnRnuQfayeasJZEM9CZxnI
         Zv6WlSAShISOFOE+y8iWXr3ze8/vvrzyeYY7kVg7pnhv2JiiyKPvuj4EesggAuorgpep
         r1wiNgl2MLKb3BCQYbOCncdqPPJS5SYxOIVXg7ynl5KOGCfxq/nrkehjP5Qt5t/uUO/c
         2Tng==
X-Forwarded-Encrypted: i=1; AJvYcCWAY/eEobmwGNmvJLyrBVPXwMa7rIts49tVeN4f27iRHkwYE1QVqpe80CVY+5PL8SoLBzLefV+2ovM=@lists.infradead.org
X-Gm-Message-State: AOJu0YznsVOa+R1PQmkgIWP/DjUt27BmmsSBllEjEW1rsDqC82UacrF4
	WuwYx7uod6CcQX0KJFQSAjbjpOgyfygxw1OKpVNEWByCRKF8G9EmfAGsccNItWkH
X-Gm-Gg: ASbGncuXhNSn2esH2hTR1fObD17BRI9isEPM4zIh646CHTMmx8r5GYupVnrZtN8DMj6
	F+/6Ngc5yXHuSVYSdNXGdHY2Ad7StGM0LCqSFId0MMCwXPgE9T018iYVydg7lUJXLSLi0R8ba3u
	KBQcbhqObodXOh4xRlwfBFeGfMMMAWk6Ml9TinhOPZu0F+wvbScUgsRSfOkk/P+U3JEFzfCuPYO
	836TwNOy7T43QfNDD3DcJttInNQmmop6+ogFJH+Kt5G1QgvGx1QyRZaExuYctCKnJshrmseUR4p
	eFDLriZB2Jm//cLm2ehrynlPluKH45UuzJCAGJFE7kCONWVoPidZrRfEaRjLueEtmnY7vYesJyq
	WMFPqhnWq7CWDe9SgfBY/rP2/eremUR94XGJGgyaUDuu9Mg4ZaT3WScbcucX52461WjH8uYPKrm
	tqBbvdvrUlJC5IW94jFyoba90KZNXqPGBarGc6LEdASQ==
X-Google-Smtp-Source: AGHT+IGgVfbOtzV2K2VukOGU1HBXa71dHwdPMEzK/R3evvLZNgZzmQjFQi6AEKhfj4zRDFoHPIwxUQ==
X-Received: by 2002:a05:6102:26d1:b0:5d7:dea0:d6c4 with SMTP id ada2fe7eead31-5ddc4648817mr2667378137.7.1762767608769;
        Mon, 10 Nov 2025 01:40:08 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9370898da95sm5668830241.13.2025.11.10.01.40.08
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:40:08 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ce093debf6so1963973137.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2025 01:40:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU99Xr6nq0NrFalZubHns+VtywCCNTafvINBiAWLoq+1OC4lqVdNLXWvnHqIp4dlJfNdpeIpi8Gxhw=@lists.infradead.org
X-Received: by 2002:a05:6102:162a:b0:5dd:8a20:d6eb with SMTP id
 ada2fe7eead31-5ddc47517c6mr2576190137.25.1762767247552; Mon, 10 Nov 2025
 01:34:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com> <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
In-Reply-To: <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:33:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUdey27RTX8mLsB5wsTfuW_mP_hF503AaF2QyS4awDcw@mail.gmail.com>
X-Gm-Features: AWmQ_bkW2UuenDn6w7Wole8ay3msAtk8Ugj-awLiClF7uVATEqk1c30upT0lUKU
Message-ID: <CAMuHMdVUdey27RTX8mLsB5wsTfuW_mP_hF503AaF2QyS4awDcw@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "qat-linux@intel.com" <qat-linux@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014010_642095_4B9B3C66 
X-CRM114-Status: GOOD (  37.96  )
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

SGkgQWR5LAoKT24gRnJpLCA3IE5vdiAyMDI1IGF0IDA5OjAwLCBBbmR5IFNoZXZjaGVua28gPGFu
ZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgTm92IDcsIDIwMjUgYXQg
MzoxNuKAr0FNIFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPiB3cm90ZToKPiA+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gPiBPbiBU
aHUsIDYgTm92IDIwMjUgYXQgMTc6MDksIEFuZHkgU2hldmNoZW5rbwo+ID4gPiA8YW5kcml5LnNo
ZXZjaGVua29AaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE5vdiAwNiwgMjAyNSBh
dCAwMzo0OTowM1BNICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiA+ID4gPiBP
biBUaHUsIDYgTm92IDIwMjUgYXQgMTU6NDQsIEFuZHkgU2hldmNoZW5rbwo+ID4gPiA+ID4gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgTm92
IDA2LCAyMDI1IGF0IDAyOjM0OjAwUE0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
PiA+ID4gPiA+ID4gPiBUaGUgQlVJTERfQlVHX09OX01TRygpIGNoZWNrIGFnYWluc3QgIn4wdWxs
IiB3b3JrcyBvbmx5IHdpdGggInVuc2lnbmVkCj4gPiA+ID4gPiA+ID4gKGxvbmcpIGxvbmciIF9t
YXNrIHR5cGVzLiAgRm9yIGNvbnN0YW50IG1hc2tzLCB0aGF0IGNvbmRpdGlvbiBpcyB1c3VhbGx5
Cj4gPiA+ID4gPiA+ID4gbWV0LCBhcyBHRU5NQVNLKCkgeWllbGRzIGFuIFVMIHZhbHVlLiAgVGhl
IGZldyBwbGFjZXMgd2hlcmUgdGhlCj4gPiA+ID4gPiA+ID4gY29uc3RhbnQgbWFzayBpcyBzdG9y
ZWQgaW4gYW4gaW50ZXJtZWRpYXRlIHZhcmlhYmxlIHdlcmUgZml4ZWQgYnkKPiA+ID4gPiA+ID4g
PiBjaGFuZ2luZyB0aGUgdmFyaWFibGUgdHlwZSB0byB1NjQgKHNlZSBlLmcuIFsxXSBhbmQgWzJd
KS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIGZvciBub24tY29uc3RhbnQg
bWFza3MsIHNtYWxsZXIgdW5zaWduZWQgdHlwZXMgc2hvdWxkIGJlIHZhbGlkLAo+ID4gPiA+ID4g
PiA+IHRvbywgYnV0IGN1cnJlbnRseSBsZWFkIHRvICJyZXN1bHQgb2YgY29tcGFyaXNvbiBvZiBj
b25zdGFudAo+ID4gPiA+ID4gPiA+IDE4NDQ2NzQ0MDczNzA5NTUxNjE1IHdpdGggZXhwcmVzc2lv
biBvZiB0eXBlIC4uLiBpcyBhbHdheXMKPiA+ID4gPiA+ID4gPiBmYWxzZSItd2FybmluZ3Mgd2l0
aCBjbGFuZyBhbmQgVz0xLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSGVuY2UgcmVmYWN0
b3IgdGhlIF9fQkZfRklFTERfQ0hFQ0soKSBoZWxwZXIsIGFuZCBmYWN0b3Igb3V0Cj4gPiA+ID4g
PiA+ID4gX19GSUVMRF97R0VULFBSRVB9KCkuICBUaGUgbGF0ZXIgbGFjayB0aGUgc2luZ2xlIHBy
b2JsZW1hdGljIGNoZWNrLCBidXQKPiA+ID4gPiA+ID4gPiBhcmUgb3RoZXJ3aXNlIGlkZW50aWNh
bCB0byBGSUVMRF97R0VULFBSRVB9KCksIGFuZCBhcmUgaW50ZW5kZWQgdG8gYmUKPiA+ID4gPiA+
ID4gPiB1c2VkIGluIHRoZSBmdWxseSBub24tY29uc3QgdmFyaWFudHMgbGF0ZXIuCj4gPiA+Cj4g
PiA+ID4gPiA+ID4gKyAgICAgQlVJTERfQlVHX09OX01TRyhfX2JmX2Nhc3RfdW5zaWduZWQobWFz
aywgbWFzaykgPiAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgIF9fYmZfY2FzdF91bnNpZ25lZChyZWcsIH4wdWxsKSwgICAgICAgICAgICAgICAgXAo+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgcGZ4ICJ0eXBlIG9mIHJlZyB0b28g
c21hbGwgZm9yIG1hc2siKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBQZXJoYXBzIHdlIG1heSBj
b252ZXJ0IHRoaXMgKGFuZCBvdGhlcnM/KSB0byBzdGF0aWNfYXNzZXJ0KCk6cyBhdCBzb21lIHBv
aW50Pwo+ID4gPiA+ID4KPiA+ID4gPiA+IE5pY2sgdHJpZWQgdGhhdCBiZWZvcmUsIHdpdGhvdXQg
c3VjY2VzczoKPiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUt3dk9kbV9w
cnRrMVVRTkpRR2lkWm00NExrNTgyUzNwPW9mMHk0NityVmpuU2dYSmdAbWFpbC5nbWFpbC5jb20K
PiA+ID4gPgo+ID4gPiA+IEFoLCB0aGlzIGlzIHVuZm9ydHVuYXRlLgo+ID4gPgo+ID4gPiBPZiBj
b3Vyc2UsIGl0IG1pZ2h0IGJlIGFuIGFjdHVhbCBidWcgaW4gdGhlIGk5MTUgZHJpdmVyLi4uCj4g
PiA+Cj4gPiA+IFRoZSBleHRyYSBjaGVja2luZyBpbiBmaWVsZF9wcmVwKCkgaW4gY2FzZSB0aGUg
Y29tcGlsZXIgY2FuCj4gPiA+IGRldGVybWluZSB0aGF0IHRoZSBtYXNrIGlzIGEgY29uc3RhbnQg
YWxyZWFkeSBmb3VuZCBhIHBvc3NpYmxlIGJ1Zwo+ID4gPiBpbiBkcml2ZXJzL25ldC93aXJlbGVz
cy9yZWFsdGVrL3J0dzg5L2NvcmUuYzpydHc4OV9yb2NfZW5kKCk6Cj4gPiA+Cj4gPiA+ICAgICBy
dHc4OV93cml0ZTMyX21hc2socnR3ZGV2LCByZWcsIEJfQVhfUlhfRkxUUl9DRkdfTUFTSywgcnR3
ZGV2LT5oYWwucnhfZmx0cik7Cj4gPiA+Cj4gPiA+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0
ZWsvcnR3ODkvcmVnLmg6Cj4gPiA+Cj4gPiA+ICAgICAjZGVmaW5lIEJfQVhfUlhfTVBEVV9NQVhf
TEVOX01BU0sgR0VOTUFTSygyMSwgMTYpCj4gPiA+ICAgICAjZGVmaW5lIEJfQVhfUlhfRkxUUl9D
RkdfTUFTSyAoKHUzMil+Ql9BWF9SWF9NUERVX01BWF9MRU5fTUFTSykKPiA+ID4KPiA+ID4gc28g
aXQgbG9va3MgbGlrZSBCX0FYX1JYX0ZMVFJfQ0ZHX01BU0sgaXMgbm90IHRoZSBwcm9wZXIgbWFz
ayBmb3IKPiA+ID4gdGhpcyBvcGVyYXRpb24uLi4KPiA+Cj4gPiBUaGUgcHVycG9zZSBvZiB0aGUg
c3RhdGVtZW50cyBpcyB0byB1cGRhdGUgdmFsdWVzIGV4Y2x1ZGluZyBiaXRzIG9mCj4gPiBCX0FY
X1JYX01QRFVfTUFYX0xFTl9NQVNLLiBUaGUgdXNlIG9mIEJfQVhfUlhfRkxUUl9DRkdfTUFTSyBp
cyB0cmlja3ksIGJ1dAo+ID4gdGhlIG9wZXJhdGlvbiBpcyBjb3JyZWN0IGJlY2F1c2UgYml0IDAg
aXMgc2V0LCBzbyBfX2ZmcyhtYXNrKSByZXR1cm5zIDAgaW4KPiA+IHJ0dzg5X3dyaXRlMzJfbWFz
aygpLiBUaGVuLCBvcGVyYXRpb24gbG9va3MgbGlrZQo+ID4KPiA+ICAgIG9yaWcgPSByZWFkKHJl
Zyk7Cj4gPiAgICBuZXcgPSAob3JpZyAmIH5tYXNrKSB8IChkYXRhICYgbWFzayk7Cj4gPiAgICB3
cml0ZShuZXcpOwo+ID4KPiA+IFNpbmNlIHdlIGRvbid0IHVzZSBGSUVMRF97R0VULFBSRVB9IG1h
Y3JvcyB3aXRoIEJfQVhfUlhfRkxUUl9DRkdfTUFTSywgaG93Cj4gPiBjYW4geW91IGZpbmQgdGhl
IHByb2JsZW0/IFBsZWFzZSBndWlkZSB1cy4gVGhhbmtzLgo+Cj4gSXNuJ3QgRklFTERfTU9ESUZZ
KCkgd2hhdCB5b3Ugd2FudCB0byB1c2U/CgpGSUVMRF9NT0RJRlkoKSBpcyBhIHJhdGhlciByZWNl
bnQgYWRkaXRpb24uClRoYXQgaXMgYWxzbyB0aGUgcmVhc29uIHdoeSBJIGRpZG4ndCBhZGQgYSBu
b24tY29uc3QgZmllbGRfbW9kaWZ5KCkgeWV0CihJIGRpZG4ndCB3YW50IHRvIHJpc2sgZGVsYXlp
bmcgdGhpcyBzZXJpZXMgZXZlbiBtb3JlIDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
