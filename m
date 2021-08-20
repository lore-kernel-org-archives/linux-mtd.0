Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BA1C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 14:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093A3610FF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 14:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 093A3610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzxwbbXefbBx+6du/d//rv7HohKc5mnMhicGMj1oViI=; b=3wSdWuGHbYL3FJ
	wZoNkN4hWry1DLU2pHJ7COymMCWC8rl9JRQGbIVJStQCvaRfsbjvLwrQvy5z/L+Soj3oi6PmF4qMI
	xLC9IvI3MR+1dpsU2XvIW/WRwk/px58XoUHX4/nUgiEP30DUco6QV3lcQqE7dtwfXH/57K6A4uHLb
	zh9kAuWXSSonrlvr7lCl6xPjajixzejwmNF1umbg1geya509w06bBlyEa2/vVU2goVB/9nGKbN0Ni
	YEe9QG6jR3Y14dmnaEdo3I73oCgeLZ6noY8Iyy4Npd2fhhbukXgE5u82vSQ1Yl6hHDveKmKiGFT+J
	ZtdjPvw465pKhExn5jjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH5ew-00BOcZ-5Q; Fri, 20 Aug 2021 14:38:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH5eq-00BObv-M2
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 14:38:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DA099240004;
 Fri, 20 Aug 2021 14:38:03 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:38:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
Message-ID: <20210820163802.529482dd@xps13>
In-Reply-To: <11d173f2-2011-d029-e905-a10fdd0f2b85@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-9-a-nandan@ti.com>
 <20210806210146.3358a85b@xps13>
 <4d428465-59d7-6771-8344-c5090add2a06@ti.com>
 <20210820141413.6c519255@xps13>
 <11d173f2-2011-d029-e905-a10fdd0f2b85@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_073809_041773_52ACB7A8 
