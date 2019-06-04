Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52DEC04AB5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 01:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C8C206BA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 01:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSIvyL8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C8C206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SP6/XjLxcySn3jkvDVyUUDSU/3v1O4edleVUDJWDVc=; b=KSIvyL8yHBAd/a
	uEaQmn1GRKKaxst5mmxRCP+2LEUhUwTfhLQ0Ps6Qnz8CiU79AMMqFVOh929gfvH5OZuUvlvnTWl4m
	L/YHIdZ2rYoUZGLcvjF2trb0xNV56eV6v9P1i9kihPdB3P4X+kzeG9l2th/fbyQkRpAUMbieyPJAO
	C0gtcy5EFRyQOlZteUEDq8KLJ9zkEW0aZHurQShLZcIHYbWWtvzZQkVlj4KD4EP9SN96eUHwlqZT/
	irfEEyMCmzmuMbbG8qAhJxQg35kEPC7fHgV11ZkkCs8+FZtdMY09ZfSpDmXVfkuJX1CZhBOekcbwA
	OitoxUDB0ebNhmb6Gb5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXydg-0004Bf-Mh; Tue, 04 Jun 2019 01:53:24 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXydd-0004BJ-GP
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 01:53:23 +0000
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4C9F6200008;
 Tue,  4 Jun 2019 01:53:02 +0000 (UTC)
Date: Tue, 4 Jun 2019 03:53:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: atmel nand bindings vs. actual dts files
Message-ID: <20190604015301.GK3558@piout.net>
References: <1823900.qPX5mxbl1h@ada> <4099561.5sHrvDXGx3@ada>
 <20190429115540.7d577a50@xps13> <1947914.CcHDgmXbBm@ada>
 <20190430113242.5cad2f16@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430113242.5cad2f16@xps13>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_185321_704845_1C5ED13C 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Alexander Dahl <ada@thorsis.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMzAvMDQvMjAxOSAxMTozMjo0MiswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFs
ZXhhbmRlciwKPiAKPiBBbGV4YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPiB3cm90ZSBvbiBU
dWUsIDMwIEFwciAyMDE5IDExOjI0OjQ0Cj4gKzAyMDA6Cj4gCj4gPiBIZWxsbyBNaXF1w6hsLAo+
ID4gCj4gPiBBbSBNb250YWcsIDI5LiBBcHJpbCAyMDE5LCAxMTo1NTo0MCBDRVNUIHNjaHJpZWIg
TWlxdWVsIFJheW5hbDoKPiA+ID4gQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4gd3Jv
dGUgb24gVGh1LCAwNyBNYXIgMjAxOSAxNzoyNToxNyAgCj4gPiA+ID4gQW0gTWl0dHdvY2gsIDYu
IE3DpHJ6IDIwMTksIDE1OjA3OjUyIENFVCBzY2hyaWViIEFsZXhhbmRlciBEYWhsOiAgCj4gPiA+
ID4gPiBTbyBpbnN0ZWFkIG9mICJhbHdheXMgMHg4MDAwMDAiIHRoYXQgbm9kZSBoYXMgMHgyIGFz
IHRoaXJkIGVudHJ5IGZvciB0aGUKPiA+ID4gPiA+ICdyZWcnIHByb3BlcnR5LiBXaHkgaXMgdGhh
dD8gIAo+ID4gPiA+IAo+ID4gPiA+IEkgZGlkbid0IGludmVzdGlnYXRlIHRoYXQgZnVydGhlciB5
ZXQsIGJ1dCBJJ20gY3VyaW91cywgc28gaWYgYW55b25lCj4gPiA+ID4ga25vd3M/ICAKPiA+ID4g
Cj4gPiA+IEkgc3VwcG9zZSB0aGUgYmluZGluZ3MgWzFdIGV4cGxhaW4gdGhlIHNpdHVhdGlvbi4K
PiA+ID4gCj4gPiA+IFsxXQo+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4wL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGkKPiA+ID4gbmdzL210ZC9h
dG1lbC1uYW5kLnR4dCNMMzIgIAo+ID4gCj4gPiBObywgdGhhdCB3YXMgbm90IHdoYXQgSSB3YW50
ZWQgdG8ga25vdy4gVGhlIGJpbmRpbmdzIHNheXMgZm9yIHRoYXQgcmVnIAo+ID4gcHJvcGVydHk6
IOKAnDNyZCBlbnRyeTogdGhlIG1lbW9yeSByZWdpb24gc2l6ZSAoYWx3YXlzIDB4ODAwMDAwKeKA
nQo+ID4gCj4gPiBUaGlzIGlzIHRydWUgZm9yIHNvbWUgZHRzIGZpbGVzIGluY2x1ZGluZyB0aGlz
IG5hbmQgbm9kZSwgYnV0IG5vdCBmb3IgYWxsLCAKPiA+IHNvbWUgaGF2ZSB0aGlzOgo+ID4gCj4g
PiAJbmFuZEAzIHsKPiA+IAkJcmVnID0gPDB4MyAweDAgMHg4MDAwMDA+Owo+ID4gCj4gPiBPdGhl
cnMgaGF2ZSB0aGlzOgo+ID4gCj4gPiAJbmFuZEAzIHsKPiA+IAkJcmVnID0gPDB4MyAweDAgMHgy
PjsKPiA+IAo+ID4gVGhlIHNlY29uZCBjb250cmFkaWN0cyB0aGUgYmluZGluZyBkb2MuIE1vc3Qg
b2YgdGhpcyB3YXMgY2hhbmdlZCB3aGVuIAo+ID4gc3dpdGNoaW5nIGZyb20gdGhlIG9sZCBiaW5k
aW5ncyBpbiBjaGFuZ2VzZXQgdjQuMTItcmMxLTctZzEwMDRhMjk3N2JkYyBieSAKPiA+IEJvcmlz
IEJyZXppbGxvbi4gSSB3YW50ZWQgdG8ga25vdyB3aHkgdGhlIGRpZmZlcmVuY2U/IAo+IAo+IElu
ZGVlZC4gQWRkaW5nIEFsZXhhbmRyZSB3aG8gbWlnaHQgYWxzbyBoYXZlIGFuIGlkZWEgYW5kIFR1
ZG9yIGZvcgo+IHJlZmVyZW5jZS4KPiAKCkknZCBzYXkgdGhhdCA8MHgzIDB4MCAweDI+IG9ubHkg
d29ya3MgYmVjYXVzZSBpb3JlbWFwIHdpbGwgYWx3YXlzIG1hcCBhCjRrIHBhZ2UgYW5kIERNQSBp
cyB1c2VkIHNvIHdlIGFyZSBub3QgYWNjZXNzaW5nIGFueXRoaW5nIGJleW9uZCB0aGF0CnBhZ2Ug
dXNpbmcgdGhlIHZpcnR1YWwgYWRkcmVzcy4KCgotLSAKQWxleGFuZHJlIEJlbGxvbmksIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
