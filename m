Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121ABC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D2120775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRA3R+14"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D2120775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jADkVqq0hWXWTklolVz8cOC4e4RLdKBdhSGPHKwc9qU=; b=fRA3R+14fy+FIp
	riVW2xn1D5l9kfppjPWdHzQO1AD1FQdVgglhW4ycJK/QOd5AgEkp5E8SALQdXtltqFmWYdCwZRuh4
	3Jx/d2d1t3V7dnEFOfKrAV+aEdS7f515+7yqgzI+E5uJmQiDG4wF98ZfNQVBlXe4+aPL2+DiRSeod
	Rl7M1DMpq3Qv13PjJ8mHJYhXoP+tUG8yrwY8a+PUaIWP+STcU6XWlNZO1qiOmerVgtIEwTdbAToRP
	g+jx9uTIxrC3d5zs25AtouwPTn/WC9heG4IuAtwrCBE7QQYqijjUMH8Z2znpP4+hqm/3yN3AJph4U
	rk1T71jZ9fwcTWC8gLzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8Om-00052C-63; Mon, 27 Apr 2020 18:22:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Ob-0004rN-RY
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:22:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FFFA2A0C44;
 Mon, 27 Apr 2020 19:22:18 +0100 (BST)
Date: Mon, 27 Apr 2020 20:22:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: Propage CS selection to sub operations
Message-ID: <20200427202215.1469230b@collabora.com>
In-Reply-To: <20200427170002.37d78066@xps13>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
 <20200427170002.37d78066@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_112222_016221_C7A0DB4E 
X-CRM114-Status: GOOD (  21.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNyBBcHIgMjAyMCAxNzowMDowMiArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgQm9yaXMsCj4gCj4gQm9yaXMgQnJlemls
bG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGUgb24gU2F0LCAxOCBBcHIK
PiAyMDIwIDIxOjQ5OjU4ICswMjAwOgo+IAo+ID4gU29tZSBjb250cm9sbGVyIHVzaW5nIHRoZSBp
bnN0cnVjdGlvbiBwYXJzZSBpbmZyYXN0cnVjdHVyZSBtaWdodCBuZWVkCj4gPiB0byBrbm93IHdo
aWNoIENTIGEgc3BlY2lmaWMgc3ViLW9wZXJhdGlvbiBpcyB0YXJnZXRpbmcuIExldCdzIHByb3Bh
Z2F0ZQo+ID4gdGhpcyBpbmZvcm1hdGlvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgMSArCj4gPiAgaW5jbHVkZS9saW51eC9t
dGQvcmF3bmFuZC5oICAgICAgfCAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+IGluZGV4IGMyNGU1ZTJi
YTEzMC4uZmE5YWMxOGU5N2ExIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4g
PiBAQCAtMjE3Niw2ICsyMTc2LDcgQEAgaW50IG5hbmRfb3BfcGFyc2VyX2V4ZWNfb3Aoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwKPiA+ICAJCQkgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24g
Km9wLCBib29sIGNoZWNrX29ubHkpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgbmFuZF9vcF9wYXJzZXJf
Y3R4IGN0eCA9IHsKPiA+ICsJCS5zdWJvcC5jcyA9IG9wLT5jcywgIAo+IAo+IEkgdGhpbmsgdGhp
cyBpbmZvcm1hdGlvbiBtaWdodCBiZWNvbWUgaW1wb3J0YW50LCBjb3VsZCB5b3UgYXMgd2VsbCBh
ZGQKPiBpdCB0byB0aGUgcGFyc2VyIHRyYWNlcj8gU29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBk
byB0aGUgdHJpY2s6Cj4gCgpTdXJlLCBJJ2xsIGRvIHRoYXQuIFRoYW5rcyBmb3IgdGhlIGRpZmYu
Cgo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtMjExMiw3ICsyMTEyLDcgQEAgc3RhdGlj
IHZvaWQgbmFuZF9vcF9wYXJzZXJfdHJhY2UoY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyX2N0
eCAqY3R4KQo+ICAgICAgICAgY2hhciAqcHJlZml4ID0gIiAgICAgICI7Cj4gICAgICAgICB1bnNp
Z25lZCBpbnQgaTsKPiAgCj4gLSAgICAgICBwcl9kZWJ1ZygiZXhlY3V0aW5nIHN1Ym9wOlxuIik7
Cj4gKyAgICAgICBwcl9kZWJ1ZygiZXhlY3V0aW5nIHN1Ym9wIChDUyVkKTpcbiIsIGN0eC0+c3Vi
b3AuY3MpOwo+ICAKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjdHgtPm5pbnN0cnM7IGkrKykg
ewo+ICAgICAgICAgICAgICAgICBpbnN0ciA9ICZjdHgtPmluc3Ryc1tpXTsKPiAKPiA+ICAJCS5z
dWJvcC5pbnN0cnMgPSBvcC0+aW5zdHJzLAo+ID4gIAkJLmluc3RycyA9IG9wLT5pbnN0cnMsCj4g
PiAgCQkubmluc3RycyA9IG9wLT5uaW5zdHJzLAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbXRkL3Jhd25hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+ID4gaW5kZXgg
MWU3NjE5NmY5ODI5Li44ZThkMWE2MWUyZmIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L210ZC9yYXduYW5kLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+ID4g
QEAgLTY5NCw2ICs2OTQsNyBAQCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciB7Cj4gPiAgCj4gPiAgLyoq
Cj4gPiAgICogc3RydWN0IG5hbmRfc3Vib3AgLSBhIHN1YiBvcGVyYXRpb24KPiA+ICsgKiBAY3M6
IHRoZSBDUyBsaW5lIHRvIHNlbGVjdCBmb3IgdGhpcyBOQU5EIHN1Yi1vcGVyYXRpb24KPiA+ICAg
KiBAaW5zdHJzOiBhcnJheSBvZiBpbnN0cnVjdGlvbnMKPiA+ICAgKiBAbmluc3RyczogbGVuZ3Ro
IG9mIHRoZSBAaW5zdHJzIGFycmF5Cj4gPiAgICogQGZpcnN0X2luc3RyX3N0YXJ0X29mZjogb2Zm
c2V0IHRvIHN0YXJ0IGZyb20gZm9yIHRoZSBmaXJzdCBpbnN0cnVjdGlvbgo+ID4gQEAgLTcwOSw2
ICs3MTAsNyBAQCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciB7Cj4gPiAgICogY29udHJvbGxlciBkcml2
ZXIuCj4gPiAgICovCj4gPiAgc3RydWN0IG5hbmRfc3Vib3Agewo+ID4gKwl1bnNpZ25lZCBpbnQg
Y3M7Cj4gPiAgCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cnM7Cj4gPiAgCXVuc2ln
bmVkIGludCBuaW5zdHJzOwo+ID4gIAl1bnNpZ25lZCBpbnQgZmlyc3RfaW5zdHJfc3RhcnRfb2Zm
OyAgCj4gCj4gV2l0aCB0aGlzIHNtYWxsIGFkZGl0aW9uOgo+IAo+IFJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
