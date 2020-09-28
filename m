Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2677CC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 08:56:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F8520E65
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 08:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oPmPfhHB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McvbbOaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F8520E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dGcWufuxjZbqPh21dHrkgsVqxnClQfLYm2PDnSmTWMI=; b=oPmPfhHBM0P99Ze9WtQFY9cTz
	jkV2DTxXF6N2crERo5ai9hYOlvM/U6f9JuLtqXn0oLsF8A+VG6HlxDJEpEPIRZjXOrUYetPrNgaix
	tCR5IIGGuE+Ue8VJ97kuawiLeEvfVZIqSVeJIw1rHQi7HatUiZaiXdWhoZxVEklPn1g8hGEjCeMhn
	5Jdpwi6+W2fPtVrzT/APzogmM83NAzdplzp4sh+lgK51hw0dTdgsF+8y7yOR8eJUy7No2DPBSZjt8
	Ns43QjPXcAqTm1irax0ShJ8rqqCxlZp2ibRHr4A2vR2kEUZvsXer70VsHa6Y8DHUQYtBJr90i9Cns
	NPP8MJBIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMowv-0001NT-L6; Mon, 28 Sep 2020 08:55:57 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMowt-0001Lt-0j
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 08:55:55 +0000
Received: by mail-vs1-xe43.google.com with SMTP id q13so278379vsj.13
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2020 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rTWSp9HyvQVRNPwh/aNbBA8kIMayTZgK9T1RXmtFu4A=;
 b=McvbbOajz26LKr6lYbDwK4EjPS8igBOQdAX6AXk0KODfTKIfGioPALtQIQNWAyi9pa
 5nWZmink6dL75h9RBIEePo6faKSMLktvdg50aiVYiX+tmK0MKEuvPn+4jQ7VDYTLtJcu
 pjXmDU3FTMtLOxaGoYS9O2xMwA/Bs04XcEyOz0He5EQ3GlmXPO0jU6+t6NMZCCaB2NWB
 G81XuzdsLmReFG5aNz4XJF7vS77p74zCeAwwGRIux7bQWDuDxSZpNqy/renwgv5fbgH6
 ETGLfx8Mvvs+bdkCKgTantDWuhoGMAi74i0F4Wk10mBwOetkrLd4NIjJP0HTI+M6Hqbf
 veFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rTWSp9HyvQVRNPwh/aNbBA8kIMayTZgK9T1RXmtFu4A=;
 b=IMzVoq6wU2v0U0v75ySCFWQw70mbukdzIgTO3buUMTJIJih+2d9L7mlBbZ4/XGoMyr
 sm6SPE9xxBlCHfxGNOXh7uNbNKr03MxUOD9MCn5I3j4nja4wyrRzRh3fR7H2n0XwNS2Y
 EfObCXqN8bNrfZDK96hAIi1kCyOLC1kecqvSLUfAF5DyyQor2wPQJqf2Ha5VfZo+GqTZ
 hAFUh8ndp/xrodLx4LpJL/2vQ/Qbh6QkM3muxEYFxcD8csCQI3FOGoQ986x1Jxhndoim
 vQlvti/99Rzp0rydh2N23fEcCFWXdP34FeDSuaN5Tkl6W3WC4Gm9294c60TJqqFEvMmq
 LU8w==
X-Gm-Message-State: AOAM530hB1Zz3S9VyHxdt27wYfDGH6HVl0tWqPklTiuvBlB1ndA4Dbxp
 KZ3gZViwborjLkSoeIQtmzZGR13Vynan+yppSYw=
X-Google-Smtp-Source: ABdhPJwMDtPZjLKdHsdkRQXI0e2haq01NuYnCfrafU/YOZnze3JvxGTs582yS/Uefl5H9vNFAk5q4zNEv3GuMrE5vsw=
X-Received: by 2002:a67:80d2:: with SMTP id b201mr4876558vsd.12.1601283351850; 
 Mon, 28 Sep 2020 01:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
 <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
 <CAFLxGvyHWFmLTYmyqmJo9Rfm87D_ZafBWyQSMvdYKLFTUM9p+Q@mail.gmail.com>
 <CADBnMvhcowEVqUYwg3vVK-F-=N+mRNQAsaihXuUorW-iWnWcxg@mail.gmail.com>
 <1929983185.113286.1600681896280.JavaMail.zimbra@nod.at>
 <CADBnMvhKxZSjyzhYxu3FUjZ0KtSDUdfiyEWBnNYP8ireCpkX8Q@mail.gmail.com>
 <CAFLxGvwSUx_JBbvbJjoeyVaH31mMoyTLGm8oGRi75agG0sG30Q@mail.gmail.com>
