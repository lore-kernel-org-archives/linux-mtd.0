Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D7C004C9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C82E2075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tH1+pjFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C82E2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7Xe/TuC8b0tWnST8z8LtxmzOk7LsAbywDW9CJMuAF4=; b=tH1+pjFoVVnrze
	lUFfrZU9ba91ytjod0xlCkY6ozTAAK7Bk9g2Xj2UzgJmJTFyM4bNBVPdnVTDZML5BCBsQFFl8QNmE
	EdMSVt6/RxZX6jIwisN6BMu8Z5CysxfI+S6awZWhgucPLO2hxsMY6rr/01+BBA6RimkNzdAojUixN
	fIkjEA4umW7hKiUwM57o52emjitioqlEakT/7BhTtkO4BSnGeTXnoUpO1ChanrpFhJXJcfYlE/Hyr
	OeOjSxL9WgYxQmvm/KGYYjPPO0kdkqbPLE4Fvv4kt+n4fJoOKMTIi1X5eBrgnfJCYLqgi41kGxC2K
	qlzgCsmbM/oG5nW/f78g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2Iv-000730-Qr; Mon, 29 Apr 2019 09:10:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2Ir-00070x-Tp; Mon, 29 Apr 2019 09:10:27 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 039A220008;
 Mon, 29 Apr 2019 09:10:22 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:10:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: mtk: Improve data sampling timing for
 read cycle
Message-ID: <20190429111022.50c3182c@xps13>
In-Reply-To: <20190429063834.45967-3-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
 <20190429063834.45967-3-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_021026_264767_D45919EC 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBNb24sIDI5IEFwciAyMDE5IDE0OjM4OjMxCiswODAwOgoKPiBDdXJyZW50bHksIHdlIGV4cGFu
