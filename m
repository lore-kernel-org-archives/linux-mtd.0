Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17CCCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rRwz6K5OKjh54L+dL+OSuPdB1h7628piKIz/vB7cd4=; b=nmaVbjSZezW9RN
	gYSDVQHfEzIOqYRV/xEJmftqIVL3KFYyHP9MapAufUAOWyNyqa4b0GwxJKRe7dv9TqHCOfdbRgJC2
	aZGWmqss3t9ZbX2+vXagqrFWPor730UGrDLMGhkzTXcidMODFt+w5dhkilkHeZPEibOgvNn5Bjfrl
	4blq2+j8D2TkTkMP0NwGxQf16BuND+RbIsUxu9v9NNsoYZLErWK/gEo0JBpXeqlvPOA5o5dnI79ZW
	eI8ZSTmR8gTMeNqhLltPsBOZ+1LQhG8lNu6iUTk/iINEYyN/CYk8RIIgA+grX1qotelEtSta5/TXH
	fvmalCGOBPekL8e1OiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8R6-00000008c9L-0Mlx;
	Wed, 12 Nov 2025 10:50:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8R2-00000008c8n-34o8
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 10:50:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 181C54E41667;
	Wed, 12 Nov 2025 10:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C59876070B;
	Wed, 12 Nov 2025 10:50:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 768F3102F1699;
	Wed, 12 Nov 2025 11:50:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762944640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0+unaSKUFdFHJhkY4RjZVR+uXBrXziaM/doRPyYlSzQ=;
	b=mizS3kv6uoJgba8W4pJm2oS1mrMVnDNPFVJGQtU9ZgSJ701Y4ZdRvd79WEdYs8x9oSCo2s
	eib7tTolLYvjh7nAX9IW6fY5GD8Dgi75aZpad/kIZtuuxlEK/m2S4KhbjV1/IpEbPG4YM2
	BFwpY/jSKDhFPWfHHmicaiK5iFxE+KicBh5szT0Jp1pNgGc7eO6h5gHI90amSMyC1579zS
	Bz8F33OK+M9WL7/qMB9goIa/Hl52oAH+mAW7AeSQ+z73GxrFCxw7aWX7rc5S4dU7E2bytQ
	Vego2TDdagK+fyvI6188iQ+SZ7qAHIr4CIpclwQWxXBNFSNm/te+7wtwhoAAEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdpart: ignore error -ENOENT from parsers on
 subpartitions
