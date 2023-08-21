Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE571EE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDH/m6gtQGa2mo+Hnbw8bVElGpioQvMFDGxRMuUbshY=; b=xhBBoVToi/KWer
	e78MjqvoZw9P2MATiYzwCMfPqFhCnh3VSBCVw9D8zKnss9YG0qOVuNQ3+iviJDLgw4lXU4Po2X9EY
	DAihOiiGrIPUjt3/sckKj6YxJYIohYd4rbCIlPYpdhxXOZ/9woaUy45LPGtjvJWQbpkvk7WeuI0b6
	PhbU5mqNDTHCvSUriq8VghuglMYoqL0Ho7CMPDzuzHhi+AH8lEgzZzRVkNXnoIN30FyqUaU0znqSy
	qUP3oln51xLwUaLuAlef+GBUA6m12E/IiM4IxMq6pc91jtYerBq3xEaAUhQCS3GkmU7NJ5aUXA+9+
	vmoQM5NQrUKLCMYYo+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzUl-00DMpt-0j;
	Mon, 21 Aug 2023 07:38:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzUg-00DMoe-2W;
	Mon, 21 Aug 2023 07:38:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 792C92000D;
	Mon, 21 Aug 2023 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692603510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QK3U5LxVPsGAtMpHf99XsK3RWiIrIgeXRCnQNtREf94=;
	b=IyoUAE5wemosA3+nhqaCdLSyUqJGm03o6EPOIsUaupaO3ylJcHnZcxVlzE28kcX6ITK8ps
	Q0GeWeku+SYHd79w95phK1UTiaNVU5WOXmzxa42AxM2sDqj+vQR4l1ZEyzOf6jjcIR0M08
	OMrHgLhJRxvMnne+/++Yzq9UhGGGXrwdAccc2BP7u8Xf/Jq0aE/YP2t8XNsBODbHvlZav5
	K4sbqPdJrty/sW4PyokWyo5vxNckSq8L9myGxdqKFLmPAdj4obA3kUGVKwMoXMSglds/3w
	NUOaYoMwyelaAgmYJxInrAKqam37BJWfbQ9zq3ghDmRcbt/a7EojbJOW77vC8w==
Date: Mon, 21 Aug 2023 09:38:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <alexandre.torgue@foss.st.com>,
 <angelogioacchino.delregno@collabora.com>,
 <christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
 <dmitry.torokhov@gmail.com>, <frank.li@vivo.com>,
 <geert+renesas@glider.be>, <heiko@sntech.de>, <jernej.skrabec@gmail.com>,
 <jinpu.wang@ionos.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
 <mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
 <paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
 <richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
 <samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
 <u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
 <wens@csie.org>, <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v3 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Message-ID: <20230821093825.22280e33@xps-13>
In-Reply-To: <20230821031737.1973183-12-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
	<20230821031737.1973183-1-lizetao1@huawei.com>
	<20230821031737.1973183-12-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_003835_085795_872ADC74 
X-CRM114-Status: GOOD (  18.80  )
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

