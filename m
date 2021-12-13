Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF238C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d32yg0hXQjT/0pi6s7wgdzO8V4SZBuEHbaJQgchh0Zw=; b=UXg6kaNmHttOEf
	h93s+AUr8VXrrR5fSDXEH7MilW2zCVC48rr06sGlJjw5rHh8AnEyOaPaJhBlkYHW91ccd4j9TCdT4
	oyEKsDJeT9AkUO1nA4L6FDJ9znK+O/kmdRJ1xe0cLAIdUF/iF0mM4imE6Qk80FMwCeS0fRo5cgNCm
	KqplUg1tCkSrC5Z9Ty1hTToi95bXn8svWkns6fPP5/iqZSJmlhWl17+2SnHsHZzPtQEjxEv+waqtD
	yFaC1Uw768ti33lMRC6WXIZYx8SQbvIx/Npd/3sOFi5TNSZXQ3LmwjOIY5l08tJAAuW8zrRwFESfR
	vmJSk220WUO3xgNKDcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwj4B-0099hd-ID; Mon, 13 Dec 2021 11:00:23 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwj48-0099gk-0X
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 11:00:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5811D24001E;
 Mon, 13 Dec 2021 11:00:08 +0000 (UTC)
Date: Mon, 13 Dec 2021 12:00:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com
Cc: chi.minghao@zte.com.cn, han.xu@nxp.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 zealci@zte.com.cn
Subject: Re: [PATCH nand-next v2] mtd: rawnand: gpmi: remove unneeded variable
Message-ID: <20211213120007.6729afc4@xps13>
In-Reply-To: <20211213104930.436602-1-chi.minghao@zte.com.cn>
References: <20211213101519.25f4e2e1@xps13>
 <20211213104930.436602-1-chi.minghao@zte.com.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_030020_235081_CC880C9A 
X-CRM114-Status: GOOD (  12.24  )
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

SGVsbG8sCgpjZ2VsLnp0ZUBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAxMyBEZWMgMjAyMSAxMDo0
OTozMCArMDAwMDoKCj4gRnJvbTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+
Cj4gCj4gUmV0dXJuIHN0YXR1cyBkaXJlY3RseSBmcm9tIGZ1bmN0aW9uIGNhbGxlZC4KPiBjaGFu
Z2Ugc2luY2UgdjE6IG10ZC9uYW5kOnJlbW92ZSB1bm5lZWRlZCB2YXJpYWJsZQo+ICAgICAgICAg
ICAgICB2MjogbXRkOiByYXduYW5kOiBncG1pOiByZW1vdmUgdW5uZWVkZWQgdmFyaWFibGUKClRo
YW5rcyBmb3IgcHJvdmlkaW5nIGEgY2hhbmdlbG9nLCB0aGlzIGlzIGluZGVlZCB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8uCkhvd2V2ZXIgaXQgc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBjb21taXQg
bWVzc2FnZSBhbmQgaGVuY2Ugbm90IGJlCmxvY2F0ZWQgaGVyZS4uLgoKPiAKPiBSZXBvcnRlZC1i
eTogWmVhbCBSb2JvdCA8emVhbGNpQHp0ZS5jb20uY24+Cj4gU2lnbmVkLW9mZi1ieTogTWluZ2hh
byBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+Cj4gLS0tCgouLi4gYnV0IGhlcmUhCgpBbnl0
aGluZyBiZWxvdyB0aGVzZSB0aHJlZSBkYXNoZXMgJy0tLScgd2lsbCBiZSBpZ25vcmVkIGJ5IEdp
dC4KCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDUgKy0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBpbmRleCAxMGNj
NzE4MjlkY2IuLmFiOWQxMDk5YmFmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1p
LW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAtMTQyNSw3ICsxNDI1LDYgQEAgc3RhdGljIGludCBncG1p
X2VjY193cml0ZV9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1
ZiwKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7Cj4gIAlzdHJ1
Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7
Cj4gIAlzdHJ1Y3QgYmNoX2dlb21ldHJ5ICpuZmNfZ2VvID0gJnRoaXMtPmJjaF9nZW9tZXRyeTsK
PiAtCWludCByZXQ7Cj4gIAo+ICAJZGV2X2RiZyh0aGlzLT5kZXYsICJlY2Mgd3JpdGUgcGFnZS5c
biIpOwo+ICAKPiBAQCAtMTQ0NSw5ICsxNDQ0LDcgQEAgc3RhdGljIGludCBncG1pX2VjY193cml0
ZV9wYWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwKPiAgCQkJ
CSAgICB0aGlzLT5hdXhpbGlhcnlfdmlydCk7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gbmFuZF9wcm9n
X3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwgYnVmLCBuZmNfZ2VvLT5wYWdlX3NpemUpOwo+IC0KPiAt
CXJldHVybiByZXQ7Cj4gKwlyZXR1cm4gbmFuZF9wcm9nX3BhZ2Vfb3AoY2hpcCwgcGFnZSwgMCwg
YnVmLCBuZmNfZ2VvLT5wYWdlX3NpemUpOwo+ICB9Cj4gIAo+ICAvKgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
