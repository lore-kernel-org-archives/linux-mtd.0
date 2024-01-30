Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D6C48285
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jan 2024 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62bw8RFH+Gum9anaNVuebqggUMQ6t52BXWIjP7aQceI=; b=LQwvNh1K1T1ts0
	UuKGNs1Rv2cxf5md8NMXR5LBjiYdMDKNp7MIVuklDqlQArCsKKC1utfOcg0VrPMIphVE5DVDNTilb
	4k+kEFz67JpU7dnXHarlwZ7DEa/kvXBVQHKLuk8b2yjdbmYkfb/a/F12RRfIkYZXgnZfv4HmhHoha
	EkLao2GP6ewTRPnbYFcUYtMQl9QS9Jco4SKmdA5y6OG7artgVaRPCEwurwv7RcMYpIAw8k29y4uXR
	NMKzSRnlnvVlFwbyYE2Dpvg20iLyUjp9LmX8mn/cVrSPgI4vtaIpcsrk+oAEC/3DHe2gnKUcYOP6e
	/mbiE+qXJeeImLrJQaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUq0G-0000000HAki-48NV;
	Tue, 30 Jan 2024 15:26:24 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUq07-0000000HAfW-1jzx
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jan 2024 15:26:16 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6e12db57fedso698408a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jan 2024 07:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706628373; x=1707233173; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95YNzZjCqGewVDFVw5GKEmL/AtttRslbuWoSQwc+WxQ=;
        b=F/LPHTb8HzdNcuREKNaHlVJ4VWkKaP0yT7SFdIaClcE045fsWtuqs/6IliRLw16WK2
         Mb4w3spjsp+sup8Y5o45bW487+9ATpoce0uLIxdhQNrjXz+Q+pFqnzJi87aI3AriGKkA
         PJSlpuS2Z8f+9yXrztkqxiQ4KLSQHE2TRj+so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628373; x=1707233173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95YNzZjCqGewVDFVw5GKEmL/AtttRslbuWoSQwc+WxQ=;
        b=L1NfpZxfQgKYPGaF1K0cwu5WN6NwsujRGCuWfZenypIU4/eaU6wehskT2yZ2Un+LkD
         NpmDfVyJl+8wx2zxYRWcMQk12zdAA3DANjW+ViSU79Ef/tK5IAtG2HIMSGNbjSrp5T2d
         Lp5Qm0splISiLpoK/VLuBXMEmwzBoYQwvrPC8r4emhBWwFcEimYKXEpj4CzJQVIo1sMV
         BRT6Mt55P8FqCohD4aabcJCikFESmKqhl4i7DbXKhNIrlefYarFOCSen1dTXWbw/9/Lq
         fqoEViWsIWwAwPzuhIWoR9OM4RNJijZdsnS9mLJc55IGMIXpVhaEZO+GvnXAhaCxnrB7
         WS2A==
X-Gm-Message-State: AOJu0YzZ0ozFKgBMp2q0szI+j/Y8DwQDqCtExO5nAJbf/1DwsLNEYqZ8
	OpSa1L5bdt9BiwxnMWM9q/6waNToFH9ilqqjr7OfAxqo57iVGTNJiI5LjnXMe1SSOQTUpuOmB2R
	ftzlLzl5MGKRYvPUbWIAwy6QmgRFiT9vD1GjS
X-Google-Smtp-Source: AGHT+IGxupdNP2xsZcONaEVK9pBDWAZoEpyT4Mf6wBGn0beMJ4mbFUcYnLGv1oPi93SgfM34G5xlbX33j7bnRaqzaDQ=
X-Received: by 2002:a05:6830:3141:b0:6dc:6a8f:df1 with SMTP id
 c1-20020a056830314100b006dc6a8f0df1mr522768ots.13.1706628372905; Tue, 30 Jan
 2024 07:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20240124030458.98408-1-dregan@broadcom.com> <20240124030458.98408-11-dregan@broadcom.com>
 <20240124184027.712b1e47@xps-13> <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
 <20240126071913.699c3795@xps-13> <CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
 <20240129115228.06dc2292@xps-13> <2a3edcf5-7afc-410c-a402-3d8cd3feb1da@broadcom.com>
 <20240130120155.3cb6feed@xps-13>
