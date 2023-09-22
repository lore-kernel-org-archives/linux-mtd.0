Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4E7CD4F3B
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj2lC+C1QV3BUmFIKiiXy9PSdaKcE5zj3iZ8zjnjnk0=; b=DGR7uxPYB/zeBn
	lojilBymdfERad0Q4IhVQNoVBHWs3gm/3kghhlcGk65S/+PdahR8OE1DtxTzvA+gvdV3uaLlnX0ag
	kny1A2ggCf6u0Z94NSDbzHs/uALna4r+xAYtKFA86YZly2gsWOflh3rZf49/GrV0rzqG5PE4AEvC9
	aO7ax3ms23jXGnnsFm3fgd6WvOQzaqbgfZ73tjDFq3QGnQy39zJ+9qKNdAJN8d2WWWVxEL7015mFa
	6nVUMYi6NYaUuph53XXjsoh/dIw6eGwOM4xOq2hmYFlHdIiBNTbgkZUHobr1lwdZLoMhoNRyAtz0T
	j8em3oG7DoX5mzOWynJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcHv-008Y3F-1x;
	Fri, 22 Sep 2023 09:17:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcHr-008Y1F-33
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 09:17:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BD7920003;
	Fri, 22 Sep 2023 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695374240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlogHQgO5T+gATNqDNwjL4VIKOH0zcqYGHyyk8W/NLQ=;
	b=oA6IA8QJs8IIO3OS0wYAgH5iIYyP6WCjR1KNCbOsx6wA8HWnO2kpVftq9yzylY7vbddRjq
	yT840RMpa12UU8DZEYclmgSjGw55lC85pKxRj8DQ7KYlSO8rhmAK3hUqJ3ve4iLiplv3hd
	rPtZW5O0f/VXkrH35q43dszO48P/AlxQxnQLIOBoEAPgl8DC5IF6VFzqhOkZkw8DDXY4Zw
	7P6hdcEJkb/XKKi/d6XSrgNhogotaVoNUJqe+BhvpDG7hMNdfrlUKwX/pYtupr4m88wtCc
	5MVxjRnXvwSQW8YnhfMdSkGcFY0and8lLl1KW/fgKNSwOyszHZIewWf6Z+TZ1w==
Date: Fri, 22 Sep 2023 11:17:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page
 operations are successful
Message-ID: <20230922111718.088ff61a@xps-13>
In-Reply-To: <cfc032b5-dfa4-485f-a2f1-5085964f6697@amd.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
	<20230717194221.229778-2-miquel.raynal@bootlin.com>
	<20230911175247.44c1d894@xps-13>
	<cf1a0b96-0f1e-4a6d-960b-93185faf27ba@amd.com>
	<20230912161752.581019bc@xps-13>
	<ead8ac00-cc2d-4258-aac1-af5eed93de7b@amd.com>
	<20230922111437.57804995@xps-13>
	<cfc032b5-dfa4-485f-a2f1-5085964f6697@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_021724_268491_EA262C6E 
X-CRM114-Status: GOOD (  26.02  )
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