X-CRM114-Status: GOOD (  35.42  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBGcmks
IDIwIEF1ZyAyMDIxIDE5OjI0OjM0CiswNTMwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDIwLzA4
LzIxIDU6NDQgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBBcHVydmEsCj4gPiAKPiA+
IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24gRnJpLCAyMCBBdWcgMjAy
MSAxNjo1Njo1MAo+ID4gKzA1MzA6Cj4gPiAgIAo+ID4+IE9uIDA3LzA4LzIxIDEyOjMxIGFtLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IEhpIEFwdXJ2YSwKPiA+Pj4KPiA+Pj4gQXB1cnZh
IE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUsIDEzIEp1bCAyMDIxIDEzOjA1
OjMzCj4gPj4+ICswMDAwOiAgCj4gPj4+ICAgID4+Pj4gVGhlIFNQSSBOQU5EIGNvcmUgZG9lc24n
dCBrbm93IGhvdyB0byBzd2l0Y2ggdGhlIGZsYXNoIHRvIE9jdGFsIERUUiAgCj4gPj4+PiBtb2Rl
IChpLmUuIHdoaWNoIG9wZXJhdGlvbnMgdG8gcGVyZm9ybSkuIElmIHRoZSBtYW51ZmFjdHVyZXIg
aGFzbid0Cj4gPj4+PiBpbXBsZW1lbnRlZCB0aGUgb2N0YWxfZHRyX2VuYWJsZSgpIG1hbnVmYWN0
dXJlcl9vcCwgdGhlIFNQSSBOQU5EIGNvcmUKPiA+Pj4+IHdvdWxkbid0IGJlIGFibGUgdG8gc3dp
dGNoIHRvIDhELThELThEIG1vZGUgYW5kIHdpbGwgYWxzbyBub3QgYmUgYWJsZQo+ID4+Pj4gdG8g
cnVuIGluIDFTLTFTLTFTIG1vZGUgZHVlIHRvIGFscmVhZHkgc2VsZWN0ZWQgOEQtOEQtOEQgcmVh
ZC93cml0ZQo+ID4+Pj4gY2FjaGUgb3BfdGVtcGxhdGVzLgo+ID4+Pj4KPiA+Pj4+IFNvLCBhdm9p
ZCBjaG9vc2luZyBhIE9jdGFsIERUUiBTUEkgb3BfdGVtcGxhdGUgZm9yIHJlYWRfY2FjaGUsCj4g
Pj4+PiB3cml0ZV9jYWNoZSBhbmQgdXBkYXRlX2NhY2hlIG9wZXJhdGlvbnMsIGlmIHRoZSBtYW51
ZmFjdHVyZXJfb3AKPiA+Pj4+IG9jdGFsX2R0cl9lbmFibGUoKSBpcyBtaXNzaW5nLiAgCj4gPj4+
Cj4gPj4+IEFmdGVyIGxvb2tpbmcgYXQgeW91ciBwcmV2aW91cyBjb21taXQgSSBkb24ndCBzZWUg
d2h5IHRoaXMgcGF0Y2ggd291bGQKPiA+Pj4gYmUgbmVlZGVkLiBvY3RhbF9kdHJfZW5hYmxlKCkg
b25seSB1cGRhdGVzIHRoZSBtb2RlIHdoZW4gaXQgc3VjY2VlZHMgc28KPiA+Pj4gSSBkb24ndCB0
aGluayB0aGlzIHBhdGNoIGlzIHJlYWxseSBuZWVkZWQuICAKPiA+Pj4gICAgPj4gIAo+ID4+IEkg
YWRkZWQgaXQgdG8gcHJldmVudCBhbnkgZXJyb3JzIGhhcHBlbmluZyBkdWVzIHRvIGEgbWlzc2lu
ZyBpbXBsZW1lbnRhdGlvbiBvZiBvY3RhbF9kdHJfZW5hYmxlKCkgZnJvbSBtYW51ZmFjdHVyZXIg
ZHJpdmVyIHNpZGUuCj4gPj4gU28sIGlmIHRoZSBtYW51ZmFjdHVyZXJzIHNraXBzIHRoZSBvY3Rh
bF9kdHJfZW5hYmxlKCkgaW1wbGVtZW50YXRpb24sIHdlIHdhbnQgdGhlIHNwaW5hbmQgY29yZSB0
byBydW4gaW4gMXMtMXMtMXMgbW9kZS4gIAo+ID4gCj4gPiBJIHN0aWxsIGRvbid0IGdldCB0aGUg
cG9pbnQ6IHlvdSBmYWlsIHRoZSBwcm9iZSBpZiB0aGUgb2N0YWwgYml0IGlzCj4gPiBlbmFibGVk
IGJ1dCB0aGUgbWFudWZhY3R1cmVyIGRpZCBub3QgaW1wbGVtZW50IG9jdGFsX2R0cl9lbmFibGUo
KSwgc28KPiA+IGhvdyBjb3VsZCB3ZSBoYXZlIGlzc3Vlcz8gTWF5YmUgSSBhbSBvdmVybG9va2lu
ZyBzb21ldGhpbmcgdGhvdWdoLCBidXQKPiA+IHRoaXMgc2VlbWVkIGNvbXBsZXRlbHkgcmVkdW5k
YW50IHRvIG15IGV5ZXMgc28gZmFyLgo+ID4gICAKPiAKPiBPa2F5LCBJIGZlZWwgdGhpcyBtYXkg
YmUgcmVkdW5kYW50LiBUaGlzIGlzIGZvciB0aGUgY2FzZSB3aGVuIHRoZSBtYW51ZmFjdHVyZXIg
aGFzIGFkZGVkIE9jdGFsIERUUiByZWFkL3dyaXRlL3VwZGF0ZSBjYWNoZSB2YXJpYW50cyBidXQg
aGFzbid0IGltcGxlbWVudGVkIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgbWV0aG9kLgo+IAo+IFdp
dGhvdXQgdGhpcyBwYXRjaCwgdGhlIHByb2JlIHdvdWxkIGZhaWwsIGlmIHRoZSBtYW51ZmFjdHVy
ZXIgZGlkIG5vdCBpbXBsZW1lbnQgb2N0YWxfZHRyX2VuYWJsZSgpLiBCdXQgYWZ0ZXIgdXNpbmcg
dGhpcyBwYXRjaCwgc3BpbmFuZCBjYW4gc3RpbGwgdXNlIHRoZSBjaGlwIGluIDFzLTFzLTFzIG1v
ZGUgaW4gdGhhdCBjYXNlIGFuZCBqdXN0IHNraXAgdGhlIE9jdGFsIERUUiBvcCB2YXJpYW50cyBk
dXJpbmcgdGhlIHNlbGVjdGlvbi4gQW5kIGFsc28gdGhlIHByb2JlIHdvdWxkIHN1Y2NlZWQuCgpV
bmxlc3MgSSBhbSBvdmVybG9va2luZyBzb21ldGhpbmcgd2l0aCB0aGlzIHNlcmllcyBhcHBsaWVk
Cih3aXRoIG9yIHdpdGhvdXQgdGhpcyBwYXRjaCkgdGhlIHBvc3NpYmlsaXRpZXMgYXJlOgotIG5v
IG9jdGFsIGJpdCAtPiBjb250aW51ZSBhcyBiZWZvcmUKLSBvY3RhbCBiaXQgYW5kIHZlbmRvciBj
YWxsYmFjayAtPiB1c2VzIG9jdGFsIG1vZGUKLSBvY3RhbCBiaXQgYW5kIG5vIHZlbmRvciBjYWxs
YmFjayAtPiB3aWxsIHJldHVybiBhbiBlcnJvciBmcm9tCnNwaW5hbmRfaW5pdF9vY3RhbF9kdHJf
ZW5hYmxlKCkgd2hpY2ggd2lsbCBmYWlsIHRoZSBwcm9iZSAocGF0Y2ggNykKCkFueXdheSB3ZSBo
YXZlIGEgY2hvaWNlOgotIEVpdGhlciB3ZSBjb25zaWRlciB0aGUgdGFibGVzIGRlc2NyaWJpbmcg
Y2hpcHMgYXMgcHVyZSBkZXNjcmlwdGlvbnMKICBhbmQgd2UgY2FuIHN1cHBvcnQgdGhlc2UgY2hp
cHMgaW4gbW9kZSAxLTEtMSAod2lsbCByZXF1aXJlIGNoYW5nZXMgaW4KICB5b3VyIHNlcmllcyBh
cyB0aGlzIGlzIG5vdCB3aGF0IHlvdSBzdXBwb3J0IGFzIGZhciBhcyBJIHVuZGVyc3RhbmQKICB0
aGUgY29kZSkKLSBPciB3ZSBjb25zaWRlciB0aGVzZSB0YWJsZXMgYXMgIndoYXQgaXMgY3VycmVu
dGx5IHN1cHBvcnRlZCIgYW5kIGluCiAgdGhpcyBjYXNlIHdlIGp1c3QgZmFpbCBpZiBvbmUgYWRk
cyB0aGUgb2N0YWwgYml0IHdpdGhvdXQgYW55IGNhbGxiYWNrCiAgaW1wbGVtZW50YXRpb24uCgpJ
IHRoaW5rIHRoZSBsYXR0ZXIgaXMgYmV0dGVyIGZvciBub3cuIFdlIGNhbiB1cGRhdGUgdGhpcyBj
aG9pY2UgbGF0ZXIKaWYgbmVlZGVkIGFueXdheS4KCj4gCj4gPj4KPiA+PiBSZWFkL3dyaXRlL3Vw
ZGF0ZSBvcCB2YXJpYW50IHNlbGVjdGlvbiBoYXBwZW5zIGluIHNlbGVjdF9vcF92YXJpYW50KCks
IG11Y2ggYmVmb3JlIG9jdGFsX2R0cl9lbmFibGUoKS4gU28ganVzdCBjaGVjayBpZiB0aGVyZSBp
cyBhIGRlZmluaXRpb24gb2Ygb2N0YWxfZHRyX2VuYWJsZSBpbiBtYW51ZmFjdHVyZXIgb3BzIGFu
ZCB0aGVuIG9ubHkgdXNlIDhEIG9wIHZhcmlhbnRzLgo+ID4+Cj4gPj4gUmVtb3ZpbmcgdGhpcyB3
b3VsZG4ndCBicmVhayBhbnl0aGluZyBpbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4KPiA+
PiBEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhpcz8KPiA+PiAgCj4gPj4+Pgo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPgo+ID4+Pj4gLS0t
Cj4gPj4+PiAgICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCA3ICsrKysrKy0KPiA+Pj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4+
Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPj4+PiBpbmRleCAxOWQ4YWZmYWMwNTguLjg3MTFlODg3
Yjc5NSAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+
Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gPj4+PiBAQCAtMTAyOCw2ICsx
MDI4LDggQEAgc3RhdGljIGludCBzcGluYW5kX21hbnVmYWN0dXJlcl9tYXRjaChzdHJ1Y3Qgc3Bp
bmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gPj4+PiAgICAJCWlmIChpZFswXSAhPSBtYW51ZmFjdHVy
ZXItPmlkKQo+ID4+Pj4gICAgCQkJY29udGludWU7ICAKPiA+Pj4+ICAgID4+ICsJCXNwaW5hbmQt
Pm1hbnVmYWN0dXJlciA9IG1hbnVmYWN0dXJlcjsgIAo+ID4+Pj4gKwo+ID4+Pj4gICAgCQlyZXQg
PSBzcGluYW5kX21hdGNoX2FuZF9pbml0KHNwaW5hbmQsCj4gPj4+PiAgICAJCQkJCSAgICAgbWFu
dWZhY3R1cmVyLT5jaGlwcywKPiA+Pj4+ICAgIAkJCQkJICAgICBtYW51ZmFjdHVyZXItPm5jaGlw
cywKPiA+Pj4+IEBAIC0xMDM1LDcgKzEwMzcsNiBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbWFudWZh
Y3R1cmVyX21hdGNoKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPiA+Pj4+ICAgIAkJ
aWYgKHJldCA8IDApCj4gPj4+PiAgICAJCQljb250aW51ZTsgIAo+ID4+Pj4gICAgPj4gLQkJc3Bp
bmFuZC0+bWFudWZhY3R1cmVyID0gbWFudWZhY3R1cmVyOyAgCj4gPj4+PiAgICAJCXJldHVybiAw
Owo+ID4+Pj4gICAgCX0KPiA+Pj4+ICAgIAlyZXR1cm4gLUVOT1RTVVBQOwo+ID4+Pj4gQEAgLTEw
OTcsNiArMTA5OCwxMCBAQCBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCwKPiA+Pj4+ICAgIAkJdW5zaWduZWQgaW50IG5ieXRlczsKPiA+Pj4+
ICAgIAkJaW50IHJldDsgIAo+ID4+Pj4gICAgPj4gKwkJaWYgKHNwaW5hbmRfb3BfaXNfb2N0YWxf
ZHRyKCZvcCkgJiYgIAo+ID4+Pj4gKwkJICAgICFzcGluYW5kLT5tYW51ZmFjdHVyZXItPm9wcy0+
b2N0YWxfZHRyX2VuYWJsZSkKPiA+Pj4+ICsJCQljb250aW51ZTsKPiA+Pj4+ICsKPiA+Pj4+ICAg
IAkJbmJ5dGVzID0gbmFuZGRldl9wZXJfcGFnZV9vb2JzaXplKG5hbmQpICsKPiA+Pj4+ICAgIAkJ
CSBuYW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKTsgIAo+ID4+Pj4gICAgPiA+IFRoYW5rcywgIAo+ID4+
PiBNaXF1w6hsCj4gPj4+Cj4gPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4+PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKPiA+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvICAKPiA+Pj4gICAgPj4gIAo+ID4+IFRoYW5rcywKPiA+PiBBcHVydmEgTmFuZGFuICAK
PiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gICAKPiAKPiBU
aGFua3MsCj4gQXB1cnZhIE5hbmRhbgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
