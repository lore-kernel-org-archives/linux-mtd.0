Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAA2C7EE29
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 06:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQKjUj88ocxKXaXwuU+wPcoPWFpuxopxqQV3Xi3MYmQ=; b=pL0YrUZ3ZVlTl8
	esiJ0lZUDPhPbm0v9ZYdJWxPLegX4oaBPmyDa/H1s17g8xvinFlfoKtl+rsQ0hf//Kzo2QixpIsw8
	cwdeYKWRcd5WTH0YhwSEGG5I36XffGR3K6tDRF7WEMbZg7m8VOu9wdervdtaIEwa+70nhpGgXwOzJ
	9ESxFlrvKMteUfHzP5/QR7/YANnxKIyYumLvAf3a62eKduLNK6F3Fq4AXgygXMmzwy5h0Ts+AeLoX
	9yK8VTtN6uU7UhKUYwy2IgP1D40tHHeDjXa5ii81nZkCgFpDpgKbrH7ZwceQ1aMiCHj6xsazRPYbd
	kTWdnA6Fy7rK59vlsjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8xjc-0076ea-00;
	Tue, 13 Jun 2023 06:42:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8xjX-0076an-0T;
	Tue, 13 Jun 2023 06:42:29 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686638541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrXtx3q+fEY1tPmCeQlf9j6nownlqedt7spCGcPEGYo=;
	b=bbZgiNRa0Lfg7M4kZerXFAix5Uih85EN7RBfhf+hXRj/BAN+z58sdh83Fv5PQcnkTq/o1E
	GSo44gGf3JnwrSZA4FJTdvsbaZjd1WV063cqzRNVcOf8w5bGSgViy7qW3pyL+4VWz4ZRMC
	uXZbiQnA3Ojc9CKWV96LEtLHFgKEJbjFOTLTsH/jhugDeE2uZXQmIgmUzQfgFjnQIGDgcW
	9cRv3yDI5omSbAGl8bLNafqcrUbQa3GZRcto2n03yKVFSf/5UDCDzNtbYalFXfg3kFIg/y
	XOCCZ3L0mFWrJEKyqKPgf6sDROejqCJBRbmTT/cN9beF7BJCPvMenpmHvRMcmg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C58B81C000E;
	Tue, 13 Jun 2023 06:42:19 +0000 (UTC)
Date: Tue, 13 Jun 2023 08:42:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD
 List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com,
 rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com,
 kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
 dan.beygelman@broadcom.com, linux-kernel@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal
 Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/12] mtd: rawnand: brcmnand: Add BCMBCA read data bus
 interface
Message-ID: <20230613084218.65a6da15@xps-13>
In-Reply-To: <da4cb6a6-aa7d-3747-3f64-19b5582b15e8@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
	<20230606231252.94838-11-william.zhang@broadcom.com>
	<20230607102232.17c4a27b@xps-13>
	<7b393f47-4053-a8c7-f32e-3881d8130d80@broadcom.com>
	<20230608081821.1de5a50b@xps-13>
	<4ab08e3e-3be4-8b8b-6eb8-03a62337f46f@broadcom.com>
	<20230609103544.0f00f799@xps-13>
	<3d3b471b-c555-ee1c-96d6-c04d76979e76@broadcom.com>
	<20230612194908.5465bc56@xps-13>
	<20230612195305.4b097c46@xps-13>
	<da4cb6a6-aa7d-3747-3f64-19b5582b15e8@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_234227_451561_3C31B94E 
