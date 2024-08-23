Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83CFC52D7C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 15:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP5JhvBGS93P6/vvMenQe7wdmqfZeT9RQ1RDrWpdfyw=; b=t2VwoJdorLVbne
	yFEB50hZHxV/Is561UVThvE7/EfOK39P3qOLeG+CIfoZisn8scGVmnBCp89b4U/youE3qdSTKzJHh
	O8+brte6lusaMZijL3m0/0/dz2n0msSy20nAIne2I0uusdy7EUhv0S/bNtsLcf/DMrk7CtKVvyFAA
	92R1Flrxdz9ssq5TZVa13mylaP4D12w9tglPzI+gSFnGXPOV3JqO37Nur+AtzcFJCg4K2VFeXWc04
	fwodengvVW4aJBPL9N8WHvDcm7wjCuJo1S1eFjp2BlKm2t5klPgXp6GO5ZDRnZrCQ4yIA+5ld8oE7
	NDWdGz7WtUog3XINGItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWXQ-0000000HORj-0ODM;
	Fri, 23 Aug 2024 15:49:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWWu-0000000HOJK-3Z5y
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 15:48:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CEDC240003;
	Fri, 23 Aug 2024 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724428126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgE3IvoWI1/Cp/dVJfgn+uI1PxAkHEore+ttPBMGxFA=;
	b=m0QyDvc+RQ5GMNzZExzQSKZ4FVpEep3AA5NJSkPLn+jl/hXzHQD49NngSMrdTrBe3g3Oea
	3sC0cT6u+Z4ibMaTsjU1yDdPaGCP+eOMv/YZWXuwFYmqPC5c39ZrGWAy+mhxK5v131iK8K
	M0UqU2+C7QoBxx2cVBnGaWGitZT5ugfhmX7Sk48MsQ3+VDsTsuN+7+6+ntiw9+jzWRVcI4
	ReW1qEMteOC0nbpob+K65Ax7dYubexYihPnWA7dFb1Rp0+V4RL4aD2uc6XCLRpZkeLBCJg
	QrFfDv2iFpsqnifeajXdnjKsyAWdj9wcrJ3JxwBiA76c7NQATLlosJ0q/b6++w==
Date: Fri, 23 Aug 2024 17:48:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 0/2] Add fixups for two-plane serial NAND flash
Message-ID: <20240823174843.6eec8053@xps-13>
In-Reply-To: <CAAyq3SazQFSU9C5Z5YURP9cFdc6gLNJfF2ReQ9Z_-GpzVWhoeQ@mail.gmail.com>
References: <20240718075356.488253-1-linchengming884@gmail.com>
	<20240812105630.2b71ed19@xps-13>
	<CAAyq3SazQFSU9C5Z5YURP9cFdc6gLNJfF2ReQ9Z_-GpzVWhoeQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_084849_172410_A9314286 
X-CRM114-Status: GOOD (  28.56  )
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

