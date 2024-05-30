Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF11C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2024 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV3bSjVEHIhrOxpkkhNUiC5pT1Ca3s2q7/PuoVIGKhQ=; b=t+jw1Uz0eMs9Sn
	jJTlNNdsZmqryn9HoxXUsdJBo4L0bc+itd+OC9AkhHC5FUl6gyMcdhngnnTpIfacSJ0uvLEt02c2V
	sbBjZznYvWUUSFwxAtUyo3V/i8dG6UgZGRH9gBNWJERxhKIJnPvdP58QluCHTLQajtlwBezV2X15v
	NjUtxGEaC4k7SOiKayRUpUViigQ5UlzlTMorUeEcCmCQlRGNz7CM4j5oBUDdV07Ybi81gHMM50coz
	rBjk+QXlXcGFcgCYQYGSLP6oNwnz2MBJqtIQqZOIEr2fipaPSuMXI6Qck1H1Y5ns2aFg8L6q9eN03
	08cMrCq+bnBAk3uV2WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg6E-00000007PYX-0tI6;
	Thu, 30 May 2024 13:45:46 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg68-00000007PXK-3TQb
	for linux-mtd@lists.infradead.org;
	Thu, 30 May 2024 13:45:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 334651C0009;
	Thu, 30 May 2024 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717076735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iyf593fiF264KxDvYfa2uUVWLRbVv1B2mOqmFHbtPJw=;
	b=SgfxEis1K/Yhj7kE3wKEjYarAcY1Pp9MxlNawPpgWayYNmrriLNzSGhXQTKFukmiR30zPs
	P4Ehg+NAbQMYLTk6TyYDjca/17pD3ZpAGxi77lXshHAVwL9zq5GaC9FRnWPQeWA4aCp9BJ
	uC5lyChhYNTTEzehRRr3LKDbCEDnJ1LnoOwwBD1bZTHmJHop3PgT6RgEJtb4G69OUYhTd2
	ZPws4tMkdwAlPFacMYykdBit3AuO0yJ3flg3fPsWcy5OJzPo3GSRRifJSUSkTXian1Z8Mi
	xyhsgDVFi/hMY40xVlnX8ClbuLeM60pP5tcKqNilI+TTNFvIVHLdzFgDNM+58w==
Date: Thu, 30 May 2024 15:45:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Akinobu Mita"
 <akinobu.mita@gmail.com>, "Artem Bityutskiy"
 <artem.bityutskiy@linux.intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: make mtd_test.c a separate module
Message-ID: <20240530154526.25c3ae17@xps-13>
In-Reply-To: <48738af1-545e-4261-a8b7-fe224071910f@app.fastmail.com>
References: <20240529095049.1915393-1-arnd@kernel.org>
	<20240529141323.7015f3d9@xps-13>
	<48738af1-545e-4261-a8b7-fe224071910f@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_064541_322162_29140B2E 
X-CRM114-Status: GOOD (  28.20  )
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

