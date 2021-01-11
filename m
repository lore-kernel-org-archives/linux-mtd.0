Return-Path: <SRS0=r7WN=GO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DA3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jan 2021 10:21:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C04A225AB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jan 2021 10:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C04A225AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vSOYgO3Mths0kfdTZY8fp6n9rwpQ1ShVOuhmGq/XrnA=; b=rUsxfzKEKmkAbuxyimu1gzAYR
	bQBXumeQBVui5dwl2GIo1OAUQqPWsraqAQP8XeyQTIp5KmT86u6IWvxI9qtgtR2AyAi8RXjLGWxOa
	SGq2tAZtiJQhCq6YJvRYDt9OUWScE9/DCUj9O/HjLiXfn9lF3oALrzsiIRSt6SGq/WHfzKt0nrzxC
	A6jkbQZd0a9QRrSjxVNO2Ar6aENLPKwm/KYZWpLkTOhN7GEJwVBwF4RK5KhEEg6i1sP6wnbIiVGkg
	WLyGJStAJryUs8EThKEJDAHuHKesPLWK6aBrCVRtUYoq98UAP211jHk0+8nOAPlWDHbLzpWnnrDxB
	saUv39QDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyuJb-00032y-G2; Mon, 11 Jan 2021 10:20:47 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyuJO-0002yT-Tx
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2021 10:20:36 +0000
X-Originating-IP: 90.89.98.255
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6094740006;
 Mon, 11 Jan 2021 10:20:28 +0000 (UTC)
