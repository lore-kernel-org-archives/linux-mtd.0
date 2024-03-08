Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4431BC54E4A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MoxmRP0WYFvHJ56jkCwcVEAApBOlOtj/Al24Fu+Cyg=; b=PZSq3EKvxnHHIQ
	MYhV8gPc6LMcd1BwxB+tvg6PGq08YjKkdXH08wqJ9wjajvp7tN2apU49ypU6oMe+okivMgXcyGDsD
	fMjkoF5V58O5eOcLDhwUrn17mYLqPDJpzgq6iu6/wubjtjjs+rH0aFOKjq/IH6uA9mbL0xmvbsXj1
	8Clbj4ZK6qj7OF7JKWOZSD98RkUuKwR2ULcO8ZvzC014yWWmuh1efzQLBJ66qwfT5w3Jldqg5UKTZ
	GNzj231StivFjyeqH4yPjosxfNMiFgdYNbX9mcIdV1ZP18ZcPU0O+tK6OlkFuQKMA7IhJIRvMYsHe
	WI+IIsRZzQ9tDinLpKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVxH-00000008QQx-2AXG;
	Fri, 08 Mar 2024 08:51:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUrz-00000008BjY-0SVv
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 07:42:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBB4760005;
	Fri,  8 Mar 2024 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709883735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkispZ2cSgHHvQHUKtQPYvm4JRgYfxl+31ZzbV0ajJQ=;
	b=gLlv8wGxjiogeG9C46oG5EgFoqN4SH1b9sabNz5g3QO62yEOKg3XJIQW0hFi2a4mlTo9/J
	wDoyd7Ks0a9nOehGgDBetroeoVaVTpjSUCvwUdrENEVJ9GDuL1UA1UNTIwOIUkdVv7PDl0
	HLNnzR8Dn0hQvEKvIyQYWURylmHBn7971Bw1G7BDNxLq55CYjsQOW+BxO91WXoQ2oMPJVa
	BRg5CV53PmNRQlKzjl1MjxvhcrVmwlRk7/L9gakI8vPJfBh17Jt0/24YwSwpQHdYgAzNV6
	1MSXvZT0koXMkeBdc5LURUgoUaMY53WPEDVkI+xX8/0aO6DbnEZN41o86mVc5A==
Date: Fri, 8 Mar 2024 08:42:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, Michael Walle
 <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman
 compatible
Message-ID: <20240308084212.4aa58761@xps-13>
In-Reply-To: <CAFLszTh3t6wPz8PFhFzazTAGaLVpObkjY9qv7MtSkQ21zZFzKA@mail.gmail.com>
References: <20231116172859.393744-1-sjg@chromium.org>
	<20231208150042.GA1278773-robh@kernel.org>
	<CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
	<CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
	<CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
	<20231214172702.GA617226-robh@kernel.org>
	<CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
	<CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
	<CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
	<CAFLszTimaFw9sf=JKvQXG4fS6V_2T=2n+pfvYLCiuG1o+7cHPA@mail.gmail.com>
	<20240205085056.44278f2c@xps-13>
	<CAFLszTi+8ygXOidnhxj7sdJwc6X5i+++QvnUyfe-kde5eSts_w@mail.gmail.com>
	<20240205131755.3462084f@xps-13>
	<CAFLszTh3t6wPz8PFhFzazTAGaLVpObkjY9qv7MtSkQ21zZFzKA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_234219_449182_4205BCFA 
X-CRM114-Status: GOOD (  47.87  )
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

