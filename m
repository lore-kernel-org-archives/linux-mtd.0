Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A5EC388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:10:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35F422255
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vikwakhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B35F422255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DJZGxi+31/mSJ4zqnanL74v3/ghkL9aZjEVkWgtwl/k=; b=Vikwakhln0gSkIQeeTxtHSW4w
	Zc6f7bU/yqjR1HsAsoiowuDH/2+XsKhWjxA6Wk7Yps6V1jK0M6i7IRyGmcLKIMuZhE0eKzK1mxnAh
	+yy1re0+hqAKrgotjFz4w8GrDa9p1eV0ElWtEqXcqC7PLGdUWOV1KRYW1DLqwROj3SvqICeunvTca
	vDp87BUDLefdKZwSii/EHadYH8+pdLpvNQ9JqeIMrdiUHGMukm/vr5VCKRpxhi1thk0bjCnek5WN/
	Dc8ZT4hly98wgcAZ/MUWxyQPWlFLtTlz8stkGUYmHmoc61voiF/CdAw+djwdLlNLZjEoJJkXqL/cE
	MId5A4ZRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrB8-0002bF-7G; Thu, 19 Nov 2020 21:09:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrAZ-0002Ip-2U
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:08:45 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 500C3200007;
 Thu, 19 Nov 2020 21:08:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 15/23] mtd: rawnand: diskonchip: Marking unused
 variables as __always_unused
Date: Thu, 19 Nov 2020 22:08:37 +0100
Message-Id: <20201119210837.25727-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-16-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e4a81ebcc2557e9c1d7500d601983175981d34e1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160843_299829_17024BD3 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Dan Brown <dan_brown@ieee.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTExLTA5IGF0IDE4OjIxOjU4IFVUQywgTGVlIEpvbmVzIHdyb3RlOgo+ICdk
dW1teScgaXMgbmV2ZXIgY2hlY2tlZCAoYXMgcGVyIHRoZSBub21lbmNsYXR1cmUpIGFuZCB0aGUg
dXNlIG9mCj4gJ2VtdHB5bWF0Y2gnIGlzIGN1cnJlbnRseSAjaWYgMCdlZCBvdXQuICBXZSBjb3Vs
ZCBhbHNvICNpZiAwIHRoZQo+IGRlY2xhcmF0aW9uLCBidXQgI2lmZXJ5IGlzIHByZXR0eSB1Z2x5
LCBzbyBJIGxpa2UgdG8ga2VlcCBpdCB0byBhCj4gbWluaW11bS4KPiAKPiBGaXhlcyB0aGUgZm9s
bG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZGlza29uY2hpcC5jOiBJbiBmdW5jdGlvbiDigJhEb0NfRGVsYXnigJk6Cj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYzoyMTk6MTY6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mGR1bW154oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYzogSW4gZnVuY3Rpb24g4oCYZG9jMjAw
eF9jYWxjdWxhdGVfZWNj4oCZOgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmM6
NzA2OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGVtcHR5bWF0Y2jigJkgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAKPiBDYzogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+IENj
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENjOiBE
YW4gQnJvd24gPGRhbl9icm93bkBpZWVlLm9yZz4KPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213
MkBpbmZyYWRlYWQub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4
dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
