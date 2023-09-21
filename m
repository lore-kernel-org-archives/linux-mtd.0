Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A7EE71088
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liIQFDPIYtj6T9msdqRrdQareWha5c/2TT9SULj98hQ=; b=svqudmX8KmXD6c
	UZzrpS8YPWUi8K6p11xNuiW4AfHVMW8SEh70l3khJ+omaIvvCX00yk3gIRfzYZv/qVriipta1Oe+n
	PSpda25bjqWAHBTyb76KPon96MyldbRJDvWjRFuqtotxoaX4nB26+VWN9NHHvkfJNUNyO8jnsCboB
	g1xcaSrlEJRfqhWxJ1K/Egj7fRBwAY+NlMTWpOX0XHFcZA/BQ4k9vue89qsBmoTI/VF6gRxqO2YTB
	c1CCz95ZuvxDGG71/LlQLOTVxS8wTQUokQIQIfkHJ2jWh3NY+sp6FwX7dJH3dVbyQC+kHvKey63zT
	2Mc7+m4u2Di+D6J/oskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLKf-006NHO-01;
	Thu, 21 Sep 2023 15:11:09 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLKc-006NGn-0V
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 15:11:07 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59bdb3d03b1so13538037b3.3
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 08:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695309064; x=1695913864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG8p3Ox6WlwM/LHrd1QCAhLEOmdahvYhmsYqP/8b0wc=;
        b=iR3MjIIq3A8cAI3DazPfrSYPHhPOKsQyOt+s4zkES1zH7m+m/vPLgESQUuBSvIfAQs
         OOPW6HdfzkFaDowgLoxY94yGdvzOzt9pV9U8am190DBGwFHrIEOdD0h2NQ16zTjYHUp5
         uR8kcCJ3sp2eGedfqSVjtKYguH8en6qqnFqLzpkMrOPWyo1ywxu4Tk2D6qb53WOWsyTK
         y4RiSCQQ7E8up1S7c46lSMp4nfx74WQrmUydvQekhco58QqWa04umamzCaNwksPDloQt
         MCvBYL6bgx3ulN5cS1DJNnYDT+lNIxQvBIDoHeytS8tSlz6i8gzxRVkVq2UgZuGLQMws
         kt2A==
X-Gm-Message-State: AOJu0YzgXpDLzwmeQTUMCveRMD6ihnf0kOHVqO7S2YQngHummEbLWYBZ
	rXihQkbLuub6qapVL/5i3/u9LwtUljc4msct
X-Google-Smtp-Source: AGHT+IECsFEZOlG3KrEz6cblqATaErZ2wpEMQ/Z68LFrvCO6Iw4HSyL5Ru5a34+iJ4jwDXDna2KqTg==
X-Received: by 2002:a81:4895:0:b0:589:d560:adaa with SMTP id v143-20020a814895000000b00589d560adaamr5907861ywa.7.1695309064505;
        Thu, 21 Sep 2023 08:11:04 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id m18-20020a819e12000000b00559f1cb8444sm364058ywj.70.2023.09.21.08.11.03
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 08:11:04 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d8020510203so1315881276.2
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 08:11:03 -0700 (PDT)
X-Received: by 2002:a5b:7c8:0:b0:d19:664:7425 with SMTP id t8-20020a5b07c8000000b00d1906647425mr5345303ybq.27.1695309063668;
 Thu, 21 Sep 2023 08:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org> <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
In-Reply-To: <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 17:10:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Message-ID: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Michael Walle <michael@walle.cc>, 
	Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_081106_193664_39791018 
X-CRM114-Status: GOOD (  36.57  )
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

