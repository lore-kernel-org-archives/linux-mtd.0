Return-Path: <SRS0=Hh9c=LR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7BCC4743C
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 13:17:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E710B60FD8
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 13:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E710B60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1shJhXSzfT7p1vRzBwV8oHWTEWfywvDrrHy6+YL4iAA=; b=rgdRow+FLNxNpA
	zAs+4JE7ou88cqZMEjpii2qlT7XMP50j/+EysCTKbBgG7JXVcl5DX6CJQt1iLbrx1esQJhEZ7naWy
	6Ba50iW+yZ6ZwbTovTYEYpAv/rz80Cjy86viguI1K//iC1Q7R3DFOAG8VnpK0yC8MC8cbyvwJxIJP
	tn6cukCIBaJitjFOzjWPVc59O2jckQwo7ofF5C8qR/cLVEfuerILxt8nkQ9v4XxIUVgadx9mvx/xr
	VybhZHjw0yUqyc+Xicht2soPtiRDeEYH8mHuigDauWfrRxYKKr1MFJ/OXA3Na5xlJlJ3HU/D/BNuy
	4OQbEdCeMisBEPr2X0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw2kP-00AlSj-Fn; Wed, 23 Jun 2021 13:16:53 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw2kJ-00AlRo-Fm
 for linux-mtd@lists.infradead.org; Wed, 23 Jun 2021 13:16:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 33D8A1BF211;
 Wed, 23 Jun 2021 13:16:41 +0000 (UTC)
Date: Wed, 23 Jun 2021 15:16:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip
 (4b/512B)
Message-ID: <20210623151640.34b0fc3a@xps13>
In-Reply-To: <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
 <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
 <20210618225032.69cdc30c@xps13>
 <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_061647_864751_7FB66AC0 
