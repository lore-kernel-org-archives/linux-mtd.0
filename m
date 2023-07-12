Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62AEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 12:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdHBBXYysffhqlfAWuFjXs2i56DjCEBdAC9UpxcIPUA=; b=ZHENm4pSPNANQR
	l3jbjhBYnpO5rzmG+ePpa92js7IrhsfWicec2IspxKpnpl3bmu5jNfvU8+eXy8K1B6VnseR4Bqgke
	tS10Uwm6LAPmW1EhR0d7Dm56x8kHsyxPknpmqpM8VGte8Wy5jVtG6Jk9UJLwAqZxigM9x/sELv1TV
	tOcVmLINpiLA2pfetUySAZTO72AOTlIUBdzMryAEXEqB+mQrSPo/Rzq6f5cC5l50zYcFNGfhCmvAL
	RBfC5yxVN9BW5P6GXnTy8XxvaKn2gryyWSy1DIk9tEjEo6bGZOw8QTdVb4vXtTCm82GUjA0Xgen4c
	L3OwgzpIhcmEJ4iB6pxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYcf-00HUBU-1l;
	Wed, 12 Jul 2023 12:07:09 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYcc-00HUAP-1b;
	Wed, 12 Jul 2023 12:07:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BAFC40007;
	Wed, 12 Jul 2023 12:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689163620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7ByKZ6oXF6klWgs2IJLwIobDTVTZio3/GXOfUphAec=;
	b=o4PPeJa6zgRt3UiGPCief6r+PAxy2XWT8DlOmuoUwwpF8ch48sJUaMbjT/suvREM7Hcq37
	8z+/KLv7GUBt6TZtsK79jHsq826uZHC9U7z+/HbNlVpZ+PFFaENxM7b5luXr1XWo2PCgnx
	HsnUVGr7rk9iUmsK0aeibehjZXFeOw/yXIgEt5a9NVFNM+M23L0P3ZV3Ie3XsbsiyMxvpP
	siKtD56rxyksEnM7A8EQBLHK7TDOiyJkkfIbzWJ/vXVwKj7owExNXALh3xU25ZqiOfe7Tn
	mDGkOuKqGvp7Qw7ZGLgfxB+Z9RVBCkygIap408+nQNilsXfZbowSbThkpQ4jgQ==
Date: Wed, 12 Jul 2023 14:06:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712140655.72fc2a3d@xps-13>
In-Reply-To: <20230712135455.71fbeb5f@xps-13>
References: <20230707040622.78174-1-frank.li@vivo.com>
	<20230712135455.71fbeb5f@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_050706_667476_CD4294E6 
X-CRM114-Status: GOOD (  21.82  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gV2VkLCAxMiBKdWwgMjAyMyAxMzo1
NDo1NSArMDIwMDoKCj4gSGkgWWFuZ3RhbywKPiAKPiBmcmFuay5saUB2aXZvLmNvbSB3cm90ZSBv
biBGcmksICA3IEp1bCAyMDIzIDEyOjA2OjA1ICswODAwOgo+IAo+ID4gQ29udmVydCBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UoKSwgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gYSBzaW5nbGUKPiA+
IGNhbGwgdG8gZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UoKSwgYXMgdGhp
cyBpcyBleGFjdGx5Cj4gPiB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMgfCAzICstLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1
bnhpX25hbmQuYwo+ID4gaW5kZXggOTg4NDMwNDYzNGY2Li5kYjM2YmQ3NTViOGQgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPiA+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+ID4gQEAgLTIwODcsOCArMjA4Nyw3IEBAIHN0
YXRpYyBpbnQgc3VueGlfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
PiAgCW5hbmRfY29udHJvbGxlcl9pbml0KCZuZmMtPmNvbnRyb2xsZXIpOwo+ID4gIAlJTklUX0xJ
U1RfSEVBRCgmbmZjLT5jaGlwcyk7Cj4gPiAgCj4gPiAtCXIgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ID4gLQluZmMtPnJlZ3MgPSBkZXZtX2lvcmVt
YXBfcmVzb3VyY2UoZGV2LCByKTsKPiA+ICsJbmZjLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9nZXRf
YW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCwgJnIpOwo+IAo+IFdoeSBkbyB5b3Uga2VlcCBh
IHJlZmVyZW5jZSBvdmVyIHRoZSByZXNvdXJjZT8gV2h5IG5vdCBqdXN0Cj4gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApID8KPiAKPiBUaGlzIGNvbW1lbnQgaXMgdmFsaWQg
Zm9yIGFsbW9zdCBhbGwgdGhlIGNhc2VzIGluIHRoaXMgc2VyaWVzLgoKQWN0dWFsbHkgJ3InIGlz
IHVzZWQgYXQgdGhlIGJvdHRvbSwgc28gdGhlIHBhdGNoIGlzIGdvb2QuIEkgcmV2aWV3ZWQKYWxs
IHRoZSBwYXRjaGVzLCAxNyBsb29rIHJpZ2h0LCBJIGhhdmUgYSBtaW5vciBjb21tZW50IG9uIG9u
ZSBvZiB0aGVtLgpJbiBvcmRlciB0byBhdm9pZCByZXNlbmRpbmcgYWxsIHRoZSBwYXRjaGVzLCBJ
J2xsIGZpcnN0IGFwcGx5IHRoZSAxNwpnb29kIG9uZXMgYW5kIGFzayB5b3UgdG8gcmVzZW5kIGp1
c3QgdGhlIGxhc3Qgb25lLgoKPiBXaGVuIHRoZSByZXNvdXJjZSBpcyBvbmx5IG5lZWRlZCBpbiBh
biBlcnJvciBwcmludGssIEkgYW0gYWxzbyBpbiBmYXZvcgo+IG9mIG1vZGlmeWluZyB0aGUgZXJy
b3IgbWVzc2FnZSB0byBhdm9pZCBoYXZpbmcgdG8gZ3JhYiB0aGUgcmVzb3VyY2UuCj4gCj4gPiAg
CWlmIChJU19FUlIobmZjLT5yZWdzKSkKPiA+ICAJCXJldHVybiBQVFJfRVJSKG5mYy0+cmVncyk7
Cj4gPiAgCj4gCj4gVGhlc2UgY29tbWVudHMgYXBwbHkgdG8gdGhlIDE4IHBhdGNoZXMuCj4gCj4g
VGhhbmtzLAo+IE1pcXXDqGwKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
