Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9947AD41C27
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pt1OkhSK0sQ9o150fal1JwbyelCu6jjLIaHKEMDh3s=; b=OA1VOvP9gbj6bP
	GcKm3W52moCr5MoInoaMVxfEr5agefAKt+bhuLbzbL66w90Tt7KJ07U8697rXO9o/+DlOd87jVFgu
	8w2MCZIdJGf95xpT7ptld3shOnykaSFo/6VBHOjhsQiAYc3j4+FlwUPzIGgZpr6mcFfR6bY+t3JYI
	dI0OuMncPe/PrUexotxdyL4PEmt5jkVIc0TsMPT4pi6POpeIb5Z0eYA9FJnopnR3WDsSLPOhIg+BR
	L3muTuEGoZZW/XR2UnMVugpVYqVdRPlI+bb0ZhXWzkT4hh07q2kxj6+JHQXysjLdy+F2m0nPos45h
	6WF24LPxP4zbpw+Az2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAL0-00000006OD7-0O8h;
	Wed, 13 Nov 2024 10:11:02 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAKw-00000006OC9-3tom
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 10:11:00 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e30eca40dedso6559194276.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2024 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731492657; x=1732097457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svp+5bW/5855obVVtWRajkCPG6F79wYW9r9nPNbVKBE=;
        b=JocDT5n76uB5Mmnt7FjMHp9wbRMg00+IEtmo4sFtwzegpUJE6RUBN7O1OFBKHXvjk9
         ff3WPoDrZpSLIGjHql6ZQmbhOo7a4Pnq52++K+qDZFLEFSiU0/a1IqwXU9ck11wcOCHV
         +6phzsK0VdxhfZhonFPL0QYPcTfCnCGf6BZNuzD5bWBqhw/iPLpR0dze14ezGRbuUXAr
         wDVLdXUel/CeKlyt2dzXO1RteKnGLkReGfD4Fr50d5RXLOTzXNMe/9/Wep+UNhjGd/A7
         yTbeZ3p5qJ2lX51x6j0ahaUR75whOwHGbXZSFTPcFlZFUrS9AHjEhIT9rtsoSHhbZVPN
         zVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492657; x=1732097457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svp+5bW/5855obVVtWRajkCPG6F79wYW9r9nPNbVKBE=;
        b=Ef3pOWDLfebkl8Sh0BjmNlHoma8Ek4146z8LByy2k/8YR7C7uNBC/khjrU2/sh/sAx
         EKN2qMdGF3+bdclblZ9hG0owOqnJC513IDsq/033ODa/8NqTp5ChZ6cMmLF6yP5RFlQf
         g9IUIZcK3r3u1V55MHsNyBiAIl89PT2Bodh11udMGVpOEhYXOMsfdS0kG6AJnazfMWL0
         egHASZ+DofsQPxj8EmUlx+tMDv8j2LBYiHcyUNGHvYIUHHVv41GA8ErUiBV+evVbentt
         LzyF5iCcmNrH3bE4wlP4OXd1+Ic+XtxfP+i8KNin6bGNY58/ka8o7nKdgCgV1k8+YAQF
         qp5A==
X-Forwarded-Encrypted: i=1; AJvYcCWtkEOcWUglsxbglMxXsSI1MpmgmFsVgn+CaBF04bnb4hCcw27uRBgVIecFT1gSFSD6RleEzsF7bG0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0XE1UuEqlqYyYXZuSm4rBcgv5plMd8lpdKLYxfRMueD7+faww
	qThgFWJzaQAH+u9oQZaXDKooMYLeSV/llu35yGGDF5HEKARk66e56gblDbMYw0VpJUMul4P8iHU
	975tudcvWtylw4iCWH7Q6zLvZKRU=
X-Google-Smtp-Source: AGHT+IEmwfBtDsJXCpjTjW9tEez5MUnlTdPs/uC/B2JiXS/bSuHkFLh1/9E0LypLApqn/DGMjXSr1bAHqNJOVnmB0dA=
X-Received: by 2002:a05:690c:d81:b0:6ea:3e6d:2b01 with SMTP id
 00721157ae682-6eadddb0f9cmr186414837b3.19.1731492657358; Wed, 13 Nov 2024
 02:10:57 -0800 (PST)
