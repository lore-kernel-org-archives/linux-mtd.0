Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB552CE7A94
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTu3hFfaqrvj7aQy10V0vQZgNcy99gE+HeSl1qfVSJs=; b=CW7hP/z+7YUz7+
	eVJaSF/53VmYPo+FpqO0QuG6jh7DN0GsEkApwFUwlZnoNHSePqrgvmnIc9CJlqt7ysxVMDuTMnHe6
	i4Eei/Dqps/o2bqYPKzgUS1eC9lmpndoQ/vonvGXW7lPq3F4HjjJly54FJG5cO1vJBOK5W3lfNUC4
	h7YrDjcI/4EyqMoVaco5vwtwANmG7UUf8YdjohwfcrJ16KzqdSeCrYR7nGbOLggcjse+yEMlxMw6J
	nafpY6bAlTSERYRmCpKtsKLX8nq/atpRkElTJ8+EX3JgnmmVFn/84Ksov8nBq5BFgytpwrzw3dScN
	qt8Y9vq+eu/JbrZLgPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkma-00EFxz-04;
	Mon, 25 Sep 2023 12:33:48 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkmW-00EFwk-1f
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 12:33:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-503065c4b25so9867958e87.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Sep 2023 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695645212; x=1696250012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOrEG4tfl75vIbxlTDfOPlF5gglTowT9ubBWOy0wGIE=;
        b=MS/y+YHsXdcsYRQx0hBiHqmDkA8uJCclqNSdQGtuqTXymjzEu34h8DSuyztlfCLTQ/
         +RcavYipTPVTtjF1BYtzXnj3rpW+O4ReBwN7TBgyoDVI5a73Fff5z9iM5OpZMs09kmDl
         Pt0BQfwLCwOuEiy3+CWM6DfSqHZUdcsg3A8kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695645212; x=1696250012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOrEG4tfl75vIbxlTDfOPlF5gglTowT9ubBWOy0wGIE=;
        b=N5FisDyaLHwxDCe95KDwPes6ME3w55bx43WOUa6lC1OKzus18rgzyS3Nf4z/MrehSE
         zyZ0BY29mTRqsJCHJTfzblufTDJwSkxIE5w3p988yTvkBVNsIa5d9jSqJuNXEEsfuNew
         AFMp3nmNEXwURmEhHEnNFTyi3lrP7l6qTxPJD51uk2thP9SKKsU25nsGLRg8i6mgb1uW
         GqtJobndMVfmTIpP6UFXZmYBY+PJZEUWRGY+LTxtVOE+nI54Qcq3HKWxjkGRg3t0Y6np
         n5qLwLpQbs5P7dwr3jYBFLoGqxpXaSgoOyXZiAnESY2tknNzpzLvfsNKa32H4Jap8hdI
         DFbw==
X-Gm-Message-State: AOJu0Yx/JQ79Ptdrnu4nhyU1ZqDg4GcjXXSddPl/7wTXQoCKjHvu6j5v
	q4XjyP0/O+bSbGURdYsICifRgMcjmx5lgi/HgSlguw==
X-Google-Smtp-Source: AGHT+IHQ2mVoYf0gISCrXjW928D9kOOj+nnB4kchHzakcfJ5+nTvY6NHkpDiRDXDUhEg1TfER0INKlLUgGq8Jiet7Nw=
X-Received: by 2002:ac2:4c9c:0:b0:503:18c3:d87a with SMTP id
 d28-20020ac24c9c000000b0050318c3d87amr5120311lfl.21.1695645212082; Mon, 25
 Sep 2023 05:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
 <20230922174649.GA3320366-robh@kernel.org> <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
 <CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
 <CAPnjgZ3BnD9aX3cNNPiGRKTOj+YeurHCLv6K0TRFhAtY21Qufw@mail.gmail.com> <20230925092122.0b615f25@xps-13>
