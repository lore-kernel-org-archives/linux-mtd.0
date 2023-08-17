Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED85BC27C7A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 08:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alUHB20ssjBXxmfCgFTMcuwZ0ULEg4psXRaS+nUot44=; b=M/Ympzalj0uZvp
	yR2cnVfJE+xvT3UPQg3O3c2cdl4OgfHapHaFFgx0NCH6DW6mQDifDTO26XDsj5/73J9xJBHucgKfw
	MmGgoBJFUeJWMaBu5upik+WoMgDnrkjikGwcC62wvMzA+KtFp2QgGzZ6sQYkNxv26XX8CznMj3q3a
	DawB5j83uUR2ihIXVi7jdMQRelKyyNliwtv4j+Pnh+7B6wI0UiePkoarRMMANgHCHeJMEylmKXX+n
	tyYUUGb9eDWd9d+OI0Yv/Lrl4mcXlFWuOrcI6ZOFZwwuL1uR1XUGWc4ERqcRPfAMRqPREE95vPJ44
	OLEewGzn5gLy771qLu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYPf-005pTt-0m;
	Thu, 17 Aug 2023 08:31:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYPa-005pSE-2r;
	Thu, 17 Aug 2023 08:31:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CCEE4000A;
	Thu, 17 Aug 2023 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2QxWcxDz8QQBaIieB3TDIKnaV/ESQiBsBWpBtPRVn4=;
	b=bdxpozFFU2fFnkkE/B1UBT1L01BP5ilQfq/KnE+ll1iBe/bzno0lYwYLgLmnJNgZl2sVSN
	Skfda1ztjNvDBOu6T7OZiwR89oxJNMTNwM7CNVP9ybRCDHoVlkf3jPzYl8FDRGPl3LRX4s
	a5D8NTXoQ6sSSGikstvoTUHuRHacCAOg464MHwIfYi3V4qsECjzeXKikZ0Po2DW6Kpuxrd
	gV3WmERdYPFr1PLqVZK5nK4RG2hh+ydk43QWDEzyEoqz60zM6DaeOyukH4w4l0n25b2VhS
	smob/G8UnizyJVXDGKl3DfwMenc4hpxZjwBljYoeb21ZIiDy9byizHu54mINbA==
Date: Thu, 17 Aug 2023 10:31:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <michal.simek@amd.com>,
 <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
 <frank.li@vivo.com>, <robh@kernel.org>,
 <martin.blumenstingl@googlemail.com>, <philmd@linaro.org>,
 <geert+renesas@glider.be>, <u.kleine-koenig@pengutronix.de>,
 <rogerq@kernel.org>, <paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
 <yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
 <christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
 <jinpu.wang@ionos.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 03/11] mtd: rawnand: fsmc: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103110.2042d4ff@xps-13>
In-Reply-To: <20230817024509.3951629-4-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-4-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_013123_184288_041A3E49 
X-CRM114-Status: GOOD (  15.73  )
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

SGkgTGksCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIFRodSwgMTcgQXVnIDIwMjMgMTA6
NDU6MDEgKzA4MDA6CgpBIGZldyBuaXRzIGZvciBhbGwgeW91ciBjb21taXQgbG9ncyBhc2lkZSBm
cm9tIGEgY29tbWVudCBiZWxvdzoKCj4gQWZ0ZXIgdGhlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJj
bGs6IFByb3ZpZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yCgogIFNpbmNlIGNvbW1pdAoKPiBw
cmVwYXJlZCBhbmQgZW5hYmxlZCBjbG9ja3MiKSwgaXQgY2FuIHJlcGxhY2UgdGhlIHBhaXIgb2Yg
ZnVuY3Rpb25zLAoKCQkJICAgICAgICwgZGV2bV9jbGtfZ2V0KCkgYW5kIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIAogIGNhbiBub3cgYmUgcmVwbGFjZWQgYnkgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3
aGVuIGRyaXZlciBlbmFibGUgKGFuZAogIHBvc3NpYmx5IHByZXBhcmUpIHRoZSBjbG9ja3MgZm9y
IHRoZSB3aG9sZSBsaWZldGltZSBvZiB0aGUgZGV2aWNlLgoKPiBkZXZtX2Nsa19nZXQoKSBhbmQg
Y2xrX3ByZXBhcmVfZW5hYmxlKCkgd2l0aCBhIHNpbmdsZSBoZWxwZXIgZnVuY3Rpb24KPiBkZXZt
X2Nsa19nZXRfZW5hYmxlZCgpLiBNb3Jlb3ZlciwgdGhlIGRyaXZlciB3aWxsIGtlZXBzIGEgY2xv
Y2sgcHJlcGFyZWQKPiAob3IgZW5hYmxlZCkgZHVyaW5nIHRoZSB3aG9sZSBsaWZldGltZSBvZiB0
aGUgZHJpdmVyLCBpdCBpcyB1bm5lY2Vzc2FyeSB0bwoKICBNb3Jlb3ZlciwgaXQgaXMgbm8gbG9u
Z2VyIG5lY2Vzc2FyeSB0byB1bnByZXBhcmUgYW5kIGRpc2FibGUgdGhlIGNsb2NrCiAgZXhwbGlj
aXRseS4KCj4gdW5wcmVwYXJlIGFuZCBkaXNhYmxlIGNsb2NrIGV4cGxpY2l0bHkgd2hlbiByZW1v
dmUgZHJpdmVyIG9yIGluIHRoZSBlcnJvcgo+IGhhbmRsaW5nIHBhdGguCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2ZzbWNfbmFuZC5jIHwgOCArLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2ZzbWNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMK
PiBpbmRleCA3YjQ3NDI0MjBkZmMuLmFiMWI5YTVjOTNlOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9mc21jX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bWNfbmFuZC5jCgpbLi4uXQoKPiBAQCAtMTE1Nyw3ICsxMTUzLDYgQEAgc3RhdGljIGludCBfX2lu
aXQgZnNtY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZG1h
X3JlbGVhc2VfY2hhbm5lbChob3N0LT5yZWFkX2RtYV9jaGFuKTsKPiAgZGlzYWJsZV9jbGs6CgpU
aGlzIGxhYmVsIG5vIGxvbmdlciBtYWtlcyBzZW5zZSwgcGxlYXNlIHJlbmFtZSBpdCB0byAiZGlz
YWJsZV9mc21jIiBvcgpzb21ldGhpbmcgbGlrZSB0aGF0LgoKPiAgCWZzbWNfbmFuZF9kaXNhYmxl
KGhvc3QpOwo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7Cj4gIAo+ICAJcmV0
dXJuIHJldDsKPiAgfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
