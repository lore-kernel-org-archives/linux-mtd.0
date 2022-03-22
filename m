Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA883C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 18:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQMNjb8Bj9Q487KhKRM6rDj9wIsrOn+vE928BFC+mLE=; b=VXQKq/xteIea5H
	y+E3p/35N4vtfhvJB9LGIvk4cIMsSyo3slSVjo+Gent+KAqmxie7/3JRIHOtGYp00SBOL2VhPYP7W
	1FX8s+zkh+0gLRy5toPvR1qsj+doSKoy4kJj0+HNROcDCC9sQn++3O2Px9KRmNVY/Q1IwHWegz7mT
	q4DVfU6jIWkhnSGkSIROEHAOx65BBS7NaUBY35ZC0/hv1dTKRr4mE5DpRRIW98Gkae3iCxXApnFj4
	cwvVZPreXw5Gv+hEak85dq1zRI0IO+YPHjBYT14UK/BE96M5K10oTDO7VH2U7UR2F1csSBV2bdGXf
	eW4FAcTGCB4uOuw+Zy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWjL4-00BsYM-BD; Tue, 22 Mar 2022 18:34:38 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWjL1-00BsWf-8X
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 18:34:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8877B20005;
 Tue, 22 Mar 2022 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647974070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgbSCiXuIqJQoCCNnMrl093Zuwu1FEnnYJnR+cktkZc=;
 b=n0vv5RxQJmq/Rxe3JF0YvJPyCBJkgSkCdRfg2IhCixIHoHGYJFA1jpcG1xqxt/WygIKRtw
 /Wm9WzFIOBMVMPtbPTGhTAzz9ltV6EVzzlO88uzcXj+oKsu7spEclpLAMUAUKMObnbzTGY
 t9sW5aJS2JDbqgo/yLsBGUwFGWA/RGov/idTUi1zoFisnJbgCdlPI74Nkot9+RUTnIqKv/
 adq78ex+dEk19KMqSLgW0cqQhSbyOhmtqPYbjWhYowkZwqzGK7M+KTZDFTLoZG32SyYpGP
 7XvulM2g+r1wzIMLsdhvxBKN6nOXDWa2nxUxpWBhZfjYh1GkwsFMuPEguo+TUw==
Date: Tue, 22 Mar 2022 19:34:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5 3/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Message-ID: <20220322193427.1b9ad36a@xps13>
In-Reply-To: <20220322021001.138206-4-ikegami.t@gmail.com>
References: <20220322021001.138206-1-ikegami.t@gmail.com>
 <20220322021001.138206-4-ikegami.t@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_113435_668208_FAD357AF 
