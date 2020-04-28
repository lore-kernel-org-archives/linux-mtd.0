Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B1C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEFA2053B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 07:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4RkLuFQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEFA2053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2QZLKMj+YSSHAU1QioBumeFew8nHMFVv5elKcDujBA=; b=q4RkLuFQfJxuaj
	9YGCsJVUoWTh7a5p8yj2dizLnn2oXJrKOi7m2t0QRqyo0rOwXp+QJV/TyP1jqMs4JLsCXoS9Q8096
	o/CurXKl6iLcJ7R6tCgQYqtld7UcioXuZozVs+6PQzJ0cZfR8RXwgVfUskLWl5sUFKpZn1htsYwZ0
	HAe+shCXPnINIBiYnT1zpS5GarM8cQgoDlrl1QR6gkoZnXcE0w+MxJqSZMN4nDfP6zDcvT5/FdKt7
	ZxSQeJvkxlgvtWLg92e1EOsb3NhzkbylwGqTllmEBNgk1Hk1jdzQh8WJmMzH34li7CcFGuLVFXP+p
	YN3iq2Fw26wSugF1g1iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTL5Q-0003qj-Fy; Tue, 28 Apr 2020 07:55:24 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTL5B-0002Jg-7I
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 07:55:11 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4806A100017;
 Tue, 28 Apr 2020 07:55:00 +0000 (UTC)
Date: Tue, 28 Apr 2020 09:54:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200428095459.6727fab0@xps13>
In-Reply-To: <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com>
 <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
 <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
 <20200428094049.3c0d4730@xps13>
 <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_005509_561488_5ACA16F2 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgoiUmFtdXRoZXZhciwgVmFkaXZlbCBNdXJ1Z2FuWCIKPHZhZGl2ZWwubXVydWdhbngu
cmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlIG9uIFR1ZSwgMjggQXByIDIwMjAKMTU6
NTA6MDYgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyOC80LzIwMjAgMzo0MCBwbSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFZhZGl2ZWwgTXVydWdhblgsCj4gPiAKPiA+ICJSYW11
dGhldmFyLCBWYWRpdmVsIE11cnVnYW5YIgo+ID4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZh
ckBsaW51eC5pbnRlbC5jb20+IHdyb3RlIG9uIFR1ZSwgMjggQXByIDIwMjAKPiA+IDE0OjUwOjM1
ICswODAwOgo+ID4gICAKPiA+PiBIaSBCb3JpcywKPiA+Pgo+ID4+IE9uIDI4LzQvMjAyMCAyOjQ3
IHBtLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6ICAKPiA+Pj4gT24gVHVlLCAyOCBBcHIgMjAyMCAx
NDo0MDo1OCArMDgwMAo+ID4+PiAiUmFtdXRoZXZhciwgVmFkaXZlbCBNdXJ1Z2FuWCIKPiA+Pj4g
PHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlOiAgCj4g
Pj4+ICAgID4+Pj4gSGkgQm9yaXMsICAKPiA+Pj4+Cj4gPj4+PiBPbiAyOC80LzIwMjAgMjoyNyBw
bSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOiAgCj4gPj4+Pj4gT24gVHVlLCAyOCBBcHIgMjAyMCAx
NDoxNzozMCArMDgwMAo+ID4+Pj4+ICJSYW11dGhldmFyLCBWYWRpdmVsIE11cnVnYW5YIgo+ID4+
Pj4+IDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGludXguaW50ZWwuY29tPiB3cm90ZTog
IAo+ID4+Pj4+ICAgICA+Pj4+IEhpIE1pcXVlbCwgIAo+ID4+Pj4+Pgo+ID4+Pj4+PiAgICAgICAg
VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJldmlldyBjb21tZW50cyBhbmQgeW91ciB0aW1l
Li4uCj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIDI3LzQvMjAyMCAxMTo1MSBwbSwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4+Pj4+Pj4gSGkgUmFtdXRoZXZhciwgIAo+ID4+Pj4+Pj4gICAgICAgID4+
Pj4+Pj4gK3N0YXRpYyBpbnQgZWJ1X25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikgIAo+ID4+Pj4+Pj4+PiArewo+ID4+Pj4+Pj4+PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Cj4gPj4+Pj4+Pj4+ICsJc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgKmVi
dV9ob3N0Owo+ID4+Pj4+Pj4+PiArCXN0cnVjdCBuYW5kX2NoaXAgKm5hbmQ7Cj4gPj4+Pj4+Pj4+
ICsJcGh5c19hZGRyX3QgbmFuZGFkZHJfcGE7Cj4gPj4+Pj4+Pj4+ICsJc3RydWN0IG10ZF9pbmZv
ICptdGQ7Cj4gPj4+Pj4+Pj4+ICsJc3RydWN0IHJlc291cmNlICpyZXM7Cj4gPj4+Pj4+Pj4+ICsJ
aW50IHJldDsKPiA+Pj4+Pj4+Pj4gKwl1MzIgY3M7Cj4gPj4+Pj4+Pj4+ICsKPiA+Pj4+Pj4+Pj4g
KwllYnVfaG9zdCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZWJ1X2hvc3QpLCBHRlBfS0VS
TkVMKTsKPiA+Pj4+Pj4+Pj4gKwlpZiAoIWVidV9ob3N0KQo+ID4+Pj4+Pj4+PiArCQlyZXR1cm4g
LUVOT01FTTsKPiA+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+PiArCWVidV9ob3N0LT5kZXYgPSBkZXY7
Cj4gPj4+Pj4+Pj4+ICsJbmFuZF9jb250cm9sbGVyX2luaXQoJmVidV9ob3N0LT5jb250cm9sbGVy
KTsKPiA+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+PiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJlYnVuYW5kIik7Cj4gPj4+Pj4+Pj4+ICsJ
ZWJ1X2hvc3QtPmVidV9hZGRyID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJl
cyk7Cj4gPj4+Pj4+Pj4+ICsJaWYgKElTX0VSUihlYnVfaG9zdC0+ZWJ1X2FkZHIpKQo+ID4+Pj4+
Pj4+PiArCQlyZXR1cm4gUFRSX0VSUihlYnVfaG9zdC0+ZWJ1X2FkZHIpOwo+ID4+Pj4+Pj4+PiAr
Cj4gPj4+Pj4+Pj4+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgImhzbmFuZCIpOwo+ID4+Pj4+Pj4+PiArCWVidV9ob3N0LT5uYW5kX2Fk
ZHIgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPiA+Pj4+Pj4+Pj4g
KwlpZiAoSVNfRVJSKGVidV9ob3N0LT5uYW5kX2FkZHIpKQo+ID4+Pj4+Pj4+PiArCQlyZXR1cm4g
UFRSX0VSUihlYnVfaG9zdC0+bmFuZF9hZGRyKTsKPiA+Pj4+Pj4+Pj4gKwo+ID4+Pj4+Pj4+PiAr
CXJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJuYW5kLGNzIiwgJmNzKTsgIAo+
ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gQ1MgaWRzIHNob3VsZCBiZSBlbmNvZGVkIGluIHRoZSByZWcg
cHJvcGVydHkgKHNlZSBbMV0pLiAgCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSXMgaXQgeW91ciBjaG9p
Y2UgdG8gb25seSBzdXBwb3J0IGEgc2luZ2xlIENTIG9yIGlzIGl0IGFjdHVhbGx5IGEKPiA+Pj4+
Pj4+IGNvbnRyb2xsZXIgbGltaXRhdGlvbj8gIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBZZXMgLCBpdHMg
Y29udHJvbGxlciBsaW1pdGF0aW9uIHRvIHN1cHBvcnQgb25seSBvbmUgQ1MgIAo+ID4+Pj4+Cj4g
Pj4+Pj4gSSdtIHByZXR0eSBzdXJlIHRoYXQncyBub3QgdHJ1ZSwgb3RoZXJ3aXNlIHlvdSB3b3Vs
ZG4ndCBoYXZlIHRvIHNlbGVjdAo+ID4+Pj4+IHRoZSBDUyB5b3Ugd2FudCB0byB1c2UgOlAuICAK
PiA+Pj4+Cj4gPj4+PiBBdCBhIHRpbWUgaXQgc3VwcG9ydHMgb25seSBvbmUgY2hpcCBzZWxlY3Qu
ICAKPiA+Pj4KPiA+Pj4gWWVzLCBsaWtlIDk5JSBvZiB0aGUgTkFORCBjb250cm9sbGVycywgYnV0
IHRoYXQgZG9lc24ndCBtZWFuIHlvdSBjYW4ndAo+ID4+PiBzdXBwb3J0IG11bHRpLUNTIGNoaXBz
LiBBbGwgeW91IGhhdmUgdG8gZG8gaXMgYXR0YWNoIGFuIGFycmF5IG9mCj4gPj4+IGVidV9uYW5k
X2NzIHRvIHlvdXIgZWJ1X25hbmRfY2hpcCAoYXMgZG9uZSBpbiB0aGUgYXRtZWwgZHJpdmVyIEkK
PiA+Pj4gcG9pbnRlZCB0bykuIG5hbmRfb3BlcmF0aW9uLmNzIHRlbGxzIHlvdSB3aGljaCBDUyAo
aW5kZXggaW4geW91cgo+ID4+PiBlYnVfbmFuZF9jcyBhcnJheSkgYSBzcGVjaWZpYyBvcGVyYXRp
b24gaXMgdGFyZ2V0aW5nLCBhbmQgeW91IGNhbiBwaWNrCj4gPj4+IHRoZSByaWdodCBNTUlPIHJh
bmdlL3JlZyB2YWx1ZSBiYXNlZCBvbiB0aGF0LiAgCj4gPj4KPiA+PiBBZ3JlZWQsIHN1cmUgSSB3
aWxsIGFkZCB0aGF0IGFuZCB1cGRhdGUgbmV4dCBzZXJpZXMgb2YgcGF0Y2hlcyAuICAKPiA+IAo+
ID4gVGhlcmUgYXJlIGFsc28gbWFueSBvdGhlciBwbGFjZXMgd2hlcmUgeW91IGFzc3VtZSBibGlu
ZGx5IHRoYXQgdGhlcmUKPiA+IGlzIG9ubHkgb25lIENTLiBZb3UgY2FuIGNoZWNrIHRoZSBBdG1l
bCBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGFzIEJvcmlzCj4gPiBzYWlkIGFuZCB3ZSB3aWxsIHBy
b2JhYmx5IHByb3Bvc2UgbW9yZSBsaXR0bGUgY2hhbmdlcyB0byBiZSBtb3JlCj4gPiBnZW5lcmlj
LiAgCj4gc2luY2UgTEdNIEVCVV9OQU5EIGNvbnRyb2xsZXIgc3VwcG9ydHMgb25seSBvbmUgY2hp
cCBzZWxlY3QgYXQgYSB0aW1lLCBzbyBhc3N1bWVkIGxpa2UgdGhhdCwgd2lsbCBjaGFuZ2UgYXMg
Z2VuZXJpYyB3YXkgaWYgY29uc2lkZXIgbGlrZSBtb3JlIGNoaXAgc2VsZWN0IHN1cHBvcnRzLCBU
aGFua3MhCgpXaGF0IGRvIHlvdSBtZWFuICJhdCBhIHRpbWUiPwoKRG8gd2UgaGF2ZSBhY2Nlc3Mg
dG8gdGhlIHNwZWMgb3IgYSByZWdpc3RlciBtYXA/IFdlIGNvdWxkIHRlbGwgeW91IHZlcnkKcXVp
Y2tseSBpZiBpdCBpcyB3b3J0aCB0aGUgdHJvdWJsZS4gQnV0IEkgYW0gcHJldHR5IHN1cmUgYXMg
d2VsbCB0aGF0CnRoZSBjb250cm9sbGVyIHN1cHBvcnRzIG1vcmUgdGhhbiAxIENTLgoKPiBTdXJl
ICwgSSB3aWxsIGRvIHRoZSBjaGFuZ2VzIGFzIHBlciB5b3VyIHJldmlldyBjb21tZW50cy4KPiA+
IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gICAKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
