Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D76C47256
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 18:04:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA69206CD
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 18:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h5tUA1LC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA69206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohSh/OXabKDJZl3XhDzlYvIDjwZIO3n9qBsCpg3Ja5A=; b=h5tUA1LCxrTclY
	xAMK32je/vhP0WJAUXoDUBoo0k89aDs2YC7XQ5+RRdMvHkZJOoemzs1EKWFeqXI+QrIOr6KN7ocli
	xvCpjFKf0AvlfzXr8gk7rd05wNJ516nCvBp7c7rXrxgg4kht1T5mYRAjLdSdKhtFLfP0baC74ZYA5
	LMz/Jx75uGrWGopOrZhvpQaCuIwXjyTYc0MSdIwpyz/i/YD6q4G2zqR7KNjC1pQaGCyskHFePjJYb
	ad/BsygsB4OtO2tfW1Gr9cTcNwcbh4B+RkDsCe1JnswqRkYjRufkvRGVm0L+8uOEor7E0XQ/fn108
	Z8FkvVlqtJVddTPG3CPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUwUv-0007jZ-Kw; Sat, 02 May 2020 18:04:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUwUs-0007h0-4X
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 18:04:20 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8BF6C0006;
 Sat,  2 May 2020 18:04:02 +0000 (UTC)
Date: Sat, 2 May 2020 20:04:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: fix calculating partition end address
Message-ID: <20200502200401.7dfa5def@xps13>
In-Reply-To: <20200309162223.15582d12@xps13>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200309152221.28dc38ab@xps13>
 <e2873d10-2513-8d09-6601-cb542453e10f@milecki.pl>
 <20200309162223.15582d12@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_110418_453900_35AF8328 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYWwsCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZSBvbiBNb24sIDkgTWFyIDIwMjAKMTY6MjI6MjMgKzAxMDA6Cgo+IEhpIFJhZmHFgiwKPiAKPiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IHdyb3RlIG9uIE1vbiwgOSBNYXIgMjAy
