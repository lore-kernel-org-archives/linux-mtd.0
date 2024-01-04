Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E0C47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugwcnmAPqznLFy4IfBIvQBEW+55HQZhqhk02232Z0+c=; b=cmrJX4OCoadQyu
	4bynhbxmaIktYXPWSXnlidU9husA3A1vdxhOg9c6alCclekfwfG7ngXzAXrq2xpZO9kN1kLe87cGa
	7Tl0zLzWXNEcxXGKZXb5Y5mt+MP4BrFPB5lfxL4bWm8tndcocMjNpGONCTFX4WBNdQkfHlzDIf9GG
	TtjzcoOZxky6ra6c+FTC96rlVBEhs6Cau1tU9daKIscJnxLzTCL9I2MI7qUJV8yKxU6z++7S7P9e2
	rjCThkVZp/SPqHzHM46a4a/eE3vu5UOL4b7G+4AsHMmCgOLGZGG0MYrvtkdKECYz8JFcUslcA2y2b
	xLus/lGxzdZJ6RlR8ACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLVfw-00FItY-0Z;
	Thu, 04 Jan 2024 21:54:52 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLVft-00FIt6-2I
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 21:54:51 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-680d1908fb2so4292716d6.3
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jan 2024 13:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704405288; x=1705010088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHu/9yYjuNs9M6rsUIsCrmi3APbGPXR8WfnnSC4pWIc=;
        b=O+t93NBG5TtvUubgPFfZXKiL4pbQWMuGNWNKbibW3QGEQfeE8nrrggbratbgqj6chs
         cUi+6yDEPmHWIlQGN4/lABHDiaHDxolBXqljF4MHfLCHwaZK57XYfIGDk1k+KOv5P/XM
         oxieaRJc6Cp61lhjAw1QPSR8HFNEdv0DxaRLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704405288; x=1705010088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHu/9yYjuNs9M6rsUIsCrmi3APbGPXR8WfnnSC4pWIc=;
        b=NlLMe0xSIib43krRh0C5pN8GW+8m+McHbAZfqmisntBQhzcVol1zXoRSgQ+wzrylnD
         IJ8bTt8NmkszXqWXT01F/GrOiOw42ycm6E/S93LTaQBX/LWhPwuhNJVCMy+jOm5clO4a
         0/WeDtmRfTHkHeEuoj87rY82m1IqtWkvgCzxqRrjb2LSVUy4SPauYPPqgp/+d/tDMhuT
         jfYRCPY731ytyxJzG+5C2lcMFEr3BoW6RznejfudUDoV+gE6NqvQKgQsQlaxYUHHqR9I
         UEH57xN6yhtXLPJGwg2pzHs21ylAZiaJLxJGoReWA73REsttp9poY2I6we384W2N6BQ+
         CpIw==
X-Gm-Message-State: AOJu0YylFe8NKe+2myT7KjMm/kzXf8FZ/mEk+iqBnbdAGk6K/4LaVG51
	jMBB11GUjRp4RbxzbnhkpncaL8OoBGaoao8ay4M0NssE4JRV
X-Google-Smtp-Source: AGHT+IFuqeDMdG4zBQldI5XyvT6/jarUq5+fL5rEaozsnTJloLarXEyiTxEWhTea3tqeSV9UrqYBu0DbQI4IMlO5FpU=
X-Received: by 2002:a05:6214:2305:b0:67f:7c5c:3434 with SMTP id
 gc5-20020a056214230500b0067f7c5c3434mr1242635qvb.73.1704405287791; Thu, 04
 Jan 2024 13:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
 <20231214172702.GA617226-robh@kernel.org> <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 4 Jan 2024 14:54:36 -0700
Message-ID: <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_135449_771629_B94F31FA 
X-CRM114-Status: GOOD (  41.75  )
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

