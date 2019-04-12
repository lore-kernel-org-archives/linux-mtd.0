Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2CFC10F0E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5FE2171F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgwn5OBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5FE2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DaLQBqqntQVBgXFVS7N/zMs1WhIxit8LUsECGSsl+A=; b=qgwn5OBG5Z1qs9
	7ODPM8ew3r3aquJLGDWjpAhj9KseEX/Xbx4NyXooe9x1ccLI6peoLMMBoWbn4fCX6UcZPRZaZgENo
	bulghXcpblaTD13noR9QzxWzxZxUgR0n7mq/8Gzt/tcYtVdS+2BZfiBFvdr//id5srB+JxSjOXsIz
	aWdtVdKMvh6Q6/BLmMlIBtxytudc2jxg+da2zKhBonobAReLGxwC7jtWzIcHr0tHbliWTr5dvZrUW
	gfCi6+OiCJkM16kxSCDMhtQnsRcEMgwCvtJISaWig6wfx4dk0phz3reGyAFSdnPKSmqQAGBtSK442
	IUQ2vjAgXq39PPLHzFIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEqYG-0000at-Ak; Fri, 12 Apr 2019 07:24:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEqY8-0000Tl-5r; Fri, 12 Apr 2019 07:24:37 +0000
X-Originating-IP: 90.88.18.121
Received: from xps13 (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr
 [90.88.18.121]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4408BFF80F;
 Fri, 12 Apr 2019 07:24:19 +0000 (UTC)
Date: Fri, 12 Apr 2019 09:24:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2] mtd: rawnand: mark expected switch fall-throughs
Message-ID: <20190412092419.6f5a6432@xps13>
In-Reply-To: <017bdd52-8d1f-f746-6e1c-4d38491b2d6a@embeddedor.com>
References: <20190128181520.GA25887@embeddedor> <20190205135521.622f82c2@xps13>
 <ce33f949-48c8-b32a-028e-ee68afc08e8f@embeddedor.com>
 <20190412001009.2db358b7@xps13>
 <017bdd52-8d1f-f746-6e1c-4d38491b2d6a@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_002436_366613_21CBAC01 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gVGh1LCAxMSBBcHIKMjAxOSAxNzoyMDozMSAtMDUwMDoKCj4gT24gNC8xMS8x
OSA1OjEwIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgR3VzdGF2bywKPiA+IAo+ID4g
Ikd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZSBvbiBU
aHUsIDExIEFwcgo+ID4gMjAxOSAxMzozMDozMSAtMDUwMDoKPiA+ICAgCj4gPj4gSGkgTWlxdWVs
LAo+ID4+Cj4gPj4gT24gMi81LzE5IDY6NTUgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPj4g
Wy4uXSAgCj4gPj4+PiBAQCAtMzI4MCwxMiArMzI4MCwxNCBAQCBzdGF0aWMgdm9pZCBvbmVuYW5k
X2NoZWNrX2ZlYXR1cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4+Pj4gIAkJCWlmICgodGhp
cy0+dmVyc2lvbl9pZCAmIDB4ZikgPT0gMHhlKQo+ID4+Pj4gIAkJCQl0aGlzLT5vcHRpb25zIHw9
IE9ORU5BTkRfSEFTX05PUF8xOwo+ID4+Pj4gIAkJfQo+ID4+Pj4gKwkJLyogZmFsbCB0aHJvdWdo
ICovCj4gPj4+PiAgCj4gPj4+PiAgCWNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4g
Pj4+PiAgCQkvKiAyR2IgRERQIGRvZXMgbm90IGhhdmUgMiBwbGFuZSAqLwo+ID4+Pj4gIAkJaWYg
KCFPTkVOQU5EX0lTX0REUCh0aGlzKSkKPiA+Pj4+ICAJCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5B
TkRfSEFTXzJQTEFORTsKPiA+Pj4+ICAJCXRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfVU5M
T0NLX0FMTDsKPiA+Pj4+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLyAgICAKPiA+Pj4KPiA+Pj4gVGhp
cyBsb29rcyBzdHJhbmdlLgo+ID4+Pgo+ID4+PiBJbiBPTkVOQU5EX0RFVklDRV9ERU5TSVRZXzJH
YjoKPiA+Pj4gT05FTkFORF9IQVNfVU5MT0NLX0FMTCBpcyBzZXQgdW5jb25kaXRpb25hbGx5Lgo+
ID4+Pgo+ID4+PiBCdXQgdGhlbiwgdW5kZXIgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8xR2IsIHRo
ZSBzYW1lIG9wdGlvbiBpcyBzZXQgb25seQo+ID4+PiBpZiBwcm9jZXNzIGlzIGV2YWx1YXRlZCB0
byB0cnVlLgo+ID4+Pgo+ID4+PiBTYW1lIHByb2JsZW0gd2l0aCBPTkVOQU5EX0hBU18yUExBTkU6
Cj4gPj4+IC0gaXQgaXMgc2V0IGluIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfNEdiIG9ubHkgaWYg
T05FTkFORF9JU19ERFAoKQo+ID4+PiAtIGl0IGlzIHVuc2V0IGluIE9ORU5BTkRfREVWSUNFX0RF
TlNJVFlfMkdiIG9ubHkgaWYgIU9ORU5BTkRfSVNfRERQKCkKPiA+Pj4KPiA+Pj4gTWF5YmUgdGhp
cyBwb3J0aW9uIHNob3VsZCBiZSByZXdvcmtlZCBiZWNhdXNlIEkgYW0gdW5zdXJlIGlmIHRoaXMg
aXMgYQo+ID4+PiBtaXNzaW5nIGZhbGwgdGhyb3VnaCBvciBhIGJ1Zy4KPiA+Pj4gICAgIAo+ID4+
Cj4gPj4gSSB3b25kZXIgaWYgeW91IGhhZCB0aGUgY2hhbmNlIHRvIHRha2UgYSBsb29rIGludG8g
dGhpcyBwaWVjZSBvZiBjb2RlLgo+ID4+Cj4gPj4gVGhhbmtzCj4gPj4gLS0KPiA+PiBHdXN0YXZv
ICAKPiA+IAo+ID4gV2hhdCBkbyB5b3UgbWVhbj8KPiA+ICAgCj4gCj4gWW91IGNvbW1lbnRlZCB0
aGF0IHRoZSBwaWVjZSBvZiBjb2RlIGFib3ZlIHNob3VsZCBiZSByZXdvcmtlZC4gU28sIGl0IHdh
c24ndAo+IGNsZWFyIHRvIG1lIHdobyB3YXMgZ29pbmcgdG8gZG8gdGhhdDsgYW5kIHRoYXQncyB3
aHkgSSdtIGFza2luZyBpZiB5b3UgdG9vawo+IGEgbG9vayBpbnRvIGl0IGFuZCBmaW5hbGx5IGRl
dGVybWluZSB3aGV0aGVyIHdlIGFyZSBkZWFsaW5nIHdpdGggYW4gYWN0dWFsCj4gYnVnIG9yIGEg
ZmFsc2UgcG9zaXRpdmUuCgpZZXMgcGxlYXNlIGRvIGl0LCBJIGRvbid0IGhhdmUgdGhlIHRpbWUg
YW5kIEkgZG9uJ3QgcGxhbiB0byBkbyBpdApteXNlbGYuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