SGkgQXJuZCwKCmFybmRAYXJuZGIuZGUgd3JvdGUgb24gV2VkLCAyOSBNYXkgMjAyNCAxNDozNjo0
NiArMDIwMDoKCj4gT24gV2VkLCBNYXkgMjksIDIwMjQsIGF0IDE0OjEzLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+ID4gSGkgQXJuZCwKPiA+Cj4gPiBhcm5kQGtlcm5lbC5vcmcgd3JvdGUgb24gV2Vk
LCAyOSBNYXkgMjAyNCAxMTo1MDozOSArMDIwMDoKPiA+ICAKPiA+PiBGcm9tOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+ID4+IAo+ID4+IFRoaXMgZmlsZSBnZXRzIGxpbmtlZCBpbnRv
IG5pbmUgZGlmZmVyZW50IG1vZHVsZXMsIHdoaWNoIGNhdXNlcyBhIHdhcm5pbmc6Cj4gPj4gCj4g
Pj4gc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyMzY6IGRyaXZlcnMvbXRkL3Rlc3RzL01ha2VmaWxl
OiBtdGRfdGVzdC5vIGlzIGFkZGVkIHRvIG11bHRpcGxlIG1vZHVsZXM6IG10ZF9uYW5kYml0ZXJy
cyBtdGRfb29idGVzdCBtdGRfcGFnZXRlc3QgbXRkX3JlYWR0ZXN0IG10ZF9zcGVlZHRlc3QgbXRk
X3N0cmVzc3Rlc3QgbXRkX3N1YnBhZ2V0ZXN0IG10ZF90b3J0dXJldGVzdCAgCj4gPgo+ID4gSSd2
ZSBuZXZlciBleHBlcmllbmNlZCB0aGlzIHdhcm5pbmcgbXlzZWxmLCBob3cgZGlkIHlvdSBwcm9k
dWNlIGl0PyAgCj4gCj4gVGhpcyB3YXJuaW5nIGlzIGN1cnJlbnRseSBlbmFibGVkIHdoZW4gYnVp
bGRpbmcgd2l0aCAnbWFrZSBXPTEnLAoKT2suIEkgZGlkbid0IHBheSBhdHRlbnRpb24uCgo+IGJ1
dCB0aGVyZSBhcmUgb25seSBhIGhhbmRmdWwgb2YgZHJpdmVycyB0aGF0IHJ1biBpbnRvIGl0LCBz
bwo+IEkgaGF2ZSBzZW50IHBhdGNoZXMgZm9yIGVhY2ggb25lLCB3aXRoIHRoZSBwbGFuIHRvIGVu
YWJsZSBpdAo+IGJ5IGRlZmF1bHQgaW4gdGhlIGZ1dHVyZS4KPiAKPiA+PiBNYWtlIGl0IGEgc2Vw
YXJhdGUgbW9kdWxlIGluc3RlYWQuICAKPiA+Cj4gPiBJJ20gbm90IGEgdG90YWwgZmFuIG9mIHRo
aXMganVzdCBiZWNhdXNlIGl0IG5vdyByZXF1aXJlcyBhbiBhZGRpdGlvbmFsCj4gPiBzdGVwIHRv
IGluc2VydCB0aGVzZSB0ZXN0IG1vZHVsZXMgKHRoZXkgYXJlIGxpa2VseSB1c2VkIGZvcgo+ID4g
ZGVidWdnaW5nL2RldmVsb3BtZW50IHB1cnBvc2VzLCBzbyBub3QgcHJvcGVybHkgaW5zdGFsbGVk
IGluIHRoZQo+ID4gcm9vdGZzKS4gSXMgdGhlcmUgYW55IGNoYW5jZSB3ZSBjYW4gZmluZCBhbm90
aGVyIHdheT8gIAo+IAo+IFRoaXMgc2hvdWxkIG9ubHkgYmUgYSBwcm9ibGVtIHdoZW4gdXNpbmcg
cGxhaW4gJ2luc21vZCcgaW5zdGVhZAo+IG9mICdtb2Rwcm9iZScgZm9yIGxvYWRpbmcgdGhlIG1v
ZHVsZXMuIERvIHlvdSB0aGluayB0aGlzIGlzCj4gY29tbW9ubHkgdXNlZCBoZXJlPwoKVGhlc2Ug
dGVzdCBtb2R1bGVzIGhhdmUgYmVlbiBzbG93bHkgZGVwcmVjYXRlZCBpbiBmYXZvciBvZiB0aGUg
dXNlcgpzcGFjZSB0b29scyBidXQgd2hlbiBJIGhhZCB0byB1c2UgdGhlbSwgSSB3YXMgb2Z0ZW4g
dXNpbmcgYW4gaW5pdHJhbWZzCndpdGggdGhlIG1vZHVsZXMganVzdCBjb3B5L3Bhc3RlZCBhbmQg
aW5zZXJ0ZWQgd2l0aCBpbnNtb2QuIFRoZXJlIGlzIG5vCnJlYWwgcG9pbnQgSSBndWVzcyBpbiBl
bWJlZGRpbmcgdGhlc2UgbW9kdWxlcyBpbiBhIGZpbmFsIHJvb3Rmcy4KCj4gQW5vdGhlciBvcHRp
b24gd291bGQgYmUgdG8gdHVybiBhbGwgdGhlIGhlbHBlciBmdW5jdGlvbnMgaW50bwo+IHN0YXRp
YyBpbmxpbmUgdmVyc2lvbnMgYW5kIGp1c3QgaW5jbHVkZSB0aGUgaGVhZGVyLCBidXQKPiB0aGF0
IGRvZXMgbm90IGF2b2lkIHRoZSBkdXBsaWNhdGlvbiB0aGVuLgoKSW5kZWVkLiAKCklzIHRoZXJl
IGFueSBjaGFuY2UgdG8ganVzdCBzaWxlbmNlIHRoZSB3YXJuaW5nIGJ5IGZsYWdnaW5nIHRoZXNl
Cm1vZHVsZXMgYXMgInRlc3QiIG9yICJkZXZlbG9wbWVudCIgbW9kdWxlcz8gQmVjYXVzZSBUQkgg
aXQgZmVlbHMgbGlrZQp0aGUgd2FybmluZyBpcyBqdXN0IHVzZWxlc3MgaW4gdGhpcyBjYXNlLiBU
aGVzZSBtb2R1bGVzIHNob3VsZCBub3QgYmUKZW5hYmxlZCBpbiBhIHByb2R1Y3Rpb24gZW52aXJv
bm1lbnQgYW55d2F5LgoKSWYgbm90LCB0aGVuIGxldCdzIGp1c3Qga2VlcCB5b3VyIGN1cnJlbnQg
cGF0Y2guIEFzIEkgc2FpZCwgdGhlc2UKbW9kdWxlcyBhcmUga2luZCBvZiBkZXByZWNhdGVkIGFu
eXdheS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
