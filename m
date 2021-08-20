Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD06C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 14:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B84610FF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 14:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91B84610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJNghvTavBVz9iH2nRJWETvHmsHsVo24KzseVJvEuko=; b=E3NxjYP0QHLZPE
	ag/f64MX6NSjVBIUphX5mJcnwUiqhagBKlmrWzbYuDGTYnkkd3x4He+soqCJemCBVz7r41wioCRVP
	Bir4BFFN4eGsFo57d9N0DitFD3zxBbNDbGUeABJxZuKxE1dvPlFmH5h1wpkuuhTF3XASfa7eHJO80
	Judke1/vYD9UzxPd/GDQ2W7Qf/xoYUjviGpnncqH3QXZpFTpsj5cB6FAfYR5YhdJNOV8OSnnwDtOS
	1KodVeZL9he4YB7pTh6SFFah+3+NhjVy5RTmWJ7o6RKQLNfeDX9eXA+rV8s80W2oeLD+cOksOl0PB
	8dWNwHkkO436M7dRc1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH5LH-00BNFW-1t; Fri, 20 Aug 2021 14:17:55 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH5LB-00BNEB-TE
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 14:17:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B38544000F;
 Fri, 20 Aug 2021 14:17:45 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:17:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 11/13] mtd: spinand: Add support for Power-on-Reset
 (PoR) instruction
Message-ID: <20210820161744.148b3003@xps13>
In-Reply-To: <c4a1eae9-7c0b-62c8-f10a-000e65c94f1b@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-12-a-nandan@ti.com>
 <20210806210840.65c06b67@xps13>
 <403a2b26-fd95-31ab-8992-a6e6862249e6@ti.com>
 <20210820141822.03d658b8@xps13>
 <c4a1eae9-7c0b-62c8-f10a-000e65c94f1b@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_071750_259216_BD03C60B 
