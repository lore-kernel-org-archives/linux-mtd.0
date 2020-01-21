Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A86C2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 13:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC14217F4
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 13:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kpe2p+6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC14217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9vH26CreVs44TzDanV+6ebvDF294jjkQ/+ilfo7AC8=; b=Kpe2p+6+hNtjpq
	VEyZ37KXa7i893ImPou+0lcdOtLGibQiDC2/F+qSL1Hma2Dqes7GPEsZMnABpLbkb3xhp69ToaaZx
	by9GlwaXi1rmLsv/5/5D2+zZrPpT2L0Bios/+CB2k4eQk+ivZ1yljZzNNK8G9aTdsZeBhiZJVYWVt
	bAR6x67+P23v05lgTx0W37K1ClXxQQwKV/bgNiZKIIklcg1/zLSArzho6D0HxogO/GMWoVlPjDM2/
	ZHpxGoJaqxrgQNpq1NZXYt8B+NaRlUeDnSVtG2qfK6omhyNgC0Vlo+ofrBPGO7v5+MsiBYokmyQZN
	68Rx/t6EMvWBz4XT/LRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ittm7-0007uO-7R; Tue, 21 Jan 2020 13:40:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ittlz-0007tW-Gn
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2020 13:40:57 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CED78FF809;
 Tue, 21 Jan 2020 13:40:34 +0000 (UTC)
Date: Tue, 21 Jan 2020 14:40:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI
 NAND devices
Message-ID: <20200121144034.05a8f49d@xps13>
In-Reply-To: <MN2PR08MB6397062A37D39287E820A0D8B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-4-sshivamurthy@micron.com>
 <20200120111626.7cb2f6c5@xps13>
 <MN2PR08MB6397062A37D39287E820A0D8B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_054051_831808_82A49404 
