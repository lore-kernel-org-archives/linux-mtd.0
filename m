Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752ABC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425FB208C4
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HpA4RXeh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6sC+Alj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425FB208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDyOaPVgRlPGquplkcEJZYC5UR/h0fntncLi0QoxZH4=; b=HpA4RXehvsKfBW
	azNGumd5mW1kjNxISZXm166/UNy2XpUl5wIGIlOGyMl3Lawh6sHcGppgg8fsLwOu0S2vceOwG8SUO
	+C8DiHyolcySB7C00ifzQohCk2NmwY1kxOPKfo3eScoIHcx0bNrLtCJVuayzqxkY9Jach8CNWjbte
	GSnmiXUN7m6hgpncls8OuZ/tDcbVVVozaMH5Q5rcXH4f+dsXS+SZgTSCYwdLsKUYfMzFzxIT5o9K6
	+J98Ml5VEb4+aPwJMj1G94G/wvaB2l/68ZwcFSBNFuTau5Zaa+yIXzaYb7vIqq55Iz4ACJyw5n6pC
	+/Puu/NLcaWrAXJuGRgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM5R5-0001qA-KW; Thu, 02 May 2019 06:43:15 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM5R2-0001pZ-Ao
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 06:43:14 +0000
Received: by mail-it1-x142.google.com with SMTP id l10so1468987iti.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 23:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HSGbpAsjrEz+LSOl9dCHcdRZTgcOh3tw9dUTjuJ5J7c=;
 b=Z6sC+AljjqID+DmQtvIw7IEWj6jrkr+b/pA8gIJjXBCIYJGNT9O9mhXeLlW/Hvwdd7
 pgxjueuiS/4sbp6UXofiy9XKouVG97oq8Sfp9EEO4KBlLYwQjE+tDYyXLlj6AhOh+sB9
 UTHWDE2gCylbElM7ok5XrOCXFmZ6arFtKmanSTv1PzYbs+4+iwLFz0RZIokI+8bCk8aX
 w3tIsnE93BdPxqMuogGb1h2VZI8xMSrxtJfWHfy//lTbVgMo3jGf7bvAl7KFSFAGecD8
 Gerl7Vf0BzPRJl1DvBZ0gs3q20z9l1uwqpHsZVjX6kZunc2T98nGJukn2442QwlMRJZD
 i9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HSGbpAsjrEz+LSOl9dCHcdRZTgcOh3tw9dUTjuJ5J7c=;
 b=AKdMcqUPYibO8CocZqkS9tg6JOng3dGyZkoMjdhqgkSn/OqUd+44TzQxQSnVkr3O8c
 +XehAKX0ke4pGssIWDKkeXK+kwZQWkTjHjFBLX8umhBICIekqbT43YwLzwx02+31+sVG
 KX/xaCGSnWARQPmFZa9YX7iNMfukw4rHvBwvEV/ZsMGZZVo1ilu+qf/7l/vtfsJjFSIZ
 yrmOmlgfqEHbeg1VO9TX8jDbKtth20FleMnYxfLkNZ78o/kgE645frTZIL+8CAaJZ2qt
 V6XodcC/eGUPY63n3wcjC7SEwfxmCg/azamDe3mtaJ3jG/pf5XrRASOqh0UCtecBgwNX
 +VjA==
X-Gm-Message-State: APjAAAUSuMGnvK5QSFp4F0A8TqjlvdihpeZpyG6Mkkp9KaUItiy2QPTJ
 2YJG0wvDPzLoXKG14rkmRCIg2bdJfH7RKSo4SKA=
X-Google-Smtp-Source: APXvYqzi4GjfCDD9m9k7bQbKF/7Y7zsn5hRA1XyrDMnGvfWAh7HOdO1UigTDRAyv6gqZWN7xir9YmAFC87lMnrHHyAo=
X-Received: by 2002:a05:6638:209:: with SMTP id
 e9mr1374960jaq.22.1556779390573; 
 Wed, 01 May 2019 23:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
 <20190502083632.0ec0fb4e@collabora.com>
