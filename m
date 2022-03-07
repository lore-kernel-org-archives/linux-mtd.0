Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4009C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Qo6zD2uA7dm5glQrj+GheXfq/pLwvRsuPJ1xIY2GGA=; b=AkFnAQyds35DXQ
	Vjx/6o0HtOxV9WRxA7xnCEkcqIkXQm4eENVcUvFeXMB4YHpD7qfnGQUAGSXZ0OdCTNfyCIpofA9MR
	7xC07W4NgQ8yLk+yAIo1ZE1PtLQoo5PLU3QfoNZnE1ZUjohA4n96zQV/5mB13aRDob+YefjBgMt/y
	9pT8djpFeZCWG9SuYgcptR4KkeuVg3csEmFgWwv2JiqZVcNeuAafBHWiZBmpXwjtCyDP+gxCxP5rd
	9zQTMWVRfIhNuA0BgQz3EJZxGgFJFfrQcEtPO6PXZVSPoyOhtihXgTwr4pFrm55QZMUd/UotHB87W
	UGC1XRoPr5wQVlewe9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREFR-000N5O-1Q; Mon, 07 Mar 2022 14:22:05 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nREFN-000N3Q-3W
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:22:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 07F65C0012;
 Mon,  7 Mar 2022 14:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646662919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDhYU9kvWroYD/F21ltVejyktD0sL5FzrRSfr3+TnaM=;
 b=OWLO1mSmci0YG7DcPy81g6xKKrj2yrcBihwhkUp8cihoZ5v3HRmw2x3SaT57wgzvek5iHR
 wWvpAvyGly17r+IIMfuZqkj55cw7UeG1/a2e3nWuLdNr72981Hd9tO0x+0XE1Pgj0z81Po
 kmzMQ1mggjYxz7MU6cxbCeEOWw4r42jXIKDEs5uM4cPWp9WuSxssW0JXAr2F3/SDT1/yoQ
 NV9KCbJwXhd9DHH3Qmbe47guoapx8k4ZmsXm7EojrMb5zKyzOMEap2yXhoLhMd/E7KvLq1
 FS3dnu4sw66Hov+kzLepHD3cTVWKT4YP1bYxkSY2jJvy+x/AE+JCMkJH4KZ9Rg==
Date: Mon, 7 Mar 2022 15:21:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck
 <linux@roeck-us.net>, krzysztof.kozlowski@canonical.com, vigneshr@ti.com,
 nm@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Actually prevent invalid
 configuration and build error
Message-ID: <20220307152156.1d6fb01b@xps13>
In-Reply-To: <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
References: <20220220004415.GA1519274@roeck-us.net>
 <4bbe337e-8cd8-a4d6-303d-d5aa21bee2e0@infradead.org>
 <20220304165451.0129012e@xps13>
 <6c09de15-1ab2-5ca8-7003-69ff3f7c4dc5@kernel.org>
 <20220307110357.20d50176@xps13>
 <c39d64f0-deef-4cae-fab7-555a48e31811@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_062201_484692_118BB1B5 