MIME-Version: 1.0
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
 <20241108163455.885-4-SkyLake.Huang@mediatek.com> <dbdb45ed1135e73b4eebd76e6f61b96d48aaedc6.camel@mediatek.com>
 <87ikssu3qq.fsf@bootlin.com> <12f4d28f3efb7fe319ec919df92145c4ad24da01.camel@mediatek.com>
 <87h68bsdv6.fsf@bootlin.com>
In-Reply-To: <87h68bsdv6.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 13 Nov 2024 18:10:20 +0800
Message-ID: <CAJsYDVLYE1=sAj5Pvni17xQ=4akFCA+UqtuB5RKq77HxL4ux9w@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for FORESEE F35SQA002G
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"mmkurbanov@salutedevices.com" <mmkurbanov@salutedevices.com>, 
	"kernel@sberdevices.ru" <kernel@sberdevices.ru>, "d-gole@ti.com" <d-gole@ti.com>, 
	"dev@kicherer.org" <dev@kicherer.org>, "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_021058_992086_000F5582 
X-CRM114-Status: GOOD (  32.89  )
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

SGVsbG8gYWxsIQoKT24gV2VkLCBOb3YgMTMsIDIwMjQgYXQgNTowNeKAr1BNIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMTEvMjAyNCBh
dCAxMToyNToyNSBHTVQsIFNreUxha2UgSHVhbmcgKOm7g+WVn+a+pCkgPFNreUxha2UuSHVhbmdA
bWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+ID4gT24gVHVlLCAyMDI0LTExLTEyIGF0IDExOjQ4ICsw
MTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsCj4gPj4geW91IGhhdmUg
dmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4KPiA+Pgo+ID4+Cj4gPj4gSGkgU2t5
LAo+ID4+Cj4gPj4gT24gMTIvMTEvMjAyNCBhdCAxMDowODozMSBHTVQsIFNreUxha2UgSHVhbmcg
KOm7g+WVn+a+pCkgPAo+ID4+IFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+
Pgo+ID4+ID4gSGkgTWlxdWVsL01hcnRpbiwKPiA+PiA+IEFib3V0IHRoaXMgZHJpdmVyLCBpbmNs
dWRpbmcgRjM1U1FBMDAxRy9GMzVTUUEwMDJHIHBhcnRzLCBJJ20KPiA+PiA+IGNvbmNlcm5lZAo+
ID4+ID4gdGhhdCB0aGUgZHJpdmVyIHdpbGwgYWx3YXlzIHVzZSAzMkggZm9yIHVwZGF0ZV9jYWNo
ZSBvcGVyYXRpb25zLAo+ID4+ID4gd2hpY2gKPiA+PiA+IG1lYW5zIGl0J3Mgbm90IGNvbXBpdGFi
bGUgd2l0aCB0aG9zZSBTUEkgY29udHJvbGxlciB3aG8gY2FuJ3QKPiA+PiA+IHRyYW5zbWl0Cj4g
Pj4gPiAyMDQ4IGJ5dGVzIChtb3N0IHNtYWxsLWRlbnNpdHkgU1BJLU5BTkQncyBwYWdlIHNpemUg
bm93YWRheXMpIGF0Cj4gPj4gPiBvbmUKPiA+PiA+IHRpbWUuCj4gPj4gPgo+ID4+ID4gVGhlIGZv
bGxvd2luZyBjb250cm9sbGVyJ3MgZHJpdmVyIHNlZW1zIHRoYXQgdGhleSBjYW4ndCB0cmFuc21p
dAo+ID4+ID4gMjA0OAo+ID4+ID4gYnl0ZXMgaW4gb25lIHRyYW5zbWlzc2lvbjoKPiA+PiA+IC0g
c3BpLWFtZC5jOiA2NCBieXRlcyAoQU1EX1NQSV9NQVhfREFUQSkKPiA+PiA+IC0gc3BpLWFtbG9n
aWMtc3BpZmMtYTEuYzogNTEyIGJ5dGVzIChTUElGQ19BMV9CVUZGRVJfU0laRSkKPiA+PiA+IC0g
c3BpLWZzbC1xc3BpLmM6IDFLQgo+ID4+ID4gLSBzcGktaGlzaS1zZmMtdjN4eC5jOiA2NCo2IGJ5
dGVzCj4gPj4gPiAtIHNwaS1pbnRlbC5jOiA2NCBieXRlcyAoSU5URUxfU1BJX0ZJRk9fU1opCj4g
Pj4gPiAtIHNwaS1taWNyb2NoaXAtY29yZS1xc3BpLmM6IDI1NiBieXRlc2MgKE1BWF9EQVRBX0NN
RF9MRU4pCj4gPj4gPiAtIHNwaS1ueHAtZnNwaS5jOiBUWDoxS0IsIFJYOiA1MTJCIGluIEZJRk8g
bW9kZQo+ID4+ID4gLSBzcGktd3BjbS1maXUuYzogNEIKPiA+Pgo+ID4+IEkgYmVsaWV2ZSBtb3N0
IG9mIHRoZXNlIGRyaXZlcnMgYXJlIHN0aWxsIGFibGUgdG8gc2VuZCBvbmUgcGFnZSBvZgo+ID4+
IGRhdGEKPiA+PiB3aXRob3V0IHRvZ2dsaW5nIHRoZSBDUyAod2hpY2ggaXMgd2hhdCBhY3R1YWxs
eSBtYXR0ZXJzLCBJIGJlbGlldmUpLgo+ID4+IElmCj4gPj4gdGhleSB3ZXJlIGJyb2tlbiwgdGhl
eSB3b3VsZCBiZSBicm9rZW4gd2l0aCBhbGwgc3BpIG1lbW9yeSBkZXZpY2VzLAo+ID4+IG5vdAo+
ID4+IG9ubHkgRm9yZXNlZSdzLgo+ID4+Cj4gPiBIaSBNaXF1ZWwsCj4gPiBJIHRoaW5rIGl0J3Mg
bm90IGFib3V0IHRvZ2dsaW5nIHRoZSBDUz8KPiA+Cj4gPiBJZiBhIFNQSSBjb250cm9sbGVyIHRy
aWVzIHRvIGV4ZWN1dGUgd3JpdGUgcGFnZSBhbmQgaXQncyBjYXBhYmxlIHRvCj4gPiBzZW5kIG9u
bHkgMUtCIGluIG9uZSB0cmFuc21pc3Npb24sIGl0IHNob3VsZCB0cmFuc21pdCBkYXRhIGluIHR3
bwo+ID4gc3RlcHM6IDFzdCAzNEggKHJhbmRvbSBwcm9ncmFtIGxvYWQgeDQpIGFuZCAybmQgMzRI
LiBIb3dldmVyLCB3aGVuCj4gPiBGMzVTUUEwMDJHIGV4ZWN1dGVzIDJuZCAzNEggY29tbWFuZCwg
aXQgbmVlZHMgdG8gZXhlY3V0ZSAzMkggZmlyc3QsIGFuZAoKSSBkb24ndCB0aGluayB0aGF0J3Mg
d2hhdCB0aGUgZGF0YXNoZWV0IG1lYW5zLiBJIHRoaW5rIGl0IG5lZWRzCjAyaC8zMmggYXMgdGhl
IGZpcnN0CmNvbW1hbmQgdG8gd3JpdGUgcGFnZSBjYWNoZSwgYW5kIHRoZSBzdWJzZXF1ZW50IHBh
Z2UgY2FjaGUgd3JpdGluZyBjYW4KYmUgZG9uZSB1c2luZyA4NGgvMzRoIGJlZm9yZSB0aGUgZmlu
YWwgcGFnZSBwcm9ncmFtIGhhcHBlbnMuIE90aGVyd2lzZSB0aGUKODRoLzM0aCBjb21tYW5kIGlz
IGp1c3QgY29tcGxldGVseSBicm9rZW4gYW5kIHVzZWxlc3MuCklmIGl0IGFjdHVhbGx5IGlzIGJy
b2tlbiwgd2UgZG8gbmVlZCBhZGRpdGlvbmFsIGd1YXJkcyBpbiBzcGluYW5kX3dyaXRlX2NhY2hl
X29wCnRvIGFib3J0IHdoZW4gc3BpX21lbV9kaXJtYXBfd3JpdGUgZG9lc24ndCByZXR1cm4gZXhh
Y3RseSBuYnl0ZXMgYXMgcmVxdWVzdGVkLgoKPiA+IGl0IHdpbGwgY2xlYXIgZGF0YSB0cmFuc21p
dHRlZCBieSAxc3QgMzRIIGluIE5BTkQgZmxhc2gncyBjYWNoZS4gVGhpcwo+ID4gd2lsbCBjYXVz
ZSBkYXRhIGNvcnJ1cHRpb24uIE90aGVyIFNQSS1OQU5EcyBkb2Vzbid0IG5lZWQgdG8gZXhlY3V0
ZSAzMkgKPiA+IGJlZm9yZSAzNEguCj4KPiBJcyBpdCByZWFsbHkgd2hhdCBoYXBwZW5zPyBJJ2Qg
aW5zdGVhZCBleHBlY3QgdGhlIHNwaSBjb250cm9sbGVyIHRvCj4gc2VuZDoKPiAtIDM0aAo+IC0g
MWsgZGF0YQo+IC0gMWsgZGF0YQo+IC4uLgo+Cj4gV2h5IHNob3VsZCB3ZSByZXBlYXQgdGhlIGNv
bW1hbmQgd2hpbGUgd2UgYXJlIGluIHRoZSBJL08gcGhhc2U/CgpTZXZlcmFsIFNQSS1NRU0gY29u
dHJvbGxlciBkb24ndCBhbGxvdyBzb2Z0d2FyZSBjb250cm9sbGVkIENTLCBvciBmb3Igc29tZQpv
dGhlciByZWFzb25zIGFyZSB1bmFibGUgdG8gZXhlY3V0ZSBhIGxvbmdlciBzcGktbWVtIG9wLgpz
cGlfbWVtX2Rpcm1hcF93cml0ZSByZXR1cm5zIHRoZSBhY3R1YWwgcmVxdWVzdCBzaXplIGl0J3Mg
YWJsZSB0byBtYWtlLAphbmQgc3BpbmFuZF93cml0ZV90b19jYWNoZV9vcCB1c2UgYSB3aGlsZSBs
b29wIHRvIHNwbGl0IG9uZSB1cGRhdGVfY2FjaGUKcmVxdWVzdCBpbnRvIG11bHRpcGxlIG9uZXMu
CgpUaGlzIG9ubHkgd29ya3MgdXNpbmcgdGhlIFJhbmRvbSBQcm9ncmFtIExvYWQgaW5zdHJ1Y3Rp
b24gKDg0aC8zNGgpCndoaWNoIHByZXNlcnZlcyB0aGUgcHJldmlvdXMgd3JpdHRlbiBkYXRhIGlu
IHRoZSBmbGFzaCBkYXRhIGNhY2hlLgpBbGwgY3VycmVudCBzdXBwb3J0ZWQgZmxhc2hlcyBhcmUg
ZXhjbHVzaXZlbHkgdXNpbmcgODRoLzM0aCBhcyB0aGUgY29tbWFuZAp0byB3cml0ZSB0aGUgcGFn
ZSBjYWNoZS4KCkxvYWQgUHJvZ3JhbSBEYXRhKDAyaC8zMmgpIHdpbGwgY2xlYXIgdGhlIGVudGly
ZSBwYWdlIGNhY2hlLiBBcyBhCnJlc3VsdCwgd2hlbiBhIHJlcXVlc3QgaXMgc3BsaXQgYXMgZGVz
Y3JpYmVkIGFib3ZlLCB0aGUgcHJldmlvdXMgd3JpdHRlbgpkYXRhIHdpbGwgYmUgY2xlYXJlZCwg
YnJlYWtpbmcgdGhlIHBhZ2UgY2FjaGUgd3JpdGluZyBwcm9jZWR1cmUuCgpXZSBjYW4gY2hhbmdl
IHdyaXRlX3RvX2NhY2hlX29wIHRvIHVzZSBMb2FkIFByb2dyYW0gRGF0YSBvbiB0aGUKZmlyc3Qg
cmVxdWVzdC4gSWYgdGhhdCBkb2Vzbid0IGZpbmlzaCB3cml0aW5nLCB1c2UgUmFuZG9tIFByb2dy
YW0gTG9hZApvbiBzdWJzZXF1ZW50IGRhdGEgbG9hZGluZy4KLS0gClJlZ2FyZHMsCkNodWFuaG9u
ZyBHdW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