ZCBSRSMgbG93IGxldmVsIHRpbWUgYnkgY2hvb3NpbmcgdGhlIG1heCB2YWx1ZQo+IGJldHdlZW4g
UkUjIHB1bHNlIHdpZHRoIGFuZCBSRSMgYWNjZXNzIHRpbWUsIGFuZCBzYW1wbGUgZGF0YSBhdCB0
aGUKPiByaXNpbmcgZWRnZSBvZiBSRSMuCj4gCj4gVGhlbiwgaWYgUkUjIGFjY2VzcyB0aW1lIGlz
IGJpZ2dlciB0aGFuIFJFIyBwdWxzZSB3aWR0aCwgdGhlIHJlYWwKPiByZWFkIGN5Y2xlIHRpbWUg
bWF5IGJlIG1vcmUgdGhhbiBOQU5EIFNQRUMgcmVxdWlyZWQuIFRoaXMgbWFrZXMKPiByZWFkIHBl
cmZvcm1hbmNlIGJlIHdvcnNlIHRoYW4gdGhhdCBleHBlY3RlZC4KPiAKPiBUaGlzIHBhdGNoIGlt
cHJvdmVzIGRhdGEgc2FtcGxpbmcgdGltaW5nIGJ5IGNhbGN1bGF0aW5nIFJFIyBsb3cgbGV2ZWwK
PiB0aW1lIGFjY29yZGluZyB0byBSRSMgcHVsc2Ugd2lkdGguIElmIFJFIyBhY2Nlc3MgdGltZSBp
cyBiaWdnZXIgdGhhbgo+IFJFIyBwdWxzZSB3aWR0aCwgdGhlbiBkZWxheSBzYW1wbGluZyBkYXRh
IHRpbWluZy4KPiAKPiBUaGUgcmVzdWx0IG9mIGNvbnRyYXN0IHRlc3QgYmFzZSBvbiBNVDI3MTIg
ZXZhbHVhdCBib2FyZCBpcyBhcyBmb2xsb3cuCj4gCj4gbmFuZDogTWljcm9uIE1UMjlGMTZHMDhB
REJDQUg0Cj4gbmFuZDogMjA0OCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMjU2IEtpQiwgcGFnZSBz
aXplOiA0MDk2LCBPT0Igc2l6ZTogMjI0Cj4gCj4gTkZJIDJ4IGNsb2NrIHJhdGU6IDEyNDgwMDAw
MCBIWi4KPiAKPiBUZXN0IHRvb2w6IG10ZF9zcGVlZHRlc3Qua28KPiAKPiBSZWFkIHNwZWVkIHdp
dGhvdXQgdGhpcyBwYXRjaDoKPiBtdGRfc3BlZWR0ZXN0OiBwYWdlIHJlYWQgc3BlZWQgaXMgMTQw
MTIgS2lCL3MKPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNDg2MCBLaUIv
cwo+IAo+IFJlYWQgc3BlZWQgd2l0aCB0aGlzIHBhdGNoOgo+IG10ZF9zcGVlZHRlc3Q6IHBhZ2Ug
cmVhZCBzcGVlZCBpcyAxODcyNCBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNw
ZWVkIGlzIDE4NzEzIEtpQi9zCj4gCj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xl
aS5saUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMgfCAyMiArKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L210a19uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gaW5k
ZXggZGQ4NTVmODYwYTRiLi5hMmY3YWY1MzYzODAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbXRrX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMKPiBAQCAtODcsNiArODcsMTAgQEAKPiAgI2RlZmluZSBORklfRkRNTSh4KQkJKDB4QTQgKyAo
eCkgKiBzaXplb2YodTMyKSAqIDIpCj4gICNkZWZpbmUgTkZJX0ZETV9NQVhfU0laRQkoOCkKPiAg
I2RlZmluZSBORklfRkRNX01JTl9TSVpFCSgxKQo+ICsjZGVmaW5lIE5GSV9ERUJVR19DT04xCQko
MHgyMjApCj4gKyNkZWZpbmUJCVNUUk9CRV9NQVNLCQlHRU5NQVNLKDQsIDMpCj4gKyNkZWZpbmUJ
CVNUUk9CRV9TSElGVAkJKDMpCj4gKyNkZWZpbmUJCU1BWF9TVFJPQkVfRExZCQkoMykKPiAgI2Rl
ZmluZSBORklfTUFTVEVSX1NUQQkJKDB4MjI0KQo+ICAjZGVmaW5lCQlNQVNURVJfU1RBX01BU0sJ
CSgweDBGRkYpCj4gICNkZWZpbmUgTkZJX0VNUFRZX1RIUkVTSAkoMHgyM0MpCj4gQEAgLTUwOSw2
ICs1MTMsNyBAQCBzdGF0aWMgaW50IG10a19uZmNfc2V0dXBfZGF0YV9pbnRlcmZhY2Uoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNzbGluZSwKPiAgCXN0cnVjdCBtdGtfbmZjICpuZmMgPSBu
YW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gIAljb25zdCBzdHJ1Y3QgbmFuZF9zZHJf
dGltaW5ncyAqdGltaW5nczsKPiAgCXUzMiByYXRlLCB0cG9lY3MsIHRwcmVjcywgdGMyciwgdHcy
ciwgdHdoLCB0d3N0ID0gMCwgdHJsdCA9IDA7Cj4gKwl1MzIgdHNlbCwgcmVnOwo+ICAKPiAgCXRp
bWluZ3MgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPiAgCWlmIChJU19FUlIodGltaW5n
cykpCj4gQEAgLTU1NiwxMCArNTYxLDI1IEBAIHN0YXRpYyBpbnQgbXRrX25mY19zZXR1cF9kYXRh
X2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY3NsaW5lLAo+ICAJaWYgKCh0
d2ggKyAxKSAqIDEwMDAwMDAgLyByYXRlIDwgdGltaW5ncy0+dFJDX21pbiAvIDEwMDApCj4gIAkJ
dHJsdCA9ICh0aW1pbmdzLT50UkNfbWluIC8gMTAwMCAtICh0d2ggKyAxKSAqIDEwMDAwMDAgLyBy
YXRlKQo+ICAJCQkqIDEwMDA7Cj4gLQl0cmx0ID0gbWF4Myh0cmx0LCB0aW1pbmdzLT50UkVBX21h
eCwgdGltaW5ncy0+dFJQX21pbikgLyAxMDAwOwo+ICsJdHJsdCA9IG1heCh0cmx0LCB0aW1pbmdz
LT50UlBfbWluKSAvIDEwMDA7Cj4gIAl0cmx0ID0gRElWX1JPVU5EX1VQKHRybHQgKiByYXRlLCAx
MDAwMDAwKSAtIDE7Cj4gIAl0cmx0ICY9IDB4ZjsKPiAgCj4gKwkvKiBDYWxjdWxhdGUgc3Ryb2Jl
IHNlbCAqLwo+ICsJcmVnID0gbmZpX3JlYWRsKG5mYywgTkZJX0RFQlVHX0NPTjEpOwo+ICsJcmVn
ICY9IH5TVFJPQkVfTUFTSzsKPiArCWlmICgodHJsdCArIDEpICogMTAwMDAwMCAvIHJhdGUgPCB0
aW1pbmdzLT50UkVBX21heCAvIDEwMDApIHsKClBsZWFzZSBkbyB0aGUgY2FsY3VsYXRpb24gYW5k
IGNvbmRpdGlvbiBpbiBzZXBhcmF0ZSBzdGVwLCB0aGlzIGlzCmhhcmRseSByZWFkYWJsZS4gTWF5
YmUgeW91IGNhbiBleHBsYWluIGl0IHdpdGggYSBjb21tZW50IGFzIHdlbGwuCgo+ICsJCXRzZWwg
PSB0aW1pbmdzLT50UkVBX21heCAvIDEwMDA7Cj4gKwkJdHNlbCA9IERJVl9ST1VORF9VUCh0c2Vs
ICogcmF0ZSwgMTAwMDAwMCk7CgpBcmUgeW91IHN1cmUgdHNlbCAqIHJhdGUgY2Fubm90IG92ZXJm
bG93PwoKPiArCQl0c2VsIC09ICh0cmx0ICsgMSk7Cj4gKwkJaWYgKHRzZWwgPiBNQVhfU1RST0JF
X0RMWSkgewo+ICsJCQl0cmx0ICs9IHRzZWwgLSBNQVhfU1RST0JFX0RMWTsKPiArCQkJdHNlbCA9
IE1BWF9TVFJPQkVfRExZOwo+ICsJCX0KPiArCQlyZWcgfD0gdHNlbCA8PCBTVFJPQkVfU0hJRlQ7
Cj4gKwl9Cj4gKwluZmlfd3JpdGVsKG5mYywgcmVnLCBORklfREVCVUdfQ09OMSk7Cj4gKwo+ICAJ
LyoKPiAgCSAqIEFDQ09OOiBhY2Nlc3MgdGltaW5nIGNvbnRyb2wgcmVnaXN0ZXIKPiAgCSAqIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCgoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