MCAxNjowODoxMgo+ICswMTAwOgo+IAo+ID4gT24gMDkuMDMuMjAyMCAxNToyMiwgTWlxdWVsIFJh
eW5hbCB3cm90ZTogIAo+ID4gPiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IHdy
b3RlIG9uIE1vbiwgMDkgTWFyIDIwMjAgMTU6MTk6MTAKPiA+ID4gKzAxMDA6Cj4gPiA+ICAgICAK
PiA+ID4+IE9uIDIwMjAtMDMtMDkgMTU6MDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAgIAo+ID4g
Pj4+IFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAgOSBN
YXIgMjAyMCAwODo0NDo0NQo+ID4gPj4+ICswMTAwOiAgICAKPiA+ID4+PiAgICA+Pj4+IEZyb206
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4gICAgCj4gPiA+Pj4+Pj4gVGhpcyBm
aXhlcyBjaGVjayBmb3IgcGFydGl0aW9ucyB0aGF0IGRvbid0IHN0YXJ0IGF0IGJlZ2lubmluZyBv
ZiB0aGVpciAgICAKPiA+ID4+Pj4gcGFyZW50cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQg
aW4gZm9ybXVsYSBjb3VsZCByZXN1bHQgaW4gZm9yY2luZwo+ID4gPj4+PiByZWFkLW9ubHkgaW5j
b3JyZWN0bHkuICAgIAo+ID4gPj4+Pj4+IEZpeGVzOiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJv
dmUgY2FsY3VsYXRpbmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgPj4gd2hlbiBjaGVja2luZyBmb3Ig
YWxpZ25tZW50IikgICAgCj4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+ICAgZHJpdmVycy9tdGQvbXRk
cGFydC5jIHwgMiArLQo+ID4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKSAgICAKPiA+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRk
cGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jICAgIAo+ID4gPj4+PiBpbmRleCA3MzI4YzA2
NmM1YmEuLmM2ODNiNDMyY2M1ZSAxMDA2NDQKPiA+ID4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbXRk
cGFydC5jCj4gPiA+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ID4gPj4+PiBAQCAt
NTI0LDcgKzUyNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRkX3BhcnQgKmFsbG9jYXRlX3BhcnRpdGlv
bihzdHJ1Y3QgPj4gbXRkX2luZm8gKnBhcmVudCwKPiA+ID4+Pj4gICAJCQlwYXJ0LT5uYW1lKTsK
PiA+ID4+Pj4gICAJfSAgICAKPiA+ID4+Pj4+PiAtCXRtcCA9IHBhcnRfYWJzb2x1dGVfb2Zmc2V0
KHBhcmVudCkgKyBzbGF2ZS0+bXRkLnNpemU7ICAgIAo+ID4gPj4+PiArCXRtcCA9IHBhcnRfYWJz
b2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+b2Zmc2V0ICsgPj4gc2xhdmUtPm10ZC5zaXpl
OyAgICAKPiA+ID4+Pgo+ID4gPj4+IEkgdGhpbmsgeW91IGFyZSBkb2luZyB0aGUgY2hhbmdlIGF0
IHRoZSB3cm9uZyBwbGFjZSwgaWYgeW91IHdhbnQgdG8KPiA+ID4+PiBjaGVjayB3aGVyZSB0aGUg
cGFydGl0aW9uICpzdGFydHMqIHlvdSBzaG91bGQgZG8gaXQgYSBmZXcgbGluZXMgYWJvdmUuCj4g
PiA+Pj4gQnV0IEkgdGhpbmsgdGhlIGNoZWNrIHNob3VsZCBiZSBoZXJlIGFzIHdlbGwsIHByb2Jh
Ymx5LiAgICAKPiA+ID4+Cj4gPiA+PiBUaGUgY2hlY2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3Rh
cnRzKiBpcyBPSyBhbmQgSSBkb24ndCBtZWFuIHRvIGNoYW5nZQo+ID4gPj4gaXQuIFRoZSBidWcg
aXMgYWJvdXQgY2FsY3VsYXRpbmcgYWJzb2x1dGUgKmVuZCogYWRkcmVzcyBvZiBwYXJ0aXRpb24u
ICAgIAo+ID4gPiAKPiA+ID4gQ2FuIHlvdSBkZXRhaWwgYSBsaXR0bGUgYml0IHRoZW4/IEJlY2F1
c2UgSSBkb24ndCBzZWUgdGhlIGlzc3VlIGFueW1vcmUKPiA+ID4gZXZlbiB0aG91Z2ggSSBhbSBj
b252aW5jZWQgc29tZXRoaW5nIGlzIHdyb25nIGhlcmUgOikgICAgCj4gPiAKPiA+IFBsZWFzZSBj
b25zaWRlciBmb2xsb3dpbmcgcGFydGl0aW9ucyBsYXlvdXQ6Cj4gPiAqIGJjbTQ3eHhzZmxhc2gK
PiA+IOKUnOKUgCBib290CQkweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA0MDAwMAo+ID4g4pSU4pSs
IGZpcm13YXJlCTB4MDAwMDAwMDQwMDAwLTB4MDAwMDAxMDAwMDAwCj4gPiAgIOKUnOKUgCBsaW51
eAkweDAwMDAwMDAwMDAxYy0weDAwMDAwMDE4ZjgwMAo+ID4gICDilJTilKwgY29udGFpbmVyCTB4
MDAwMDAwMThmODAwLTB4MDAwMDAwZmMwMDAwCj4gPiAgICDilJzilIAgZm9vCTB4MDAwMDAwMDAw
MDAwLTB4MDAwMDAwNjMwODAwCj4gPiAgICDilJTilIAgYmFyCTB4MDAwMDAwNjMwODAwLTB4MDAw
MDAwZTMwODAwIChzaXplOiAweDgwMDAwMCkKPiA+IAo+ID4gCj4gPiBFeGlzdGluZyAoY29ycmVj
dCkgKnN0YXJ0KiBjYWxjdWxhdGlvbjoKPiA+IGJhciBzdGFydDogMCArIDB4MDQwMDAwICsgMHgx
OGY4MDAgKyAweDYzMDgwMCA9IDB4ODAwMDAwCj4gPiAKPiA+IEV4aXN0aW5nICh3cm9uZykgZW5k
IGNhbGN1bGF0aW9uOgo+ID4gYmFyIGVuZDogMCArIDB4MDQwMDAwICsgMHgxOGY4MDAgKyAweDgw
MDAwMCA9IDB4OWNmODAwCj4gPiAKPiA+IEZpeGVkIChjb3JyZWN0KSBlbmQgY2FsY3VsYXRpb246
Cj4gPiBiYXIgZW5kOiAwICsgMHgwNDAwMDAgKyAweDE4ZjgwMCArIDB4NjMwODAwICsgMHg4MDAw
MDAgPSAweDEwMDAwMDAgIAo+IAo+IE9rIEkgZ2V0IGl0ISBJIHRoaW5rIG1lbnRpb25pbmcgInBh
cnRpdGlvbnMgdGhhdCBkb24ndCBzdGFydCBhdAo+IGJlZ2lubmluZyBvZiB0aGVpciBwYXJlbnRz
IiwgZGVzcGl0ZSBiZWluZyB0cnVlLCB3YXMgbWlzbGVhZGluZyB0byBtZQo+IGFzIEkgdW5kZXJz
dG9vZCAibGVhdmluZyBleHRyYSBzcGFjZSB3aXRoIHRoZSBzdGFydCBvZiB0aGVpciBwYXJlbnQi
Lgo+IAo+IEkgc3VwcG9zZSB5b3UgYWxzbyBoYXZlIHRoZSBpc3N1ZSB3aXRoICJjb250YWluZXIi
IHRvbz8KPiAKPiBBbnl3YXksIEkgdGhpbmsgdGhlIGZpeCBpcyBmaW5lLiBBIGJldHRlciBmb3Jt
dWxhdGlvbiBmb3IgdGhlIGNvbW1pdAo+IGxvZyB3b3VsZCBiZSB3ZWxjb21lIDopIChtYXliZSBh
ZGRpbmcgdGhpcyBleGFtcGxlIGlzIGEgZ29vZCBpZGVhISkKCkkgZG9uJ3QgcmVtZW1iZXIgaGF2
aW5nIGFwcGxpZWQgdGhpcyBmaXggeWV0LCB3b3VsZCB5b3UgbWluZCByZXNlbmRpbmcKdGhpcyBw
YXRjaCB3aXRoIGFuIGVuaGFuY2VkIGNvbW1pdCBsb2cgKHlvdXIgZXhhbXBsZSB3YXMgYSBnb29k
IG9uZSBJCnRoaW5rKS4KClRoYW5rcywKIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
