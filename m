Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB62FC04FDE
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HJ2OVXaAxJxg5Y+QoCex2+UwrejKy8vLhwj+LQ6me0=; b=FxUx1Y22hR8yhu
	R5g4lKDYOhAtVBKAsnuCR0LxVhN9IRL8oIX2uhLcwFNnHmCz6MmizVjij8CbJJ54kWpc6BBdJYDBQ
	DierYgue+CWBA2D9XUV8hzL3kuZGc1dEES1madX72oufCRIsPDVsbA4ZezCKql63oItc4GbGljmlu
	SbQ3kM2+mfjualZcIHPVl/lrl9hT8cF08mHBi3dZbxtk9nmhj6t2bJuHa1gO9K4nFYlVufgcG6b1i
	ne2vYIpPEC7Th9b6b7o4gmWiWp2Z2ya9MGJShji+eBANW8dxDb1KLHgIhsr1JMEq/R192mcC1rMPu
	UXDUZRaYxzW3wlwRbqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fcb-0098rR-3X; Fri, 09 Dec 2022 15:49:09 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fSS-0093S4-LS; Fri, 09 Dec 2022 15:38:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B515240007;
	Fri,  9 Dec 2022 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670600315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEZQ7a3rtGPOj2loD/oWZkyH/UPYQamMD++xVLPyjxU=;
	b=UqeC9/7xfyDro4Vdn/TMvdKer07QL9tkNgkjMEGojQaS4CHRS7505GOMSfwaFbtJxgKiUd
	JMbDh4qigIO/mEhhwVUnJeAQHH7TusS3DZOw0gJ2jruaU92ZBTzQsqzGZJOEB+I85kryjZ
	6vlo9Q4JNO9d7LKbsbbCN80Nhm69NUeHkkhHuuVETBgSZLbc5ukg6DWCzzSpLIQBieYLJ3
	iQ9h6a4fp73rdzz3rTtjc38NQPxenYWtIiT9kAfqY1k2W7eVhdq+WIg5G+ijIV2O9Uj2/9
	DqqNmw/uBHwrUPRPqM30IxG9D57QAmsdzqCOf8/crRtAstsd+gmXY0AGkXbyWg==
Date: Fri, 9 Dec 2022 16:38:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>, "Marek Vasut"
 <marex@denx.de>, "Shawn Guo" <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "NXP Linux
 Team" <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org, "Francesco Dolcini"
 <francesco@dolcini.it>
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221209163830.4b47ccb5@xps-13>
In-Reply-To: <dbdb4417-a1cf-4613-8f7a-98b524bfdedc@app.fastmail.com>
References: <20221205152327.26881-1-francesco@dolcini.it>
	<0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
	<20221208115124.6cc7a8bf@xps-13>
	<Y5ITkZtKWHzWaLS4@francesco-nb.int.toradex.com>
	<bb4e185a-c4db-428b-a1ee-ee1ba767fffb@leemhuis.info>
	<dbdb4417-a1cf-4613-8f7a-98b524bfdedc@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_073841_073776_1016974C 
X-CRM114-Status: GOOD (  13.18  )
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

SGkgQXJuZCwKCmFybmRAYXJuZGIuZGUgd3JvdGUgb24gRnJpLCAwOSBEZWMgMjAyMiAxNjoyNToy
OCArMDEwMDoKCj4gT24gRnJpLCBEZWMgOSwgMjAyMiwgYXQgMTQ6MzAsIFRob3JzdGVuIExlZW1o
dWlzIHdyb3RlOgo+ID4gT24gMDguMTIuMjIgMTc6NDAsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3Rl
OiAgCj4gPj4gKyBBcm5kICAKPiA+Cj4gPiBBcm5kLCBoYXZlIHlvdSBzZWVuIHRoaXM/IFdlIGhh
dmVuJ3QgaGVhcmQgYW55dGhpbmcgZnJvbSBTaGF3biBhZmFpY3MsCj4gPiB3aG8gbm9ybWFsbHkg
d291bGQgdGFrZSBjYXJlIG9mIGEgcGF0Y2ggbGlrZSB0aGlzLiBIZW5jZSBjb3VsZCB5b3UKPiA+
IGNvbnNpZGVyIHBpY2tpbmcgdXAgdGhlIHBhdGNoIGF0IHRoZSBzdGFydCBvZiB0aGlzIHRocmVh
ZCAoZS5nLgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMjA1MTUyMzI3LjI2
ODgxLTEtZnJhbmNlc2NvQGRvbGNpbmkuaXQvCj4gPiApIGFuZCBzZW5kIGl0IHRvIExpbnVzIGlu
IHRoZSBuZXh0IDQ4IGhvdXJzPyBJdCBzZWVtcyBsb3ctcmlzayBhbmQgZml4ZXMKPiA+IGEgcmVn
cmVzc2lvbiBpbnRyb2R1Y2VkIHRoaXMgY3ljbGUgdmFyaW91cyBwZW9wbGUgY2FyZSBhYm91dC4g
VGhhdCdzIHdoeQo+ID4gSSdsbCBsaWtlbHkgYXNrIExpbnVzIHRvIGNvbnNpZGVyIHBpY2tpbmcg
dGhpcyB1cCBkaXJlY3RseSBiZWZvcmUKPiA+IHJlbGVhc2luZyA2LjEsIGlmIEkgZG9uJ3QgaGVh
ciBhbnl0aGluZyBmcm9tIHlvdSBzb29uLiBCdXQgSSdkIHByZWZlciBpZgo+ID4gdGhlIHBhdGNo
IHdvdWxkIGdvIHRocm91Z2ggYXQgbGVhc3Qgc29tZXdoYXQgdGhlIHByb3BlciBjaGFubmVsczsK
PiA+IGFsdGVybmF0aXZlbHkgYSBBQ0sgZnJvbSB5b3UgdG8gc2lnbmFsIExpbnVzICJ5ZWFoLCBw
aWNrIHRoaXMgdXAiIHdvdWxkCj4gPiBoZWxwIGFzIHdlbGwuICAKPiAKPiBEb25lIG5vdy4KPiAK
PiAgICBBcm5kCgpUaGFua3MgYSBsb3QuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