Date: Mon, 11 Jan 2021 11:20:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210111112027.7cbda0ba@xps13>
In-Reply-To: <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_052035_189209_097C6BBC 
X-CRM114-Status: GOOD (  21.46  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRhbSwKCkFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZSBvbiBTYXQsIDkg
SmFuIDIwMjEgMDg6NDY6NDQgLTA2MDA6Cgo+IE9uIFR1ZSwgU2VwIDI5LCAyMDIwIGF0IDY6MDkg
UE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhlIE5BTkQgQkNIIGNvbnRyb2wgc3RydWN0dXJlIGhhcyBub3RoaW5nIHRvIGRvIG91dHNp
ZGUgb2YgdGhpcwo+ID4gZHJpdmVyLCBhbGwgdXNlcnMgb2YgdGhlIG5hbmRfYmNoX2luaXQvZnJl
ZSgpIGZ1bmN0aW9ucyBqdXN0IHNhdmUgaXQKPiA+IHRvIGNoaXAtPmVjYy5wcml2IHNvIGRvIGl0
IGluIHRoaXMgZHJpdmVyIGRpcmVjdGx5IGFuZCByZXR1cm4gYQo+ID4gcmVndWxhciBlcnJvciBj
b2RlIGluc3RlYWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLSAgCj4gCj4gU3RhcnRpbmcgd2l0aCB0aGlzIGNv
bW1pdDogIDNjMGZlMzZhYmViZSwgdGhlIGtlcm5lbCBlaXRoZXIgZG9lc24ndAo+IGJ1aWxkIG9y
IHJldHVybnMgZXJyb3JzIG9uIHNvbWUgb21hcDJwbHVzIGRldmljZXMgd2l0aCB0aGUgZm9sbG93
aW5nCj4gZXJyb3I6Cj4gCj4gICAgIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElE
OiAweDJjLCBDaGlwIElEOiAweGJjCj4gICAgIG5hbmQ6IE1pY3JvbiBNVDI5RjRHMTZBQkJEQTNX
Cj4gICAgIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXpl
OiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiAgICAgbmFuZDogdXNpbmcgT01BUF9FQ0NfQkNIOF9DT0RF
X0hXX0RFVEVDVElPTl9TVwo+ICAgICBJbnZhbGlkIEVDQyBsYXlvdXQKPiAgICAgb21hcDItbmFu
ZCAzMDAwMDAwMC5uYW5kOiB1bmFibGUgdG8gdXNlIEJDSCBsaWJyYXJ5Cj4gICAgIG9tYXAyLW5h
bmQ6IHByb2JlIG9mIDMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGggZXJyb3IgLTIyCj4gICAgIDg8
LS0tIGN1dCBoZXJlIC0tLQo+IAo+IFRoZXJlIGFyZSBmZXcgY29tbWl0cyB1c2luZyBnaXQgYmlz
ZWN0IHRoYXQgaGF2ZSBidWlsZCBlcnJvcnMsIHNvIGl0Cj4gd2Fzbid0IHBvc3NpYmxlIGZvciBt
ZSB0byBkZXRlcm1pbmUgdGhlIGV4YWN0IGNvbW1pdCB0aGF0IGJyb2tlIHRoZQo+IEVDQy4gIElm
IHRoZSBidWlsZCBmYWlsZWQsIEkgbWFya2VkIGl0IGFzICdiYWQnIHRvIGdpdCBiaXNlY3QuCgpJ
IGFtIHNvcnJ5IHRvIGhlYXIgdGhhdCwgSSByZWd1bGFybHkgcmViYXNlIHdpdGggYSBtYWtlIHJ1
biBiZXR3ZWVuIGVhY2gKcGljayBhbmQgcHVzaCBteSBicmFuY2hlcyB0byBhIDAtZGF5IHJlcG9z
aXRvcnkgdG8gaGF2ZSByb2JvdHMgY2hlY2sKZm9yIHN1Y2ggZXJyb3JzLCBidXQgc29tZXRpbWVz
IEkgZmFpbC4KCj4gTmV3ZXIgY29tbWl0cyBoYXZlIHJlbWVkaWVkIHRoZSBidWlsZCBpc3N1ZSwg
YnV0IHRoZSBJbnZhbGlkIEVDQwo+IGxheW91dCBlcnJvciBzdGlsbCBleGlzdHMgYXMgb2YgNS4x
MS1SQzIuCgpPayBzbyBsZXQncyBmb2N1cyBvbiB0aGVzZS4KCj4gRG8geW91IGhhdmUgYW55IHN1
Z2dlc3Rpb25zIG9uIHdoYXQgSSBjYW4gZG8gdG8gcmVtZWR5IHRoaXM/ICBJIGFtCj4gd2lsbGlu
ZyB0byB0cnkgYW5kIHRlc3QuCgpHbGFkIHRvIGhlYXIgdGhhdC4KCkNhbiB5b3Ugc2hhcmUgdGhl
IE5BTkQgY29udHJvbGxlciBEVCBub2RlIHlvdSBhcmUgdXNpbmc/CgpBbHNvLCBjYW4geW91IHBs
ZWFzZSBhZGQgYSBmZXcgcHJpbnRrJ3MgbGlrZSBiZWxvdyBhbmQgZ2l2ZSBtZSB0aGUKb3V0cHV0
PwoKLS0tODwtLS0KCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2VjYy1zdy1iY2guYyBi
L2RyaXZlcnMvbXRkL25hbmQvZWNjLXN3LWJjaC5jCmluZGV4IDBhMGFjMTFkNTcyNS4uMGQzZTk0
OGQwMmU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL2VjYy1zdy1iY2guYworKysgYi9k
cml2ZXJzL210ZC9uYW5kL2VjYy1zdy1iY2guYwpAQCAtMjA1LDYgKzIwNSw3IEBAIGludCBuYW5k
X2VjY19zd19iY2hfaW5pdF9jdHgoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kKQogICAgICAgIH0K
IAogICAgICAgIG5zdGVwcyA9IG10ZC0+d3JpdGVzaXplIC8gY29uZi0+c3RlcF9zaXplOworICAg
ICAgIHByaW50aygid3JpdGVzaXplICVkLCBzdGVwX3NpemUgJWQsIG5zdGVwcyAlZFxuIiwgbXRk
LT53cml0ZXNpemUsIGNvbmYtPnN0ZXBfc2l6ZSwgbnN0ZXBzKTsKIAogICAgICAgIC8qIE1heGlt
aXplICovCiAgICAgICAgaWYgKG5hbmQtPmVjYy51c2VyX2NvbmYuZmxhZ3MgJiBOQU5EX0VDQ19N
QVhJTUlaRV9TVFJFTkdUSCkgewpAQCAtMjEzLDExICsyMTQsMTQgQEAgaW50IG5hbmRfZWNjX3N3
X2JjaF9pbml0X2N0eChzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQpCiAgICAgICAgICAgICAgICAv
KiBSZXNlcnZlIDIgYnl0ZXMgZm9yIHRoZSBCQk0gKi8KICAgICAgICAgICAgICAgIGNvZGVfc2l6
ZSA9IChtdGQtPm9vYnNpemUgLSAyKSAvIG5zdGVwczsKICAgICAgICAgICAgICAgIGNvbmYtPnN0
cmVuZ3RoID0gY29kZV9zaXplICogOCAvIGZscyg4ICogY29uZi0+c3RlcF9zaXplKTsKKyAgICAg
ICAgICAgICAgIHByaW50aygiTWF4aW1pemUgPT4gbnN0ZXBzICVkLCBjb2RlX3NpemUgJWRcbiIs
IG5zdGVwcywgY29kZV9zaXplKTsKICAgICAgICB9CiAKLSAgICAgICBpZiAoIWNvZGVfc2l6ZSkK
KyAgICAgICBpZiAoIWNvZGVfc2l6ZSkgewogICAgICAgICAgICAgICAgY29kZV9zaXplID0gRElW
X1JPVU5EX1VQKGNvbmYtPnN0cmVuZ3RoICoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmbHMoOCAqIGNvbmYtPnN0ZXBfc2l6ZSksIDgpOworICAgICAgICAgICAgICAg
cHJpbnRrKCJzdHJlbmd0aCAlZCwgc3RlcCBzaXplICVkLCBjb2RlX3NpemUgJWRcbiIsIGNvbmYt
PnN0cmVuZ3RoLCBjb25mLT5zdGVwX3NpemUsIGNvZGVfc2l6ZSk7CisgICAgICAgfQogCiAgICAg
ICAgaWYgKCFjb25mLT5zdHJlbmd0aCkKICAgICAgICAgICAgICAgIGNvbmYtPnN0cmVuZ3RoID0g
KGNvZGVfc2l6ZSAqIDgpIC8gZmxzKDggKiBjb25mLT5zdGVwX3NpemUpOwpAQCAtMjUyLDYgKzI1
Niw3IEBAIGludCBuYW5kX2VjY19zd19iY2hfaW5pdF9jdHgoc3RydWN0IG5hbmRfZGV2aWNlICpu
YW5kKQogICAgICAgICAgICAgICAgZ290byBmcmVlX2J1ZnM7CiAKICAgICAgICAvKiBWZXJpZnkg
dGhlIGxheW91dCB2YWxpZGl0eSAqLworICAgICAgIHByaW50aygiY291bnQgZWNjYnl0ZXMgJWRc
biIsIG10ZF9vb2JsYXlvdXRfY291bnRfZWNjYnl0ZXMobXRkKSk7CiAgICAgICAgaWYgKG10ZF9v
b2JsYXlvdXRfY291bnRfZWNjYnl0ZXMobXRkKSAhPQogICAgICAgICAgICBlbmdpbmVfY29uZi0+
bnN0ZXBzICogZW5naW5lX2NvbmYtPmNvZGVfc2l6ZSkgewogICAgICAgICAgICAgICAgcHJfZXJy
KCJJbnZhbGlkIEVDQyBsYXlvdXRcbiIpOwoKLS0tPjgtLS0KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
