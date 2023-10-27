Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9A1C25B48
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rY/5rXrksZjMD+Wj8sws5nGc48bqradkvgtW8orvSYM=; b=dHsBd0jqizK2W6
	MUFG/mGvyoPxtADkq03V/Y0KGXN7dD60u1tEXxGgslmK9uM0pLLFWrn8cTd0HkE2oXx+tL2ovjmUt
	c3oixkiMj4HGDnrCErf2Hk+j6sMfMY2EcXwXiAmTaNBdnrelnPGyJLQbcSP+6zSzwYkIUBlGnV1uZ
	9T67V6Ka3O6/qz2J/WjRvMVIVKWBORBG4rpoPBlQ9GawA47nP+a9fGyF/Dd8hCwLGpQwFZ18iDgn4
	Pk8tHG4tELX+QoKR5PQ9Wjoh7UlCqSimu0DSh/Jzv2hrQdcweJpD2/LkcaulGoKHdqss6q35AB1H0
	NrM6H24F6pX2RrH7s8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQp8-00GqJe-15;
	Fri, 27 Oct 2023 17:40:42 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQp3-00GqIQ-38
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 17:40:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 833931C0005;
	Fri, 27 Oct 2023 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698428432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTuavapv26+tfbGeh8by9aXs/f07vbaAG5mpZ2FPn4I=;
	b=P+DlIuwxEGSq1SSx3vWDzEZti3IUvGC/CU8TgerjHY1Y2eirh1UkX9UF/K0J8LYOPEJ2z0
	HZos0kc1VMGB5zGe4dJrWrzNMCmTCbMvT9tU+gJNltKHCe3aRjHSjA8i6vrHlPa76ornMn
	SNJgUwc7lerEA+SypDym9KKTS75/Q1+xYCCHg5Iyz+zzAyQz/9ThFFBmKZyZxdTJEr0jrz
	HkTXH2t5libRjcGv9Rd3E6zaW0iz0p/gF1JKtPxhXnnj7jPaqDUnkI3JnQeLkiRzE4dakJ
	eYE3/r2xaMji6zh7WwppLlCQs4nLPBy26aLoLAj9Yy8B1kBN198fVPzovI7PaQ==
Date: Fri, 27 Oct 2023 19:40:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <Artem.Bityutskiy@nokia.com>,
 <dpervushin@embeddedalley.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <chengzhihao1@huawei.com>,
 <yi.zhang@huawei.com>, <yangerkun@huawei.com>
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by
 ftl notifier
Message-ID: <20231027194026.1bc32dfe@xps-13>
In-Reply-To: <20231027012033.50280-1-wangzhaolong1@huawei.com>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_104038_459995_315EFAD4 
X-CRM114-Status: GOOD (  18.37  )
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

