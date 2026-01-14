Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA65ED39000
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGNXsu8l57fd5S7Ta/ft2QmEwok1wHtcfd+iygafzjs=; b=jpE6o6kWCiZD3a
	gYY5gBU/eCsuRhpp4gjnR4puLjucUN+yOx2pOqjriUK6uyqJxT8Ri/wLRAYPMitZa5DTddQbSuOlG
	5BhCoKbCa5F//9sxSZix9uKXd6q22Ao1d+lT+58jqkCKrj8OE4oyrEgj37nLd1/gEVhGovByAomQ5
	0XJjN1hxsvGSU4XpJU5ypUApaU6SpACTiEpku0SZ6m2lTR3At0oGMBGfYiycShEkDequp72U5iMf4
	nyau+KOppckDwfMc4HfDewGcKNe3LSzeXpfGGtEsNoJfc5466KjaWMO8bjGd628m00uQhaXoFW3wJ
	nEJ0ep5jLBnyaSGPBoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4xm-0000000ACNc-2Fak;
	Wed, 14 Jan 2026 17:47:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4xj-0000000ACLl-2PfK
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 17:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3B4443C8
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 17:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950F6C2BCB2
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768412838;
	bh=tuWbZrH+4mGMGnXLlpjXIiy6C13bGh77pEf3nFBIEfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5tyNnMa2V8sEbsUu6u4sEgcscdLjn2FkqpB+TsEni23Pynl0stZsIIymYZbmrmZ3
	 oqCpWy1NhejE4c8S+ZvmFhO7EBxWuc6KPRHCS0GAH9uCk/r4yolPzVXGygQy5fMYaW
	 Zs7RaWO0vec8YiTYeiHzmFRBU8V3ASymJyEhGTJt2GENYBHv1HD313vdE6kvtb78C/
	 OEbZrre/6Km+TY4waMNiSvMD3pqLoSGN/EkkkFbTEQ6bgLXIUvL4uPzSTLL5x2b4/B
	 724RHmg/MwFi3kI6vb68TbzsEV2pwxz+u7irlmFiZcwSa6ltmzmSgjWkReCcKMeRJx
	 lneKB5YW9Jihw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso65139a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2026 09:47:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV0TFHzhdxQIeS08d1hW53oIYKLWXgRsS2IubsTe7eSSCtq3/aEPf2z2yf3UTLy4qN+Y5p8VfTdKY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsQznWi0sjU/M/VOrqhieK+yB/CND7jTwaDQEJY26SnC8f/2ic
	T7qVcAS3Du0zGEmi7DyFGmtxEVqtJewt5AtaRQYlOb2nYFzA+HJp5b3xEWJlZdFBgCcfOEsZpdV
	Ak93a7HyDBLlaKApeihL+fn21KliJSQ==
X-Received: by 2002:a17:907:d14:b0:b86:e938:1b3a with SMTP id
 a640c23a62f3a-b876103e29bmr272686266b.17.1768412837150; Wed, 14 Jan 2026
 09:47:17 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org> <87fr8fxipc.fsf@bootlin.com>
 <CAL_JsqKV+3ZnqpbQ4USmJh-dngik_jZdnpOw0bGcxD0RSSzfxA@mail.gmail.com> <87ms2gwb1w.fsf@bootlin.com>
In-Reply-To: <87ms2gwb1w.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Jan 2026 11:47:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ+4+Uq=GWwU-naqTs82hp=Kuw6QLRN-ZrhMDBGa_LGww@mail.gmail.com>
X-Gm-Features: AZwV_QivgWJLWruGhaCte97C3vmWMU9MiWmx3wNuxEQ3mMcpnD0y11AtzYaHP24
Message-ID: <CAL_JsqJ+4+Uq=GWwU-naqTs82hp=Kuw6QLRN-ZrhMDBGa_LGww@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node properties
 are documented
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_094719_668441_B8BA6C45 
X-CRM114-Status: GOOD (  24.03  )
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

