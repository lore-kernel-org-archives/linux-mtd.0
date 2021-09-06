Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D25C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 16:14:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D5B60F6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 16:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5D5B60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKGswE1hgWX2I3RD0ab/rBgwUB4TuZHsqL1WBwz0RII=; b=OThL++G8j6vp2C
	iS1jq56x1FyZmb7TCeNgqWrBrSMkYoIceA5pOT8sMCZ480Mw/73b4ZYveblyPhnTvb9VjUfZO9Wyj
	q4jd1sG+ZMGxCNLYEjDXQ7zUNifvhrcPstEg76DpK4ghg7KFaL/HSImYG5UW7BkJhoSvDi8/A1XNx
	9fYy4t1F3oztiIcx7zmA6GGOCYrFLYRI4xP7amQZYWitCo9ajGsN2xDMA3Dps9kuR9B28VpHdfAIU
	C/FUz1iDFCXuPzTbbSDIMB8IaNTXVHN7c16mpeluHf/3RL7uO5VWoZcMi7u8EDrfcr7QOvrsWXAbX
	4SxlVIoGog+A93HDtmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNHFs-001HpO-RM; Mon, 06 Sep 2021 16:13:56 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNHFo-001Hoy-Nu
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 16:13:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4D60C1BF206;
 Mon,  6 Sep 2021 16:13:42 +0000 (UTC)
Date: Mon, 6 Sep 2021 18:13:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek
 <monstr@monstr.eu>, Amit Kumar Mahapatra <akumarma@xilinx.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: Check the CHANGE_READ_COLUMN from
 nand_read_subpage() is supported
Message-ID: <20210906181341.08619108@xps13>
In-Reply-To: <20210906170827.02ab8b96@collabora.com>
References: <20210906132942.36972-1-miquel.raynal@bootlin.com>
 <20210906132942.36972-2-miquel.raynal@bootlin.com>
 <20210906170827.02ab8b96@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_091353_141976_2B26D74C 
X-CRM114-Status: GOOD (  25.37  )
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

