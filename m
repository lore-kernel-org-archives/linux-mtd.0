Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5812CD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOIBjWgpNru/SEbFffjPNYGRmbh4n+vRlvs+XwYlqeA=; b=Jsq5bhz6qZDomQ
	XumEmCLIOGWBNwDM9xWwBodza25ASr1ArEYBtGWGqvF1O4LwG63/QqUvnYc3KxXp9CERxNQQsS2Uo
	SkSBgqGq/ZCKa0hLDywrqxzV7S94ijR/1nqjf1DsOpAQLevl6Ri6RRf7C/4d4NDoStbXde/jOEW8S
	+9YXtMKxTzaESKPPCPCN2T7IgIUv5J+M1UpiTvapKI3qASu/bXs75BBVk87Am+Iy32Gnr5XmR8gEG
	khOsUdbhkQM/vP8aZnxtjKWzu9pGQfLiyYU2yVEc8bFzDN70P+0thazvaq6VBrI1N44DJZjimz/7P
	RrpFtHvCrdPZJXnrKlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOC2-0000000Cyo8-1MEb;
	Tue, 02 Jun 2026 12:26:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOBx-0000000Cyn2-26pM
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 12:26:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71881C6220B;
	Tue,  2 Jun 2026 12:25:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F370A603BC;
	Tue,  2 Jun 2026 12:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66F401088838A;
	Tue,  2 Jun 2026 14:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780403154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nY+lVPySUSaxoE8xcu7moT/k9ChClkx3Yw1+iU/k0qs=;
	b=KOpeSiC1AuTg5rFIO0WlcgkJjyz9gOaISm6vXGZb3m9UwJhVgLJvwg2rwaPZAoO+Oa1xvw
	4id7ZmJy1g0tUJk+bcH9D06ZhwJNe15Q6as+alG50DVARSYEk14wMQ/jHhQbo7N5+BHlM3
	/M9DFYhbD1HBiAOG0pXZkQRsJ2dCPQYjCdgV55eiGsAiA5ui8aUZz3WaoZ9ofqcQoSFb2V
	6jcAfIJe5njQhsGJj/hmi4qubujRPG7Uhua6No9aAQjxdqrvqM6BMJFgKOc33mViepqsGI
	HxuafeCdtSVNhGrKfcAFLrQOOP/rAUa0A9iqc2l0sUhnt97tknFD3JAwR1BD3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 09/13] spi: cadence-quadspi: reject 2-byte-address
 DDR ops on PHY-tunable hardware
