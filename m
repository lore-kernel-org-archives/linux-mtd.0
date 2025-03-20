Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC1EC28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1N78LGpI6NrWT0Bhgi2haOz5QIbLWi7Eg8deV21D+o=; b=z2hsKPCX1kQX3z
	7iiHH7biO1eA4stlGIgtR/nggyWYE4Y/qp9GrkxDhvLwgiRwBBEyuiGWGw0q+f/Efv8iqATiX+qac
	R91a9EgNJPUM9CNhKQL8XXsoa91HevPkj199zcYV9/YiRTnC0XC02HREIBEeqhePzsVf+YvDBafhS
	ExcDkXtMyM8aqv+BUBfY5/El+Za8UAX7n/WkZVLoqUaOZEZQ170VKgKSgFBrK10YwT0dHTIOoDUIv
	L7q7vy+xfIa5BH48W1tPduLwU2ZDDNFxMiU6LpXS2N3HBz6Vl11qDF0WEzFappW3Lg0wicB4PdRzC
	IerlNgYxsTP//ENCU4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGY0-0000000CKfZ-2KBL;
	Thu, 20 Mar 2025 14:07:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGXy-0000000CKfA-2xOF
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 14:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 325496115E
	for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 14:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D65EC4CEEF
	for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 14:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742479617;
	bh=DDT6cBNLHmKYa9YmgU/1bp9DFS0kjiVUPiG6LoDCQkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V4BPKYRzvQJtl1/VHvXwAeLhb2QGsK0slYcHLiptqwGGBaU12wkYPoU0ZrcIiigcf
	 wbtYtBqP3MPNAhTXnGH09V+oGtpxwxjk00zWyZ+m7WsaoJCCV+H1sEpcBU7TJASn7d
	 +MxLw9anNefyoGhx2LI2yTOnk5Tz+hAMO75y9EaP1r/qfVEjx1wzMOGgy4LUp8WLmA
	 kSPIAk5eXVN067y2nnTMXzE83vHOtWoywWHplLl/nCR2K4ZlrCYurIHShzKZ600ic7
	 zFx8r8yQqszbiMVymkwM/txmVYr5V19fzmZ/WZ3/ysnlRDeYqgWu8TmzsVgVmltDXn
	 XZIStK5gJNvwQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so1512748a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 07:06:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBZLFKx2ARsMHUGJtBl9vWxQbxNHMD2+gN1PWOCw5CZRF2dUgQMs6ZfdcX39Kg3+9G2P/PTBMgRck=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0bH0Wk66lSd8I9FZEayJaJF0rNL6BoDH+qlku474WOLKt461z
	1+UKJM6kFZGZqQVpKwASdduJ8UVcUryGz3cOcMK80N9T8ZRNZXR3DETWq1oLojm15RgK2qnyWRY
	II3g5VB7CuGtzag28bTt9qlh8Vw==
X-Google-Smtp-Source: AGHT+IH2XwHhX6jV9jRXmOCR8jBeUV2nLXlOUeKeC+dcaCuo4JoCVhdLZhacD69eHm0iAGZjF0VMi0QdyHinZWHSPLg=
X-Received: by 2002:a05:6402:1e8a:b0:5ea:cca7:432d with SMTP id
 4fb4d7f45d1cf-5eb80d1af73mr7445698a12.14.1742479615750; Thu, 20 Mar 2025
 07:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org> <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