SGkgQ2hlbmcsCgpsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMTMgQXVn
IDIwMjQgMTQ6MDI6NDQgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAyNOW5tDjmnIgxMuaXpSDpgLHkuIAg5LiL
5Y2INDo1NuWvq+mBk++8mgo+ID4KPiA+IEhpIENoZW5nLAo+ID4KPiA+IGxpbmNoZW5nbWluZzg4
NEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxOCBKdWwgMjAyNCAxNTo1Mzo1NCArMDgwMDoKPiA+
ICAKPiA+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4K
PiA+ID4KPiA+ID4gTWFjcm9uaXggc2VyaWFsIE5BTkQgZmxhc2ggd2l0aCBhIHR3by1wbGFuZSBz
dHJ1Y3R1cmUKPiA+ID4gcmVxdWlyZXMgaW5zZXJ0aW9uIG9mIFBsYW5lIFNlbGVjdCBiaXQgaW50
byB0aGUgY29sdW1uCj4gPiA+IGFkZHJlc3MgZHVyaW5nIHRoZSB3cml0ZV90b19jYWNoZSBvcGVy
YXRpb24uCj4gPiA+Cj4gPiA+IEFkZGl0aW9uYWxseSwgZm9yIE1YMzV7VSxGfTJHMTRBQywgaW5z
ZXJ0aW9uIG9mIFBsYW5lCj4gPiA+IFNlbGVjdCBiaXQgaW50byB0aGUgY29sdW1uIGFkZHJlc3Mg
aXMgcmVxdWlyZWQgZHVyaW5nCj4gPiA+IHRoZSByZWFkX2Zyb21fY2FjaGUgb3BlcmF0aW9uLiAg
Cj4gPgo+ID4gSSBndWVzcyBpZiB0aGUgcGxhbmUgYml0IGlzIG5lZWRlZCBmb3IgeW91ciBjaGlw
cywgaXQgaXMgYWxzbyBuZWVkZWQKPiA+IGZvciBvdGhlciB3aGlwcyB3aXRoIHR3byBwbGFuZXM/
IENvdWxkIGl0IGJlIHBvc3NpYmxlIHRoYXQgd2UgbmV2ZXIgaGFkCj4gPiBzdXBwb3J0IGZvciBk
ZXZpY2VzIHdpdGggbW9yZSB0aGFuIG9uZSBwbGFuZSBhbmQgeW91IGp1c3QgZmFsbCBpbnRvIGEK
PiA+IGNvbW1vbiBpc3N1ZT8gTWF5YmUgd2Ugc2hvdWxkIGFsd2F5cyBhZGQgdGhlIHBsYW5lIGlu
Zm9ybWF0aW9uIHdoZW4KPiA+IHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgcGxhbmUgdG8gYWRkcmVz
cz8gQ2FuIHlvdSBjaGVjayB3aGV0aGVyIHRoaXMgaXMKPiA+IHNwZWNpZmljIHRvIE1hY3Jvbml4
IG9yIG5vdD8KPiA+ICAKPiAKPiBJIGhhdmUgcmV2aWV3ZWQgdGhlIGNoaXBzIGxpc3RlZCBieSBl
YWNoIHZlbmRvci4KPiAKPiBNaWNyb24gb2ZmZXJzIE1UMjlGMkcwMUFCe0EsQn1HRCwgTVQyOUYy
RzAxQUFBRUQgd2l0aCB0d28gcGxhbmVzOwo+IGhvd2V2ZXIsIG9ubHkgTVQyOUYyRzAxQUFBRUQg
cmVxdWlyZXMgdGhlIHBsYW5lIHNlbGVjdCBiaXQgd2hlbiBwZXJmb3JtaW5nCj4gcHJvZ3JhbSBs
b2FkIG9yIHJlYWQgZnJvbSBjYWNoZS4KPiAKPiBMaW5rOiBodHRwczovL3NlbWljb25kdWN0b3Jz
LmVzL3BkZi1kb3duL00vVC8yL01UMjlGMkcwMUFBQUVELU1pY3JvblRlY2hub2xvZ3kucGRmCj4g
Cj4gV2luYm9uZCBwcm92aWRlcyBXMjVOMDRLViB3aXRoIHR3byBwbGFuZXMsIGJ1dCBpdCBkb2Vz
IG5vdCByZXF1aXJlIHRoZSBwbGFuZQo+IHNlbGVjdCBiaXQgZm9yIHByb2dyYW0gbG9hZCBvciBj
YWNoZSByZWFkIG9wZXJhdGlvbnMuCj4gCj4gVGhlcmVmb3JlLCB3ZSBzaG91bGQgbm90IGFsd2F5
cyBpbmNsdWRlIHRoZSBwbGFuZSBzZWxlY3QgYml0IHdoZW4gZGVhbGluZyB3aXRoCj4gbXVsdGlw
bGUgcGxhbmVzLgo+IAo+ID4gSW4gdGhpcyBjYXNlIHdlIHdvdWxkbid0IG5lZWQgYSBzcGVjaWZp
YyBmaXh1cC4KPiA+ICAKPiAKPiBCYXNlZCBvbiB0aGUgYWJvdmUgcGVyc3BlY3RpdmUsIGRvIHdl
IHN0aWxsIG5lZWQgdG8gdXNlIGZpeHVwLCBvciBjYW4gd2UgdXNlCj4gZmxhZ3MgdG8gZGV0ZXJt
aW5lIHdoZXRoZXIgdGhlIHBsYW5lIHNlbGVjdCBiaXQgaXMgbmVjZXNzYXJ5PwoKSSBzdGlsbCBw
cmVmZXIgZmxhZ3MgcmF0aGVyIHRoYW4gaW52YXNpdmUgZml4dXAgaG9va3MuCgo+IAo+ID4gPgo+
ID4gPiBUaGVzZSBmbGFzaGVzIGhhdmUgYmVlbiB2YWxpZGF0ZWQgb24gWGlsaW54IHp5bnEtcGlj
b3plZAo+ID4gPiBib2FyZCB3aGljaCBpbmNsdWRlZCBNYWNyb25peCBTUEkgSG9zdC4KPiA+ID4K
PiA+ID4gQ2hlbmcgTWluZyBMaW4gKDIpOgo+ID4gPiAgIG10ZDogc3BpbmFuZDogQWRkIGZpeHVw
cyBmb3Igc3BpbmFuZAo+ID4gPiAgIG10ZDogc3BpbmFuZDogbWFjcm9uaXg6IEZpeHVwcyBmb3Ig
UGxhbmUgU2VsZWN0IGJpdAo+ID4gPgo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
ICAgICB8ICA3ICsrKysKPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgfCA2
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ID4gIGluY2x1ZGUvbGludXgv
bXRkL3NwaW5hbmQuaCAgICAgfCAxNyArKysrKysrKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
ODQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4gIAo+ID4KPiA+Cj4gPiBUaGFu
a3MsCj4gPiBNaXF1w6hsICAKPiAKPiBUaGFua3MsCj4gQ2hlbmdNaW5nIExpbgoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
