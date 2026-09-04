Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C72C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K58cNXJwp3ZhqPpHE4RvBZMxQd/mgcdWis7GTL6Rsh4=; b=D9rOUoOQPAHlLv
	Hq9KyD0NmR+VaSB64ryAye/jrlVeZtNPMlFeZe6MLmiRb/Nz/dMzPRcszIn7l7sBIMSDVmJXPPyq6
	RBxUgbSr1jXYuXmebhk55pOU8IW1ANigrnpzwYH6ORKC6nRD68ANydfP7edSwDdM9uJVw2hZlhznw
	JNgSSdGfblPEhIfw47kc6d4+HZtKCjW9b3DxLMB2621ieiguC4xMOYnRcnZ4lnRJwvmU3wL84ZRZB
	2Y0xNeE8vwEOsyMxp8HrbdaH5tqJQtZpiPVxlyvyy5hhEDPkfgkhpt3NUsB49oL1tSbZG80Os343Z
	vg5RZxT3oZ4bHaTmYiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xrc-00000002trf-2ahs;
	Fri, 04 Sep 2026 17:38:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XrZ-00000002tp9-1yqh
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE7D64E41519;
	Fri,  4 Sep 2026 17:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBF936057F;
	Fri,  4 Sep 2026 17:38:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5610711C78158;
	Fri,  4 Sep 2026 19:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZjooTiNadwO/Mb5ZZfbkgU4SGUutMkVB6dX1zleuJj0=;
	b=HKakFB9h/tnjLHMrxTOwoVc2VT6PRS1P5BNxVEz8qzeYIlj+hlcvxqq3npUwCZg9D5kYja
	GbG2DqzycNznABKPWK9ruQA7KNcMQZ1RhE+wnKKPZvD1mq5Zo8Nc6Bd3PK5UlHbrmkULJ7
	NjOkp/elAWbQPTYxwYjuvfT6JwvHt6IRL31aVCcLx2FMPNxEUmUqNF1SINv0k6qZHVsXd4
	7KVajPLbDy/Gj8oyigEozkWoT2YwP7X8a9BIMiIxM1WDpKPQRL53BuH++0qFyWu/EQR2CV
	VZKD/RQ50WY76FAreuSOD3UwPdXswuy6SBZeVApJPH41gj5EhiMiLNP/+tDl6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Michael Walle <michael@walle.cc>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Aapo Vienamo <aapo.vienamo@linux.intel.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816163027.10044-1-kmehltretter@gmail.com>
References: <20260816163027.10044-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: core: avoid double-free of OTP NVMEM device
Message-Id: <178854347703.1467647.15864063750548637195.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:37:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103805_794498_A4A480E8 
X-CRM114-Status: UNSURE (   6.09  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCAxNiBBdWcgMjAyNiAxODozMDoyNyArMDIwMCwgS2FybCBNZWhsdHJldHRlciB3cm90
ZToKPiBJZiBmYWN0b3J5IE9UUCBzZXR1cCBmYWlscyBhZnRlciB0aGUgdXNlciBPVFAgTlZNRU0g
ZGV2aWNlIGhhcyBiZWVuCj4gcmVnaXN0ZXJlZCwgbXRkX290cF9udm1lbV9hZGQoKSB1bnJlZ2lz
dGVycyB0aGUgdXNlciBkZXZpY2UgYnV0IGxlYXZlcwo+IG10ZC0+b3RwX3VzZXJfbnZtZW0gc2V0
LiBPbiBhbiBlcnJvciwgdGhlIGNhbGxlciB1bnJlZ2lzdGVycyBpdCBhZ2Fpbi4KPiBGb3IgLUVP
UE5PVFNVUFAsIHJlZ2lzdHJhdGlvbiBjb250aW51ZXMgYW5kIG5vcm1hbCB0ZWFyZG93biB1bnJl
Z2lzdGVycwo+IGl0IGFnYWluLgo+IAo+IENsZWFyIG10ZC0+b3RwX3VzZXJfbnZtZW0gYWZ0ZXIg
dW5yZWdpc3RlcmluZyBpdC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvZml4ZXMsIHRoYW5r
cyEKClsxLzFdIG10ZDogY29yZTogYXZvaWQgZG91YmxlLWZyZWUgb2YgT1RQIE5WTUVNIGRldmlj
ZQogICAgICBjb21taXQ6IDI2MzAwODc5Y2Q4ZTQ2MTJkY2U2NmJiOGY2ZmY3Y2QzNWZjZjNlNTkK
ClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwg
YmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMg
YnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
