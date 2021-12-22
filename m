Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9EDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmSNtnE0w/6vpGRf42ZnNNcIZIL/GPfUf5WvCe8XnlE=; b=2MxFvdPITmeuSw
	6X/C9RpJn4hvbangfVXFIBJr5gwZBuSa2KHOEMAvMPc9zNS+ssUodzEnoYxF4gop4liABOjbjywhJ
	yg8ThI4HB0FUSaT6VXYH6GN4feSOQ3pGDLqhYsmTyOfN5Yux0vyNoWYrJFD3REgPDWG/jV7ur6ltj
	xwD/BMm/i3cPBy7JSymQsJpLl0XZddtt05yrPXPY4v6S9zGNNYPkJqg2ZDUppuoYWHhcSsO3cKORM
	m+KEXHvg77nZzFGUi8dA+4QK7/0+3nlGZiAnNvpH3OKX5xPpPMhS1l1ewT2FF2rqX3NBHKsV4QjKt
	/oYH0R/QCxK+N29dgnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04Ao-00ApeA-89; Wed, 22 Dec 2021 16:09:02 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04Al-00Apd2-MI
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 16:09:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 96A9A60007;
 Wed, 22 Dec 2021 16:08:55 +0000 (UTC)
Date: Wed, 22 Dec 2021 17:08:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Michael Trimarchi
 <michael@amarulasolutions.com>, Han Xu <han.xu@nxp.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/4] mtd: rawnand: gpmi: support fast edo timings
 for mx28
Message-ID: <20211222170854.7f6f91da@xps13>
In-Reply-To: <20211217155512.1877408-3-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
 <20211217155512.1877408-3-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_080900_025003_787A93D9 
X-CRM114-Status: GOOD (  18.12  )
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

