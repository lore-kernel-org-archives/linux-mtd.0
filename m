Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265A3C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9m+m2/cWeyfZM/K2oE6qNvQKqQbVm/hqrYGi2LBZvs=; b=NMvey/XMkJIbm6
	Up1mzjPlsOnDa3IVqDsfICCWAFEO3NUI+XyVlJBGPQ6Jgm2wfSKlvV625v5/mrPvWrWIQU1NfiGud
	CEHT7cnOsoHi6Uwmwo/5WcptDPZXEWr/ftO8xlWV3S37uAv2Do8VrnGHv0MwuSWg7feBezeRdqtSf
	rtqYm29vkq2Dp+tOn1mv9pE8UcaWUrA7DWPFfK1GcuH6c0AABf+atrwOYaHlKMECLASALqVP43dsE
	fM0TRaZAy+DDdajkejZXBl0CZSPELcGf1XRcLtTkY570tfIkPbqIS1agorghvz5bbTzJHsAIf8cNX
	iXL4U0sldFZsTCXE+iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Ck4-00G3yW-G0; Fri, 16 Dec 2022 15:35:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Cjs-00G3un-Kc; Fri, 16 Dec 2022 15:35:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 85EA52000E;
	Fri, 16 Dec 2022 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671204904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CRNxLa3NwvaxA4E499bmTCzKgHqaavDobietvg9MgYY=;
	b=Q4c9niRO1LOcj7mMPp04sNlIfybgVDeXp6jqcaYz3yfg7H1z3mU4HMQLDEGJpwHU95lQ5C
	2fda/CNFNvfq0MwqGiHTBHXgGiNVr2Jl8Ze7X+ElZ73Hz15ONq4rrgx2r1l/zpLVjD5KAR
	g3qMo4Y02PIGJjhYZrzRQEq/fXd1NIjShAYCKBuGvSRGd+epcQ7tBxBDywgp2i/d2fgs6j
	XefI0PBloXW6k9iWOPoM3Ntowd6tFILovV8N28va1jjmu308UwCEGJgSV3l3VU2+A8K1cR
	/WzPg8izSs9F//BxKxQ5owY7Ovwz3SFhnu2Yeh4LOtWUr5+XIRmoC/XHJjhDdg==
Date: Fri, 16 Dec 2022 16:35:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221216163501.1c2ace21@xps-13>
In-Reply-To: <fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
	<6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
	<20221216120155.4b78e5cf@xps-13>
	<Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
	<20221216143720.3c8923d8@xps-13>
	<fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_073509_161686_6B983A74 
X-CRM114-Status: GOOD (  36.31  )
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

SGkgTWFyZWssCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIEZyaSwgMTYgRGVjIDIwMjIgMTU6MzI6
MjggKzAxMDA6Cgo+IE9uIDEyLzE2LzIyIDE0OjM3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+
IEhpLAo+IAo+IFsuLi5dCj4gCj4gPj4+IFdoYXQ/ICAKPiA+Pgo+ID4+IExldCBtZSByZXBocmFz
ZSwgSSB3YXMgbm90IGNsZWFyIGVub3VnaC4KPiA+PiAgCj4gPj4+IFNpbmNlIHdoZW4gbXkgcHJv
cG9zYWwgaXMgYnJlYWtpbmcgYm9hcmRzPyBNeSBwcm9wb3NhbCBsZWFkcyB0byBhCj4gPj4+IHNp
dHVhdGlvbiB3aGVyZToKPiA+Pj4gLSBJZiB5b3UgaGF2ZSBhIGJvYXJkIHRoYXQgaGFzIGFuIGlu
Y29uc2lzdGVudCBkZXNjcmlwdGlvbiBidXQgd29ya2VkLAo+ID4+PiAgICBpdCB3aWxsIHN0aWxs
IHdvcmsuCj4gPj4+IC0gSWYgeW91IGhhdmUgYSBib2FyZCB0aGF0IGhhcyBhIGNvbnNpc3RlbnQg
ZGVzY3JpcHRpb24gYW5kIHdvcmtlZCwgaXQKPiA+Pj4gICAgd2lsbCBzdGlsbCB3b3JrLgo+ID4+
PiAtIElmIHlvdXIgaGF2ZSBhIGJvYXJkIHRoYXQgaGFzIGFuIGluY29uc2lzdGVudCBkZXNjcmlw
dGlvbiBhbmQgZ290Cj4gPj4+ICAgIGJyb2tlbiAqcmVjZW50bHkqIGJ5IGFub3RoZXIgY2hhbmdl
ICh0eXBpY2FsbHkgeW91ICJmaXgiIHRoZSBEVCBpbgo+ID4+PiAgICBMaW51eCB0byBjb21wbHkg
d2l0aCB0aGUgYmluZGluZ3MpLCB0aGVuIHlvdSBnZXQgYSB3YXJuaW5nIHRoYXQgbGVhZHMKPiA+
Pj4gICAgeW91IG9uIHRoZSByaWdodCBwYXRoLCB5b3UgdGhlbiB1cGRhdGUgeW91ciBib290bG9h
ZGVyIGlmIHlvdSBjYW4sCj4gPj4+ICAgIGJ1dCBlaXRoZXIgd2F5IHlvdSBhZGQgeW91ciBtYWNo
aW5lIGNvbXBhdGlibGUgdG8gdGhlIGxpc3Qgb2YgZGV2aWNlcwo+ID4+PiAgICB3aGljaCBuZWVk
IHRoZSBlYXJseSBmaXggYW5kIHlvdXIgYm9vdCBpcyBmaXhlZC4gIAo+ID4+Cj4gPj4gVGhpcyBp
bXBsaWVzIHRoYXQgd2UgY2FuIHByb2FjdGl2ZWx5IGNhdGNoIGFsbCB0aGUgYWZmZWN0ZWQgYm9h
cmRzLiBJIGRvCj4gPj4gbm90IGJlbGlldmUgdGhpcyBpcyByZWFzb25hYmxlIGFuZCBiZWNhdXNl
IG9mIHRoYXQgbXkgY29tbWVudCBiZWZvcmUKPiA+PiBhYm91dCBjcmVhdGluZyByZWdyZXNzaW9u
IHRvIHRoZSB1c2Vycy4gIAo+ID4gCj4gPiBJIHJlYWxseSBkb24ndCB1bmRlcnN0YW5kIHRoZSBy
ZWFzb25pbmcgaGVyZS4KPiA+IAo+ID4gV2hhdCBJIHNheSBpczogbGV0J3MgZml4IHRoZSBib2Fy
ZHMga25vd24gdG8gYmUgaW5jb3JyZWN0bHkgZGVzY3JpYmVkCj4gPiB3aGVuIHdlIGJyZWFrIHRo
ZW0gc28gdGhleSBjb250aW51ZSB3b3JraW5nIHdpdGggYSBicm9rZW4gZmlybXdhcmUuICAKPiAK
PiBUaGUgc2Vjb25kIHBhcnQgb2YgdGhlIG1lc3NhZ2UsIGFzIGZhciBhcyBJIHVuZGVyc3RhbmQg
aXQsIGlzICJpZ25vcmUgcHJvYmxlbXMgdGhpcyB3aWxsIGNhdXNlIHRvIHVzZXJzIG9mIGJvYXJk
cyB3ZSBkbyBub3Qga25vdyBhYm91dCwgbGV0IHRoZW0gcnVuIGludG8gdW5ib290YWJsZSBzeXN0
ZW1zIGFmdGVyIHNvbWUgbGludXgga2VybmVsIHVwZGF0ZSwgCgpOb3cgeW91IGtub3cgd2hhdCBr
ZXJuZWwgdXBkYXRlIHdpbGwgYnJlYWsgdGhlbSwgc28geW91IGNhbiBwcmV2ZW50IGl0CmZyb20g
aGFwcGVuaW5nLiAKCkZvciBib2FyZHMgd2l0aG91dCBldmVuIGEgZHRzaSBpbiB0aGUga2VybmVs
LCBzaG91bGQgd2UgY2FyZT8KCj4gYW5kIG9uY2UgdGhleSBzdWZmZXIgdGhyb3VnaCBzeXN0ZW0g
cmVjb3ZlcnksIG1ha2UgdGhlbSBhZGQgY29tcGF0aWJsZQo+IHN0cmluZyB0byB0aGUgYXJjaC1z
aWRlIHdvcmthcm91bmQiLgo+IAo+ID4gV2hhdCByZWdyZXNzaW9uIGNvdWxkIHRoaXMgcG9zc2li
bHkgYnJpbmc/IEkgZG9uJ3QgY2FyZSBhYm91dCBjYXRjaGluZwo+ID4gdGhlIDJrIGJvYXJkcyBv
dXQgdGhlcmUgd2hpY2ggd29yayBidXQgd3JvbmdseSBkZXNjcmliZSB0aGVpcgo+ID4gcGFydGl0
aW9ucy4gSWYgdGhleSB3b3JrLCB0aGV5IHdpbGwgY29udGludWUgd29ya2luZy4gIAo+IAo+IFRo
b3NlIGJvYXJkcyB3b3VsZCBzdGFydCBmYWlsaW5nIG9uY2UgdGhlIExpbnV4LXNpZGUgRFQgc2l6
ZS1jZWxscyBpcyBjb3JyZWN0ZWQuCj4gCj4gQWxzbywgdGhpcyBnb3QgbWlzc2VkIGluIHRoZSBw
cmV2aW91cyBkaXNjdXNzaW9uLiBJZiB5b3UgdXNlIG9ubHkgYm9hcmQgY29tcGF0aWJsZSBzdHJp
bmcgaW4gYXJjaC1zaWRlIHdvcmthcm91bmQsIHRoZSB3b3JrYXJvdW5kIHdvdWxkIGJlIGFwcGxp
ZWQgZXZlbiBvbiBzeXN0ZW1zIHdpdGggdXBkYXRlZCBib290bG9hZGVycywgd2hpY2ggaXMgbGlr
ZWx5IG5vdCB3aGF0IHdlIHdhbnQuCgpJZiB0aGUgaGV1cmlzdGljcyBoZXJlIG5lZWRzIHRvIGJl
IGltcHJvdmVkIHNvbWVob3csIGxldCdzIGRpc2N1c3MgdGhhdCA7KQoKPiA+IFlvdSBhbmQgTWFy
ZWsgc2F5OiBsZXQncyBibGluZGx5IGFsd2F5cyBjaGFuZ2UgYSBwcm9wZXJ0eSBpbiB0aGUgRFQs
IG5vCj4gPiBtYXR0ZXIgaWYgdGhlIGJvYXJkIGlzIGJyb2tlbiwgZXZlbiBpZiB3ZSBkb24ndCBr
bm93IGlmIHRoaXMgaXMgdGhlCj4gPiByaWdodCB0aGluZyB0byBkbywgYW5kIGFwcGx5IHRoaXMg
dG8gdGhlIGVudGlyZSB3b3JsZC4gIAo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBpZiB3ZSBo
YXZlIHBhcnRpdGlvbnMgaW4gdGhlIE5BTkQgY29udHJvbGxlciBub2RlIGFuZCBzaXplLWNlbGxz
PTAsIHRoZW4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIHRvIG92ZXJyaWRlIHNpemUtY2VsbHMg
dG8gMSAsIGJlY2F1c2UgcGFydGl0aW9ucyB3aXRoIHNpemUtY2VsbHM9MCBtYWtlIG5vIHNlbnNl
LgoKSG93IGRvIHlvdSBrbm93IHRoZSBmaXJtd2FyZSBkaWQgbm90IHNldCAjc2l6ZS1jZWxsPTAg
b24gcHVycG9zZSB0bwphdm9pZCB1c2luZyB0aGUgcGFydGl0aW9ucz8gSG93IHdvdWxkIHRoaXMg
YmUgbW9yZSBzdHVwaWQgdGhhbgp1cGRhdGluZyBwYXJ0aXRpb25zIHdpdGhvdXQgc2V0dGluZyAj
c2l6ZS1jZWxsIHRvIHRoZSByaWdodCB2YWx1ZT8gQ2FuCnlvdSBiZSBzbyBzdXJlIGV2ZXJ5IGJv
YXJkIGluIHRoZSB3b3JsZCB3aWxsIG5ldmVyIGRvIHRoYXQ/IEFuZCBob3cgZG8KeW91IGhhbmRs
ZSB0aGUgNjQtYml0IGNhc2UgYXMgd2VsbD8gWW91IF9kb19ub19rbm93XyB3aGF0IGFwcGxpZXMg
aW4KYWxsIHRoZSBjYXNlcywgZ3Vlc3NpbmcgaXMgZGFuZ2Vyb3VzIGhlcmUsIHlvdSdsbCBqdXN0
IHN1cHBvcnQgbmV3CmJyb2tlbiBjYXNlcyBvciBldmVuIGJyZWFrIGV4aXN0aW5nIHNldHVwcyEg
V2hhdCB5b3UgZG8ga25vdyBob3dldmVyIGlzCndoYXQgYXBwbGllcyBmb3IgYSBudW1iZXIgb2Yg
Y2FzZXMgeW91ciBjbGVhcmx5IGlkZW50aWZpZWQuIEFwcGx5aW5nCnRoaXMgbG9naWMgdG8gKmFs
bCogY2FzZXMgaW4gc2ltcGx5IF9icm9rZW5fIGFuZCB1dHRlcmx5IHN0dXBpZCAodG0pLiBJCmRv
bid0IGtub3cgaG93IHRvIGV4cHJlc3MgdGhhdCBzbyB3ZSBzdG9wIGJpa2Utc2hlZGRpbmcuCgo+
IElmIHRoZSBoZXVyaXN0aWNzIGhlcmUgbmVlZHMgdG8gYmUgaW1wcm92ZWQgc29tZWhvdywgbGV0
J3MgZGlzY3VzcyB0aGF0Lgo+IAo+ID4gQnV0IHdpdGggdGhpcyBhcHByb2FjaCB5b3UncmUgbm90
IHdvcnJpZWQgYWJvdXQgcmVncmVzc2lvbnMuCj4gPiAKPiA+IEkgYW0gc29ycnkgaXQgZG9lcyBu
b3Qgc3RhbmQuICAKPiAKPiBbLi4uXQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
