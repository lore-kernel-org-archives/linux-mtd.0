Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27968EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jPet1HDKiJm3CySI8aZVZXp9TlZiS0MjffcpxDT81I=; b=OBtS3gMdCELYaP
	cUVLRNtaQwB8oXTmJqwvufgvuyS4m+7xKoiu4Pkg1CFCNYwAO/VCqvw+XtChCIyS3300Xb3HMT9Og
	wQmo7/faCGHeXEn67wHB/ydfjlS2N8ZMD0uknhdWnusPbqXIut4e1dRBkSd+xpKMju7AZ29OPwC8e
	20/6CnkvkmPKs5UvB0FL7EsjZHbSTprieLd1fRPGU5Qj0t5Tq0KyttL3o53zJ/cD58+GVk1F2Eheq
	qLhgrvJrUN/yK1Yo8/D1zfkJBayE5dqBBkyjs6zvwdYCtPwNIZRcOj8hY5O3Cipc/dgn8+RT6BI3R
	fuLcqm4jYOjNOfaxRltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qChS3-003iOv-0Q;
	Fri, 23 Jun 2023 14:07:51 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qChRz-003iO9-2p
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jun 2023 14:07:50 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687529259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zsZi+iaTajsGUK6mSJq7oR7yvkvAhncg6W6isNQxXc=;
	b=DcZbBJlclVbVoEDTlD9gRe7ocKc4OKV+PAx6rzK14dMqQyPBiGQMEgLQXsq6ISkZ4EXczt
	h2S8iVbHs5Srj/XgxWeSMH/hPSVtYPDWBlTaEGwpAVKLXBCFeqDXcHhpHwdJbvRYXw2MVy
	Koqct1z16lQzFVeMZKy7xX0TzNJlbM+S1zCR1auBZPGdAg9Vfawq3fANUGhiz5k5zQ3k0F
	hcSV6ed40OLvsROeUWfnzbrRV3bCknHvMkATuOZMa7N2WEQ9IUxEPRppuN5sIYNgr22PIL
	9fF0hgIT5QmCYxJFplzJ4L1N0j7oH+9tEUF/hx7rLe610S86IltzQxBa3XZkTA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C19D1BF203;
	Fri, 23 Jun 2023 14:07:37 +0000 (UTC)
Date: Fri, 23 Jun 2023 16:07:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230623160736.6507fe13@xps-13>
In-Reply-To: <yw1xbkh64dvp.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230622231202.42646e4c@xps-13>
	<yw1xbkh64dvp.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_070748_211909_EEB77084 
X-CRM114-Status: GOOD (  32.75  )
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

