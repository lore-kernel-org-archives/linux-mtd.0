Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF558C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2649218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X5tO8Ddg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2649218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZTrcyh0YSzSbx4mmksW7z7tjYJYzPtZX7asnIHE6HI=; b=X5tO8Ddgz8ojzj
	RUXYKVvbJ7hKrAY50jjljPijoP40s16upFTvoPQ2fNUXwbW/dpGb1V3HABUhvgy/esO3TcHmpUC4r
	QUXIB38YN1wE8y1suZN0oA+dNimowmfXxDk/SbFs5QLGNzMudWdvfOZ6Tmv3jQJnWwMZhfpexdQUi
	eGK+j1pOe8qrSGrB7C6YUDVDWiHsP1lMIGTwuxi4RkH0e4SseIwm6hEMV2ChSkuXH0Re1QAVRi9Ol
	1BHpKdL0PlhHVKHeZ2wrdq3uRd/dtmQvPLv0oEXQ1tgAgLbNRxmVRbACLhCLDdP4GyRUW74oeHYih
	EZzYUDkHObFPvhEIHYVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAw12-0002F2-Dz; Thu, 19 Sep 2019 12:58:32 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAw0y-0002EK-Iw
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 12:58:30 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 36BFB240005;
 Thu, 19 Sep 2019 12:58:19 +0000 (UTC)
Date: Thu, 19 Sep 2019 14:58:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH] - change calculating of position page containing BBM
Message-ID: <20190919145819.66e74aef@xps13>
In-Reply-To: <20190919124139.10856-1-piotrs@cadence.com>
References: <20190919124139.10856-1-piotrs@cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_055828_776101_392E40D1 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBUaHUs
IDE5IFNlcCAyMDE5IDEzOjQxOjM1CiswMTAwOgoKPiBDaGFuZ2UgY2FsY3VsYXRpbmcgb2YgcG9z
aXRpb24gcGFnZSBjb250YWluaW5nIEJCTQo+IAo+IElmIG5vbmUgb2YgQkJNIGZsYWdzIGlzIHNl
dCB0aGVuIGZ1bmN0aW9uIG5hbmRfYmJtX2dldF9uZXh0X3BhZ2UgCj4gcmVwb3J0cyBFSU5WQUwu
IEl0IGNhdXNlcyB0aGF0IEJCTSBpcyBub3QgcmVhZCBhdCBhbGwgZHVyaW5nIHNjYW5uaW5nCj4g
ZmFjdG9yeSBiYWQgYmxvY2tzLiBUaGUgcmVzdWx0IGlzIHRoYXQgdGhlIEJCVCB0YWJsZSBpcyBi
dWlsZCB3aXRob3V0IAo+IGNoZWNraW5nIGZhY3RvcnkgQkJNIGF0IGFsbC4gRm9yIE1pY3JvbiBm
bGFzaCBtZW1vcmllcyBub25lIG9mIHRoaXMgCj4gZmxhZyBpcyBzZXQgaWYgcGFnZSBzaXplIGlz
IGRpZmZlcmVudCB0aGFuIDIwNDggYnl0ZXMuCgoibm9uZSBvZiB0aGVzZSBmbGFncyBhcmUgc2V0
IgoKPiAKPiBUaGlzIHBhdGNoIGNoYW5nZXMgdGhlIG5hbmRfYmJtX2dldF9uZXh0X3BhZ2UgZnVu
Y3Rpb24uCgoiQWRkcmVzcyB0aGlzIHJlZ3Jlc3Npb24gYnkgY2hhbmdpbmcgdGhlCm5hbmRfYmJt
X2dldF9uZXh0X3BhZ2VfZnVuY3Rpb24uIgoKPiBJdCB3aWxsIHJldHVybiAwIGlmIG5vbmUgb2Yg
QkJNIGZsYWcgaXMgc2V0IGFuZCBwYWdlIHBhcmFtZXRlciBpcyAwLiAKCiAgICAgICAgICAgICAg
ICAgICAgICBubyBCQk0gZmxhZyBpcyBzZXQKCj4gQWZ0ZXIgdGhhdCBtb2RpZmljYXRpb24gd2F5
IG9mIGRpc2NvdmVyaW5nIGZhY3RvcnkgYmFkIGJsb2NrcyB3aWxsIHdvcmsgCj4gc2ltaWxhciBh
cyBpbiBrZXJuZWwgdmVyc2lvbiA1LjEuCj4gCgpGaXhlcyArIHN0YWJsZSB0YWdzIHdvdWxkIGJl
IGdyZWF0IQoKPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDggKysrKysrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IDVjMmMzMGE3ZGZmYS4uZjY0ZTNiNjYwNWM2
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBAQCAtMjkyLDEyICsyOTIsMTYgQEAg
aW50IG5hbmRfYmJtX2dldF9uZXh0X3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IHBh
Z2UpCj4gIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+ICAJaW50
IGxhc3RfcGFnZSA9ICgobXRkLT5lcmFzZXNpemUgLSBtdGQtPndyaXRlc2l6ZSkgPj4KPiAgCQkJ
IGNoaXAtPnBhZ2Vfc2hpZnQpICYgY2hpcC0+cGFnZW1hc2s7Cj4gKwl1bnNpZ25lZCBpbnQgYmJt
X2ZsYWdzID0gTkFORF9CQk1fRklSU1RQQUdFIHwgTkFORF9CQk1fU0VDT05EUEFHRQo+ICsJCXwg
TkFORF9CQk1fTEFTVFBBR0U7Cj4gIAo+ICsJaWYgKHBhZ2UgPT0gMCAmJiAhKGNoaXAtPm9wdGlv
bnMgJiBiYm1fZmxhZ3MpKQo+ICsJCXJldHVybiAwOwo+ICAJaWYgKHBhZ2UgPT0gMCAmJiBjaGlw
LT5vcHRpb25zICYgTkFORF9CQk1fRklSU1RQQUdFKQo+ICAJCXJldHVybiAwOwo+IC0JZWxzZSBp
ZiAocGFnZSA8PSAxICYmIGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JCTV9TRUNPTkRQQUdFKQo+ICsJ
aWYgKHBhZ2UgPD0gMSAmJiBjaGlwLT5vcHRpb25zICYgTkFORF9CQk1fU0VDT05EUEFHRSkKPiAg
CQlyZXR1cm4gMTsKPiAtCWVsc2UgaWYgKHBhZ2UgPD0gbGFzdF9wYWdlICYmIGNoaXAtPm9wdGlv
bnMgJiBOQU5EX0JCTV9MQVNUUEFHRSkKPiArCWlmIChwYWdlIDw9IGxhc3RfcGFnZSAmJiBjaGlw
LT5vcHRpb25zICYgTkFORF9CQk1fTEFTVFBBR0UpCj4gIAkJcmV0dXJuIGxhc3RfcGFnZTsKPiAg
Cj4gIAlyZXR1cm4gLUVJTlZBTDsKCkxvb2tncyBnb29kIG90aGVyd2lzZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
