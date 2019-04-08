Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502D1C10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 12:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2165920883
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 12:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HmMcqjNY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2165920883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJbJNzVLgfpgCtWNWxM0FMXN1EdhpV2w+LkZljCtvUE=; b=HmMcqjNY4fzkSl
	EPAER35UcQ25sXfvyJXgPVuZ4wigM4aHdjSaTjpW+cAyUHzshLrvoT9iQ/od340zNC4EIvUGuDYUw
	Ef01aou6UKGw/xHe1AvpLQsh0u2kG4bm1pK/n0sdz5sm6aGItaYp/MTVAfHwfPQHEV2vL0QA3fwBd
	V7jbFPAnBBhHKkfrVPtd7HRshk2Qx4qm2mQ8uN+oMkX8hK8fAMAl5oD7omR6I0PKUYJDLvxmViPVR
	tp6r7wcRM4PtTTvytrwCQGlP36T34L27su+WP9drTW4ww4TDyj4NBiCeyCW09tFcVcha2lA1GKll8
	HaVKiu8dDolJ0Ii/44tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDT6i-0004ma-TT; Mon, 08 Apr 2019 12:10:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDT6g-0004lq-DA
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 12:10:35 +0000
X-Originating-IP: 90.88.30.125
Received: from xps13 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C2D3220003;
 Mon,  8 Apr 2019 12:10:24 +0000 (UTC)
Date: Mon, 8 Apr 2019 14:10:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [PATCH 0/4] Introduce generic ONFI support
Message-ID: <20190408141023.6c57199f@xps13>
In-Reply-To: <MN2PR08MB5951DD5B4DC318D44E01206DB82C0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB59510D880AD3E92A7D4C12CDB85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
 <MN2PR08MB5951DD5B4DC318D44E01206DB82C0@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_051034_590064_B56851F0 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpNb24sIDggQXByIDIwMTkgMTE6NDg6MDgg
KzAwMDA6Cgo+IEhpLAo+IAo+IEp1c3QgYSBnZW50bGUgcmVtaW5kZXIgdGhhdCBJJ2QgbGlrZSBz
b21lIGZlZWRiYWNrIG9uIHRoZXNlIHBhdGNoZXMuCgpZZXMsIHRoaXMgaXMgZGVmaW5pdGVseSBp
biBteSBxdWV1ZS4KCj4gCj4gVGhhbmtzLAo+IFNoaXZhCj4gCj4gPiBTdWJqZWN0OiBbUEFUQ0gg
MC80XSBJbnRyb2R1Y2UgZ2VuZXJpYyBPTkZJIHN1cHBvcnQKPiA+IAo+ID4gQ3VycmVudCBzdXBw
b3J0IHRvIE9ORkkgcGFyYW1ldGVyIHBhZ2UgaXMgb25seSBmb3IgcmF3IE5BTkQsIHRoaXMgcGF0
Y2gKPiA+IHNlcmllcyB0dXJuIE9ORkkgc3VwcG9ydCBpbnRvIGdlbmVyaWMuIFNvIHRoYXQsIG90
aGVyIE5BTkQgZGV2aWNlcyBsaWtlIFNQSQo+ID4gTkFORCBjYW4gdXNlIHRoaXMuCj4gPiAKPiA+
IFN1cHBvcnQgdG8gZGV0ZWN0IHBhcmFtZXRlciBwYWdlIGlzIGVuYWJsZWQgaW4gU1BJIE5BTkQg
Y29yZS4KPiA+IAo+ID4gVHVybmVkIE1pY3JvbiBTUEkgTkFORCBkcml2ZXIgdG8gdXNlIHBhcmFt
ZXRlciBwYWdlLgo+ID4gCj4gPiBGcm9tIFNQSSBOQU5EIHNpZGUsIHRoaXMgcGF0Y2ggc2VyaWVz
IGlzIHRlc3RlZCB3aXRoIE1pY3JvbiBmbGFzaGVzCj4gPiBNVDI5RjJHMDFBQlhHRCwgTVQyOUY0
RzAxQUJYRkQsIE1UMjlGOEcwMUFEWEZELAo+ID4gTVQyOUYxRzAxQUJYRkQuCj4gPiAKPiA+IEkg
Y3JlYXRlZCB0aGlzIHBhdGNoIHNlcmllcyBiYXNlZCBvbiBtdGQvbmV4dCArIE1pcXVlbCBSYXlu
YWwncyBuZXcgc2VyaWVzIG9mCj4gPiBwYXRjaGVzLCBhcyBJIG5lZWRlZCBzb21lIG9mIHRoZSBj
aGFuZ2VzIGRvbmUgYnkgaGltLgo+ID4gCj4gPiBTaGl2YW11cnRoeSBTaGFzdHJpICg0KToKPiA+
ICAgbXRkOiByYXduYW5kOiBUdXJuIHRoZSBPTkZJIHN1cHBvcnQgdG8gZ2VuZXJpYwo+ID4gICBt
dGQ6IG5hbmQ6IE1vdmUgT05GSSBjb2RlIGludG8gbmFuZC8gZGlyZWN0b3J5Cj4gPiAgIG10ZDog
c3BpbmFuZDogRW5hYmxlZCBzdXBwb3J0IHRvIGRldGVjdCBwYXJhbWV0ZXIgcGFnZQo+ID4gICBt
dGQ6IHNwaW5hbmQ6IG1pY3JvbjogU3VwcG9ydCBmb3IgbmV3IE1pY3JvbiBTUEkgTkFORCBmbGFz
aGVzCj4gPiAKPiA+ICBkcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlICAgICAgICB8ICAgMiArLQo+
ID4gIGRyaXZlcnMvbXRkL25hbmQvb25maS5jICAgICAgICAgIHwgMTY5ICsrKysrKysrKysrKysr
KysrCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgfCAgIDEgLQo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L2ludGVybmFscy5oIHwgICA2ICstCj4gPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAyMzYgKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyB8IDMxMiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICAgfCAxMTMg
KysrKysrKysrKy0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYyAgICB8IDEwOSAr
KysrKysrKy0tLQo+ID4gIGluY2x1ZGUvbGludXgvbXRkL25hbmQuaCAgICAgICAgIHwgIDMwICsr
Kwo+ID4gIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgIHwgICA1ICsKPiA+ICBpbmNs
dWRlL2xpbnV4L210ZC9zcGluYW5kLmggICAgICB8ICAgNSArCj4gPiAgMTEgZmlsZXMgY2hhbmdl
ZCwgNjIwIGluc2VydGlvbnMoKyksIDM2OCBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tdGQvbmFuZC9vbmZpLmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9vbmZpLmMKPiA+IAo+ID4gLS0KPiA+IDIuMTcuMSAgCj4g
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