X-CRM114-Status: GOOD (  41.58  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDcgTWFyIDIwMjIgMTQ6
MjU6NDggKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAwNy8wMy8yMDIyIDEyOjAzLCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgUm9nZXIsCj4gPiAKPiA+IHJvZ2VycUBrZXJuZWwub3Jn
IHdyb3RlIG9uIFNhdCwgNSBNYXIgMjAyMiAwMDo1MDoxNCArMDIwMDoKPiA+ICAgCj4gPj4gSGkg
TWlxdWVsLAo+ID4+Cj4gPj4gT24gMDQvMDMvMjAyMiAxNzo1NCwgTWlxdWVsIFJheW5hbCB3cm90
ZTogIAo+ID4+PiBIaSBHdWVudGVyLCBSb2dlciwKPiA+Pj4KPiA+Pj4gcmR1bmxhcEBpbmZyYWRl
YWQub3JnIHdyb3RlIG9uIFNhdCwgMjYgRmViIDIwMjIgMjI6NTU6MjggLTA4MDA6Cj4gPj4+ICAg
ICAKPiA+Pj4+IE9uIDIvMTkvMjIgMTY6NDQsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6ICAgIAo+ID4+
Pj4+IE9uIFNhdCwgRmViIDE5LCAyMDIyIGF0IDA5OjM2OjAwUE0gKzAyMDAsIFJvZ2VyIFF1YWRy
b3Mgd3JvdGU6ICAgICAgCj4gPj4+Pj4+IFRoZSByb290IG9mIHRoZSBwcm9ibGVtIGlzIHRoYXQg
d2UgYXJlIHNlbGVjdGluZyBzeW1ib2xzIHRoYXQgaGF2ZQo+ID4+Pj4+PiBkZXBlbmRlbmNpZXMu
IFRoaXMgY2FuIGNhdXNlIHJhbmRvbSBjb25maWd1cmF0aW9ucyB0aGF0IGNhbiBmYWlsLgo+ID4+
Pj4+PiBUaGUgY2xlYW5lc3Qgc29sdXRpb24gaXMgdG8gYXZvaWQgdXNpbmcgc2VsZWN0Lgo+ID4+
Pj4+Pgo+ID4+Pj4+PiBUaGlzIGRyaXZlciB1c2VzIGludGVyZmFjZXMgZnJvbSB0aGUgT01BUF9H
UE1DIGRyaXZlciBzbyB3ZSBoYXZlIHRvCj4gPj4+Pj4+IGRlcGVuZCBvbiBpdCBpbnN0ZWFkLgo+
ID4+Pj4+Pgo+ID4+Pj4+PiBGaXhlczogNGNkMzM1ZGFlM2NmICgibXRkOiByYXduYW5kOiBvbWFw
MjogUHJldmVudCBpbnZhbGlkIGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGVycm9yIikKPiA+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+ICAgICAg
Cj4gPj4+Pj4KPiA+Pj4+PiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4gICAgICAKPiA+Pj4+Cj4gPj4+PiBUZXN0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxh
cEBpbmZyYWRlYWQub3JnPiAgICAKPiA+Pj4KPiA+Pj4gU29ycnkgZm9yIG5vdGljaW5nIHRoYXQg
anVzdCBub3csIGJ1dCB0aGVyZSBpcyBzdGlsbCBhIHByb2JsZW0gd2l0aAo+ID4+PiB0aGlzIHBh
dGNoOiB3ZSBub3cgYWx3YXlzIGNvbXBpbGUtaW4gdGhlIE9NQVBfR1BNQyBkcml2ZXIgd2hlbmV2
ZXIgd2UKPiA+Pj4gbmVlZCB0aGUgTkFORCBjb250cm9sbGVyLCBldmVuIHRob3VnaCBpdCBpcyBu
b3QgbmVlZGVkLiBUaGlzIGdyb3dzIHRoZQo+ID4+PiBrZXJuZWwgZm9yIG5vIHJlYXNvbi4gICAg
Cj4gPj4KPiA+PiBTb3JyeSwgSSBkaWQgbm90IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQuCj4g
Pj4KPiA+PiBXZSBubyBsb25nZXIgZXhwbGljaXRseSBlbmFibGUgT01BUF9HUE1DIHNpbmNlIHdl
IGRyb3BwZWQgdGhlICJzZWxlY3QiLgo+ID4+IFRoaXMgZml4ZXMgYWxsIGJ1aWxkIGlzc3VlcyB0
aGF0IHdlcmUgcmVwb3J0ZWQgcmVjZW50bHkuCj4gPj4KPiA+PiBNVERfTkFORF9PTUFQMiB3aWxs
IG5vdCBiZSBlbmFibGVkIGlmIE9NQVBfR1BNQyBpcyBub3Qgc2luY2Ugd2UgYWRkZWQKPiA+PiB0
aGUgImRlcGVuZHMgb24iLiBUaGlzIGZpeGVzIHRoZSBvcmlnaW5hbCBidWlsZCBpc3N1ZSB0aGF0
IHdlIHN0YXJ0ZWQgdG8KPiA+PiBmaXggd2l0aCBzZWxlY3QgaW5pdGlhbGx5LiAgCj4gPiAKPiA+
IFllcywgdGhpcyBzaWRlIGlzIGZpbmUuCj4gPiAKPiA+IEluIHRoZSBpbml0aWFsIGNvbW1pdCwg
eW91IHByb3Bvc2VkOgo+ID4gCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmln
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiBAQCAtNDIsNyArNDIs
OCBAQCBjb25maWcgTVREX05BTkRfT01BUDIKPiA+ICAgICAgICAgdHJpc3RhdGUgIk9NQVAyLCBP
TUFQMywgT01BUDQgYW5kIEtleXN0b25lIE5BTkQgY29udHJvbGxlciIKPiA+ICAgICAgICAgZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09N
UElMRV9URVNUCj4gPiAgICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNCj4gPiArICAgICAgIHNl
bGVjdCBPTUFQX0dQTUMgaWYgQVJDSF9LMwo+ID4gCj4gPiBXaGljaCBjcmVhdGVzIGEgZGVwZW5k
ZW5jeSBvdmVyIE9NQVBfR1BNQyBvbmx5IGZvciBhIHNpbmdsZQo+ID4gYXJjaGl0ZWN0dXJlLiBX
aGljaCBtZWFucyB0aGF0IG90aGVyIE9NQVAgcGxhdGZvcm1zIGRvIG5vdCBuZWNlc3NhcmlseQo+
ID4gbmVlZCBPTUFQX0dQTUMgZm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIgdG8gd29yay4gTm93LCB5
b3UgcHJvcG9zZTogIAo+IAo+IE5vIHRoYXQgaXMgbm90IHRydWUuIE90aGVyIHBsYXRmb3JtcyB0
aGF0IG5lZWQgTVREX05BTkRfT01BUDIgYXJlCj4gZXhwbGljaXRseSBzZWxlY3RpbmcgT01BUF9H
UE1DCj4gaS5lLiBpbiBhcmNoL2FybS9tYWNoLW9tYXAyL0tjb25maWcKCk9rLCBpbiB0aGlzIGNh
c2UgdGhlIGZpeCBpcyBsZWdpdCwgYnV0IGFzIHlvdSBzYWlkIHRoZXJlIGlzIGNlcnRhaW5seQpz
b21lIGNsZWFuIHVwIHRvIGRvIG9uIHRoaXMgc2lkZSBpbiBhIHNlY29uZCB0aW1lLgoKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L0tjb25maWcKPiA+IEBAIC00Miw4ICs0Miw3IEBAIGNvbmZpZyBNVERfTkFORF9PTUFQ
Mgo+ID4gIAl0cmlzdGF0ZSAiT01BUDIsIE9NQVAzLCBPTUFQNCBhbmQgS2V5c3RvbmUgTkFORCBj
b250cm9sbGVyIgo+ID4gIAlkZXBlbmRzIG9uIEFSQ0hfT01BUDJQTFVTIHx8IEFSQ0hfS0VZU1RP
TkUgfHwgQVJDSF9LMyB8fCBDT01QSUxFX1RFU1QKPiA+ICAJZGVwZW5kcyBvbiBIQVNfSU9NRU0K
PiA+IAlkZXBlbmRzIG9uIE9NQVBfR1BNQwo+ID4gCj4gPiBUaGlzIG1lYW5zIGFueSBvZiB0aGUg
b3RoZXIgT01BUCBhcmNoaXRlY3R1cmVzIHdpbGwgY29tcGlsZSB0aGUgR1BNQwo+ID4gZHJpdmVy
IGV2ZW4gdGhvdWdoIHRoZXkgbWlnaHQgbm90IG5lZWQgaXQsIHdoaWNoIHdvdWxkIHVubmVjZXNz
YXJpbHkKPiA+IGluY3JlYXNlIHRoZSBrZXJuZWwgc2l6ZS4KPiA+IAo+ID4gQW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8gIAo+IAo+IE1URF9OQU5EX09NQVAyIE5BTkQgY29udHJvbGxlciBpcyBhIHN1
Ym1vZHVsZSBvZiB0aGUgT01BUCBHUE1DIElQLiBTbyBpdAo+IGNhbm5vdCB3b3JrIHdpdGhvdXQg
T01BUF9HUE1DIGRyaXZlci4KPiAKPiBIb3BlIHRoaXMgY2xhcmlmaWVzIHRoZSBkb3VidHMuCgpJ
IHdhcyBub3Qgc3VyZSBhbnltb3JlIGlmIHRoZXJlIHdhcyBhIHByb3BlciBoYXJkd2FyZSBkZXBl
bmRlbmN5IGhlcmUKYmVjYXVzZSBvZiB0aGUgInNlbGVjdCBHUE1DIGlmIEFSQ0hfSzMiIGFkZGl0
aW9uLiBCdXQgeW91cgpjbGFyaWZpY2F0aW9uIG1ha2UgdGhpcyBtb3JlIHVuZGVyc3RhbmRhYmxl
IG5vdy4KCkkgd2lsbCBzZW5kIHRoZSBmaXggdG8gTGludXMuCgpDaGVlcnMsCk1pcXXDqGwKCj4g
Pj4+IEluIGZhY3QsIFJvZ2VyIG9uY2Ugc2FpZDoKPiA+Pj4KPiA+Pj4gCSJXZSB3aWxsIGZpZ3Vy
ZSBvdXQgaG93IHRvIGVuYWJsZSBPTUFQX0dQTUMgZm9yIEszIGFyY2hpdGVjdHVyZQo+ID4+PiAJ
c29tZSBvdGhlciB3YXkuIgo+ID4+Pgo+ID4+PiBJdCB0dXJucyBvdXQgdGhpcyBpcyBub3Qgd2hh
dCB3YXMgZmluYWxseSBwcm9wb3NlZC4gQ291bGQgd2UgdHJ5IHlldAo+ID4+PiBhbm90aGVyIHNv
bHV0aW9uPyAgICAKPiA+Pgo+ID4+IFRoaXMgaXNzdWUgaXMgc3RpbGwgcHJlc2VudCBpLmUuIHdl
IGNhbm5vdCBlbmFibGUgTVREX05BTkRfT01BUDIgZHJpdmVyIG9uCj4gPj4gSzMgcGxhdGZvcm0g
c2luY2UgT01BUF9HUE1DIGNvbmZpZyBpcyBoaWRkZW4gYW5kIG5vdCBzZWxlY3QtYWJsZQo+ID4+
IGJ5IHVzZXIgb3IgZGVmY29uZmlnIGZpbGUuCj4gPj4KPiA+PiBCdXQgaXQgaXMgbm90IHlldCBh
IGRlYWwgYnJlYWtlciBzaW5jZSBOQU5EIG9uIEszIGlzIG5vdCB5ZXQgZW5hYmxlZCB1cHN0cmVh
bS4KPiA+Pgo+ID4+IEZvciB0aGlzIEkgdGhpbmsgT01BUF9HUE1DIGhhcyB0byBiZSBhIHZpc2li
bGUgY29uZmlnIGVudHJ5IGFuZCBzZWxlY3QtYWJsZQo+ID4+IGZyb20gYSBkZWZjb25maWcgZmls
ZSBhcyBJIGhhZCBkb25lIGluaXRpYWxseSBbMV0uCj4gPj4KPiA+PiBOb3cgd2UgaGF2ZSBhIGxv
dCBvZiBleHBsYW5hdGlvbiB0byB3cml0ZSBhcyB0byB3aHkgd2UgbmVlZCB0byBkbyBpdCA7KSAg
Cj4gPiAKPiA+IFdlIGNlcnRhaW5seSBkbyA6KQo+ID4gICAKPiA+PiBbMV0gLSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sLzIwMjExMTIzMTAyNjA3LjEzMDAyLTMtcm9nZXJxQGtlcm5lbC5v
cmcvCj4gPj4gIAo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKPiAKPiBjaGVlcnMsCj4g
LXJvZ2VyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
