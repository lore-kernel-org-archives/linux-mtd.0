Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA03C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 08:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E351207E0
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 08:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R5wQD+Mr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E351207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfTVojy1w57x8lumE0YHVrfmwvwvBycgwSIc7p8BsZo=; b=R5wQD+MrzYcZhm
	BKuWswB8pGfZskVptmiNBamMEIQafQs+38/QGkYJVV6D+iQqrkEeWQoycpEwM+LZoBx/u+NB+fZYL
	XaJ7oGlK/xIPVyHszs7QQhV1kJ+T815FLX01z3cFhtxDH1FsuS0r7wwFaAI5ay3gdYmnNtAZ4U8m0
	MxXSPvyFLoyvwff0UbOVwjRtVI9o2ntue0N7V6VHYpJnDrDEFUrxoA/e3Oi6yKTJ3cYA9SHokV6Rb
	eoyr3arsO9xphMMyZ3Gtl6dtAFPgIXrWEf6VqGB66Nm7TxgOHOT7o7niBP+rPHnnRJqdWWLoYVR3k
	+E2UHWg9NDlyPDElbNnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ireK7-00062k-Fm; Wed, 15 Jan 2020 08:46:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ireK2-000624-BE
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 08:46:46 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 590E21C0005;
 Wed, 15 Jan 2020 08:46:39 +0000 (UTC)
Date: Wed, 15 Jan 2020 09:46:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Message-ID: <20200115094638.1847f475@xps13>
In-Reply-To: <20200115074622.cn7eh6k3mtn6tze3@pengutronix.de>
References: <20200102130826.170647-1-esben@geanix.com>
 <20200115074622.cn7eh6k3mtn6tze3@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_004642_521039_33D0590D 
X-CRM114-Status: GOOD (  16.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Esben Haabendal <esben@geanix.com>, martin@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 sean@geanix.com, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRXNiZW4sCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9u
IFdlZCwgMTUgSmFuIDIwMjAKMDg6NDY6MjIgKzAxMDA6Cgo+IEhpIEVzYmVuLAo+IAo+IE9uIFRo
dSwgSmFuIDAyLCAyMDIwIGF0IDAyOjA4OjI1UE0gKzAxMDAsIEVzYmVuIEhhYWJlbmRhbCB3cm90
ZToKPiA+IE9uIHN5c3RlbSByZXN1bWUsIHRoZSBncG1pIGNsb2NrIG11c3QgYmUgZW5hYmxlZCBi
ZWZvcmUgYWNjZXNzaW5nIGdwbWkKPiA+IGJsb2NrLiAgV2l0aG91dCB0aGlzLCByZXN1bWUgY2F1
c2VzIHNvbWV0aGluZyBsaWtlCj4gPiAKPiA+IFsgIDY2MS4zNDg3OTBdIGdwbWlfcmVzZXRfYmxv
Y2soNWNiYjBmN2UpOiBtb2R1bGUgcmVzZXQgdGltZW91dAo+ID4gWyAgNjYxLjM0ODg4OV0gZ3Bt
aS1uYW5kIDE4MDYwMDAuZ3BtaS1uYW5kOiBFcnJvciBzZXR0aW5nIEdQTUkgOiAtMTEwCj4gPiBb
ICA2NjEuMzQ4OTI4XSBQTTogZHBtX3J1bl9jYWxsYmFjaygpOiBwbGF0Zm9ybV9wbV9yZXN1bWUr
MHgwLzB4NDQgcmV0dXJucyAtMTEwCj4gPiBbICA2NjEuMzQ4OTYxXSBQTTogRGV2aWNlIDE4MDYw
MDAuZ3BtaS1uYW5kIGZhaWxlZCB0byByZXN1bWU6IGVycm9yIC0xMTAKPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogRXNiZW4gSGFhYmVuZGFsIDxlc2JlbkBnZWFuaXguY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgNiArKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiA+IGluZGV4IDMzNGZlMzEzMDI4NS4uN2Fj
OGM4Yjk1YWZjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5k
L2dwbWktbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3Bt
aS1uYW5kLmMKPiA+IEBAIC0xNDgsNiArMTQ4LDEwIEBAIHN0YXRpYyBpbnQgZ3BtaV9pbml0KHN0
cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiA+ICAJc3RydWN0IHJlc291cmNlcyAqciA9ICZ0
aGlzLT5yZXNvdXJjZXM7Cj4gPiAgCWludCByZXQ7Cj4gPiAgCj4gPiArCXJldCA9IHBtX3J1bnRp
bWVfZ2V0X3N5bmModGhpcy0+ZGV2KTsKPiA+ICsJaWYgKHJldCA8IDApCj4gPiArCQlyZXR1cm4g
cmV0OyAgCj4gCj4gVGhpcyBpbmNyZWFzZXMgdGhlIGRldmljZXMgdXNhZ2UgY291bnRlci4uLgoK
SSdtIGRyb3BwaW5nIHRoZSB0d28gcGF0Y2hlcyBmb3Igbm93LCBwbGVhc2UgcmVzZW5kIHdpdGgg
dGhpcyBmaXhlZCBhbmQKdGhlIEZpeGVzL0NjOnN0YWJsZSB0YWdzIGFkZGVkLgoKSSdsbCBmcmVl
emUgdGhlIFBSIGF0IHRoZSBlbmQgb2YgdGhlIHdlZWsuCgo+ID4gKwo+ID4gIAlyZXQgPSBncG1p
X3Jlc2V0X2Jsb2NrKHItPmdwbWlfcmVncywgZmFsc2UpOwo+ID4gIAlpZiAocmV0KQo+ID4gIAkJ
Z290byBlcnJfb3V0Owo+ID4gQEAgLTE4MSw2ICsxODUsOCBAQCBzdGF0aWMgaW50IGdwbWlfaW5p
dChzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gPiAgCj4gPiAgCXJldHVybiAwOyAgCj4g
Cj4gLi4uIGJ1dCBkb2Vzbid0IGRlY3JlYXNlIGl0IGluIHRoZSBzdWNjZXNzIGNhc2UuIFRoaXMg
bWVhbnMgdGhpcyBwYXRjaAo+IGVmZmVjdGl2ZWx5IGRpc2FibGVzIHJ1bnRpbWUgcG0uIFlvdSBz
aG91bGQgZmFsbCB0aHJvdWdoIGhlcmUgYXMgZml4ZWQKPiBpbiBIYW4gWHVzIHBhdGNoLgo+IAo+
ID4gIGVycl9vdXQ6Cj4gPiArCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kodGhpcy0+ZGV2KTsK
PiA+ICsJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQodGhpcy0+ZGV2KTsKPiA+ICAJcmV0dXJu
IHJldDsgIAo+IAo+IFNhc2NoYQo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
