Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CC5C3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrOcC8zpDVH6ccD+Ubl+ftg0yZgk2y1rfL6jvYMjZ1I=; b=4T/waZv1KHk5UC
	MCk3j7FFZK7kow4pA8PAUHNQoQKpTXQVl0dDKfr+8F8qI2skJ9mQEP1HtcQ85d/aZ+b5EWCHChh8A
	k6PkEm7Yl9VT1Q+19pnGwi/D7bBwhP5kn6kz3To/b3v4Dgu8nKyY7NX9lpL+mwD+46xb+MO+790yT
	EuoPuhdkyfl+zXCo//ofXo726YmaVLHh4kTlkAKf69Em4e87jUIJYdEfgb0vDinAMrYKT//WNPKyr
	zltCgCFP6l18uRds9vNZ17JJAJhdzRntcuJgljRtTHccwtmyLmYG/vbHnCFG4y7lVFU0u0vtYuY3+
	7eVLlkDfkQ8GL3HCYFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJwY-0000000CRkn-2RHC;
	Tue, 06 May 2025 15:10:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHAI-0000000Brfr-0Fy1
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 12:12:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54ea69e9352so6619721e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746533568; x=1747138368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNTDYDfXv7z2jXvHR4xlgOAcYZHFC1OQrZAisODzUt8=;
        b=lKdmAP83QD3NC5c7QVU05fHB2ALYgXsGSpXDvZ+I3j74nTzahJtcpfxfgEbNP0ASXF
         +bLfzulzZk5WyFUBJ0JGInSK+iotx5XKeLXuX9F0rGPzOjqFuzPgI5rdzY/9EMpbbQ6I
         ZIJWm3Y1YmuQoSDQaWaYyLN5dT2rJfig4hkrWVwSnVTosF61ofUhtl+f6N5Fi9tI6HfU
         USKUfnder6uEwAEguaboCMo5TaaFUd2iVnbOWUU2STwggCusW/DueBBA2+wQyA4FCfQI
         DT9dpSNtexg50W6GS0TGFdyBA+Jor/B2gwxoKhN97BaXu9wZVX1VtsCn8FDJqX3NyCHL
         fC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533568; x=1747138368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNTDYDfXv7z2jXvHR4xlgOAcYZHFC1OQrZAisODzUt8=;
        b=dgsYeWQ63lnHI4l7pjAcioVBRIJPegeKsJNFlrqqLScEUecN98sXiLvxkE7WHg5O3P
         sjq2uyfUSOH04421OMWhe2jMS8Po8VGn5UKxEXbQwVZlKh9as4/BWcSafFDpqwGbE2rT
         QwxXEFd2cIcVBtOR2Pioh5LCHhnsEgL+vQW46zu0oRFbJZlsBFocBmUlzDnHQd16t7uy
         sau0GhlROXNTyYHpct6NFR7CMDftDHYNqNdkjuNBFviie8D2AfKAjrXUa1b/IhOVhjU/
         42cjOg7xGM/jR9QSItaMhKYOuHPb1c3sgBlP0A37+slL8xShUBNF/8WRGGVZWYuJi3aL
         iElw==
X-Forwarded-Encrypted: i=1; AJvYcCUy9Mlhfkk8NvBRaHOBnjjHXjn68n0JWhADtESPEGLgKYGRBvq8H0hOhHZQGfjxk6JP3a2VqmX5ODI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/brbIa/YKakTZwZXrNsHBn+plOQ3qOlGqqtsAA7lm040TUECC
	8vnAXfqzIRWLkoqAUvXMnygKKToEwKX/emA6qxQvJmt+iPAzmv2k0Aw9pph61VOuawbtVfhNyu3
	m2ho+RnNZbD9ona7OgDsmmozp4b0=
X-Gm-Gg: ASbGnct+ANsb1nGI8ixwdCF9rkSHCltxQxyfirmdN6NGhh829YCDM8DEd2F1oonUsot
	QWI/NyRY+Q5RIp/dndMHkrIUIYjha2AeM0XekjYQhjOBigNz29Lz00PVjVK8HtDfp/5ku9s3Z/V
	/P6ync/O6njlfoMx1Fzyy6hLQ=
