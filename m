Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365E7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPqkRYg38F9Loiue+PeanPH6LTnDJfLQPxIyalsyOe4=; b=Z5xBgnXzXFYmwK
	P24ELYwixtnVPpp344W8OcB3RCLYrCVBcr1hPh2txq5EXsYruJ96BxTwtt1K1eGaVHP3LR7+KPVT0
	NuWXMmvNJhnyTtanbogtsWEyXb0jLTeG/ercGMq7NeZSyTTK827L1J81MIQhIunHi5kJmp/OFX8/h
	CHnfM0bUoB6S8lY0flAeJIMUdrc50X6FUg86L9FvR1RHEm9UURcE50cRfbOzu3lZojj3o90OyqLGI
	DzplokNyggu7V1JLMe8oGVIr+km92tb/vP7YPc8HnTmUFsXU1mEPs9mLKWYt0yEkPrS/5NKB+tC8Z
	/bOncL5dc2mG3qLLEsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwhUl-008aYu-8W; Mon, 13 Dec 2021 09:19:43 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhRO-008ZF6-Bi
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 09:16:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3E44E200003;
 Mon, 13 Dec 2021 09:16:10 +0000 (UTC)
Date: Mon, 13 Dec 2021 10:16:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com
Cc: han.xu@nxp.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Minghao Chi
 <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH nand-next] mtd/nand:remove unneeded variable
Message-ID: <20211213101519.25f4e2e1@xps13>
In-Reply-To: <20211210021822.423833-1-chi.minghao@zte.com.cn>
References: <20211210021822.423833-1-chi.minghao@zte.com.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_011614_580958_D16ACD26 
X-CRM114-Status: GOOD (  10.52  )
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

SGVsbG8sCgpjZ2VsLnp0ZUBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAxMCBEZWMgMjAyMSAwMjox
ODoyMiArMDAwMDoKCj4gRnJvbTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+
Cj4gCj4gUmV0dXJuIHN0YXR1cyBkaXJlY3RseSBmcm9tIGZ1bmN0aW9uIGNhbGxlZC4KClRoZSBz
dWJqZWN0IHByZWZpeCBzaG91bGQgYmUgIm10ZDogcmF3bmFuZDogZ3BtaTogIgoKPiAKPiBSZXBv
cnRlZC1ieTogWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY20+Cj4gU2lnbmVkLW9mZi1ieTog
TWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDUgKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBpbmRleCAxMGNjNzE4MjlkY2IuLmFiOWQxMDk5
YmFmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMK
PiBAQCAtMTQyNSw3ICsxNDI1LDYgQEAgc3RhdGljIGludCBncG1pX2VjY193cml0ZV9wYWdlKHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKPiAgCXN0cnVjdCBtdGRf
aW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Cj4gIAlzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEg
KnRoaXMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gIAlzdHJ1Y3QgYmNoX2dl
b21ldHJ5ICpuZmNfZ2VvID0gJnRoaXMtPmJjaF9nZW9tZXRyeTsKPiAtCWludCByZXQ7Cj4gIAo+
ICAJZGV2X2RiZyh0aGlzLT5kZXYsICJlY2Mgd3JpdGUgcGFnZS5cbiIpOwo+ICAKPiBAQCAtMTQ0
NSw5ICsxNDQ0LDcgQEAgc3RhdGljIGludCBncG1pX2VjY193cml0ZV9wYWdlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKPiAgCQkJCSAgICB0aGlzLT5hdXhpbGlh
cnlfdmlydCk7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gbmFuZF9wcm9nX3BhZ2Vfb3AoY2hpcCwgcGFn
ZSwgMCwgYnVmLCBuZmNfZ2VvLT5wYWdlX3NpemUpOwo+IC0KPiAtCXJldHVybiByZXQ7Cj4gKwly
ZXR1cm4gbmFuZF9wcm9nX3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwgYnVmLCBuZmNfZ2VvLT5wYWdl
X3NpemUpOwo+ICB9Cj4gIAo+ICAvKgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
