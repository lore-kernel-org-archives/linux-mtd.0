Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE04C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:09:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA13610A5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AA13610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aHBcnxxVA6VEiJBsMj0kpr4Vao1MFhpRJI1JSJpCFc=; b=bOob/zFI0JgvWL
	zNn9TBZgNOCCC/2bbHGc+Oh8qxnQC86PEP61L7nCPAGbY7w+sHzPtg948qCzjlM7tqtJo288MRUFv
	ZRubqE0hxz0j3xzII42eHE7RdOPENg3YCdY1DfqFXD9yVD6opvucJqrZGE3fHyG62wNXD30DiT1oU
	HfQ/vW+cXwHvyHk3klj5Gf6T5aLWp3DIPDmJWPUEvesg6NCPt337UP3x/TdQpoJTt1MPV+nJNuCN4
	4dODWSC96d+nOGeICzFKvoVPm4Ey5TJiXEmbdTPSGO0pGYX141qmXbhq6cafq4Jv7Yg9h1We8FAmz
	eRfvQVpbA5cvRluIBsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnztL-009ugc-KO; Fri, 19 Nov 2021 09:09:07 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnztI-009ufR-Ni
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 09:09:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D73F060014;
 Fri, 19 Nov 2021 09:09:00 +0000 (UTC)
Date: Fri, 19 Nov 2021 10:08:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/4] mtd: rawnand: Fix nand_choose_best_timings() on
 unsupported interface
Message-ID: <20211119100859.00b61e94@xps13>
In-Reply-To: <20211119073909.1492538-3-herve.codina@bootlin.com>
References: <20211119073909.1492538-1-herve.codina@bootlin.com>
 <20211119073909.1492538-3-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_010904_942693_18687DA4 
X-CRM114-Status: GOOD (  22.86  )
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

SGkgSGVydmUsCgpoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAxOSBOb3Yg
MjAyMSAwODozOTowNyArMDEwMDoKCj4gV2hlbiB0aGUgTlYtRERSIGludGVyZmFjZSBpcyBub3Qg
c3VwcG9ydGVkIGJ5IHRoZSBOQU5EIGNoaXAsCj4gdGhlIHZhbHVlIG9mIG9uZmktPm52ZGRyX3Rp
bWluZ19tb2RlcyBpcyAwLiBJbiB0aGlzIGNhc2UsCj4gdGhlIGJlc3RfbW9kZSB2YXJpYWJsZSB2
YWx1ZSBpbiBuYW5kX2Nob29zZV9iZXN0X252ZGRyX3RpbWluZ3MoKQo+IGlzIC0xLiBUaGUgbGFz
dCBmb3ItbG9vcCBpcyBza2lwcGVkIGFuZCB0aGUgZnVuY3Rpb24gcmV0dXJucyBhbgo+IHVuaW5p
dGlhbGl6ZWQgdmFsdWUuCgpBY3R1YWxseSBpcyBub3QgdGhlIGZpcnN0IHRpbWUgdGhpcyB1bmlu
aXRpYWxpemVkIHZhbHVlIHRyaWdnZXJzIGJlbGxzCmJ1dCwgd2hpbGUgSSB0aGluayBpbiB0aGUg
U0RSIHBhdGggaXQgaXMgc3RpbGwgbm90IG5lZWRlZCxpbiB0aGUgRERSCnBhdGNoIHlvdSBhcmUg
cmlnaHQgdGhhdCBzb21ldGhpbmcgaXMgbWlzc2luZy4KCj4gSWYgdGhpcyByZXR1cm5lZCB2YWx1
ZSBpcyAwLCB0aGUgbmFuZF9jaG9vc2VfYmVzdF9zZHJfdGltaW5ncygpCj4gaXMgbm90IGV4ZWN1
dGVkIGFuZCBubyAnYmVzdCB0aW1pbmcnIGFyZSBzZXQuIFRoaXMgbGVhZHMgdGhlIGhvc3QKPiBj
b250cm9sbGVyIGFuZCB0aGUgTkFORCBjaGlwIHdvcmtpbmcgYXQgZGVmYXVsdCBtb2RlIDAgdGlt
aW5nCj4gZXZlbiBpZiBhIGJldHRlciB0aW1pbmcgY2FuIGJlIHVzZWQuCj4gCj4gRml4IHRoaXMg
dW5pbml0aWFsemVkIHJldHVybmVkIHZhbHVlLgoKdHlwbyAgICAgICAgICAgICAgICBeCgo+IAo+
IG5hbmRfY2hvb3NlX2Jlc3Rfc2RyX3RpbWluZ3MoKSBpcyBwcmV0dHkgc2ltaWxhciB0bwo+IG5h
bmRfY2hvb3NlX2Jlc3RfbnZkZHJfdGltaW5ncygpLiBFdmVuIGlmIG9uZmktPnNkcl90aW1pbmdf
bW9kZXMKPiBzaG91bGQgbmV2ZXIgYmUgc2VlbiBhcyAwLCBuYW5kX2Nob29zZV9iZXN0X3Nkcl90
aW1pbmdzKCkgcmV0dXJuZWQKPiB2YWx1ZSBpcyBmaXhlZC4KCkkgc3RpbGwgZG9uJ3QgdGhpbmsg
aXQgcmVhbGx5IG5lZWRlZCBieSBsZXQncyBrZWVwIHNvICBldmVyeW9uZQooaW5jbHVkaW5nIHJv
Ym90cykgaXMgaGFwcHkgOikKCj4gCj4gRml4ZXM6IGE5ZWNjOGM4MTRlOSAoIm10ZDogcmF3bmFu
ZDogQ2hvb3NlIHRoZSBiZXN0IHRpbWluZ3MsIE5WLUREUiBpbmNsdWRlZCIpCj4gU2lnbmVkLW9m
Zi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyB2MSB0byB2MjoKPiAtIE5ldyBwYXRjaCBpbiB2MiBzZXJpZXMKPiAKPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+
IGluZGV4IDVjNmIwNjU4MzdlZi4uYTEzMDMyMGRlNDEyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYXNlLmMKPiBAQCAtOTI2LDcgKzkyNiw3IEBAIGludCBuYW5kX2Nob29zZV9iZXN0X3Nkcl90
aW1pbmdzKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAkJCQkgc3RydWN0IG5hbmRfc2RyX3Rp
bWluZ3MgKnNwZWNfdGltaW5ncykKPiAgewo+ICAJY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxl
cl9vcHMgKm9wcyA9IGNoaXAtPmNvbnRyb2xsZXItPm9wczsKPiAtCWludCBiZXN0X21vZGUgPSAw
LCBtb2RlLCByZXQ7Cj4gKwlpbnQgYmVzdF9tb2RlID0gMCwgbW9kZSwgcmV0ID0gLUVPUE5PVFNV
UFA7Cj4gIAo+ICAJaWZhY2UtPnR5cGUgPSBOQU5EX1NEUl9JRkFDRTsKPiAgCj4gQEAgLTk3Nyw3
ICs5NzcsNyBAQCBpbnQgbmFuZF9jaG9vc2VfYmVzdF9udmRkcl90aW1pbmdzKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsCj4gIAkJCQkgICBzdHJ1Y3QgbmFuZF9udmRkcl90aW1pbmdzICpzcGVjX3Rp
bWluZ3MpCj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX2NvbnRyb2xsZXJfb3BzICpvcHMgPSBj
aGlwLT5jb250cm9sbGVyLT5vcHM7Cj4gLQlpbnQgYmVzdF9tb2RlID0gMCwgbW9kZSwgcmV0Owo+
ICsJaW50IGJlc3RfbW9kZSA9IDAsIG1vZGUsIHJldCA9IC1FT1BOT1RTVVBQOwo+ICAKPiAgCWlm
YWNlLT50eXBlID0gTkFORF9OVkREUl9JRkFDRTsKPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
