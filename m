Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6FEC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C5960F9C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44C5960F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YD60l+bZOErpUyMIwcEtY575JJP8l6WGXlVZRHZfsc=; b=OeX1/+xhWLsHe6
	NGfA+W4Vz8AnVDjyHGSgGaW+vPj1W21B7h9PRdN/UNPgEH2cQsG8OdJxmXif7Ae4tenLXyds5yGwB
	DxOQuKkdD7NjYkg5ML6sLSm/+K9gK7vqBGw0nLafe8fJ9jXedDLKcnyc+xdCjJtkXf1U8R1MyPwgJ
	0GRJRy3Yi6LzXpQqzxudKEkFFUITlK3sGXBXGTDdO00pAGqnxCqEm2D1F+2ApYW0dOoiGQCrL9NEw
	6QY2ht2aRELM85arLMslhKNL0Yoefr/WAqJPxnCk5ql+nMc04EYUg7Qks1s9wWyJ/TTYXc/4B4NUP
	foEWp4bnPs/wuzAZ+Iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYq3E-002vJa-49; Fri, 08 Oct 2021 13:36:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYq3A-002vHl-Bj
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:36:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3FAAD1C0009;
 Fri,  8 Oct 2021 13:36:32 +0000 (UTC)
Date: Fri, 8 Oct 2021 15:36:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>
Cc: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211008153631.3f1a09aa@xps13>
In-Reply-To: <20211008152905.2fbdcce9@xps13>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
 <20211008142724.7fbeed6a@xps13> <13290228.RDIVbhacDa@n95hx1g2>
 <20211008152905.2fbdcce9@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_063636_711081_56015A19 
