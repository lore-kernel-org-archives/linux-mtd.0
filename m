Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27473C47258
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jan 2024 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwCMaRP1V6QL25aFmHBQL7YUM6lp9FcDCHGpcEBhDjo=; b=z5Mb6WJZ0Qjnmj
	hgJkqy2igAXsbRNx6V4z3J8a5TtTC+/rTX14RrXiN6dLvTuleU71a8wU2+lOhhhz7puRX6bsplEyV
	U4BKN4YiP/4YxBDKDj95W3qIiU3M1g1+R4doJRsBbnSE7oEsqEqBAoTtQpOjalCf1pLZkZeG/LWTF
	peSd/xtUzlzI+9SpuaSocdMZ2w9q2EvA+w+wG6uMwPU44vy/K8ytH7Nny2PQV9MvW/2sQj+khrEDz
	5i3rjZpC2pBUj6Sdi6aJ2KdywEy/IumRrX+aaVfIM/uqPy20fnXMrZsC1F3j4/pbbIRD+VyRGCbhi
	AWzkZ/H6SxSk6H+SOs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ8HV-00HXZ2-10;
	Wed, 17 Jan 2024 15:56:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ8HP-00HXYU-02
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jan 2024 15:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE3856167B
	for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2024 15:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7F9C433B1
	for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2024 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705506997;
	bh=ptXYt1hCdovZz/ffSWT9gyAHt7rRwgYj2ew+MlFtyNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cRiBZ2Es/hp4k2N4q8iUn7Gg6G7WRx6Enx6NzwR0pvs1Uo+PJaPHaN7erZz9hslNv
	 oJ7sqEw1Gm4XNo9zvyHyBuflt9WlyERaBGdNjvStedufPMloODdbHhUJirOzDWC+8X
	 zVp4JrJ/gaV0VdW1ge5sqw0homVaw3Vc/e2SizUHaye7MACpqpVvpFCg/vFe6MBz1u
	 bgnYht1IvQbsvC5pfXFx6HqJc0SdU7EZMACNFbDBzeekUAJ687dDajvzJw2G1QTSiI
	 bwYUDUdmE4eHB+SBxhjQhqYhK29d3CioXGWhhlWOuEMZFh0a6Eu7tsz6DzSkSNNYQr
	 KPpk+usdP0Kqg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e766937ddso12704871e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2024 07:56:37 -0800 (PST)
X-Gm-Message-State: AOJu0YyjROq+eqLh6/Spg2WvtLgYr2DjRVQkdX1prIEqA9AAhLo7yogD
	WMzD5shOrNqN7x0Xj1En+8zlMIQ8ywGtj3w/dQ==
X-Google-Smtp-Source: AGHT+IGaf7OO/QIwbRtFIzzCYIwu/CbtDrVi9rgtHOA0Oa7uryO/EzrtchbYZmaVI0oi/aGjQ3nl2bIJQVjlGNvIzlI=
X-Received: by 2002:a05:6512:b87:b0:50e:a9db:9b89 with SMTP id
 b7-20020a0565120b8700b0050ea9db9b89mr5288051lfv.13.1705506995412; Wed, 17 Jan
 2024 07:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com>
 <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
 <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
 <20231214172702.GA617226-robh@kernel.org> <CAPnjgZ2oJSGPO91Y_aLbe+v250WFrND4n3T0mOvhERYidVu=eQ@mail.gmail.com>
 <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
