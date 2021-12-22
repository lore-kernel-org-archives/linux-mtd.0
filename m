Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FE1C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wbxxTfGFII4vgF1A7MAFPjc1vSELCqALSuiEVs87H8=; b=TIkbzO6VpEKt74
	BwCKj5P7hBir4+PDhk4P3+o0MYuUDbJ+sRWQfRpzvmLjBXrXF3NUcLrxRFXLPDcDFRG4inkEU8Q8q
	S57Qkh30LQE2Nd7F5nxHmEHS5XN58JH2PC5vgdUPItbj78B+/jBnPAhf5o136ElKXJJrXnH5NwM1C
	l8ouaMjVdE+KghwctQMmiiSmL0H4oVAdh3DTwt315i1D0Dwg8hxi5ny3j30LL+xY/tPmuQYJKF0vS
	3g3q1/QnNkHGv2h8ULed0ii7IlPtVDNxDZFOvSCwNaCsh3rLCIg/86bbYNU5J1e+h6YhaCwOiZ6IS
	qJZEXlWsmA/iuewbThZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n04CL-00Aptn-Oi; Wed, 22 Dec 2021 16:10:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n04CI-00Aps5-FD
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 16:10:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E02E91C0006;
 Wed, 22 Dec 2021 16:10:30 +0000 (UTC)
Date: Wed, 22 Dec 2021 17:10:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Michael Trimarchi
 <michael@amarulasolutions.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 3/4] mtd: rawnand: gpmi: fix controller timings setting
Message-ID: <20211222171029.6e39ec4f@xps13>
In-Reply-To: <20211217155512.1877408-4-dario.binacchi@amarulasolutions.com>
References: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
 <20211217155512.1877408-4-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_081034_677841_EA367CB8 
X-CRM114-Status: GOOD (  13.66  )
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
cmksIDE3IERlYyAyMDIxIDE2OjU1OjExCiswMTAwOgoKPiBUaGUgY29udHJvbGxlciByZWdpc3Rl
cnMgYXJlIG5vdyBzZXQgYWNjb3JkbGluZyB0byB0aGUgcmVhbCBjbG9jayByYXRlLgoKWW91IHNo
b3VsZCB1c2UgYW5vdGhlciB0ZW5zZSAod2hpY2ggSSBmb3Jnb3QgdGhlIG5hbWUpIHN1Y2ggYXM6
CgpTZXQgdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXJzIGFjY29yZGluZyB0byB0aGUgcmVhbCBjbG9j
ayByYXRlLgoKQnV0IG1vc3QgaW1wb3J0YW50bHksIHlvdSBzaG91bGQgZXhwbGFpbiB3aHkgYW5k
IHBlcmhhcHMgZ2l2ZSBleGFtcGxlcwpvZiBmcmVxdWVuY2llcyBvbiB5b3VyIHNldHVwLgoKPiBG
aXhlczogYjEyMDYxMjIwNjlhICgibXRkOiByYXduYW5kOiBncG1pOiB1c2UgY29yZSB0aW1pbmdz
IGluc3RlYWQgb2YgYW4gZW1waXJpY2FsIGRlcml2YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IERh
cmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBDby1k
ZXZlbG9wZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IC0tLQo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5k
LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IGluZGV4IGZkOTM1ZTg5M2Rh
Zi4uMDUxN2I4MWJiMjRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWkt
bmFuZC9ncG1pLW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9n
cG1pLW5hbmQuYwo+IEBAIC02NDgsNiArNjQ4LDcgQEAgc3RhdGljIHZvaWQgZ3BtaV9uZmNfY29t
cHV0ZV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcywKPiAgCQkJCSAgICAgY29u
c3Qgc3RydWN0IG5hbmRfc2RyX3RpbWluZ3MgKnNkcikKPiAgewo+ICAJc3RydWN0IGdwbWlfbmZj
X2hhcmR3YXJlX3RpbWluZyAqaHcgPSAmdGhpcy0+aHc7Cj4gKwlzdHJ1Y3QgcmVzb3VyY2VzICpy
ID0gJnRoaXMtPnJlc291cmNlczsKPiAgCXVuc2lnbmVkIGludCBkbGxfdGhyZXNob2xkX3BzID0g
dGhpcy0+ZGV2ZGF0YS0+bWF4X2NoYWluX2RlbGF5Owo+ICAJdW5zaWduZWQgaW50IHBlcmlvZF9w
cywgcmVmZXJlbmNlX3BlcmlvZF9wczsKPiAgCXVuc2lnbmVkIGludCBkYXRhX3NldHVwX2N5Y2xl
cywgZGF0YV9ob2xkX2N5Y2xlcywgYWRkcl9zZXR1cF9jeWNsZXM7Cj4gQEAgLTY3MSw2ICs2NzIs
OCBAQCBzdGF0aWMgdm9pZCBncG1pX25mY19jb21wdXRlX3RpbWluZ3Moc3RydWN0IGdwbWlfbmFu
ZF9kYXRhICp0aGlzLAo+ICAJCXdybl9kbHlfc2VsID0gQlZfR1BNSV9DVFJMMV9XUk5fRExZX1NF
TF9OT19ERUxBWTsKPiAgCX0KPiAgCj4gKwlody0+Y2xrX3JhdGUgPSBjbGtfcm91bmRfcmF0ZShy
LT5jbG9ja1swXSwgaHctPmNsa19yYXRlKTsKPiArCj4gIAkvKiBTRFIgY29yZSB0aW1pbmdzIGFy
ZSBnaXZlbiBpbiBwaWNvc2Vjb25kcyAqLwo+ICAJcGVyaW9kX3BzID0gZGl2X3U2NCgodTY0KU5T
RUNfUEVSX1NFQyAqIDEwMDAsIGh3LT5jbGtfcmF0ZSk7Cj4gIAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