X-CRM114-Status: GOOD (  29.00  )
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGUgb24gV2VkLCAyMyBKdW4KMjAyMSAxMTo0MTo0NiArMDIwMDoKCj4gTGUgMTkv
MDYvMjAyMSDDoCAyMDo0MCwgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+ID4gSGkgQ2hyaXN0
b3BoZSwKPiA+ICAgCj4gPj4+PiBOb3cgYW5kIHRoZW4gSSdtIHVzaW5nIG9uZSBvZiB0aGUgbGF0
ZXN0IGtlcm5lbHMgKFRvZGF5IGlzIDUuMTMtcmM2KSwgYW5kIHNvbWV0aW1lIGluIG9uZSBvZiB0
aGUgNS54IHJlbGVhc2VzLCBJIHN0YXJ0ZWQgdG8gZ2V0IGVycm9ycyBsaWtlOgo+ID4+Pj4KPiA+
Pj4+IFsgICAgNS4wOTgyNjVdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUg
RUNDIGVycm9yCj4gPj4+PiBbICAgIDUuMTAzODU5XSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFk
OiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2MAo+ID4+Pj4gICAgIGJ5dGVz
IGZyb20gUEVCIDk5OjU5ODI0LCByZWFkIG9ubHkgNjAgYnl0ZXMsIHJldHJ5Cj4gPj4+PiBbICAg
IDUuNTI1ODQzXSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJv
cgo+ID4+Pj4gWyAgICA1LjUzMTU3MV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0
YWJsZSBFQ0MgZXJyb3IKPiA+Pj4+IFsgICAgNS41Mzc0OTBdIHViaTAgd2FybmluZzogdWJpX2lv
X3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDMwCj4gPj4+PiA3MyBi
eXRlcyBmcm9tIFBFQiAxMDc6MTA4OTc2LCByZWFkIG9ubHkgMzA3MyBieXRlcywgcmV0cnkKPiA+
Pj4+IFsgICAgNS42OTExMjFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUg
RUNDIGVycm9yCj4gPj4+PiBbICAgIDUuNjk2NzA5XSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1
bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+ID4+Pj4gWyAgICA1LjcwMjQyNl0gZWNjX3N3X2hhbW1p
bmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiA+Pj4+IFsgICAgNS43MDgxNDFd
IGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4+PiBb
ICAgIDUuNzE0MTAzXSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBl
cnJvcikgd2hpbGUgcmVhZGluZyAzMAo+ID4+Pj4gMzUgYnl0ZXMgZnJvbSBQRUIgMTA3OjI1MTQ0
LCByZWFkIG9ubHkgMzAzNSBieXRlcywgcmV0cnkKPiA+Pj4+IFsgICAyMC41MjM2ODldIHJhbmRv
bTogY3JuZyBpbml0IGRvbmUKPiA+Pj4+IFsgICAyMS44OTIxMzBdIGVjY19zd19oYW1taW5nX2Nv
cnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4+PiBbICAgMjEuODk3NzMwXSB1Ymkw
IHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGlu
ZyAxMwo+ID4+Pj4gOTQgYnl0ZXMgZnJvbSBQRUIgMTE2Ojc1Nzc2LCByZWFkIG9ubHkgMTM5NCBi
eXRlcywgcmV0cnkKPiA+Pj4+Cj4gPj4+PiBNb3N0IG9mIHRoZSB0aW1lLCB3aGVuIHRoZSByZWFk
aW5nIG9mIHRoZSBmaWxlIGZhaWxzLCBJIGp1c3QgaGF2ZSB0byByZWFkIGl0IG9uY2UgbW9yZSBh
bmQgaXQgZ2V0cyByZWFkIHdpdGhvdXQgdGhhdCBlcnJvci4gIAo+ID4+Pgo+ID4+PiBJdCByZWFs
bHkgbG9va3MgbGlrZSBhIHJlZ3VsYXIgYml0ZmxpcCBoYXBwZW5pbmcgInNvbWV0aW1lcyIuIElz
IHRoaXMgYQo+ID4+PiBib2FyZCB3aGljaCBhbHJlYWR5IGhhZCBhIGxpZmU/IFdoYXQgYXJlIHRo
ZSB1c2FnZSBjb3VudGVycyAoVUJJIHNob3VsZAo+ID4+PiB0ZWxsIHlvdSB0aGlzKSBjb21wYXJl
ZCB0byB0aGUgb2ZmaWNpYWwgZW5kdXJhbmNlIG9mIHlvdXIgY2hpcCAoc2VlIHRoZQo+ID4+PiBk
YXRhc2hlZXQpPyAgCj4gPj4KPiA+PiBUaGUgYm9hcmQgaGFkIGEgcGVhY2VmdWxsIGxpZmU6Cj4g
Pj4KPiA+PiBVQkkgcmVwb3J0cyAidWJpMDogbWF4L21lYW4gZXJhc2UgY291bnRlcjogNDkvMjAs
IFdMIHRocmVzaG9sZDogNDA5NiIgIAo+ID4gCj4gPiBNbW1oLiBJbmRlZWQuCj4gPiAgIAo+ID4+
Cj4gPj4gSSBoYXZlIHRyaWVkIHdpdGggaGFsZiBhIGRvemVuIG9mIGJvYXJkcyBhbmQgYWxsIGhh
dmUgdGhlIGlzc3VlLgo+ID4+ICAKPiA+Pj4gICAgPj4+PiBXaGF0IGFtIEkgc3VwcG9zZWQgdG8g
ZG8gdG8gYXZvaWQgdGhlIEVDQyB3ZWFrbmVzcyB3YXJuaW5nIGF0IHN0YXJ0dXAgYW5kIHRvIGZp
eCB0aGF0IEVDQyBlcnJvciBpc3N1ZSA/ICAKPiA+Pj4KPiA+Pj4gSSBob25lc3RseSBkb24ndCB0
aGluayB0aGUgZXJyb3JzIGNvbWUgZnJvbSB0aGUgNS4xeCBrZXJuZWxzIGdpdmVuIHRoZQo+ID4+
PiBhYm92ZSBsb2dzLiBJZiB5b3UgZmxhc2ggYmFjayB5b3VyIG9sZCA0LjE0IEkgYW0gcHJldHR5
IHN1cmUgeW91J2xsCj4gPj4+IGhhdmUgdGhlIHNhbWUgZXJyb3JzIGF0IHNvbWUgcG9pbnQuICAK
PiA+Pgo+ID4+IEkgZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbSBsaWtlIHRoYXQgd2l0aCA0LjE0IHdp
dGggYW55IG9mIHRoZSBib2FyZC4KPiA+Pgo+ID4+IFdoZW4gYm9vdGluZyBhIDQuMTQga2VybmVs
IEkgZG9uJ3QgZ2V0IGFueSBwcm9ibGVtIG9uIHRoZSBzYW1lIGJvYXJkLgo+ID4+ICAKPiA+IAo+
ID4gSWYgeW91IGNhbiByZWxpYWJseSBzaG93IHRoYXQgd2hlbiByZXR1cm5pbmcgdG8gYSA0LjE0
IGtlcm5lbCB0aGUgRUNDCj4gPiB3ZWFrbmVzcyBkaXNhcHBlYXJzLCB0aGVuIHRoZXJlIGlzIGNl
cnRhaW5seSBzb21ldGhpbmcgbmV3LiBXaGF0IGRyaXZlcgo+ID4gYXJlIHlvdSB1c2luZz8gTWF5
YmUgeW91IGNhbiBkbyBhIGJpc2VjdGlvbj8gIAo+IAo+IFVzaW5nIHRoZSBHUElPIGRyaXZlciwg
YW5kIHRoZSBOQU5EIGNoaXAgaXMgYSBIWU5JWC4KPiAKPiBJIGNhbiBzYXkgdGhhdCB0aGUgRUND
IHdlYWtuZXNzIGRvZXNuJ3QgZXhpc3QgdW50aWwgdjUuNSBpbmNsdWRlZC4gVGhlIHdlYWtuZXNz
IGFwcGVhcnMgd2l0aCB2NS42Lgo+IAo+IEkgaGF2ZSB0cmllZCBiaXNlY3Rpb24gYmV0d2VlbiB0
aG9zZSB0d28gdmVyc2lvbnMgYW5kIEkgY291bGRuJ3QgZW5kIHVwIHRvIGEgcmVsaWFibGUgcmVz
dWx0LiBUaGUgY2xvc2VyIHRoZSB2NS41IHlvdSBnbywgdGhlIG1vcmUgZGlmZmljdWx0IGl0IGlz
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUuCj4gCj4gU28gSSBsb29rZWQgYXQgd2hhdCB3YXMgZG9u
ZSBhcm91bmQgdGhlIHBsYWNlcywgYW5kIGluIGZhY3QgdGhhdCdzIG1haW5seSBvcHRpbWlzYXRp
b24gaW4gdGhlIHBvd2VycGMgY29kZS4gSXQgc2VlbXMgdGhhdCB0aGUgbW9yZSBwb3dlcnBjIGlz
IG9wdGltaXNlZCwgdGhlIG1vcmUgdGhlIHByb2JsZW0gb2NjdXJzLgo+IAo+IExvb2tpbmcgYXQg
dGhlIEdQSU8gbmFuZCBkcml2ZXIsIEkgc2F3IHRoYXQgbm8tb3AgZ3Bpb19uYW5kX2Rvc3luYygp
IGZ1bmN0aW9uLiBCeSBhZGRpbmcgYSBtZW1vcnkgYmFycmllciBpbiB0aGF0IGZ1bmN0aW9uLCB0
aGUgRUNDIHdlYWtuZXNzIGRpc2FwcGVhcmVkIGNvbXBsZXRlbHkuCgpJIHNlZSB0aGF0IHRoZSAn
Zml4JyBpbiBncGlvX25hbmRfZG9zeW5jKCkgaGFzIG9ubHkgYmVlbiBkZXNpZ25lZCBmb3IKQVJN
IHBsYXRmb3JtcywgcGVyaGFwcyBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGhhdmUgYSBQUEMgdmFy
aWFudCBoZXJlPwoKPiBOb3Qgc3VyZSB3aGF0IHRoZSBmaW5hbCBzb2x1dGlvbiBoYXMgdG8gYmUu
CgpQZXJoYXBzIFBvd2VyUEMgbWFpbnRhaW5lcnMgY2FuIHNjaGVkIHNvbWUgbGlnaHQgb24gdGhl
c2UgZmluZGluZ3M/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
