Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C3AC77B7A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJfXmOknrbcjYm915OE+iLMm8AlAcQGKw89JnDOrneY=; b=JoffIKtujrFfp1
	htxHCLlZAhHcZ8t0IfckXkkg4n/jJVeP9uFAMiWgCkan7NeLsqgDEH+KHoKVOAvtSu/8m/g1JrTcO
	xTO1DaB/TJkS8QiYUcSX0tZfvMrg/dnqpEPZKLb7F52ldHgYyeY+yr9vcziPTehhYKvJDrpY16M/4
	1dLOtcxAcJtB84lnUqKDBped2o0XO7ZzPapcrByUefmbiYN9BRuEeITZurnJMkbG35kIB55U7JnbK
	jIlD+XXM9LVhLtYLRwJ3elTqagyC5kn3BeiwciEM/lnnm8OQEcdzRc6mcglPM9NxM4bfj+i6Vkekq
	qUcirjSM0Tp3u8n2wGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2axQ-003FME-0O;
	Fri, 26 May 2023 17:10:28 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2axM-003FKU-2w
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 17:10:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685121019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2oPNUWNNL25fhmBEP3l9oxTPkh2QIa8Fcfla8UqYMY=;
	b=DwV60i4S9WpyISd2VMkM/2xs8g2l0LWowdoHRYXXw8GFrGpUfP4e+iMC9TEeBkY21WMcEc
	Ok2pf/zNCLj15Y0f7EYIf+MmoBpamRxnHiT0OqkaJ6Vh7UW+GIEpeWjech0ZRS4bVMhQFa
	nPq5qXEWp+L+yQDkEgrzSv5uR8OUAj4+hJiSrKlCo0k+iF3UVTtRFOQeN7BoLw3/XB8lW9
	Mokx+Dg6NoaDiq7+UIsX4pgP/E91nCHE/1bZXv6n91ny8XMzqVK1QRThaXV9RqiUfTFIs/
	hAnMSemzyD4/w1P8xR5/gw/6qDhw2ODPpcExZxI4tWAhc2aRu9UXcN+iIGEMqA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B56FE2000C;
	Fri, 26 May 2023 17:10:16 +0000 (UTC)
Date: Fri, 26 May 2023 19:10:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: ensure timing values are written
Message-ID: <20230526191015.2ea24813@xps-13>
In-Reply-To: <1c039840-25a4-875c-7dc5-f13c522b8156@alliedtelesis.co.nz>
References: <20230523032103.208213-1-chris.packham@alliedtelesis.co.nz>
	<20230523113930.48c631d4@xps-13>
	<1c039840-25a4-875c-7dc5-f13c522b8156@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101025_246585_617C228B 