X-CRM114-Status: GOOD (  18.03  )
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMjIgTWFyIDIw
MjIgMTE6MTA6MDEgKzA5MDA6Cgo+IEl0IGlzIGZvciB0aGUgbW9kZWwgbnVtYmVyIDAxLCAwMiwg
VjEgYW5kIFYyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWku
dEBnbWFpbC5jb20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25l
c2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiAtLS0KPiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMg
fCAxOSArKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4g
aW5kZXggNTkzMzQ1MzBkZDQ2Li42NzQ1M2Y1OWM2OWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlf
Y21kc2V0XzAwMDIuYwo+IEBAIC00OCw2ICs0OCw3IEBACj4gICNkZWZpbmUgU1NUNDlMRjA0MEIJ
CTB4MDA1MAo+ICAjZGVmaW5lIFNTVDQ5TEYwMDhBCQkweDAwNWEKPiAgI2RlZmluZSBBVDQ5QlY2
NDE2CQkweDAwZDYKPiArI2RlZmluZSBTMjlHTDA2NE5fTU4xMgkJMHgwYzAxCj4gIAo+ICAvKgo+
ICAgKiBTdGF0dXMgUmVnaXN0ZXIgYml0IGRlc2NyaXB0aW9uLiBVc2VkIGJ5IGZsYXNoIGRldmlj
ZXMgdGhhdCBkb24ndAo+IEBAIC00NDUsNyArNDQ2LDcgQEAgc3RhdGljIHZvaWQgZml4dXBfcXVp
cmtzKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJc3RydWN0IG1hcF9pbmZvICptYXAgPSBtdGQt
PnByaXY7Cj4gIAlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsKPiAg
Cj4gLQlpZiAoY2ZpLT5tZnIgPT0gQ0ZJX01GUl9BTUQgJiYgY2ZpLT5pZCA9PSAweDBjMDEpCj4g
KwlpZiAoY2ZpLT5tZnIgPT0gQ0ZJX01GUl9BTUQgJiYgY2ZpLT5pZCA9PSBTMjlHTDA2NE5fTU4x
MikKPiAgCQljZmktPnF1aXJrcyB8PSBDRklfUVVJUktfRFFfVFJVRV9EQVRBOwo+ICB9Cj4gIAo+
IEBAIC00NzUsNyArNDc2LDcgQEAgc3RhdGljIHN0cnVjdCBjZmlfZml4dXAgY2ZpX2ZpeHVwX3Rh
YmxlW10gPSB7Cj4gIAl7IENGSV9NRlJfQU1ELCAweDAwNTYsIGZpeHVwX3VzZV9zZWNzaSB9LAo+
ICAJeyBDRklfTUZSX0FNRCwgMHgwMDVDLCBmaXh1cF91c2Vfc2Vjc2kgfSwKPiAgCXsgQ0ZJX01G
Ul9BTUQsIDB4MDA1RiwgZml4dXBfdXNlX3NlY3NpIH0sCj4gLQl7IENGSV9NRlJfQU1ELCAweDBj
MDEsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzIH0sCj4gKwl7IENGSV9NRlJfQU1ELCBTMjlHTDA2
NE5fTU4xMiwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4
MTMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4MWEw
MCwgZml4dXBfczI5Z2wwMzJuX3NlY3RvcnMgfSwKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4MWEwMSwg
Zml4dXBfczI5Z2wwMzJuX3NlY3RvcnMgfSwKPiBAQCAtODMzLDcgKzgzNCw3IEBAIHN0YXRpYyBp
bnQgX194aXByYW0gY2hpcF9yZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hp
cCAqY2hpcCwKPiAgCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgbWFwX3dvcmQgKmV4cGVj
dGVkKQo+ICB7Cj4gIAlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9IG1hcC0+ZmxkcnZfcHJpdjsK
PiAtCW1hcF93b3JkIGQsIHQ7Cj4gKwltYXBfd29yZCBvbGRkLCBjdXJkOwo+ICAJaW50IHJldDsK
PiAgCj4gIAlpZiAoY2ZpX3VzZV9zdGF0dXNfcmVnKGNmaSkpIHsKPiBAQCAtODQ0LDIwICs4NDUs
MjAgQEAgc3RhdGljIGludCBfX3hpcHJhbSBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFw
LCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+ICAJCSAqLwo+ICAJCWNmaV9zZW5kX2dlbl9jbWQoMHg3
MCwgY2ZpLT5hZGRyX3VubG9jazEsIGNoaXAtPnN0YXJ0LCBtYXAsIGNmaSwKPiAgCQkJCSBjZmkt
PmRldmljZV90eXBlLCBOVUxMKTsKPiAtCQl0ID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKPiArCQlj
dXJkID0gbWFwX3JlYWQobWFwLCBhZGRyKTsKPiAgCj4gLQkJcmV0dXJuIG1hcF93b3JkX2FuZGVx
dWFsKG1hcCwgdCwgcmVhZHksIHJlYWR5KTsKPiArCQlyZXR1cm4gbWFwX3dvcmRfYW5kZXF1YWwo
bWFwLCBjdXJkLCByZWFkeSwgcmVhZHkpOwo+ICAJfQo+ICAKPiAtCWQgPSBtYXBfcmVhZChtYXAs
IGFkZHIpOwo+IC0JdCA9IG1hcF9yZWFkKG1hcCwgYWRkcik7Cj4gKwlvbGRkID0gbWFwX3JlYWQo
bWFwLCBhZGRyKTsKPiArCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+ICAKPiAtCXJldCA9
IG1hcF93b3JkX2VxdWFsKG1hcCwgZCwgdCk7Cj4gKwlyZXQgPSBtYXBfd29yZF9lcXVhbChtYXAs
IG9sZGQsIGN1cmQpOwo+ICAKPiAgCWlmICghcmV0IHx8ICFleHBlY3RlZCkKPiAgCQlyZXR1cm4g
cmV0Owo+ICAKPiAtCXJldHVybiBtYXBfd29yZF9lcXVhbChtYXAsIHQsICpleHBlY3RlZCk7Cj4g
KwlyZXR1cm4gbWFwX3dvcmRfZXF1YWwobWFwLCBjdXJkLCAqZXhwZWN0ZWQpOwoKTG9va3MgbGlr
ZSB0aGVyZSBpcyBhIHJlYmFzZSBpc3N1ZS4KCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgX194aXBy
YW0gY2hpcF9nb29kKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