X-Google-Smtp-Source: AGHT+IEb0mXK6fJsSZngroFMqdEdkMdQecAMm47YJ6g9dg6uW8ksppjIknKnuoVQDZyrpDMeRGl6kPlDDntXd/HXFao=
X-Received: by 2002:a05:6512:ad0:b0:549:91e0:143 with SMTP id
 2adb3069b0e04-54fb49fd94emr983970e87.5.1746533567842; Tue, 06 May 2025
 05:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain> <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain> <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
 <aBnvbYaE-tud_o0x@stanley.mountain>
In-Reply-To: <aBnvbYaE-tud_o0x@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 20:12:11 +0800
X-Gm-Features: ATxdqUFxrF4BM4DqZ7edMLGkLqXagx31yQtm3t-mDISDZXy2WKaKjiAnI-dvmnw
Message-ID: <CAJhJPsV8Pb7gXFX2gqFVYcp4O7N=zL5V+QGkfYn73UYK67zYfg@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_051250_098743_B4EA904C 
X-CRM114-Status: GOOD (  36.93  )
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

T24gVHVlLCBNYXkgNiwgMjAyNSBhdCA3OjE24oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDA2LCAyMDI1IGF0IDA2OjAx
OjE1UE0gKzA4MDAsIEtlZ3VhbmcgWmhhbmcgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSA2LCAyMDI1
IGF0IDU6MzLigK9QTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIE1heSAwNiwgMjAyNSBhdCAwNToxNjowM1BNICswODAw
LCBLZWd1YW5nIFpoYW5nIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTWF5IDIsIDIwMjUgYXQgNDoz
OeKAr1BNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gVGhlICJkZXNjIiB2YXJpYWJsZSBpcyBOVUxMIGFuZCBQVFJfRVJS
KE5VTEwpIGlzIHplcm8vc3VjY2Vzcy4gIFJldHVybgo+ID4gPiA+ID4gYSBuZWdhdGl2ZSBlcnJv
ciBjb2RlIGluc3RlYWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRml4ZXM6IGQyZDEwZWRlMDRiMSAo
Im10ZDogcmF3bmFuZDogQWRkIExvb25nc29uLTEgTkFORCBDb250cm9sbGVyIERyaXZlciIpCj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFy
by5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IEl0J3MgaGFyZCB0byBrbm93IHdoYXQgdGhl
IHBhdGNoIHByZWZpeCBzaG91bGQgYmUgaGVyZS4gIElkZWFsbHkgd2hlbiB3ZQo+ID4gPiA+ID4g
YWRkIGEgbmV3IGRyaXZlciB3ZSB3b3VsZCB1c2UgdGhlIHBhdGNoIHByZWZpeCBmb3IgdGhlIGRy
aXZlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaXJlZDogc3Vic3lzdGVtOiBBZGQgZHJpdmVyIFhY
WAo+ID4gPiA+ID4gV2lyZWQ6IHN1YnN5c3RlbTogWFhYOiBBZGQgZHJpdmVyIGZvciBYWFgKPiA+
ID4gPiA+Cj4gPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29u
dHJvbGxlci5jIHwgMiArLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVyLmMKPiA+ID4gPiA+IGluZGV4IDZhMzY5
YjFjN2Q4Ni4uODc1NGJiNGY4YjU2IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbG9vbmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEtbmFuZC1jb250cm9sbGVyLmMKPiA+ID4gPiA+IEBA
IC0zNzEsNyArMzcxLDcgQEAgc3RhdGljIGludCBsczF4X25hbmRfZG1hX3RyYW5zZmVyKHN0cnVj
dCBsczF4X25hbmRfaG9zdCAqaG9zdCwgc3RydWN0IGxzMXhfbmFuZF8KPiA+ID4gPiA+ICAgICAg
ICAgZGVzYyA9IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NpbmdsZShjaGFuLCBkbWFfYWRkciwgb3At
PmxlbiwgeGZlcl9kaXIsIERNQV9QUkVQX0lOVEVSUlVQVCk7Cj4gPiA+ID4gPiAgICAgICAgIGlm
ICghZGVzYykgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIHByZXBhcmUgRE1BIGRlc2NyaXB0b3JcbiIpOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICAg
IHJldCA9IFBUUl9FUlIoZGVzYyk7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0ID0gLUVO
T01FTTsKPiA+ID4gPgo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgZml4aW5nIHRoaXMgaXNzdWUuCj4g
PiA+ID4gSG93ZXZlciwgSSBiZWxpZXZlIC1FSU8gaXMgbW9yZSBhcHByb3ByaWF0ZSB0aGFuIC1F
Tk9NRU0sIHNpbmNlCj4gPiA+ID4gZG1hZW5naW5lX3ByZXBfc2xhdmVfc2luZ2xlKCkgY2FuIHJl
dHVybiBlcnJvcnMgb3RoZXIgdGhhbiAtRU5PTUVNLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEl0J3Mg
bm90IGFuIEkvTyBlcnJvciBzbyAtRUlPIGlzbid0IGNvcnJlY3QuCj4gPiA+Cj4gPiA+IFRoZXJl
IGFyZSBhIGJ1bmNoIG9mIHJlYXNvbnMgaXQgY291bGQgZmFpbCBidXQgbW9zdCBsaWtlbHkKPiA+
ID4gZG1hX3Bvb2xfYWxsb2MoKSBmYWlsZWQuICBJIHRoaW5rIC1FTk9NRU0gaXMgY29ycmVjdC4K
PiA+ID4KPiA+Cj4gPiBIYXZlIHlvdSByZXZpZXdlZCB0aGUgaW1wbGVtZW50YXRpb24gb2YgbHMx
eF9kbWFfcHJlcF9zbGF2ZV9zZygpPwo+Cj4gVGhlIGxzMXhfZG1hX3ByZXBfc2xhdmVfc2coKSBo
YXMgYmFzaWNhbGx5IHR3byBlcnJvciBjYXNlcywgYnVnZ3kgZHJpdmVycwo+IGFuZCBhbGxvY2F0
aW9uIGVycm9ycy4gIFNvbWVvbmUgY291bGQgYXJndWUgdGhhdCBpZiBwZW9wbGUgcGFzcyBpbnZh
bGlkCj4gZGF0YSB0aGVuIHRoZSBjb3JyZWN0IHJldHVybiBpcyAtRUlOVkFMIGJ1dCBpbiB0aGVz
ZSBjYXNlcyBpdCdzIGEgYnVnZ3kKPiBkcml2ZXIgYW5kIHdlIGZpeCBidWdzLCB3ZSBkb24ndCB3
b3JrIGFyb3VuZCB0aGVtLiAgU28gdGhlIGNvcnJlY3QKPiByZXR1cm4gaXMgLUVOT01FTS4KPgoK
WWVzLCAtRUlOVkFMIGluZGljYXRlcyBhIGJ1ZyByYXRoZXIgdGhhbiBhIHJlYWwgZXJyb3IuCkhv
d2V2ZXIsIHRoaXMgYXNzdW1lcyB0aGF0IHRoZSBjYWxsZXIgaXMgYXdhcmUgdGhleSBhcmUgcHJv
dmlkaW5nIGludmFsaWQgZGF0YS4KT3RoZXJ3aXNlLCB0aGV5IG1pZ2h0IGJlIG1pc2xlZCBpbnRv
IHRoaW5raW5nIGl0IGlzIGFuIG91dC1vZi1tZW1vcnkKZXJyb3IgKC1FTk9NRU0pLgoKPiA+IEVy
cm9ycyBpbiB0aGlzIGZ1bmN0aW9uIGNhbiBiZSBjYXVzZWQgbm90IG9ubHkgYnkgLUVOT01FTSwg
YnV0IGFsc28gYnkgLUVJTlZBTC4KPiA+IE1vcmVvdmVyLCBpbiBtb3N0IGNhc2VzLCB0aGUgZXJy
b3IgaGFuZGxpbmcgbG9naWMgZm9yCj4gPiBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zaW5nbGUoKSBy
ZXR1cm5zIC1FSU8gd2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJucwo+ID4gTlVMTC4KPgo+IFRoZXJl
IGFyZSBzb21lIHRoYXQgcmV0dXJuIC1FSU8gYnV0IGhhcmRseSB0aGUgbWFqb3JpdHkuICBPdGhl
ciBwbGFjZXMKPiByZXR1cm4gLUVOT01FTSBvciAtRUlOVkFMLiAgSXQncyBub3Qgd29ydGggZ29p
bmcgYmFjayBhbmQgZml4aW5nIGFsbCBvZgo+IHRoZXNlIGJ1dCByZWFsbHkgLUVOT01FTSBpcyB0
aGUgY29ycmVjdCByZXR1cm4uCj4KPiByZWdhcmRzLAo+IGRhbiBjYXJwZW50ZXIKPgoKLS0KQmVz
dCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
