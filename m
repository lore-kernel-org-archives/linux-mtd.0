Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67992C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F136113B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26F136113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3WPqmPEGiVFb8HM41zUJwZoJE4I8lEjFuLcAUvHaY8=; b=rMm4aJfqssAQHPauAVJ9A5X9+F
	xRH53RwkWyjlJInpl6XHDj3V5pFozAuZvsYrlkADlqZW+Pya2nHoId4XxRbrG4ry2aqoO9SsEl1lz
	JDnLhyVLsi+fo70JM0QanlVi3eCtDLuBOXzL/4wdoG67G8w3PW3dIZgaHqDakI3TTOiXoFf7q2z+P
	qhYmSNrBs5n3J/OvWWz6TmOXbSghLEeLIDOVByfAqO51ofEFtm/HWz5o9UJ//dP22EDaIptGpQaIl
	U9SHRNvIQwika/hMnzpvydl0i+/wgkR6Jy2QcUwGf4nBvRZEUk56J5mVvBuBiFAPbZMBWuUmhUVc+
	qGiMnLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH4z1-00BL6a-OT; Fri, 20 Aug 2021 13:54:55 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH4yw-00BL5Q-3w
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 13:54:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KDseA2093976;
 Fri, 20 Aug 2021 08:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629467680;
 bh=ZTEkCbfVveh63g8MrqRX7KoRq3oOMeKH00MGady+1Fw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UJituv4+gXNZfvuhyeVDflXh9Es++8u2u/iAOP2v4gU8hcz7tRVUtjCFP284vErRZ
 CqEj1NUuymJZeMpc3+00jVdoJ8ZumNVvPHNQ5QV80OX+8lfz3HqjbyfNpNXuqrDHml
 gkPK8oYKNgmDfdRIUxj6/LcDcPAM+agDWtNmtkZs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KDse6A049821
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 08:54:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 08:54:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 08:54:39 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KDsZ50130304;
 Fri, 20 Aug 2021 08:54:36 -0500
Subject: Re: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-9-a-nandan@ti.com> <20210806210146.3358a85b@xps13>
 <4d428465-59d7-6771-8344-c5090add2a06@ti.com> <20210820141413.6c519255@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <11d173f2-2011-d029-e905-a10fdd0f2b85@ti.com>
