Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AE7C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9v9Mh/pNUvrwUHEq80kzM3pf12uocLxauO4Y0fKdaU=; b=PNCfNxUMSPE9XO
	YlCxztWAw8SwRDzn3pCCQZ44ZumGZmNLzCAcRXeTIwCXFEU5vNYqv8D2a58gaTBMXioTgZlTHxmSz
	lGa2qTqUAdcQCb0a4Vxoj2QCFygmi8lvSw+9Tfug8Yx53xfo7/KtUo7YFibVYT45dIhZnHG4sFeru
	Zbh/erwaCrHLMNKRYprsk5ZYkJeR7jJ2be0U8Ne5UwA5F4xGA1NYrHvC6SaDE/7fq9z+bWnzWIbN1
	p+Ya+6F2J/7kZup/cDbJpBJoExGfcAC2EYeoLxmBzNiraPzoEtNUwb2xXZbZoaiFswk4LBHFP5uNh
	Ct6cYcOBl1ddgyBnJhpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Pke-0000000BxA7-1P9d;
	Mon, 13 May 2024 07:05:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6PkZ-0000000Bx8z-2FX0
	for linux-mtd@lists.infradead.org;
	Mon, 13 May 2024 07:05:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59D0F1BF206;
	Mon, 13 May 2024 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715583925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hKAuHOrxtaW6B++O9Akco8z16LZrZFOupClPDMqqQE=;
	b=I/Wsb2GWCsVeCGeCaO7LSprRYioI+PVBXrCI0H+8i5OuGD35Dto8wVEt1PSthxd35VbqMT
	iGO9QHKnml4oeBX4BGlWTLzsQFidPe4E+XkRstYGjUqujt/8NrNuZSE8Ry7ofXt+ckoXUx
	vDXJOmOEi2Z/yh1Npr9Trm5peea3swHfozRG8kwSVGycmp0bZIRa+q3v12lhdjzj4RAH0b
	Q6nLQk9jPfjnLQhL2m5uSOkkAeEDajTCMBUcKaVBbTu/Ypk8VJ/84DUVHVAr5wB4obFSIK
	m9lcRXTB94QXVAJrdKPC5JBKCeHVXIcnLA0FrJ4hdXzs8nvm+9h9jQf49kcRuw==
Date: Mon, 13 May 2024 09:05:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org, Steven Seeger
 <steven.seeger@flightsystems.net>
Subject: Re: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Message-ID: <20240513090523.687ad7f4@xps-13>
In-Reply-To: <20240508-patient-cover-54085f1981d8@thorsis.com>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
	<20240507160546.130255-3-miquel.raynal@bootlin.com>
	<20240508-patient-cover-54085f1981d8@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_000532_307634_84009DC5 
X-CRM114-Status: GOOD (  22.97  )
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