In-Reply-To: <CAFLszTizRRVbRO6_ygE2X-Lp5dENWSc4uMGL5GPJAFGAbRdCyQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 17 Jan 2024 09:56:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
Message-ID: <CAL_Jsq+j7_KZtQ2ENq9+vsw0LOZF=spu293_G=AxOmBM+m_f-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_075639_161149_8D03B999 
X-CRM114-Status: GOOD (  42.50  )
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

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCAzOjU04oCvUE0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1
bS5vcmc+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMjow
OeKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBS
b2IsCj4gPgo+ID4gT24gVGh1LCAxNCBEZWMgMjAyMyBhdCAxMDoyNywgUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0
IDAzOjU4OjEwUE0gLTA3MDAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4gPiA+IEhpIFJvYiwKPiA+
ID4gPgo+ID4gPiA+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAxNDo1NiwgUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gRnJpLCBEZWMgOCwg
MjAyMyBhdCAxMTo0N+KAr0FNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPiB3cm90ZToK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGkgUm9iLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBP
biBGcmksIDggRGVjIDIwMjMgYXQgMDg6MDAsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMg
YXQgMTA6Mjg6NTBBTSAtMDcwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBB
ZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgYmlubWFuLCBzbyB3ZSBjYW4gZXh0ZW5kIGZpeGVk
LXBhcnRpdGlvbnMKPiA+ID4gPiA+ID4gPiA+IGluIHZhcmlvdXMgd2F5cy4KPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHbGFzcyA8c2pnQGNocm9t
aXVtLm9yZz4KPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IChubyBjaGFuZ2VzIHNpbmNlIHY1KQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
IENoYW5nZXMgaW4gdjU6Cj4gPiA+ID4gPiA+ID4gPiAtIEFkZCAjYWRkcmVzcy9zaXplLWNlbGxz
IGFuZCBwYXJ0ZXJuUHJvcGVydGllcwo+ID4gPiA+ID4gPiA+ID4gLSBEcm9wICRyZWYgdG8gZml4
ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+ID4gPiAtIERyb3AgJ3NlbGVjdDogZmFsc2Un
Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPiA+
ID4gPiA+IC0gQ2hhbmdlIHN1YmplY3QgbGluZQo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gPiA+ID4gPiAtIERyb3AgZml4ZWQtcGFydGl0aW9u
IGFkZGl0aW9uYWwgY29tcGF0aWJsZSBzdHJpbmcKPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBmaXhl
ZC1wYXJ0aXRpb25zIGZyb20gdGhlIGV4YW1wbGUKPiA+ID4gPiA+ID4gPiA+IC0gTWVudGlvbiB1
c2Ugb2YgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIGxhYmVsCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiA+IC0gRHJvcCBtZW50aW9uIG9m
ICdlbmhhbmNlZCBmZWF0dXJlcycgaW4gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gPiA+
ID4gPiAtIE1lbnRpb24gQmlubWFuIGlucHV0IGFuZCBvdXRwdXQgcHJvcGVydGllcwo+ID4gPiA+
ID4gPiA+ID4gLSBVc2UgcGxhaW4gcGFydGl0aW9uQHh4eCBmb3IgdGhlIG5vZGUgbmFtZQo+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
YmlubWFuLnlhbWwgICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4g
PiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbCAgIHwgIDEgKwo+
ID4gPiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrCj4gPiA+ID4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRp
b25zKCspCj4gPiA+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4ueWFtbAo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKPiA+ID4gPiA+ID4g
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjMyOTIxNzU1MGE5OAo+ID4gPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4g
PiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2Jpbm1hbi55YW1sCj4gPiA+ID4gPiA+ID4gPiBAQCAtMCwwICsxLDY4IEBACj4gPiA+ID4g
PiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xh
dXNlKQo+ID4gPiA+ID4gPiA+ID4gKyMgQ29weXJpZ2h0IDIwMjMgR29vZ2xlIExMQwo+ID4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiA+ID4gPiA+ID4gKy0t
LQo+ID4gPiA+ID4gPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRk
L3BhcnRpdGlvbnMvYmlubWFuLnlhbWwjCj4gPiA+ID4gPiA+ID4gPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiA+ID4gPiArdGl0bGU6IEJpbm1hbiBmaXJtd2FyZSBsYXlvdXQKPiA+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiA+ID4gPiA+ICsg
IC0gU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4gPiA+ID4gPiA+ICsgIFRoZSBiaW5tYW4g
bm9kZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUsIHVzZWQgd2hlbiBwYWNrYWdpbmcg
ZmlybXdhcmUKPiA+ID4gPiA+ID4gPiA+ICsgIGZyb20gbXVsdGlwbGUgcHJvamVjdHMuIEl0IGlz
IGJhc2VkIG9uIGZpeGVkLXBhcnRpdGlvbnMsIHdpdGggc29tZQo+ID4gPiA+ID4gPiA+ID4gKyAg
ZXh0ZW5zaW9ucywgYnV0IHVzZXMgJ2NvbXBhdGlibGUnIHRvIGluZGljYXRlIHRoZSBjb250ZW50
cyBvZiB0aGUgbm9kZSwgdG8KPiA+ID4gPiA+ID4gPiA+ICsgIGF2b2lkIHBlcnR1cmJpbmcgb3Ig
Y29uZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hpY2ggdXNlICdsYWJlbCcgZm9yIGEK
PiA+ID4gPiA+ID4gPiA+ICsgIHBhcnRpY3VsYXIgcHVycG9zZS4KPiA+ID4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gPiA+ICsgIEJpbm1hbiBzdXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQgYXMgaW5w
dXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdpbmcgcHJvY2VzcywKPiA+ID4gPiA+ID4gPiA+ICsg
IHN1Y2ggYXMgdGhvc2Ugd2hpY2ggY29udHJvbCBhbGlnbm1lbnQgb2YgcGFydGl0aW9ucy4gVGhp
cyBiaW5kaW5nIGFkZHJlc3Nlcwo+ID4gPiA+ID4gPiA+ID4gKyAgdGhlc2UgJ2lucHV0JyBwcm9w
ZXJ0aWVzLiBGb3IgZXhhbXBsZSwgaXQgaXMgY29tbW9uIGZvciB0aGUgJ3JlZycgcHJvcGVydHkK
PiA+ID4gPiA+ID4gPiA+ICsgIChhbiAnb3V0cHV0JyBwcm9wZXJ0eSkgdG8gYmUgc2V0IGJ5IEJp
bm1hbiwgYmFzZWQgb24gdGhlIGFsaWdubWVudCByZXF1ZXN0ZWQKPiA+ID4gPiA+ID4gPiA+ICsg
IGluIHRoZSBpbnB1dC4KPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICsgIE9uY2Ug
cHJvY2Vzc2luZyBpcyBjb21wbGV0ZSwgaW5wdXQgcHJvcGVydGllcyBoYXZlIG1vc3RseSBzZXJ2
ZWQgdGhlaXIKPiA+ID4gPiA+ID4gPiA+ICsgIHB1cnBvc2UsIGF0IGxlYXN0IHVudGlsIHRoZSBm
aXJtd2FyZSBpcyByZXBhY2tlZCBsYXRlciwgZS5nLiBkdWUgdG8gYQo+ID4gPiA+ID4gPiA+ID4g
KyAgZmlybXdhcmUgdXBkYXRlLiBUaGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIGJpbmRpbmcgc2hvdWxk
IHByb3ZpZGUgZW5vdWdoCj4gPiA+ID4gPiA+ID4gPiArICBpbmZvcm1hdGlvbiB0byByZWFkIHRo
ZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVzc2lvbiBpZgo+ID4gPiA+
ID4gPiA+ID4gKyAgbmVlZGVkLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSG93IGlzIHRo
aXMgZ29pbmcgdG8gd29yayBleGFjdGx5PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5kIHRo
ZW4KPiA+ID4gPiA+ID4gPiB3cml0ZXMgb3V0ICdmaXhlZC1wYXJ0aXRpb25zJyBub2Rlcy4gQnV0
IHRoZW4geW91J3ZlIGxvc3QgdGhlIGJpbm1hbgo+ID4gPiA+ID4gPiA+IHNwZWNpZmMgcGFydHMg
bmVlZGVkIGZvciByZXBhY2tpbmcuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE5vLCB0aGV5IGFy
ZSB0aGUgc2FtZSBub2RlLiBJIGRvIHdhbnQgdGhlIGV4dHJhIGluZm9ybWF0aW9uIHRvIHN0aWNr
Cj4gPiA+ID4gPiA+IGFyb3VuZC4gU28gbG9uZyBhcyBpdCBpcyBjb21wYXRpYmxlIHdpdGggZml4
ZWQtcGFydGl0aW9uIGFzIHdlbGwsIHRoaXMKPiA+ID4gPiA+ID4gc2hvdWxkIHdvcmsgT0suCj4g
PiA+ID4gPgo+ID4gPiA+ID4gSG93IGNhbiBpdCBiZSBib3RoPyBUaGUgcGFydGl0aW9ucyBub2Rl
IGNvbXBhdGlibGUgY2FuIGJlIGVpdGhlcgo+ID4gPiA+ID4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9y
ICdiaW5tYW4nLgo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHdlIG5vdCBhbGxvdyBpdCB0byBiZSBib3Ro
PyBJIGhhdmUgdHJpZWQgdG8gYWRqdXN0IHRoaW5ncyBpbgo+ID4gPiA+IHJlc3BvbnNlIHRvIGZl
ZWRiYWNrIGJ1dCBwZXJoYXBzIHRoZSBmZWVkYmFjayB3YXMgbGVhZGluZyBtZSBkb3duIHRoZQo+
ID4gPiA+IHdyb25nIHBhdGg/Cj4gPiA+Cj4gPiA+IFN1cmUsIGJ1dCB0aGVuIHRoZSBzY2hlbWEg
aGFzIHRvIGFuZCB0aGF0IG1lYW5zIGV4dGVuZGluZwo+ID4gPiBmaXhlZC1wYXJ0aXRpb25zLgo+
ID4KPiA+IENhbiB3ZSBjcm9zcyB0aGF0IGJyaWRnZSBsYXRlcj8gVGhlcmUgbWlnaHQgYmUgcmVz
aXN0YW5jZSB0byBpdC4gSSdtCj4gPiBub3Qgc3VyZS4gRm9yIG5vdywgcGVyaGFwcyBqdXN0IGEg
YmlubWFuIGNvbXBhdGlibGUgd29ya3Mgd2VsbCBlbm91Z2gKPiA+IHRvIG1ha2UgcHJvZ3Jlc3Mu
Cj4KPiBJcyB0aGVyZSBhbnkgd2F5IHRvIG1ha2UgcHJvZ3Jlc3Mgb24gdGhpcz8gSSB3b3VsZCBs
aWtlIHRvIGhhdmUKPiBzb2Z0d2FyZSB3aGljaCBkb2Vzbid0IHVuZGVyc3RhbmQgdGhlIGJpbm1h
biBjb21wYXRpYmxlIHRvIGF0IGxlYXN0IGJlCj4gYWJsZSB0byB1bmRlcnN0YW5kIHRoZSBmaXhl
ZC1wYXJ0aXRpb24gY29tcGF0aWJsZS4gSXMgdGhhdCBhY2NlcHRhYmxlPwoKVGhlcmUncyBvbmx5
IDIgd2F5cyB0aGF0IGl0IGNhbiB3b3JrLiBFaXRoZXIgYmlubWFuIHdyaXRlcyBvdXQKZml4ZWQt
cGFydGl0aW9uIG5vZGVzIGRyb3BwaW5nL3JlcGxhY2luZyBhbnl0aGluZyBvbmx5IGRlZmluZWQg
Zm9yCmJpbm1hbiBvciBmaXhlZC1wYXJ0aXRpb24gaXMgZXh0ZW5kZWQgdG8gaW5jbHVkZSB3aGF0
IGJpbm1hbiBuZWVkcy4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
