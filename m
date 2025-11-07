Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49364CCFA19
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV4WpbBn74p/a/4Bk2xdY7LFG1/rqe9V7TmCZK04W0I=; b=kK0zyxgSKKD7zh
	fUkNXAPMAHW70vaFt/6YTlAqzj4cYw7VDznXH2AVcRkjv/0lnOeMlj3iIPBLniGXdcX5MXjFwdPhz
	J/mzvaf0cl/b3YnnDlOLVRw4tsDrwDl98pZ+hZ8h0mDzL2Wo/GHaymMW0JACze77EdrJBuNSsTg8A
	+4RVQI411Xk5lv1fIrsCucZj36xvFBRXRSm0wYD4b06l5lJjgPHZO3hjLtTWwJF6w26S903e/oT9m
	cTRbtjmFiePTkpphvS9RVmjLWwPQbu4+FDwDoZ0neGDTIV6X3KLQR5qBuZuu3NRurIdw7GtYdhBkA
	p3Lw0QFJwhwsGId6RwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHOk-0000000GprB-2X7t;
	Fri, 07 Nov 2025 08:00:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHOd-0000000Gpox-2j6U
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 08:00:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso67259066b.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2025 00:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502433; x=1763107233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4L8nwY5tA46qS9RhjMiBvwIJ3m3PvlUWeeZDUBNYNE=;
        b=hlC3MduceHhilA4Vcx/Dh12ns7wROmrboR8T5GHFhjBmGKirB77CtB8NnVSYfVJ7C1
         HVLXxmaYPdJHbN0spUK2kN747067J1IxjsTXDDtUVnYghKHvmuBElbpuMa04gNts4/I6
         heSibiwzp5L/uunEofaPay1wL0Eypcv7jDYi9y8ICOUomcijQ/9vSWEsL/XdEhPaEezJ
         Mkv3LQdZWDl7BHoz3Nt0Ra3Ffx4XwqiH9s/cIpiC96T2hZiQJHvBNZB0CPeyQJxo3dFu
         qSyG4RuGOA1q27ZhapV9tV5YlyU0it2y2xuPAz/6yBviCJYoBlW0Zaxm/jmfyL4Usn6X
         5SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502433; x=1763107233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4L8nwY5tA46qS9RhjMiBvwIJ3m3PvlUWeeZDUBNYNE=;
        b=Fnz3OJ/rDbSdCLXxx3CtbzTuBUmM0UKIcXCY26Y2LAzHLDrog5haevMYr5MDNCDQ1d
         sRm8bNUqiCNx87UxkiSpNvYXtjmFI+aWmYTOAmIfI88CJK14YudrOMYUU00cy7IPHESm
         rOE7mQO35hVTbgFyY/HU689OHju7RETubS1MMxbDXMg7HwlPSGyGPl+KNul1+ZE793Ui
         zR4YOrZedDbjGC0Z9K/pQ6WyHZpRbMhRdTRXfWvKx6VjoUh1aWwBTrkLG9s9WbIGjS6p
         Y6uQjRbz9ueZ4cwuDc7XncGvi44gDiKu7Pd09IFw7Qrdy47PXOhye3ZUC1SDrHIceUvC
         uuLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6GU4he0sxWwplMi/RrTGpxVqrHZ9liIsnr3osFKrb6ad3pXVJiR/JJDBuvYe1JFdW1gTV84ez+2M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6fODt82Xn7v1XP6fnHendE3ufUPezL0/gx56TYWcmwQ4MTlWh
	sGN/r+LNlCyyabslyhBayqt5wnhdvt9DQHe/O/ffLxjDL7PyJltDezXXOXWSWA+5A0Y+pJFymlI
	19/1rJKzfoSQ32OTfuinmAgn1cQYKD1o=
X-Gm-Gg: ASbGncvzQUhuQyNl3EfhLMAt/nW6GfFl5BBCPeOUT5/kMTRr5gf5w9RaoDRuLnPWVjG
	K5wRkFCfO9yF2eHZnlDyYE0GMlILcbyxXww88KwV71z7Rj9yT3zBvll+/0jqMMSrklVqACGEa1P
	5E3IC5gM9r2tw2My5rQ6Z2gU/BS+6WKtARuEuvf44WRbdv/d54hmhuEJzLpeVZeM6LY+h1xSN4N
	he8GvBZQfEenXAHPHpOCFUCyzw4wT8d6x2zeSv5JgZuUv/IFDBKhCSbYo8KrgV35jfpde5o
X-Google-Smtp-Source: AGHT+IF1uok4S2/ZJxGVMG6j0RZBxmZiPcUtNqCXKtotlWPr6F8OAXOZaMRmuRE8uDgHau7bT5W5RrHY3dcLjEjQckY=
X-Received: by 2002:a17:907:3cd6:b0:b70:6f46:d401 with SMTP id
 a640c23a62f3a-b72c093317amr195124066b.11.1762502433125; Fri, 07 Nov 2025
 00:00:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