T24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgNzo1OOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gPj4gPiArJGRlZnM6Cj4g
Pj4gPiArICBwYXJ0aXRpb24tbm9kZToKPiA+PiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPj4gPiAr
ICAgIGlmOgo+ID4+ID4gKyAgICAgIG5vdDoKPiA+PiA+ICsgICAgICAgIHJlcXVpcmVkOiBbIGNv
bXBhdGlibGUgXQo+ID4+ID4gKyAgICB0aGVuOgo+ID4+ID4gKyAgICAgICRyZWY6ICcjJwo+ID4+
ID4gKyAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+PiA+ICsgICAgZWxzZToK
PiA+PiA+ICsgICAgICAkcmVmOiAnIycKPiA+Pgo+ID4+IFRoaXMsIGhvd2V2ZXIsIGlzIHRvdGFs
IGJsYWNrbWFnaWMgdG8gbWUuIFdvdWxkIHlvdSBtaW5kIGV4cGxhaW5pbmcgd2hhdAo+ID4+Cj4g
Pj4gICAgICAgJHJlZjogJyMnCj4gPj4KPiA+PiBpbmRpY2F0ZXM/IElzIHRoaXMgYSBwbGFjZWhv
bGRlciBpbmRpY2F0aW5nICJhIHJlZmVyZW5jZSBtdXN0IGJlIGdpdmVuPwo+ID4KPiA+IEl0J3Mg
d2hhdCdzIGtub3duIGFzIEpTT04gcG9pbnRlcnMuIFRoZSAnIycgaXMgYSByZWZlcmVuY2UgdG8g
dGhlIHRvcAo+ID4gbGV2ZWwgb2YgdGhpcyBzY2hlbWEuCj4gPgo+ID4+IEFsc28gSSBkbyBub3Qg
dW5kZXJzdGFuZCB0aGUgZmluYWwgZWxzZSBjYXNlLCB3aGF0IGlzIGl0IGNvdmVyaW5nPwo+ID4K
PiA+IEl0J3MgcmVhbGx5IGp1c3QgdGhlcmUgc28gYSAkcmVmIHRvCj4gPiBwYXJ0aXRpb24ueWFt
bCMvJGRlZnMvcGFydGl0aW9uLW5vZGUgYXBwbGllcyB0aGUgc2NoZW1hIChhbGwgb2YKPiA+IHBh
cnRpdGlvbi55YW1sKSB3aGV0aGVyIHRoZXJlJ3MgYSBjb21wYXRpYmxlIHByb3BlcnR5IG9yIG5v
dC4KPiA+Cj4gPiBUaGlzIGFsbCBqdXN0IHdvcmtzIGFyb3VuZCB0aGF0IGEgc2NoZW1hIGxpa2Ug
dGhpcyBkb2Vzbid0IHdvcms6Cj4gPgo+ID4gJHJlZjogZm9vLnlhbWwKPiA+IGlmOgo+ID4gICAu
Li4KPiA+IHRoZW46Cj4gPiAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiA+Cj4gPiBU
aGUgZXZhbHVhdGlvbiBvZiB1bmV2YWx1YXRlZFByb3BlcnRpZXMgZG9lc24ndCAic2VlIiB0aGUg
JHJlZiBiZWluZwo+ID4gaW4gdGhlIHBhcmVudC4gU28gd2UgY2FuJ3QgZmFjdG9yIG91dCB0aGUg
JHJlZi4KPgo+IE9vb2gsIG9rLCBmdWxseSB1bmRlcnN0b29kLiBJIHRoaW5rIEkgYWxyZWFkeSBm
YWNlZCB0aGF0IHByb2JsZW0KPiBiZWZvcmUuIEZpcnN0IHRpbWUgSSBoZWFyIGFib3V0IEpTT04g
cG9pbnRlcnMsIHRoYW5rcyBhIGxvdCBmb3IgdGhlCj4gaGVhZHMgdXAuCj4KPiBSZWdhcmRpbmcg
dGhpcyBzZXJpZXMsIGl0IGZlZWxzIGxpa2UgaW4gdGhlIGVuZCwgaWYgSSB1bmRlcnN0b29kIHRo
ZQo+IGRpc2N1c3Npb24gd2l0aCBLcnp5c3p0b2YgY29ycmVjdGx5LCB0aGVyZSBpcyBubyBtb2Rp
ZmljYXRpb24gdG8gYnJpbmc/Cj4gTGV0IG1lIGtub3cgaWYgeW91IHBsYW4gb24gc2VuZGluZyBh
IHYyIG9mIGlmIEkgc2hhbGwgdGFrZSB2MSBvdGhlcndpc2UuCgpSaWdodCwgSSB0aGluayB2MSBp
cyBnb29kIHRvIGdvLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