In-Reply-To: <20240130120155.3cb6feed@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Tue, 30 Jan 2024 07:26:02 -0800
Message-ID: <CAA_RMS577vw=QWN9_NHfmWqt+_cDG22tA01aU019CPNjAgHqJQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: William Zhang <william.zhang@broadcom.com>, David Regan <dregan@broadcom.com>, dregan@mail.com, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin <joel.peshkin@broadcom.com>, 
	Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan Beygelman <dan.beygelman@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com, 
	baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_072615_558705_6C361653 
X-CRM114-Status: GOOD (  51.20  )
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

SGkgTWlxdWVsLAoKT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMzowMeKAr0FNIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgV2lsbGlhbSwKPgo+
IHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMzAgSmFuIDIwMjQgMDA6
MTE6MzIgLTA4MDA6Cj4KPiA+IEhpIE1pcXVlbCwKPiA+Cj4gPiBPbiAxLzI5LzI0IDAyOjUyLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gPiBIaSBEYXZpZCwKPiA+ID4KPiA+ID4gZHJlZ2FuQGJy
b2FkY29tLmNvbSB3cm90ZSBvbiBGcmksIDI2IEphbiAyMDI0IDExOjU3OjM5IC0wODAwOgo+ID4g
Pgo+ID4gPj4gSGkgTWlxdcOobCwKPiA+ID4+Cj4gPiA+PiBPbiBUaHUsIEphbiAyNSwgMjAyNCBh
dCAxMDoxOeKAr1BNIE1pcXVlbCBSYXluYWwKPiA+ID4+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiA+ID4+Pgo+ID4gPj4+IEhpIERhdmlkLAo+ID4gPj4+Cj4gPiA+Pj4gZHJl
Z2FuQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBUaHUsIDI1IEphbiAyMDI0IDExOjQ3OjQ2IC0wODAw
Ogo+ID4gPj4+ICAgPj4+PiBIaSBNaXF1w6hsLAo+ID4gPj4+Pgo+ID4gPj4+PiBPbiBXZWQsIEph
biAyNCwgMjAyNCBhdCA5OjQw4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gd3JvdGU6Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gSGkgRGF2aWQsCj4gPiA+Pj4+Pgo+
ID4gPj4+Pj4gZHJlZ2FuQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBUdWUsIDIzIEphbiAyMDI0IDE5
OjA0OjU4IC0wODAwOgo+ID4gPj4+Pj4gICA+Pj4+Pj4gQWxsb3cgc2V0dGluZ3MgZm9yIG9uLWRp
ZSBlY2Mgc3VjaCB0aGF0IGlmIG9uLWRpZSBFQ0MgaXMgc2VsZWN0ZWQKPiA+ID4+Pj4+PiBkb24n
dCBlcnJvciBvdXQgYnV0IHJlcXVpcmUgRUNDIHN0cmFwIHNldHRpbmcgb2YgemVybwo+ID4gPj4+
Pj4+Cj4gPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNv
bS5jb20+Cj4gPiA+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhh
bmdAYnJvYWRjb20uY29tPgo+ID4gPj4+Pj4+IC0tLQo+ID4gPj4+Pj4+IENoYW5nZXMgaW4gdjM6
IE5vbmUKPiA+ID4+Pj4+PiAtLS0KPiA+ID4+Pj4+PiBDaGFuZ2VzIGluIHYyOgo+ID4gPj4+Pj4+
IC0gQWRkZWQgdG8gcGF0Y2ggc2VyaWVzCj4gPiA+Pj4+Pj4gLS0tCj4gPiA+Pj4+Pj4gICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTQgKysrKysrKysrKy0tLS0K
PiA+ID4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9i
cmNtbmFuZC5jCj4gPiA+Pj4+Pj4gaW5kZXggYTRlMzExYjY3OThjLi40MjUyNmYzMjUwYzkgMTAw
NjQ0Cj4gPiA+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+ID4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMKPiA+ID4+Pj4+PiBAQCAtMjcyNyw5ICsyNzI3LDExIEBAIHN0YXRpYyBpbnQgYnJjbW5h
bmRfc2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ID4gPj4+Pj4+ICAgICAg
ICBjZmctPmJsa19hZHJfYnl0ZXMgPSBnZXRfYmxrX2Fkcl9ieXRlcyhtdGQtPnNpemUsIG10ZC0+
d3JpdGVzaXplKTsKPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+ICAgICAgICBpZiAoY2hpcC0+ZWNjLmVu
Z2luZV90eXBlICE9IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1QpIHsKPiA+ID4+Pj4+PiAt
ICAgICAgICAgICAgIGRldl9lcnIoY3RybC0+ZGV2LCAib25seSBIVyBFQ0Mgc3VwcG9ydGVkOyBz
ZWxlY3RlZDogJWRcbiIsCj4gPiA+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGNoaXAtPmVj
Yy5lbmdpbmVfdHlwZSk7Cj4gPiA+Pj4+Pj4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+ID4+Pj4+PiArICAgICAgICAgICAgIGlmIChjaGlwLT5lY2Muc3RyZW5ndGgpIHsKPiA+ID4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihjdHJsLT5kZXYsICJFUlJPUiEhISBI
VyBFQ0MgbXVzdCBiZSBzZXQgdG8gemVybyBmb3Igbm9uLWhhcmR3YXJlIEVDQzsgc2VsZWN0ZWQ6
ICVkXG4iLAo+ID4gPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoaXAtPmVj
Yy5zdHJlbmd0aCk7Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gQ2FuIHlvdSB1c2UgYSBtb3JlIGZvcm1h
bCBzdHJpbmc/IEFsc28gY2xhcmlmeSBpdCBiZWNhdXNlIEkgZG9uJ3QKPiA+ID4+Pj4+IHJlYWxs
eSB1bmRlcnN0YW5kIHdoYXQgaXQgbGVhZHMgdG8uCj4gPiA+Pj4+Cj4gPiA+Pj4+IEhvdyBhYm91
dDoKPiA+ID4+Pj4KPiA+ID4+Pj4gZGV2X2VycihjdHJsLT5kZXYsICJIVyBFQ0Mgc2V0IHRvICVk
LCBtdXN0IGJlIHplcm8gZm9yIG9uLWRpZSBFQ0NcbiIsCj4gPiA+Pj4KPiA+ID4+PiBBY3R1YWxs
eSBJIGFtIHdvbmRlcmluZyBob3cgbGVnaXRpbWF0ZSB0aGlzIGlzLiBKdXN0IGRvbid0IGVuYWJs
ZSB0aGUKPiA+ID4+PiBvbiBob3N0IEVDQyBlbmdpbmUgaWYgaXQncyBub3QgaW4gdXNlLiBObyBu
ZWVkIHRvIGNoZWNrIHRoZSBjb3JlJ3MKPiA+ID4+PiBjaG9pY2UuCj4gPiA+Pgo+ID4gPj4gT3Vy
IGNoaXAgRUNDIGVuZ2luZSB3aWxsIGVpdGhlciBiZSBvbiBpZiBpdCdzIG5lZWRlZCBvciBvZmYg
aWYgaXQncyBub3QuCj4gPiA+PiBFaXRoZXIgSSBjYW4gZG8gdGhhdCBpbiBvbmUgcGxhY2Ugb3Ig
cHV0IGNoZWNrcyBpbiBiZWZvcmUgZWFjaAo+ID4gPj4gcmVhZC93cml0ZSB0byB0dXJuIG9uL29m
ZiB0aGUgRUNDIGVuZ2luZSwgd2hpY2ggc2VlbXMgYSBsb3QgbW9yZQo+ID4gPj4gd29yayBhbmQg
Y2hhbmdlcyBhbmQgcG9zc2libGUgaXNzdWVzL3Byb2JsZW1zLgo+ID4gPj4gVHVybmluZyBpdCBv
bi9vZmYgYXMgbmVlZGVkIGhhcyBub3QgYmVlbiBleHBsaWNpdGx5IHRlc3RlZCBhbmQKPiA+ID4+
IGNvdWxkIGNhdXNlIHVuZm9yZXNlZW4gY29uc2VxdWVuY2VzLiBUaGlzCj4gPiA+PiBpcyBhIG1p
bmltYWwgY2hhbmdlIHdoaWNoIHNob3VsZCBoYXZlIG1pbmltYWwgaW1wYWN0Lgo+ID4gPj4KPiA+
ID4+PiAgID4+Pj4gICA+Pj4+PiAgID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiA+Pj4+Pj4gKyAgICAgICAgICAgICB9Cj4gPiA+Pj4+Pj4gICAgICAgIH0K
PiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+ICAgICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9F
Q0NfQUxHT19VTktOT1dOKSB7Cj4gPiA+Pj4+Pj4gQEAgLTI3OTcsNyArMjc5OSwxMSBAQCBzdGF0
aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiA+
ID4+Pj4+PiAgICAgICAgaWYgKHJldCkKPiA+ID4+Pj4+PiAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pj4gLSAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVk
KGhvc3QsIDEpOwo+ID4gPj4+Pj4+ICsgICAgIGlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPT0g
TkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fRElFKSB7Cj4gPiA+Pj4+Pj4gKyAgICAgICAgICAgICBk
ZXZfZGJnKGN0cmwtPmRldiwgIkRpc2FibGUgSFcgRUNDIGZvciBvbi1kaWUgRUNDXG4iKTsKPiA+
ID4+Pj4+Cj4gPiA+Pj4+PiBOb3QgbmVlZGVkLgo+ID4gPj4+Pgo+ID4gPj4+PiBXaWxsIHJlbW92
ZS4KPiA+ID4+Pj4gICA+Pj4+PiAgID4+Pj4+PiArICAgICAgICAgICAgIGJyY21uYW5kX3NldF9l
Y2NfZW5hYmxlZChob3N0LCAwKTsKPiA+ID4+Pj4+PiArICAgICB9IGVsc2UKPiA+ID4+Pj4+PiAr
ICAgICAgICAgICAgIGJyY21uYW5kX3NldF9lY2NfZW5hYmxlZChob3N0LCAxKTsKPiA+ID4+Pj4+
Cj4gPiA+Pj4+PiBTdHlsZSBpcyB3cm9uZywgYnV0IG90aGVyd2lzZSBJIHRoaW5rIEVDQyBzaG91
bGQgYmUga2VwdCBkaXNhYmxlZCB3aGlsZQo+ID4gPj4+Pj4gbm90IGluIGFjdGl2ZSB1c2UsIHNv
IEkgYW0gYSBiaXQgc3VycHJpc2VkIGJ5IHRoaXMgbGluZS4KPiA+ID4+Pj4KPiA+ID4+Pj4gVGhp
cyBpcyBhIGRvdWJsZSBjaGVjayB0byB0dXJuIG9uL29mZiBvdXIgaGFyZHdhcmUgRUNDLgo+ID4g
Pj4+Cj4gPiA+Pj4gSSBleHBlY3QgdGhlIGVuZ2luZSB0byBiZSBhbHdheXMgZGlzYWJsZWQuIEVu
YWJsZSBpdCBvbmx5IHdoZW4geW91Cj4gPiA+Pj4gbmVlZCAobWF5IHJlcXVpcmUgYW4gYWRkaXRp
b25hbCBwYXRjaCBiZWZvcmUgdGhpcyBvbmUpLgo+ID4gPj4KPiA+ID4+IFdlIGFyZSBhbHJlYWR5
IHR1cm5pbmcgb24gdGhlIEVDQyBlbmFibGUgYXQgdGhpcyBwb2ludCwKPiA+ID4+IHRoaXMgaXMg
anVzdCBhZGRpbmcgdGhlIG9wdGlvbiB0byB0dXJuIGl0IG9mZiBpZiB0aGUgTkFORCBjaGlwCj4g
PiA+PiBpdHNlbGYgd2lsbCBiZSBkb2luZyB0aGUgRUNDIGluc3RlYWQgb2Ygb3VyIGNvbnRyb2xs
ZXIuCj4gPiA+Cj4gPiA+IFNvcnJ5IGlmIEkgaGF2ZSBub3QgYmVlbiBjbGVhci4KPiA+ID4KPiA+
ID4gVGhpcyBzZXF1ZW5jZToKPiA+ID4gLSBpbml0Cj4gPiA+IC0gZW5hYmxlIGh3IEVDQyBlbmdp
bmUKPiA+ID4gSXMgYnJva2VuLgo+ID4gPgo+ID4gRUNDIGVuZ2luZSBpcyBub3QgZW5hYmxlZCBm
b3IgYWxsIHRoZSBjYXNlcy4gSGVyZSB3ZSBvbmx5IGludGVuZGVkIHRvIGVuYWJsZSBpdCBmb3Ig
dGhlIG5hbmQgY2hpcCB0aGF0IGlzIHNldCB0byB1c2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05f
SE9TVC4gVGhlIGxvZ2ljIGhlcmUgc2hvdWxkIGJldHRlciBjaGFuZ2UgdG86Cj4gPiBpZiAoY2hp
cC0+ZWNjLmVuZ2luZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1QpCj4gPiAg
ICAgIGJyY21uYW5kX3NldF9lY2NfZW5hYmxlZChob3N0LCAxKTsKPiA+IGVsc2UKPiA+ICAgICAg
YnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwo+ID4KPiA+ID4gSXQgKmNhbm5vdCog
d29yayBhcyBhbnkgb3BlcmF0aW9uIGdvaW5nIHRocm91Z2ggZXhlY19vcCBub3cgbWF5Cj4gPiA+
IHBlcmZvcm0gcGFnZSByZWFkcyB3aGljaCBzaG91bGQgYmUgdW5tb2RpZmllZCBieSB0aGUgRUND
IGVuZ2luZS4gWW91ID4gZHJpdmVyICptdXN0KiBmb2xsb3cgdGhlIGZvbGxvd2luZyBzZXF1ZW5j
ZToKPiA+ID4gLSBpbml0IGFuZCBkaXNhYmxlIChvciBrZWVwIGRpc2FibGVkKSB0aGUgaHcgRUND
IGVuZ2luZQo+ID4gPiAtIHdoZW4geW91IHBlcmZvcm0gYSBwYWdlIG9wZXJhdGlvbiB3aXRoIGNv
cnJlY3Rpb24geW91IG5lZWQgdG8KPiA+ID4gICAgIC0gZW5hYmxlIHRoZSBlbmdpbmUKPiA+ID4g
ICAgIC0gcGVyZm9ybSB0aGUgb3BlcmF0aW9uCj4gPiA+ICAgICAtIGRpc2FibGUgdGhlIGVuZ2lu
ZQo+ID4gPiBNYXliZSBJIGFtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUgYnV0IGFyZSB5b3Ugc2F5
aW5nIHRoZSBleGVjX29wIGNhbiBoYXZlIGRpZmZlcmVudCBlY2MgdHlwZSBmb3IgcGFnZSByZWFk
L3dyaXRlIGF0IHJ1biB0aW1lIG9uIHRoZSBzYW1lIG5hbmQgY2hpcD8gSSBkb24ndCBzZWUgdGhl
IG9wIGluc3RyIHN0cnVjdHVyZSBoYXMgdGhlIGVjYyB0eXBlIGZpZWxkIGFuZCB0aG91Z2h0IGl0
IGlzIG9ubHkgYmluZCB0byB0aGUgbmFuZCBjaGlwIGFuZCB3b24ndCBjaGFuZ2UgYXQgcnVuIHRp
bWUuIFNvIGxvb2tzIHRvIG1lIHRoZSBpbml0IHRpbWUgc2V0dGluZyB0byB0aGUgZW5naW5lIGJh
c2VkIG9uIGVjYy5lbmdpbmVfdHlwZSBzaG91bGQgYmUgc3VmZmljaWVudC4KPiA+Cj4gPiBXaGF0
IHlvdSBkZXNjcmliZWQgaGVyZSBjYW4gd29yayBmb3IgdGhlIGh3LmVjYyByZWFkIHBhdGggKGVj
Yy5yZWFkX3BhZ2UgPSBicmNtbmFuZF9yZWFkX3BhZ2UpIHdoaWNoIGFsd2F5cyBhc3N1bWVzIGVj
YyBpcyBlbmFibGVkLiBBbHRob3VnaCBpdCBpcyBwcm9iYWJseSBub3QgdG9vIGJhZCB3aXRoIHRo
ZXNlIHR3byBleHRyYSBvcGVyYXRpb24sIGl0IHdvdWxkIGJlIGJldHRlciBpZiB3ZSBkb24ndCBo
YXZlIHRvIGFkZCBhbnl0aGluZyBhcyBvdXIgY3VycmVudCBjb2RlIGRvZXMuIEZvciB0aGUgYnJj
bW5hbmRfcmVhZF9wYWdlX3JhdywgIHdlIGN1cnJlbnRseSBkaXNhYmxlIHRoZSBlbmdpbmUgYW5k
IHRoZW4gcmUtZW5hYmxlIGl0KGJ1dCB3ZSBuZWVkIHRvIGZpeCBpdCB0byBvbmx5IGVuYWJsZSBp
dCB3aXRoIGh3IGVjYyBlbmdpbmUgdHlwZSkuICBTbyBpdCBpcyBqdXN0IG9wcG9zaXRlIG9mIHlv
dSBsb2dpYyBidXQgd29ya3MgdGhlIHNhbWUgd2l0aCBubyBpbXBhY3Qgb24gdGhlIG1vc3QgcGVy
Zm9ybWFuY2UgY3JpdGljYWwgcGF0aC4KPgo+IFRoaXMgaXMgbm90ICJteSIgbG9naWMsIHRoaXMg
aXMgdGhlICJjb3JlJ3MiIGxvZ2ljLiBJIGFtIHNheWluZzogeW91cgo+IGFwcHJvYWNoIGlzIGJy
b2tlbiBiZWNhdXNlIHRoYXQgaXMgbm90IGhvdyB0aGUgQVBJIGlzIHN1cHBvc2VkIHRvIHdvcmss
Cj4gYnV0IGl0IG1vc3RseSB3b3JrcyBpbiB0aGUgc3RhbmRhcmQgY2FzZS4KCkluIHRoZSBpbnRl
cmVzdCBvZiBtaW5pbWl6aW5nIHJlZ2lzdGVyIHdyaXRlcywgd291bGQgaXQgYmUgYWNjZXB0YWJs
ZSB0bwplbmFibGUvZGlzYWJsZSBFQ0MgYXQgdGhlIGJlZ2lubmluZyBvZiBhIHN0YW5kYXJkCnBh
dGggdHJhbnNmZXIgYnV0IG5vdCwgYWZ0ZXIgdGhlIHRyYW5zZmVyLCB0dXJuIG9mZiB0aGUgRUND
PyBUaGlzIHNob3VsZCBub3QKYWZmZWN0IG90aGVyIHN0YW5kYXJkIHBhdGggb3BlcmF0aW9ucyBu
b3IgYWZmZWN0IHRoZSBleGVjX29wIHBhdGggYXMgdGhvc2UKYXJlIGxvdyBsZXZlbCB0cmFuc2Zl
cnMgd2hpY2ggb3VyIEVDQyBlbmdpbmUgd291bGQgbm90IHRvdWNoIGFuZCB0aGUgTkFORApkZXZp
Y2UgZHJpdmVyIHNob3VsZCBiZSByZXNwb25zaWJsZSBmb3IgdHVybmluZyBvbi9vZmYgaXRzIG93
biBFQ0MuCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcyEKCi1EYXZlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