In-Reply-To: <20230925092122.0b615f25@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 25 Sep 2023 06:33:14 -0600
Message-ID: <CAPnjgZ0Z5J_33HuQF-5XgDFmZim0nHHzvZJOOZobWw_cOJd=9g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, 
	Tom Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_053344_554964_F86C9AB5 
X-CRM114-Status: GOOD (  55.92  )
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

SGkgTWlxdWVsLAoKT24gTW9uLCAyNSBTZXB0IDIwMjMgYXQgMDE6MjEsIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgU2ltb24sCj4KPiBzamdA
Y2hyb21pdW0ub3JnIHdyb3RlIG9uIEZyaSwgMjIgU2VwIDIwMjMgMTM6NTE6MTQgLTA2MDA6Cj4K
PiA+IEhpIFJvYiwKPiA+Cj4gPiBPbiBGcmksIDIyIFNlcHQgMjAyMyBhdCAxMzo0MywgUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDIy
LCAyMDIzIGF0IDE6MTLigK9QTSBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBIaSBSb2IsCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIDIyIFNlcHQg
MjAyMyBhdCAxMTo0NiwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMTE6MDE6MThBTSAtMDYwMCwg
U2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiA+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gT24gRnJpLCAyMiBTZXB0IDIwMjMgYXQgMTA6MDAsIFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBTZXAg
MjEsIDIwMjMgYXQgMTo0NeKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBCaW5tYW5bMV0gaXMgYSB0b29sIGZv
ciBjcmVhdGluZyBmaXJtd2FyZSBpbWFnZXMuIEl0IGFsbG93cyB5b3UgdG8KPiA+ID4gPiA+ID4g
PiA+IGNvbWJpbmUgdmFyaW91cyBiaW5hcmllcyBhbmQgcGxhY2UgdGhlbSBpbiBhbiBvdXRwdXQg
ZmlsZS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBCaW5tYW4gdXNlcyBhIERUIHNj
aGVtYSB0byBkZXNjcmliZSBhbiBpbWFnZSwgaW4gZW5vdWdoIGRldGFpbCB0aGF0Cj4gPiA+ID4g
PiA+ID4gPiBpdCBjYW4gYmUgYXV0b21hdGljYWxseSBidWlsdCBmcm9tIGNvbXBvbmVudCBwYXJ0
cywgZGlzYXNzZW1ibGVkLAo+ID4gPiA+ID4gPiA+ID4gcmVwbGFjZWQsIGxpc3RlZCwgZXRjLgo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IEltYWdlcyBhcmUgdHlwaWNhbGx5IHN0b3Jl
ZCBpbiBmbGFzaCwgd2hpY2ggaXMgd2h5IHRoaXMgYmluZGluZyBpcwo+ID4gPiA+ID4gPiA+ID4g
dGFyZ2V0ZWQgYXQgbXRkLiBQcmV2aW91cyBkaXNjdXNzaW9uIGlzIGF0IFsyXSBbM10uCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gWzFdIGh0dHBzOi8vdS1ib290LnJlYWR0aGVkb2Nz
LmlvL2VuL3N0YWJsZS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwKPiA+ID4gPiA+ID4gPiA+
IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyMzA4MjExODAyMjAuMjcyNDA4
MC0zLXNqZ0BjaHJvbWl1bS5vcmcvCj4gPiA+ID4gPiA+ID4gPiBbM10gaHR0cHM6Ly93d3cuc3Bp
bmljcy5uZXQvbGlzdHMvZGV2aWNldHJlZS9tc2c2MjYxNDkuaHRtbAo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gWW91IG1pc3NlZDoKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvcHVsbC8xMTAKPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IHdoZXJlIEkgc2FpZDogV2UgY2VydGFpbmx5IHNob3VsZG4ndCBk
dXBsaWNhdGUgdGhlIGV4aXN0aW5nIHBhcnRpdGlvbnMKPiA+ID4gPiA+ID4gPiBiaW5kaW5ncy4g
V2hhdCdzIG1pc3NpbmcgZnJvbSB0aGVtIChJIGFzc3VtZSB3ZSdyZSBtb3N0bHkgdGFsa2luZwo+
ID4gPiA+ID4gPiA+IGFib3V0ICJmaXhlZC1wYXJ0aXRpb25zIiB3aGljaCBoYXMgYmVlbiBhcm91
bmQgZm9yZXZlciBJIHRoaW5rIChiZWZvcmUKPiA+ID4gPiA+ID4gPiBtZSkpPwo+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gVG8gcmVwZWF0LCB1bmxlc3MgdGhlcmUgaXMgc29tZSByZWFzb24g
YmlubWFuIHBhcnRpdGlvbnMgY29uZmxpY3Qgd2l0aAo+ID4gPiA+ID4gPiA+IGZpeGVkLXBhcnRp
dGlvbnMsIHlvdSBuZWVkIHRvIHN0YXJ0IHRoZXJlIGFuZCBleHRlbmQgaXQuIEZyb20gd2hhdCdz
Cj4gPiA+ID4gPiA+ID4gcG9zdGVkIGhlcmUsIGl0IG5laXRoZXIgY29uZmxpY3RzIG5vciBuZWVk
cyBleHRlbmRpbmcuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgdGhpbmsgYXQgdGhpcyBwb2lu
dCBJIGFtIGp1c3QgaG9wZWxlc3NseSBjb25mdXNlZC4gSGF2ZSB5b3UgdGFrZW4gYQo+ID4gPiA+
ID4gPiBsb29rIGF0IHRoZSBiaW5tYW4gc2NoZW1hPyBbMV0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBX
aHkgZG8gSSBuZWVkIHRvPyBUaGF0J3MgdXNlZCBmb3Igc29tZSB0b29sIGFuZCBoYXMgbm90aGlu
ZyB0byBkbyB3aXRoIGEKPiA+ID4gPiA+IGRldmljZSdzIERUQi4gSG93ZXZlciwgSSB0aG91Z2h0
IHNvbWV3aGVyZSBpbiB0aGlzIGRpc2N1c3Npb24geW91IHNob3dlZAo+ID4gPiA+ID4gaXQgdW5k
ZXIgYSBmbGFzaCBkZXZpY2Ugbm9kZS4KPiA+ID4gPgo+ID4gPiA+IFllcywgdGhhdCBpcyB0aGUg
aW50ZW50ICh1bmRlciBhIGZsYXNoIG5vZGUpLgo+ID4gPiA+Cj4gPiA+ID4gPiBUaGVuIEkgY2Fy
ZSBiZWNhdXNlIHRoZW4gaXQgb3ZlcmxhcHMgd2l0aAo+ID4gPiA+ID4gd2hhdCB3ZSBhbHJlYWR5
IGhhdmUgZm9yIHBhcnRpdGlvbnMuIElmIEkgbWlzdW5kZXJzdG9vZCB0aGF0LCB0aGVuIGp1c3QK
PiA+ID4gPiA+IHB1dCB5b3VyIHNjaGVtYSB3aXRoIHlvdXIgdG9vbC4gT25seSB1c2VycyBvZiB0
aGUgdG9vbCBzaG91bGQgY2FyZSBhYm91dAo+ID4gPiA+ID4gdGhlIHRvb2wncyBzY2hlbWEuCj4g
PiA+ID4KPiA+ID4gPiBPSy4gSSBiZWxpZXZlIHRoYXQgYmlubWFuIHdpbGwgZml0IGludG8gYm90
aCBjYW1wcywgc2luY2UgaXRzIGlucHV0IGlzCj4gPiA+ID4gbm90IG5lY2Vzc2FyaWx5IGZ1bGx5
IGZvcm1lZC4gRS5nLiBpZiB5b3UgZG9uJ3Qgc3BlY2lmeSB0aGUgb2Zmc2V0IG9mCj4gPiA+ID4g
YW4gZW50cnksIHRoZW4gaXQgd2lsbCBiZSBwYWNrZWQgYXV0b21hdGljYWxseS4gQnV0IHRoZSBv
dXRwdXQgaXMKPiA+ID4gPiBmdWxseSBmb3JtZWQsIGluIHRoYXQgQmlubWFuIG5vdyBrbm93cyB0
aGUgb2Zmc2V0IHNvIGNhbiB3cml0ZSBpdCB0bwo+ID4gPiA+IHRoZSBEVC4KPiA+ID4KPiA+ID4g
SSBzdXBwb3NlIGl0IGNvdWxkIHRha2UgaXRzIG93biBmb3JtYXQgYXMgaW5wdXQgYW5kIHRoZW4g
d3JpdGUgb3V0Cj4gPiA+IHNvbWV0aGluZyBkaWZmZXJlbnQgZm9yIHRoZSAib24gdGhlIGRldmlj
ZSIgZm9ybWF0IChpLmUuCj4gPiA+IGZpeGVkLXBhcnRpdGlvbnMpLiBBdCBsZWFzdCBmb3IgdGhl
IGR5bmFtaWMgb2Zmc2V0cywgd2UgbWF5IG5lZWQKPiA+ID4gc29tZXRoaW5nIGFsbG93ZWQgZm9y
IGJpbm1hbiBpbnB1dCwgYnV0IG5vdCBhbGxvd2VkIG9uIGRldmljZS4gSW4KPiA+ID4gZ2VuZXJh
bCwgdGhlcmUgaXMgc3VwcG9ydCBmb3IgcGFydGl0aW9ucyB3aXRob3V0IGFkZHJlc3Nlcy9vZmZz
ZXRzLAo+ID4gPiBidXQgb25seSBmb3IgcGFydGl0aW9ucyB0aGF0IGhhdmUgc29tZSBvdGhlciB3
YXkgdG8gZmlndXJlIHRoYXQgb3V0Cj4gPiA+IChvbiBkaXNrIHBhcnRpdGlvbiBpbmZvKS4KPiA+
ID4KPiA+ID4gVGhlcmUncyBhbHNvIHRoZSBpbWFnZSBmaWxlbmFtZSB3aGljaCBkb2Vzbid0IHJl
YWxseSBiZWxvbmcgaW4gdGhlIG9uCj4gPiA+IGRldmljZSBwYXJ0aXRpb25zLiBTbyBtYXliZSB0
aGUgaW5wdXQgYW5kIG91dHB1dCBzY2hlbWFzIHNob3VsZCBiZQo+ID4gPiBzZXBhcmF0ZS4KPiA+
Cj4gPiBPSywgSSdsbCBmb2N1cyBvbiB0aGUgb3V0cHV0IHNjaGVtYSBmb3Igbm93LiBJIHN1c3Bl
Y3QgdGhpcyB3aWxsIGJlIGEKPiA+IGdyZXkgYXJlYSB0aG91Z2guCj4gPgo+ID4gQXMgYW4gZXhh
bXBsZSwgaWYgeW91IHJlcGxhY2UgYSBiaW5hcnkgaW4gdGhlIGZpcm13YXJlLCBCaW5tYW4gY2Fu
Cj4gPiByZXBhY2sgdGhlIGZpcm13YXJlIHRvIG1ha2Ugcm9vbSwgcmVzcGVjdGluZyB0aGUgYWxp
Z25tZW50IGFuZCBzaXplCj4gPiBjb25zdHJhaW50cy4gU28gdGhlc2UgbmVlZCB0byBiZSBpbiB0
aGUgb3V0cHV0IHNjaGVtYSBzb21laG93Lgo+ID4KPiA+ID4KPiA+ID4gPiA+ID4gSSBzYXcgdGhp
cyBmaWxlLCB3aGljaCBzZWVtcyB0byBleHRlbmQgYSBwYXJ0aXRpb24uCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPgo+ID4gPiA+ID4gSUlSQywg
dGhhdCdzIGEgZGlmZmVyZW50IHR5cGUgd2hlcmUgcGFydGl0aW9uIGxvY2F0aW9ucyBhcmUgc3Rv
cmVkIGluCj4gPiA+ID4gPiB0aGUgZmxhc2gsIHNvIHdlIGRvbid0IG5lZWQgbG9jYXRpb24gYW5k
IHNpemUgaW4gRFQuCj4gPiA+ID4KPiA+ID4gPiBPSy4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gSSB3YXMgYXNzdW1pbmcgdGhhdCBJIHNob3VsZCBjcmVhdGUgYSB0
b3AtbGV2ZWwgY29tcGF0aWJsZSA9ICJiaW5tYW4iCj4gPiA+ID4gPiA+IG5vZGUsIHdpdGggc3Vi
bm9kZXMgbGlrZSBjb21wYXRpYmxlID0gImJpbm1hbixibDMxLWF0ZiIsIGZvciBleGFtcGxlLgo+
ID4gPiA+ID4gPiBJIHNob3VsZCB1c2UgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGluZGljYXRl
IHRoZSBjb250ZW50cywgcmlnaHQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVzIGZvciBzdWJub2Rl
cywgYW5kIHdlIGFscmVhZHkgaGF2ZSBzb21lIHNvbWV3aGF0IHN0YW5kYXJkIG9uZXMgZm9yCj4g
PiA+ID4gPiAidS1ib290IiBhbmQgInUtYm9vdC1lbnYiLiBUaG91Z2ggaGlzdG9yaWNhbGx5LCAi
bGFiZWwiIHdhcyB1c2VkLgo+ID4gPiA+Cj4gPiA+ID4gQmlubWFuIGhhcyBjb21tb24gcHJvcGVy
dGllcyBmb3IgYWxsIGVudHJpZXMsIGluY2x1ZGluZyAiY29tcHJlc3MiCj4gPiA+ID4gd2hpY2gg
c2V0cyB0aGUgY29tcHJlc3Npb24gYWxnb3JpdGhtLgo+ID4gPgo+ID4gPiBJIHNlZSBubyBpc3N1
ZSB3aXRoIGFkZGluZyB0aGF0LiBJdCBzZWVtcyB1c2VmdWwgYW5kIHNvbWV0aGluZyBtaXNzaW5n
Cj4gPiA+IGluIHRoZSBleGlzdGluZyBwYXJ0aXRpb24gc2NoZW1hcy4KPiA+Cj4gPiBPSyBJIHNl
bnQgYSBwYXRjaCB3aXRoIHRoYXQuCj4gPgo+ID4gPgo+ID4gPiA+IFNvIHBlcmhhcHMgSSBzaG91
bGQgc3RhcnQgYnkgZGVmaW5pbmcgYSBuZXcgYmlubWFuLGJsMzEtYXRmIHdoaWNoIGhhcwo+ID4g
PiA+IGNvbW1vbiBwcm9wZXJ0aWVzIGZyb20gYW4gImJpbm1hbixlbnRyeSIgZGVmaW5pdGlvbj8K
PiA+ID4KPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBiaW5tYW4gcHJlZml4LiBUaGUgY29u
dGVudHMgYXJlIEFURiAob3IgVEYtQQo+ID4gPiBub3cpLiBXaG8gd3JvdGUgaXQgdG8gdGhlIGZs
YXNoIGltYWdlIGlzIG5vdCByZWxldmFudC4KPiA+Cj4gPiBBcmUgeW91IHN1Z2dlc3RpbmcganVz
dCAiYXRmLWJsMzEiLCBvciAiYXJtLGF0Zi1ibDMxIiA/IE9yIHNob3VsZCB3ZQo+ID4gY2hhbmdl
IGl0IHRvICJ0ZmEtYmwzMSI/Cj4KPiBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoZSByZWxh
dGlvbnNoaXAgd2l0aCBURi1BIGhlcmUuIENhbid0IHdlCj4ganVzdCBoYXZlIGEga2luZCBvZiBm
aXhlZC1wYXJ0aXRpb25zIHdpdGggYWRkaXRpb25hbCBwcm9wZXJ0aWVzIGxpa2UKPiB0aGUgY29t
cHJlc3Npb24/CgpCaW5tYW4gbmVlZHMgdG8ga25vdyB3aGF0IHRvIHB1dCBpbiB0aGVyZSwgd2hp
Y2ggaXMgdGhlIHB1cnBvc2Ugb2YgdGhlCmNvbXBhdGlibGUgc3RyaW5nLgoKPgo+ID4gPiBXZSBh
bHJlYWR5IGhhdmUgc29tZSBjb21wYXRpYmxlcyBpbiB1c2UuIFdlIHNob3VsZCByZXVzZSB0aGVt
IGlmCj4gPiA+IHBvc3NpYmxlLiBOb3Qgc3VyZSBhYm91dCBURi1BIHRob3VnaC4KPiA+Cj4gPiBP
Sy4KPiA+Cj4KPiBBbHNvLCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2Yg
dGhpcyBzY2hlbWEuIFNvIGJpbm1hbgo+IGdlbmVyYXRlcyBhbiBpbWFnZSwgeW91IHdhbnQgdG8g
Zmxhc2ggdGhpcyBpbWFnZSBhbmQgeW91IHdvdWxkIGxpa2UgdGhlCj4gdG9vbCB0byBnZW5lcmF0
ZSB0aGUgY29ycmVzcG9uZGluZyAocGFydGl0aW9uKSBEVCBzbmlwcGV0IGF1dG9tYXRpY2FsbHku
Cj4gRG8gSSBnZXQgdGhpcyByaWdodD8gSSBkb24ndCBnZXQgd2h5IHlvdSB3b3VsZCBuZWVkIG5l
dyBjb21wYXRpYmxlcyBmb3IKPiB0aGF0LgoKSXQgaXMgYWN0dWFsbHkgdGhlIG90aGVyIHdheSBh
cm91bmQuIFRoZSBzY2hlbWEgdGVsbHMgQmlubWFuIGhvdyB0bwpidWlsZCB0aGUgaW1hZ2UgKHdo
YXQgZ29lcyBpbiB0aGVyZSBhbmQgd2hlcmUpLiBUaGVuIG91dHB1dHMgYW4KdXBkYXRlZCBEVCB3
aGljaCBkZXNjcmliZXMgd2hlcmUgZXZlcnl0aGluZyBlbmRlZCB1cCwgZm9yIHVzZSBieSBvdGhl
cgp0b29scywgZS5nLiBmaXJtd2FyZSB1cGRhdGUuIEl0IGlzIGEgY2xvc2VkIGxvb3AgaW4gdGhh
dCBzZW5zZS4gU2VlCnRoZSByZWZlcmVuY2VzIGZvciBtb3JlIGluZm9ybWF0aW9uLgoKUmVnYXJk
cywKU2ltb24KClsxXSBodHRwczovL3UtYm9vdC5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvZGV2
ZWxvcC9wYWNrYWdlL2luZGV4Lmh0bWwKWzJdIGh0dHBzOi8vcHJldGFseC5jb20vbWVkaWEvb3Nm
YzIwMTkvc3VibWlzc2lvbnMvWTdFTjlWL3Jlc291cmNlcy9CaW5tYW5fLV9BX2RhdGEtY29udHJv
bGxlZF9maXJtd2FyZV9wYWNrZXJfZm9yX1UtQl9wRlUzbjJLLnBkZgpbM10gaHR0cHM6Ly93d3cu
eW91dHViZS5jb20vd2F0Y2g/dj1MODR1amdVWEJPUQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
