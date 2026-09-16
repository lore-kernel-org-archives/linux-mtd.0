Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E03CC88E77
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArIa3L5SSd6Hgpi6Qkdv68d5r9hZq30y/IywRI2P2U8=; b=SHRLLnyv1R7BO7
	UtN9xjptzftTivuR4rCTjhMiZpbYMkAAwqdfo5ZF8pAeGUZ1k6ah2owNlnghDcY+9R/FdocRy+gRa
	HGe130P+1dvGif+78nioVQd9CG7LW6ukFUblRA3fVDIiV1nH/bfOjxTpKGo6wdt2GaVuAfIIoDEl4
	Xk4Gf9dybd67FrHanKnKwK579yKooe6srWYAAOP51M6JWQx3xaCJwd54GY3D7sBOIVNPFrb1TROlG
	Q6ekpCTOJJaMppHhog+Tm7pq8ziwALGOc/AC99yu22Qw0VbiC6aJo5lmJc0mZZ7a9fZonQkkGQrdm
	0uxoeZFRtqTxyBkzK9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jrN-00000008ZJJ-2Ghk;
	Wed, 16 Sep 2026 07:15:13 +0000
Received: from 0001.3ffe.de ([159.69.201.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jrG-00000008ZIR-2d7d
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 07:15:09 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B36EF160;
	Wed, 16 Sep 2026 09:14:52 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 16 Sep 2026 09:14:52 +0200
Message-Id: <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com> <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org> <aqgRsP3cxzcLok5C@nsa>
In-Reply-To: <aqgRsP3cxzcLok5C@nsa>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_001508_271296_CD71E986 
X-CRM114-Status: GOOD (  32.53  )
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

SGksCgpPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDU6MzEgUE0gQ0VTVCwgTnVubyBTw6Egd3JvdGU6
Cj4gT24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMDQ6MDQ6NDBQTSArMDIwMCwgTWljaGFlbCBXYWxs
ZSB3cm90ZToKPj4gT24gTW9uIFNlcCAxNCwgMjAyNiBhdCAzOjQyIFBNIENFU1QsIE51bm8gU8Oh
IHdyb3RlOgo+PiA+ICgqKTogSSBzaG91bGQgbm90ZSB0aGF0IHRoZSBjb21tYW5kIGFjdHVhbGx5
IGZhaWxlZCB3aXRoIC1FSU8gYnV0IGl0Cj4+ID4gYWN0dWFsbHkgdW5sb2NrZWQgdGhlIGNoaXAh
IEFuZCB0aGUgcmVhc29uIGlzIGJlY2F1c2UgdGhlIGZsYXNoIGFzIHRoZSBzYW1lCj4+ID4gRlNS
IHJlZ2lzdGVyIHRoYW4gdGhlIG1pY3Jvbi1zdCBmbGFzaC4gU28gV0VMIGlzIHNldCB0byAxIGJ1
dCBjYW4gb25seQo+PiA+IGJlIGNsZWFyZWQgd2hlbiBjbGVhcmluZyB0aGUgRlNSIHJlZ2lzdGVy
Lgo+PiAKPj4gV2h5IGRvZXNuJ3QgdGhpcyBhZmZlY3Qgb25seSB0aGUgbG9ja2luZyBvcGVyYXRp
b24/IFdFTCBwb2xsaW5nIGlzCj4+IHVzZWQgYWxzbyBkdXJpbmcgd3JpdGUgYW5kIGVyYXNlLgoK
U29ycnkgSSBtZWFudCBXSVAuCgo+IE5vdCBzdXJlIGlmIEkgZnVsbHkgdW5kZXJzdGFuZC4gQnV0
IEFGQUlDVCwgdGhlIHJlYXNvbiB3aHkgZXJhc2UgYW5kCj4gd3JpdGUgaXMgc2lsZW50IGlzIGJl
Y2F1c2UgdGhlIGRlZmF1bHQgc3BpX25vcl9zcl9yZWFkeSgpIG9ubHkgbG9va3MgYXQKPiBTUl9X
SVAgWzFdOgoKU28gdXN1YWxseSwgdGhlIFdFTCBpcyBjbGVhcmVkIGF1dG9tYXRpY2FsbHkgYnkg
d2hhdGV2ZXIgbmVlZHMgdGhlCldFTCBpbiB0aGUgZmlyc3QgcGxhY2UsIGkuZS4gcHJvZ3JhbSBv
ciBlcmFzZSwgd3JpdGUgKHN0YXR1cykKcmVnaXN0ZXIuIFRoYXQgc2hvdWxkIGFsc28gYmUgdGhl
IGNhc2UgZm9yIHRoaXMgZmxhc2guCgpOb3cgZm9yIHRoaXMgZmxhc2ggKGFzIHdlbGwgYXMgdGhl
IHN0L21pY3JvbiBvbmVzKSwgdGhlcmUgaXMgb25lCnBlY3VsaWFyaXR5LiBXaGVuZXZlciB0aGVy
ZSBpcyBhbiBlcnJvciBiaXQgc2V0IGluIHRoZSBGU1IsIHRoZSBXRUwKY2Fubm90IGJlIGNsZWFy
ZWQgYnkgYSB3cml0ZSBkaXNhYmxlIGNvbW1hbmQuIFdoaWNoIHdlIHNob3VsZG4ndApuZWVkIGFu
eXdheSBiZWNhdXNlIGl0IHNob3VsZCBiZSBjbGVhcmVkIGF1dG9tYXRpY2FsbHkgaWYgbm90aGlu
Zwpnb2VzIHdyb25nLgoKQWxzbyB0aGUgd3JpdGUgc3RhdHVzIHJlZ2lzdGVyIHdvbid0IHNldCB0
aGUgZXJyb3IgYml0cyBpZiBpIHJlYWQKdGhlIGRhdGFzaGVldCBjb3JyZWN0bHkgYW5kIGl0IHdp
bGwgYWx3YXlzIGRpc2FibGUgdGhlIFdFTCwgc2VlClRhYmxlIDI5ICgiV1JJVEUgUkVHSVNURVIg
T3BlcmF0aW9ucyIpIGluIHRoZSBNVDM1WFU1MTJBQkEgZGF0YXNoZWV0CmFuZCBUYWJsZSA4LDgg
KCJXUklURSBSRUdJU1RFUiBPcGVyc3RhaW9ucyIpIGluIHRoZSBJUzI1V1gwMUcKZGF0YXNoZWV0
LgoKPiBPVE9ILCBvbiB0aGUgdW5sb2NrIHBhdGggd2UgZG8gc3BpX25vcl93cml0ZV9zcjFfYW5k
X3NyMl9hbmRfY2hlY2soKSBhbmQKPiBnaXZlIG5vIHNwZWNpYWwgaGFuZGxpbmcgdG8gV0VMIHNv
IEkgaW1hZ2luZSB0aGF0IHdlIHRyeSB0byBzZXQgaXQgYXMgMAo+IGJ1dCByZWFkIGl0IGFzIDEg
KGdpdmVuIHRoYXQgaXQgY2xlYXJzIG9ubHkgd2l0aCBGU1IpIGFuZCBoZW5jZSBJIGdvdAo+IHRo
ZSAtRUlPIGluIFsyXS4KCldlIGRvIGEgUk1XLCBzbyBteSBndWVzcyBpcyB0aGF0IGl0J3MgdGhl
IG90aGVyIHdheSBhcm91bmQuIFdlIHJlYWQKaXQgYXMgMSwgYnV0IHRoZW4gYWZ0ZXIgd3JpdGlu
ZyB0aGUgU1IsIGl0J3MgMCAoc2VlIGFib3ZlKS4gVGhhdAphY3R1YWxseSBhc3N1bWVzLCB0aGF0
IGlmIHRoZSBXRUwgYW5kIGFueSBlcnJvciBiaXQgaW4gdGhlIEZTUiBpcwpzZXQsIGEgd3JpdGUg
c3RhdHVzIHJlZ2lzdGVyIHdpbGwgY2xlYXIgdGhlIFdFTCBhbnl3YXlzLiBDb3VsZCB5b3UKZGVi
dWcgdGhhdCBzbyB3ZSBhcmUgc3VyZSwgdGhpcyBpcyB3aGF0IGFjdHVhbGx5IGhhcHBlbnM/CgpC
dXQgdGhlIHF1ZXN0aW9uIGlzIHdobyBpcyBzZXR0aW5nIHRoZSBlcnJvciBiaXQgaW4gdGhlIGZp
cnN0IHBsYWNlLgpBbmQgSSBndWVzcyBpdCdzIHRoZSB0ZXN0aW5nIHNlcXVlbmNlIGZvciB0aGUg
bG9ja2luZyB3aGVuIHlvdSB0cnkKdG8gd3JpdGUgdG8gYSBsb2NrZWQgcmFuZ2UuIFNvIHlvdSBj
b3VsZCBhbHNvIGFjdHVhbGx5IHRlc3QgdGhlCmxvY2tpbmcvdW5sb2NraW5nIHdpdGhvdXQgd3Jp
dGluZyBhbnkgZGF0YSB0byB0aGUgZmxhc2gganVzdCB0byBzZWUKaWYgdGhhdCBpcyB0aGUgY2Fz
ZS4KCj4+ID4gQUZBSUNULCB3ZSBzaG91bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIgYXMgbWljcm9u
IHNvIHRoZSB3cml0aW5nIHRvIGFuCj4+ID4gYWN0dWFsIHByb3RlY3RlZCByZWdpb24gZmFpbHMg
cmF0aGVyIHRoYW4gYmVpbmcgc2lsZW50bHkgZGlzY2FyZGVkIHdpdGgKPj4gPiB0aGF0IHN0YXR1
cyBiaXQgc2V0LiBUaGUgcXVlc3Rpb24gd291bGQgYmUgaG93IHRvIGRvIGl0PyBUaGUgY29kZSBp
cwo+PiA+IHByZXR0eSBtdWNoIGlkZW50aWNhbCB0byBbMV0uIFRoZSBtYXNrcywgdGhlIG9wY29k
ZWQuLi4gU28gc2hvdWxkIHdlCj4+ID4gc29tZWhvdyBoYW5kbGUgdGhpcyBpbiB0aGUgY29yZSAo
YnkgaGF2aW5nIHNvbWUgY29tbW9uIGhlbHBlcikgdGhhdAo+PiA+IGNvdWxkIGJlIHNldCBpbiAu
bGF0ZV9pbml0KCkgdW5kZXIgYSBjb21tb24gTUZSX0ZTUiBmbGFnPyBPciBqdXN0IGtlZXAKPj4g
PiBib3RoIGltcGxlbWVudGF0aW9ucyBzZXBhcmF0ZSBmb3Igbm93Pwo+PiAKPj4gSSdkIGxpa2Ug
dG8ga2VlcCB0aGF0IG91dCBvZiB0aGUgY29yZS5jLCBidXQgYWxzbyBsaWtlIHRvIGF2b2lkIGFu
eQo+PiBjb2RlIGR1cGxpY2F0aW9uIGVzcC4gYmVjYXVzZSB0aGVyZSBpcyBhbHJlYWR5IGhhbmRs
aW5nIGZvciB0aGUKPj4gaW50ZWwgc3BpIGNvbnRyb2xsZXIgaW4gdGhlcmUuIFNvIG1heWJlIG1v
dmUgaXQgaXQgaW50byBhIG5ldwo+PiBjb21tb24uYy4KPgo+IEFsc28gZG9uJ3QgbGlrZSB0aGUg
ZHVwIHRiaC4gQ291bGQgdGhhdCBiZSBhIGZvbGxvdyB1cCBvciBzaG91bGQgaXQgYmUKPiB2My4g
RnJvbSB0aGUgdG9wIG9mIG15IGhlYWQgSSBjb3VsZCB0aGluayBvbiBhIG1mcl9jb21tb24uYyBr
aW5kIG9mIHRoaW5nLgo+IERvbid0IHRoaW5nIHRoaXMgRlNSIHJlZ2lzdGVyIGlzIHN0YW5kYXJk
PwoKTm90IHJlYWxseS4KCkJ1dCAoYXQgbGVhc3QpIHBhcnRzIG9mIHRoZSBkYXRhc2hlZXRzIGFy
ZSBhY3R1YWxseSBjb3BpZWQgdmVyYmF0aW0KYmV0d2VlbiBtaWNyb24gYW5kIGlzc2ksIEkgd29u
ZGVyIGlmIHdlIHNob3VsZG4ndCBqdXN0IHB1dCB0aGUgSVNTSQpwYXJ0IGluIG1pY3Jvbi1zdC5j
LiAoWWVzIHZlbmRvciB3aWxsIGJlIHdyb25nLCBidXQgSSBwbGFuIG9uCmRlcHJlY2F0aW5nIHRo
YXQgc3lzZnMgcHJvcGVydHkgYW55d2F5KS4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
