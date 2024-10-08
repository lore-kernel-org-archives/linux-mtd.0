Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC587CED27F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKfC2W5gmImwDJ5E53rO3av0a8mvB1806EzW3nzNEfs=; b=JhII5AyJnoL93K
	p0rBobiOAU8g03iYG1r0ofXZFqE7onIG0qwieXvaprB9JKR78tzmYVasybMyNz+1c5jMgNTABJYr7
	l1WzA/IrrbG445da91Yw5uUK/bmbfkYX9DgWawbz2V4tKtGyrrsz/XA/xyGC1oNQ62sT+ulzBTIky
	cuiplYwNPw7k8OTskAr2AWS9AkecPXQYGUR6dw1ZvxPWEePJfwEoJILBV0nPDT1NYmXX9D/y1RUq0
	p4ex9jltOJPwvd19h/BifMfNesjndOCIXuLWTdvRIDohZbNcLyW1AQddrGgjy28NOUSkc5fiu2kKf
	14Rb7EWwx+jHBI4coVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy64M-00000005BcV-06Z3;
	Tue, 08 Oct 2024 08:59:50 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy609-00000005AFv-0YBu
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:55:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56AF2FF80A;
	Tue,  8 Oct 2024 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728377725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2J2kZz9XVQBtjS6G6EvCariDJ3hTXnxYgwv1j+Fa0w=;
	b=JtcB8O/llg/5QP86K1t+19Ewr2z92DZa5seey/ztVjdg2NouCwZwjHasybz7L6F5piBgTe
	16Gjp173ZX06TfRVBifaOQ8I10L+pUjs4bO3r4DMuZ+o9ICSQkI+dsYCHV8+EWj0gItxBp
	MbXwj2DUdQn3FXTMulXteL6lGcNpeblGkKTD8u8yR4Jz1LMst/1SPYq+aePDnLBfQu/O3l
	oKre/abPfEt87jQkj9KP3iV1N5otY9242mOHoPyzqxOrgPe8w9UqM5suhgnZc5hxae+zPs
	HU0Q0t22JXXA6xfPhK2SX6zL8RnitH1mA6eoybSGGa8vU8bXaj52JuDjbzpeHw==
Date: Tue, 8 Oct 2024 10:55:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add fixups for read retry
Message-ID: <20241008105523.1647f2ca@xps-13>
In-Reply-To: <CAAyq3SaZKMqJrv7caVwO0+u+nk8JWZ8qTRHdUqQOfQhx9gBF7Q@mail.gmail.com>
References: <20240905055333.2363358-1-linchengming884@gmail.com>
	<20240905055333.2363358-2-linchengming884@gmail.com>
	<20241001114039.67bab21e@xps-13>
	<CAAyq3SbP4kSW47ZaT7V9ZzeHauj_EwfU5GPipZjNK6j69qm7Vw@mail.gmail.com>
	<20241007103331.55f37dcb@xps-13>
	<CAAyq3SaZKMqJrv7caVwO0+u+nk8JWZ8qTRHdUqQOfQhx9gBF7Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_015529_338838_57E462A4 
X-CRM114-Status: GOOD (  19.63  )
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

SGksCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgOCBPY3QgMjAyNCAx
NDoyNToyNSArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IOaWvCAyMDI05bm0MTDmnIg35pelIOmAseS4gCDkuIvljYg0OjMz
5a+r6YGT77yaCj4gPgo+ID4gSGkgQ2hlbmcgTWluZywKPiA+ICAKPiA+ID4gPiA+IEBAIC0zMjUs
NyArMzczLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWFjcm9uaXhfc3Bp
bmFuZF90YWJsZVtdID0gewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBteDM1bGYxZ2U0YWJfZWNjX2dldF9zdGF0
dXMpKSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXgzNWxm
MWdlNGFiX2VjY19nZXRfc3RhdHVzKSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICBTUElO
QU5EX0ZJWFVQUygmcmVhZF9yZXRyeV9maXh1cHMpKSwKPiA+ID4gPiA+ICAgICAgIFNQSU5BTkRf
SU5GTygiTVgzNVVGMUdFNEFDIiwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5E
X0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4OTIsIDB4MDEpLAo+ID4g
PiA+ID4gICAgICAgICAgICAgICAgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAy
NCwgMjAsIDEsIDEsIDEpLCAgCj4gPiA+ID4KPiA+ID4gPiBJIGV4cGVjdCBhIHBhdGNoIHRhcmdl
dGluZyB0aGUgY29yZSBmaXJzdCwgYW5kIHRoZW4gdGhlIGNoYW5nZXMgaW4gdGhlCj4gPiA+ID4g
TWFjcm9uaXggZHJpdmVyLiAgCj4gPiA+Cj4gPiA+IEdvdCBpdCwgc28gZG8geW91IHByZWZlciB0
aGF0IHdlIHN3aXRjaCB0byB1c2luZyBmbGFncyBpbnN0ZWFkPyAgCj4gPgo+ID4gTm90IG5lY2Vz
c2FyaWx5LCBkaWQgST8KPiA+Cj4gPiAuLi4KPiA+ICAKPiAKPiBVc2luZyBhIGZsYWcgaW5zdGVh
ZCBvZiBmaXh1cHMgYWxsb3dzIHRoaXMgcGF0Y2ggdG8gdGFyZ2V0IHRoZSBjb3JlIGZpcnN0LAo+
IGFuZCByZWR1Y2VzIGNoYW5nZXMgaW4gdGhlIE1hY3Jvbml4IGRyaXZlci4KClByb3Bvc2Ugd2hh
dCBldmVyIHlvdSB0aGluayBpcyBiZXN0LiBZb3UgY2FuIGFsc28gbG9vayBhdCBob3cgaXQgaXMK
ZG9uZSBpbiByYXcgTkFORC4gQnV0IGFsd2F5cyBpbmNsdWRlIHRoZSBjb3JlIGNoYW5nZXMgZmly
c3QsIHBsZWFzZS4KSXQgaXMgbm90IHJlbGF0ZWQgdG8gaG93IHlvdSBpbXBsZW1lbnQgaXQuCgo+
IAo+ID4gPiA+ID4gICAgICAgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyICptYW51
ZmFjdHVyZXI7Cj4gPiA+ID4gPiAgICAgICB2b2lkICpwcml2Owo+ID4gPiA+ID4gKyAgICAgaW50
IHJlYWRfcmV0cmllczsgIAo+ID4gPiA+Cj4gPiA+ID4gQW55IHJlYXNvbiB0byBrZWVwIHRoaXMg
dmFyaWFibGUgc2lnbmVkPyAgCj4gPiA+Cj4gPiA+IE5vLCB3ZSBjYW4gc2ltcGx5IGNoYW5nZSBm
cm9tIGludCB0byB1OC4gIAo+ID4KPiA+IEp1c3QgdW5zaWduZWQgaW50IGlzIGZpbmUuCj4gPiAg
Cj4gCj4gU3VyZSwgdGhhbmtzIQo+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gVGhh
bmtzLAo+IENoZW5nIE1pbmcgTGluCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