In-Reply-To: <CAFLxGvwSUx_JBbvbJjoeyVaH31mMoyTLGm8oGRi75agG0sG30Q@mail.gmail.com>
From: Kristof Havasi <havasiefr@gmail.com>
Date: Mon, 28 Sep 2020 10:56:21 +0200
Message-ID: <CADBnMvgH_coPG6pE-b9rn_XTVxLNFc5q_FAvEx_2kxmJ-PJAMg@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_045555_071063_D6AEAAC6 
X-CRM114-Status: GOOD (  30.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBJIHRoaW5rIEkndmUgZm91bmQgdGhlIHByb2JsZW0uIENhbiB5b3UgcGxlYXNlIHRlc3QgdGhl
IGZvbGxvd2luZyBjaGFuZ2U/CgpJIHRlc3RlZCBxdWlja2x5IHdpdGggYSBzdWJzZXQgb2YgdGhl
IHByZXZpb3VzIHRlc3RzLCBhbmQgdW50aWwgbm93IEkKaGF2ZSBub3Qgc2VlbiBhbnkgcGFuaWNz
IQpJIHdpbGwga2VlcCBvbiBydW5uaW5nIHNvbWUgb3RoZXIgdGVzdHMsIGluY2x1ZGluZyBvdXIg
YnVzaW5lc3MgbG9naWMsCmFuZCB3aWxsIHJlcG9ydCBiYWNrIHRvCnlvdSB3aGV0aGVyIHdlIHNl
ZSBhbnkgdW5leHBlY3RlZCBoaWMtdXBzLgoKVGhhbmsgeW91IGEgbG90IGFuZCBiZXN0IHJlZ2Fy
ZHMsCktyaXN0b2YKCk9uIFN1biwgMjcgU2VwIDIwMjAgYXQgMjE6MjcsIFJpY2hhcmQgV2VpbmJl
cmdlcgo8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNl
cCAyMSwgMjAyMCBhdCAxMjo0NiBQTSBLcmlzdG9mIEhhdmFzaSA8aGF2YXNpZWZyQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAyMSBTZXAgMjAyMCBhdCAxMTo1MSwgUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IC0tLS0tIFVyc3By
w7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+ID4gPj4gPiBEb2VzIHRoZSBwcm9ibGVtIGFsc28gdHJp
Z2dlciB3aXRoIGVuY3J5cHRpb24gZGlzYWJsZWQ/IFNvIGp1c3Qgd2l0aAo+ID4gPiA+PiA+IGF1
dGhlbnRpY2F0aW9uPwo+ID4gPiA+IEkgY291bGRuJ3QgdHJpZ2dlciB0aGUgc2FtZSBlcnJvciB3
aXRoIGVuY3J5cHRpb24gZGlzYWJsZWQgYW5kIGF1dGhlbnRpY2F0aW9uCj4gPiA+ID4gZW5hYmxl
ZC4gRXZlbiBpZiBJIGVuYWJsZWQgYWxsIHRoZSBjaGtfKiBrbm9icyB1bmRlciBrZXJuZWwvZGVi
dWcvdWJpZnMvLCBubwo+ID4gPiA+IGZhaWxlZCBhc3NlcnRpb24gb3IgZXJyb3Ivd2FybmluZyBs
b2cgY291bGQgYmUgb2JzZXJ2ZWQuCj4gPiA+Cj4gPiA+IFNvLCB3aXRoIGVpdGhlciBlbmNyeXB0
aW9uIG9yIGF1dGhlbnRpY2F0aW9uIGVuYWJsZWQgZXZlcnl0aGluZyBpcyBmaW5lCj4gPiA+IGJ1
dCB3aGVuIGJvdGggYXJlIGVuYWJsZWQgeW91IGhpdCB0aGUgcHJvYmxlbT8KPiA+ID4gSW50ZXJl
c3RpbmcuCj4gPgo+ID4gVGhhdCBpcyBleGFjdGx5IHdoYXQgSSBjYW4gb2JzZXJ2ZS4KPiA+Cj4g
PiA+Cj4gPiA+ID4+IERvZXMgaXQgcHJpbnQgYmlnIExQVCBvciBzbWFsbCBMUFQgbW9kZWw/Cj4g
PiA+ID4KPiA+ID4gPiBzbWFsbCBMUFQgbW9kZWwuCj4gPiA+Cj4gPiA+IEknbGwgdHJ5IHRvIHJl
cHJvZHVjZSBub3cgb24gYSBzaW1pbGFyIHNpemVkIE5BTkQuIDotKQo+ID4KPiA+IEkgbWVudGlv
bmVkIHRoYXQgSSB1c2UgdGhlIGJ1aWxkcm9vdCdzIG1rZnMudWJpZnMgd2l0aCBjdXN0b21pemF0
aW9uLAo+ID4gYnV0IGhlcmUgYXJlIHRoZSBwYXJhbWV0ZXJzOgo+ID4gKENvbmZpZ3VyZWQgdmlh
IEtjb25maWcpCj4gPgo+ID4gLS1tYXgtbGViLWNudD0zOTY4Cj4gPiAtLW1pbi1pby1zaXplPTB4
MTAwMAo+ID4gLS1sZWItc2l6ZT0weDNFMDAwCj4gPiAtLWtleSAvcGF0aC90by9rZXkKPiA+IC0t
a2V5LWRlc2NyaXB0b3IgZGVhZDEyMzQ1Njc4YmVlZgo+ID4gLS1jaXBoZXIgQUVTLTI1Ni1YVFMK
PiA+IC0taGFzaC1hbGdvIHNoYTI1Ngo+ID4gLS1hdXRoLWtleT0icGtjczExOnRva2VuPS4uLiIK
PiA+Cj4gPiBUaGUgZmxhc2ggaXMgYSBNaWNyb24gTVQyOUY4RzA4QUJBQ0FXUC1JVDpDIHdoaWNo
IGhhcyAyMjQgYnl0ZXMgT09CLAo+ID4gd2hpY2ggaXMgbm90Cj4gPiBpbmNsdWRlZCBpbiB0aGUg
LS1taW4taW8tc2l6ZS4gVGhhdCBpcyBvaywgaXNuJ3Q/Cj4KPiBZZXMuIEJvdGggVUJJIGFuZCBV
QklGUyBkb24ndCB1c2UgT09CLgo+Cj4gSSB0aGluayBJJ3ZlIGZvdW5kIHRoZSBwcm9ibGVtLiBD
YW4geW91IHBsZWFzZSB0ZXN0IHRoZSBmb2xsb3dpbmcgY2hhbmdlPwo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2pvdXJuYWwuYyBiL2ZzL3ViaWZzL2pvdXJuYWwuYwo+IGluZGV4IDRhNWIwNmY4
ZDgxMi4uODY5ZWY2ZWZhNDhmIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2pvdXJuYWwuYwo+ICsr
KyBiL2ZzL3ViaWZzL2pvdXJuYWwuYwo+IEBAIC05MzYsOCArOTM2LDYgQEAgaW50IHViaWZzX2pu
bF93cml0ZV9pbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiBjb25zdCBzdHJ1Y3QgaW5vZGUg
Kmlub2RlKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlub2Rl
LT5pX2lubyk7Cj4gICAgICAgICByZWxlYXNlX2hlYWQoYywgQkFTRUhEKTsKPgo+IC0gICAgICAg
dWJpZnNfYWRkX2F1dGhfZGlydChjLCBsbnVtKTsKPiAtCj4gICAgICAgICBpZiAobGFzdF9yZWZl
cmVuY2UpIHsKPiAgICAgICAgICAgICAgICAgZXJyID0gdWJpZnNfdG5jX3JlbW92ZV9pbm8oYywg
aW5vZGUtPmlfaW5vKTsKPiAgICAgICAgICAgICAgICAgaWYgKGVycikKPiBAQCAtOTQ3LDYgKzk0
NSw4IEBAIGludCB1Ymlmc19qbmxfd3JpdGVfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsCj4g
Y29uc3Qgc3RydWN0IGlub2RlICppbm9kZSkKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgIHVuaW9uIHViaWZzX2tleSBrZXk7Cj4KPiArICAgICAgICAgICAgICAgdWJpZnNfYWRk
X2F1dGhfZGlydChjLCBsbnVtKTsKPiArCj4gICAgICAgICAgICAgICAgIGlub19rZXlfaW5pdChj
LCAma2V5LCBpbm9kZS0+aV9pbm8pOwo+ICAgICAgICAgICAgICAgICBlcnIgPSB1Ymlmc190bmNf
YWRkKGMsICZrZXksIGxudW0sIG9mZnMsIGlsZW4sIGhhc2gpOwo+ICAgICAgICAgfQo+Cj4gQSBm
ZXcgbGluZXMgYmVmb3JlIGluIHRoZSB3ZSBsYXN0X3JlZmVyZW5jZSBjYWxsIHViaWZzX2FkZF9k
aXJ0KGMsCj4gbG51bSwgd3JpdGVfbGVuKSBhbmQgd3JpdGVfbGVuIGNvbnRhaW5zCj4gYWxyZWFk
eSB0aGUgYXV0aCBub2RlIHNpemUuIFNvIHRoZSBhdXRoIG5vZGUgc2l6ZSBpcyBhY2NvdW50ZWQg
dHdpY2UuCj4gUGxlYXNlIGxldCBtZSBrbm93IHdoZXRoZXIgaXQgaGVscHMsIEkgdGhpbmsgdWJp
ZnNfam5sX3dyaXRlX2lub2RlKCkKPiBuZWVkcyBtb3JlIGNsZWFudXAuCj4KPiAtLQo+IFRoYW5r
cywKPiAvL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