X-CRM114-Status: GOOD (  43.19  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIE1vbiwgMTIg
SnVuIDIwMjMgMTI6MTg6NTggLTA3MDA6Cgo+IE9uIDA2LzEyLzIwMjMgMTA6NTMgQU0sIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4gPiBIZWxsbyBhZ2FpbiwKPiA+ICAgCj4gPj4+Pj4+Pj4gUGVyaGFw
cyB3ZSBjb3VsZCBoYXZlIGEgc2luZ2xlIGZ1bmN0aW9uIHRoYXQgaXMgc3RhdGljYWxseSBhc3Np
Z25lZCBhdAo+ID4+Pj4+Pj4+IHByb2JlIHRpbWUgaW5zdGVhZCBvZiBhIGZpcnN0IGhlbHBlciB3
aXRoIHR3byBjb25kaXRpb25zIHdoaWNoIGNhbGxzIGluCj4gPj4+Pj4+Pj4gb25lIGNhc2UgYW5v
dGhlciBob29rLi4uIFRoaXMgY2FuIGJlIHNpbXBsaWZpZWQgSSBndWVzcy4gIAo+ID4+Pj4+Pj4+
ICAgICAgPj4gV2VsbCB0aGlzIHdpbGwgbmVlZCB0byBiZSBkb25lIGF0IHRoZSBTb0Mgc3BlY2lm
aWMgaW1wbGVtZW50YXRpb24gbGV2ZWwgKGJjbTx4eHg+X25hbmQuYykgYW5kIGVhY2ggU29DIHdp
bGwgbmVlZCB0byBoYXZlIGVpdGhlciBnZW5lcmFsIGRhdGEgYnVzIHJlYWQgZnVuYyB3aXRoIGlz
X3BhcmFtIG9wdGlvbiBvciBkYXRhX2J1c19yZWFkX3BhZ2UsIGRhdGFfYnVzX3JlYWRfcGFyYW0u
ICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gWW91IHRvbGQgbWUgaW4gY2FzZSB3ZSB3b3VsZCB1c2UgZXhl
Y19vcCB3ZSBjb3VsZCBhdm9pZCB0aGUgcGFyYW0KPiA+Pj4+Pj4gY2FjaGUuIElmIHRoYXQncyB0
cnVlIHRoZW4gdGhlIHdob2xlIHN1cHBvcnQgY2FuIGJlIHNpbXBsaWZpZWQuICAKPiA+Pj4+Pj4g
ICAgID4+IENvcnJlY3Qgd2UgbWF5IHBvc3NpYmx5IHVuaWZpZWQgdGhlIHBhcmFtZXRlciBkYXRh
IHJlYWQgYnV0IGV4ZWNfb3AgaXMgbG9uZyBzaG90IGFuZCB3ZSBhcmUgbm90IGZ1bGx5IHJlYWR5
IGZvciB0aGF0IHlldC4gSXQgYWxzbyBkZXBlbmRzIG9uIGlmIHRoZSBsb3cgbGV2ZWwgZGF0YSBy
ZWdpc3RlciBoYXMgZW5kaWFuZXNzIGRpZmZlcmVuY2UgZm9yIHRoZSBwYXJhbWV0ZXIgZGF0YSBi
ZXR3ZWVuIGRpZmZlcmVuY2UgU29Dcy4gIAo+ID4+Pj4+Cj4gPj4+Pj4gU28gSSB3b3VsZCBsaWtl
IHRvIHB1c2ggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gYW5kIHdlIGNhbiBleHBsb3JlIHRo
ZSBleGVjX29wIG9wdGlvbiBsYXRlIHdoaWNoIHdpbGwgYmUgYSBtdWNoIGJpZyBhbmQgY29tcGxl
dGUgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uLiAgCj4gPj4+Pgo+ID4+Pj4gSSBhbSBzb3JyeSBi
dXQgdGhpcyBzZXJpZXMgaXMgdG90YWxseSBiYWNrd2FyZHMsIHlvdSdyZSB0cnlpbmcgdG8gZ3Vl
c3MKPiA+Pj4+IHdoYXQgY29tZXMgbmV4dCB3aXRoIHRoZSAnaXNfcGFyYW0nIHRoaW5nLCBpdCdz
IGV4YWN0bHkgd2hhdCB3ZSBhcmUKPiA+Pj4+IGZpZ2h0aW5nIGFnYWluc3Qgc2luY2UgMjAxNy4g
VGhlcmUgYXJlIHBsZW50eSBvZiAtPmV4ZWNfb3AoKQo+ID4+Pj4gY29udmVyc2lvbnMgb3V0IHRo
ZXJlLCBJIGRvbid0IGJlbGlldmUgdGhpcyBvbmUgd2lsbCBiZSBoYXJkZXIuIFlvdQo+ID4+Pj4g
bmVlZCB0byBjb252ZXJ0IHRoZSBkcml2ZXIgdG8gdGhpcyBuZXcgQVBJIGFuZCBnZXQgcmlkIG9m
IHRoaXMgd2hvbGUKPiA+Pj4+IGVuZGlhbm5lc3Mgbm9uLXNlbnNlIHRvIHNpbXBsaWZ5IGEgbG90
IHRoZSBkcml2ZXIuICAKPiA+Pj4+ICAgID4+PiBJIGFtIG5vdCBndWVzc2luZyBhbnl0aGluZyBi
dXQganVzdCBmYWN0b3Igb3V0IHRoZSBleGlzdGluZyBjb21tb24gbmFuZCBjYWNoZSByZWFkIGxv
Z2ljIGludG8gdGhlIHNpbmdsZSBkZWZhdWx0IGZ1bmN0aW9uKG9yIG9uZSBmb3IgcGFnZSByZWFk
IGFuZCBhbm90aGVyIGZvciBwYXJhbWV0ZXIgcmVhZCBhcyBJIG1lbnRpb25lZCBpbiBhbm90aGVy
IHRocmVhZCkgYW5kIGFsbG93IFNvQyB0byBvdmVycmlkZXMgdGhlIGltcGxlbWVudGF0aW9uIHdo
ZW4gbmVlZGVkLiAgCj4gPj4KPiA+PiBObywgeW91IGFyZSB0cnlpbmcgdG8gZ3Vlc3Mgd2hhdCB0
eXBlIG9mIHJlYWQgdGhlIGNvcmUgaXMgcGVyZm9ybWluZywKPiA+PiBlaXRoZXIgYSByZWd1bGFy
IGRhdGEgcGFnZSByZWFkIG9yIGEgcGFyYW1ldGVyIHBhZ2UgcmVhZC4KPiA+PiAgCj4gPj4+IEkg
YWdyZWUgLT5leGVjX29wIGNhbiBwb3NzaWJseSBnZXQgcmlkIG9mIHRoZSBwYXJhbWV0ZXIgcGFn
ZSByZWFkIGZ1bmN0aW9uIGFuZCBpcyB0aGUgd2F5IHRvIGdvLiBCdXQgaXQgd29uJ3QgaGVscCBv
biB0aGUgcGFnZSByZWFkIGZvciBlbmRpYW5lc3MuICAKPiA+Pgo+ID4+IFlvdSB0b2xkIG1lIHRo
ZXJlIGlzIG5vIGVuZGlhbmVzcyBpc3N1ZSB3aXRoIHRoZSBkYXRhIHBhZ2VzLCBzbyB3aHkgaXQK
PiA+PiB3b24ndCBoZWxwIG9uIHRoZSBwYWdlIHJlYWQ/Cj4gPj4gIAo+ID4+PiBJdCdzIG5vdCB0
aGF0IEkgYW0gYWdhaW5zdCBleGVjX29wIGJ1dCBJIHdhbnQgdG8gdGFrZSBvbmUgc3RlcCBhIHRp
bWUKPiA+Pj4gYW5kIEknZCBsaWtlIHRvIGdldCB0aGVzZSBmaXhlcyAgCj4gPj4KPiA+PiBJIGRv
bid0IHNlZSBhbnkgZml4IGhlcmU/IExldCBtZSBrbm93IGlmIEkgYW0gbWlzc2luZyBzb21ldGhp
bmcgYnV0Cj4gPj4gcmlnaHQgbm93IEkgc2VlIGEgbmV3IHZlcnNpb24gb2YgdGhlIGNvbnRyb2xs
ZXIgYmVpbmcgc3VwcG9ydGVkIHdpdGgKPiA+PiBpdHMgb3duIGNvbnN0cmFpbnRzLiBJZiB5b3Ug
YXJlIGZpeGluZyBleGlzdGluZyBjb2RlIGZvciBhbHJlYWR5Cj4gPj4gc3VwcG9ydGVkIHBsYXRm
b3JtLCB0aGVuIG1ha2UgaXQgY2xlYXIgYW5kIHdlIGNhbiBkaXNjdXNzIHRoaXMuIEJ1dCBpZgo+
ID4+IHlvdSBqdXN0IHdhbnQgdG8gc3VwcG9ydCB0aGUgYmNtYmNhIGZsYXZvciwgdGhlbiB0aGVy
ZSBpcyBubyByaXNrCj4gPj4gbWl0aWdhdGlvbiBpbnZvbHZlZCBoZXJlLCBhbmQgYSBjb252ZXJz
aW9uIGlzIHRoZSByaWdodCBzdGVwIDopCj4gPj4gIAo+ID4gCj4gPiBJIGZvcmdvdCB0byBtZW50
aW9uOiB0aGUgZXhlY19vcCBjb252ZXJzaW9uIGlzIGFsbW9zdCByZWFkeSwgQm9yaXMKPiA+IHdv
cmtlZCBvbiBpdCBidXQgaGUgbGFja2VkIHRoZSBoYXJkd2FyZSBzbyBtYXliZSB5b3UnbGwganVz
dCBuZWVkIHRvCj4gPiByZXZpdmUgdGhlIGZldyBwYXRjaGVzIHdoaWNoIHRhcmdldCB5b3VyIHBs
YXRmb3JtIGFuZCBkbyBhIGxpdHRsZSBiaXQgb2YKPiA+IGRlYnVnZ2luZz8KPiA+IAo+ID4gaHR0
cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGludXgvY29tbWl0cy9uYW5kL2V4ZWMtb3AtY29u
dmVyc2lvbj9hZnRlcj04YTNjZjZmZDI1ZDVlMTVjNjY2N2Y5ZTk1YzFmYzg2ZTRjYjczNWU2KzM0
JmJyYW5jaD1uYW5kJTJGZXhlYy1vcC1jb252ZXJzaW9uJnF1YWxpZmllZF9uYW1lPXJlZnMlMkZo
ZWFkcyUyRm5hbmQlMkZleGVjLW9wLWNvbnZlcnNpb24KPiA+ICAgCj4gWWVzIHRoaXMgaXMgdGhl
IHBhdGNoIHdoYXQgb3VyIGV4ZWNfb3Agd29yayBpcyBiYXNlZCBvbi4gVGhhbmtzIEJvcmlzISBU
aGUgaXNzdWUgd2l0aCBwYXRjaCBpcyB0aGF0IHBlcmZvcm1hbmNlIGlzIHZlcnkgc2xvdyBmb3Ig
YW55dGhpbmcgdGhhdCByZWx5IG9uIG5hbmRfcmVhZF9wYWdlX29wIGFzIHRoZSBwYXRjaCBpbXBs
ZW1lbnRpbmcgaXQgdXNpbmcgdGhlIGxvdyBsZXZlbCBjbWQgYW5kIGRhdGEgcmVnaXN0ZXIgdG8g
dHJhbnNmZXIgdGhlIGRhdGEgYnl0ZSBieSBieXRlLgoKWW91IGRvbid0IG5lZWQgdG8gdXNlIGV4
ZWNfb3AgZm9yIHlvdXIgcmVhZF9wYWdlL3dyaXRlX3BhZ2UgaG9va3MsCnF1aXRlIHRoZSBvcHBv
c2l0ZSBhY3R1YWxseS4gZXhlY19vcCBpcyBub3QgbWVhbnQgZm9yIGhpZ2ggdGhyb3VnaHB1dC4K
ZXhlY19vcCBpcyBtZWFudCB0byBiZSBzaW1wbGUuIFlvdSBjYW4gaGF2ZSBmYXN0IEkvT3Mgd2l0
aCBhIGRpZmZlcmVudAptZWNoYW5pc20gaW4geW91ciByZWFkL3dyaXRlX3BhZ2UgaG9va3MuCgo+
ICBJIGFjdHVhbGx5IHNlbnQgb3V0IGVtYWlsIHJlZ2FyZGluZyB0aGlzIHRvIEJvcmlzIGFuZCBo
ZSBjYydlZCB5b3UgaW4KPiAgc2VwdCBsYXN0IHllYXIuIFdlIGhhdmUgdG8gdXNlIHRoZSBuYW5k
IHBhcnNlciB0byBtYXRjaCB0aGUgcGFnZSByZWFkCj4gIGZyb20gZXhlY19vcCBzbyB3ZSBjYW4g
YWN0dWFsbHkgbWF0Y2ggYW5kIHVzZSB0aGUgYnJjbW5hbmRfcGFnZV9yZWFkCj4gIGZhc3QgcGF0
aC4gQnV0IHRoZXJlIGFyZSBtYW55IHNpdHVhdGlvbnMgdGhhdCB3ZSBuZWVkIHRvIG1hdGNoIHNv
IHRoZQo+ICBwcm9qZWN0IHRvIG1pZ3JhdGUgZXhjZV9vcCBhcmUgc3RpbGwgd29yayBpbiBwcm9n
cmVzcyBqdXN0IG9uIG91cgo+ICBiY21iY2EgY2hpcCBhcyBvZiBub3cuICBKdXN0IGZvcndhcmQg
dGhhdCBlbWFpbCBhZ2FpbiB0byB5b3UgYW5kIEkKPiAgYXBwcmVjaWF0ZSBpdCBpZiB5b3UgaGF2
ZSBhbnkgaW5wdXRzIHRoZXJlLiBTbyBJTUhPIGl0IGlzIGp1c3QgdG9vCj4gIHJpc2t5IGFuZCB0
b28gYmlnIG9mIHNjb3BlIHRvIGhhdmUgdGhlIGV4ZWNfb3AgYWRkZWQgdG8gdGhpcyBwYXRjaAo+
ICBzZXJpZXMgYW5kIGRlZmluaXRpdmVseSBiZXR0ZXIgdG8gZG8gaXQgYWZ0ZXJ3YXJkcyB3aXRo
IGEgZGVkaWNhdGVkCj4gIHBhdGNoLgoKQXMgbG9uZyBhcyB5b3UgYWRkIHNtYWxsIGFuZCBvcnRo
b2dvbmFsIGNoYW5nZXMgdG8gY21kX2N0cmwvY21kX2Z1bmMKSSBkb24ndCBtaW5kLCBidXQgd2hh
dCB5b3Ugd2FudCBub3cgaXMgdG8gZm9yY2UgbWUgdG8gcHVsbCBkaXJ0eQpjaGFuZ2VzICJmaXJz
dCIsIHRoZSB0eXBlIG9mIGNoYW5nZSB3ZSBhcmUgcmVmdXNpbmcgc2luY2UgMjAxOCwgbWFraW5n
Cm1lIGV4cGVjdCB5b3UnbGwgcGVyZm9ybSB0aGUgY29udmVyc2lvbiBhZnRlci4gSXQgd291bGQg
aGF2ZSBiZWVuCnRlcnJpYmx5IGxlc3MgZGlydHkgYW5kIHlvdSB3b3VsZCBoYXZlIGFsbCB5b3Vy
IGNvZGUgYWxyZWFkeSB1cHN0cmVhbWVkCmlmIHlvdSBoYWQgcGVyZm9ybWVkIHRoZSBleGVjX29w
IGNvbnZlcnNpb24gc2luY2UgU2VwdGVtYmVyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