SGkgTWljaGFsLAoKbWljaGFsLnNpbWVrQGFtZC5jb20gd3JvdGUgb24gRnJpLCAyMiBTZXAgMjAy
MyAxMToxNjoyMCArMDIwMDoKCj4gT24gOS8yMi8yMyAxMToxNCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpIE1pY2hhbCwKPiA+IAo+ID4gbWljaGFsLnNpbWVrQGFtZC5jb20gd3JvdGUgb24g
VGh1LCAyMSBTZXAgMjAyMyAxMjoyNToxMCArMDIwMDoKPiA+ICAgCj4gPj4gT24gOS8xMi8yMyAx
NjoxNywgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+PiBIaSBNaWNoYWwsCj4gPj4+Cj4gPj4+
IG1pY2hhbC5zaW1la0BhbWQuY29tIHdyb3RlIG9uIFR1ZSwgMTIgU2VwIDIwMjMgMTU6NTU6MjMg
KzAyMDA6ICAKPiA+Pj4gICAgPj4+PiBIaSBNaXF1ZWwsICAKPiA+Pj4+Cj4gPj4+PiBPbiA5LzEx
LzIzIDE3OjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+Pj4gSGkgTWljaGFsLAo+ID4+
Pj4+Cj4gPj4+Pj4gbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBNb24sIDE3IEp1
bCAyMDIzIDIxOjQyOjIwICswMjAwOiAgCj4gPj4+Pj4gICAgID4+Pj4gVGhlIE5BTkQgY29yZSBj
b21wbGllcyB3aXRoIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIHdoaWNoIGl0c2VsZiAgCj4gPj4+
Pj4+IG1lbnRpb25zIHRoYXQgYWZ0ZXIgYW55IHByb2dyYW0gb3IgZXJhc2Ugb3BlcmF0aW9uLCBh
IHN0YXR1cyBjaGVjawo+ID4+Pj4+PiBzaG91bGQgYmUgcGVyZm9ybWVkIHRvIHNlZSB3aGV0aGVy
IHRoZSBvcGVyYXRpb24gd2FzIGZpbmlzaGVkICphbmQqCj4gPj4+Pj4+IHN1Y2Nlc3NmdWwuCj4g
Pj4+Pj4+Cj4gPj4+Pj4+IFRoZSBOQU5EIGNvcmUgb2ZmZXJzIGhlbHBlcnMgdG8gZmluaXNoIGEg
cGFnZSB3cml0ZSAoc2VuZGluZyB0aGUKPiA+Pj4+Pj4gIlBBR0UgUFJPRyIgY29tbWFuZCwgd2Fp
dGluZyBmb3IgdGhlIE5BTkQgY2hpcCB0byBiZSByZWFkeSBhZ2FpbiwgYW5kCj4gPj4+Pj4+IGNo
ZWNraW5nIHRoZSBvcGVyYXRpb24gc3RhdHVzKS4gQnV0IGluIHNvbWUgY2FzZXMsIGFkdmFuY2Vk
IGNvbnRyb2xsZXIKPiA+Pj4+Pj4gZHJpdmVycyBtaWdodCB3YW50IHRvIG9wdGltaXplIHRoaXMg
YW5kIGNyYWZ0IHRoZWlyIG93biBwYWdlIHdyaXRlCj4gPj4+Pj4+IGhlbHBlciB0byBsZXZlcmFn
ZSBhZGRpdGlvbmFsIGhhcmR3YXJlIGNhcGFiaWxpdGllcywgdGh1cyBub3QgYWx3YXlzCj4gPj4+
Pj4+IHVzaW5nIHRoZSBjb3JlIGZhY2lsaXRpZXMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IFNvbWUgZHJp
dmVycywgbGlrZSB0aGlzIG9uZSwgZG8gbm90IHVzZSB0aGUgY29yZSBoZWxwZXIgdG8gZmluaXNo
IGEgcGFnZQo+ID4+Pj4+PiB3cml0ZSBiZWNhdXNlIHRoZSBmaW5hbCBjeWNsZXMgYXJlIGF1dG9t
YXRpY2FsbHkgbWFuYWdlZCBieSB0aGUKPiA+Pj4+Pj4gaGFyZHdhcmUuIEluIHRoaXMgY2FzZSwg
dGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5Cj4gPj4+Pj4+IHBl
cmZvcm0gdGhlIGZpbmFsIHN0YXR1cyBjaGVjay4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gTGV0J3MgcmVh
ZCB0aGUgTkFORCBjaGlwIHN0YXR1cyBhdCB0aGUgZW5kIG9mIHRoZSBwYWdlIHdyaXRlIGhlbHBl
ciBhbmQKPiA+Pj4+Pj4gcmV0dXJuIC1FSU8gdXBvbiBlcnJvci4KPiA+Pj4+Pj4KPiA+Pj4+Pj4g
Q2M6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQGFtZC5jb20+Cj4gPj4+Pj4+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gPj4+Pj4+IEZpeGVzOiA4OGZmZWYxYjY1Y2YgKCJtdGQ6IHJh
d25hbmQ6IGFyYXNhbjogU3VwcG9ydCB0aGUgaGFyZHdhcmUgQkNIIEVDQyBlbmdpbmUiKQo+ID4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+ID4+Pj4+Pgo+ID4+Pj4+PiAtLS0KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSGVsbG8gTWljaGFs
LAo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIGhhdmUgbm90IHRlc3RlZCB0aGlzLCBidXQgYmFzZWQgb24g
YSByZXBvcnQgb24gYW5vdGhlciBkcml2ZXIsIEkKPiA+Pj4+Pj4gYmVsaWV2ZSB0aGUgc3RhdHVz
IGNoZWNrIGlzIGFsc28gbWlzc2luZyBoZXJlIGFuZCBjb3VsZCBzb21ldGltZXMKPiA+Pj4+Pj4g
bGVhZCB0byB1bm5vdGljZWQgcGFydGlhbCB3cml0ZXMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IFBsZWFz
ZSB0ZXN0IG9uIHlvdXIgc2lkZSB0aGF0IGV2ZXJ5dGhpbmcgc3RpbGwgd29ya3MgYW5kIGxldCBt
ZQo+ID4+Pj4+PiBrbm93IGhvdyBpdCBnb2VzLiAgCj4gPj4+Pj4KPiA+Pj4+PiBBbnkgbmV3cyBm
cm9tIHRoZSB0ZXN0aW5nIHRlYW0gYWJvdXQgcGF0Y2hlcyAyLzMgYW5kIDMvMz8gIAo+ID4+Pj4K
PiA+Pj4+IEkgYXNrZWQgQW1pdCB0byB0ZXN0IGFuZCBoZSBkaWRuJ3QgZ2V0IGJhY2sgdG8gbWUg
ZXZlbiBJIGFza2VkIGZvciBpdCBjb3VwbGUgb2YgdGltZXMuICAKPiA+Pj4KPiA+Pj4gT2suICAK
PiA+Pj4gICAgPj4+PiBDYW4geW91IHBsZWFzZSB0ZWxsIG1lIGhvdyB0byB0ZXN0IGl0PyBJIHdp
bGwgc2V0dXAgSFcgbXlzZWxmIGFuZCB0ZXN0IGl0IGFuZCBnZXQgYmFjayB0byB5b3UuICAKPiA+
Pj4KPiA+Pj4gSSBiZWxpZXZlIHNldHRpbmcgdXAgdGhlIGJvYXJkIHRvIHVzZSB0aGUgaGFyZHdh
cmUgQkNIIGVuZ2luZSBhbmQKPiA+Pj4gcGVyZm9ybWluZyBiYXNpYyBlcmFzZS93cml0ZS9yZWFk
IHRlc3Rpbmcgd2l0aCBhIGtub3duIGZpbGUgYW5kIGNoZWNrCj4gPj4+IGl0IHN0aWxsIGJlaGF2
ZXMgY29ycmVjdGx5IHdvdWxkIHdvcmsuIFlvdSBjYW4gYWxzbyBydW4KPiA+Pj4KPiA+Pj4gCW5h
bmRiaXRlcnJzIC1pIC9kZXYvbXRkeAo+ID4+Pgo+ID4+PiBhcyBhIHNlY29uZCBzdGVwIGFuZCB2
ZXJpZnkgdGhlcmUgaXMgbm8gZGlmZmVyZW5jZSB3aXRoIGFuZCB3aXRob3V0IHRoZQo+ID4+PiBw
YXRjaCBhbmQgZmluYWxseSBjaGVjayB0aGUgaW1wYWN0Ogo+ID4+Pgo+ID4+PiAJZmxhc2hfc3Bl
ZWQgLWQgLWMgMTAgL2Rldi9tdGR4Cj4gPj4+IAkoYmUgY2FyZWZ1bDogdGhpcyBpcyBhIGRlc3Ry
dWN0aXZlIG9wZXJhdGlvbikgIAo+ID4+Cj4gPj4gVGVzdGluZyB0ZWFtIHdvbid0IHNlZSBhbnkg
aXNzdWUgdGhhdCdzIHdoeSBmZWVsIGZyZWUgdG8gYWRkIG15Cj4gPj4gQWNrZWQtYnk6IE1pY2hh
bCBTbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4gIAo+ID4gCj4gPiBJIHRoaW5rIHlvdSB0b2xk
IG1lIGluIHRoZSBsYXN0IGUtbWFpbCB5b3UgdGVzdGVkIHRoZSBwbDM1MyBwYXRjaCwgbm90Cj4g
PiB0aGUgb25lIGZvciB0aGUgQXJhc2FuIGNvbnRyb2xsZXIuIFNoYWxsIEkgYWRkIHlvdXIgQWNr
ZWQtYnkgaGVyZSBhbmQKPiA+IHlvdXIgVGVzdGVkLWJ5IGluIHRoZSBvdGhlcj8gIAo+IAo+IFll
cyBleGFjdGx5Lgo+IEkgdGVzdGVkIHBsMzUzIG15c2VsZi4gSWYgdGhhdCBsb2cgbG9va3MgZ29v
ZCBmZWVsIGZyZWUgdG8gYWRkIG15IFRlc3RlZC1ieSB0YWcuCj4gQW5kIEkgZ290IGluZm9ybWF0
aW9uIGZyb20gdGVzdGluZyB0ZWFtIHRoYXQgdGhleSB0ZXN0ZWQgQXJhc2FuIG9uZSBoZW5jZSBv
bmx5IEFjayBvbmUuCgpQZXJmZWN0LiBUaGFua3MgYSBsb3QhCgpNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