X-CRM114-Status: GOOD (  29.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Shivamurthy Shastri <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpUdWUsIDIxIEphbiAyMDIwIDEyOjIzOjIw
ICswMDAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiAKPiA+IEhpIFNoaXZhLAo+ID4gCj4gPiBUaGlz
IGlzIHJlbWFyayBjb21tb24gdG8gdGhlIGZvdXIgcGF0Y2hlczogeW91IG1pc3MgdGhlICd2Micg
cHJlZml4IGluCj4gPiB0aGUgb2JqZWN0Lgo+ID4gICAKPiAKPiBTb3JyeSBmb3IgdGhpcyBtaXN0
YWtlLgo+IEkgcmVjb2duaXplZCB0aGlzIGFmdGVyIHNlbmRpbmcgb3V0IHRoZSBwYXRjaGVzLgo+
IAo+ID4gc2hpdmEubGludXh3b3Jrc0BnbWFpbC5jb20gd3JvdGUgb24gU3VuLCAxOSBKYW4gMjAy
MCAxNTo1NDozMSArMDEwMDoKPiA+ICAgCj4gPiA+IEZyb206IFNoaXZhbXVydGh5IFNoYXN0cmkg
PHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+ID4gPgo+ID4gPiBBZGQgZGV2aWNlIHRhYmxlIGZv
ciBNNzBBIHNlcmllcyBNaWNyb24gU1BJIE5BTkQgZGV2aWNlcy4KPiA+ID4KPiA+ID4gV2hpbGUg
YXQgaXQsIGRpc2FibGUgdGhlIENvbnRpbnVvdXMgUmVhZCBmZWF0dXJlIHdoaWNoIGlzIGVuYWJs
ZWQgYnkKPiA+ID4gZGVmYXVsdC4gIAo+ID4gCj4gPiBDYW4geW91IHBsZWFzZSBnaXZlIHVzIG1v
cmUgZGV0YWlsIG9uIHdoeSB0aGlzIGlzIGFuIGlzc3VlPyAgCj4gCj4gIkNvbnRpbnVvdXMgUmVh
ZCIgaXMgdGhlIG5ldyBmZWF0dXJlIGFkZGVkIGJ5IHRoZSBNaWNyb24gZm9yIAo+IE03MEEgc2Vy
aWVzIGRldmljZXMuIElmIHRoaXMgZmVhdHVyZSBpcyBlbmFibGVkLCB0aGUgUkVBRCBjb21tYW5k
IAo+IGRvZXNuJ3Qgb3V0cHV0IHRoZSBPT0IgYXJlYS4gVGhlIGZvbGxvd2luZyBzaG9ydCBkZXNj
cmlwdGlvbgo+IGRlc2NyaWJlcyB0aGlzIGZlYXR1cmUuCj4gCj4gRGVzY3JpcHRpb246Cj4gSWYg
dGhlIENvbnRpbnVvdXMgUmVhZCBmZWF0dXJlIGlzIGVuYWJsZWQsIHRoZSBkZXZpY2UgcHJvdmlk
ZXMgCj4gdGhlIGNhcGFiaWxpdHkgdG8gcmVhZCB0aGUgd2hvbGUgYmxvY2sgd2l0aCBhIHNpbmds
ZSBjb21tYW5kLgo+IEhvd2V2ZXIsIHRoZSByZWFkIGNvbW1hbmQgZG9lc24ndCBvdXRwdXQgdGhl
IE9PQiBhcmVhLgo+IAo+IFJlYWQgY29tbWFuZCBiZWhhdmlvciAoaWYgQ29udGludW91cyBSZWFk
IGVuYWJsZWQpOgo+IFRoZSBSRUFEIENBQ0hFIGNvbW1hbmQgZG9lc24ndCByZXF1aXJlIHRoZSBz
dGFydGluZyBjb2x1bW4gYWRkcmVzcy4KPiBUaGUgZGV2aWNlIGFsd2F5cyBvdXRwdXQgdGhlIGRh
dGEgc3RhcnRpbmcgZnJvbSB0aGUgZmlyc3QgY29sdW1uIG9mIHRoZQo+IGNhY2hlIHJlZ2lzdGVy
LCBhbmQgb25jZSB0aGUgZW5kIG9mIHRoZSBjYWNoZSByZWdpc3RlciByZWFjaGVkLCB0aGUgZGF0
YQo+IG91dHB1dCBjb250aW51ZXMgdGhyb3VnaCB0aGUgbmV4dCBwYWdlLiBXaXRoIHRoZSBjb250
aW51b3VzIHJlYWQgbW9kZSwKPiBpdCBpcyBwb3NzaWJsZSB0byByZWFkIG91dCB0aGUgZW50aXJl
IGJsb2NrIHVzaW5nIGEgc2luZ2xlIFJFQUQgY29tbWFuZCwgYW5kCj4gb25jZSB0aGUgZW5kIG9m
IHRoZSBibG9jayByZWFjaGVkLCB0aGUgb3V0cHV0IHBpbnMgYmVjb21lIEhpZ2gtWiBzdGF0ZS4K
Ck9rIEkgdW5kZXJzdGFuZCBiZXR0ZXIuIEluIHRoaXMgY2FzZSB0aGVyZSBpcyBubyBuZWVkIHRv
IHNwbGl0IHRoaXMKY29tbWl0LCBpbnN0ZWFkIGp1c3QgcmV3b3JkIHRoZSBjb21taXQgbG9nIHRv
IHNvbWV0aGluZyBsaWtlOgoKLS0tPjgtLS0KQWRkIGRldmljZSB0YWJsZSBmb3IgTTcwQSBzZXJp
ZXMgTWljcm9uIFNQSS1OQU5EIGRldmljZXMuCgpBcyBvcHBvc2VkIHRvIHRoZSBNNjBBIHNlcmll
cyBhbHJlYWR5IHN1cHBvcnRlZCwgTTcwQSBwYXJ0cyBoYXZlIHRoZQoiQ29udGludW91cyBSZWFk
IiBmZWF0dXJlIGVuYWJsZWQgYnkgZGVmYXVsdCB3aGljaCBkb2VzIG5vdCBmaXQgdGhlCnN1YnN5
c3RlbSBuZWVkcy4KCjxoZXJlIGV4cGxhaW4gdGhlIGZlYXR1cmU+LgoKSGVuY2UsIHdlIGRpc2Fi
bGUgdGhlIGZlYXR1cmUgYXQgcHJvYmUgdGltZS4KLS0tODwtLS0KCkhvd2V2ZXIsIGJlbG93LCB5
b3UgZGlzYWJsZSB0aGlzIGJpdCBmb3IgYWxsIHRoZSBwYXJ0cy4gSXMgdGhpcyByZWFsbHkKb2s/
IFNvdWxkbid0IHdlIG1ha2UgaXQgbW9yZSBzcGVjaWZpYyB0byB0aGlzIHNlcmllcz8KCj4gCj4g
PiAKPiA+IFNoYWxsIHdlIGJhY2twb3J0IGl0IHRvIHN0YWJsZT8gIAo+IAo+IFRoaXMgaXMgbm90
IGEgYnVnIGZpeCBhbmQgYXBwbGljYWJsZSBvbmx5IHRvIE03MEEgc2VyaWVzIGRldmljZXMsIHRo
ZXJlIGlzIG5vCj4gbmVlZCB0byBiYWNrcG9ydC4KPiAoRllJLCB0aGUgcHJldmlvdXNseSBlbmFi
bGVkIGRldmljZSB3YXMgTTc5QSBzZXJpZXMpCj4gCj4gPiAKPiA+IEFzIGEgcnVsZSBvZiB0aHVt
Yiwgd2hlbiB5b3Ugc3RhcnQgYSBzZW50ZW5jZSBieSAid2hpbGUgYXQgaXQiIGluIGEKPiA+IGNv
bW1pdCBtZXNzYWdlIGFuZCB0aGlzIGlzIG5vdCBhIHRyaXZpYWwgY2hhbmdlIDogc3BsaXQgdGhl
IHBhdGNoLAo+ID4gcGxlYXNlLiBVbmxlc3MgdGhpcyBpcyByZWFsbHkgcmVsYXRlZCBhbmQgaW4g
dGhpcyBjYXNlIGV4cGxhaW4gaG93IGFuZAo+ID4gd2h5IGluIHRoZSBjb21taXQgbWVzc2FnZS4g
IAo+IAo+IE9rYXksIEkgd2lsbCBleHBsYWluIGluIG15IG5leHQgdmVyc2lvbi4KPiAKPiA+ICAg
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11
cnRoeUBtaWNyb24uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21p
Y3Jvbi5jIHwgMzEgIAo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyAgCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgIAo+ID4gYi9kcml2ZXJzL210ZC9uYW5k
L3NwaS9taWNyb24uYyAgCj4gPiA+IGluZGV4IDVmZDFmOTIxZWYxMi4uNDVmYzM3YzU4ZjhhIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4gPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+ID4gPiBAQCAtMTMxLDYgKzEzMSwyNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyAgCj4gPiBtaWNyb25fc3BpbmFuZF90
YWJsZVtdID0geyAgCj4gPiA+ICAJCSAgICAgMCwKPiA+ID4gIAkJICAgICBTUElOQU5EX0VDQ0lO
Rk8oJm1pY3Jvbl84X29vYmxheW91dCwKPiA+ID4gIAkJCQkgICAgIG1pY3Jvbl84X2VjY19nZXRf
c3RhdHVzKSksCj4gPiA+ICsJLyogTTcwQSA0R2IgMy4zViAqLwo+ID4gPiArCVNQSU5BTkRfSU5G
TygiTVQyOUY0RzAxQUJBRkQiLCAweDM0LAo+ID4gPiArCQkgICAgIE5BTkRfTUVNT1JHKDEsIDQw
OTYsIDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwKPiA+ID4gKwkJICAgICBOQU5EX0VDQ1JF
USg4LCA1MTIpLAo+ID4gPiArCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9j
YWNoZV92YXJpYW50cywKPiA+ID4gKwkJCQkJICAgICAgJndyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+
ID4gPiArCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiA+ID4gKwkJICAgICAw
LAo+ID4gPiArCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0LAo+ID4g
PiArCQkJCSAgICAgbWljcm9uXzhfZWNjX2dldF9zdGF0dXMpKSwKPiA+ID4gKwkvKiBNNzBBIDRH
YiAxLjhWICovCj4gPiA+ICsJU1BJTkFORF9JTkZPKCJNVDI5RjRHMDFBQkJGRCIsIDB4MzUsCj4g
PiA+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDEs
IDEpLAo+ID4gPiArCQkgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCj4gPiA+ICsJCSAgICAgU1BJ
TkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ID4gPiArCQkJCQkg
ICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gPiA+ICsJCQkJCSAgICAgICZ1cGRhdGVfY2Fj
aGVfdmFyaWFudHMpLAo+ID4gPiArCQkgICAgIDAsCj4gPiA+ICsJCSAgICAgU1BJTkFORF9FQ0NJ
TkZPKCZtaWNyb25fOF9vb2JsYXlvdXQsCj4gPiA+ICsJCQkJICAgICBtaWNyb25fOF9lY2NfZ2V0
X3N0YXR1cykpLAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5h
bmRfZGV0ZWN0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiA+ID4gQEAgLTE1Myw4
ICsxNzMsMTkgQEAgc3RhdGljIGludCBtaWNyb25fc3BpbmFuZF9kZXRlY3Qoc3RydWN0ICAKPiA+
IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKSAgCj4gPiA+ICAJcmV0dXJuIDE7Cj4gPiA+ICB9Cj4g
PiA+Cj4gPiA+ICtzdGF0aWMgaW50IG1pY3Jvbl9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kKQo+ID4gPiArewo+ID4gPiArCS8qCj4gPiA+ICsJICogTTcwQSBkZXZp
Y2Ugc2VyaWVzIGVuYWJsZSBDb250aW51b3VzIFJlYWQgZmVhdHVyZSBhdCBQb3dlci11cCwKPiA+
ID4gKwkgKiB3aGljaCBpcyBub3Qgc3VwcG9ydGVkLiBEaXNhYmxlIHRoaXMgYml0IHRvIGF2b2lk
IGFueSBwb3NzaWJsZQo+ID4gPiArCSAqIGZhaWx1cmUuCj4gPiA+ICsJICovCj4gPiA+ICsJcmV0
dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfUVVBRF9FTkFCTEUsIDApOwo+ID4gPiAr
fQo+ID4gPiArCj4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVy
X29wcyAgCj4gPiBtaWNyb25fc3BpbmFuZF9tYW51Zl9vcHMgPSB7ICAKPiA+ID4gIAkuZGV0ZWN0
ID0gbWljcm9uX3NwaW5hbmRfZGV0ZWN0LAo+ID4gPiArCS5pbml0ID0gbWljcm9uX3NwaW5hbmRf
aW5pdCwKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFj
dHVyZXIgbWljcm9uX3NwaW5hbmRfbWFudWZhY3R1cmVyID0geyAgCj4gPiAKPiA+IFRoYW5rcywK
PiA+IE1pcXXDqGwgIAo+IAo+IFRoYW5rcywKPiBTaGl2YQoKCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