SGkgQm9yaXMsCgpib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbSB3cm90ZSBvbiBNb24sIDYg
U2VwIDIwMjEgMTc6MDg6MjcgKzAyMDA6Cgo+IE9uIE1vbiwgIDYgU2VwIDIwMjEgMTU6Mjk6NDEg
KzAyMDAKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiAKPiA+IFRoZXJlIGFyZSBjb25zdHJhaW50IGNvbnRyb2xsZXJzIHdoaWNoIGRvIG5vdCBzdXBw
b3J0Cj4gPiBDSEFOR0VfUkVBRF9DT0xVTU5zIGF0IGFueSBvZmZzZXQuIEluIHBhcnRpY3VsYXIs
IHRoZSBvZmZzZXQgYWxpZ25tZW50Cj4gPiBtaWdodCBiZSBhbiBpc3N1ZS4gRW5zdXJlIHRoYXQg
dGhlIG9wZXJhdGlvbiBpcyBzdXBwb3J0ZWQgYmVmb3JlIHRyeWluZwo+ID4gaXQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDE3ICsrKysr
KysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiBpbmRleCA3ZjI5
ZjI3YmI2ZmQuLjgxNzU2MzViOTgwMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
Ywo+ID4gQEAgLTMwNjUsMTAgKzMwNjUsMTkgQEAgc3RhdGljIGludCBuYW5kX3JlYWRfc3VicGFn
ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50MzJfdCBkYXRhX29mZnMsCj4gPiAgCQkgICAg
KGJ1c3cgLSAxKSkKPiA+ICAJCQlhbGlnbmVkX2xlbisrOwo+ID4gIAo+ID4gLQkJcmV0ID0gbmFu
ZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoY2hpcCwKPiA+IC0JCQkJCQkgbXRkLT53cml0ZXNpemUg
KyBhbGlnbmVkX3BvcywKPiA+IC0JCQkJCQkgJmNoaXAtPm9vYl9wb2lbYWxpZ25lZF9wb3NdLAo+
ID4gLQkJCQkJCSBhbGlnbmVkX2xlbiwgZmFsc2UpOwo+ID4gKwkJcmV0ID0gbmFuZF9jaGVja19j
aGFuZ2VfcmVhZF9jb2x1bW5fb3AoY2hpcCwKPiA+ICsJCQkJCQkgICAgICAgbXRkLT53cml0ZXNp
emUgKyBhbGlnbmVkX3BvcywKPiA+ICsJCQkJCQkgICAgICAgJmNoaXAtPm9vYl9wb2lbYWxpZ25l
ZF9wb3NdLAo+ID4gKwkJCQkJCSAgICAgICBhbGlnbmVkX2xlbiwgZmFsc2UsIHRydWUpOwo+ID4g
KwkJaWYgKCFyZXQpCj4gPiArCQkJcmV0ID0gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3AoY2hp
cCwKPiA+ICsJCQkJCQkJIG10ZC0+d3JpdGVzaXplICsgYWxpZ25lZF9wb3MsCj4gPiArCQkJCQkJ
CSAmY2hpcC0+b29iX3BvaVthbGlnbmVkX3Bvc10sCj4gPiArCQkJCQkJCSBhbGlnbmVkX2xlbiwg
ZmFsc2UpOwo+ID4gKwkJZWxzZQo+ID4gKwkJCXJldCA9IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1u
X29wKGNoaXAsIG10ZC0+d3JpdGVzaXplLAo+ID4gKwkJCQkJCQkgY2hpcC0+b29iX3BvaSwKPiA+
ICsJCQkJCQkJIG10ZC0+b29ic2l6ZSwgZmFsc2UpOwo+ID4gIAkJaWYgKHJldCkKPiA+ICAJCQly
ZXR1cm4gcmV0OyAgCj4gCgoKVGhlIHByZXZpb3VzIGJlaGF2aW9yIHdhczoKCi8qCiAqIGdhcHMg
PT0gdHJ1ZSBtZWFucyB3ZSBuZWVkIHRvIHJlcXVlc3QgdGhlIGVudGlyZSBPT0IgYXJlYSBhbmQg
d2UKICogd2lsbCBjYWxsIGFuIE9PQiBsYXlvdXQgaGVscGVyIHRvIGV4dHJhY3QgdGhlIEVDQyBi
eXRlcy4KICogZ2FwcyA9PSBmYWxzZSBtZWFucyB0aGVyZSBpcyBubyBkYXRhIGludGVybGVhdmVk
LCB3ZSBjYW4ganVzdCByZWFkCiAqIHRoZSBudW1iZXIgb2YgRUNDIGJ5dGVzIGJ5IHN0YXJ0aW5n
IGF0IHRoZSByaWdodCBvZmZzZXQgYW5kIG5vCiAqIGV4dHJhY3Rpbmcgb3BlcmF0aW9uIHdpbGwg
YmUgbmVlZGVkLgogKi8KZ2FwcyA9IC4uLjsKaWYgKCFnYXBzKQoJbmFuZF9jaGFuZ2VfcmVhZF9j
b2x1bW4oYXQgYSBzcGVjaWZpYyBvZmZzZXQgYW5kIGEgc3BlY2lmaWMKCQkJCWxlbmd0aCBqdXN0
IHRvIG1hdGNoIHRoZSBFQ0MgYnl0ZXMpOwplbHNlCgluYW5kX2NoYW5nZV9yZWFkX2NvbHVtbih0
aGUgZW50aXJlIE9PQik7CgpXaGlsZSB0aGUgbmV3IGJlaGF2aW9yIGlzOgoKaWYgKCFnYXBzKSB7
CglvcF9zdXBwb3J0ZWQgPSBuYW5kX2NoZWNrX2NoYW5nZV9yZWFkX2NvbHVtbigpOwoJaWYgKCFv
cF9zdXBwb3J0ZWQpCgkJLy8gc2FtZSBvcGVyYXRpb24gYXMgaWYgZ2FwcyA9PSB0cnVlCgkJbmFu
ZF9jaGFuZ2VfcmVhZF9jb2x1bW4odGhlIGVudGlyZSBPT0IpOwoJZWxzZQoJCW5hbmRfY2hhbmdl
X3JlYWRfY29sdW1uKGF0IGEgc3BlY2lmaWMgb2Zmc2V0KTsKfSBlbHNlIHsKCW5hbmRfY2hhbmdl
X3JlYWRfY29sdW1uKHRoZSBlbnRpcmUgT09CKQp9Cgo+IFNvIHlvdSBqdXN0IGZhaWwgaWYgdGhl
IENIQU5HRSBjb2x1bW4gb3AgaXMgbm90IHN1cHBvcnRlZD8gTG9va3MgbGlrZQo+IHRoaXMgY2hl
Y2sgc2hvdWxkIGJlIGRvbmUgYmVmb3JlIHdlIGFzc2lnbiBlY2MtPnJlYWRfc3VicGFnZSB0bwo+
IG5hbmRfcmVhZF9zdWJwYWdlIGluCj4gbmFuZF9zZXRfZWNjX29uX2hvc3Rfb3BzKCkvbmFuZF9z
ZXRfZWNjX3NvZnRfb3BzKCkuLi4KClNvIEkgYWN0dWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUg
YWJvdmUgY29tbWVudCBhcyB0aGUgY29kZSBpcyBub3QKc2ltcGx5IGZhaWxpbmcsIGl0J3MgYWN0
dWFsbHkgZmFsbGluZyBiYWNrIHRvIHNlY29uZCBtZXRob2Qgd2hpY2ggaXMKbWF5YmUgc2xpZ2h0
bHkgc2xvd2VyIGJ1dCBzdGlsbCB2YWxpZC4gRG8geW91IHRoaW5rIGl0J3Mgd3Jvbmc/CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
