Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C6E6FE3D
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH4EMPVFysV/sbKwguMdpCEhluzAQRbOu2OKWzACHkU=; b=hHTWKuz0fLh+Wp
	8LjE7oHvYlVdS2rSCp3sIQ0LAgbFSEkzqty5Of8Y8KLPcwYnl7Xk9RLAbj22nLLbKRo2Rr/j2Z/zs
	Ci5g/sd34/yDvdG57Yvx9IbxbKTiCWpJTYBUHn0KjfUXwmCcWOpik9tYfXx0K9BP91CEmDg9IWyqv
	n2cW2N816nHZP+9fL1EAcWIaLepNh/HAQF/nO6t2RBCSpf1B0fJnpuoBy4eqK0BU9eD0qkzvdkAuW
	rxV9jCz1AvZHUKZdgcjwHhW6QJgloTXBQWTUmkADPW+sdXUkbiyiDmKhEeuWCNpAtOx1ECj7WH/6/
	CSFNAf8SWllRsAimvkHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhJN-009DeY-0M;
	Fri, 22 Sep 2023 14:39:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhJJ-009Dd8-1G;
	Fri, 22 Sep 2023 14:39:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67AC3FF80E;
	Fri, 22 Sep 2023 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695393546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tT8hyAzx4ZhqoZcyPUvFHwNUdgW73Re8JuIC98mcHSU=;
	b=kGr+G68sW/V6sxZ+CuqPiY9XD8wSflqq81r1Kdwt1d+k2gNxqDeRjw0CKV8hnDyXl5xDnT
	1G9WCCX5cnViNlsg5N/BJUkz9OsFw9THGrF1zduUv5m7vwXMBHyKW92qoym6v0zCwNZ5Te
	7Gi0AApBFZDcecO0gKa6gsfc/L/Y2tovnyKnXHd4D8ooLZZKnXibyGZpE4oTpPj964F9ZQ
	oip070eo8uATdJJAV3WtFrsslsfSb3adXV92SKw6Si7/xaYS6UZKtTkFNLJpt+wGZavM95
	IN0pMDUj21bDbRQkgER13PamXMwDFzokfqcgZFrEN3hl0zXOAbA4/X+PxXrHBw==
Date: Fri, 22 Sep 2023 16:39:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Message-ID: <20230922163903.3f49ea2a@xps-13>
In-Reply-To: <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
	<20230922061530.3121-3-wsa+renesas@sang-engineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_073913_567751_771AA697 
X-CRM114-Status: GOOD (  13.08  )
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

SGkgV29sZnJhbSwKCndzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tIHdyb3RlIG9uIEZy
aSwgMjIgU2VwIDIwMjMgMDg6MTU6MjMKKzAyMDA6Cgo+IEFSNyBpcyBnb2luZyB0byBiZSByZW1v
dmVkIGZyb20gdGhlIEtlcm5lbCwgc28gcmVtb3ZlIGl0cyBzdXBwb3J0IGZvcgo+IE1URC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJp
bmcuY29tPgo+IEFja2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICogYWRkZWQgYWNrCj4gCj4gIGFyY2gvYXJt
L2NvbmZpZ3MvcHhhX2RlZmNvbmZpZyB8ICAgMSAtCgpJJ20gbm90IHN1cmUgaXQgaXMgd2lzZSB0
byBtZXJnZSBkZWZjb25maWcgY2hhbmdlcyB0aHJvdWdoIG10ZC4gV291bGQKeW91IG1pbmQgc2Vu
ZGluZyB0aGlzIGNoYW5nZSBhc2lkZSB0byBhdm9pZCBwb3RlbnRpYWwgY29uZmxpY3RzPyBFYWNo
CnBhdGNoIGNhbiBsaXZlIG9uIHRoZWlyIG93biBhbnl3YXkuCgo+ICBkcml2ZXJzL210ZC9wYXJz
ZXJzL0tjb25maWcgICAgfCAgIDUgLS0KPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9NYWtlZmlsZSAg
IHwgICAxIC0KPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9hcjdwYXJ0LmMgIHwgMTI5IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKRG8geW91IGhhdmUgb3RoZXIgY2hhbmdlcyByZWxh
dGVkIHRvIHRoaXMgZmlsZSBpbiB5b3VyIHRyZWU/IEl0IGZhaWxlZAp0byBhcHBseSBvbiBteSBz
aWRlLgoKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMzYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL210ZC9wYXJzZXJzL2FyN3BhcnQuYwoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