SGkgVHVkb3IsCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIE1vbiwgMjEgQXVnIDIwMjMg
MTE6MTc6MzYgKzA4MDA6Cgo+IFNpbmNlIGNvbW1pdCA3ZWY5NjUxZTk3OTIgKCJjbGs6IFByb3Zp
ZGUgbmV3IGRldm1fY2xrIGhlbHBlcnMgZm9yIHByZXBhcmVkCj4gYW5kIGVuYWJsZWQgY2xvY2tz
IiksIGRldm1fY2xrX2dldCgpIGFuZCBjbGtfcHJlcGFyZV9lbmFibGUoKSBjYW4gbm93IGJlCj4g
cmVwbGFjZWQgYnkgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSB3aGVuIGRyaXZlciBlbmFibGVzIChh
bmQgcG9zc2libHkKPiBwcmVwYXJlcykgdGhlIGNsb2NrcyBmb3IgdGhlIHdob2xlIGxpZmV0aW1l
IG9mIHRoZSBkZXZpY2UuIE1vcmVvdmVyLCBpdCBpcwo+IG5vIGxvbmdlciBuZWNlc3NhcnkgdG8g
dW5wcmVwYXJlIGFuZCBkaXNhYmxlIHRoZSBjbG9ja3MgZXhwbGljaXRseSwgc28gZHJvcAo+IHRo
ZSBsYWJlbCAiZGlzX2Nsa3MiIGFuZCAiZGlzX2Nsa19yZWciLgoKVGhpcyBwYXRjaCBzZWVtcyB2
ZXJ5IHNpbXBsZSwgZG8geW91IG1pbmQgaWYgSSBhcHBseSBpdCBkaXJlY3RseSBpbnRvCm10ZC9u
ZXh0IGZvciB0aGUgbmV4dCBQUj8KClRoYW5rcywKTWlxdcOobAoKPiBSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBM
aSBaZXRhbyA8bGl6ZXRhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MiAtPiB2MzogTW9kaWZ5IHRo
ZSBzeW50YXggZXJyb3IgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+IHYyOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMzA4MTgwNzQ2NDIuMzA4MTY2LTEyLWxpemV0YW8xQGh1YXdlaS5j
b20vCj4gdjEgLT4gdjI6IE1vZGlmeSBjb21taXQgbWVzc2FnZS4KPiB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjMwODE3MDI0NTA5LjM5NTE2MjktMTItbGl6ZXRhbzFAaHVhd2Vp
LmNvbS8KPiAKPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyB8
IDMzICsrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvbnhwLXNwaWZpLmMKPiBpbmRleCAzMzdlODNiZjMzNjIuLjVkOGY0N2FiMTQ2ZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL254cC1zcGlmaS5jCj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYwo+IEBAIC0zOTQs
MzAgKzM5NCwxOCBAQCBzdGF0aWMgaW50IG54cF9zcGlmaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihzcGlmaS0+Zmxhc2hfYmFzZSkpCj4gIAkJcmV0
dXJuIFBUUl9FUlIoc3BpZmktPmZsYXNoX2Jhc2UpOwo+ICAKPiAtCXNwaWZpLT5jbGtfc3BpZmkg
PSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInNwaWZpIik7Cj4gKwlzcGlmaS0+Y2xrX3NwaWZp
ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgInNwaWZpIik7Cj4gIAlpZiAoSVNf
RVJSKHNwaWZpLT5jbGtfc3BpZmkpKSB7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAic3BpZmkg
Y2xvY2sgbm90IGZvdW5kXG4iKTsKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJzcGlmaSBjbG9j
ayBub3QgZm91bmQgb3IgdW5hYmxlIHRvIGVuYWJsZVxuIik7Cj4gIAkJcmV0dXJuIFBUUl9FUlIo
c3BpZmktPmNsa19zcGlmaSk7Cj4gIAl9Cj4gIAo+IC0Jc3BpZmktPmNsa19yZWcgPSBkZXZtX2Ns
a19nZXQoJnBkZXYtPmRldiwgInJlZyIpOwo+ICsJc3BpZmktPmNsa19yZWcgPSBkZXZtX2Nsa19n
ZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCAicmVnIik7Cj4gIAlpZiAoSVNfRVJSKHNwaWZpLT5jbGtf
cmVnKSkgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgInJlZyBjbG9jayBub3QgZm91bmRcbiIp
Owo+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgInJlZyBjbG9jayBub3QgZm91bmQgb3IgdW5hYmxl
IHRvIGVuYWJsZVxuIik7Cj4gIAkJcmV0dXJuIFBUUl9FUlIoc3BpZmktPmNsa19yZWcpOwo+ICAJ
fQo+ICAKPiAtCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShzcGlmaS0+Y2xrX3JlZyk7Cj4gLQlp
ZiAocmV0KSB7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIGVuYWJsZSByZWcg
Y2xvY2tcbiIpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQo+IC0JcmV0ID0gY2xrX3ByZXBh
cmVfZW5hYmxlKHNwaWZpLT5jbGtfc3BpZmkpOwo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIo
JnBkZXYtPmRldiwgInVuYWJsZSB0byBlbmFibGUgc3BpZmkgY2xvY2tcbiIpOwo+IC0JCWdvdG8g
ZGlzX2Nsa19yZWc7Cj4gLQl9Cj4gLQo+ICAJc3BpZmktPmRldiA9ICZwZGV2LT5kZXY7Cj4gIAlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBzcGlmaSk7Cj4gIAo+IEBAIC00MzAsMjQgKzQxOCwx
NyBAQCBzdGF0aWMgaW50IG54cF9zcGlmaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJZmxhc2hfbnAgPSBvZl9nZXRfbmV4dF9hdmFpbGFibGVfY2hpbGQocGRldi0+ZGV2
Lm9mX25vZGUsIE5VTEwpOwo+ICAJaWYgKCFmbGFzaF9ucCkgewo+ICAJCWRldl9lcnIoJnBkZXYt
PmRldiwgIm5vIFNQSSBmbGFzaCBkZXZpY2UgdG8gY29uZmlndXJlXG4iKTsKPiAtCQlyZXQgPSAt
RU5PREVWOwo+IC0JCWdvdG8gZGlzX2Nsa3M7Cj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gIAl9Cj4g
IAo+ICAJcmV0ID0gbnhwX3NwaWZpX3NldHVwX2ZsYXNoKHNwaWZpLCBmbGFzaF9ucCk7Cj4gIAlv
Zl9ub2RlX3B1dChmbGFzaF9ucCk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAidW5hYmxlIHRvIHNldHVwIGZsYXNoIGNoaXBcbiIpOwo+IC0JCWdvdG8gZGlzX2Nsa3M7
Cj4gKwkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gIAlyZXR1cm4gMDsKPiAtCj4gLWRpc19jbGtz
Ogo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNwaWZpLT5jbGtfc3BpZmkpOwo+IC1kaXNfY2xr
X3JlZzoKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShzcGlmaS0+Y2xrX3JlZyk7Cj4gLQlyZXR1
cm4gcmV0Owo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IG54cF9zcGlmaV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiBAQCAtNDU1LDggKzQzNiw2IEBAIHN0YXRpYyBpbnQgbnhw
X3NwaWZpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IG54
cF9zcGlmaSAqc3BpZmkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgCj4gIAltdGRf
ZGV2aWNlX3VucmVnaXN0ZXIoJnNwaWZpLT5ub3IubXRkKTsKPiAtCWNsa19kaXNhYmxlX3VucHJl
cGFyZShzcGlmaS0+Y2xrX3NwaWZpKTsKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShzcGlmaS0+
Y2xrX3JlZyk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