SGkgWmhhb0xvbmcsCgp3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20gd3JvdGUgb24gRnJpLCAyNyBP
Y3QgMjAyMyAwOToyMDozMyArMDgwMDoKCj4gSWYgYm90aCBmbHQua28gYW5kIGdsdWViaS5rbyBh
cmUgbG9hZGVkLCB0aGUgbm90aWllciBvZiBmdGwKCmZsdCA/CQkJCQlub3RpZmllcgoKPiB0cmln
Z2VycyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0cnlpbmcgdG8gYWNjZXNzCj4g4oCY
Z2x1ZWJpLT5kZXNj4oCZIGluIGdsdWViaV9yZWFkKCkuCj4gCj4gdWJpX2dsdWViaV9pbml0Cj4g
ICB1YmlfcmVnaXN0ZXJfdm9sdW1lX25vdGlmaWVyCj4gICAgIHViaV9lbnVtZXJhdGVfdm9sdW1l
cwo+ICAgICAgIHViaV9ub3RpZnlfYWxsCj4gICAgICAgICBnbHVlYmlfbm90aWZ5ICAgIG5iLT5u
b3RpZmllcl9jYWxsKCkKPiAgICAgICAgICAgZ2x1ZWJpX2NyZWF0ZQo+ICAgICAgICAgICAgIG10
ZF9kZXZpY2VfcmVnaXN0ZXIKPiAgICAgICAgICAgICAgIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0
ZXIKPiAgICAgICAgICAgICAgICAgYWRkX210ZF9kZXZpY2UKPiAgICAgICAgICAgICAgICAgICBi
bGt0cmFuc19ub3RpZnlfYWRkICAgbm90LT5hZGQoKQo+ICAgICAgICAgICAgICAgICAgICAgZnRs
X2FkZF9tdGQgICAgICAgICB0ci0+YWRkX210ZCgpCgpHbGl0Y2hlcz8KCj4gICAgICAgICAgICAg
ICAgICAgICAgIHNjYW5faGVhZGVyCj4gICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWQK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9yZWFkX29vYgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtdGRfcmVhZF9vb2Jfc3RkCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2x1ZWJpX3JlYWQgICBtdGQtPnJlYWQoKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2x1ZWJpLT5kZXNjIC0gTlVMTAo+IAo+IERldGFpbGVkIHJlcHJvZHVjdGlvbiBp
bmZvcm1hdGlvbiBhdmFpbGFibGUgYXQgdGhlIGxpbmtbMV0sCj4gCj4gVGhlIHNvbHV0aW9uIGZv
ciB0aGUgZ2x1ZWJpIG1vZHVsZSBpcyB0byBydW4gamZmczIgb24gdGhlIFVCSQo+IHZvbHVtZSB3
aXRob3V0IGNvbnNpZGVyaW5nIHdvcmtpbmcgd2l0aCBmdGwgb3IgbXRkYmxvY2suWzJdLgoKSSBh
bSBzb3JyeSBidXQgZnRsLCBnbHVlYmksIG10ZGJsb2NrLCBqZmZzMiBhbmQgdWJpIGluIHRoZSBz
YW1lIHJlcG9ydApzZWVtIGEgbGl0dGxlIGJpdCBmdXp6eS4gQXJlIHlvdSBzdXJlIGFib3V0IHRo
aXMgc2VudGVuY2U/Cgo+IFRoZXJlZm9yZSwgdGhpcyBwcm9ibGVtIGNhbiBiZSBhdm9pZGVkIGJ5
IHByZXZlbnRpbmcgZ2x1ZWJpCj4gZnJvbSBjcmVhdGluZyBtdGRibG9jayBkZXZpY2VzLgoKVGhp
cyBzZW50ZW5jZSBzb3VuZHMgd3JvbmcgOikKCj4gRml4ZXM6IDJiYTNkNzZhMWUyOSAoIlVCSTog
bWFrZSBnbHVlYmkgYSBzZXBhcmF0ZSBtb2R1bGUiKQo+IExpbms6IGh0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE3OTkyIFsxXQo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvNDQxMTA3MTAwLjIzNzM0LjE2OTc5MDQ1ODAyNTIuSmF2YU1haWwu
emltYnJhQG5vZC5hdC8gWzJdCj4gU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3po
YW9sb25nMUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIHwg
NCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgYi9kcml2ZXJzL210
ZC9tdGRfYmxrZGV2cy5jCj4gaW5kZXggZmYxODYzNmUwODg5Li41YmMzMjEwOGNhMDMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210
ZF9ibGtkZXZzLmMKPiBAQCAtNDYzLDcgKzQ2Myw3IEBAIHN0YXRpYyB2b2lkIGJsa3RyYW5zX25v
dGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIHsKPiAgCXN0cnVjdCBtdGRfYmxrdHJh
bnNfb3BzICp0cjsKPiAgCj4gLQlpZiAobXRkLT50eXBlID09IE1URF9BQlNFTlQpCj4gKwlpZiAo
bXRkLT50eXBlID09IE1URF9BQlNFTlQgfHwgbXRkLT50eXBlID09IE1URF9VQklWT0xVTUUpCj4g
IAkJcmV0dXJuOwo+ICAKPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkodHIsICZibGt0cmFuc19tYWpv
cnMsIGxpc3QpCj4gQEAgLTUwMyw3ICs1MDMsNyBAQCBpbnQgcmVnaXN0ZXJfbXRkX2Jsa3RyYW5z
KHN0cnVjdCBtdGRfYmxrdHJhbnNfb3BzICp0cikKPiAgCW11dGV4X2xvY2soJm10ZF90YWJsZV9t
dXRleCk7Cj4gIAlsaXN0X2FkZCgmdHItPmxpc3QsICZibGt0cmFuc19tYWpvcnMpOwo+ICAJbXRk
X2Zvcl9lYWNoX2RldmljZShtdGQpCj4gLQkJaWYgKG10ZC0+dHlwZSAhPSBNVERfQUJTRU5UKQo+
ICsJCWlmIChtdGQtPnR5cGUgIT0gTVREX0FCU0VOVCAmJiBtdGQtPnR5cGUgIT0gTVREX1VCSVZP
TFVNRSkKPiAgCQkJdHItPmFkZF9tdGQodHIsIG10ZCk7Cj4gIAltdXRleF91bmxvY2soJm10ZF90
YWJsZV9tdXRleCk7Cj4gIAlyZXR1cm4gMDsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
