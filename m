Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9988BC0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/EW0OY1cJuOLXqK9Y3VQsmjQXX8WqZNdo0qp7e1ohw=; b=WVH2bydOMA3cbY
	DFESUsK4POrjDDZus8MVaKx6D+YuatMpixt046we/FD9spbVLB8iH6A/4f2EwV4wqu9Ur4yZf4Ck6
	Cc2EBXtV+llCFUiQWsAtrHcus6BriZFTQDYWFyAK1T9tdlEpMvRyEhecJXnRS19fWoAaQlvr+O78X
	Qaa5fxh9A2Q6Bz4pn6JjwKA2RlrBPA0h7axQRDil8Ni7QLGRRH8UlO0V2vDGDc2cWkIyGmkZuAmFX
	z49oq1xcVWp3ELiE76x6FgMAFqNkgaE0B6E3wn5GJEyN0FO1nskrQxVT6ot4SULvkV9mvzBQxZRHw
	BS7kZEpr1HvQECGp76Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwgT-00F0fz-19;
	Wed, 05 Jul 2023 07:12:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwgP-00F0dF-2h
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 07:12:16 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688541122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7jc5eO5JMencMFX5rVgNG4uz5Hx+04V7kPTSHBHoYk=;
	b=kb+tLd7fuJE8DgNzgVSRlmgLxcOsOM8NrhodvtvjGnCKwT25KER16HNPwA1bXuvqlcuEsq
	kY3h/wf8EwjREtY7FbB/C/EsOiS3NqxV7kPGoPrLEs3J2Hksz6Elvn5pSW/I6FVBPLu8YT
	PzHHSlKxlwfFPAUIdcTCMZ6aGG6FURigxcEPxgFVo98sX7+mpk+Nhir1SZwWRklNVcvTLL
	hrVOpQpJUXKYjVZ7ZnIFlEhrwtDxaBzU88CDNH3LjUvYJMPMxd9tSYCLKdVg9/ur8MRyKF
	R9Ct9hfJdNHiNy6laijYXleLgCv6N/LWcyvxxLG1Rt31rlwkcLKm+uafHJo3vg==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6699E2000D;
	Wed,  5 Jul 2023 07:11:59 +0000 (UTC)
Date: Wed, 5 Jul 2023 09:11:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <bbrezillon@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v3 5/5] mtd: rawnand: brcmnand: Fix mtd oobsize
Message-ID: <20230705091158.2fe0a271@xps-13>
In-Reply-To: <c09a72df-c49f-75e9-e95e-4e19fe10a278@broadcom.com>
References: <20230627193738.19596-1-william.zhang@broadcom.com>
	<20230627193738.19596-6-william.zhang@broadcom.com>
	<20230704173047.395e445e@xps-13>
	<c09a72df-c49f-75e9-e95e-4e19fe10a278@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_001214_140892_2656FABE 
