Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856D9C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDfWKKzipCXy4rN15siy6CB7+d8qiQECIz5EIFFtBN0=; b=gsOHout3lHlk1r
	nR3IgqQr127NPT81MsrzFzbjR8G5J1auO4xTRzNNhioTZ7UKMrL0m4ApqV7N+NgY+Kd/bmncWDYbD
	Vc2JbmbzU2yr5YKQM/mjJUQPc6m1scDfdOQyZ3veA2mO3dzvoXgv6YnPpd6jn339kAjqFZg7lG4d8
	UjdyUDRGtxPtMYYsbqCGeJh67D1j2c7H+FyLZz2djhMhhYmPvRrPOcDmGDmHfeT9cFsa9spjznjyM
	AwYjyHMZqDeDdZrqup7P4cvjitUUUclb03tzdtvumsE1HODEu/4hbowexn2xv5rN5xh7/+dqj2A7i
	hFqPjsSMXecSL3ZW5mMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1polKk-002GVF-1x;
	Tue, 18 Apr 2023 13:25:22 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1polKf-002GTP-0f;
	Tue, 18 Apr 2023 13:25:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0EAEF240002;
	Tue, 18 Apr 2023 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681824311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4ugRgZNu/Y+baSK+9UqHRS8pZ9Nhe2pwx9QcHGO7qQ=;
	b=oLiGo4PRzihRAJLpguz+PlMJwr7om8taIquydk8GT6iIDMZI0eemdwaItHjQju6h9yYRQd
	75TGkfQ8FlW6TunA7ncve2pBpkxeh68RNtsyTsEMakpYGhuz9QQncJPNnBOx++2x/35XZ1
	YfYmIV25hOM8VU3hNyOJ5clsnDrwKF1x96n56h6yc+W2TQtmS+0TTr6pA8TQTOPpXjsCnA
	zoqCCNCrtjKuPxquL55ja8iNzy/LyBUZj0GqExbz00XaqkjOEp8Z8gzZ3cL7HakbKpfwQ8
	OoX2fR9wc0DFvtNY3NIjUaSsybzkgTBGfJQG4BQlE7ZTAo/GQECnlYk4Mr95SA==
Date: Tue, 18 Apr 2023 15:25:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "yonghui.yu" <yonghui.yu@amlogic.com>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230418152505.72fc16da@xps-13>
In-Reply-To: <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
	<ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
	<20230412113654.183350d0@xps-13>
	<4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
	<20230412141824.755b2bca@xps-13>
	<eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
	<20230412145715.58c2be4a@xps-13>
	<7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
	<20230412163214.0c764bb3@xps-13>
	<0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
	<fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
	<7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
	<20230413102200.309fbe9c@xps-13>
	<b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
	<20230413122252.0a8efcd8@xps-13>
	<569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
	<60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
	<780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
	<e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_062517_718003_63473675 
X-CRM114-Status: GOOD (  23.92  )
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