In-Reply-To: <20190502083632.0ec0fb4e@collabora.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Thu, 2 May 2019 15:42:59 +0900
Message-ID: <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_234312_398308_E7AFD3CE 
X-CRM114-Status: GOOD (  30.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjAxOeW5tDXmnIgy5pelKOacqCkgMTU6MzYgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT46Cj4KPiBIaSBUb21hc3osCj4KPiBPbiBUaHUsIDIgTWF5IDIwMTkg
MTU6MjM6MzMgKzA5MDAKPiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90
ZToKPgo+ID4gMjAxOeW5tDXmnIgy5pelKOacqCkgMTA6NTQgUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz46Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDA2OjQyOjIzUE0g
KzAyMDAsIFBhd2XFgiBDaG1pZWwgd3JvdGU6Cj4gPiA+ID4gRnJvbTogVG9tYXN6IEZpZ2EgPHRv
bWFzei5maWdhQGdtYWlsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBkdC1i
aW5kaW5ncyBmb3IgU2Ftc3VuZyBPbmVOQU5EIGRyaXZlci4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29t
Pgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50
eHQgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0NiBpbnNlcnRpb25zKCspCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4g
Pgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3NhbXN1bmctb25lbmFuZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzQxZDk3Y2MxNTEzCj4gPiA+ID4gLS0tIC9kZXYv
bnVsbAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
c2Ftc3VuZy1vbmVuYW5kLnR4dAo+ID4gPiA+IEBAIC0wLDAgKzEsNDYgQEAKPiA+ID4gPiArRGV2
aWNlIHRyZWUgYmluZGluZ3MgZm9yIFNhbXN1bmcgU29DIE9uZU5BTkQgY29udHJvbGxlcgo+ID4g
PiA+ICsKPiA+ID4gPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+ID4gPiArIC0gY29tcGF0aWJs
ZSA6IHZhbHVlIHNob3VsZCBiZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZy4KPiA+ID4gPiArICAg
KGEpICJzYW1zdW5nLHMzYzY0MDAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNv
bXBhdGlibGUgd2l0aAo+ID4gPiA+ICsgICAgICAgUzNDNjQwMCBTb0MsCj4gPiA+ID4gKyAgIChi
KSAic2Ftc3VuZyxzM2M2NDEwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21w
YXRpYmxlIHdpdGgKPiA+ID4gPiArICAgICAgIFMzQzY0MTAgU29DLAo+ID4gPiA+ICsgICAoYykg
InNhbXN1bmcsczVwYzEwMC1vbmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xsZXIgY29tcGF0
aWJsZSB3aXRoCj4gPiA+ID4gKyAgICAgICBTNVBDMTAwIFNvQywKPiA+ID4gPiArICAgKGQpICJz
YW1zdW5nLHM1cHYyMTAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGli
bGUgd2l0aAo+ID4gPiA+ICsgICAgICAgUzVQQzExMC9TNVBWMjEwIFNvQ3MuCj4gPiA+ID4gKwo+
ID4gPiA+ICsgLSByZWcgOiB0d28gbWVtb3J5IG1hcHBlZCByZWdpc3RlciByZWdpb25zOgo+ID4g
PiA+ICsgICAtIGZpcnN0IGVudHJ5OiBjb250cm9sIHJlZ2lzdGVycy4KPiA+ID4gPiArICAgLSBz
ZWNvbmQgYW5kIG5leHQgZW50cmllczogbWVtb3J5IHdpbmRvd3Mgb2YgcGFydGljdWxhciBPbmVO
QU5EIGNoaXBzOwo+ID4gPiA+ICsgICAgIGZvciB2YXJpYW50cyBhKSwgYikgYW5kIGMpIG9ubHkg
b25lIGlzIGFsbG93ZWQsIGluIGNhc2Ugb2YgZCkgdXAgdG8KPiA+ID4gPiArICAgICB0d28gY2hp
cHMgY2FuIGJlIHN1cHBvcnRlZC4KPiA+ID4gPiArCj4gPiA+ID4gKyAtIGludGVycnVwdC1wYXJl
bnQgOiBwaGFuZGxlIG9mIGludGVycnVwdCBjb250cm9sbGVyIHRvIHdoaWNoIHRoZSBPbmVOQU5E
Cj4gPiA+ID4gKyAgIGNvbnRyb2xsZXIgaXMgd2lyZWQsCj4gPiA+Cj4gPiA+IFRoaXMgaXMgaW1w
bGllZCBhbmQgY2FuIGJlIHJlbW92ZWQuCj4gPiA+Cj4gPiA+ID4gKyAtIGludGVycnVwdHMgOiBz
cGVjaWZpZXIgb2YgaW50ZXJydXB0IHNpZ25hbCB0byB3aGljaCB0aGUgT25lTkFORCBjb250cm9s
bGVyCj4gPiA+ID4gKyAgIGlzIHdpcmVkOyBzaG91bGQgY29udGFpbiBqdXN0IG9uZSBlbnRyeS4K
PiA+ID4gPiArIC0gY2xvY2stbmFtZXMgOiBzaG91bGQgY29udGFpbiB0d28gZW50cmllczoKPiA+
ID4gPiArICAgLSAiYnVzIiAtIGJ1cyBjbG9jayBvZiB0aGUgY29udHJvbGxlciwKPiA+ID4gPiAr
ICAgLSAib25lbmFuZCIgLSBjbG9jayBzdXBwbGllZCB0byBPbmVOQU5EIG1lbW9yeS4KPiA+ID4K
PiA+ID4gSWYgdGhlIGNsb2NrIGp1c3QgZ29lcyB0byB0aGUgT25lTkFORCBkZXZpY2UsIHRoZW4g
aXQgc2hvdWxkIGJlIGluIHRoZQo+ID4gPiBuYW5kIGRldmljZSBub2RlIHJhdGhlciB0aGFuIHRo
ZSBjb250cm9sbGVyIG5vZGUuCj4gPiA+Cj4gPgo+ID4gKFRyeWluZyBoYXJkIHRvIHJlY2FsbCB0
aGUgZGV0YWlscyBhYm91dCB0aGlzIGhhcmR3YXJlLikKPiA+IEFGQUlSIHRoZSBjbG9jayBnb2Vz
IHRvIHRoZSBjb250cm9sbGVyIGFuZCB0aGUgY29udHJvbGxlciB0aGVuIGZlZWRzCj4gPiBpdCB0
byB0aGUgbWVtb3J5IGNoaXBzLgo+ID4KPiA+IEFsc28gSSBkb24ndCB0aGluayB3ZSBzaG91bGQg
aGF2ZSBhbnkgbmFuZCBkZXZpY2Ugbm9kZXMgaGVyZSwgc2luY2UKPiA+IHRoZSBtZW1vcnkgaXRz
ZWxmIGlzIG9ubHkgZXhwb3NlZCB2aWEgdGhlIGNvbnRyb2xsZXIsIHdoaWNoIG9mZmVycwo+ID4g
dmFyaW91cyBxdWVyaWVzIHRvIHByb2JlIHRoZSBtZW1vcnkgYXQgcnVudGltZSwgc28gdGhlcmUg
aXMgbm8gbmVlZCB0bwo+ID4gZGVzY3JpYmUgaXQgaW4gRFQuCj4KPiBJdCdzIHByb2JhYmx5IHRy
dWUsIHRob3VnaCBub3QgcHJvdmlkaW5nIHRoaXMgY29udHJvbGxlci9kZXZpY2UKPiBzZXBhcmF0
aW9uIGZvciBOQU5EIGNvbnRyb2xsZXIvZGV2aWNlcyBoYXMgcHJvdmVuIHRvIGJlIGEgbWlzdGFr
ZSBmb3IKPiByYXcgTkFORCBjb250cm9sbGVycyAoc29tZSBwcm9wcyBhcHBseSB0byB0aGUgY29u
dHJvbGxlcnMgYW5kIG90aGVycyB0bwo+IHRoZSBOQU5EIGRldmljZSwgbm90IHRvIG1lbnRpb24g
dGhhdCBzb21lIGNvbnRyb2xsZXJzIHN1cHBvcnQKPiBpbnRlcmFjdGluZyB3aXRoIHNldmVyYWwg
Y2hpcHMpLCBzbywgaWYgdGhhdCdzIGEgbmV3IGJpbmRpbmcsIEknZAo+IHJlY29tbWVuZCBoYXZp
bmcgdGhpcyBzZXBhcmF0aW9uIGV2ZW4gaWYgaXQncyBub3Qgc3RyaWN0bHkgcmVxdWlyZWQuCj4K
Ck5vdGUgdGhhdCBPbmVOQU5EIGlzIGEgdG90YWxseSBkaWZmZXJlbnQgdGhpbmcgdGhhbiB0aGUg
dHlwaWNhbCBOQU5ECm1lbW9yeSB3aXRoIE5BTkQgaW50ZXJmYWNlLiBPbmVOQU5EIGNoaXBzIGhh
dmUgYSBOT1ItbGlrZSBpbnRlcmZhY2UsCndpdGggaW50ZXJuYWwgY29udHJvbGxlciBhbmQgYnVm
ZmVycyBpbnNpZGUsIHNvIHRlY2huaWNhbGx5IHRoZXkgY2FuCmJlIGV2ZW4gdXNlZCB3aXRob3V0
IGFueSBzcGVjaWFsIGNvbnRyb2xsZXIgb24gdGhlIFNvQywgdmlhIGEgZ2VuZXJpYwpwYXJhbGxl
bCBob3N0IGludGVyZmFjZSBhbmQgcG9zc2libHkgc29tZSByZWd1bGFyIERNQSBlbmdpbmUgZm9y
IENQVQpvZmZsb2FkLgoKVGhlIGNvbnRyb2xsZXIgZGVzaWduIG9mIHRoZSBTb0NzIGluIHF1ZXN0
aW9uIGZ1cnRoZXIgYWJzdHJhY3RzIHRoZQpPbmVOQU5EJ3MgcHJvZ3JhbW1pbmcgaW50ZXJmYWNl
IGludG8gYSBudW1iZXIgb2YgaGlnaCBsZXZlbCBvcGVyYXRpb25zCmFuZCBhdHRlbXB0cyB0byBo
aWRlIHRoZSBkZXRhaWxzIG9mIHRoZSB1bmRlcmx5aW5nIG1lbW9yeSwgc28gSSBkb24ndApzZWUg
dGhlIHBvaW50IG9mIGRlc2NyaWJpbmcgdGhlIG1lbW9yeSBpbiBEVCBoZXJlLCBpdCB3b3VsZCBh
Y3R1YWxseQpkZWZlYXQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjb250cm9sbGVyLgoKPiA+Cj4gPiA+
ID4gKyAtIGNsb2NrOiBzaG91bGQgY29udGFpbiBsaXN0IG9mIHBoYW5kbGVzIGFuZCBzcGVjaWZp
ZXJzIGZvciBhbGwgY2xvY2tzIGxpc3RlZAo+ID4gPiA+ICsgICBpbiBjbG9jay1uYW1lcyBwcm9w
ZXJ0eS4KPiA+ID4gPiArIC0gI2FkZHJlc3MtY2VsbHMgOiBtdXN0IGJlIDEsCj4gPiA+ID4gKyAt
ICNzaXplLWNlbGxzIDogbXVzdCBiZSAxLgo+ID4gPgo+ID4gPiBUaGlzIGltcGxpZXMgc29tZSBj
aGlsZCBub2Rlcy4gV2hhdCBhcmUgdGhlIGNoaWxkIG5vZGVzPwo+ID4gPgo+ID4KPiA+IEkgY2Fu
J3QgcmVjYWxsIHRoZSByZWFzb24gZm9yIHRoaXMgdW5mb3J0dW5hdGVseS4KPgo+IERlZmluaW5n
IHBhcnRpdGlvbnMgSSBndWVzcywgYnV0IHdlIGFzayBwZW9wbGUgdG8gdXNlIHRoZSBuZXcKPiBy
ZXByZXNlbnRhdGlvbiB3aXRoIGEgJ3BhcnRpdGlvbnMnIHN1Yi1ub2RlIG5vdywgc28gdGhpcyBz
aG91bGQKPiBwcm9iYWJseSBiZSBkcm9wcGVkLgoKQWgsIHRoYXQgY291bGQgYmUgaXQgaW5kZWVk
LiBUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClRvbWFzegoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