X-CRM114-Status: GOOD (  30.14  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgNCBK
dWwgMjAyMyAxNzo1MDoyOCAtMDcwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDA3LzA0LzIwMjMg
MDg6MzAgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBXaWxsaWFtLAo+ID4gCj4gPiB3
aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBUdWUsIDI3IEp1biAyMDIzIDEyOjM3
OjM4IC0wNzAwOgo+ID4gICAKPiA+PiBicmNtbmFuZCBjb250cm9sbGVyIGNhbiBvbmx5IGFjY2Vz
cyB0aGUgZmxhc2ggc3BhcmUgYXJlYSB1cCB0byBjZXJ0YWluCj4gPj4gYnl0ZXMgYmFzZWQgb24g
dGhlIEVDQyBsZXZlbC4gSXQgY2FuIGJlIGxlc3MgdGhhbiB0aGUgYWN0dWFsIGZsYXNoIHNwYXJl
Cj4gPj4gYXJlYSBzaXplLiBGb3IgZXhhbXBsZSwgZm9yIG1hbnkgTkFORCBjaGlwIHN1cHBvcnRp
bmcgRUNDIEJDSC04LCBpdCBoYXMKPiA+PiAyMjYgYnl0ZXMgc3BhcmUgYXJlYS4gQnV0IGNvbnRy
b2xsZXIgY2FuIG9ubHkgdXNlcyAyMTggYnl0ZXMuIFNvIGJyY21hbmQKPiA+PiBkcml2ZXIgb3Zl
cnJpZGVzIHRoZSBtdGQgb29ic2l6ZSB3aXRoIHRoZSBjb250cm9sbGVyJ3MgYWNjZXNzaWJsZSBz
cGFyZQo+ID4+IGFyZWEgc2l6ZS4gV2hlbiB0aGUgbmFuZCBiYXNlIGRyaXZlciB1dGlsaXplcyB0
aGUgbmFuZF9kZXZpY2Ugb2JqZWN0LCBpdAo+ID4+IHJlc2V0cyB0aGUgb29ic2l6ZSBiYWNrIHRv
IHRoZSBhY3R1YWwgZmxhc2ggc3BhcmUgYXByZWEgc2l6ZSBmcm9tCj4gPj4gbmFuZF9tZW1vcnlf
b3JnYW5pemF0aW9uIHN0cnVjdHVyZSBhbmQgY29udHJvbGxlciBtYXkgbm90IGFibGUgdG8gYWNj
ZXNzCj4gPj4gYWxsIHRoZSBvb2IgYXJlYSBhcyBtdGQgYWR2aXNlcy4KPiA+Pgo+ID4+IFRoaXMg
Y2hhbmdlIGZpeGVzIHRoZSBpc3N1ZSBieSBvdmVycmlkaW5nIHRoZSBvb2JzaXplIGluIHRoZQo+
ID4+IG5hbmRfbWVtb3J5X29yZ2FuaXphdGlvbiBzdHJ1Y3R1cmUgdG8gdGhlIGNvbnRyb2xsZXIn
cyBhY2Nlc3NpYmxlIHNwYXJlCj4gPj4gYXJlYSBzaXplLiAgCj4gPiAKPiA+IEkgYW0gY2xlYXJs
eSBub3QgYSBiaWcgZmFuIG9mIHRoaXMgc29sdXRpb24uIG1lbW9yZyBzaG91bGQgYmUgYW5kCj4g
PiByZW1haW4gYSByZWFkIG9ubHkgb2JqZWN0LiBDYW4geW91IHBsZWFzZSBmaW5kIGFub3RoZXIg
c29sdXRpb24/Cj4gPiAgIAo+IEkgd2FzIGRlYmF0aW5nIG9uIHRoaXMgdG9vIGJ1dCBJIGRvbid0
IHNlZSBvcHRpb24gYmVjYXVzZSB0aGVyZSBpcyBubyBvdGhlciBob29rcyBhZnRlciBuYW5kZGV2
X2luaXQgdG8gc2V0IHRoZSBtdGQtPm9vYnNpemUgYXMgZmFyIGFzIEkgY2FuIHNlZSBhbmQgSSBz
ZWUgdGhlcmUgd2VyZSBzaW1pbGFyIGZpeGVzIGZvciBvdGhlciBjb250cm9sbGVyIGRyaXZlcnMg
YWZ0ZXIgdGhlIG5hbmQgZGV2aWNlIG9iamVjdCBpbml0IHdhcyBjb21taXR0ZWQsIGZvciBleGFt
cGxlOgo+IEZpeGVzOiA2MjlhNDQyY2FkNWYgKCJtdGQ6IHJhd25hbmQ6IEZpbGwgbWVtb3JnIGR1
cmluZyBkZXRlY3Rpb24iKQoKWW91IGFyZSByaWdodCwgdGhhdCB3YXMgaW5kZWVkIHRoZSBmaXJz
dCBhcHByb2FjaCwgSSdsbCByZW1haW4gb24gdGhpcwpwYXRoIHRoZW4uIFRoYW5rcyBmb3IgdGhl
IHBvaW50ZXIuCgo+IAo+IEkgd2lsbCB0aGluayB0aHJvdWdoIHRoaXMgYWdhaW4gYnV0IEkgYW0g
b3BlbiB0byBhbnkgc3VnZ2VzdGlvbi4KPiAKPiA+Pgo+ID4+IEZpeGVzOiBhN2FiMDg1ZDdjMTYg
KCJtdGQ6IHJhd25hbmQ6IEluaXRpYWxpemUgdGhlIG5hbmRfZGV2aWNlIG9iamVjdCIpCj4gPj4g
U2lnbmVkLW9mZi1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+
Cj4gPj4KPiA+PiAtLS0KPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiA+PiBDaGFuZ2Vz
IGluIHYyOiBOb25lCj4gPj4KPiA+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA3ICsrKysrLS0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKPiA+PiBpbmRleCA0MDdiZjc5Y2JhZjQuLjM5YzdmNTQ3ZGIxZiAxMDA2NDQK
PiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4+IEBAIC0y
NjQ3LDYgKzI2NDcsOCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJj
bW5hbmRfaG9zdCAqaG9zdCkKPiA+PiAgIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gJmhvc3Qt
PmNoaXA7Cj4gPj4gICAJY29uc3Qgc3RydWN0IG5hbmRfZWNjX3Byb3BzICpyZXF1aXJlbWVudHMg
PQo+ID4+ICAgCQluYW5kZGV2X2dldF9lY2NfcmVxdWlyZW1lbnRzKCZjaGlwLT5iYXNlKTsKPiA+
PiArCXN0cnVjdCBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24gKm1lbW9yZyA9Cj4gPj4gKwkJbmFu
ZGRldl9nZXRfbWVtb3JnKCZjaGlwLT5iYXNlKTsKPiA+PiAgIAlzdHJ1Y3QgYnJjbW5hbmRfY29u
dHJvbGxlciAqY3RybCA9IGhvc3QtPmN0cmw7Cj4gPj4gICAJc3RydWN0IGJyY21uYW5kX2NmZyAq
Y2ZnID0gJmhvc3QtPmh3Y2ZnOwo+ID4+ICAgCWNoYXIgbXNnWzEyOF07Cj4gPj4gQEAgLTI2Njgs
MTAgKzI2NzAsMTEgQEAgc3RhdGljIGludCBicmNtbmFuZF9zZXR1cF9kZXYoc3RydWN0IGJyY21u
YW5kX2hvc3QgKmhvc3QpCj4gPj4gICAJaWYgKGNmZy0+c3BhcmVfYXJlYV9zaXplID4gY3RybC0+
bWF4X29vYikKPiA+PiAgIAkJY2ZnLT5zcGFyZV9hcmVhX3NpemUgPSBjdHJsLT5tYXhfb29iOwo+
ID4+ICAgCS8qCj4gPj4gLQkgKiBTZXQgb29ic2l6ZSB0byBiZSBjb25zaXN0ZW50IHdpdGggY29u
dHJvbGxlcidzIHNwYXJlX2FyZWFfc2l6ZSwgYXMKPiA+PiAtCSAqIHRoZSByZXN0IGlzIGluYWNj
ZXNzaWJsZS4KPiA+PiArCSAqIFNldCBtdGQgYW5kIG1lbW9yZyBvb2JzaXplIHRvIGJlIGNvbnNp
c3RlbnQgd2l0aCBjb250cm9sbGVyJ3MKPiA+PiArCSAqIHNwYXJlX2FyZWFfc2l6ZSwgYXMgdGhl
IHJlc3QgaXMgaW5hY2Nlc3NpYmxlLgo+ID4+ICAgCSAqLwo+ID4+ICAgCW10ZC0+b29ic2l6ZSA9
IGNmZy0+c3BhcmVfYXJlYV9zaXplICogKG10ZC0+d3JpdGVzaXplID4+IEZDX1NISUZUKTsKPiA+
PiArCW1lbW9yZy0+b29ic2l6ZSA9IG10ZC0+b29ic2l6ZTsgIAo+ID4+ICAgPj4gICAJY2ZnLT5k
ZXZpY2Vfc2l6ZSA9IG10ZC0+c2l6ZTsgIAo+ID4+ICAgCWNmZy0+YmxvY2tfc2l6ZSA9IG10ZC0+
ZXJhc2VzaXplOyAgCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gICAKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