SGkgUm9iLAoKT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMjowOeKAr1BNIFNpbW9uIEdsYXNzIDxz
amdAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IE9uIFRodSwgMTQgRGVjIDIw
MjMgYXQgMTA6MjcsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDAzOjU4OjEwUE0gLTA3MDAsIFNpbW9uIEdsYXNzIHdy
b3RlOgo+ID4gPiBIaSBSb2IsCj4gPiA+Cj4gPiA+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAxNDo1
NiwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBP
biBGcmksIERlYyA4LCAyMDIzIGF0IDExOjQ34oCvQU0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1
bS5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiBGcmksIDggRGVjIDIwMjMgYXQgMDg6MDAsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBUaHUsIE5vdiAxNiwgMjAy
MyBhdCAxMDoyODo1MEFNIC0wNzAwLCBTaW1vbiBHbGFzcyB3cm90ZToKPiA+ID4gPiA+ID4gPiBB
ZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgYmlubWFuLCBzbyB3ZSBjYW4gZXh0ZW5kIGZpeGVk
LXBhcnRpdGlvbnMKPiA+ID4gPiA+ID4gPiBpbiB2YXJpb3VzIHdheXMuCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9y
Zz4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IChubyBjaGFu
Z2VzIHNpbmNlIHY1KQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NToK
PiA+ID4gPiA+ID4gPiAtIEFkZCAjYWRkcmVzcy9zaXplLWNlbGxzIGFuZCBwYXJ0ZXJuUHJvcGVy
dGllcwo+ID4gPiA+ID4gPiA+IC0gRHJvcCAkcmVmIHRvIGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+
ID4gPiA+ID4gPiA+IC0gRHJvcCAnc2VsZWN0OiBmYWxzZScKPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+ID4gPiA+ID4gLSBDaGFuZ2Ugc3ViamVjdCBsaW5l
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiA+ID4gPiA+
IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb24gYWRkaXRpb25hbCBjb21wYXRpYmxlIHN0cmluZwo+ID4g
PiA+ID4gPiA+IC0gRHJvcCBmaXhlZC1wYXJ0aXRpb25zIGZyb20gdGhlIGV4YW1wbGUKPiA+ID4g
PiA+ID4gPiAtIE1lbnRpb24gdXNlIG9mIGNvbXBhdGlibGUgaW5zdGVhZCBvZiBsYWJlbAo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiAtIERy
b3AgbWVudGlvbiBvZiAnZW5oYW5jZWQgZmVhdHVyZXMnIGluIGZpeGVkLXBhcnRpdGlvbnMueWFt
bAo+ID4gPiA+ID4gPiA+IC0gTWVudGlvbiBCaW5tYW4gaW5wdXQgYW5kIG91dHB1dCBwcm9wZXJ0
aWVzCj4gPiA+ID4gPiA+ID4gLSBVc2UgcGxhaW4gcGFydGl0aW9uQHh4eCBmb3IgdGhlIG5vZGUg
bmFtZQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9iaW5tYW4ueWFtbCAgICAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+
ID4gPiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbCAgIHwgIDEg
Kwo+ID4gPiA+ID4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKwo+ID4gPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlv
bnMoKykKPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4gPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMjkyMTc1
NTBhOTgKPiA+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1s
Cj4gPiA+ID4gPiA+ID4gQEAgLTAsMCArMSw2OCBAQAo+ID4gPiA+ID4gPiA+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gPiA+ID4g
KyMgQ29weXJpZ2h0IDIwMjMgR29vZ2xlIExMQwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiArJVlBTUwgMS4yCj4gPiA+ID4gPiA+ID4gKy0tLQo+ID4gPiA+ID4gPiA+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sIwo+ID4g
PiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gK3RpdGxlOiBCaW5tYW4gZmly
bXdhcmUgbGF5b3V0Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICttYWludGFpbmVyczoK
PiA+ID4gPiA+ID4gPiArICAtIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+ID4gPiArICBU
aGUgYmlubWFuIG5vZGUgcHJvdmlkZXMgYSBsYXlvdXQgZm9yIGZpcm13YXJlLCB1c2VkIHdoZW4g
cGFja2FnaW5nIGZpcm13YXJlCj4gPiA+ID4gPiA+ID4gKyAgZnJvbSBtdWx0aXBsZSBwcm9qZWN0
cy4gSXQgaXMgYmFzZWQgb24gZml4ZWQtcGFydGl0aW9ucywgd2l0aCBzb21lCj4gPiA+ID4gPiA+
ID4gKyAgZXh0ZW5zaW9ucywgYnV0IHVzZXMgJ2NvbXBhdGlibGUnIHRvIGluZGljYXRlIHRoZSBj
b250ZW50cyBvZiB0aGUgbm9kZSwgdG8KPiA+ID4gPiA+ID4gPiArICBhdm9pZCBwZXJ0dXJiaW5n
IG9yIGNvbmZ1c2luZyBleGlzdGluZyBpbnN0YWxsYXRpb25zIHdoaWNoIHVzZSAnbGFiZWwnIGZv
ciBhCj4gPiA+ID4gPiA+ID4gKyAgcGFydGljdWxhciBwdXJwb3NlLgo+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiArICBCaW5tYW4gc3VwcG9ydHMgcHJvcGVydGllcyB1c2VkIGFzIGlucHV0
cyB0byB0aGUgZmlybXdhcmUtcGFja2FnaW5nIHByb2Nlc3MsCj4gPiA+ID4gPiA+ID4gKyAgc3Vj
aCBhcyB0aG9zZSB3aGljaCBjb250cm9sIGFsaWdubWVudCBvZiBwYXJ0aXRpb25zLiBUaGlzIGJp
bmRpbmcgYWRkcmVzc2VzCj4gPiA+ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVz
LiBGb3IgZXhhbXBsZSwgaXQgaXMgY29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4g
PiA+ID4gPiArICAoYW4gJ291dHB1dCcgcHJvcGVydHkpIHRvIGJlIHNldCBieSBCaW5tYW4sIGJh
c2VkIG9uIHRoZSBhbGlnbm1lbnQgcmVxdWVzdGVkCj4gPiA+ID4gPiA+ID4gKyAgaW4gdGhlIGlu
cHV0Lgo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICBPbmNlIHByb2Nlc3NpbmcgaXMg
Y29tcGxldGUsIGlucHV0IHByb3BlcnRpZXMgaGF2ZSBtb3N0bHkgc2VydmVkIHRoZWlyCj4gPiA+
ID4gPiA+ID4gKyAgcHVycG9zZSwgYXQgbGVhc3QgdW50aWwgdGhlIGZpcm13YXJlIGlzIHJlcGFj
a2VkIGxhdGVyLCBlLmcuIGR1ZSB0byBhCj4gPiA+ID4gPiA+ID4gKyAgZmlybXdhcmUgdXBkYXRl
LiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIGJpbmRpbmcgc2hvdWxkIHByb3ZpZGUgZW5vdWdoCj4g
PiA+ID4gPiA+ID4gKyAgaW5mb3JtYXRpb24gdG8gcmVhZCB0aGUgZmlybXdhcmUgYXQgcnVudGlt
ZSwgaW5jbHVkaW5nIGRlY29tcHJlc3Npb24gaWYKPiA+ID4gPiA+ID4gPiArICBuZWVkZWQuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhvdyBpcyB0aGlzIGdvaW5nIHRvIHdvcmsgZXhhY3RseT8g
YmlubWFuIHJlYWRzIHRoZXNlIG5vZGVzIGFuZCB0aGVuCj4gPiA+ID4gPiA+IHdyaXRlcyBvdXQg
J2ZpeGVkLXBhcnRpdGlvbnMnIG5vZGVzLiBCdXQgdGhlbiB5b3UndmUgbG9zdCB0aGUgYmlubWFu
Cj4gPiA+ID4gPiA+IHNwZWNpZmMgcGFydHMgbmVlZGVkIGZvciByZXBhY2tpbmcuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gTm8sIHRoZXkgYXJlIHRoZSBzYW1lIG5vZGUuIEkgZG8gd2FudCB0aGUgZXh0
cmEgaW5mb3JtYXRpb24gdG8gc3RpY2sKPiA+ID4gPiA+IGFyb3VuZC4gU28gbG9uZyBhcyBpdCBp
cyBjb21wYXRpYmxlIHdpdGggZml4ZWQtcGFydGl0aW9uIGFzIHdlbGwsIHRoaXMKPiA+ID4gPiA+
IHNob3VsZCB3b3JrIE9LLgo+ID4gPiA+Cj4gPiA+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBUaGUg
cGFydGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+ICdmaXhlZC1w
YXJ0aXRpb25zJyBvciAnYmlubWFuJy4KPiA+ID4KPiA+ID4gQ2FuIHdlIG5vdCBhbGxvdyBpdCB0
byBiZSBib3RoPyBJIGhhdmUgdHJpZWQgdG8gYWRqdXN0IHRoaW5ncyBpbgo+ID4gPiByZXNwb25z
ZSB0byBmZWVkYmFjayBidXQgcGVyaGFwcyB0aGUgZmVlZGJhY2sgd2FzIGxlYWRpbmcgbWUgZG93
biB0aGUKPiA+ID4gd3JvbmcgcGF0aD8KPiA+Cj4gPiBTdXJlLCBidXQgdGhlbiB0aGUgc2NoZW1h
IGhhcyB0byBhbmQgdGhhdCBtZWFucyBleHRlbmRpbmcKPiA+IGZpeGVkLXBhcnRpdGlvbnMuCj4K
PiBDYW4gd2UgY3Jvc3MgdGhhdCBicmlkZ2UgbGF0ZXI/IFRoZXJlIG1pZ2h0IGJlIHJlc2lzdGFu
Y2UgdG8gaXQuIEknbQo+IG5vdCBzdXJlLiBGb3Igbm93LCBwZXJoYXBzIGp1c3QgYSBiaW5tYW4g
Y29tcGF0aWJsZSB3b3JrcyB3ZWxsIGVub3VnaAo+IHRvIG1ha2UgcHJvZ3Jlc3MuCgpJcyB0aGVy
ZSBhbnkgd2F5IHRvIG1ha2UgcHJvZ3Jlc3Mgb24gdGhpcz8gSSB3b3VsZCBsaWtlIHRvIGhhdmUK
c29mdHdhcmUgd2hpY2ggZG9lc24ndCB1bmRlcnN0YW5kIHRoZSBiaW5tYW4gY29tcGF0aWJsZSB0
byBhdCBsZWFzdCBiZQphYmxlIHRvIHVuZGVyc3RhbmQgdGhlIGZpeGVkLXBhcnRpdGlvbiBjb21w
YXRpYmxlLiBJcyB0aGF0IGFjY2VwdGFibGU/CklmIG5vdCwgd2hhdCBpcz8KCkluIGFueSBjYXNl
LCBwbGVhc2UgY2FuIHlvdSBoZWxwIHdpdGggdGhpcz8KClJlZ2FyZHMsClNpbW9uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