In-Reply-To: <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Nov 2025 09:59:56 +0200
X-Gm-Features: AWmQ_bndsm6ikZxAsR6MbqZ_7CJczSuokLGcsZHpDoyZxbjksOeSkgDr0jWR8fA
Message-ID: <CAHp75VeMqvywS20603yDSo-C3KCu+i+8vvDNuz3h9e8Ma9BOCw@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
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
X-CRM114-CacheID: sfid-20251107_000035_714366_81DA12A5 
X-CRM114-Status: GOOD (  27.64  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjE24oCvQU0gUGluZy1LZSBTaGloIDxwa3NoaWhAcmVh
bHRlay5jb20+IHdyb3RlOgo+Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4gd3JvdGU6Cj4gPiBPbiBUaHUsIDYgTm92IDIwMjUgYXQgMTc6MDksIEFuZHkgU2hldmNo
ZW5rbwo+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFRo
dSwgTm92IDA2LCAyMDI1IGF0IDAzOjQ5OjAzUE0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToKPiA+ID4gPiBPbiBUaHUsIDYgTm92IDIwMjUgYXQgMTU6NDQsIEFuZHkgU2hldmNoZW5r
bwo+ID4gPiA+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4g
T24gVGh1LCBOb3YgMDYsIDIwMjUgYXQgMDI6MzQ6MDBQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGUgQlVJTERfQlVHX09OX01TRygpIGNoZWNrIGFnYWlu
c3QgIn4wdWxsIiB3b3JrcyBvbmx5IHdpdGggInVuc2lnbmVkCj4gPiA+ID4gPiA+IChsb25nKSBs
b25nIiBfbWFzayB0eXBlcy4gIEZvciBjb25zdGFudCBtYXNrcywgdGhhdCBjb25kaXRpb24gaXMg
dXN1YWxseQo+ID4gPiA+ID4gPiBtZXQsIGFzIEdFTk1BU0soKSB5aWVsZHMgYW4gVUwgdmFsdWUu
ICBUaGUgZmV3IHBsYWNlcyB3aGVyZSB0aGUKPiA+ID4gPiA+ID4gY29uc3RhbnQgbWFzayBpcyBz
dG9yZWQgaW4gYW4gaW50ZXJtZWRpYXRlIHZhcmlhYmxlIHdlcmUgZml4ZWQgYnkKPiA+ID4gPiA+
ID4gY2hhbmdpbmcgdGhlIHZhcmlhYmxlIHR5cGUgdG8gdTY0IChzZWUgZS5nLiBbMV0gYW5kIFsy
XSkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhvd2V2ZXIsIGZvciBub24tY29uc3RhbnQgbWFz
a3MsIHNtYWxsZXIgdW5zaWduZWQgdHlwZXMgc2hvdWxkIGJlIHZhbGlkLAo+ID4gPiA+ID4gPiB0
b28sIGJ1dCBjdXJyZW50bHkgbGVhZCB0byAicmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3Rh
bnQKPiA+ID4gPiA+ID4gMTg0NDY3NDQwNzM3MDk1NTE2MTUgd2l0aCBleHByZXNzaW9uIG9mIHR5
cGUgLi4uIGlzIGFsd2F5cwo+ID4gPiA+ID4gPiBmYWxzZSItd2FybmluZ3Mgd2l0aCBjbGFuZyBh
bmQgVz0xLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIZW5jZSByZWZhY3RvciB0aGUgX19CRl9G
SUVMRF9DSEVDSygpIGhlbHBlciwgYW5kIGZhY3RvciBvdXQKPiA+ID4gPiA+ID4gX19GSUVMRF97
R0VULFBSRVB9KCkuICBUaGUgbGF0ZXIgbGFjayB0aGUgc2luZ2xlIHByb2JsZW1hdGljIGNoZWNr
LCBidXQKPiA+ID4gPiA+ID4gYXJlIG90aGVyd2lzZSBpZGVudGljYWwgdG8gRklFTERfe0dFVCxQ
UkVQfSgpLCBhbmQgYXJlIGludGVuZGVkIHRvIGJlCj4gPiA+ID4gPiA+IHVzZWQgaW4gdGhlIGZ1
bGx5IG5vbi1jb25zdCB2YXJpYW50cyBsYXRlci4KPiA+Cj4gPiA+ID4gPiA+ICsgICAgIEJVSUxE
X0JVR19PTl9NU0coX19iZl9jYXN0X3Vuc2lnbmVkKG1hc2ssIG1hc2spID4gICAgICAgICAgICAg
ICBcCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgX19iZl9jYXN0X3Vuc2lnbmVk
KHJlZywgfjB1bGwpLCAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgcGZ4ICJ0eXBlIG9mIHJlZyB0b28gc21hbGwgZm9yIG1hc2siKQo+ID4gPiA+ID4K
PiA+ID4gPiA+IFBlcmhhcHMgd2UgbWF5IGNvbnZlcnQgdGhpcyAoYW5kIG90aGVycz8pIHRvIHN0
YXRpY19hc3NlcnQoKTpzIGF0IHNvbWUgcG9pbnQ/Cj4gPiA+ID4KPiA+ID4gPiBOaWNrIHRyaWVk
IHRoYXQgYmVmb3JlLCB3aXRob3V0IHN1Y2Nlc3M6Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL0NBS3d2T2RtX3BydGsxVVFOSlFHaWRabTQ0TGs1ODJTM3A9b2YweTQ2K3JWam5T
Z1hKZ0BtYWlsLmdtYWlsLmNvbQo+ID4gPgo+ID4gPiBBaCwgdGhpcyBpcyB1bmZvcnR1bmF0ZS4K
PiA+Cj4gPiBPZiBjb3Vyc2UsIGl0IG1pZ2h0IGJlIGFuIGFjdHVhbCBidWcgaW4gdGhlIGk5MTUg
ZHJpdmVyLi4uCj4gPgo+ID4gVGhlIGV4dHJhIGNoZWNraW5nIGluIGZpZWxkX3ByZXAoKSBpbiBj
YXNlIHRoZSBjb21waWxlciBjYW4KPiA+IGRldGVybWluZSB0aGF0IHRoZSBtYXNrIGlzIGEgY29u
c3RhbnQgYWxyZWFkeSBmb3VuZCBhIHBvc3NpYmxlIGJ1Zwo+ID4gaW4gZHJpdmVycy9uZXQvd2ly
ZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmM6cnR3ODlfcm9jX2VuZCgpOgo+ID4KPiA+ICAgICBy
dHc4OV93cml0ZTMyX21hc2socnR3ZGV2LCByZWcsIEJfQVhfUlhfRkxUUl9DRkdfTUFTSywgcnR3
ZGV2LT5oYWwucnhfZmx0cik7Cj4gPgo+ID4gZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9y
dHc4OS9yZWcuaDoKPiA+Cj4gPiAgICAgI2RlZmluZSBCX0FYX1JYX01QRFVfTUFYX0xFTl9NQVNL
IEdFTk1BU0soMjEsIDE2KQo+ID4gICAgICNkZWZpbmUgQl9BWF9SWF9GTFRSX0NGR19NQVNLICgo
dTMyKX5CX0FYX1JYX01QRFVfTUFYX0xFTl9NQVNLKQo+ID4KPiA+IHNvIGl0IGxvb2tzIGxpa2Ug
Ql9BWF9SWF9GTFRSX0NGR19NQVNLIGlzIG5vdCB0aGUgcHJvcGVyIG1hc2sgZm9yCj4gPiB0aGlz
IG9wZXJhdGlvbi4uLgo+Cj4gVGhlIHB1cnBvc2Ugb2YgdGhlIHN0YXRlbWVudHMgaXMgdG8gdXBk
YXRlIHZhbHVlcyBleGNsdWRpbmcgYml0cyBvZgo+IEJfQVhfUlhfTVBEVV9NQVhfTEVOX01BU0su
IFRoZSB1c2Ugb2YgQl9BWF9SWF9GTFRSX0NGR19NQVNLIGlzIHRyaWNreSwgYnV0Cj4gdGhlIG9w
ZXJhdGlvbiBpcyBjb3JyZWN0IGJlY2F1c2UgYml0IDAgaXMgc2V0LCBzbyBfX2ZmcyhtYXNrKSBy
ZXR1cm5zIDAgaW4KPiBydHc4OV93cml0ZTMyX21hc2soKS4gVGhlbiwgb3BlcmF0aW9uIGxvb2tz
IGxpa2UKPgo+ICAgIG9yaWcgPSByZWFkKHJlZyk7Cj4gICAgbmV3ID0gKG9yaWcgJiB+bWFzaykg
fCAoZGF0YSAmIG1hc2spOwo+ICAgIHdyaXRlKG5ldyk7Cj4KPiBTaW5jZSB3ZSBkb24ndCB1c2Ug
RklFTERfe0dFVCxQUkVQfSBtYWNyb3Mgd2l0aCBCX0FYX1JYX0ZMVFJfQ0ZHX01BU0ssIGhvdwo+
IGNhbiB5b3UgZmluZCB0aGUgcHJvYmxlbT8gUGxlYXNlIGd1aWRlIHVzLiBUaGFua3MuCgpJc24n
dCBGSUVMRF9NT0RJRlkoKSB3aGF0IHlvdSB3YW50IHRvIHVzZT8KCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
