Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F65ECF6499
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 10:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0A2Q5KSnwhe7elTVoz9qmkuI7VZklxDwZD2vV/oTRI=; b=THszKtwsHfSDFF
	cClDxZHoFzu9mT6uih58a4oioDzCVSH7QuvpZKITyxAZL+QZ+7J2lQjWcq9HfSn9NTHtakExRgB3O
	cfzc7oGhGta3GzjpEdkhOOWmQ0FKJLIEukdJZ64GOP01Lzt0tyRSGHnicEf/LjvWBDKPPt2MwN3yJ
	xxeoZhMMVpaLUKDvq0m9UGtN59QP9DXTYbtH/qS/XGxf01YFlLhG8lnmcBLHTKKfvLgZxVAgOvoml
	dSQ4JP2wv9KRq0ZwECJGgaEWcaiXgH3lXZEwSjAYC5XsTUAnG+2d1FxztuEf+11qXAALjtKChPnMC
	8VPviE+oHAXi2fukbewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1surYG-0000000EdbN-4B9N;
	Sun, 29 Sep 2024 10:53:20 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1surYE-0000000Edab-2KjC
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 10:53:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1surY2-000000007Ck-3WVz;
	Sun, 29 Sep 2024 10:53:06 +0000
Date: Sun, 29 Sep 2024 11:52:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, John Crispin <john@phrozen.org>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
Message-ID: <Zvkxi-6J8R1K95PQ@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
 <Zvf_84xxhxwpPgee@makrotopia.org>
 <18e9d774-813b-427e-9938-53853d695e18@kernel.org>
 <ZvgU0eBEwTJ3sHuN@makrotopia.org>
 <ad5a3811-c856-4f4b-f569-bb67a0e3f751@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad5a3811-c856-4f4b-f569-bb67a0e3f751@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_035318_624188_258C5570 
X-CRM114-Status: GOOD (  41.98  )
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