X-CRM114-Status: GOOD (  28.60  )
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
IDIwIEF1ZyAyMDIxIDE5OjExOjU4CiswNTMwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDIwLzA4
LzIxIDU6NDggcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBBcHVydmEsCj4gPiAKPiA+
IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24gRnJpLCAyMCBBdWcgMjAy
MSAxNzowOTowNwo+ID4gKzA1MzA6Cj4gPiAgIAo+ID4+IEhpIE1pcXXDqGwsCj4gPj4KPiA+PiBP
biAwNy8wOC8yMSAxMjozOCBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+PiBIaSBBcHVy
dmEsCj4gPj4+Cj4gPj4+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3JvdGUgb24g
VHVlLCAxMyBKdWwgMjAyMSAxMzowNTozNgo+ID4+PiArMDAwMDogIAo+ID4+PiAgICA+Pj4+IE1h
bnVmYWN0dXJlcnMgbGlrZSBHaWdhZGV2aWNlIGFuZCBXaW5ib25kIGFyZSBhZGRpbmcgUG93ZXIt
b24tUmVzZXQgIAo+ID4+Pj4gZnVuY3Rpb25hbGl0eSBpbiB0aGVpciBTUEkgTkFORCBmbGFzaCBj
aGlwcy4gUG9SIGluc3RydWN0aW9uIGNvbnNpc3RzCj4gPj4+PiBvZiBhIDY2aCBjb21tYW5kIGZv
bGxvd2VkIGJ5IDk5aCBjb21tYW5kLCBhbmQgaXMgZGlmZmVyZW50IGZyb20gdGhlIEZGaAo+ID4+
Pj4gcmVzZXQuIFRoZSByZXNldCBjb21tYW5kIEZGaCBqdXN0IGNsZWFycyB0aGUgc3RhdHVzIG9u
bHkgcmVnaXN0ZXJzLAo+ID4+Pj4gd2hpbGUgdGhlIFBvUiBjb21tYW5kIGVyYXNlcyBhbGwgdGhl
IGNvbmZpZ3VyYXRpb25zIHdyaXR0ZW4gdG8gdGhlCj4gPj4+PiBmbGFzaCBhbmQgaXMgZXF1aXZh
bGVudCB0byBhIHBvd2VyLWRvd24gLT4gcG93ZXItdXAgY3ljbGUuCj4gPj4+Pgo+ID4+Pj4gQWRk
IHN1cHBvcnQgZm9yIHRoZSBQb3dlci1vbi1SZXNldCBjb21tYW5kIGZvciBhbnkgZmxhc2ggdGhh
dCBwcm92aWRlcwo+ID4+Pj4gdGhpcyBmZWF0dXJlLgo+ID4+Pj4KPiA+Pj4+IERhdGFzaGVldDog
aHR0cHM6Ly93d3cud2luYm9uZC5jb20vZXhwb3J0L3NpdGVzL3dpbmJvbmQvZGF0YXNoZWV0L1cz
NU4wMUpXX0RhdGFzaGVldF9CcmllZi5wZGYKPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBB
cHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4gPj4+PiAtLS0gIAo+ID4+Pgo+ID4+PiBb
Li4uXQo+ID4+PiAJCQkJXCAgCj4gPj4+PiBAQCAtMjE4LDYgKzIzMCw4IEBAIHN0cnVjdCBzcGlu
YW5kX2RldmljZTsKPiA+Pj4+ICAgICAqIHJlYWRpbmcvcHJvZ3JhbW1pbmcvZXJhc2luZyB3aGVu
IHRoZSBSRVNFVCBvY2N1cnMuIFNpbmNlIHdlIGFsd2F5cwo+ID4+Pj4gICAgICogaXNzdWUgYSBS
RVNFVCB3aGVuIHRoZSBkZXZpY2UgaXMgSURMRSwgNXVzIGlzIHNlbGVjdGVkIGZvciBib3RoIGlu
aXRpYWwKPiA+Pj4+ICAgICAqIGFuZCBwb2xsIGRlbGF5Lgo+ID4+Pj4gKyAqIFBvd2VyIG9uIFJl
c2V0IGNhbiB0YWtlIG1heCB1cHRvIDUwMCB1cyB0byBjb21wbGV0ZSwgc28gc2xlZXAgZm9yIDEw
MDAgdXMgIAo+ID4+Pgo+ID4+PiBzL21heCB1cHRvL3VwIHRvLyAgCj4gPj4+ICAgID4+ICAKPiA+
PiBPa2F5IQo+ID4+ICAKPiA+Pj4+ICsgKiB0byAxMjAwIHVzIHNhZmVseS4gIAo+ID4+Pgo+ID4+
PiBJIGRvbid0IHJlYWxseSBnZXQgd2h5LCBpZiB0aGUgbWF4aW11bSBpcyA1MDAsIHRoZW4gbGV0
J3Mgd2FpdCBmb3IKPiA+Pj4gNTAwdXMuICAKPiA+Pj4gICAgPj4gIAo+ID4+IEdlbmVyYWxseSB3
ZSBrZWVwIHNvbWUgbWFyZ2luIGZyb20gdGhlIG1heGltdW0gdGltZSwgbm8/ICAKPiA+IAo+ID4g
V2VsbCwgeWVzIGFuZCBuby4KPiA+IAo+ID4gSWYgeW91IGtub3cgdGhhdCBhbiBvcGVyYXRpb24g
d2lsbCBsYXN0IFhtcyBhbmQgaGF2ZSBub3RoaW5nIGVsc2UgdG8KPiA+IGRvLCB0aGVuIHlvdSBj
YW4gdGFrZSBzb21lIG1hcmdpbiBpZiB5b3UgYXJlIGluIGEgcHJvYmUgKGNhbGxlZCBvbmNlKQo+
ID4gYnV0IGRlZmluaXRlbHkgbm90IGlmIHlvdSBhcmUgaW4gYSBmYXN0IHBhdGguCj4gPiAgIAo+
IAo+IEkgdGhpbmsgYXMgUG9SIHJlc2V0IHdvdWxkIGJlIGNhbGxlZCBhdCBldmVyeSBtdGRfc3Vz
cGVuZCgpIGNhbGwsIHNvIHdlIGNhbiByZWR1Y2UgdGhlIGRlbGF5LiBBbmQgd2Ugd291bGQgYmUg
ZXhwZWN0aW5nIHNvbWUgdGltZSBnYXAgYmVmb3JlIHRoZSBuZXh0IG10ZF9yZXN1bWUoKSBjYWxs
Lgo+IAo+ID4gT3RoZXJ3aXNlIHRoZSBiZXN0IGlzIHRvIGhhdmUgc29tZSBraW5kIG9mIHNpZ25h
bGluZyBidXQgSSdtIG5vdCBzdXJlCj4gPiB5b3UnbGwgaGF2ZSBvbmUgZm9yIHRoZSByZXNldCBv
cC4uLgo+ID4gICAKPiAKPiBBY2NvcmRpbmcgdG8gcHVibGljIGRhdGFzaGVldCwgaXQgZG9lc24n
dCBzZXQgdGhlIGJ1c3kgYml0IGR1cmluZyByZXNldC4KPiAKPiBTbyBkbyB5b3Ugc3VnZ2VzdCBp
biB0aGUgZmF2b3Igb2YgcmVtb3ZpbmcgdGhlIGRlbGF5IG1hcmdpbj8KCldlbGwsIGl0J3MgbWlj
cm9zZWNvbmRzLCBtYXliZSB5b3UgY2FuIHJlZHVjZSBpdCBhIGxpdHRsZSBiaXQgYnV0IHRoYXQK
d2lsbCBiZSBvay4KCj4gCj4gPj4gIAo+ID4+Pj4gICAgICovCj4gPj4+PiAgICAjZGVmaW5lIFNQ
SU5BTkRfUkVBRF9JTklUSUFMX0RFTEFZX1VTCTYKPiA+Pj4+ICAgICNkZWZpbmUgU1BJTkFORF9S
RUFEX1BPTExfREVMQVlfVVMJNQo+ID4+Pj4gQEAgLTIyNyw2ICsyNDEsOCBAQCBzdHJ1Y3Qgc3Bp
bmFuZF9kZXZpY2U7Cj4gPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRfV1JJVEVfUE9MTF9ERUxBWV9V
UwkxNQo+ID4+Pj4gICAgI2RlZmluZSBTUElOQU5EX0VSQVNFX0lOSVRJQUxfREVMQVlfVVMJMjUw
Cj4gPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRfRVJBU0VfUE9MTF9ERUxBWV9VUwk1MAo+ID4+Pj4g
KyNkZWZpbmUgU1BJTkFORF9QT1JfTUlOX0RFTEFZX1VTCTEwMDAKPiA+Pj4+ICsjZGVmaW5lIFNQ
SU5BTkRfUE9SX01BWF9ERUxBWV9VUwkxMjAwICAKPiA+Pj4+ICAgID4+ICAgI2RlZmluZSBTUElO
QU5EX1dBSVRSRFlfVElNRU9VVF9NUwk0MDAKPiA+Pj4+ICAgID4+IEBAIC0zNTEsNiArMzY3LDcg
QEAgc3RydWN0IHNwaW5hbmRfZWNjX2luZm8geyAgCj4gPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRf
SEFTX1FFX0JJVAkJQklUKDApCj4gPj4+PiAgICAjZGVmaW5lIFNQSU5BTkRfSEFTX0NSX0ZFQVRf
QklUCQlCSVQoMSkKPiA+Pj4+ICAgICNkZWZpbmUgU1BJTkFORF9IQVNfT0NUQUxfRFRSX0JJVAlC
SVQoMikKPiA+Pj4+ICsjZGVmaW5lIFNQSU5BTkRfSEFTX1BPUl9DTURfQklUCQlCSVQoMykgIAo+
ID4+Pj4gICAgPj4gICAvKiogIAo+ID4+Pj4gICAgICogc3RydWN0IHNwaW5hbmRfb25kaWVfZWNj
X2NvbmYgLSBwcml2YXRlIFNQSS1OQU5EIG9uLWRpZSBFQ0MgZW5naW5lIHN0cnVjdHVyZSAgCj4g
Pj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+Cj4gPj4+IFRoYW5rcywKPiA+Pj4gTWlxdcOobAo+ID4+Pgo+
ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+Pj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gPj4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLyAgCj4gPj4+ICAg
ID4+ICAKPiA+PiBUaGFua3MsCj4gPj4gQXB1cnZhIE5hbmRhbiAgCj4gPiAKPiA+IFRoYW5rcywK
PiA+IE1pcXXDqGwKPiA+ICAgCj4gCj4gVGhhbmtzLAo+IEFwdXJ2YSBOYW5kYW4KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