X-CRM114-Status: GOOD (  26.78  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCA4IE9jdCAyMDIxIDE1OjI5
OjA1ICswMjAwOgoKPiBIaSBDaHJpc3RpYW4sCj4gCj4gY2VnZ2Vyc0BhcnJpLmRlIHdyb3RlIG9u
IEZyaSwgOCBPY3QgMjAyMSAxNToxMTo1OSArMDIwMDoKPiAKPiA+IE9uIEZyaWRheSwgOCBPY3Rv
YmVyIDIwMjEsIDExOjU1OjU2IENFU1QsIENocmlzdGlhbiBFZ2dlcnMgd3JvdGU6Cj4gPiAgIAo+
ID4gPiBJIGdvdCBhbm90aGVyIHNvbHV0aW9uIGZyb20gUEhZVEVDIChbMl0sIG5vdCBsZW5ndGh5
IHRlc3RlZCB5ZXQpLCB3aGljaAo+ID4gPiBkaXNhYmxlcyBhbGwgR1BNSS9CQ0ggY2xvY2tzIG9u
IENDR1I0ICAgIAo+ID4gICAKPiA+ID4gLXN0YXRpYyB2b2lkIGdwbWlfbmZjX2FwcGx5X3RpbWlu
Z3Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ID4gPiArc3RhdGljIGludCBncG1pX25m
Y19hcHBseV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiA+ID4gCj4gPiA+
ICB7Cj4gPiA+ICAKPiA+ID4gIAlzdHJ1Y3QgZ3BtaV9uZmNfaGFyZHdhcmVfdGltaW5nICpodyA9
ICZ0aGlzLT5odzsKPiA+ID4gIAlzdHJ1Y3QgcmVzb3VyY2VzICpyID0gJnRoaXMtPnJlc291cmNl
czsKPiA+ID4gIAl2b2lkIF9faW9tZW0gKmdwbWlfcmVncyA9IHItPmdwbWlfcmVnczsKPiA+ID4g
IAl1bnNpZ25lZCBpbnQgZGxsX3dhaXRfdGltZV91czsKPiA+ID4gCj4gPiA+ICsJaW50IHJldDsK
PiA+ID4gCj4gPiA+ICsJcmV0ID0gX19ncG1pX2VuYWJsZV9jbGsodGhpcywgZmFsc2UpOwo+ID4g
PiArCWlmIChyZXQpCj4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+IAo+ID4gPiAgCWNsa19zZXRf
cmF0ZShyLT5jbG9ja1swXSwgaHctPmNsa19yYXRlKTsKPiA+ID4gCj4gPiA+ICsJcmV0ID0gX19n
cG1pX2VuYWJsZV9jbGsodGhpcywgdHJ1ZSk7Cj4gPiA+ICsJaWYgKHJldCkKPiA+ID4gKwkJcmV0
dXJuIHJldDsKPiA+ID4gCj4gPiA+ICAJd3JpdGVsKGh3LT50aW1pbmcwLCBncG1pX3JlZ3MgKyBI
V19HUE1JX1RJTUlORzApOwo+ID4gPiAgCXdyaXRlbChody0+dGltaW5nMSwgZ3BtaV9yZWdzICsg
SFdfR1BNSV9USU1JTkcxKTsgICAgCj4gPiAKPiA+IAo+ID4gSSB0aGluayB0aGF0IHRoaXMgaXMg
YWxzbyByZXF1aXJlZCBmb3IgdGhlIGZpcnN0IGNhbGwgdG8gY2xrX3NldF9yYXRlKCkgaW4KPiA+
IGdwbWlfZ2V0X2Nsa3MoKS4gRnJvbSB0aGUga2VybmVsJ3MgcG9pbnQgb2YgdmlldywgdGhlIGNs
b2NrcyBhcmUgbm90IGVuYWJsZWQKPiA+IHlldCwgc28gbm8gImd1YXJkIiBpcyByZXF1aXJlZC4g
UHV0dGluZyB0aGUgc2FtZSBndWFyZCBoZXJlIHdpbGwgYWN0dWFsbHkgZ2l2ZQo+ID4gYSB3YXJu
aW5nIGF0IHJ1bnRpbWUgdGhhdCBJIGFtIHRyeWluZyB0byBkaXNhYmxlIGEgY2xvY2sgd2hpY2gg
aXMgbm90IGVuYWJsZWQuCj4gPiBCdXQgb24gbXkgc3lzdGVtLCBhbGwgY2xvY2sgZ2F0ZXMgYXJl
IGVuYWJsZWQgYnkgdGhlIGJvb3Rsb2FkZXIgKGJhcmVib3gpCj4gPiBhbmQgdGhlcmVmb3JlIHRo
ZSBnbGl0Y2ggY291bGQgYWxzbyBoYXBwZW4gaGVyZS4KPiA+IAo+ID4gSWYgc2V0dGluZyB0aGUg
Y2xvY2sgdG8gYSAiZGVmYXVsdCIgcmF0ZSBpcyByZWFsbHkgcmVxdWlyZWQgKG9uIG15IHN5c3Rl
bSwgdGhlCj4gPiBjbG9jayBpcyBzd2l0Y2hlZCBmcm9tIDk5IE1IeiB0byAyMiBNSHosIGFuZCBi
YWNrIHRvIDk5IE1IeiBvbiBhIGxhdGVyIGNhbGwuLi4pLAo+ID4gSSBzdWdnZXN0IG1vdmluZyB0
aGlzIGNhbGwgdG8gZ3BtaV9uYW5kX3Byb2JlKCkgKGJlbG93IF9fZ3BtaV9lbmFibGVfY2xvY2so
KSkKPiA+IGFuZCBndWFyZCBpdC4gVGhlIHJlc3VsdCB3b3VsZCBsb29rIGxpa2U6Cj4gPiAKPiA+
IC4uLgo+ID4gCXJldCA9IGFjcXVpcmVfcmVzb3VyY2VzKHRoaXMpOwo+ID4gCWlmIChyZXQpCj4g
PiAJCWdvdG8gZXhpdF9hY3F1aXJlX3Jlc291cmNlczsKPiA+IAo+ID4gCXJldCA9IF9fZ3BtaV9l
bmFibGVfY2xrKHRoaXMsIHRydWUpOwo+ID4gCWlmIChyZXQpCj4gPiAJCWdvdG8gZXhpdF9hY3F1
aXJlX3Jlc291cmNlczsKPiA+IAo+ID4gCWlmIChHUE1JX0lTX01YNih0aGlzKSkgewo+ID4gCQkv
Kgo+ID4gCQkgKiBTZXQgdGhlIGRlZmF1bHQgdmFsdWUgZm9yIHRoZSBncG1pIGNsb2NrLgo+ID4g
CQkgKgo+ID4gCQkgKiBJZiB5b3Ugd2FudCB0byB1c2UgdGhlIE9ORkkgbmFuZCB3aGljaCBpcyBp
biB0aGUKPiA+IAkJICogU3luY2hyb25vdXMgTW9kZSwgeW91IHNob3VsZCBjaGFuZ2UgdGhlIGNs
b2NrIGFzIHlvdSBuZWVkLgo+ID4gCQkgKi8KPiA+IAkJX19ncG1pX2VuYWJsZV9jbGsodGhpcywg
ZmFsc2UpOwo+ID4gCQljbGtfc2V0X3JhdGUodGhpcy0+cmVzb3VyY2VzLmNsb2NrWzBdLCAyMjAw
MDAwMCk7Cj4gPiAJCV9fZ3BtaV9lbmFibGVfY2xrKHRoaXMsIHRydWUpOwo+ID4gCX0KPiA+IAo+
ID4gCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwZGV2LT5kZXYsIDUwMCk7ICAK
PiAKPiBJZiB0aGlzIGNsb2NrIChhcyBJIHVuZGVyc3RhbmQpIGRvZXMgbm90IHByZXZlbnQgdXMg
dG8gYWNjZXNzIHRoZQo+IHJlZ2lzdGVycyBidXQgb25seSBmZWVkcyB0aGUgZXh0ZXJuYWwgTkFO
RCBidXMgcGFydCwgdGhlbiB0aGVyZSBpcyBubwo+IG5lZWQgdG8gZW5hYmxlIGl0IGluIHRoZSBw
cm9iZSwganVzdCBhY3F1aXJpbmcgaXQgd2lsbCBiZSBlbm91Z2guCj4gVGhlbiwgdGhlIGZpcnN0
IGNhbGwgZm9yIGFuIElPIG9wZXJhdGlvbiB3aXRoIC0+bXVzdF9hcHBseV90aW1pbmdzCj4gc2hv
dWxkOgo+IAo+IAlpZiAoaW14NikKPiAJCWRpc2FibGVfY2xrKCk7Cj4gCj4gCWNsa19zZXRfcmF0
ZSgpOwo+IAo+IAlpZiAoaW14NikKPiAJCWVuYWJsZV9jbGsoKTsKCkFjdHVhbGx5IHdlIHNob3Vs
ZCBlbnN1cmUgY2xrcyBhcmUgZW5hYmxlZCBpbiB0aGUgIWlteDYgY2FzZSBhbnl3YXksCmJ1dCB0
aGlzIGlzIG5lZWRlZCBvbmx5IG9uY2Ugc28gZWl0aGVyIHdlIGtlZXAgZW5hYmxpbmcgdGhlIGNs
b2NrIGluCnRoZSBwcm9iZSBvciB3ZSBjaGVjayBoZXJlIGlmIHRoZSBjbGsgaGFzIGFscmVhZHkg
YmVlbiBlbmFibGVkIG9yIG5vdC4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