In-Reply-To: <691456b8.050a0220.3c21b3.5c4c@mx.google.com> (Christian
	Marangi's message of "Wed, 12 Nov 2025 10:43:17 +0100")
References: <20251109115247.15448-1-ansuelsmth@gmail.com>
	<87y0ob7fyy.fsf@bootlin.com>
	<691456b8.050a0220.3c21b3.5c4c@mx.google.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 12 Nov 2025 11:50:36 +0100
Message-ID: <87ikffikxv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_025045_090481_384651D3 
X-CRM114-Status: GOOD (  22.04  )
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

T24gMTIvMTEvMjAyNSBhdCAxMDo0MzoxNyArMDEsIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxz
bXRoQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIFdlZCwgTm92IDEyLCAyMDI1IGF0IDEwOjMzOjI1
QU0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIENocmlzdGlhbiwKPj4gCj4+IE9u
IDA5LzExLzIwMjUgYXQgMTI6NTI6NDQgKzAxLCBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210
aEBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4gPiBDb21taXQgNWMyZjc3MjdkNDM3ICgibXRkOiBt
dGRwYXJ0OiBjaGVjayBmb3Igc3VicGFydGl0aW9ucyBwYXJzaW5nCj4+ID4gcmVzdWx0IikgaW50
cm9kdWNlZCBzb21lIGtpbmQgb2YgcmVncmVzc2lvbiB3aXRoIHBhcnNlciBvbiBzdWJwYXJ0aXRp
b25zCj4+ID4gd2hlcmUgaWYgYSBwYXJzZXIgZW1pdHMgYW4gZXJyb3IgdGhlbiB0aGUgZW50aXJl
IHBhcnNpbmcgcHJvY2VzcyBmcm9tIHRoZQo+PiA+IHVwcGVyIHBhcnNlciBmYWlscyBhbmQgcGFy
dGl0aW9ucyBhcmUgZGVsZXRlZC4KPj4gPgo+PiA+IE5vdCBjaGVja2luZyBmb3IgZXJyb3IgaW4g
c3VicGFydGl0aW9ucyB3YXMgb3JpZ2luYWxseSBpbnRlbmRlZCBhcwo+PiA+IHNwZWNpYWwgcGFy
c2VyIGNhbiBlbWl0IGVycm9yIGFsc28gaW4gdGhlIGNhc2Ugb2YgdGhlIHBhcnRpdGlvbiBub3QK
Pj4gPiBjb3JyZWN0bHkgaW5pdCAoZm9yIGV4YW1wbGUgYSB3aXBlZCBwYXJ0aXRpb24pIG9yIHNw
ZWNpYWwgY2FzZSB3aGVyZSB0aGUKPj4gPiBwYXJ0aXRpb24gc2hvdWxkIGJlIHNraXBwZWQgZHVl
IHRvIHNvbWUgRU5WIHZhcmlhYmxlcyBleHRlcm5hbGx5Cj4+ID4gcHJvdmlkZWQgKGZyb20gYm9v
dGxvYWRlciBmb3IgZXhhbXBsZSkKPj4gPgo+PiA+IE9uZSBleGFtcGxlIGNhc2UgaXMgdGhlIFRS
WCBwYXJ0aXRpb24gd2hlcmUsIGluIHRoZSBjb250ZXh0IG9mIGEgd2lwZWQKPj4gPiBwYXJ0aXRp
b24sIHJldHVybnMgYSAtRU5PRU5UIGFzIHRoZSB0cnhfbWFnaWMgaXMgbm90IGZvdW5kIGluIHRo
ZQo+PiA+IGV4cGVjdGVkIFRSWCBoZWFkZXIgKGFzIHRoZSBwYXJ0aXRpb24gaXMgd2lwZWQpCj4+
IAo+PiBJIGRpZG4ndCBoYWQgaW4gbWluZCB0aGlzIHdhcyBhIHZhbGlkIGNhc2UuIEkgYW0gYSBi
aXQgcHV6emxlZCBiZWNhdXNlCj4+IGl0IG9wZW5zIHRoZSBicmVhY2ggdG8gb3RoZXIgc3BlY2lh
bCBjYXNlcywgYnV0IGF0IHRoZSBzYW1lIHRpbWUgSSBoYXZlCj4+IG5vIHN0cm9uZyBhcmd1bWVu
dHMgdG8gcmVmdXNlIHRoaXMgc2l0dWF0aW9uIHNvIGxldCdzIGdvIGZvciBpdC4KPj4gCj4KPiBU
aGFua3MgYSBsb3QgZm9yIGFjY2VwdGluZyB0aGlzLiBJIGNoZWNrZWQgYWxsIHRoZSBwYXJzZXIg
Ym90aCB1cHN0cmVhbQo+IGFuZCBkb3duc3RyZWFtIGFuZCBJIGZvdW5kIHRoaXMgIiJ1bmRvY3Vt
ZW50ZWQiIiBwYXR0ZXJuIG9mIHJldHVybmluZwo+IC1FTk9FTlQuIFsxXSBbMl0gWzNdCj4KPiBG
b3Igc3VyZSBpdCdzIGEgcmVncmVzc2lvbiwgd2UgaGFkIHZhcmlvdXMgZGV2aWNlIG9uIE9wZW5X
cnQgdGhhdCBicm9rZQo+IGZyb20gbWlncmF0aW5nIGZyb20gNi42IHRvIDYuMTIuIEkgYWdyZWUg
dGhlcmUgaXMgdGhlIHJpc2sgeW91IGFyZQo+IHBvaW50aW5nIG91dCBidXQgSSBmZWVsIHRoaXMg
aXMgYSBnb29kIGNvbXByb21pc2UgdG8gcmVzdG9yZSBvcmlnaW5hbAo+IGZ1bmN0aW9uYWxpdHkg
b2YgdGhlIHVwc3RyZWFtIHBhcnNlcnMuCj4KPiAodGhlIG90aGVyIGVycm9yIGNvbmRpdGlvbiBh
cmUgLUVOT01FTSBvciBzb21ldGltZXMgLUVJTlZBTCBmb3IgcGFyc2VyCj4gaGVhZGVyIHByZXNl
bnQgYnV0IHZlcnkgd3JvbmcpCj4KPiBbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuMTcuNy9zb3VyY2UvZHJpdmVycy9tdGQvcGFyc2Vycy90cGxpbmtfc2FmZWxvYWRlci5j
I0w5Mwo+IFsyXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNy43L3NvdXJj
ZS9kcml2ZXJzL210ZC9wYXJzZXJzL3NjcGFydC5jI0wxNzAKPiBbM10gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuMTcuNy9zb3VyY2UvZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBh
cnRfYmNtNDkwOC5jI0w0NwoKVGhhbmtzIGZvciB0aGUgZGlnZ2luZy4gSSB3aWxsIGFwcGx5IHRo
aXMgdG8gLW5leHQgYW5kIG5vdCAtZml4ZXMuIEl0CndpbGwgYmUgc2xpZ2h0bHkgbG9uZ2VyIHRv
IGdldCBpdCBiYWNrcG9ydGVkLCBidXQgdGhpcyBnaXZlcyBhIGJpdCBtb3JlCnRpbWUgZm9yIHRo
aXMgcGF0Y2ggdG8gYmUgdGhvdWdodCBhYm91dCBhcyBJIHBsYW4gb24gc2VuZGluZyBteSBmaXhl
cyBQUgppbiB0aGUgbmV4dCBkYXlzLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
