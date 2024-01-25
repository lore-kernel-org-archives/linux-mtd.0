Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C2C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9R7g74rhw6G4qB+hmyjj+FkYf613IqcCmFIUddwlw34=; b=GQOoJAPM4H/pjF
	PhPVKR20WjJo1OQdM9HaUHY+U3vSHWdp+QAqY7WFYBqGNgBffYChaArl4Qr6iLb6yVKpPOLJCeaMG
	hsl8lLCykXAvntGuPsn0Csw83vG1jmiyVWhTejUiTP+BttlIUJ4MCYRDTpiLVhw5cW1dVHZd5BV2L
	+QDShCJywb5BVkU+3h2/WctUKnin90s1eZHJw97MswF1gNU6Drryy5WLkt8hDw385QID7qqsAr9tr
	hLzb0ZnX4zA9GOjnAIF4xuhReXVs4G+oYZnDqawHEV651FAtxeF14G1U7Wz2aA7gFNWlbtbCzNJ09
	3mx/DotmFnpu16INN36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5hj-00000001dP7-1DQO;
	Thu, 25 Jan 2024 19:48:03 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5hh-00000001dNp-13qe
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 19:48:02 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6dc36e501e1so5799126a34.1
        for <linux-mtd@lists.infradead.org>; Thu, 25 Jan 2024 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706212077; x=1706816877; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyIWFQ1vFWoo45M1BlWLEeXRVeP9Nt7FD+B+f6FiY+w=;
        b=EvFSgYHEZSNlEmTqbJsbiX7fD5oCdxjUY7FWDzWnrbCNtQNOVI975VzwBe0+qZZ6vz
         FHHI8occdNMVDjZ30jbZa5XNXOs6nEyGbpZ9w0vZkN7CxqKjEdXbW08BCleksoElFbom
         efE5IdSS/cQd7kVcXOGyEAN0Npc1rKYpIBxGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212077; x=1706816877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyIWFQ1vFWoo45M1BlWLEeXRVeP9Nt7FD+B+f6FiY+w=;
        b=YdTqUbfqwbpPrnVgSLg5Xos0V1Z9f9Kxh3NUw+A/Y/nLLBY0qz5S0l0FUEJqINITEl
         Uq9mJnrFk+fbt1uM3foV8eZkS8bLTzzsLez3VwV7UdrU1Qd2dmrDy2fI98Y8sc72Fplu
         m34SBZgbhp7xdbUSjWJ12Gfy3CdfJmi08PUrj2b2yVb0tgYRdMfhCxe3DiAxV8AhJCm8
         ZmcSjsPv9mNB8M+5qihEP1A0B19NjigkbP5loihSarupO354o4msam4lwhkPcAyv4zRc
         c2culxcNUnDD2HnzgX+6c6ctVR6TBf/YhyE6tLSvL/kIwNcmY5BkhlcDqwhonm9SxLLW
         u/4w==
X-Gm-Message-State: AOJu0YxFrzVLJ4/ZidvKq9trpCbDlw7jVvhY9xWJOEopjY+G6py6LflF
	KYoc4wJoQNx3C3GGKXDtPYGPpqtN1MiZPeV9QLrEFqBQnkMhtLRaua5McNkY56DxVkJZXQ5zO8O
	WdQYfBC0IK5kZHQuatYKPc4nSvwWko+tM0vc4
X-Google-Smtp-Source: AGHT+IGekG3Dtb9CcWAk4PYoE+WDZ1VA7nT/CUBW+XazLbLifZzJFyi+b1ofXaGFHNvhlX5SIyIFFhz3O6B/sKC2sg0=
X-Received: by 2002:a9d:7495:0:b0:6db:fa81:564a with SMTP id
 t21-20020a9d7495000000b006dbfa81564amr488303otk.3.1706212076800; Thu, 25 Jan
 2024 11:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20240124030458.98408-1-dregan@broadcom.com> <20240124030458.98408-11-dregan@broadcom.com>
 <20240124184027.712b1e47@xps-13>
In-Reply-To: <20240124184027.712b1e47@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Thu, 25 Jan 2024 11:47:46 -0800
Message-ID: <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240125_114801_342626_1BD8FDFD 
X-CRM114-Status: GOOD (  22.93  )
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