T24gU3VuLCBTZXAgMjksIDIwMjQgYXQgMTI6MDM6MTFQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzkvMjggMjI6MzgsIERhbmllbCBHb2xsZSDlhpnpgZM6Cj4gPiBPbiBT
YXQsIFNlcCAyOCwgMjAyNCBhdCAwMzo0NTo0OVBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+ID4gPiBPbiAyOC8wOS8yMDI0IDE1OjA5LCBEYW5pZWwgR29sbGUgd3JvdGU6Cj4g
PiA+ID4gT24gU2F0LCBTZXAgMjgsIDIwMjQgYXQgMDM6MDI6NDdQTSArMDIwMCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPiA+ID4gPiA+IE9uIDI4LzA5LzIwMjQgMTQ6NDcsIERhbmllbCBH
b2xsZSB3cm90ZToKPiA+ID4gPiA+ID4gQWRkIHRoZSAndm9sdW1lLWlzLWNyaXRpY2FsJyBib29s
ZWFuIHByb3BlcnR5IHdoaWNoIG1hcmtzIGEgVUJJIHZvbHVtZQo+ID4gPiA+ID4gPiBhcyBjcml0
aWNhbCBmb3IgdGhlIGRldmljZSB0byBib290LiBJZiBzZXQgaXQgcHJldmVudHMgdGhlIHVzZXIg
ZnJvbQo+ID4gPiA+ID4gPiBhbGwga2luZHMgb2Ygd3JpdGUgYWNjZXNzIHRvIHRoZSB2b2x1bWUg
YXMgd2VsbCBhcyBmcm9tIHJlbmFtaW5nIGl0IG9yCj4gPiA+ID4gPiA+IGRldGFjaGluZyB0aGUg
VUJJIGRldmljZSBpdCBpcyBsb2NhdGVkIG9uLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIEdvbGxlIDxkYW5pZWxAbWFrcm90b3BpYS5vcmc+Cj4gPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL3ViaS12b2x1bWUueWFtbCAgIHwgOSArKysrKysrKysKPiA+ID4gPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Vi
aS12b2x1bWUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy91Ymktdm9sdW1lLnlhbWwKPiA+ID4gPiA+ID4gaW5kZXggMTk3MzZiMjYwNTZiLi4y
YmQ3NTFiYjdmOWUgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91Ymktdm9sdW1lLnlhbWwKPiA+ID4gPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Vi
aS12b2x1bWUueWFtbAo+ID4gPiA+ID4gPiBAQCAtMjksNiArMjksMTUgQEAgcHJvcGVydGllczoK
PiA+ID4gPiA+ID4gICAgICAgZGVzY3JpcHRpb246Cj4gPiA+ID4gPiA+ICAgICAgICAgVGhpcyBj
b250YWluZXIgbWF5IHJlZmVyZW5jZSBhbiBOVk1FTSBsYXlvdXQgcGFyc2VyLgo+ID4gPiA+ID4g
PiArICB2b2x1bWUtaXMtY3JpdGljYWw6Cj4gPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IFRo
aXMgcGFyYW1ldGVyLCBpZiBwcmVzZW50LCBpbmRpY2F0ZXMgdGhhdCB0aGUgVUJJIHZvbHVtZQo+
ID4gPiA+ID4gPiArICAgICAgY29udGFpbnMgZWFybHktYm9vdCBmaXJtd2FyZSBpbWFnZXMgb3Ig
ZGF0YSB3aGljaCBzaG91bGQgbm90IGJlIGNsb2JiZXJlZC4KPiA+ID4gPiA+ID4gKyAgICAgIElm
IHNldCwgaXQgcHJldmVudHMgdGhlIHVzZXIgZnJvbSByZW5hbWluZyB0aGUgdm9sdW1lLCB3cml0
aW5nIHRvIGl0IG9yCj4gPiA+ID4gPiA+ICsgICAgICBtYWtpbmcgYW55IGNoYW5nZXMgYWZmZWN0
aW5nIGl0LCBhcyB3ZWxsIGFzIGRldGFjaGluZyB0aGUgVUJJIGRldmljZSBpdCBpcwo+ID4gPiA+
ID4gPiArICAgICAgbG9jYXRlZCBvbiwgc28gZGlyZWN0IGFjY2VzcyB0byB0aGUgdW5kZXJseWlu
ZyBNVEQgZGV2aWNlIGlzIHByZXZlbnRlZCBhcwo+ID4gPiA+ID4gPiArICAgICAgd2VsbC4KPiA+
ID4gPiA+ID4gKyAgICB0eXBlOiBib29sZWFuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFVCSSB2b2x1
bWVzIGFyZSBtYXBwaW5nIHRvIHBhcnRpdGlvbnMgMS10by0xLCByaWdodD8gU28gcmF0aGVyIEkg
d291bGQKPiA+ID4gPiA+IHByb3Bvc2UgdG8gdXNlIHBhcnRpdGlvbi55YW1sIC0gd2UgYWxyZWFk
eSBoYXZlIHJlYWQtb25seSB0aGVyZSB3aXRoCj4gPiA+ID4gPiB2ZXJ5IHNpbWlsYXIgZGVzY3Jp
cHRpb24uCj4gPiA+ID4gCj4gPiA+ID4gTm8sIHRoYXQncyBub3QgdGhlIGNhc2UuCj4gPiA+ID4g
Cj4gPiA+ID4gQW4gTVREIHBhcnRpdGlvbiBjYW4gYmUgdXNlZCBhcyBVQkkgZGV2aWNlLiBBIFVC
SSBkZXZpY2UgKGFuZCBoZW5jZSBNVEQKPiA+ID4gPiBwYXJ0aXRpb24pIGNhbiBob3N0ICpzZXZl
cmFsKiBVQkkgdm9sdW1lcy4KPiA+ID4gPiAKPiA+ID4gPiBNYXJraW5nIHRoZSBNVEQgcGFydGl0
aW9uIGFzICdyZWFkLW9ubHknIHdvbid0IHdvcmssIGFzIFVCSSBuZWVkcwo+ID4gPiA+IHJlYWQt
d3JpdGUgYWNjZXNzIHRvIHBlcmZvcm0gYmFkIGJsb2NrIHJlbG9jYXRpb24sIHNjcnViYmluZywg
Li4uCj4gPiA+IAo+ID4gPiBPSywgc28gbm90IHBhcnRpdGlvbiBidXQgcmVhZC1vbmx5IHZvbHVt
ZS4KPiA+IAo+ID4gKzEKPiA+IAo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBBbHNvLCB0eXBpY2Fs
bHkgbm90IGFsbCBVQkkgdm9sdW1lcyBvbiBhIFVCSSBkZXZpY2UgYXJlCj4gPiA+ID4gcmVhZC1v
bmx5L2NyaXRpY2FsIGJ1dCBvbmx5IGEgc3Vic2V0IG9mIHRoZW0uCj4gPiA+ID4gCj4gPiA+ID4g
QnV0IHlvdSBhcmUgcmlnaHQgdGhhdCB0aGUgZGVzY3JpcHRpb24gaXMgaW5zcGlyZWQgYnkgdGhl
IGRlc2NyaXB0aW9uCj4gPiA+ID4gb2YgdGhlICdyZWFkLW9ubHknIHByb3BlcnR5IGluIHBhcnRp
dGlvbi55YW1sIDspCj4gPiA+ID4gCj4gPiA+ID4gSSBpbml0aWFsbHkgdGhvdWdodCB0byBhbHNv
IG5hbWUgdGhlIHByb3BlcnR5ICdyZWFkLW9ubHknLCBqdXN0IGxpa2UKPiA+ID4gPiBmb3IgTVRE
IHBhcnRpdGlvbnMuIEhvd2V2ZXIsIGFzIHRoZSBkZXNpcmVkIGVmZmVjdCBnb2VzIGJleW9uZAo+
ID4gPiA+IHByZXZlbnRpbmcgd3JpdGUgYWNjZXNzIHRvIHRoZSB2b2x1bWUgaXRzZWxmLCBJIHRo
b3VnaHQgaXQnZCBiZQo+ID4gPiA+IGJldHRlciB0byB1c2UgYSBuZXcgbmFtZS4KPiA+ID4gCj4g
PiA+IFllYWgsIG1heWJlLi4uIGNyaXRpY2FsIGluZGVlZCBjb3ZlcnMgbXVsdGlwbGUgY2FzZXMg
YnV0IGlzIGFsc28KPiA+ID4gc3ViamVjdGl2ZS4gRm9yIHNvbWUgYm9vdGxvYWRlciBpcyBjcml0
aWNhbCwgZm9yIG90aGVyIGJvb3Rsb2FkZXIgc3RpbGwKPiA+ID4gbWlnaHQgYmUgZnVsbHkgQS9C
IHVwZGF0ZWFibGUgdGh1cyBjb3VsZCBiZSBtb2RpZmlhYmxlLiBGb3Igb3RoZXJzLCB0aGV5Cj4g
PiA+IHdhbnQgdG8gdXNlIGZ3X3NldGVudiBmcm9tIHVzZXItc3BhY2Ugc28gbm90IGNyaXRpY2Fs
IGF0IGFsbC4KPiA+IAo+ID4gVGhlIGNhc2UgSSB3YW50IHRvIGNvdmVyIGhlcmUgaXMgdGhlIGJv
b3Rsb2FkZXIgaXRzZWxmIGJlaW5nIHN0b3JlZAo+ID4gaW5zaWRlIGEgVUJJIHZvbHVtZS4gTWVk
aWFUZWsncyBmb3JrIG9mIEFSTSBUcnVzdGVkRmlybXdhcmUtQSBibDIgY29tZXMKPiA+IHdpdGgg
c3VwcG9ydCBmb3IgVUJJIGFuZCBsb2FkcyBCTDMgKHdoaWNoIGlzIFRGLUEgQkwzMSBhbmQgVS1C
b290LCBhbmQKPiA+IG1heWJlIE9QLVRFRSBhcyB3ZWxsKSBmcm9tIGEgc3RhdGljIFVCSSB2b2x1
bWUuIFJlbW92aW5nLCByZW5hbWluZyBvcgo+ID4gYWx0ZXJpbmcgdGhhdCB2b2x1bWUgcmVzdWx0
cyBpbiB0aGUgZGV2aWNlIG5vdCBiZWluZyBhYmxlIHRvIGJvb3QgYW55Cj4gPiBtb3JlIGFuZCBy
ZXF1aXJpbmcgYSBjb21wbGljYXRlZCBpbnRlcnZlbnRpb24gKGF0IGF0dGFjaGluZyBkZWJ1Z2dp
bmcKPiA+IFVBUlQgYW5kIHVzaW5nIGxvdy1sZXZlbCByZWNvdmVyeSB0b29sKSBpbiBvcmRlciB0
byByZWNvdmVyLgo+IAo+IFdobyByZW1vdmVzL3JlbmFtZXMgdGhlICdjcml0aWNhbCcgdm9sdW1l
PyBJIHN1Z2dlc3QgdG8gZml4IGl0IGluIHRoZSB1cHBlcgo+IGxheWVyKG5vdCBpbiBrZXJuZWwp
LiBBZnRlciBsb29raW5nIHRocm91Z2ggdGhlIHBhdGNoIDIsIGl0IHNlZW1zIGEgaGFjawo+IHNv
bHV0aW9uLgoKVGhlIGVuZW15IGlzIHRoZSB1c2VyLCB0aGUgdXBwZXIgbGF5ZXIgaXMgYmV0d2Vl
biB0aGUga2V5Ym9hcmQgYW5kIHRoZQpzY3JlZW4uIEp1c3QgbGlrZSBmb3IgJ3JlYWQtb25seScg
TVREIHBhcnRpdGlvbnMgSSdtIGxvb2tpbmcKZm9yIGEgc2ltaWxhciBzb2x1dGlvbiBmb3IgVUJJ
IHdoaWNoIHByZXZlbnRzIHRoZSB1c2VyIGZyb20gYWNjaWRlbnRhbGx5CmRlbGV0aW5nIG9yIGRl
c3Ryb3lpbmcgdGhlIGJvb3Rsb2FkZXIsIGxldHMgc2F5LCB3aGVuIGxvZ2dlZCBpbiB2aWEgU1NI
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