In-Reply-To: <0ee42621-f970-451c-82cd-9a1a63ce197e@ti.com> (Santhosh Kumar
	K.'s message of "Mon, 1 Jun 2026 14:57:20 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-10-s-k6@ti.com> <87y0h3gb6o.fsf@bootlin.com>
	<0ee42621-f970-451c-82cd-9a1a63ce197e@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 14:25:49 +0200
Message-ID: <87se751642.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_052557_879636_3CF2B394 
X-CRM114-Status: GOOD (  22.46  )
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

T24gMDEvMDYvMjAyNiBhdCAxNDo1NzoyMCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBIZWxsbyBNaXF1ZWwsCj4KPiBPbiAyOC8wNS8yNiAxNDozMSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPj4gT24gMjcvMDUvMjAyNiBhdCAyMzoyNToyMyArMDUzMCwgU2Fu
dGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+IHdyb3RlOgo+PiAKPj4+IEVycmF0dW0gaTIzODMg
YWZmZWN0cyB0aGUgQU02NTQgT1NQSSBjb250cm9sbGVyOiBpbiBQSFkgRERSIG1vZGUsCj4+PiBv
cGVyYXRpb25zIHdpdGggYSAyLWJ5dGUgYWRkcmVzcyBjYXVzZSBhbiBpbnRlcm5hbCBzdGF0ZSBt
YWNoaW5lIHRvCj4+PiBtaXMtY29tcGFyZSB0aGUgdHJhbnNtaXR0ZWQgYWRkcmVzcyBieXRlIGNv
dW50IGFnYWluc3QgMSBpbnN0ZWFkIG9mIDIsCj4+PiBsb2NraW5nIHVwIHRoZSBhZGRyZXNzIHBo
YXNlLiBbMF0KPj4+Cj4+PiBBZGQgYSBDUVNQSV9OT18yQllURV9BRERSX1BIWV9ERFIgcXVpcmsg
ZmxhZyBhbmQgc2V0IGl0IG9uIHRoZSBhbTY1NF9vc3BpCj4+PiBwbGF0Zm9ybSBkYXRhLiBJbiBj
cXNwaV9zdXBwb3J0c19tZW1fb3AoKSwgd2hlbiBhIGNvbnRyb2xsZXIgY2FycmllcyB0aGlzCj4+
PiBxdWlyayBhbmQgaGFzIFBIWSB0dW5pbmcgc3VwcG9ydCwgcmVqZWN0IEREUiBvcGVyYXRpb25z
IHRoYXQgdXNlIDItYnl0ZQo+Pj4gYWRkcmVzc2luZy4KPj4+Cj4+PiBbMF0gaHR0cHM6Ly93d3cu
dGkuY29tL2xpdC9lci9zcHJ6NTQ0Yy9zcHJ6NTQ0Yy5wZGYKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL3Nw
aS9zcGktY2FkZW5jZS1xdWFkc3BpLmMgfCAxNSArKysrKysrKysrKysrKy0KPj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3Bp
LWNhZGVuY2UtcXVhZHNwaS5jCj4+PiBpbmRleCA1MDhiYzViYzRhYjUuLjcyMjA4ZDM3NjMwNSAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+Pj4gKysr
IGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+PiBAQCAtNDksNiArNDksNyBA
QCBzdGF0aWNfYXNzZXJ0KENRU1BJX01BWF9DSElQU0VMRUNUIDw9IFNQSV9ERVZJQ0VfQ1NfQ05U
X01BWCk7Cj4+PiAgICNkZWZpbmUgQ1FTUElfRElTQUJMRV9SVU5USU1FX1BNCUJJVCgxMCkKPj4+
ICAgI2RlZmluZSBDUVNQSV9OT19JTkRJUkVDVF9NT0RFCQlCSVQoMTEpCj4+PiAgICNkZWZpbmUg
Q1FTUElfSEFTX1dSX1BST1RFQ1QJCUJJVCgxMikKPj4+ICsjZGVmaW5lIENRU1BJX05PXzJCWVRF
X0FERFJfUEhZX0REUglCSVQoMTMpCj4+PiAgICAgLyogQ2FwYWJpbGl0aWVzICovCj4+PiAgICNk
ZWZpbmUgQ1FTUElfU1VQUE9SVFNfT0NUQUwJCUJJVCgwKQo+Pj4gQEAgLTE2MjcsNiArMTYyOCwx
OCBAQCBzdGF0aWMgYm9vbCBjcXNwaV9zdXBwb3J0c19tZW1fb3Aoc3RydWN0IHNwaV9tZW0gKm1l
bSwKPj4+ICAgCQlpZiAob3AtPmRhdGEubmJ5dGVzICYmIG9wLT5kYXRhLmJ1c3dpZHRoICE9IDgp
Cj4+PiAgIAkJCXJldHVybiBmYWxzZTsKPj4+ICAgKwkJLyoKPj4+ICsJCSAqIEVycmF0dW0gaTIz
ODM6IEluIFBIWSBERFIgbW9kZSwgMi1ieXRlIGFkZHJlc3NpbmcgY2F1c2VzIGFuCj4+PiArCQkg
KiBpbnRlcm5hbCBzdGF0ZSBtYWNoaW5lIHRvIG1pcy1jb21wYXJlIHRoZSB0cmFuc21pdHRlZAo+
Pj4gKwkJICogYWRkcmVzcyBieXRlIGNvdW50IGFnYWluc3QgMSBpbnN0ZWFkIG9mIDIsIGxvY2tp
bmcgdXAgdGhlCj4+PiArCQkgKiBhZGRyZXNzIHBoYXNlLiBSZWplY3Qgc3VjaCBvcHMgb24gY29u
dHJvbGxlcnMgdGhhdCBuZWVkIGl0Lgo+Pj4gKwkJICovCj4+PiArCQlpZiAoY3FzcGktPmRkYXRh
ICYmCj4+PiArCQkgICAgKGNxc3BpLT5kZGF0YS0+cXVpcmtzICYgQ1FTUElfTk9fMkJZVEVfQURE
Ul9QSFlfRERSKSkgewo+Pj4gKwkJCWlmIChvcC0+YWRkci5uYnl0ZXMgPT0gMiAmJiBjcXNwaS0+
ZGRhdGEtPmV4ZWN1dGVfdHVuaW5nKQo+Pj4gKwkJCQlyZXR1cm4gZmFsc2U7Cj4+PiArCQl9Cj4+
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHZhbGlkIGFwcHJvYWNoLiBXaGF0IHdlIHdhbnQgaXMg
dG8gcHJldmVudAo+PiB0dW5pbmcgaW4gb2N0YWwgRFRSIG1vZGUgd2l0aCAyIGJ5dGVzIGFkZHJl
c3NpbmcsIGluc3RlYWQgb2YgcHJldmVudGluZwo+PiByZWFkcy93cml0ZXMgaW4gb2N0YWwgRFRS
IG1vZGVzIGFmdGVyIHR1bmluZy4gSGF2ZSB5b3UgdHJpZWQgb24gYW4gQU02MkEgTFAKPj4gU0s/
IEkgYmV0IHByb2JlIGZhaWxzLi4KPj4gVGhlIHF1aXJrIHNob3VsZCBiZSBoYW5kbGVkIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIHR1bmluZyBwcm9jZWR1cmUsCj4+IHNvCj4+IHdlIHNraXAgdHVu
aW5nIGVudGlyZWx5IGluIHRoaXMgY2FzZS4KPgo+IEkgc2VlIHlvdXIgcG9pbnQuIEhvd2V2ZXIs
IGluIG15IHRlc3Rpbmcgb24gQU02MkF4IExQIFNLLCB0aGUgY29udHJvbGxlcgo+IGFuZCB0aGUg
Zmxhc2ggcHJvYmVzIGFuZCBvcGVyYXRlcyBjb3JyZWN0bHkgaW4gOFMgUEhZIG1vZGUuCj4KPiBU
aGUgcmVhc29uIEkgaGFuZGxlZCB0aGlzIGluIHN1cHBvcnRzX29wKCkgaXMgdGhhdCwgZm9yIHRo
ZXNlIGRldmljZXMsCj4gc2ltcGx5IHNraXBwaW5nIHR1bmluZyB3aGVuIGEgMi1ieXRlIEREUiBv
cGVyYXRpb24gaXMgc2VsZWN0ZWQgbWF5IG5vdAo+IGxlYWQgdG8gdGhlIGJlc3QgYWNoaWV2YWJs
ZSBvcGVyYXRpbmcgcG9pbnQuIFRoZSBwZXJmb3JtYW5jZSBvcmRlcmluZyBJCj4gbWVhc3VyZWQg
aXM6Cj4KPiA4UyBub24tUEhZIDwgOEQgbm9uLVBIWSA8IDhTIFBIWQoKTWF5YmUgdGhpcyBpcyBu
b3QgdG90YWxseSBnZW5lcmljIGFuZCBjYW5ub3QgYmUgdXNlZCBhcyBhIHNvbGlkIGdyb3VuZDoK
aXQgaGlnaGx5IGRlcGVuZHMgb24gdGhlIGJhc2UgZnJlcXVlbmN5LiBJZiB0aGUgYmFzZSBmcmVx
dWVuY3kgaXMgcmF0aGVyCmhpZ2ggKHR5cGljYWxseSA+IDg1TUh6KW4gdGhlbiA4RCBub24tUEhZ
IG1pZ2h0IGJlIGZhc3Rlci4gQnV0IG1heWJlCnRoaXMgaXMgbm90IHRoZSB0eXBpY2FsIGNhc2Ug
YW5kIGlzIHJhcmUgZW5vdWdoIHRvIGlnbm9yZS4KCj4gU28gZmFsbGluZyBiYWNrIGZyb20gOEQg
UEhZIHRvIDhEIG5vbi1QSFkgd291bGQgbGVhdmUgcGVyZm9ybWFuY2Ugb24gdGhlCj4gdGFibGUg
Y29tcGFyZWQgdG8gc2VsZWN0aW5nIGFuZCB0dW5pbmcgYW4gOFMgb3BlcmF0aW9uLgo+Cj4gVGhh
dCBzYWlkLCBJIGFncmVlIHRoYXQgZW5jb2RpbmcgdGhpcyBhcyBhbiBvcGVyYXRpb24gc3VwcG9y
dAo+IHJlc3RyaWN0aW9uIGlzIHByb2JhYmx5IG5vdCB0aGUgcmlnaHQgcGxhY2UgdG8gaGFuZGxl
IGl0LiBJJ2xsIHJld29yawo+IHRoZSBpbml0aWFsaXphdGlvbiBmbG93IHNvIHRoYXQgb3BlcmF0
aW9uIHNlbGVjdGlvbiBjYW4gdGFrZQo+IFBIWS1hY2hpZXZhYmxlIGZyZXF1ZW5jaWVzIGFuZCBj
b250cm9sbGVyLXNwZWNpZmljIHJlc3RyaWN0aW9ucyBzdWNoIGFzCj4gaTIzODMgaW50byBhY2Nv
dW50IHdoZW4gY2hvb3NpbmcgdGhlIGZpbmFsIG9wZXJhdGlvbnMuCgpWZXJ5IGludGVyZXN0aW5n
LgoKPiBMZXQgbWUgcHJvdG90eXBlIHRoaXMgYXBwcm9hY2ggYW5kIHdpbGwgcmVwb3J0IGJhY2sg
d2l0aCB0aGUgcmVzdWx0cy4KCkknbSBlYWdlciB0byBzZWUgdGhlIHJlc3VsdCEKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