X-CRM114-Status: GOOD (  27.40  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCAyMyBNYXkgMjAyMyAyMDo0Mjo0NQorMDAwMDoKCj4gT24gMjMvMDUvMjMgMjE6MzksIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBDaHJpcywKPiA+Cj4gPiBjaHJpcy5wYWNraGFtQGFsbGll
ZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVlLCAyMyBNYXkgMjAyMyAxNToyMTowMwo+ID4gKzEy
MDA6Cj4gPiAgCj4gPj4gV2hlbiBuZXcgdGltaW5nIHZhbHVlcyBhcmUgY2FsY3VsYXRlZCBpbiBt
YXJ2ZWxsX25mY19zZXR1cF9pbnRlcmZhY2UoKQo+ID4+IGVuc3VyZSB0aGF0IHRoZXkgd2lsbCBi
ZSBhcHBsaWVkIGluIG1hcnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoKSBieQo+ID4+IGNsZWFyaW5n
IHRoZSBzZWxlY3RlZF9jaGlwIHBvaW50ZXIuCj4gPj4KPiA+PiBTdWdnZXN0ZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PiAgCj4gPiBJ
IGJlbGlldmUgdGhpcyBwYXRjaCBkZXNlcnZlcyBGaXhlcytDYzpzdGFibGU/ICAKPiAKPiBJIGFn
cmVlLiBJIGp1c3Qgd2Fzbid0IHN1cmUgd2hhdCB0byBwb2ludCBhdCB3aXRoIHRoZSBmaXhlcyB0
YWcgc2luY2UgCj4geW91IG1lbnRpb25lZCB0aGF0IGl0J3MgcHJvYmFibHkgYSByZXN1bHQgaW4g
c29tZSBvZiB0aGUgY29yZSBOQU5EIAo+IGluZnJhc3RydWN0dXJlIGNoYW5naW5nLgo+IAo+IE1h
eWJlIGIyNTI1MTQxNGY2ZTAwICgibXRkOiByYXduYW5kOiBtYXJ2ZWxsOiBTdG9wIGltcGxlbWVu
dGluZyAKPiAtPnNlbGVjdF9jaGlwKCkiKSBpcyB0aGUgY29ycmVjdCBjaGFuZ2UgdG8gcG9pbnQg
YXQuICAKClNvdW5kcyByZWFzb25hYmxlLgoKPiAKPiA+PiAtLS0KPiA+Pgo+ID4+IE5vdGVzOgo+
ID4+ICAgICAgVGhpcyBhdCBsZWFzdCBnZXRzIG1lIHRvIGEgcG9pbnQgd2hlcmUgSSBjYW4gaWxs
dXN0cmF0ZWQgdGhlIHByb2JsZW0KPiA+PiAgICAgIHJlcG9ydGVkIHRvIG1lLiBJdCBhcHBlYXJz
IHRoYXQgZGVzcGl0ZSB0aGUgY2hpcCBjb3JyZWN0bHkgcmVwb3J0aW5nCj4gPj4gICAgICBzdXBw
b3J0IGZvciBTRFIgdGltaW5nIG1vZGVzIHVwIHRvIDQgdGhlIG9ic2VydmVkIHRXQyBpcyAyMG5z
LiBJJ3ZlIG5vdAo+ID4+ICAgICAgc2VlbiBhbnkgYWN0dWFsIHByb2JsZW0gcnVubmluZyBpbiB0
aGlzIHN0YXRlIHRoZSBvbmx5IGNvbXBsYWludCBpcyB0aGF0Cj4gPj4gICAgICB0aGUgZGF0YXNo
ZWV0IHNheXMgdGhlIG1pbmltdW0gdFdDIGlzIDI1bnMuCj4gPj4gICAgICAKPiA+PiAgICAgIElm
IEkgbWFrZSBhIGNoYW5nZSB0byBteSBib290bG9hZGVyIHN1Y2ggdGhhdCB0aGUgTkFORCBDbG9j
ayBGcmVxdWVuY3kKPiA+PiAgICAgIFNlbGVjdCBiaXQgKDB4RjI0NDA3MDA6MCkgdG8gMSBiZWZv
cmUgYm9vdGluZyB0aGUga2VybmVsIF9hbmRfIEkgcmVtb3ZlCj4gPj4gICAgICB0aGUgZXh0cmEg
ZmFjdG9yIG9mIDIgZnJvbSB0aGUgcGVyaW9kX25zIGNhbGN1bGF0aW9uIEkgb2JzZXJ2ZSB0V0Mg
b2YKPiA+PiAgICAgIGFib3V0IDYwbnMuIElmIEkgZG9uJ3QgcmVtb3ZlIHRoZSBmYWN0b3Igb2Yg
MiB0aGUgTkFORCBpbnRlcmZhY2UgZG9lc24ndAo+ID4+ICAgICAgd29yayAoY2FuJ3Qgd3JpdGUg
QkJUKS4KPiA+Pgo+ID4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgfCA2
ICsrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+PiBpbmRleCBhZmI0MjQ1NzlmMGIuLjNi
NWU0ZDVkMjIwZiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxs
X25hbmQuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4g
Pj4gQEAgLTI0NTcsNiArMjQ1NywxMiBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX3NldHVwX2lu
dGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ID4+ICAgCQkJTkRU
UjFfV0FJVF9NT0RFOwo+ID4+ICAgCX0KPiA+PiAgIAo+ID4+ICsJLyoKPiA+PiArCSAqIFJlc2V0
IG5mYy0+c2VsZWN0ZWRfY2hpcCBzbyB0aGUgbmV4dCBjb21tYW5kIHdpbGwgY2F1c2UgdGhlIHRp
bWluZwo+ID4+ICsJICogcmVnaXN0ZXJzIHRvIGJlIHJlc3RvcmVkIGluIG1hcnZlbGxfbmZjX3Nl
bGVjdF90YXJnZXQoKS4KPiA+PiArCSAqLyAgCj4gPiBzL3Jlc3RvcmVkL3VwZGF0ZWQvID8KPiA+
Cj4gPiBSZXN0b3JlZCBmZWVscyBsaWtlIHRoZSBjb250ZW50IHZhbmlzaGVkLiAgCj4gT0suIFdp
bGwgc2VuZCBhIHYyIGxhdGVyIHRvZGF5Lgo+ID4+ICsJbmZjLT5zZWxlY3RlZF9jaGlwID0gTlVM
TDsKPiA+PiArCj4gPj4gICAJcmV0dXJuIDA7Cj4gPj4gICB9Cj4gPj4gICAgIAo+ID4KPiA+IFRo
YW5rcywKPiA+IE1pcXXDqCAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