SGkgQWxleGFuZGVyLAoKYWRhQHRob3JzaXMuY29tIHdyb3RlIG9uIFdlZCwgOCBNYXkgMjAyNCAw
ODo0MTo0NCArMDIwMDoKCj4gSGVsbG8gTWlxdWVsLAo+IAo+IEFtIFR1ZSwgTWF5IDA3LCAyMDI0
IGF0IDA2OjA1OjQ2UE0gKzAyMDAgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+ID4gRWFybHkgZHVy
aW5nIE5BTkQgaWRlbnRpZmljYXRpb24sIG10ZF9pbmZvIGZpZWxkcyBoYXZlIG5vdCB5ZXQgYmVl
bgo+ID4gaW5pdGlhbGl6ZWQgKG5hbWVseSwgd3JpdGVzaXplIGFuZCBvb2JzaXplKSBhbmQgdGh1
cyBjYW5ub3QgYmUgdXNlZCBmb3IKPiA+IHNhbml0eSBjaGVja3MgeWV0LiBPZiBjb3Vyc2UgaWYg
dGhlcmUgaXMgYSBtaXN1c2Ugb2YKPiA+IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgc28g
ZWFybHkgd2Ugd29uJ3QgYmUgd2FybmVkLCBidXQgdGhlcmUgaXMKPiA+IGFueXdheSBubyBhY3R1
YWwgY2hlY2sgdG8gcGVyZm9ybSBhdCB0aGlzIHN0YWdlIGFzIHdlIGRvIG5vdCB5ZXQga25vdwo+
ID4gdGhlIE5BTkQgZ2VvbWV0cnkuCj4gPiAKPiA+IFNvLCBpZiB0aGUgZmllbGRzIGFyZSBlbXB0
eSwgZXNwZWNpYWxseSBtdGQtPndyaXRlc2l6ZSB3aGljaCBpcyAqYWx3YXlzKgo+ID4gc2V0IHF1
aXRlIHJhcGlkbHkgYWZ0ZXIgaWRlbnRpZmljYXRpb24sIGxldCdzIHNraXAgdGhlIHNhbml0eSBj
aGVja3MuCj4gPiAKPiA+IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgaXMgc3ViamVjdCB0
byBiZSB1c2VkIGVhcmx5IGZvciBPTkZJL0pFREVDCj4gPiBpZGVudGlmaWNhdGlvbiBpbiB0aGUg
dmVyeSB1bmxpa2VseSBjYXNlIG9mOgo+ID4gLSBiaXRmbGlwcyBhcHBlYXJpbmcgaW4gdGhlIHBh
cmFtZXRlciBwYWdlLAo+ID4gLSB0aGUgY29udHJvbGxlciBkcml2ZXIgbm90IHN1cHBvcnRpbmcg
c2ltcGxlIERBVEFfSU4gY3ljbGVzLgo+ID4gCj4gPiBGaXhlczogYzI3ODQyZTdlMTFmICgibXRk
OiByYXduYW5kOiBvbmZpOiBBZGFwdCB0aGUgcGFyYW1ldGVyIHBhZ2UgcmVhZCB0byBjb25zdHJh
aW50IGNvbnRyb2xsZXJzIikKPiA+IEZpeGVzOiBkYWNhMzE3NjVlOGIgKCJtdGQ6IHJhd25hbmQ6
IGplZGVjOiBBZGFwdCB0aGUgcGFyYW1ldGVyIHBhZ2UgcmVhZCB0byBjb25zdHJhaW50IGNvbnRy
b2xsZXJzIikKPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBSZXBvcnRlZC1ieTog
QWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjQwMzA2LXNoYWt5LWJ1bmlvbi1kMjhiNjVlYTk3ZDdA
dGhvcnNpcy5jb20vCj4gPiBSZXBvcnRlZC1ieTogU3RldmVuIFNlZWdlciA8c3RldmVuLnNlZWdl
ckBmbGlnaHRzeXN0ZW1zLm5ldD4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtbXRkL0RNNlBSMDVNQjQ1MDY1NTQ0NTdDRjk1MTkxQTY3MEJERUY3MDYyQERNNlBSMDVN
QjQ1MDYubmFtcHJkMDUucHJvZC5vdXRsb29rLmNvbS8KPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDEyICsrKysrKystLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCj4gPiBpbmRleCAyNDhlNjU0ZWNlZmQuLmE2NmU3M2NkNjhjYiAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gQEAgLTE0NDAsMTIgKzE0NDAsMTQg
QEAgaW50IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
Cj4gPiAgCWlmIChsZW4gJiYgIWJ1ZikKPiA+ICAJCXJldHVybiAtRUlOVkFMOwo+ID4gIAo+ID4g
LQlpZiAob2Zmc2V0X2luX3BhZ2UgKyBsZW4gPiBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29ic2l6
ZSkKPiA+IC0JCXJldHVybiAtRUlOVkFMOwo+ID4gKwlpZiAobXRkLT53cml0ZXNpemUpIHsKPiA+
ICsJCWlmICgob2Zmc2V0X2luX3BhZ2UgKyBsZW4gPiBtdGQtPndyaXRlc2l6ZSArIG10ZC0+b29i
c2l6ZSkpCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7ICAKPiAKPiBUaGVzZSBkb3VibGVkICgoICkp
IGFyZSBuZXcgYW5kIEkgdGhpbmsgbm90IG5lY2Vzc2FyeT8KCk9vcHMsIHRydWUuCgpBbnkgY2hh
bmNlcyB5b3UnbGwgYmUgYWJsZSB0byB0ZXN0IHRoZSBwYXRjaHNldD8KClNhbWUgcXVlc3Rpb24g
Zm9yIFN0ZXZlbiEKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