SGkgRGFyaW8sCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbSB3cm90ZSBvbiBG
cmksIDE3IERlYyAyMDIxIDE2OjU1OjEwCiswMTAwOgoKPiBJbiB0aGUgbXgyOCByZWZlcmVuY2Ug
bWFudWFsIHRoZXJlIGFyZSBleGFtcGxlcyBvZiBob3cgdG8gc2V0IHVwIHRoZQo+IEdQTUkgY29u
dHJvbGxlciB0byBzdXBwb3J0IGZhc3QgTkFORCBFRE8gdGltaW5nLgoKLi4uIHdoaWNoIGFyZT8g
SSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gaGVyZS4KCkFuZCB3aGF0
IHlvdSBjaGFuZ2UgYmVsb3cgaXMganVzdCAibm90IHJlZnVzaW5nIEVETyB0aW1pbmdzIHdpdGgg
b24KTVgyOCIuIFRoZXJlIGlzIGEgbWlzbWF0Y2ggYmV0d2VlbiB0aGUgdGhlIHR3by4KClBsdXMs
IGl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBzaG91bGQgY29tZSBsYXN0IGdpdmVuIHRoZSBmYWN0
IHRoYXQKeW91J3JlIGZpeGluZyB0aGUgRURPIGNhbGN1bGF0aW9ucy4KCj4gVGhpcyBwYXRjaCBo
YXMgYmVlbiB0ZXN0ZWQgb24gYSAyMDQ4LzY0IGJ5dGUgTkFORCAoTWljcm9uIE1UMjlGMkcwOEFC
QUVBSDQpLgo+IEtlcm5lbCBtdGQgdGVzdHM6Cj4gIC0gbXRkX25hbmRiaXRlcnJzCj4gIC0gbXRk
X25hbmRlY2N0ZXN0Cj4gIC0gbXRkX29vYnRlc3QKPiAgLSBtdGRfcGFnZXRlc3QKPiAgLSBtdGRf
cmVhZHRlc3QKPiAgLSBtdGRfc3BlZWR0ZXN0Cj4gIC0gbXRkX3N0cmVzc3Rlc3QKPiAgLSBtdGRf
c3VicGFnZXRlc3QKPiAgLSBtdGRfdG9ydHVyZXRlc3QgW2N5Y2xlc19jb3VudCA9IDEwMDAwMDAw
XQo+IHJ1biB3aXRob3V0IGVycm9ycy4KPiAKPiBCZWZvcmUgdGhpcyBwYXRjaCAobW9kZSAwKToK
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkIGlz
IDIwOTggS2lCL3MKPiBlcmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgMjY4MCBLaUIvcwo+IHBhZ2Ug
d3JpdGUgc3BlZWQgaXMgMTY4OSBLaUIvcwo+IHBhZ2UgcmVhZCBzcGVlZCBpcyAyNTIyIEtpQi9z
Cj4gMiBwYWdlIHdyaXRlIHNwZWVkIGlzIDE4OTkgS2lCL3MKPiAyIHBhZ2UgcmVhZCBzcGVlZCBp
cyAyNTc5IEtpQi9zCj4gZXJhc2Ugc3BlZWQgaXMgMTI4MDAwIEtpQi9zCj4gMnggbXVsdGktYmxv
Y2sgZXJhc2Ugc3BlZWQgaXMgNzMxNDIgS2lCL3MKPiA0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVl
ZCBpcyAyMDQ4MDAgS2lCL3MKPiA4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAg
S2lCL3MKPiAxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4gMzJ4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwo+IDY0eCBtdWx0aS1ibG9j
ayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKPiAKPiBBZnRlciB0aGlzIHBhdGNoIChtb2Rl
IDUpOgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBlcmFzZWJsb2NrIHdyaXRlIHNwZWVk
IGlzIDMzOTAgS2lCL3MKPiBlcmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgNTY4OCBLaUIvcwo+IHBh
Z2Ugd3JpdGUgc3BlZWQgaXMgMjY4MCBLaUIvcwo+IHBhZ2UgcmVhZCBzcGVlZCBpcyA0ODc2IEtp
Qi9zCj4gMiBwYWdlIHdyaXRlIHNwZWVkIGlzIDI5MDkgS2lCL3MKPiAyIHBhZ2UgcmVhZCBzcGVl
ZCBpcyA1MjI0IEtpQi9zCj4gZXJhc2Ugc3BlZWQgaXMgMTcwNjY2IEtpQi9zCj4gMnggbXVsdGkt
YmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjA0ODAwIEtpQi9zCj4gNHggbXVsdGktYmxvY2sgZXJhc2Ug
c3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4gOHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2
MDAwIEtpQi9zCj4gMTZ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwo+
IDMyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKPiA2NHggbXVsdGkt
YmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENvLWRl
dmVsb3BlZC1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Cj4gLS0tCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3Bt
aS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBp
bmRleCA2NWJjZDFjNTQ4ZDIuLmZkOTM1ZTg5M2RhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAtNzcyLDggKzc3Miw4IEBAIHN0YXRpYyBp
bnQgZ3BtaV9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBu
ciwKPiAgCWlmIChJU19FUlIoc2RyKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihzZHIpOwo+ICAKPiAt
CS8qIE9ubHkgTVg2IEdQTUkgY29udHJvbGxlciBjYW4gcmVhY2ggRURPIHRpbWluZ3MgKi8KPiAt
CWlmIChzZHItPnRSQ19taW4gPD0gMjUwMDAgJiYgIUdQTUlfSVNfTVg2KHRoaXMpKQo+ICsJLyog
T25seSBNWDI4L01YNiBHUE1JIGNvbnRyb2xsZXIgY2FuIHJlYWNoIEVETyB0aW1pbmdzICovCj4g
KwlpZiAoc2RyLT50UkNfbWluIDw9IDI1MDAwICYmICFHUE1JX0lTX01YMjgodGhpcykgJiYgIUdQ
TUlfSVNfTVg2KHRoaXMpKQo+ICAJCXJldHVybiAtRU5PVFNVUFA7Cj4gIAo+ICAJLyogU3RvcCBo
ZXJlIGlmIHRoaXMgY2FsbCB3YXMganVzdCBhIGNoZWNrICovCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
