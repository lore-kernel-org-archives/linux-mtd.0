Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E3C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f2JNwPOYlaL8cJU2KCmlAUZDSGqdy7iSkdeRhwNFjk=; b=DvRRsgC7cT+Ed3
	roSv6/9Z9t7FssS23j9s6eGTU7PjNrGHw5WN8PvEu8X1/1oJ93272P1yPJy6JUVR5a3O8uZAjS8U9
	S4D7IRgaI7osPSGUgaPsKzirBJyflQTJcI3O8VVuHLajOz6zfwQ42oMBLC8qRM7yfd+iXSeGqptxO
	Lgfmv+E2OLeOXX3tUfJ7LI52k7u/gdumeQGJYUdGyd+BgUNdglReXCDJWFGP+CQdHCaSqNNZu69XA
	A6FT3o4uSXYduNX88loAuzpN1De54XafCYkM4VmU/3OLJFRTUXEiNjbTMYpPeb+j8d4h7k91Nm3J+
	g4R/KY1W2lJjfnvvxiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5qW-003W9C-Je; Mon, 23 May 2022 11:03:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4ne-0031ec-Jt
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 09:56:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id q4so12616351plr.11
 for <linux-mtd@lists.infradead.org>; Mon, 23 May 2022 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ukCOGWOq22orVSouEnaYsTCshRF3SqJKUuWQj0ZAGUk=;
 b=Og/Mbu+P79Ub5uOlogA55iJw2jXnBeHwqzX+kI39pRocEUVeL44HxhLqPaH29F22wF
 UAUZa94DaASfXggmUxSgj9b0ahqX1u28UjTDtJYGWlOjjn8z9rMrx77s4WvAA4g1F9R6
 GxSqZnNmymQ8IoODdfZC1kE9FoihhLwE6ezGJ81ROnpxC2Y/y5VSw7EWYP9BceiBuFFd
 +nP15omAorg7dT2LjFflJVSY2aSyA7d11AqclnuXuG5JGKe+lqkRBOWMjsDjKpgYztu3
 JNUlgOmcyFJxQQS/b1SmtShIvzBeEM727DdmrmIcZBi2kwbQrP8pEOGu8LAFFYNTaiBa
 KDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ukCOGWOq22orVSouEnaYsTCshRF3SqJKUuWQj0ZAGUk=;
 b=uUmnW+IZjxIk9w6o1M1Oquhn8r5kYf/dBFwx1Dev0C9xKsHLTuTxJRxipLK7ROr5h0
 GnEIFvvaCKY/iiTC4BOJEwOtK+ddD2D9pjs1/73bWryGgTCDox79Ybzm0hdpbOguvbVm
 UaJMuNBYCDDmas3i54K6OYZhiOCVca46wKpyaQ6ASWzi3AaE1lZEFKHo56RWhTLWQt+a
 iELjcbWTxQI93GZvQGzffINgsvjpyXHyjnRurxWkJqDQ0Ubw34AmgKCXmpYmgcBMar+Q
 NJ8cjVHCRAFcyEvYD5WfO4rMUvzw0cd7mEfU2LmasEvN7qLbB6GH0pHrwYARATnHL4dS
 eaOA==
X-Gm-Message-State: AOAM531iOE5fSZPLwJn26Yt2YNsMfNXHd9Hm5vccLi+5fHVlJ/YPDDhs
 0iAd7MF++fi2u5HDLRzjRE4=
X-Google-Smtp-Source: ABdhPJywYyGC5VH48L4LLrA8lGsIdJi65sC4evUKX0kbf/X1Vj87fqcn/vcN55MknUMs522Y3vvmrQ==
X-Received: by 2002:a17:903:404d:b0:161:558a:4375 with SMTP id
 n13-20020a170903404d00b00161558a4375mr22744516pla.86.1653299788152; 
 Mon, 23 May 2022 02:56:28 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 p9-20020aa78609000000b0051878e8cc13sm5211205pfn.116.2022.05.23.02.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 02:56:27 -0700 (PDT)
Message-ID: <b4870634-5b7f-de86-c1df-eaaafb05c7d7@gmail.com>
Date: Mon, 23 May 2022 18:56:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_025630_744178_EC7A9F68 
X-CRM114-Status: GOOD (  33.97  )
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

