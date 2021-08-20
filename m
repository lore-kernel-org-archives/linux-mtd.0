Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E85C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 15:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391A96113E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 15:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 391A96113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2D+Ua70Ffxk7YbV09TvuI6aGdw5fCTLeQ1ynBuqYKQ=; b=nJ+wBEmN9IvgfLTA7ASh8ZfRf9
	jN/+0VZaWuh8hBLQS1hblqcDDrttzYdSfLjaMQzFB+4TQ3DgqarGXk/sf3FNQc0g0L/stm2E1nE5a
	8aJPcT8PAJtsw73swm0UJ5LvkDk+ku5bdTwZwr89IAxwJn2E6pBpwGnHGYX8uyQm2f79lfm2KlRS2
	Ic5R0vl+A4K0d+tbLJZJKNvqibYWgB0pS27gG3qvSLjFyULksMf/vy26vlv4sauUqUvyk2cWVbqzN
	aQRCZsQMGAh344MKDQUX0RpR9k7OQQQMgOJI6FlK9jSGAKsPHUjJsM6LO1ZiHyu8ZdNMZ7js9PuA8
	yv4jF+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH6q4-00BZAT-89; Fri, 20 Aug 2021 15:53:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH6py-00BZ9h-KC
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 15:53:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KFrV6X013962;
 Fri, 20 Aug 2021 10:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629474811;
 bh=J/vo8B832cJn3Xv3wVaMKao5wbidMkr/qtLCpo6Q50Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QVYif6d1Mo5bFWQg+KYT7rSwP1/aIJ2Jvatme+F76Na7N6mD12Eht0N7jOh/2HEyl
 3/7iASVRwUng3O3G92L5zdPT3xz/yjvGiyBQ/c598VNu1mgxtSI2JcbH81r6UpX5Xw
 woAaV35e5r7vnHlUIBYL3hpndsHfGUU4qHFeDyx4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KFrVi7076792
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 10:53:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 10:53:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 10:53:30 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KFrQdP081560;
 Fri, 20 Aug 2021 10:53:27 -0500
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
 <11d173f2-2011-d029-e905-a10fdd0f2b85@ti.com> <20210820163802.529482dd@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <68eb2817-1df8-464b-aef8-15e9c9adfead@ti.com>
Date: Fri, 20 Aug 2021 21:23:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820163802.529482dd@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_085342_838471_92FC5057 
X-CRM114-Status: GOOD (  33.67  )
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

