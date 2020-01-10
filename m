Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EBDC33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:29:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054EF2072E
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUF3Pp8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054EF2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2pVrmxQC/z8Nn4Ox3K+94QbA7Zyj0F2hiIm9PhNsaY=; b=QUF3Pp8PSUvXRu
	uwot1F6K1/oaOFLkQdL/StAN1aiFl/z3CwRAx0dHyOskmI69uTbqogo31ZUwOzkibkXqF0Or0NTY+
	ZEfUucPpTp4vwdJSeifaYlaf1xlaYuAk3MPwLb8ih1FDa6hJiy0xoU2x9fTpEIxCqguyDLaWpVn7G
	lzO3hW5/l5DlODHQftxzbXvwX/FaFZ2imQNKvBYzsAKT7ct2zPWKxZT5Zb7wa5RxosK58hTDByO4I
	ZX9bh0ncQCaVnQN6bApMYPA0Wyo+uBiATi+vK/0uU+pE+p3/vITOhepENEB25mI760iCozYEDK3Zf
	V2rPl3axD+C3aiOs+b1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ippfN-0005EC-BR; Fri, 10 Jan 2020 08:29:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ippfJ-0005Dg-If
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 08:29:11 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DDCCAC000E;
 Fri, 10 Jan 2020 08:28:56 +0000 (UTC)
Date: Fri, 10 Jan 2020 09:28:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
Message-ID: <20200110092855.79f18339@xps13>
In-Reply-To: <20200109203722.4423ed09@collabora.com>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
 <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
 <20200109194556.34cf67dc@xps13>
 <20200109201355.707c5b0d@collabora.com>
 <20200109202358.2a428a8d@xps13>
 <20200109203722.4423ed09@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_002909_891728_D11E8FEF 