SGkgTWlxdcOobCwKCk9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDk6NDDigK9BTSBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIERhdmlkLAo+Cj4g
ZHJlZ2FuQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBUdWUsIDIzIEphbiAyMDI0IDE5OjA0OjU4IC0w
ODAwOgo+Cj4gPiBBbGxvdyBzZXR0aW5ncyBmb3Igb24tZGllIGVjYyBzdWNoIHRoYXQgaWYgb24t
ZGllIEVDQyBpcyBzZWxlY3RlZAo+ID4gZG9uJ3QgZXJyb3Igb3V0IGJ1dCByZXF1aXJlIEVDQyBz
dHJhcCBzZXR0aW5nIG9mIHplcm8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8
ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxs
aWFtLnpoYW5nQGJyb2FkY29tLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MzogTm9uZQo+
ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBBZGRlZCB0byBwYXRjaCBzZXJpZXMKPiA+
IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxNCAr
KysrKysrKysrLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ID4gaW5kZXggYTRlMzExYjY3OThjLi40MjUyNmYzMjUwYzkgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiBAQCAtMjcyNyw5ICsyNzI3LDEx
IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfc2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpo
b3N0KQo+ID4gICAgICAgY2ZnLT5ibGtfYWRyX2J5dGVzID0gZ2V0X2Jsa19hZHJfYnl0ZXMobXRk
LT5zaXplLCBtdGQtPndyaXRlc2l6ZSk7Cj4gPgo+ID4gICAgICAgaWYgKGNoaXAtPmVjYy5lbmdp
bmVfdHlwZSAhPSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NUKSB7Cj4gPiAtICAgICAgICAg
ICAgIGRldl9lcnIoY3RybC0+ZGV2LCAib25seSBIVyBFQ0Mgc3VwcG9ydGVkOyBzZWxlY3RlZDog
JWRcbiIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgY2hpcC0+ZWNjLmVuZ2luZV90eXBlKTsK
PiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIGlmIChj
aGlwLT5lY2Muc3RyZW5ndGgpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGN0
cmwtPmRldiwgIkVSUk9SISEhIEhXIEVDQyBtdXN0IGJlIHNldCB0byB6ZXJvIGZvciBub24taGFy
ZHdhcmUgRUNDOyBzZWxlY3RlZDogJWRcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjaGlwLT5lY2Muc3RyZW5ndGgpOwo+Cj4gQ2FuIHlvdSB1c2UgYSBtb3JlIGZvcm1hbCBz
dHJpbmc/IEFsc28gY2xhcmlmeSBpdCBiZWNhdXNlIEkgZG9uJ3QKPiByZWFsbHkgdW5kZXJzdGFu
ZCB3aGF0IGl0IGxlYWRzIHRvLgoKSG93IGFib3V0OgoKZGV2X2VycihjdHJsLT5kZXYsICJIVyBF
Q0Mgc2V0IHRvICVkLCBtdXN0IGJlIHplcm8gZm9yIG9uLWRpZSBFQ0NcbiIsCgo+Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIH0KPiA+
ICAgICAgIH0KPiA+Cj4gPiAgICAgICBpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9FQ0NfQUxH
T19VTktOT1dOKSB7Cj4gPiBAQCAtMjc5Nyw3ICsyNzk5LDExIEBAIHN0YXRpYyBpbnQgYnJjbW5h
bmRfc2V0dXBfZGV2KHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KQo+ID4gICAgICAgaWYgKHJl
dCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiAtICAgICBicmNtbmFuZF9z
ZXRfZWNjX2VuYWJsZWQoaG9zdCwgMSk7Cj4gPiArICAgICBpZiAoY2hpcC0+ZWNjLmVuZ2luZV90
eXBlID09IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0RJRSkgewo+ID4gKyAgICAgICAgICAgICBk
ZXZfZGJnKGN0cmwtPmRldiwgIkRpc2FibGUgSFcgRUNDIGZvciBvbi1kaWUgRUNDXG4iKTsKPgo+
IE5vdCBuZWVkZWQuCgpXaWxsIHJlbW92ZS4KCj4KPiA+ICsgICAgICAgICAgICAgYnJjbW5hbmRf
c2V0X2VjY19lbmFibGVkKGhvc3QsIDApOwo+ID4gKyAgICAgfSBlbHNlCj4gPiArICAgICAgICAg
ICAgIGJyY21uYW5kX3NldF9lY2NfZW5hYmxlZChob3N0LCAxKTsKPgo+IFN0eWxlIGlzIHdyb25n
LCBidXQgb3RoZXJ3aXNlIEkgdGhpbmsgRUNDIHNob3VsZCBiZSBrZXB0IGRpc2FibGVkIHdoaWxl
Cj4gbm90IGluIGFjdGl2ZSB1c2UsIHNvIEkgYW0gYSBiaXQgc3VycHJpc2VkIGJ5IHRoaXMgbGlu
ZS4KClRoaXMgaXMgYSBkb3VibGUgY2hlY2sgdG8gdHVybiBvbi9vZmYgb3VyIGhhcmR3YXJlIEVD
Qy4KCj4KPiA+Cj4gPiAgICAgICBicmNtbmFuZF9wcmludF9jZmcoaG9zdCwgbXNnLCBjZmcpOwo+
ID4gICAgICAgZGV2X2luZm8oY3RybC0+ZGV2LCAiZGV0ZWN0ZWQgJXNcbiIsIG1zZyk7Cj4KPgo+
IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MhCgotRGF2ZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