Date: Fri, 20 Aug 2021 19:24:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820141413.6c519255@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_065450_292428_1A7D7A6F 
X-CRM114-Status: GOOD (  27.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDIwLzA4LzIxIDU6NDQgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgQXB1cnZhLAo+IAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24g
RnJpLCAyMCBBdWcgMjAyMSAxNjo1Njo1MAo+ICswNTMwOgo+IAo+PiBPbiAwNy8wOC8yMSAxMjoz
MSBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIEFwdXJ2YSwKPj4+Cj4+PiBBcHVydmEg
TmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6
MzMKPj4+ICswMDAwOgo+Pj4gICAgCj4+Pj4gVGhlIFNQSSBOQU5EIGNvcmUgZG9lc24ndCBrbm93
IGhvdyB0byBzd2l0Y2ggdGhlIGZsYXNoIHRvIE9jdGFsIERUUgo+Pj4+IG1vZGUgKGkuZS4gd2hp
Y2ggb3BlcmF0aW9ucyB0byBwZXJmb3JtKS4gSWYgdGhlIG1hbnVmYWN0dXJlciBoYXNuJ3QKPj4+
PiBpbXBsZW1lbnRlZCB0aGUgb2N0YWxfZHRyX2VuYWJsZSgpIG1hbnVmYWN0dXJlcl9vcCwgdGhl
IFNQSSBOQU5EIGNvcmUKPj4+PiB3b3VsZG4ndCBiZSBhYmxlIHRvIHN3aXRjaCB0byA4RC04RC04
RCBtb2RlIGFuZCB3aWxsIGFsc28gbm90IGJlIGFibGUKPj4+PiB0byBydW4gaW4gMVMtMVMtMVMg
bW9kZSBkdWUgdG8gYWxyZWFkeSBzZWxlY3RlZCA4RC04RC04RCByZWFkL3dyaXRlCj4+Pj4gY2Fj
aGUgb3BfdGVtcGxhdGVzLgo+Pj4+Cj4+Pj4gU28sIGF2b2lkIGNob29zaW5nIGEgT2N0YWwgRFRS
IFNQSSBvcF90ZW1wbGF0ZSBmb3IgcmVhZF9jYWNoZSwKPj4+PiB3cml0ZV9jYWNoZSBhbmQgdXBk
YXRlX2NhY2hlIG9wZXJhdGlvbnMsIGlmIHRoZSBtYW51ZmFjdHVyZXJfb3AKPj4+PiBvY3RhbF9k
dHJfZW5hYmxlKCkgaXMgbWlzc2luZy4KPj4+Cj4+PiBBZnRlciBsb29raW5nIGF0IHlvdXIgcHJl
dmlvdXMgY29tbWl0IEkgZG9uJ3Qgc2VlIHdoeSB0aGlzIHBhdGNoIHdvdWxkCj4+PiBiZSBuZWVk
ZWQuIG9jdGFsX2R0cl9lbmFibGUoKSBvbmx5IHVwZGF0ZXMgdGhlIG1vZGUgd2hlbiBpdCBzdWNj
ZWVkcyBzbwo+Pj4gSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIHJlYWxseSBuZWVkZWQuCj4+
PiAgICAKPj4KPj4gSSBhZGRlZCBpdCB0byBwcmV2ZW50IGFueSBlcnJvcnMgaGFwcGVuaW5nIGR1
ZXMgdG8gYSBtaXNzaW5nIGltcGxlbWVudGF0aW9uIG9mIG9jdGFsX2R0cl9lbmFibGUoKSBmcm9t
IG1hbnVmYWN0dXJlciBkcml2ZXIgc2lkZS4KPj4gU28sIGlmIHRoZSBtYW51ZmFjdHVyZXJzIHNr
aXBzIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgaW1wbGVtZW50YXRpb24sIHdlIHdhbnQgdGhlIHNw
aW5hbmQgY29yZSB0byBydW4gaW4gMXMtMXMtMXMgbW9kZS4KPiAKPiBJIHN0aWxsIGRvbid0IGdl
dCB0aGUgcG9pbnQ6IHlvdSBmYWlsIHRoZSBwcm9iZSBpZiB0aGUgb2N0YWwgYml0IGlzCj4gZW5h
YmxlZCBidXQgdGhlIG1hbnVmYWN0dXJlciBkaWQgbm90IGltcGxlbWVudCBvY3RhbF9kdHJfZW5h
YmxlKCksIHNvCj4gaG93IGNvdWxkIHdlIGhhdmUgaXNzdWVzPyBNYXliZSBJIGFtIG92ZXJsb29r
aW5nIHNvbWV0aGluZyB0aG91Z2gsIGJ1dAo+IHRoaXMgc2VlbWVkIGNvbXBsZXRlbHkgcmVkdW5k
YW50IHRvIG15IGV5ZXMgc28gZmFyLgo+IAoKT2theSwgSSBmZWVsIHRoaXMgbWF5IGJlIHJlZHVu
ZGFudC4gVGhpcyBpcyBmb3IgdGhlIGNhc2Ugd2hlbiB0aGUgCm1hbnVmYWN0dXJlciBoYXMgYWRk
ZWQgT2N0YWwgRFRSIHJlYWQvd3JpdGUvdXBkYXRlIGNhY2hlIHZhcmlhbnRzIGJ1dCAKaGFzbid0
IGltcGxlbWVudGVkIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgbWV0aG9kLgoKV2l0aG91dCB0aGlz
IHBhdGNoLCB0aGUgcHJvYmUgd291bGQgZmFpbCwgaWYgdGhlIG1hbnVmYWN0dXJlciBkaWQgbm90
IAppbXBsZW1lbnQgb2N0YWxfZHRyX2VuYWJsZSgpLiBCdXQgYWZ0ZXIgdXNpbmcgdGhpcyBwYXRj
aCwgc3BpbmFuZCBjYW4gCnN0aWxsIHVzZSB0aGUgY2hpcCBpbiAxcy0xcy0xcyBtb2RlIGluIHRo
YXQgY2FzZSBhbmQganVzdCBza2lwIHRoZSBPY3RhbCAKRFRSIG9wIHZhcmlhbnRzIGR1cmluZyB0
aGUgc2VsZWN0aW9uLiBBbmQgYWxzbyB0aGUgcHJvYmUgd291bGQgc3VjY2VlZC4KCj4+Cj4+IFJl
YWQvd3JpdGUvdXBkYXRlIG9wIHZhcmlhbnQgc2VsZWN0aW9uIGhhcHBlbnMgaW4gc2VsZWN0X29w
X3ZhcmlhbnQoKSwgbXVjaCBiZWZvcmUgb2N0YWxfZHRyX2VuYWJsZSgpLiBTbyBqdXN0IGNoZWNr
IGlmIHRoZXJlIGlzIGEgZGVmaW5pdGlvbiBvZiBvY3RhbF9kdHJfZW5hYmxlIGluIG1hbnVmYWN0
dXJlciBvcHMgYW5kIHRoZW4gb25seSB1c2UgOEQgb3AgdmFyaWFudHMuCj4+Cj4+IFJlbW92aW5n
IHRoaXMgd291bGRuJ3QgYnJlYWsgYW55dGhpbmcgaW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24uCj4+IERvIHlvdSB0aGluayB3ZSBzaG91bGQgZHJvcCB0aGlzPwo+Pgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPgo+Pj4+IC0tLQo+Pj4+
ICAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDcgKysrKysrLQo+Pj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMKPj4+PiBpbmRleCAxOWQ4YWZmYWMwNTguLjg3MTFlODg3Yjc5NSAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4+PiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMKPj4+PiBAQCAtMTAyOCw2ICsxMDI4LDggQEAgc3RhdGljIGludCBz
cGluYW5kX21hbnVmYWN0dXJlcl9tYXRjaChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQs
Cj4+Pj4gICAgCQlpZiAoaWRbMF0gIT0gbWFudWZhY3R1cmVyLT5pZCkKPj4+PiAgICAJCQljb250
aW51ZTsKPj4+PiAgICA+PiArCQlzcGluYW5kLT5tYW51ZmFjdHVyZXIgPSBtYW51ZmFjdHVyZXI7
Cj4+Pj4gKwo+Pj4+ICAgIAkJcmV0ID0gc3BpbmFuZF9tYXRjaF9hbmRfaW5pdChzcGluYW5kLAo+
Pj4+ICAgIAkJCQkJICAgICBtYW51ZmFjdHVyZXItPmNoaXBzLAo+Pj4+ICAgIAkJCQkJICAgICBt
YW51ZmFjdHVyZXItPm5jaGlwcywKPj4+PiBAQCAtMTAzNSw3ICsxMDM3LDYgQEAgc3RhdGljIGlu
dCBzcGluYW5kX21hbnVmYWN0dXJlcl9tYXRjaChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQsCj4+Pj4gICAgCQlpZiAocmV0IDwgMCkKPj4+PiAgICAJCQljb250aW51ZTsKPj4+PiAgICA+
PiAtCQlzcGluYW5kLT5tYW51ZmFjdHVyZXIgPSBtYW51ZmFjdHVyZXI7Cj4+Pj4gICAgCQlyZXR1
cm4gMDsKPj4+PiAgICAJfQo+Pj4+ICAgIAlyZXR1cm4gLUVOT1RTVVBQOwo+Pj4+IEBAIC0xMDk3
LDYgKzEwOTgsMTAgQEAgc3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudChzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQsCj4+Pj4gICAgCQl1bnNpZ25lZCBpbnQgbmJ5dGVzOwo+Pj4+ICAgIAkJ
aW50IHJldDsKPj4+PiAgICA+PiArCQlpZiAoc3BpbmFuZF9vcF9pc19vY3RhbF9kdHIoJm9wKSAm
Jgo+Pj4+ICsJCSAgICAhc3BpbmFuZC0+bWFudWZhY3R1cmVyLT5vcHMtPm9jdGFsX2R0cl9lbmFi
bGUpCj4+Pj4gKwkJCWNvbnRpbnVlOwo+Pj4+ICsKPj4+PiAgICAJCW5ieXRlcyA9IG5hbmRkZXZf
cGVyX3BhZ2Vfb29ic2l6ZShuYW5kKSArCj4+Pj4gICAgCQkJIG5hbmRkZXZfcGFnZV9zaXplKG5h
bmQpOwo+Pj4+ICAgID4gPiBUaGFua3MsCj4+PiBNaXF1w6hsCj4+Pgo+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+Pj4gICAgCj4+Cj4+IFRoYW5rcywKPj4gQXB1cnZh
IE5hbmRhbgo+IAo+IAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpUaGFua3MsCkFwdXJ2
YSBOYW5kYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