X-CRM114-Status: GOOD (  24.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBUaHUsIDkgSmFuCjIwMjAgMjA6Mzc6MjIgKzAxMDA6Cgo+IE9uIFRodSwgOSBK
YW4gMjAyMCAyMDoyMzo1OCArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gSGkgQm9yaXMsCj4gPiAKPiA+IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9uIFRodSwgOSBKYW4KPiA+
IDIwMjAgMjA6MTM6NTUgKzAxMDA6Cj4gPiAgIAo+ID4gPiBPbiBUaHUsIDkgSmFuIDIwMjAgMTk6
NDU6NTYgKzAxMDAKPiA+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4gd3JvdGU6Cj4gPiA+ICAgICAKPiA+ID4gPiBIaSBSaWNoYXJkLAo+ID4gPiA+IAo+ID4gPiA+
IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9uIFRodSwgOSBKYW4g
MjAyMCAxOTo0MzowNAo+ID4gPiA+ICswMTAwIChDRVQpOgo+ID4gPiA+ICAgICAgIAo+ID4gPiA+
ID4gTWlxdWVsLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tICAgICAgICAKPiA+ID4gPiA+ID4+IFdoYXQgcHJvYmxlbSBkb2VzIHRoaXMgc29sdmU/
Cj4gPiA+ID4gPiA+PiAuLi5iZXNpZGUgb2YgYSBuaWNlIGRpZmZzdGF0IHdoaWNoIHJlbW92ZXMg
bW9yZSB0aGFuIGl0IGFkZHMuIDotKSAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IEl0IGlzIG11Y2ggZWFzaWVyIHRvIGVzY2FsYWRlIHRvIHRoZSB0b3AgbW9zdCAibWFzdGVyIiBk
ZXZpY2Ugd2hlbgo+ID4gPiA+ID4gPiB0aGVyZSBhcmUgbXVsdGlwbGUgbGV2ZWxzIG9mIHBhcnRp
dGlvbmluZywgd2hpY2ggd2FzIG5vdCBjbGVhbmx5Cj4gPiA+ID4gPiA+IGRlc2NyaWJlZCBJTUhP
LiBBbHNvIGl0IGlzIGFscmVhZHkgdXNlZCBpbiB0aGUgTUxDLWluLXBzZXVkby1TTEMtbW9kZQo+
ID4gPiA+ID4gPiBzZXJpZXMgOikgICAgICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9rLiBJ
biBmYWN0IEkgImZvdW5kIiB0aGlzIHBhdGNoIG15IGxvb2tpbmcgYXQgdGhlIFNMQyBlbXVsYXRp
b24gcGF0Y2hlcy4KPiA+ID4gPiA+ICAgICAgICAgCj4gPiA+ID4gPiA+PiA+ICtzdGF0aWMgaW5s
aW5lIHN0cnVjdCBtdGRfaW5mbyAqbXRkX2dldF9tYXN0ZXIoc3RydWN0IG10ZF9pbmZvICptdGQp
Cj4gPiA+ID4gPiA+PiA+ICt7Cj4gPiA+ID4gPiA+PiA+ICsJd2hpbGUgKG10ZC0+cGFyZW50KQo+
ID4gPiA+ID4gPj4gPiArCQltdGQgPSBtdGQtPnBhcmVudDsKPiA+ID4gPiA+ID4+ID4gKwo+ID4g
PiA+ID4gPj4gPiArCXJldHVybiBtdGQ7Cj4gPiA+ID4gPiA+PiA+ICt9ICAgICAgICAgIAo+ID4g
PiA+ID4gPj4gCj4gPiA+ID4gPiA+PiBTbywgcGFyZW50ID09IG1hc3Rlcj8gICAgICAgICAgCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiB0b3AgbW9zdCBwYXJlbnQgKHRoZSBvbmUgd2l0aG91dCBw
YXJlbnQpID09IG1hc3RlciAhCj4gPiA+ID4gPiA+ICAgICAgICAgICAKPiA+ID4gPiA+ID4+IAo+
ID4gPiA+ID4gPj4gV2hlbiBJIGNyZWF0ZSBhIE1URCBvbnRvcCBvZiBVQkkgdXNpbmcgZ2x1ZWJp
LCB3aG8gd2lsbCBiZSBwYXJlbnQvbWFzdGVyPyAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGlzc3VlIGhlcmU/ICAgICAgICAg
IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBMZXQncyBzYXkgSSBoYXZlIG10ZDAgd2l0aCBhbiB1Ymkg
YW5kIGEgdm9sdW1lICJ4eHgiLiBBZnRlciBlbmFibGluZwo+ID4gPiA+ID4gZ2x1ZWJpIGEgbmV3
IG10ZDEgd2lsbCBhcnJpdmUgb24gdGhlIHN5c3RlbS4KPiA+ID4gPiA+IFRoZSBzdGFja2luZyBp
cyBtdGQwIC0+IHViaSAodm9sdW1lIHh4eCkgLT4gbXRkMS4gICAgICAgIAo+ID4gPiA+IAo+ID4g
PiA+IFRoaXMgaXMgbXVjaCBjbGVhcmVyLCB0aGFua3MhCj4gPiA+ID4gICAgICAgCj4gPiA+ID4g
PiBJcyBub3cgYSByZWxhdGlvbnNoaXAgYmV0d2VlbiBtdGQxIGFuZCBtdGQwPyAgICAgICAgCj4g
PiA+ID4gCj4gPiA+ID4gTm8gdGhlcmUgaXMgbm9uZS4gCj4gPiA+ID4gICAgICAgCj4gPiA+ID4g
PiBJJ2QgZXhwZWN0IG10ZDEncyBwYXJlbnQgYmVpbmcgbXRkMC4gICAgICAgIAo+ID4gPiA+IAo+
ID4gPiA+IFRoaXMgd291bGQgYmUgYSBuZXcgZmVhdHVyZSwgcmlnaHQ/IEkgZG9uJ3QgdGhpbmsg
aXQgaXMgdGhlIGNhc2UgdG9kYXkuICAgICAgCj4gPiA+IAo+ID4gPiBXZSBkZWZpbml0ZWx5IGRv
bid0IHdhbnQgbXRkMSB0byBhcHBlYXIgYXMgYSBwYXJ0aXRpb24gb2YgbXRkMCBpbiB0aGF0Cj4g
PiA+IGNhc2UgKGJsb2NrcyBpbiBtdGQxIGNhbid0IGJlIG1hcHBlZCB0byBibG9ja3MgaW4gbXRk
MCB3aXRob3V0IHRoZSBVQkkKPiA+ID4gbGF5ZXIgYmVpbmcgaW52b2x2ZWQpLiBNYXliZSBpdCdk
IGJlIGNsZWFyZXIgaWYgd2UgbW92ZSB0aGUgcGFyZW50Cj4gPiA+IGZpZWxkIHRvIG10ZF9wYXJ0
IGFuZCBhZGQgYW4gTVREX0lTX1BBUlRJVElPTiBmbGFnLiBPciBtYXliZSB3ZSBjYW4KPiA+ID4g
anVzdCBjaG9vc2UgYSBiZXR0ZXIgbmFtZS4gICAgCj4gPiAKPiA+IEkgcHJlZmVyIHRoZSBuYW1l
IGNoYW5nZS4gSSB0aGluayB0aGUgY3VycmVudCBzdHJ1Y3Qgb3JnYW5pemF0aW9uCj4gPiBpcyBy
aWdodC4gV2hhdCBkbyB5b3Ugc3VnZ2VzdD8gIAo+IAo+IEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBu
YW1lLCBzb3JyeS4KCkFjdHVhbGx5IEkgZmluZCAtPnBhcmVudCB0b3RhbGx5IGRlc2NyaXB0aXZl
LCBhbmQgaW4gUmljaGFyZCdzIGV4YW1wbGUsCkkgd291bGQgbm90IGNhbGwgbXRkMSBhcyBtdGQw
J3MgcGFyZW50LCBpdCdzIG1vcmUgbGlrZSBhICJ0b3AgdmlydHVhbApkZXZpY2UiIGJ1dCBjZXJ0
YWlubHkgbm90IGEgImRpcmVjdCIgcGFyZW50LgoKbXRkLT5kaXJlY3RfcGFyZW50IHdvdWxkIHdv
cmsgYnV0IEkgdGhpbmsgaXQgaXMgYSBiaXQgdG9vIGxvbmcgYW5kIG1vc3QKb2YgdGhlIHBlb3Bs
ZSB3b3VsZCBub3QgdW5kZXJzdGFuZCB3aHkgd2UgY2FsbCBpdCB0aGlzIHdheSwgaW5zdGVhZCBv
ZgpqdXN0ICJwYXJlbnQiLgoKSSB3b3VsZCBsaWtlIHRvIHRha2UgdGhpcyBwYXRjaCBpbnRvIDUu
Niwgc28gcGxlYXNlIHRlbGwgbWUgd2hhdCB5b3UKcHJlZmVyICgicGFyZW50IiBiZWluZyB0aGUg
bW9zdCBzdHJhaWdodGZvcndhcmQgYW5kIHNpbXBsZSBzb2x1dGlvbiB0bwptZSA6KSApCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
