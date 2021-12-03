Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076EDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLRRLP6MxQhC5HZFdt5Pg8UYpoxwj2cmgJTJ+ybzeGY=; b=LYo2OPIsX5cQAb
	DSAyZssymlZhjCLog25xl6h04iouEcz7PIGbamcToqaKTMmNAWlbVG1bgP01ZNXVkr3NFtWLPKTdN
	o99E5fI2QWgb+6xxy/KZqKkvSRLRpaYgPwVEPQG/y9/V8Xvsahhkz4/v5TOv2lLGkD2csWqW630RD
	mwtvmMQpr59cXYQSaZ51qxc7HK67PiF57bGEqcANcdWqu91qvaRUJWx2/urSDl3ank59kXMZyKDYP
	hQpx28P/coSMVLT2Xvi4mDA4PmwvFonyvYBNTKKTwVlIw/dn2fSbOKP2AfeqML96KW8tx9VFiUEd9
	U55hAcHv5qLGAeaC7uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8nJ-00G0De-Mx; Fri, 03 Dec 2021 13:40:09 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8nD-00G0BA-Dp
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 13:40:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D6B7A200005;
 Fri,  3 Dec 2021 13:39:59 +0000 (UTC)
Date: Fri, 3 Dec 2021 14:39:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, linux-kernel@vger.kernel.org, Marek
 Szyprowski <m.szyprowski@samsung.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211203143958.40645506@xps13>
In-Reply-To: <20211130143705.5d0404aa@collabora.com>
References: <20211102110204.3334609-4-sean@geanix.com>
 <CGME20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c@eucas1p2.samsung.com>
 <21092c0f-e11b-ac16-ab96-2a0556c0e30a@samsung.com>
 <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com>
 <20211129101908.6f1aa715@xps13>
 <20211129094129.xn364czofrgtvfb4@skn-laptop>
 <63be9121-18c3-1ef2-c448-f99fb861490f@samsung.com>
 <20211130124131.6pgu7enjgk6y536m@skn-laptop>
 <20211130141551.400331c8@collabora.com>
 <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_054003_645918_9BE79014 
X-CRM114-Status: GOOD (  16.29  )
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

SGVsbG8sCgo+ID4gRmluZSBieSBtZSwgbGV0cyBkcm9wIHRoaXMgc2VyaWVzLgoKRllJIEkndmUg
ZHJvcHBlZCB0aGUgZW50aXJlIHNlcmllcyBmcm9tIG10ZC9uZXh0LiBJJ20gd2FpdGluZyBmb3Ig
dGhlCmZpeCBkaXNjdXNzZWQgYmVsb3cgKHdpdGhvdXQgYWJ1c2luZyB0aGUgY2hpcCBtdXRleCA7
LSkgKS4KCkNoZWVycywKTWlxdcOobAoKPiA+IFdlIGhhdmUgKzEwLjAwMCBkZXZpY2VzIHRoYXQg
cnVucyB3aXRoIHRoaXMgcGF0Y2g6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4g
PiBpbmRleCAxZjBkNTQyZDU5MjMuLjU4ZDQ4YzMwNzBmYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwo+ID4gQEAgLTQzMzcsNyArNDMzNyw2IEBAIHN0YXRpYyBpbnQgbmFuZF9z
dXNwZW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4gIAkJcmV0ID0gY2hpcC0+b3BzLnN1c3Bl
bmQoY2hpcCk7Cj4gPiAgCWlmICghcmV0KQo+ID4gIAkJY2hpcC0+c3VzcGVuZGVkID0gMTsKPiA+
IC0JbXV0ZXhfdW5sb2NrKCZjaGlwLT5sb2NrKTsKPiA+ICAKPiA+ICAJcmV0dXJuIHJldDsKPiA+
ICB9Cj4gPiBAQCAtNDM1MCw3ICs0MzQ5LDYgQEAgc3RhdGljIHZvaWQgbmFuZF9yZXN1bWUoc3Ry
dWN0IG10ZF9pbmZvICptdGQpCj4gPiAgewo+ID4gIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0g
bXRkX3RvX25hbmQobXRkKTsKPiA+ICAKPiA+IC0JbXV0ZXhfbG9jaygmY2hpcC0+bG9jayk7Cj4g
PiAgCWlmIChjaGlwLT5zdXNwZW5kZWQpIHsKPiA+ICAJCWlmIChjaGlwLT5vcHMucmVzdW1lKQo+
ID4gIAkJCWNoaXAtPm9wcy5yZXN1bWUoY2hpcCk7Cj4gPiAgIAo+IAo+IEJ1dCBpdCdzIGFidXNp
bmcgdGhlIGNoaXAgbG9jay4uLiBVc2UgYSB3YWl0IHF1ZXVlIGFzIHdlIGRpZCBhdCB0aGUgTVRE
Cj4gbGV2ZWwsIGFuZCBtYWtlIG5hbmRfZ2V0X2RldmljZSgpIHdhaXQgb24gdGhpcyB3YWl0IHF1
ZXVlIHdoZW4gdGhlCj4gZGV2aWNlIGlzIHN1c3BlbmRlZC4KPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