SGkgU2ltb24sCgpzamdAY2hyb21pdW0ub3JnIHdyb3RlIG9uIEZyaSwgOCBNYXIgMjAyNCAxNTo0
NDoyNSArMTMwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIFR1ZSwgNiBGZWIgMjAyNCBhdCAwMTox
NywgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkgU2ltb24sCj4gPiAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArZGVzY3JpcHRp
b246IHwKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIFRoZSBiaW5tYW4gbm9kZSBwcm92
aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcgZmlybXdhcmUK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGZyb20gbXVsdGlwbGUgcHJvamVjdHMuIEl0
IGlzIGJhc2VkIG9uIGZpeGVkLXBhcnRpdGlvbnMsIHdpdGggc29tZQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gKyAgZXh0ZW5zaW9ucywgYnV0IHVzZXMgJ2NvbXBhdGlibGUnIHRvIGluZGlj
YXRlIHRoZSBjb250ZW50cyBvZiB0aGUgbm9kZSwgdG8KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ICsgIGF2b2lkIHBlcnR1cmJpbmcgb3IgY29uZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlv
bnMgd2hpY2ggdXNlICdsYWJlbCcgZm9yIGEKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
IHBhcnRpY3VsYXIgcHVycG9zZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQg
YXMgaW5wdXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICsgIHN1Y2ggYXMgdGhvc2Ugd2hpY2ggY29udHJvbCBhbGlnbm1lbnQg
b2YgcGFydGl0aW9ucy4gVGhpcyBiaW5kaW5nIGFkZHJlc3Nlcwo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9wZXJ0aWVzLiBGb3IgZXhhbXBsZSwgaXQgaXMg
Y29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgIChhbiAnb3V0cHV0JyBwcm9wZXJ0eSkgdG8gYmUgc2V0IGJ5IEJpbm1hbiwgYmFzZWQgb24g
dGhlIGFsaWdubWVudCByZXF1ZXN0ZWQKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGlu
IHRoZSBpbnB1dC4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBjb21wbGV0ZSwgaW5wdXQgcHJvcGVy
dGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ICsgIHB1cnBvc2UsIGF0IGxlYXN0IHVudGlsIHRoZSBmaXJtd2FyZSBpcyByZXBhY2tlZCBsYXRl
ciwgZS5nLiBkdWUgdG8gYQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZmlybXdhcmUg
dXBkYXRlLiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIGJpbmRpbmcgc2hvdWxkIHByb3ZpZGUgZW5v
dWdoCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBpbmZvcm1hdGlvbiB0byByZWFkIHRo
ZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVzc2lvbiBpZgo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgbmVlZGVkLiAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBIb3cgaXMgdGhpcyBnb2luZyB0byB3b3JrIGV4
YWN0bHk/IGJpbm1hbiByZWFkcyB0aGVzZSBub2RlcyBhbmQgdGhlbgo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+IHdyaXRlcyBvdXQgJ2ZpeGVkLXBhcnRpdGlvbnMnIG5vZGVzLiBCdXQgdGhlbiB5
b3UndmUgbG9zdCB0aGUgYmlubWFuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gc3BlY2lmYyBw
YXJ0cyBuZWVkZWQgZm9yIHJlcGFja2luZy4gIAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBObywgdGhleSBhcmUgdGhlIHNhbWUgbm9kZS4gSSBkbyB3YW50
IHRoZSBleHRyYSBpbmZvcm1hdGlvbiB0byBzdGljawo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBh
cm91bmQuIFNvIGxvbmcgYXMgaXQgaXMgY29tcGF0aWJsZSB3aXRoIGZpeGVkLXBhcnRpdGlvbiBh
cyB3ZWxsLCB0aGlzCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHNob3VsZCB3b3JrIE9LLiAgCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSG93IGNhbiBpdCBiZSBi
b3RoPyBUaGUgcGFydGl0aW9ucyBub2RlIGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9yICdiaW5tYW4nLiAgCj4gPiA+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gPiBDYW4gd2Ugbm90IGFsbG93IGl0IHRvIGJl
IGJvdGg/IEkgaGF2ZSB0cmllZCB0byBhZGp1c3QgdGhpbmdzIGluCj4gPiA+ID4gPiA+ID4gPiA+
ID4gcmVzcG9uc2UgdG8gZmVlZGJhY2sgYnV0IHBlcmhhcHMgdGhlIGZlZWRiYWNrIHdhcyBsZWFk
aW5nIG1lIGRvd24gdGhlCj4gPiA+ID4gPiA+ID4gPiA+ID4gd3JvbmcgcGF0aD8gIAo+ID4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBTdXJlLCBidXQgdGhlbiB0aGUgc2NoZW1hIGhh
cyB0byBhbmQgdGhhdCBtZWFucyBleHRlbmRpbmcKPiA+ID4gPiA+ID4gPiA+ID4gZml4ZWQtcGFy
dGl0aW9ucy4gIAo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IENhbiB3ZSBjcm9zcyB0
aGF0IGJyaWRnZSBsYXRlcj8gVGhlcmUgbWlnaHQgYmUgcmVzaXN0YW5jZSB0byBpdC4gSSdtCj4g
PiA+ID4gPiA+ID4gPiBub3Qgc3VyZS4gRm9yIG5vdywgcGVyaGFwcyBqdXN0IGEgYmlubWFuIGNv
bXBhdGlibGUgd29ya3Mgd2VsbCBlbm91Z2gKPiA+ID4gPiA+ID4gPiA+IHRvIG1ha2UgcHJvZ3Jl
c3MuICAKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IElzIHRoZXJlIGFueSB3YXkgdG8gbWFr
ZSBwcm9ncmVzcyBvbiB0aGlzPyBJIHdvdWxkIGxpa2UgdG8gaGF2ZQo+ID4gPiA+ID4gPiA+IHNv
ZnR3YXJlIHdoaWNoIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGUgYmlubWFuIGNvbXBhdGlibGUgdG8g
YXQgbGVhc3QgYmUKPiA+ID4gPiA+ID4gPiBhYmxlIHRvIHVuZGVyc3RhbmQgdGhlIGZpeGVkLXBh
cnRpdGlvbiBjb21wYXRpYmxlLiBJcyB0aGF0IGFjY2VwdGFibGU/ICAKPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gVGhlcmUncyBvbmx5IDIgd2F5cyB0aGF0IGl0IGNhbiB3b3JrLiBFaXRoZXIgYmlu
bWFuIHdyaXRlcyBvdXQKPiA+ID4gPiA+ID4gZml4ZWQtcGFydGl0aW9uIG5vZGVzIGRyb3BwaW5n
L3JlcGxhY2luZyBhbnl0aGluZyBvbmx5IGRlZmluZWQgZm9yCj4gPiA+ID4gPiA+IGJpbm1hbiBv
ciBmaXhlZC1wYXJ0aXRpb24gaXMgZXh0ZW5kZWQgdG8gaW5jbHVkZSB3aGF0IGJpbm1hbiBuZWVk
cy4gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IE9LLCB0aGVuIEkgc3VwcG9zZSB0aGUgYmVzdCB3YXkg
aXMgdG8gYWRkIGEgbmV3IGJpbm1hbiBjb21wYXRpYmxlLCBhcwo+ID4gPiA+ID4gaXMgZG9uZSB3
aXRoIHRoaXMgdjYgc2VyaWVzLiBQZW9wbGUgdGhlbiBuZWVkIHRvIGNob29zZSBpdCBpbnN0ZWFk
IG9mCj4gPiA+ID4gPiBmaXhlZC1wYXJ0aXRpb24uICAKPiA+ID4gPgo+ID4gPiA+IEknbSBzb3Jy
eSB0aGlzIGlzIG5vdCBhdCBhbGwgd2hhdCBSb2Igc3VnZ2VzdGVkLCBvciBkaWQgSSB0b3RhbGx5
Cj4gPiA+ID4gbWlzdW5kZXJzdGFuZCBoaXMgYW5zd2VyPwo+ID4gPiA+Cj4gPiA+ID4gSW4gYm90
aCBjYXNlcyB0aGUgc29sdXRpb24gaXMgdG8gZ2VuZXJhdGUgYSAiZml4ZWQtcGFydGl0aW9uIiBu
b2RlLiBOb3cKPiA+ID4gPiB1cCB0byB5b3UgdG8gZGVjaWRlIHdoZXRoZXIgYmlubWFuIHNob3Vs
ZCBhZGFwdCB0aGUgb3V0cHV0IHRvIHRoZQo+ID4gPiA+IGN1cnJlbnQgc2NoZW1hLCBvciBpZiB0
aGUgY3VycmVudCBzY2hlbWEgc2hvdWxkIGJlIGV4dGVuZGVkIHRvCj4gPiA+ID4gdW5kZXJzdGFu
ZCBhbGwgYmlubWFuJ3Mgb3V0cHV0Lgo+ID4gPiA+Cj4gPiA+ID4gQXQgbGVhc3QgdGhhdCBpcyBt
eSB1bmRlcnN0YW5kaW5nIGFuZCBhbHNvIHdoYXQgSSBraW5kIG9mIGFncmVlIHdpdGguICAKPiA+
ID4KPiA+ID4gSSBkbyB3YW50IHRvIGJpbm1hbiBzY2hlbWEgdG8gaW5jbHVkZSBhbGwgdGhlIGZl
YXR1cmVzIG9mIEJpbm1hbi4KPiA+ID4KPiA+ID4gU28gYXJlIHlvdSBzYXlpbmcgdGhhdCB0aGVy
ZSBzaG91bGQgbm90IGJlIGEgJ2Jpbm1hbicgIHNjaGVtYSwgYnV0IEkKPiA+ID4gc2hvdWxkIGp1
c3QgYWRkIGFsbCB0aGUgYmlubWFuIHByb3BlcnRpZXMgdG8gdGhlIGZpeGVkLXBhcnRpdGlvbgo+
ID4gPiBzY2hlbWE/ICAKPiA+Cj4gPiBUaGlzIGlzIG15IGN1cnJlbnQgdW5kZXJzdGFuZGluZywg
eWVzLiBCdXQgYWNrbm93bGVkZ21lbnQgZnJvbSBSb2IgaXMKPiA+IGFsc28gd2VsY29tZS4gIAo+
IAo+IEkgYW0gdHJ5aW5nIGFnYWluIHRvIHdhZGUgdGhyb3VnaCBhbGwgdGhlIGNvbmZ1c2lvbiBo
ZXJlLgo+IAo+IFRoZXJlIGlzIG5vdCBhY3R1YWxseSBhICdmaXhlZC1wYXJ0aXRpb24nIG5vZGUu
IFNvIGFyZSB5b3Ugc2F5aW5nIEkKPiBzaG91bGQgYWRkIG9uZT8gVGhlcmUgaXMgYWxyZWFkeSBh
ICdwYXJ0aXRpb25zJyBub2RlLiBXb24ndCB0aGV5Cj4gY29uZmxpY3Q/CgpTb3JyeSBmb3IgdGhl
IGNvbmZ1c2lvbiwgdGhlcmUgaXMgYSAncGFydGl0aW9ucycgbm9kZSBpbmRlZWQuIFRoaXMKbm9k
ZSBzaGFsbCBkZWNsYXJlIGl0J3MgInByb2dyYW1taW5nIG1vZGVsIiAobGV0J3Mgc2F5KSwgaWUu
IGhvdyBpdApzaG91bGQgYmUgcGFyc2VkLiBXaGF0IGRlZmluZXMgdGhpcyBwcm9ncmFtbWluZyBt
b2RlbCB0b2RheSBpcyB0aGUKJ2ZpeGVkLXBhcnRpdGlvbnMnIGNvbXBhdGlibGUuIEkgdGhpbmsg
d2UgKFJvYiBhbmQgbXlzZWxmLCBidXQgYWdhaW4sClJvYiwgcGxlYXNlIGNvbmZpcm0pIGFncmVl
IG9uIHRoZSBmYWN0IHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBkdXBsaWNhdGUKdGhlIGZpeGVkLXBh
cnRpdGlvbnMgY29tcGF0aWJsZS9sb2dpYyBhbmQgdGh1cyB0aGUgYmlubWFuIGNvbXBhdGlibGUK
d2FzIHJlamVjdGVkLgoKSGVuY2UsIGluIG9yZGVyIHRvIG1vdmUgZm9yd2FyZCwgSSB3b3VsZCBk
ZWZpbml0ZWx5IGFwcHJlY2lhdGUgYW4KdXBkYXRlIG9mIHRoZSBmaXhlZC1wYXJ0aXRpb25zIGJp
bmRpbmcgaW4gb3JkZXIgdG8gc3VwcG9ydCB3aGF0IGJpbm1hbgpjYW4gZ2VuZXJhdGUuCgpXZSBh
cmUgaGVyZSB0YWxraW5nIGFib3V0IHRoZSBvdXRwdXQgb2YgYmlubWFuLCBub3QgaXRzIGlucHV0
LiBUQkggSQpoYXZlbid0IHVuZGVyc3Rvb2QgdGhlIHBvaW50IGluIGhhdmluZyBiaW5tYW4ncyBp
bnB1dCBwYXJzZWQgYnkgdGhlCmdlbmVyaWMgeWFtbCBiaW5kaW5nLiBJIHdvdWxkIGFkdmlzZSB0
byBmb2N1cyBvbiBiaW5tYW4ncyBvdXRwdXQgZmlyc3QKYmVjYXVzZSBpdCBmZWVscyBtb3JlIHJl
bGV2YW50LCBhdCBhIGZpcnN0IGdsYW5jZS4KCj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlv
dSB0byBsb29rIGF0IG15IHBhdGNoZXMgYW5kIHN1Z2dlc3QKPiBzb21ldGhpbmc/IEkgdGhpbmsg
YXQgdGhpcyBwb2ludCwgYWZ0ZXIgc28gbWFueSBob3VycyBvZiB0cnlpbmcKPiBkaWZmZXJlbnQg
dGhpbmdzIGFuZCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IGlzIG5lZWRlZCwgSSBjb3VsZAo+
IHJlYWxseSB1c2UgYSBsaXR0bGUgaGVscC4KCkkgaG9wZSB0aGUgYWJvdmUgZGV0YWlscyB3aWxs
IGhlbHAuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