SGkgTWlxdcOobCwKCk9uIDIwLzA4LzIxIDg6MDggcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgQXB1cnZhLAo+IAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24g
RnJpLCAyMCBBdWcgMjAyMSAxOToyNDozNAo+ICswNTMwOgo+IAo+PiBIaSBNaXF1w6hsLAo+Pgo+
PiBPbiAyMC8wOC8yMSA1OjQ0IHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGkgQXB1cnZh
LAo+Pj4KPj4+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24gRnJpLCAy
MCBBdWcgMjAyMSAxNjo1Njo1MAo+Pj4gKzA1MzA6Cj4+PiAgICAKPj4+PiBPbiAwNy8wOC8yMSAx
MjozMSBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGkgQXB1cnZhLAo+Pj4+Pgo+Pj4+
PiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIw
MjEgMTM6MDU6MzMKPj4+Pj4gKzAwMDA6Cj4+Pj4+ICAgICA+Pj4+IFRoZSBTUEkgTkFORCBjb3Jl
IGRvZXNuJ3Qga25vdyBob3cgdG8gc3dpdGNoIHRoZSBmbGFzaCB0byBPY3RhbCBEVFIKPj4+Pj4+
IG1vZGUgKGkuZS4gd2hpY2ggb3BlcmF0aW9ucyB0byBwZXJmb3JtKS4gSWYgdGhlIG1hbnVmYWN0
dXJlciBoYXNuJ3QKPj4+Pj4+IGltcGxlbWVudGVkIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgbWFu
dWZhY3R1cmVyX29wLCB0aGUgU1BJIE5BTkQgY29yZQo+Pj4+Pj4gd291bGRuJ3QgYmUgYWJsZSB0
byBzd2l0Y2ggdG8gOEQtOEQtOEQgbW9kZSBhbmQgd2lsbCBhbHNvIG5vdCBiZSBhYmxlCj4+Pj4+
PiB0byBydW4gaW4gMVMtMVMtMVMgbW9kZSBkdWUgdG8gYWxyZWFkeSBzZWxlY3RlZCA4RC04RC04
RCByZWFkL3dyaXRlCj4+Pj4+PiBjYWNoZSBvcF90ZW1wbGF0ZXMuCj4+Pj4+Pgo+Pj4+Pj4gU28s
IGF2b2lkIGNob29zaW5nIGEgT2N0YWwgRFRSIFNQSSBvcF90ZW1wbGF0ZSBmb3IgcmVhZF9jYWNo
ZSwKPj4+Pj4+IHdyaXRlX2NhY2hlIGFuZCB1cGRhdGVfY2FjaGUgb3BlcmF0aW9ucywgaWYgdGhl
IG1hbnVmYWN0dXJlcl9vcAo+Pj4+Pj4gb2N0YWxfZHRyX2VuYWJsZSgpIGlzIG1pc3NpbmcuCj4+
Pj4+Cj4+Pj4+IEFmdGVyIGxvb2tpbmcgYXQgeW91ciBwcmV2aW91cyBjb21taXQgSSBkb24ndCBz
ZWUgd2h5IHRoaXMgcGF0Y2ggd291bGQKPj4+Pj4gYmUgbmVlZGVkLiBvY3RhbF9kdHJfZW5hYmxl
KCkgb25seSB1cGRhdGVzIHRoZSBtb2RlIHdoZW4gaXQgc3VjY2VlZHMgc28KPj4+Pj4gSSBkb24n
dCB0aGluayB0aGlzIHBhdGNoIGlzIHJlYWxseSBuZWVkZWQuCj4+Pj4+ICAgICA+Pgo+Pj4+IEkg
YWRkZWQgaXQgdG8gcHJldmVudCBhbnkgZXJyb3JzIGhhcHBlbmluZyBkdWVzIHRvIGEgbWlzc2lu
ZyBpbXBsZW1lbnRhdGlvbiBvZiBvY3RhbF9kdHJfZW5hYmxlKCkgZnJvbSBtYW51ZmFjdHVyZXIg
ZHJpdmVyIHNpZGUuCj4+Pj4gU28sIGlmIHRoZSBtYW51ZmFjdHVyZXJzIHNraXBzIHRoZSBvY3Rh
bF9kdHJfZW5hYmxlKCkgaW1wbGVtZW50YXRpb24sIHdlIHdhbnQgdGhlIHNwaW5hbmQgY29yZSB0
byBydW4gaW4gMXMtMXMtMXMgbW9kZS4KPj4+Cj4+PiBJIHN0aWxsIGRvbid0IGdldCB0aGUgcG9p
bnQ6IHlvdSBmYWlsIHRoZSBwcm9iZSBpZiB0aGUgb2N0YWwgYml0IGlzCj4+PiBlbmFibGVkIGJ1
dCB0aGUgbWFudWZhY3R1cmVyIGRpZCBub3QgaW1wbGVtZW50IG9jdGFsX2R0cl9lbmFibGUoKSwg
c28KPj4+IGhvdyBjb3VsZCB3ZSBoYXZlIGlzc3Vlcz8gTWF5YmUgSSBhbSBvdmVybG9va2luZyBz
b21ldGhpbmcgdGhvdWdoLCBidXQKPj4+IHRoaXMgc2VlbWVkIGNvbXBsZXRlbHkgcmVkdW5kYW50
IHRvIG15IGV5ZXMgc28gZmFyLgo+Pj4gICAgCj4+Cj4+IE9rYXksIEkgZmVlbCB0aGlzIG1heSBi
ZSByZWR1bmRhbnQuIFRoaXMgaXMgZm9yIHRoZSBjYXNlIHdoZW4gdGhlIG1hbnVmYWN0dXJlciBo
YXMgYWRkZWQgT2N0YWwgRFRSIHJlYWQvd3JpdGUvdXBkYXRlIGNhY2hlIHZhcmlhbnRzIGJ1dCBo
YXNuJ3QgaW1wbGVtZW50ZWQgdGhlIG9jdGFsX2R0cl9lbmFibGUoKSBtZXRob2QuCj4+Cj4+IFdp
dGhvdXQgdGhpcyBwYXRjaCwgdGhlIHByb2JlIHdvdWxkIGZhaWwsIGlmIHRoZSBtYW51ZmFjdHVy
ZXIgZGlkIG5vdCBpbXBsZW1lbnQgb2N0YWxfZHRyX2VuYWJsZSgpLiBCdXQgYWZ0ZXIgdXNpbmcg
dGhpcyBwYXRjaCwgc3BpbmFuZCBjYW4gc3RpbGwgdXNlIHRoZSBjaGlwIGluIDFzLTFzLTFzIG1v
ZGUgaW4gdGhhdCBjYXNlIGFuZCBqdXN0IHNraXAgdGhlIE9jdGFsIERUUiBvcCB2YXJpYW50cyBk
dXJpbmcgdGhlIHNlbGVjdGlvbi4gQW5kIGFsc28gdGhlIHByb2JlIHdvdWxkIHN1Y2NlZWQuCj4g
Cj4gVW5sZXNzIEkgYW0gb3Zlcmxvb2tpbmcgc29tZXRoaW5nIHdpdGggdGhpcyBzZXJpZXMgYXBw
bGllZAo+ICh3aXRoIG9yIHdpdGhvdXQgdGhpcyBwYXRjaCkgdGhlIHBvc3NpYmlsaXRpZXMgYXJl
Ogo+IC0gbm8gb2N0YWwgYml0IC0+IGNvbnRpbnVlIGFzIGJlZm9yZQo+IC0gb2N0YWwgYml0IGFu
ZCB2ZW5kb3IgY2FsbGJhY2sgLT4gdXNlcyBvY3RhbCBtb2RlCj4gLSBvY3RhbCBiaXQgYW5kIG5v
IHZlbmRvciBjYWxsYmFjayAtPiB3aWxsIHJldHVybiBhbiBlcnJvciBmcm9tCj4gc3BpbmFuZF9p
bml0X29jdGFsX2R0cl9lbmFibGUoKSB3aGljaCB3aWxsIGZhaWwgdGhlIHByb2JlIChwYXRjaCA3
KQo+IAo+IEFueXdheSB3ZSBoYXZlIGEgY2hvaWNlOgo+IC0gRWl0aGVyIHdlIGNvbnNpZGVyIHRo
ZSB0YWJsZXMgZGVzY3JpYmluZyBjaGlwcyBhcyBwdXJlIGRlc2NyaXB0aW9ucwo+ICAgIGFuZCB3
ZSBjYW4gc3VwcG9ydCB0aGVzZSBjaGlwcyBpbiBtb2RlIDEtMS0xICh3aWxsIHJlcXVpcmUgY2hh
bmdlcyBpbgo+ICAgIHlvdXIgc2VyaWVzIGFzIHRoaXMgaXMgbm90IHdoYXQgeW91IHN1cHBvcnQg
YXMgZmFyIGFzIEkgdW5kZXJzdGFuZAo+ICAgIHRoZSBjb2RlKQo+IC0gT3Igd2UgY29uc2lkZXIg
dGhlc2UgdGFibGVzIGFzICJ3aGF0IGlzIGN1cnJlbnRseSBzdXBwb3J0ZWQiIGFuZCBpbgo+ICAg
IHRoaXMgY2FzZSB3ZSBqdXN0IGZhaWwgaWYgb25lIGFkZHMgdGhlIG9jdGFsIGJpdCB3aXRob3V0
IGFueSBjYWxsYmFjawo+ICAgIGltcGxlbWVudGF0aW9uLgo+IAo+IEkgdGhpbmsgdGhlIGxhdHRl
ciBpcyBiZXR0ZXIgZm9yIG5vdy4gV2UgY2FuIHVwZGF0ZSB0aGlzIGNob2ljZSBsYXRlcgo+IGlm
IG5lZWRlZCBhbnl3YXkuCj4gCgpZZXMsIEkgZnVsbHkgYWdyZWUgd2l0aCB0aGUgbGF0dGVyLiBJ
IHdpbGwgZHJvcCB0aGlzIHBhdGNoIGluIHRoZSB2Mi4gClRoYW5rcyEKCj4+Cj4+Pj4KPj4+PiBS
ZWFkL3dyaXRlL3VwZGF0ZSBvcCB2YXJpYW50IHNlbGVjdGlvbiBoYXBwZW5zIGluIHNlbGVjdF9v
cF92YXJpYW50KCksIG11Y2ggYmVmb3JlIG9jdGFsX2R0cl9lbmFibGUoKS4gU28ganVzdCBjaGVj
ayBpZiB0aGVyZSBpcyBhIGRlZmluaXRpb24gb2Ygb2N0YWxfZHRyX2VuYWJsZSBpbiBtYW51ZmFj
dHVyZXIgb3BzIGFuZCB0aGVuIG9ubHkgdXNlIDhEIG9wIHZhcmlhbnRzLgo+Pj4+Cj4+Pj4gUmVt
b3ZpbmcgdGhpcyB3b3VsZG4ndCBicmVhayBhbnl0aGluZyBpbiB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbi4KPj4+PiBEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhpcz8KPj4+PiAgIAo+
Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNv
bT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDcg
KysrKysrLQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+Pj4+PiBpbmRleCAxOWQ4YWZm
YWMwNTguLjg3MTFlODg3Yjc5NSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+Pj4+
PiBAQCAtMTAyOCw2ICsxMDI4LDggQEAgc3RhdGljIGludCBzcGluYW5kX21hbnVmYWN0dXJlcl9t
YXRjaChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4+Pj4+PiAgICAgCQlpZiAoaWRb
MF0gIT0gbWFudWZhY3R1cmVyLT5pZCkKPj4+Pj4+ICAgICAJCQljb250aW51ZTsKPj4+Pj4+ICAg
ICA+PiArCQlzcGluYW5kLT5tYW51ZmFjdHVyZXIgPSBtYW51ZmFjdHVyZXI7Cj4+Pj4+PiArCj4+
Pj4+PiAgICAgCQlyZXQgPSBzcGluYW5kX21hdGNoX2FuZF9pbml0KHNwaW5hbmQsCj4+Pj4+PiAg
ICAgCQkJCQkgICAgIG1hbnVmYWN0dXJlci0+Y2hpcHMsCj4+Pj4+PiAgICAgCQkJCQkgICAgIG1h
bnVmYWN0dXJlci0+bmNoaXBzLAo+Pj4+Pj4gQEAgLTEwMzUsNyArMTAzNyw2IEBAIHN0YXRpYyBp
bnQgc3BpbmFuZF9tYW51ZmFjdHVyZXJfbWF0Y2goc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kLAo+Pj4+Pj4gICAgIAkJaWYgKHJldCA8IDApCj4+Pj4+PiAgICAgCQkJY29udGludWU7Cj4+
Pj4+PiAgICAgPj4gLQkJc3BpbmFuZC0+bWFudWZhY3R1cmVyID0gbWFudWZhY3R1cmVyOwo+Pj4+
Pj4gICAgIAkJcmV0dXJuIDA7Cj4+Pj4+PiAgICAgCX0KPj4+Pj4+ICAgICAJcmV0dXJuIC1FTk9U
U1VQUDsKPj4+Pj4+IEBAIC0xMDk3LDYgKzEwOTgsMTAgQEAgc3BpbmFuZF9zZWxlY3Rfb3BfdmFy
aWFudChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4+Pj4+PiAgICAgCQl1bnNpZ25l
ZCBpbnQgbmJ5dGVzOwo+Pj4+Pj4gICAgIAkJaW50IHJldDsKPj4+Pj4+ICAgICA+PiArCQlpZiAo
c3BpbmFuZF9vcF9pc19vY3RhbF9kdHIoJm9wKSAmJgo+Pj4+Pj4gKwkJICAgICFzcGluYW5kLT5t
YW51ZmFjdHVyZXItPm9wcy0+b2N0YWxfZHRyX2VuYWJsZSkKPj4+Pj4+ICsJCQljb250aW51ZTsK
Pj4+Pj4+ICsKPj4+Pj4+ICAgICAJCW5ieXRlcyA9IG5hbmRkZXZfcGVyX3BhZ2Vfb29ic2l6ZShu
YW5kKSArCj4+Pj4+PiAgICAgCQkJIG5hbmRkZXZfcGFnZV9zaXplKG5hbmQpOwo+Pj4+Pj4gICAg
ID4gPiBUaGFua3MsCj4+Pj4+IE1pcXXDqGwKPj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IExpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdAo+Pj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPj4+Pj4gICAgID4+Cj4+Pj4gVGhhbmtzLAo+Pj4+IEFw
dXJ2YSBOYW5kYW4KPj4+Cj4+Pgo+Pj4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNaXF1w6hsCj4+PiAg
ICAKPj4KPj4gVGhhbmtzLAo+PiBBcHVydmEgTmFuZGFuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwK
PiAKClRoYW5rcywKQXB1cnZhIE5hbmRhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
