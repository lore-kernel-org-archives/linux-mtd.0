Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41A9C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOvD1tZt/NceyRTMrZ/bn2vyG5B+JY0Ju8iTDHMW8/I=; b=w/orCQe9WnfIku
	zZ+5ytRwLO9+PVJN2Upr58lBIQgGmg5iPvxzTMBkFyTI4JOBcBwEmqUskg/CpPwUQ9U3ceW7jnm/j
	enqxB9u7kv6y8t1J14sAhxY3kPf2MQ3RA1ARZAqHTETx07F1XDyC9qc2Mr7FP9DMIV2YsIbdyXQsv
	bzIf/H20Z7ygC4MQfubyCKRutXwXEgDD+rw1mG+JdfKNkgweoX0SnKHxQzlCwdYUmTPFCo1Kh8/Jm
	FfYqKskl9CGkKd4OJEMGF6pQLZzMRp3P4iOcvLvU0LnZXT2c6dGFgXnzGfDiAeEm6sxqQ6Ktxiuok
	V/mSmV71eHRblMToIqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCmXU-00DAYW-C5; Wed, 26 Jan 2022 17:57:00 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCmDI-00D2v1-P1
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 17:36:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F32BD20000E;
 Wed, 26 Jan 2022 17:36:02 +0000 (UTC)
Date: Wed, 26 Jan 2022 18:36:01 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Message-ID: <20220126183601.42d38e88@xps13>
In-Reply-To: <YfF4UhhVFu749ZYK@sirena.org.uk>
References: <20220104083631.40776-2-miquel.raynal@bootlin.com>
 <20220126105333.883267-1-miquel.raynal@bootlin.com>
 <YfF4UhhVFu749ZYK@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_093609_025193_02F5E5E6 
X-CRM114-Status: GOOD (  10.56  )
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE2
OjM1OjMwICswMDAwOgoKPiBPbiBXZWQsIEphbiAyNiwgMjAyMiBhdCAxMTo1MzozM0FNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHNwaS1tZW0tZWNj
LiAgCj4gCj4gSSB3YXMgaG9waW5nIHRvIHJldmlldyB0aGlzIHN0dWZmPyAgSSB0aGluayBJIHdh
cyBleHBlY3RpbmcgaXQgdG8gYmUKPiByZWJhc2VkIGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cuLi4K
ClNvcnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGluZywgSSB0aG91Z2h0IHlvdSB3ZXJlIGZpbmUg
d2l0aCB0aGVzZQpzcGkgYml0cyBzbyBJIGRpZG4ndCBwaW5nIHlvdSBiZWZvcmUgYXBwbHlpbmcu
IENhbiB5b3UgcmV2aWV3IHRoZSB2OQp0aGVuPyBUaGVyZSBpcyBub3RoaW5nIGRpZmZlcmVudCBp
biB0aGUgc2VyaWVzIEkgYXBwbGllZC4KCkRlcGVuZGluZyBvbiB0aGUgb3V0Y29tZSBJJ2xsIGVp
dGhlciBmaXggaW5saW5lIGlmIHlvdSBhY2sgdGhlIHBhdGNoZXMKb3IgZHJvcCB0aGUgcGF0Y2hl
cyBmcm9tIHRoYXQgYnJhbmNoIGFuZCBzZW5kIGEgdjEwIG90aGVyd2lzZS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
