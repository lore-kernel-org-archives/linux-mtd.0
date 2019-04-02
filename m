Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6268C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 09:16:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DD82084C
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 09:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NWqy1nlT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DD82084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPjIPPYwhyT6oHme/zgmq4rLKvpLxOte/ZIzb67wx0Q=; b=NWqy1nlTqevKNn
	RiLz/RBoxSUVh93tM4UDDP/0OLrYKMJhgv4P+3xCJzkeENbVs411RhZEJGM7ETIs+QyQl2Nj9LD52
	+RxIgyg3UVYQakW9SmO90FtNvL/K5PG7um9QJkXz5eP9h0yd7qsSO/8CeiYM05Bx4CtbGcxG8/1yH
	YiBfUMx8hH30EVm2IU8xWU/pXhgFZTe9Umy4NeZ/+mT95GDS1t1MRF+sm6Uzr2qxv/U615VQygEZK
	/YrR1bdzhzVQLThlKzGCQnbBQB+y4+vxUWlclPrTPNbS2BiNjVp0xQ/yI1pgQ/YIRZTzR3IjuHZnu
	D4M7fhJq9pMDyfMn4EDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFXL-00021X-SN; Tue, 02 Apr 2019 09:16:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFXG-0001sm-Qr
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 09:16:53 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DDFA21BF207;
 Tue,  2 Apr 2019 09:16:44 +0000 (UTC)
Date: Tue, 2 Apr 2019 11:16:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: i.MX28 nand driver broken in Linux 4.18
Message-ID: <20190402111643.57f325f4@xps13>
In-Reply-To: <98aebd37-ec31-85e1-3f3c-d327eda1939e@grandegger.com>
References: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
 <20190304125435.0e33d362@xps13>
 <e5450dfe-9228-569a-2c59-3b6f7bb05d2d@grandegger.com>
 <17beb0d3-6202-00ee-ff42-a656c4d8cb23@grandegger.com>
 <20190306145942.625b5c87@xps13>
 <1c876ede-7321-a7c3-a366-86ca1dafce20@grandegger.com>
 <20190401112349.60bcf6d7@xps13>
 <98aebd37-ec31-85e1-3f3c-d327eda1939e@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_021651_492696_CD8AEB1C 
