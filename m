Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E7CC47422
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jan 2024 19:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCkuLDE6HDJ8v8q1l4v0G2GLURFrZLkl4o8Rp6KaQho=; b=Xok1TJRnrkXmEI
	2UyQjBGjK8o3ZBOrPKJ5A24Iro1GOzYyf5iwPBtE2CEsVagjzWBH/M8bwY/5kbSceW1H3QFwb2xQH
	CDeJh++0cREwRfku5UlM2UNLsedf/cSyGjbfESh+ZOnklNKOnrwo4UgrJtMOxauTWuhbkNH1ugelN
	+ND+kgfQI5vUjb7jvIP0qsgUjLbeGQJJloAFbZbOGD+hrXuG8AxlKrqN0JE/u/QvdGZ6mySzGt0t7
	fGOA2T7pAUypSvw6Pp3i+XmF4sad6LvzzJpbcTVU22TTH+MSm+EaHHBY37JmnIs3LSKMNvbTy5nrK
	RY5QogSM92YvyfPkAofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTSLp-00000005Ibv-03SR;
	Fri, 26 Jan 2024 19:58:57 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTSLl-00000005IaR-1hMM
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jan 2024 19:58:54 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e0f43074edso624406a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2024 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706299070; x=1706903870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8qZh8tfmWARSxkgMSjgm0Ee+mYC8Et59eGzshH4MMI=;
        b=ZUxKj+Gnbjo2b0XCglqsUl2TJAt0oLXQccHiHyIqQ4Qj9jl6OvKkXDSLGq4pc80Z7Q
         5yJqlI8AOodAQAzGvD0DvQp/pUPQHSJD1ss3q1Knttu5Nb5JLQHEwr9aRL6Lf/NjVtH3
         usmbmV0uMJLSEkFR56ZPmf3XPMxcap6gx9FY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706299070; x=1706903870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8qZh8tfmWARSxkgMSjgm0Ee+mYC8Et59eGzshH4MMI=;
        b=cu/HPMjTZyI6pgGowKwRPyMLLNeeZTlPci1Nogaj1wVNCTZdPjAn1piU7iHMpIoKzG
         lgAEk7vRFRRQ44OjhK+XUFJC41bCeUcI5xMgq4UjAYt+YW0HUlK8ECXbozHYQ5HLcK4+
         7lHW4YXe9Hxi56mG13qU/StgM7YXjK3NqQNJDfhrrqj2rLjQgSrK4aiVIW+nNCIX+xHm
         RQnGePkbHgLSFJSnkyEOWo4ia2BvdPHrFTfQD+v7wxqLTwEIL8RLBWM4EgocIzs70zGs
         tlOeSmZAAN09Nerg0WqEKQDAynLvtIoQCJNC51qfCpgnZ7H3Bwauk+pIcuKVw2yHvr7e
         J5Aw==
X-Gm-Message-State: AOJu0YyFKQyhUCINFHwTHKrWjfXQ8+5emJlfbLRmYjDD2uGxeU9s68E9
	YSSUUrEksDYzjq6Qn8ABslaak/bqL47bYso8HBR9ww+aibOYiS1CFylJg3/LnbjdgaUthkNeEaa
	ptn9OMxKPNZ960X+TAx5yFAt9TAKvuB/sO8SO
X-Google-Smtp-Source: AGHT+IGQ/4wSd/NSTRBeIlGwXqntNHpdR66dbLfhnzA2JaEkrHh6UrnPd664+kqFzjqkh4QOOamCSyjf8dZjuF4i4Ck=
X-Received: by 2002:a05:6830:134f:b0:6dd:9d3a:2421 with SMTP id
 r15-20020a056830134f00b006dd9d3a2421mr221283otq.3.1706299070172; Fri, 26 Jan
 2024 11:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20240124030458.98408-1-dregan@broadcom.com> <20240124030458.98408-11-dregan@broadcom.com>
 <20240124184027.712b1e47@xps-13> <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
 <20240126071913.699c3795@xps-13>
In-Reply-To: <20240126071913.699c3795@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Fri, 26 Jan 2024 11:57:39 -0800
Message-ID: <CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, dregan@mail.com, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin <joel.peshkin@broadcom.com>, 
	Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan Beygelman <dan.beygelman@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com, 
	andre.przywara@arm.com, baruch@tkos.co.il, 
	linux-arm-kernel@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_115853_473453_7113DB16 
X-CRM114-Status: GOOD (  34.84  )
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