SGkgQmVhbiwKCm1hbnNAbWFuc3IuY29tIHdyb3RlIG9uIEZyaSwgMjMgSnVuIDIwMjMgMTI6Mjc6
NTQgKzAxMDA6Cgo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
aXRlczoKPiAKPiA+IEhpIE3DpW5zLAo+ID4KPiA+IG1hbnNAbWFuc3IuY29tIHdyb3RlIG9uIFRo
dSwgMjIgSnVuIDIwMjMgMTU6NTk6MjUgKzAxMDA6Cj4gPiAgCj4gPj4gTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JpdGVzOgo+ID4+ICAgCj4gPj4gPiBGcm9tOiBK
YWltZUxpYW8gPGphaW1lbGlhby50d0BnbWFpbC5jb20+Cj4gPj4gPgo+ID4+ID4gQWRkIHN1cHBv
cnQgZm9yIHNlcXVlbnRpYWwgY2FjaGUgcmVhZHMgZm9yIGNvbnRyb2xsZXJzIHVzaW5nIHRoZSBn
ZW5lcmljCj4gPj4gPiBjb3JlIGhlbHBlcnMgZm9yIHRoZWlyIGZhc3QgcmVhZC93cml0ZSBoZWxw
ZXJzLgo+ID4+ID4KPiA+PiA+IFNlcXVlbnRpYWwgcmVhZHMgbWF5IHJlZHVjZSB0aGUgb3Zlcmhl
YWQgd2hlbiBhY2Nlc3NpbmcgcGh5c2ljYWxseQo+ID4+ID4gY29udGludW91cyBkYXRhIGJ5IGxv
YWRpbmcgaW4gY2FjaGUgdGhlIG5leHQgcGFnZSB3aGlsZSB0aGUgcHJldmlvdXMKPiA+PiA+IHBh
Z2UgZ2V0cyBzZW50IG91dCBvbiB0aGUgTkFORCBidXMuCj4gPj4gPgo+ID4+ID4gVGhlIE9ORkkg
c3BlY2lmaWNhdGlvbiBwcm92aWRlcyB0aGUgZm9sbG93aW5nIGFkZGl0aW9uYWwgY29tbWFuZHMg
dG8KPiA+PiA+IGhhbmRsZSBzZXF1ZW50aWFsIGNhY2hlZCByZWFkczoKPiA+PiA+Cj4gPj4gPiAq
IDB4MzEgLSBSRUFEIENBQ0hFIFNFUVVFTlRJQUw6Cj4gPj4gPiAgIFJlcXVpcmVzIHRoZSBOQU5E
IGNoaXAgdG8gbG9hZCB0aGUgbmV4dCBwYWdlIGludG8gY2FjaGUgd2hpbGUga2VlcGluZwo+ID4+
ID4gICB0aGUgY3VycmVudCBjYWNoZSBhdmFpbGFibGUgZm9yIGhvc3QgcmVhZHMuCj4gPj4gPiAq
IDB4M0YgLSBSRUFEIENBQ0hFIEVORDoKPiA+PiA+ICAgVGVsbHMgdGhlIE5BTkQgY2hpcCB0aGlz
IGlzIHRoZSBlbmQgb2YgdGhlIHNlcXVlbnRpYWwgY2FjaGUgcmVhZCwgdGhlCj4gPj4gPiAgIGN1
cnJlbnQgY2FjaGUgc2hhbGwgcmVtYWluIGFjY2Vzc2libGUgZm9yIHRoZSBob3N0IGJ1dCBubyBt
b3JlCj4gPj4gPiAgIGludGVybmFsIGNhY2hlIGxvYWRpbmcgb3BlcmF0aW9uIGlzIHJlcXVpcmVk
Lgo+ID4+ID4KPiA+PiA+IE9uIHRoZSBidXMsIGEgbXVsdGkgcGFnZSByZWFkIG9wZXJhdGlvbiBp
cyBjdXJyZW50bHkgaGFuZGxlZCBsaWtlIHRoaXM6Cj4gPj4gPgo+ID4+ID4gCTAwIC0tIEFERFIx
IC0tIDMwIC0tIFdBSVRfUkRZICh0Uit0UlIpIC0tIERBVEExX0lOCj4gPj4gPiAJMDAgLS0gQURE
UjIgLS0gMzAgLS0gV0FJVF9SRFkgKHRSK3RSUikgLS0gREFUQTJfSU4KPiA+PiA+IAkwMCAtLSBB
RERSMyAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBM19JTgo+ID4+ID4KPiA+PiA+
IFNlcXVlbnRpYWwgY2FjaGVkIHJlYWRzIG1heSBpbnN0ZWFkIGJlIGFjaGlldmVkIHdpdGg6Cj4g
Pj4gPgo+ID4+ID4gCTAwIC0tIEFERFIxIC0tIDMwIC0tIFdBSVRfUkRZICh0UikgLS0gXAo+ID4+
ID4gCQkgICAgICAgMzEgLS0gV0FJVF9SRFkgKHRSQ0JTWSt0UlIpIC0tIERBVEExX0lOIFwKPiA+
PiA+IAkJICAgICAgIDMxIC0tIFdBSVRfUkRZICh0UkNCU1krdFJSKSAtLSBEQVRBMl9JTiBcCj4g
Pj4gPiAJCSAgICAgICAzRiAtLSBXQUlUX1JEWSAodFJDQlNZK3RSUikgLS0gREFUQTNfSU4KPiA+
PiA+Cj4gPj4gPiBCZWxvdyBhcmUgdGhlIHJlYWQgc3BlZWQgdGVzdCByZXN1bHRzIHdpdGggcmVn
dWxhciByZWFkcyBhbmQKPiA+PiA+IHNlcXVlbnRpYWwgY2FjaGVkIHJlYWRzLCBvbiBOWFAgaS5N
WDYgVkFSLVNPTS1TT0xPIGluIG1hcHBpbmcgbW9kZSB3aXRoCj4gPj4gPiBhIE5BTkQgY2hpcCBj
aGFyYWN0ZXJpemVkIHdpdGggdGhlIGZvbGxvd2luZyB0aW1pbmdzOgo+ID4+ID4gKiB0UjogMjAg
wrVzCj4gPj4gPiAqIHRSQ0JTWTogNSDCtXMKPiA+PiA+ICogdFJSOiAyMCBucwo+ID4+ID4gYW5k
IHRoZSBmb2xsb3dpbmcgZ2VvbWV0cnk6Cj4gPj4gPiAqIGRldmljZSBzaXplOiAyIE1pQgo+ID4+
ID4gKiBlcmFzZWJsb2NrIHNpemU6IDEyOCBraUIKPiA+PiA+ICogcGFnZSBzaXplOiAyIGtpQgo+
ID4+ID4KPiA+PiA+ID09PT09PT09PT09PT0gTm9ybWFsIHJlYWQgQCAzM01IeiA9PT09PT09PT09
PT09PT09PQo+ID4+ID4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDE1
NjMzIEtpQi9zCj4gPj4gPiBtdGRfc3BlZWR0ZXN0OiBwYWdlIHJlYWQgc3BlZWQgaXMgMTU1MTUg
S2lCL3MKPiA+PiA+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDE1Mzk4IEtp
Qi9zCj4gPj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPiA+PiA+Cj4gPj4gPiA9PT09PT09PT0gU2VxdWVudGlhbCBjYWNoZSByZWFkIEAgMzNN
SHogPT09PT09PT09PT0KPiA+PiA+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlYmxvY2sgcmVhZCBzcGVl
ZCBpcyAxODI4NSBLaUIvcwo+ID4+ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlz
IDE1ODc1IEtpQi9zCj4gPj4gPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAx
NjI1MyBLaUIvcwo+ID4+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gPj4gPgo+ID4+ID4gV2Ugb2JzZXJ2ZSBhbiBvdmVyYWxsIHNwZWVkIGlt
cHJvdmVtZW50IG9mIGFib3V0IDUlIHdoZW4gcmVhZGluZwo+ID4+ID4gMiBwYWdlcywgdXAgdG8g
MTUlIHdoZW4gcmVhZGluZyBhbiBlbnRpcmUgYmxvY2suIFRoaXMgaXMgZHVlIHRvIHRoZQo+ID4+
ID4gfjE0dXMgZ2FpbiBvbiBlYWNoIGFkZGl0aW9uYWwgcGFnZSByZWFkICh0UiAtICh0UkNCU1kg
KyB0UlIpKS4KPiA+PiA+Cj4gPj4gPiBDby1kZXZlbG9wZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogSmFp
bWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAxMTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQo+ID4+ID4gIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgIHwgICA5ICsr
Kwo+ID4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pICAgIAo+ID4+IAo+ID4+IFRoaXMgY2hhbmdlIGJyb2tlIHNvbWV0aGluZyBvbiBhIFRJIEFN
MzUxNyBiYXNlZCBzeXN0ZW0uICBXaGF0IEknbQo+ID4+IG5vdGljaW5nIGlzIHRoYXQgdGhlIHUt
Ym9vdCBmd19zZXRlbnYgdG9vbCBpcyBmYWlsaW5nIGR1ZSB0byB0aGUKPiA+PiBNRU1HRVRCQURC
TE9DSyBpb2N0bCByZXBvcnRpbmcgc29tZSBibG9ja3MgYXMgYmFkIHdoZW4gdGhleSBhcmUgbm90
Lgo+ID4+IEV2ZXJ5dGhpbmcgZWxzZSBpcywgc29tZWhvdywgd29ya2luZyBmaW5lLiAgUmV2ZXJ0
aW5nIHRoaXMgY29tbWl0IGZpeGVzCj4gPj4gaXQsIHRob3VnaCBJIGRvbid0IGtub3cgd2h5LiAg
SSdtIHNlZWluZyB0aGUgc2FtZSBiZWhhdmlvdXIgb24gbXVsdGlwbGUKPiA+PiBkZXZpY2VzLCBz
byBJIGRvdWJ0IHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBmbGFzaCBtZW1vcnkuCj4gPj4g
Cj4gPj4gSXMgdGhlcmUgYW55dGhpbmcgSSBjYW4gdGVzdCB0byBnZXQgbW9yZSBpbmZvcm1hdGlv
bj8KPiA+PiAgIAo+ID4KPiA+IE1heSBJIGtub3cgd2hhdCBOQU5EIGNoaXAgeW91IGFyZSB1c2lu
Zz8gIAo+IAo+IEl0J3MgYSBNaWNyb24gTVQyOUY0RzE2QUJCREFINC1JVDpELiAgRnJvbSB0aGUg
a2VybmVsIGxvZ3M6Cj4gCj4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4
MmMsIENoaXAgSUQ6IDB4YmMKPiBuYW5kOiBNaWNyb24gTVQyOUY0RzE2QUJCREFINAo+IG5hbmQ6
IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Ig
c2l6ZTogNjQKClRoZXJlIGlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHdyb25nIHdpdGggTWljcm9u
J3MgaGFuZGxpbmcgb2YgdGhlCnNlcXVlbnRpYWwgcmVhZHMuIENhbiB5b3UgbWFrZSBhIHNldHVw
IG9uIHlvdXIgc2lkZSB3aXRoIG9uZSBvZiB0aGVzZQpjaGlwcyBhbmQgdHJ5IHRvIHJlcHJvZHVj
ZT8KCkkgd2lsbCBoYXZlIHRvIGRpc2NhcmQgTWljcm9uJ3MgY2hpcHMgaWYgd2UgZG9uJ3QgZmlu
ZCBhIHNvbHV0aW9uIHZlcnkKc29vbiwgdG9vIGJhZCwgaXQgaXMgYSBuaWNlIHBlcmZvcm1hbmNl
IGltcHJvdmVtZW50IC13aGVuIGl0IHdvcmtzLS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