In-Reply-To: <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Mar 2025 09:06:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
X-Gm-Features: AQ5f1JpmrFI8IwNaOt_WJJA7aVFlee9JZM4Qcktwre03i7fejG0n7XaAnObd1s0
Message-ID: <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <tkuw584924@gmail.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bacem Daassi <Bacem.Daassi@infineon.com>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMjo0NOKAr0FNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSwgUm9iLAo+Cj4gT24gMy8xOS8yNSAxMToz
MCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCAwNjo0
Nzo0NFBNICswOTAwLCBUYWthaGlybyBLdXdhbm8gd3JvdGU6Cj4gPj4gVGhlcmUgYXJlIGluZmlu
ZW9uIGZsYXNoZXMgWzFdIHRoYXQgcmVxdWlyZSA4IGR1bW15IGN5Y2xlcyBmb3IgdGhlCj4gPj4g
MS0xLTEgUmVhZCBJRCBjb21tYW5kLiBTaW5jZSB0aGUgY29tbWFuZCBpcyBub3QgY292ZXJlZCBi
eSBKRVNEMjE2Cj4gPj4gb3IgYW55IG90aGVyIHN0YW5kYXJkLCBnZXQgdGhlIG51bWJlciBvZiBk
dW1teSBjeWNsZXMgZnJvbSBEVCBhbmQgdXNlCj4gPj4gdGhlbSB0byBjb3JyZWN0bHkgaWRlbnRp
ZnkgdGhlIGZsYXNoLgo+ID4KPiA+IElmIFJlYWQgSUQgZmFpbHMsIHRoZW4gY291bGRuJ3QgeW91
IGp1c3QgcmV0cnkgd2l0aCBkdW1teSBjeWNsZXM/IE9yCj4KPiBJIHRoaW5rIFJlYWQgSUQgd29u
J3QgZmFpbCB3aGVuIHRoZSBvcCByZXF1aXJlcyA4IGR1bW15IGN5Y2xlcywgaXQKPiBwcm9iYWJs
eSBqdXN0IHJlYWRzIGdhcmJhZ2Ugb24gdGhlIGZpcnN0IDggY3ljbGVzLCBzbyB3ZSByaXNrIHRv
IHdyb25nbHkKPiBtYXRjaCBvdGhlciBmbGFzaCBJRHMuCj4KPiA+IHdvdWxkIHVuY29uZGl0aW9u
YWxseSBhZGRpbmcgZHVtbXkgY3ljbGVzIGFkdmVyc2VseSBhZmZlY3Qgb3RoZXIgY2hpcHM/Cj4K
PiBBZGRpbmcgOCBkdW1teSBjeWNsZXMgdG8gY2hpcHMgdGhhdCBkb24ndCBuZWVkIGl0LCB3b3Vs
ZCBtZWFuIGlnbm9yaW5nCj4gdGhlIGZpcnN0IGJ5dGUgb2YgdGhlIGZsYXNoIElELCB0aHVzIHdl
IGFnYWluIHJpc2sgdG8gd3JvbmdseSBtYXRjaAo+IGFnYWluc3Qgb3RoZXIgZmxhc2ggSURzLgo+
Cj4gPgo+ID4gT3RoZXJ3aXNlLCBhZGQgYSBzcGVjaWZpYyBjb21wYXRpYmxlIHRvIGltcGx5IHRo
aXMgcmVxdWlyZW1lbnQuIEFkZGluZwo+ID4gcXVpcmsgcHJvcGVydGllcyBkb2Vzbid0IHNjYWxl
Lgo+Cj4gRG8geW91IG1lYW4gYSBmbGFzaCBuYW1lIGNvbXBhdGlibGUsIGxpa2UgImN5cnMxN2I1
MTIsc3BpLW5vciI/CgpZZXMsIGJ1dCB0aGF0J3Mgbm90IHRoZSBmb3JtYXQgb2YgY29tcGF0aWJs
ZSBzdHJpbmdzLgoKPiBUaGUKPiBwcm9ibGVtIHRoYXQgSSBzZWUgd2l0aCB0aGF0IGlzIHRoYXQg
d2Ugbm8gbG9uZ2VyIGJpbmQgYWdhaW5zdCB0aGUKPiBnZW5lcmljIGplZGVjLHNwaS1ub3IgY29t
cGF0aWJsZSwgc28gcGVvcGxlIG5lZWQgdG8gdXBkYXRlIHRoZWlyIERUIGluCj4gY2FzZSB0aGV5
IHVzZS9wbHVnLWluIGEgZGlmZmVyZW50IGZsYXNoIG9uIHRoZWlyIGJvYXJkLgoKVGhpcyBjaGlw
IGlzIGNsZWFybHkgKm5vdCogY29tcGF0aWJsZSB3aXRoIGEgZ2VuZXJpYyBjaGlwLgoKWW91IGhh
dmUgdGhlIHNhbWUgcHJvYmxlbSB3aXRoIGEgcHJvcGVydHkuIFVzZXJzIGhhdmUgdG8gYWRkIG9y
IHJlbW92ZQp0aGUgcHJvcGVydHkgaWYgdGhlIGZsYXNoIGNoYW5nZXMuIEFueW9uZSB0aGlua2lu
ZyB0aGV5IGNhbiB1c2UgdGhpcwpjaGlwIGFzIGEgY29tcGF0aWJsZSAybmQgc291cmNlIGlzIFNP
TC4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
