Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F1FC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B0A206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FCLcPrc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B0A206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUWcGvXVKB2cih0Dn2qKAzYE0QeCSYs8KZ3ns0gALJM=; b=FCLcPrc2T8OJGb
	CrsDJjWS+afyV+/R+j/ZA/6ZBZd0cL5+pzSWa6dIvX4sLe4dTleZ0Pu3G7yJJaP6Bjjhnod4MdD/V
	8/4RaDmvdo4Ajw/GrSHrZhUxlaK9JurBETLlNfdgSxs10LvBsM3mOvUbHJuYai4TY3nSe6+G6CZny
	OP0izRXcbWXLHkkQH+ygxmmxlzgLhhH5McummWgoAYhtyT0cREr/J51NaNduDLV7MnFVr9oqUvshR
	DpXYgqACsHCG0XqKqCO7i6L7t01ywk2bkUwUWZv0nHoO642xASjAFdnuenzQ/VjVXB1X+z2gYI/za
	9mlCaxIR4Cepm1xsq5KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipZX4-0007yh-Sd; Thu, 09 Jan 2020 15:15:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipZX1-0007y9-E3
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:15:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 99024C000B;
 Thu,  9 Jan 2020 15:15:21 +0000 (UTC)
Date: Thu, 9 Jan 2020 16:15:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
Message-ID: <20200109161512.2742730d@xps13>
In-Reply-To: <CA+EcR21F1u4dX6NEO9Zfur=ZA7btr51EthZurEjzPHSuWu-0PQ@mail.gmail.com>
References: <20200102130826.170647-1-esben@geanix.com>
 <CA+EcR21F1u4dX6NEO9Zfur=ZA7btr51EthZurEjzPHSuWu-0PQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_071531_612143_574E0F19 
X-CRM114-Status: GOOD (  16.77  )
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
 Esben Haabendal <esben@geanix.com>, sean@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, martin@geanix.com,
 Han Xu <han.xu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSGFuLAoKSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gVHVlLCA3IEphbiAy
MDIwIDEzOjMxOjI3IC0wNjAwOgoKPiBPbiBUaHUsIEphbiAyLCAyMDIwIGF0IDc6MDkgQU0gRXNi
ZW4gSGFhYmVuZGFsIDxlc2JlbkBnZWFuaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBzeXN0ZW0g
cmVzdW1lLCB0aGUgZ3BtaSBjbG9jayBtdXN0IGJlIGVuYWJsZWQgYmVmb3JlIGFjY2Vzc2luZyBn
cG1pCj4gPiBibG9jay4gIFdpdGhvdXQgdGhpcywgcmVzdW1lIGNhdXNlcyBzb21ldGhpbmcgbGlr
ZQo+ID4KPiA+IFsgIDY2MS4zNDg3OTBdIGdwbWlfcmVzZXRfYmxvY2soNWNiYjBmN2UpOiBtb2R1
bGUgcmVzZXQgdGltZW91dAo+ID4gWyAgNjYxLjM0ODg4OV0gZ3BtaS1uYW5kIDE4MDYwMDAuZ3Bt
aS1uYW5kOiBFcnJvciBzZXR0aW5nIEdQTUkgOiAtMTEwCj4gPiBbICA2NjEuMzQ4OTI4XSBQTTog
ZHBtX3J1bl9jYWxsYmFjaygpOiBwbGF0Zm9ybV9wbV9yZXN1bWUrMHgwLzB4NDQgcmV0dXJucyAt
MTEwCj4gPiBbICA2NjEuMzQ4OTYxXSBQTTogRGV2aWNlIDE4MDYwMDAuZ3BtaS1uYW5kIGZhaWxl
ZCB0byByZXN1bWU6IGVycm9yIC0xMTAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFc2JlbiBIYWFi
ZW5kYWwgPGVzYmVuQGdlYW5peC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgfCA2ICsrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Z3BtaS1uYW5kL2dwbWktbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dw
bWktbmFuZC5jCj4gPiBpbmRleCAzMzRmZTMxMzAyODUuLjdhYzhjOGI5NWFmYyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jCj4gPiBAQCAtMTQ4
LDYgKzE0OCwxMCBAQCBzdGF0aWMgaW50IGdwbWlfaW5pdChzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEg
KnRoaXMpCj4gPiAgICAgICAgIHN0cnVjdCByZXNvdXJjZXMgKnIgPSAmdGhpcy0+cmVzb3VyY2Vz
Owo+ID4gICAgICAgICBpbnQgcmV0Owo+ID4KPiA+ICsgICAgICAgcmV0ID0gcG1fcnVudGltZV9n
ZXRfc3luYyh0aGlzLT5kZXYpOwo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gICAgICAgICByZXQgPSBncG1pX3Jlc2V0X2Js
b2NrKHItPmdwbWlfcmVncywgZmFsc2UpOwo+ID4gICAgICAgICBpZiAocmV0KQo+ID4gICAgICAg
ICAgICAgICAgIGdvdG8gZXJyX291dDsKPiA+IEBAIC0xODEsNiArMTg1LDggQEAgc3RhdGljIGlu
dCBncG1pX2luaXQoc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ID4KPiA+ICAgICAgICAg
cmV0dXJuIDA7Cj4gPiAgZXJyX291dDoKPiA+ICsgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3Rf
YnVzeSh0aGlzLT5kZXYpOwo+ID4gKyAgICAgICBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCh0
aGlzLT5kZXYpOwo+ID4gICAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0gIAo+IAo+IEkgaGF2ZSBh
IHNpbWlsYXIgcGF0Y2ggd2l0aCBtb3JlIGZpeGVzLCB3aWxsIHNlbmQgb3V0IHRvbmlnaHQgZm9y
IHJldmlldy4KCldoYXQgc2hvdWxkIEkgZG8gd2l0aCB0aGlzIHBhdGNoPyBJdCBzZWVtcyBva2F5
IHRvIG1lLCB3aGF0IGlzIHlvdXIKcGxhbj8gTWF5IEkgdGFrZSB0aGlzIG9uZSBmb3IgdGhpcyBy
ZWxlYXNlIGFuZCB5b3UnbGwgYnVpbGQgYWJvdmUgd2l0aAp5b3VyIHNlcmllcywgaXMgdGhpcyBm
aW5lIGZvciB5b3U/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
