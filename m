Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A6CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF3B6115C
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BF3B6115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY0KLko9605LrgHe2o/mwUKaCt18qmIgsMxWAt3AaLQ=; b=44ScyOIm3A6bxH
	FGXuckNLx7ZrfFrDu9cAEBc+qzcF/0p55G90vDfasBDR88n1iwZ2K9/G5p977LUldhlx3iN2J5sw5
	LbBLhVdTEEGYGqF0U3Uh++xYzmGJgL3ykB4dVOilTWvy6zZ7EeOihqzIpHLE1Aa7oVBmUyuq701lz
	dpyHIkGvi60bZ27A55XBzXak/9ldWPkb0i7zxNlQ8DOuLohAzGrFZ7KDQMq6FilWFknx4Xg5ewfEW
	u6C4mcsTbLcEZVCCYsBvgZh0sNYX3DpIVDGoEgG6KqizwZLest84EcziuEoKYhNHI4xp4issd8iQ7
	90DjmBmebCuFNfIIqMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbGUq-005UNh-8q; Fri, 15 Oct 2021 06:15:12 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbGUm-005UMg-OM
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 06:15:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 19BBA100006;
 Fri, 15 Oct 2021 06:15:03 +0000 (UTC)
Date: Fri, 15 Oct 2021 08:14:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 list@opendingux.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: rawnand/ingenic: JZ4740 needs 'oob_first' read
 page function
Message-ID: <20211015081447.25836fc7@xps13>
In-Reply-To: <20211009184952.24591-4-paul@crapouillou.net>
References: <20211009184952.24591-1-paul@crapouillou.net>
 <20211009184952.24591-4-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_231508_956745_311F5E5A 
X-CRM114-Status: GOOD (  24.68  )
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

SGkgUGF1bCwKCnBhdWxAY3JhcG91aWxsb3UubmV0IHdyb3RlIG9uIFNhdCwgIDkgT2N0IDIwMjEg
MjA6NDk6NTIgKzAyMDA6Cgo+IFRoZSBFQ0MgZW5naW5lIG9uIHRoZSBKWjQ3NDAgU29DIHJlcXVp
cmVzIHRoZSBFQ0MgZGF0YSB0byBiZSByZWFkIGJlZm9yZQo+IHRoZSBwYWdlOyB1c2luZyB0aGUg
ZGVmYXVsdCBwYWdlIHJlYWRpbmcgZnVuY3Rpb24gZG9lcyBub3Qgd29yay4gSW5kZWVkLAo+IHRo
ZSBvbGQgSlo0NzQwIE5BTkQgZHJpdmVyIChyZW1vdmVkIGluIDUuNCkgZGlkIHVzZSB0aGUgJ09P
QiBmaXJzdCcgZmxhZwo+IHRoYXQgZXhpc3RlZCBiYWNrIHRoZW4uCj4gCj4gVXNlIHRoZSBuZXds
eSBjcmVhdGVkIG5hbmRfcmVhZF9wYWdlX2h3ZWNjX29vYl9maXJzdCgpIHRvIGFkZHJlc3MgdGhp
cwo+IGlzc3VlLgo+IAo+IFRoaXMgaXNzdWUgd2FzIG5vdCBmb3VuZCB3aGVuIHRoZSBuZXcgaW5n
ZW5pYy1uYW5kIGRyaXZlciB3YXMgZGV2ZWxvcGVkLAo+IG1vc3QgbGlrZWx5IGJlY2F1c2UgdGhl
IERldmljZSBUcmVlIHVzZWQgaGFkIHRoZSBuYW5kLWVjYy1tb2RlIHNldCB0bwo+ICJod19vb2Jf
Zmlyc3QiLCB3aGljaCBzZWVtcyB0byBub3QgYmUgc3VwcG9ydGVkIGFueW1vcmUuCgpJIHdvdWxk
IHJlbmFtZSBib3RoIHRoZSBib29sZWFuIGFuZCB0aGUgaGVscGVyICIqX2FjY2Vzc19vb2JfZmly
c3QiCndoaWNoIHNlZW1zIG1vcmUgcHJlY2lzZS4KCj4gCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjIHY1LjIKPiBGaXhlczogYTBhYzc3OGViODJjICgibXRkOiByYXduYW5kOiBpbmdl
bmljOiBBZGQgc3VwcG9ydCBmb3IgdGhlIEpaNDc0MCIpCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5p
Yy9pbmdlbmljX25hbmRfZHJ2LmMKPiBpbmRleCAwZTlkNDI2ZmU0ZjIuLmIxODg2MWJkY2RjOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9k
cnYuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Ry
di5jCj4gQEAgLTMyLDYgKzMyLDcgQEAgc3RydWN0IGp6X3NvY19pbmZvIHsKPiAgCXVuc2lnbmVk
IGxvbmcgYWRkcl9vZmZzZXQ7Cj4gIAl1bnNpZ25lZCBsb25nIGNtZF9vZmZzZXQ7Cj4gIAljb25z
dCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgKm9vYl9sYXlvdXQ7Cj4gKwlib29sIG9vYl9maXJz
dDsKPiAgfTsKPiAgCj4gIHN0cnVjdCBpbmdlbmljX25hbmRfY3Mgewo+IEBAIC0yNDAsNiArMjQx
LDkgQEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCkKPiAgCWlmIChjaGlwLT5iYnRfb3B0aW9ucyAmIE5BTkRfQkJUX1VTRV9GTEFTSCkK
PiAgCQljaGlwLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0I7Cj4gIAo+ICsJaWYgKG5m
Yy0+c29jX2luZm8tPm9vYl9maXJzdCkKPiArCQljaGlwLT5lY2MucmVhZF9wYWdlID0gbmFuZF9y
ZWFkX3BhZ2VfaHdlY2Nfb29iX2ZpcnN0Owo+ICsKPiAgCS8qIEZvciBsZWdhY3kgcmVhc29ucyB3
ZSB1c2UgYSBkaWZmZXJlbnQgbGF5b3V0IG9uIHRoZSBxaSxsYjYwIGJvYXJkLiAqLwo+ICAJaWYg
KG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgicWksbGI2MCIpKQo+ICAJCW10ZF9zZXRfb29ibGF5
b3V0KG10ZCwgJnFpX2xiNjBfb29ibGF5b3V0X29wcyk7Cj4gQEAgLTUzNCw2ICs1MzgsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGp6X3NvY19pbmZvIGp6NDc0MF9zb2NfaW5mbyA9IHsKPiAgCS5k
YXRhX29mZnNldCA9IDB4MDAwMDAwMDAsCj4gIAkuY21kX29mZnNldCA9IDB4MDAwMDgwMDAsCj4g
IAkuYWRkcl9vZmZzZXQgPSAweDAwMDEwMDAwLAo+ICsJLm9vYl9maXJzdCA9IHRydWUsCj4gIH07
Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGp6X3NvY19pbmZvIGp6NDcyNWJfc29jX2luZm8g
PSB7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