CgpPbiA1LzIzLzIwMjIgNDo0OSBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIyLTA1
LTE0IDA1OjUxLCBzY2hyaWViIFRha2FoaXJvIEt1d2FubzoKPj4gT24gNS8xMy8yMDIyIDY6NDAg
UE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBbYnR3IHRoZSBzdWJqZWN0IHN0aWxsIGhhcyB0
aGUgb2xkIG5hbWUgb2YgdGhlIGFkZHJfd2lkdGhdCj4+Pgo+PiBZZXMsIGl0IG11c3QgYmUgZml4
ZWQgaW4gbmV4dCByZXYuCj4+Cj4+PiBBbSAyMDIyLTA1LTEzIDAzOjI2LCBzY2hyaWViIFRha2Fo
aXJvIEt1d2FubzoKPj4+PiBPbiA1LzEzLzIwMjIgNzoxNCBBTSwgTWljaGFlbCBXYWxsZSB3cm90
ZToKPj4+Pj4gQW0gMjAyMi0wNS0xMCAwMDoxMCwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNv
bToKPj4+Pj4+IEZyb206IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9u
LmNvbT4KPj4+Pj4+Cj4+Pj4+PiBJbiA0QkFJVCBwYXJzZSwga2VlcCBub3ItPnBhcmFtcy0+YWRk
cl93aWR0aCBiZWNhdXNlIGl0IG1heSBiZSB1c2VkIGFzCj4+Pj4+PiBjdXJyZW50IGFkZHJlc3Mg
bW9kZSBpbiBTTVBUIHBhcnNlIGxhdGVyIG9uLgo+Pj4+Pgo+Pj4+PiBNaCBJJ20gbm90IHN1cmUg
dGhpcyBpcyBuZWVkZWQgYXQgYWxsLgo+Pj4+Pgo+Pj4+PiBTRkRQIHNwZWMgc2F5cwo+Pj4+PiDC
oCBWYXJpYWJsZSBhZGRyZXNzIGxlbmd0aCAodGhlIGN1cnJlbnQgc2V0dGluZyBvZiB0aGUgYWRk
cmVzcwo+Pj4+PiDCoCBsZW5ndGggbW9kZSBkZWZpbmVzIHRoZSBhZGRyZXNzIGxlbmd0aCkKPj4+
Pj4KPj4+Pj4gYW5kCj4+Pj4+IMKgIFdoZW4gdGhlIGxlbmd0aCBpcyBkZWZpbmVkIGFzIHZhcmlh
YmxlLCB0aGUgc29mdHdhcmUgb3IgaGFyZHdhcmUKPj4+Pj4gwqAgY29udHJvbGxpbmcgdGhlIG1l
bW9yeSBpcyBhd2FyZSBvZiB0aGUgYWRkcmVzcyBsZW5ndGggbW9kZSBsYXN0Cj4+Pj4+IMKgIHNl
dCBpbiB0aGUgbWVtb3J5IGRldmljZSBhbmQgdGhpcyBzYW1lIGxlbmd0aCBvZiBhZGRyZXNzLgo+
Pj4+Pgo+Pj4+PiBXZSBkb24ndCBzZXQgYW55IGFkZHJlc3MgbW9kZSB1bnRpbCBhbGwgdGhlIFNG
RFAgcGFyc2luZyBpcwo+Pj4+PiBvdmVyLiBUaGVyZWZvcmUgd2Ugc2hvdWxkIGFsd2F5cyBiZSBp
biAzIGJ5dGUgbW9kZSwgbm8/Cj4+Pj4+Cj4+Pj4gQWN0dWFsbHkgdGhlcmUgYXJlIHNvbWUgZGV2
aWNlcyB0aGF0IGhhdmUgdmFyaWFibGUgYWRkcmVzcyBsZW5ndGggYnV0Cj4+Pj4gNCBieXRlIG1v
ZGUgYnkgZGVmYXVsdCAoSSB3aWxsIHdvcmsgb24gdGhvc2UgZGV2aWNlcyBhZnRlciB0aGlzIHNl
cmllcwo+Pj4+IGlzIHNldHRsZWQpLiBUbyBzdXBwb3J0IHN1Y2ggY2FzZSwgSSBwcmVmZXIgdG8g
dXNlIHBhcmFtcy0+YWRkcl9uYnl0ZXMKPj4+PiBhcyBjdXJyZW50IGFkZHJlc3MgbW9kZSBzbyB0
aGF0IEkgY2FuIGZpeCBpdCBpbiBwb3N0X2JmcHRfZml4dXAoKSBob29rLgo+Pj4KPj4+IEFyZSB0
aGVyZSBwdWJsaWMgZGF0YXNoZWV0cyBhdmFpbGFibGU/IFNvIHRoZXNlIGRldmljZXMgaGF2ZSBh
IDMgYnl0ZQo+PiBJIHdpbGwgc2VuZCBkYXRhc2hlZXRzIHRvIHlvdSBpbiBhbm90aGVyIGVtYWls
LiBBdCB0aGlzIHBvaW50LCBvbmx5Cj4+IHN1bW1hcnkgZGF0YXNoZWV0IGlzIGF2YWlsYWJsZSBp
biB3ZWJzaXRlLgo+Pgo+Pj4gYW5kIGEgNCBieXRlIG1vZGUsIGJ1dCBhZnRlciByZXNldCwgdGhl
eSBhcmUgaW4gdGhlIDQgYnl0ZSBtb2RlPyBMb29rcwo+PiBZZXMuCj4+Cj4+PiBsaWtlIGl0IHNo
b3VsZCBiZSBmaXhlZCBpbiBhIGRpZmZlcmVudCB3YXkuIEknbSBub3Qgc3VyZSB0aGUgImN1cnJl
bnQKPj4+IG1vZGUiIGhhbmRsaW5nIGlzIGNvcnJlY3QuCj4+Pgo+PiBZZXMsIHdlIG1heSB3YW50
IHRvIGludHJvZHVjZSBhIG5ldyBmbGFnIGxpa2UgU1BJX05PUl80QkFNX0RFRkFVTFQgYW5kIGNo
ZWNrCj4+IHRoZSBmbGFnIGluIEJGUFQgcGFyc2UuIE9uY2UgSSBzZW5kIGFub3RoZXIgc2VyaWVz
LCBwbGVhc2UgcmV2aWV3Lgo+Pgo+Pj4gV2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4g
dGhlIG1vZGUgdGhlIGZsYXNoIGN1cnJlbnRseSBpcyB1c2luZwo+Pj4gKG5vci0+YWRkcl9uYnl0
ZXMpIGFuZCB0aGUgbW9kZSBwYXJzZWQgYnkgU0ZEUCAocGFyYW1zLT5hZGRyX25ieXRlcykuCj4+
Pgo+PiBUaGUgZmxhc2gncyBhZGRyZXNzIG1vZGUgYWZmZWN0cyB0aGUgYWRkcmVzcyBsZW5ndGgg
b2YgTm9uLTRCIG9wY29kZXMsCj4+IGluY2x1ZGluZyByZWFkL3dyaXRlIGFueSByZWdpc3RlciBv
cHMgdXNlZCBpbiBTTVBUIHBhcnNlIGFuZCBJbmZpbmVvbgo+PiAoc3BhbnNpb24pIHNwZWNpZmlj
IGhvb2tzLgo+Pgo+PiBUaGUgNEIgb3Bjb2RlcyBhbHdheXMgdGFrZSBhZGRyZXNzIGxlbmd0aCBv
ZiA0IHJlZ2FyZGxlc3Mgb2YgZmxhc2gncwo+PiBhZGRyZXNzIG1vZGUuIEluIHRoZXNlIEluZmlu
ZW9uIGNoaXBzLCA0QiBvcGNvZGVzIGZvciByZWFkL3Byb2dyYW0vCj4+IGVyYXNlIGFyZSBhdmFp
bGFibGUgYW5kIDRCQUlUIGFkdmVydGlzZXMgdGhlbS4gV2UgZG9uJ3QgaGF2ZSB0byBlbnRlcgo+
PiA0IGJ5dGUgYWRkcmVzcyBtb2RlIGZvciByZWFkL3Byb2dyYW0vZXJhc2UuCj4gCj4gYnR3LiB0
aGlzIGlzIGEgcGl0eS4geW91IGFyZSB1c2luZyB0aGUgc3RhdGVsZXNzIDRiIG9wY29kZXMgYnV0
Cj4gdGhlbiB5b3UgZG9uJ3QgcHJvdmlkZSBzdGF0ZWxlc3Mgb3Bjb2RlcyBmb3IgdGhlIHJlYWQg
YW55IHJlZ2lzdGVyCj4gb3AgOi8KPiAKPj4gU28sIEkgdGhpbmsgd2UgbmVlZCB0byBkaWZmZXJl
bnRpYXRlIGJldHdlZW4gYWRkcmVzcyBsZW5ndGggZm9yCj4+IHJlYWQvcHJvZ3JhbS9lcmFzZSBh
bmQgZmxhc2gncyBkZWZhdWx0IGFkZHJlc3MgbW9kZS4KPiAKPiBPciB3ZSBrZWVwIHRoZW0gaW4g
c3luYy4gRS5nLiBzd2l0Y2ggdG8gNGJ5dGVzIG1vZGUgaWYgd2UgYXJlCj4gdXNpbmcgdGhlIDQg
Ynl0ZS4gR3JhbnRlZCwgdGhhdCBzb3VuZHMgbGlrZSBhIGhhY2sgOikKPiAKWWVzLCB0aGUgZWFy
bGllciByZXZpc2lvbiBvZiB0aGUgc2VyaWVzIHN3aXRjaGVkIHRvIDRieXRlIG1vZGUgaW4gZml4
dXAKaG9vaywgYnV0IHdlIGRvbid0IHdhbnQgdG8gY2hhbmdlIGRldmljZSBzZXR0aW5ncyBkdXJp
bmcgU0ZEUCBwYXJzZS4KCj4+IE9idmlvdXNseSB3ZSBhcmUgdXNpbmcgbm9yLT5hZGRyX25ieXRl
cyBhcyBhZGRyZXNzIGxlbmd0aCBmb3IgcmVhZC8KPj4gcHJvZ3JhbS9lcmFzZSBhbmQgc2hvdWxk
IGtlZXAgdGhpcyB1c2FnZS4KPiAKPiBZZXMsIEkgd2Fzbid0IGF3YXJlIHRoYXQgd2UgYWN0dWFs
bHkgdHdvIGRpZmZlcmVudCBydW50aW1lCj4gcGFyYW1ldGVyczoKPiDCoC0gdGhlIHJlYWQvcHJv
Z3JhbS9lcmFzZSBhZGRyZXNzIHdpZHRoLCBhbHNvIHVzZWQgd2l0aCB0aGUKPiDCoMKgIDRiIG9w
Y29kZXMKPiDCoC0gaW50ZXJuYWwgbW9kZSAzYi80Yi4gVXAgdW50aWwgbm93LCB0aGlzIHdhc24n
dCBhbiBpc3N1ZQo+IMKgwqAgYmVjYXVzZSBlaXRoZXIgdGhlIG1vZGUgd2FzIHN3aXRjaGVkIG9y
IHRoZSA0YiBvcGNvZGVzCj4gwqDCoCB3ZXJlIHVzZWQuIFNvIHRoaXMgd2FzIG11dHVhbGx5IGV4
Y2x1c2l2ZS4gTm93IHdlIGhhdmUKPiDCoMKgIGZsYXNoZXMgd2hpY2ggdXNlcyA0YiBvcGNvZGVz
IF9hbmRfIHdlIG5lZWQgdGhlIHN0YXRlCj4gwqDCoCBvZiB0aGUgaW50ZXJuYWwgbW9kZS4KPiAK
PiBJIGNhbid0IHRoaW5rIG9mIGEgZ29vZCBzb2x1dGlvbiBmb3Igbm93LiBOZWVkIHRvIHRoaW5r
Cj4gbW9yZSBhYm91dCB0aGlzLCBidXQgSSdtIHByZXR0eSBidXN5IGF0IHRoZSBtb21lbnQuCj4g
V2hhdCBJIHRoaW5rIGlzIGNsZWFyIGlzIHRoYXQgd2UgbmVlZCB0d28gZGlmZmVyZW50IG1vZGVz
Cj4gaGVyZSBpbiB0aGUgc3BpX25vciBzdHJ1Y3QuIG5vci0+YWRkcl9uYnl0ZXMgZm9yIHRoZQo+
IHJlYWQvcHJvZ3JhbS9lcmFzZSBvcGNvZGVzIGFuZCBub3ItPmFkZHJlc3NfbW9kZSBvciBzaW1p
bGFyCj4gd2hpY2ggdHJhY2tzIHRoZSBTUEkgZmxhc2gncyBpbnRlcm5hbCBhZGRyZXNzIG1vZGUu
Cj4gClNvLCB1bnRpbCB3ZSBjb21lIHVwIHdpdGggYSBnb29kIHNvbHV0aW9uLCBjYW4gd2UgZGly
ZWN0bHkgdXNlIHRoZSBhZGRyZXNzCmxlbmd0aCBvZiAzIGluIFNNUFQgcGFyc2UgYW5kIHZlbmRv
ciBzcGVjaWZpYyBob29rcz8gQnkgZG9pbmcgdGhhdCwgd2UgY2FuCnJlbW92ZSB0aGlzICg2Lzgp
IGFuZCBwcmV2aW91cyAoNS84KSBwYXRjaGVzIChtaW5pbXVtIGNoYW5nZSB3b3VsZCBiZQpiZXR0
ZXIgYXMgYSB0ZW1wb3Jhcnkgc29sdXRpb24pLgoKPj4gRm9yIGZsYXNoJ3MgZGVmYXVsdCBhZGRy
ZXNzIG1vZGUsIG15IHByZWZlcmVuY2UgaXMgdG8gdXNlCj4+IHBhcmFtcy0+YWRkcl9uYnl0ZXMs
IGJ1dCBJIHNob3VsZCByZW5hbWUgaXQgdG8gc29tZXRoaW5nIGxpa2UKPj4gcGFyYW1zLT5kZWZf
YWRkcl9uYnl0ZXMgYW5kIHJld29yayBzcGlfbm9yX3NldF9hZGRyX25ieXRlcygpLgo+IAo+IElN
SE8gcGFyYW1zIHNob3VsZCBvbmx5IGJlIHVzZWQgdG8gc3RvcmUgdGhlIHBhcnNlZCAob3IKPiBo
YXJkY29kZWQpIHBhcmFtZXRlcnMuCj4gCk9LLCB1bmRlcnN0b29kLgoKVGhhbmtzLApUYWthaGly
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