SGkgTWlxdcOobCwKCk9uIFRodSwgSmFuIDI1LCAyMDI0IGF0IDEwOjE54oCvUE0gTWlxdWVsIFJh
eW5hbAo8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBEYXZpZCwKPgo+
IGRyZWdhbkBicm9hZGNvbS5jb20gd3JvdGUgb24gVGh1LCAyNSBKYW4gMjAyNCAxMTo0Nzo0NiAt
MDgwMDoKPgo+ID4gSGkgTWlxdcOobCwKPiA+Cj4gPiBPbiBXZWQsIEphbiAyNCwgMjAyNCBhdCA5
OjQw4oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEhpIERhdmlkLAo+ID4gPgo+ID4gPiBkcmVnYW5AYnJvYWRjb20uY29tIHdy
b3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQgMTk6MDQ6NTggLTA4MDA6Cj4gPiA+Cj4gPiA+ID4gQWxs
b3cgc2V0dGluZ3MgZm9yIG9uLWRpZSBlY2Mgc3VjaCB0aGF0IGlmIG9uLWRpZSBFQ0MgaXMgc2Vs
ZWN0ZWQKPiA+ID4gPiBkb24ndCBlcnJvciBvdXQgYnV0IHJlcXVpcmUgRUNDIHN0cmFwIHNldHRp
bmcgb2YgemVybwo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRy
ZWdhbkBicm9hZGNvbS5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFdpbGxpYW0gWmhhbmcgPHdp
bGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IENoYW5nZXMgaW4g
djM6IE5vbmUKPiA+ID4gPiAtLS0KPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+IC0gQWRk
ZWQgdG8gcGF0Y2ggc2VyaWVzCj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxNCArKysrKysrKysrLS0tLQo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gPiA+IGluZGV4
IGE0ZTMxMWI2Nzk4Yy4uNDI1MjZmMzI1MGM5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiA+ID4gQEAgLTI3MjcsOSArMjcyNywx
MSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAq
aG9zdCkKPiA+ID4gPiAgICAgICBjZmctPmJsa19hZHJfYnl0ZXMgPSBnZXRfYmxrX2Fkcl9ieXRl
cyhtdGQtPnNpemUsIG10ZC0+d3JpdGVzaXplKTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgIGlmIChj
aGlwLT5lY2MuZW5naW5lX3R5cGUgIT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVCkgewo+
ID4gPiA+IC0gICAgICAgICAgICAgZGV2X2VycihjdHJsLT5kZXYsICJvbmx5IEhXIEVDQyBzdXBw
b3J0ZWQ7IHNlbGVjdGVkOiAlZFxuIiwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgY2hp
cC0+ZWNjLmVuZ2luZV90eXBlKTsKPiA+ID4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKGNoaXAtPmVjYy5zdHJlbmd0aCkgewo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGN0cmwtPmRldiwgIkVSUk9SISEhIEhXIEVD
QyBtdXN0IGJlIHNldCB0byB6ZXJvIGZvciBub24taGFyZHdhcmUgRUNDOyBzZWxlY3RlZDogJWRc
biIsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpcC0+ZWNjLnN0cmVu
Z3RoKTsKPiA+ID4KPiA+ID4gQ2FuIHlvdSB1c2UgYSBtb3JlIGZvcm1hbCBzdHJpbmc/IEFsc28g
Y2xhcmlmeSBpdCBiZWNhdXNlIEkgZG9uJ3QKPiA+ID4gcmVhbGx5IHVuZGVyc3RhbmQgd2hhdCBp
dCBsZWFkcyB0by4KPiA+Cj4gPiBIb3cgYWJvdXQ6Cj4gPgo+ID4gZGV2X2VycihjdHJsLT5kZXYs
ICJIVyBFQ0Mgc2V0IHRvICVkLCBtdXN0IGJlIHplcm8gZm9yIG9uLWRpZSBFQ0NcbiIsCj4KPiBB
Y3R1YWxseSBJIGFtIHdvbmRlcmluZyBob3cgbGVnaXRpbWF0ZSB0aGlzIGlzLiBKdXN0IGRvbid0
IGVuYWJsZSB0aGUKPiBvbiBob3N0IEVDQyBlbmdpbmUgaWYgaXQncyBub3QgaW4gdXNlLiBObyBu
ZWVkIHRvIGNoZWNrIHRoZSBjb3JlJ3MKPiBjaG9pY2UuCgpPdXIgY2hpcCBFQ0MgZW5naW5lIHdp
bGwgZWl0aGVyIGJlIG9uIGlmIGl0J3MgbmVlZGVkIG9yIG9mZiBpZiBpdCdzIG5vdC4KRWl0aGVy
IEkgY2FuIGRvIHRoYXQgaW4gb25lIHBsYWNlIG9yIHB1dCBjaGVja3MgaW4gYmVmb3JlIGVhY2gK
cmVhZC93cml0ZSB0byB0dXJuIG9uL29mZiB0aGUgRUNDIGVuZ2luZSwgd2hpY2ggc2VlbXMgYSBs
b3QgbW9yZQp3b3JrIGFuZCBjaGFuZ2VzIGFuZCBwb3NzaWJsZSBpc3N1ZXMvcHJvYmxlbXMuClR1
cm5pbmcgaXQgb24vb2ZmIGFzIG5lZWRlZCBoYXMgbm90IGJlZW4gZXhwbGljaXRseSB0ZXN0ZWQg
YW5kCmNvdWxkIGNhdXNlIHVuZm9yZXNlZW4gY29uc2VxdWVuY2VzLiBUaGlzCmlzIGEgbWluaW1h
bCBjaGFuZ2Ugd2hpY2ggc2hvdWxkIGhhdmUgbWluaW1hbCBpbXBhY3QuCgo+Cj4gPgo+ID4gPgo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArICAg
ICAgICAgICAgIH0KPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4KPiA+ID4gPiAgICAgICBpZiAoY2hp
cC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxHT19VTktOT1dOKSB7Cj4gPiA+ID4gQEAgLTI3OTcs
NyArMjc5OSwxMSBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5h
bmRfaG9zdCAqaG9zdCkKPiA+ID4gPiAgICAgICBpZiAocmV0KQo+ID4gPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiA+ID4gPgo+ID4gPiA+IC0gICAgIGJyY21uYW5kX3NldF9lY2NfZW5h
YmxlZChob3N0LCAxKTsKPiA+ID4gPiArICAgICBpZiAoY2hpcC0+ZWNjLmVuZ2luZV90eXBlID09
IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0RJRSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgZGV2
X2RiZyhjdHJsLT5kZXYsICJEaXNhYmxlIEhXIEVDQyBmb3Igb24tZGllIEVDQ1xuIik7Cj4gPiA+
Cj4gPiA+IE5vdCBuZWVkZWQuCj4gPgo+ID4gV2lsbCByZW1vdmUuCj4gPgo+ID4gPgo+ID4gPiA+
ICsgICAgICAgICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwo+ID4gPiA+
ICsgICAgIH0gZWxzZQo+ID4gPiA+ICsgICAgICAgICAgICAgYnJjbW5hbmRfc2V0X2VjY19lbmFi
bGVkKGhvc3QsIDEpOwo+ID4gPgo+ID4gPiBTdHlsZSBpcyB3cm9uZywgYnV0IG90aGVyd2lzZSBJ
IHRoaW5rIEVDQyBzaG91bGQgYmUga2VwdCBkaXNhYmxlZCB3aGlsZQo+ID4gPiBub3QgaW4gYWN0
aXZlIHVzZSwgc28gSSBhbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhpcyBsaW5lLgo+ID4KPiA+IFRo
aXMgaXMgYSBkb3VibGUgY2hlY2sgdG8gdHVybiBvbi9vZmYgb3VyIGhhcmR3YXJlIEVDQy4KPgo+
IEkgZXhwZWN0IHRoZSBlbmdpbmUgdG8gYmUgYWx3YXlzIGRpc2FibGVkLiBFbmFibGUgaXQgb25s
eSB3aGVuIHlvdQo+IG5lZWQgKG1heSByZXF1aXJlIGFuIGFkZGl0aW9uYWwgcGF0Y2ggYmVmb3Jl
IHRoaXMgb25lKS4KCldlIGFyZSBhbHJlYWR5IHR1cm5pbmcgb24gdGhlIEVDQyBlbmFibGUgYXQg
dGhpcyBwb2ludCwKdGhpcyBpcyBqdXN0IGFkZGluZyB0aGUgb3B0aW9uIHRvIHR1cm4gaXQgb2Zm
IGlmIHRoZSBOQU5EIGNoaXAKaXRzZWxmIHdpbGwgYmUgZG9pbmcgdGhlIEVDQyBpbnN0ZWFkIG9m
IG91ciBjb250cm9sbGVyLgoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MhCgotRGF2ZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