X-CRM114-Status: GOOD (  20.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZmdhbmcsCgpXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4gd3Jv
dGUgb24gTW9uLCAxIEFwciAyMDE5CjIyOjA4OjQ1ICswMjAwOgoKPiBIZWxsbyBNaXF1ZWw7Cj4g
Cj4gQW0gMDEuMDQuMTkgdW0gMTE6MjMgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+ID4gSGkgV29s
ZmdhbmcsCj4gPiAKPiA+IFdvbGZnYW5nIEdyYW5kZWdnZXIgPHdnQGdyYW5kZWdnZXIuY29tPiB3
cm90ZSBvbiBTYXQsIDIzIE1hciAyMDE5Cj4gPiAyMDo1NToxOSArMDEwMDoKPiA+ICAgCj4gPj4g
SGVsbG8gTWlxdWVsLAo+ID4+Cj4gPj4gQW0gMDYuMDMuMTkgdW0gMTQ6NTkgc2NocmllYiBNaXF1
ZWwgUmF5bmFsOiAgCj4gPj4+IEhpIFdvbGZnYW5nLAo+ID4+Pgo+ID4+PiBXb2xmZ2FuZyBHcmFu
ZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4gd3JvdGUgb24gVHVlLCA1IE1hciAyMDE5Cj4gPj4+
IDE1OjUyOjUyICswMTAwOgo+ID4+PiAgICAgCj4gPj4+PiBIZWxsbywKPiA+Pj4+Cj4gPj4+PiBJ
IHdpbGwgYmlzZWN0IHRoZSBwcm9ibGVtIG5leHQgd2VlayB3aGVuIEkgaGF2ZSBhY2Nlc3MgdG8g
dGhlCj4gPj4+PiBoYXJkd2FyZS4uLiBtb3JlIHNvb24uLi4KPiA+Pj4+ICAgIAo+ID4+Pgo+ID4+
PiBHcmVhdCwgdGhhbmtzLiAgICAKPiA+Pgo+ID4+IEhlcmUgaXMgdGhlIHJlc3VsdCBvZiBnaXQg
YmlzZWN0aW9uOgo+ID4+Cj4gPj4gd29sZkBiZXJuZXg6fi9naXQvbGludXgkIGdpdCBiaXNlY3Qg
Z29vZAo+ID4+IDc2ZTFhMDA4NmEwYzMyNzZiMzg0Zjc3OTA1MzQ1ZTBmY2M4ODZmZGQgaXMgdGhl
IGZpcnN0IGJhZCBjb21taXQKPiA+PiBjb21taXQgNzZlMWEwMDg2YTBjMzI3NmIzODRmNzc5MDUz
NDVlMGZjYzg4NmZkZAo+ID4+IEF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KPiA+PiBEYXRlOiAgIEZyaSBNYXIgMiAxNTozODozOSAyMDE4ICswMTAwCj4g
Pj4KPiA+PiAgICAgbXRkOiByYXduYW5kOiBncG1pOiBzdXBwb3J0IC0+c2V0dXBfZGF0YV9pbnRl
cmZhY2UoKQo+ID4+ICAgICAKPiA+PiAgICAgVW50aWwgbm93IHRoZSBHUE1JIGRyaXZlciBoYWQg
aXRzIG93biB0aW1pbmdzIGxvZ2ljIHdoaWxlIHRoZSBjb3JlCj4gPj4gICAgIGFscmVhZHkgaGFu
ZGxlcyB0aGF0IGFuZCByZXF1ZXN0IHRoZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVycyB0byBzdXBw
b3J0Cj4gPj4gICAgIHRoZSAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgaG9vay4gSW1wbGVtZW50
IHRoYXQgaG9vayBieSByZXVzaW5nIHRoZQo+ID4+ICAgICBhbHJlYWR5IGV4aXN0aW5nIGZ1bmN0
aW9uLiBObyByZWFsIGdsdWUgaXMgbmVjZXNzYXJ5IGJldHdlZW4gY29yZSB0aW1pbmcKPiA+PiAg
ICAgZGVsYXlzIGFuZCBHUE1JIHJlZ2lzdGVycyBiZWNhdXNlIHRoZSBkcml2ZXIgYWxyZWFkeSB0
cmFuc2xhdGVzIHRoZQo+ID4+ICAgICBPTkZJIHRpbWluZyBtb2RlcyBpbnRvIHJlZ2lzdGVyIHZh
bHVlcy4KPiA+PiAgICAgCj4gPj4gICAgIE1ha2UgdXNlIG9mIHRoZSBjb3JlJ3MgdFJFQSwgdFJM
T0ggYW5kIHRSSE9IIHZhbHVlcyB0aGF0IGFsbG93IGNvbXB1dGluZwo+ID4+ICAgICBtb3JlIHBy
ZWNpc2UgdGltaW5ncyBmb3IgbW9kZSBbMC0zXSBhbmQgZ2V0IHNpZ25pZmljYW50bHkgYmV0dGVy
IHZhbHVlcwo+ID4+ICAgICAoKzIwJSB3aXRoIGFuIGkuTVg2IFNhYnJlIEF1dG8gYm9hcmQpLiBP
dGhlcndpc2UgdXNlIHRoZSBleGlzdGluZyBsb2dpYy4KPiA+PiAgICAgCj4gPj4gICAgIFNpZ25l
ZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPj4g
ICAgIFRlc3RlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPiA+PiAgICAgU2lnbmVkLW9m
Zi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+ICAKPiA+
IAo+ID4gVGhhbmsgeW91IGZvciB0aGUgYmlzZWN0aW9uLCB0aGVyZSBpcyBkZWZpbml0ZWx5IHNv
bWV0aGluZyB3cm9uZyB3aXRoCj4gPiB0aGlzIGNvbW1pdCBidXQgaXQgd29ya2VkIGZvciBtZSBh
bmQgZm9yIEhhbiBzbyBpdCdzIHF1aXRlIGRpZmZpY3VsdCB0bwo+ID4gZmluZCBvdXQgd2hhdCBp
cyBmYWlsaW5nIGlmIEkgY2Fubm90IHJlcHJvZHVjZS4gQ291bGQgeW91IHBsZWFzZSBkdW1wCj4g
PiB0aGUgdGltaW5nIHJlZ2lzdGVycyBpbiBib3RoIGNhc2VzICh3b3JraW5nL25vdCB3b3JraW5n
KSBhbmQgb2JzZXJ2ZXIgaWYKPiA+IHRoZXJlIGFyZSBvZGQgdmFsdWVzID8gKDAsIHRvbyBzaG9y
dCBvciB0b28gYmlnIHZhbHVlcywgZXRjKS4gIAo+IAo+IGhlcmUgYXJlIHNvbWUgZmlyc3QgZmln
dXJlczoKPiAKPiA3NmUxYTAwODZhMGMzMjc2YjM4NGY3NzkwNTM0NWUwZmNjODg2ZmRkXjoKPiBb
ICAgIDEuOTExNzYwXSBjbG9ja19wZXJpb2RfaW5fbnMgOiA0MQo+IFsgICAgMS45MjI4MThdIGFk
ZHJlc3Nfc2V0dXBfaW5fY3ljbGVzIDogMQo+IFsgICAgMS45MTUzNDNdIGRhdGFfc2V0dXBfaW5f
Y3ljbGVzIDogMwo+IFsgICAgMS45MTkyNTRdIGRhdGFfaG9sZF9pbl9jeWNsZXMgOiAyCj4gWyAg
ICAxLjkyNjcwOV0gSFdfR1BNSV9USU1JTkcwIDogMHgxMDIwMwo+IFsgICAgMS45MzA2NDFdIEhX
X0dQTUlfVElNSU5HMSA6IDB4NTAwMDAwMAo+IAo+IHY0LjE4Ogo+IFsgICAgMi4wOTA2MjFdIHBl
cmlvZF9wcyA6IDQ1NDU0Cj4gWyAgICAyLjA3NjYwMV0gYWRkcl9zZXR1cF9jeWNsZXMgOiAxCj4g
WyAgICAyLjA4MDAwMl0gZGF0YV9zZXR1cF9jeWNsZXMgOiAxCj4gWyAgICAyLjA4MzU5OF0gZGF0
YV9ob2xkX2N5Y2xlcyA6IDEKPiBbICAgIDIuMDkzODQ5XSBIV19HUE1JX1RJTUlORzAgOiAweDEw
MTAxCj4gWyAgICAyLjA5Njg5MF0gSFdfR1BNSV9USU1JTkcxIDogMHg5MDAwMDAwMAo+IAo+IEhv
cGUgdGhhdCdzIHdoYXQgeW91IGFyZSBsb29raW5nIGZvci4gVW5mb3J0dW5hdGVseSwgdGhlIGNv
ZGUgb2YgYm90aAo+IHZlcnNpb25zIGlzIHZlcnkgZGlmZmVyZW50IChjb21wbGV0ZSByZXdyaXRl
KS4gSSB3aWxsIGhhdmUgYSBjbG9zZXIgbG9vawo+IHRvbW9ycm93LgoKSnVzdCBsb29raW5nIGF0
IHRoZXNlIHZhbHVlcyBpdCBkb2VzIG5vdCBsb29rIGxpa2UgdGhlcmUgaXMgYSBiaWcKZGlmZmVy
ZW5jZS4uLgoKQ2FuIHlvdSBwbGVhc2UgZm9yY2UgdGhlIHRpbWluZyByZWdpc3RlcnMgdG8gd29y
a2luZyB2YWx1ZXMgKHRha2VuIGZyb20KdjQuMTgpIHRvIGJlIHN1cmUgdGhlIHByb2JsZW0gY29t
ZXMgZnJvbSB0aGUgZGVyaXZhdGlvbnMgbWFkZSBpbgotPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkg
YW5kIG5vdCBzb21ldGhpbmcgZWxzZT8KCkFsc28sIGluIHNldHVwX2RhdGFfaW50ZXJmYWNlKCks
IHlvdSBtYXkgcmVmdXNlIHRvIHN1cHBvcnQgdGhlIGhpZ2hlc3QKbW9kZXMgKDQgYW5kIDUpIGFu
ZCBvYnNlcnZlIGlmIGl0IHNvbHZlcyBzb21ldGhpbmc/IEkgd291bGQgdGVzdDoKZm9yY2luZyB0
byBtYXhpbXVtIG1vZGUgNCwgMyBhbmQgMC4gUGxlYXNlIGNvbnRpbnVlIHRvIGR1bXAgdGhlIGFi
b3ZlCnZhbHVlcy9yZWdpc3RlcnMgdG8gY29tcGFyZS4KClRoYW5rcyBmb3IgeW91ciB0aW1lLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