SGkgVHVkb3IsCgpPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCA0OjQ14oCvUE0gVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPiBTb3JyeSBmb3IgdGhlIGRlbGF5
LCBJIGp1c3Qgbm90aWNlZCB0aGlzIHdoaWxlIGNsZWFuaW5nIHRoZSBwYXRjaHdvcmsgbG9nLgo+
IE9uIDEyLzYvMjIgMDg6MzIsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIE1vbiwg
RGVjIDUsIDIwMjIgYXQgNTozMyBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90
ZToKPiA+PiBPbiBGcmksIERlYyAwMiwgMjAyMiBhdCAwMjo1NjowMVBNICswMTAwLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4+IE9uIEZyaSwgRGVjIDIsIDIwMjIgYXQgMjo1MCBQTSBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cm90ZToKPiA+Pj4+IEFtIDIwMjItMTIt
MDIgMTQ6MzcsIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOgo+ID4+Pj4+IERvY3VtZW50IHN1
cHBvcnQgZm9yIHRoZSBNaWNyb24gTVQyNVFVMjU2QSBhbmQgTVQyNVFVNTEyQSBTZXJpYWwgTk9S
Cj4gPj4+Pj4gRkxBU0hlcy4KPiA+Pj4+Pgo+ID4+Pj4+IE1lcmdlIHRoZSBuZXcgZW50cmllcyB3
aXRoIHRoZSBleGlzdGluZyBlbnRyeSBmb3IgTVQyNVFVMDJHLgo+ID4+Pj4+Cj4gPj4+Pj4gU2ln
bmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
PiA+Pj4+PiAtLS0KPiA+Pj4+PiBtdDI1cXU1MTJhIGlzIGFscmVhZHkgaW4gYWN0aXZlIHVzZSwg
Y2F1c2luZyAibWFrZSBkdGJzX2NoZWNrIiBlcnJvcnMuCj4gPj4+Pj4gbXQyNXF1MjU2YSBpcyBz
dXBwb3J0ZWQgYnkgdGhlIExpbnV4IHNwaS1ub3IgZHJpdmVyLCBidXQgdGhlcmUgYXJlIG5vCj4g
Pj4+Pj4gdXBzdHJlYW0gdXNlcnMgeWV0Lgo+ID4+Pj4KPiA+Pj4+IElzIGl0IGVuY291cmFnZWQg
dG8gdXNlIHRoZSBzcGVjaWZpYyBjb21wYXRpYmxlIHdpdGggU1BJLU5PUiBmbGFzaGVzPwo+ID4+
Pj4gQXMgZmFyIGFzIEkga25vdyBpdCBpc24ndC4gVGhlIHNwaS1ub3Igc3Vic3lzIHRyaWVzIGhh
cmQgdG8gaWRlbnRpZnkKPiA+Pj4+IGFueSBmbGFzaGVzIGF0IHJ1bnRpbWUgYW5kIGFueSBhZGRp
dGlvbmFsIGluZm9ybWF0aW9uIGluIHRoZSBkZXZpY2UgdHJlZQo+ID4+Pj4gaXMgdXNlZCBhcyBh
IGxhc3QgcmVzb3J0IChqdXN0IGZvciBmbGFzaGVzIHdoaWNoIGRvZXNuJ3Qgc3VwcG9ydCB0aGUK
PiA+Pj4+IHJlYWQgamVkZWMgaWQgY29tbWFuZCB5ZXQpLiBBbmQgdXN1YWxseSBib2FyZHMgaGF2
ZSBkaWZmZXJlbnQgc291cmNlcwo+ID4+Pj4gZm9yIGZsYXNoIGNoaXBzLCBzbyBoYXJkY29kaW5n
IGEgcGFydGljdWxhciBwYXJ0IGluIHRoZSBkZXZpY2UgdHJlZQo+ID4+Pj4gZG9lc24ndCBtYWtl
IHNlbnNlLgo+ID4+Pgo+ID4+PiBUaGFua3MsIEkgYW0gYXdhcmUgdGhlcmUgaGF2ZSBiZWVuIHB1
c2hiYWNrcyB3aGVuIHRyeWluZyB0bwo+ID4+PiBkb2N1bWVudCBtb3JlIGNvbXBhdGlibGUgdmFs
dWVzLgo+ID4+Pgo+ID4+PiBJTUhPIGVpdGhlciBhbGwgb3Igbm9uZSBvZiB0aGVtIHNob3VsZCBi
ZSBkb2N1bWVudGVkLgo+ID4+PiBJZiBkZXZpY2Utc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZXMg
YXJlIGRpc2NvdXJhZ2VkLCB0aGUgYmluZGluZ3MKPiA+Pj4gc2hvdWxkIGJlIHVwZGF0ZWQgdG8g
cmVmbGVjdCB0aGF0LCBhbmQgZG9jdW1lbnQgYSBzaW5nbGUgY29tcGF0aWJsZQo+ID4+PiB2YWx1
ZSAoImplZGVjLHNwaS1ub3IiKSBvbmx5Lgo+ID4+Cj4gPj4gVGhhdCdzIGFscmVhZHkgYWxsb3dl
ZCwgc28gdGhlcmUncyB5b3VyIGFuc3dlci4KPiA+Cj4gPiBJdCdzIGluZGVlZCBhbGxvd2VkLCBi
dXQgdGhlIGFsdGVybmF0aXZlIGlzIGRvY3VtZW50ZWQsIHRvbyAoZm9yIHNvbWUKPiA+IHZhbHVl
cykuCj4gPgo+ID4+IFRoZSBjYXZlYXQgaXMgZG9uJ3QgYmUgYWRkaW5nIHRoZW0gbGF0ZXIgdG8g
eW91ciBEVCB3aGVuIHlvdSBmaW5kIGFuCj4gPj4gaXNzdWUgYW5kIG5ldyBxdWlyayBwcm9wZXJ0
aWVzIHdpbGwgcHJvYmFibHkgYmUgcmVqZWN0ZWQuCj4gPgo+ID4gQWRkaW5nIHRoZW0gbGF0ZXIg
dG8geW91ciBEVCB3aGVuIHlvdSBmaW5kIGFuIGlzc3VlIG1ha2VzIG5vIHNlbnNlLAo+ID4gYXMg
dGhhdCBicmVha3MgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIERUQnMuCj4KPiBXZSB3b24ndCBi
cmVhayBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgRFRCcyBpZiB3ZSB1c2UgYSBsaXN0IG9mCj4g
Y29tcGF0aWJsZXMuIEZpcnN0IHRoZSB2ZW5kb3Igc3BlY2lmaWMgb25lIHdoaWNoIHdpbGwgdXNl
IHNvbWUgcXVpcmtzLAo+IGFuZCBpZiB0aGF0J3Mgbm90IGF2YWlsYWJsZSwgaGF2ZSBhcyBzZWNv
bmQgdGhlIGdlbmVyaWMgamVkZWMsc3BpLW5vciB0bwo+IGZhbGxiYWNrIHRvLgoKU3VyZSwgeW91
IHNob3VsZCB1c2UgYSBsaXN0LgoKQnV0IHRoZSBjdXJyZW50IHJlY29tbWVuZGVkIHByYWN0aWNl
IGlzIHRvIG5vdCBoYXZlIGEgbGlzdCwKYnV0IGp1c3QgImplZGVjLHNwaS1ub3IiICh1c2luZyBh
IGxpc3Qgd2l0aCBhIG5ldyBGTEFTSCBwYXJ0IG5hbWUKY2F1c2VzIGNoZWNrcGF0Y2ggYW5kIGR0
YnNfY2hlY2sgd2FybmluZ3MpLiBIZW5jZSBpZiB5b3UgZm9sbG93IHRoYXQKcmVjb21tZW5kYXRp
b24sIHlvdSB3aWxsIHJ1biBpbnRvIGNvbXBhdGliaWxpdHkgaXNzdWVzIHdpdGggb2xkZXIgRFRC
cwp3aGVuIHlvdSBkaXNjb3ZlciB0aGUgcXVpcmsgbGF0ZXIsIGFuZCBkZWNpZGUgdG8gYWRkIGl0
IHRvIHRoZSBsaXN0LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