SGkgQXJzZW5peSwKCj4gPj4gSGVsbG8gYWdhaW4gQExpYW5nIEBNaXF1ZWwhCj4gPj4KPiA+PiBP
bmUgbW9yZSBxdWVzdGlvbiBhYm91dCBPT0IgYWNjZXNzLCBhcyBJIGNhbiBzZWUgY3VycmVudCBk
cml2ZXIgdXNlcyB0aGUgZm9sbG93aW5nCj4gPj4gY2FsbGJhY2tzOgo+ID4+Cj4gPj4gwqDCoMKg
wqBuYW5kLT5lY2Mud3JpdGVfb29iX3JhdyA9IG5hbmRfd3JpdGVfb29iX3N0ZDsKPiA+PiDCoMKg
wqDCoG5hbmQtPmVjYy53cml0ZV9vb2IgPSBuYW5kX3dyaXRlX29vYl9zdGQ7Cj4gPj4KPiA+Pgo+
ID4+IEZ1bmN0aW9uICduYW5kX3dyaXRlX29vYl9zdGQoKScgd3JpdGVzIGRhdGEgdG8gdGhlIGVu
ZCBvZiB0aGUgcGFnZS4gQnV0IGFzIEkKPiA+PiBjYW4gc2VlIGJ5IGR1bXBpbmcgJ2RhdGFfYnVm
JyBkdXJpbmcgcmVhZCwgcGh5c2ljYWwgbGF5b3V0IG9mIGVhY2ggcGFnZSBpcyB0aGUKPiA+PiBm
b2xsb3dpbmcgKDFLQiBFQ0MpOgo+ID4+Cj4gPj4gMHgwMDA6IFvCoMKgwqDCoMKgwqDCoMKgIDEg
S0Igb2YgZGF0YcKgwqDCoMKgwqDCoMKgIF0KPiA+PiAweDQwMDogWyAyQiB1c2VyIGRhdGFdIFsg
MTRCIEVDQyBjb2RlXQo+ID4+IDB4NDEwOiBbwqDCoMKgwqDCoMKgwqDCoCAxIEtCIG9mIGRhdGHC
oMKgwqDCoMKgwqDCoCBdwqDCoMKgIChBKQo+ID4+IDB4ODEwOiBbIDJCIHVzZXIgZGF0YV0gWyAx
NEIgRUNDIGNvZGVdCj4gPj4gMHg4MjA6IFvCoMKgwqDCoMKgwqDCoCAzMkIgdW51c2VkwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXQo+ID4+Cj4gPj4KPiA+Pgo+ID4+IFNvLCBhZnRlciAnbmFuZF93cml0
ZV9vb2Jfc3RkKCknIChsZXQgZGF0YSBiZSBzZXF1ZW5jZSBmcm9tIFsweDAgLi4uIDB4M2ZdKSwK
PiA+PiBwYWdlIHdpbGwgbG9vayBsaWtlIHRoaXM6Cj4gPj4KPiA+PiAweDAwMDogW8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweEZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4gPj4gMHg0MDA6
IFvCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4uLi4uLsKgwqDCoMKgwqDCoMKgwqDCoCBdCj4gPj4g
MHg3ZjA6IFvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhGRsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXQo+ID4+IDB4ODAwOiBbIDAwIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uwqAgXQo+ID4+IDB4
ODMwOiBbIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLiAzZiBdCj4gPj4KPiA+PiBIZXJlIHdlIGhh
dmUgdHdvIHByb2JsZW1zOgo+ID4+IDEpIEF0dGVtcHQgdG8gZGlzcGxheSByYXcgZGF0YSBieSAn
bmFuZGR1bXAnIHV0aWxpdHkgcHJvZHVjZXMgYSBsaXR0bGUgYml0Cj4gPj4gwqDCoMKgIGludmFs
aWQgb3V0cHV0LCBhcyBkcml2ZXIgcmVsaWVzIG9uIGxheW91dCAoQSkgZnJvbSBhYm92ZS4gRS5n
LiBPT0IgZGF0YQo+ID4+IMKgwqDCoCBpcyBhdCAweDQwMCBhbmQgMHg4MTAuIEhlcmUgaXMgYW4g
ZXhhbXBsZSAoYXR0ZW1wdCB0byB3cml0ZSAweDExIDB4MjIgMHgzMyAweDQ0KToKPiA+Pgo+ID4+
IDB4MDAwMDA3ZjA6IDExIDIyIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmwqAgfC4iLi4uLi4uLi4uLi4uLi58Cj4gPj4gwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwK
PiA+PiDCoMKgIE9PQiBEYXRhOiAzMyA0NCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZsKgIHwzRC4uLi4uLi4uLi4uLi4ufAo+ID4+IMKgwqAgT09CIERhdGE6IGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmwqAgfC4uLi4uLi4uLi4u
Li4uLi58Cj4gPj4gwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+PiAgCj4gPiBIaSBBcnNl
bml5LAo+ID4gCj4gPiBJIHJlYWxpemVkIHRoZSB3cml0ZV9vb2JfcmF3KCkgYW5kIHdyaXRlX29v
YigpIGFyZSB3cm9uZyBpbiBtZXNvbl9uYW5kLmMuIEkgc3VnZ2VzdCBib3RoIG9mIHRoZW0gc2hv
dWxkIGJlIHJld29ya2VkIGFuZCBmb2xsb3cgdGhlIGZvcm1hdCBvZiBtZXNvbiBuYW5kIGNvbnRy
b2xsZXIuIGkuZS4gZmlyc3RseSBmb3JtYXQgdGhlIGRhdGEgaW4gTGF5b3V0IChBKSBhbmQgdGhl
biB3cml0ZS4gcmVhZGluZyBpcyBmaXJzdGx5IHJlYWRpbmcgdGhlIGRhdGEgb2YgbGF5b3V0IChB
KSBhbmQgdGhlbiBjb21wb3N0IHRoZSBsYXlvdXQgKEIpLiAgCj4gCj4gSUlVQyBhZnRlciBzdWNo
IHdyaXRpbmcgb25seSBPT0IgKGUuZy4gdXNlciBieXRlcykgYWNjb3JkaW5nIGxheW91dCAoQSks
IGh3IHdpbGwgYWxzbyB3cml0ZSBFQ0MgY29kZXMsIHNvCj4gaXQgd2lsbCBiZSBpbXBvc3NpYmxl
IHRvIHdyaXRlIGRhdGEgdG8gdGhpcyBwYWdlIGxhdGVyLCBiZWNhdXNlIHdlIGNhbm5vdCB1cGRh
dGUgRUNDIGNvZGVzIHByb3Blcmx5IGZvciB0aGUgbmV3bHkKPiB3cml0dGVuIGRhdGEgKHdlIGNh
bid0IHVwZGF0ZSBiaXRzIGZyb20gMCB0byAxKS4KPiAKPiA+IAo+ID4gICAKPiA+Pgo+ID4+IDIp
IEF0dGVtcHQgdG8gcmVhZCBkYXRhIGluIEVDQyBtb2RlIHdpbGwgZmFpbCwgYmVjYXVzZSBJSVVD
IHBhZ2UgaXMgaW4gZGlydHkKPiA+PiDCoMKgwqAgc3RhdGUgKEkgbWVhbiB3YXMgd3JpdHRlbiBh
dCBsZWFzdCBvbmNlKSBhbmQgTkFORCBjb250cm9sbGVyIHRyaWVzIHRvIHVzZQo+ID4+IMKgwqDC
oCBFQ0MgY29kZXMgYXQgMHg0MDAgYW5kIDB4ODEwLCB3aGljaCBhcmUgb2J2aW91c2x5IGJyb2tl
biBpbiB0aGlzIGNhc2UuIFRodXMgIAo+ID4gCj4gPiBBcyBpIHNhaWQgYWJvdmUsIHdyaXRlX29v
Yl9yYXcoKSBhbmQgd3JpdGVfb29iKCkgc2hvdWxkIGJlIHJld29ya2VkLgo+ID4gaSBkb24ndCBr
bm93IHdoYXQgZG8geW91IG1lYW4gcGFnZSB3YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlLiBhbnl3
YXkgdGhlIHBhZ2Ugc2hvdWxkIGJlIHdyaXR0ZW4gb25jZSwgZXZlbiBqdXN0IHdyaXRlX29vYl9y
YXcoKS4gIAo+IAo+IFNvcnJ5LCBZb3UgbWVhbiB0aGF0IGFmdGVyIE9PQiB3cml0ZSwgd2UgY2Fu
bm90IHdyaXRlIHRvIHRoZSBkYXRhIGFyZWEgKGUuZy4gMHgwIC4uIDB4ODEwKSB1bnRpbCBwYWdl
IHdpbGwgYmUgZXJhc2VkPyBGb3IgZXhhbXBsZQo+IEpGRlMyIHdyaXRlcyB0byBPT0Igb3duIG1h
cmtlcnMsIHRoZW4gaXQgdHJpZXMgdG8gd3JpdGUgdG8gdGhlIGRhdGEgYXJlYSBvZiBzdWNoIHBh
Z2UuCgpBIHBhZ2UgaXMgd3JpdHRlbiBhZnRlciB0d28gc3RlcHM6Ci0gbG9hZGluZyB0aGUgZGF0
YSBpbnRvIHRoZSBOQU5EIGNoaXAgY2FjaGUgKHRoYXQncyB3aGVuIHlvdSB1c2UgdGhlCiAgYnVz
KQotIHByb2dyYW1taW5nIHRoZSBOQU5EIGFycmF5IHdpdGggdGhlIGRhdGEgbG9hZGVkIGluIGNh
Y2hlICh0aGF0J3Mgd2hlbgogIHlvdSB3YWl0KQoKSW4gdGhlb3J5IGl0IGRvZXMgbm90IG1hdHRl
ciB3aGVyZSB5b3Ugd3JpdGUgaW4gdGhlIGNhY2hlLCBpdCdzIHJlZ3VsYXIKRFJBTSwgeW91IGNh
biBtYWtlIHJhbmRvbSB3cml0ZXMgdGhlcmUgd2l0aCB0aGUgYXBwcm9wcmlhdGUgTkFORApjb21t
YW5kcy4gT2YgY291cnNlIHdoZW4gdXNpbmcgZW1iZWRkZWQgaGFyZHdhcmUgRUNDIGVuZ2luZXMs
IHRoZQpjb250cm9sbGVycyB1c3VhbGx5IGV4cGVjdCB0byBiZSBmZWQgaW4gYSBjZXJ0YWluIHdh
eSBpbiBvcmRlciB0bwpwcm9kdWNlIHRoZSBFQ0MgYnl0ZXMgYW5kIHB1dCB0aGVtIGF0IHRoZSBy
aWdodCBsb2NhdGlvbiBpbiBjYWNoZS4KCkFuZCB0aGVuLCB3aGVuIHlvdSBhY3R1YWxseSBzZW5k
IHRoZSAicHJvZ3JhbSIgY29tbWFuZCwgdGhlIE5BTkQgY2VsbHMKYWN0dWFsbHkgZ2V0IHByb2dy
YW1tZWQgYmFzZWQgb24gd2hhdCBoYXMgYmVlbiBsb2FkZWQgaW4gY2FjaGUuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
