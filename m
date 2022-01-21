Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jan 2022 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBkLKdDPA0bhowz5j8na9KTcoIEJBJctot5BsYj3KFs=; b=Kjx3N0iyFxMllr
	LoBy4hrzoOarHdyg4uz2XpRhmHh0mb0zWf7v2oBqMObqWvcUP5Ydzk1nSUmA6w/LECyREsTe4NvfU
	8QDo/cN/N8PQJwzckUhj93bbA5N74cNXKCFhg3FbV07fAph7vwViSTzMlUY2LxbjXAKACe6n5Zcdk
	BvGwVkSQPNTLvpEko6Ry4Lh12nNwyj88quXV6KDvXl6DkIoPcOgp0zvazVkPcCKFbwEQSzXch9f5p
	Lk3cgRsYttJjvxL5Shg1McQLNghRaED5oIhvQmWrbAoqaE4r+5/rJm1pBkVhvu6rEa1GLgpyi9CXn
	KAamxqST//stdorQ5CbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nArvg-00Ekt0-1k; Fri, 21 Jan 2022 11:18:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nArvc-00Ekrn-22
 for linux-mtd@lists.infradead.org; Fri, 21 Jan 2022 11:18:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3595A240002;
 Fri, 21 Jan 2022 11:17:49 +0000 (UTC)
Date: Fri, 21 Jan 2022 12:17:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joern Engel <joern@lazybastard.org>, yangerkun <yangerkun@huawei.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220121121748.24e98015@xps13>
In-Reply-To: <20220121053836.GA27293@kili>
References: <20220121053836.GA27293@kili>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_031800_277932_C3A3EC82 
X-CRM114-Status: GOOD (  21.49  )
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

SGkgRGFuLAoKZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tIHdyb3RlIG9uIEZyaSwgMjEgSmFuIDIw
MjIgMDg6Mzg6MzYgKzAzMDA6Cgo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgImVyYXNlc2l6ZSIgaXMg
YSB1aW50MzJfdCB0eXBlIHNvIGl0IG1pZ2h0IGJlCgpEb24ndCB5b3UgbWVhbiB1aW50NjRfdCBo
ZXJlPyBPdGhlcndpc2UgSSBkb24ndCBnZXQgdGhlIHNlbnRlbmNlLgoKPiBub24temVybyBidXQg
dGhlIHRydW5jYXRlZCAiKHVpbnQzMl90KWVyYXNlc2l6ZSIgdmFsdWUgKmlzKiB6ZXJvLiBUaGF0
CgpzLyppcyovKmNhbiogYmUvID8gKGFnYWluLCBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJl
Y3QpLgoKPiB3b3VsZCBsZWFkIHRvIHRoZSBkaXZpZGUgYnkgemVybyBidWcuCj4gCj4gQXZvaWQg
dGhlIGJ1ZyBieSBkZWxheWluZyB0aGUgZGl2aWRlIHVudGlsIGFmdGVyIHdlIGhhdmUgdmFsaWRh
dGVkCj4gdGhhdCAiZXJhc2VzaXplIiBpcyByZWFzb25hYmxlLgoKSSBkb24ndCByZWFsbHkgZ2V0
IHRoZSBmaXguIElmICJlcmFzZXNpemUiIGlzIGJpZyBlbm91Z2gsIHRoZW4KKHVpbnQzMl90KWVy
YXNlc2l6ZSBjYW4gaG93ZXZlciBiZSB6ZXJvLiBCdXQgY2hlY2tpbmcgaWYgZXJhc2VzaXplIGlz
Cnplcm8gYmVmb3JlaGFuZHMgZG9lcyBub3QgZml4IHRoZSBzaXR1YXRpb24uIE9yIGFtIEkgbWlz
c2luZwpzb21ldGhpbmc/Cgo+IEZpeGVzOiBkYzJiM2U1Y2JjODAgKCJtdGQ6IHBocmFtOiB1c2Ug
ZGl2X3U2NF9yZW0gdG8gc3RvcCBvdmVyd3JpdGUgbGVuIGluIHBocmFtX3NldHVwIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyB8IDEyICsrKysrKysrLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3Bo
cmFtLmMKPiBpbmRleCA2ZWQ2YzUxZmFjNjkuLmQ1MDM4MjFhM2U2MCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3Bo
cmFtLmMKPiBAQCAtMjY0LDE2ICsyNjQsMjAgQEAgc3RhdGljIGludCBwaHJhbV9zZXR1cChjb25z
dCBjaGFyICp2YWwpCj4gIAkJfQo+ICAJfQo+ICAKPiAtCWlmIChlcmFzZXNpemUpCj4gLQkJZGl2
X3U2NF9yZW0obGVuLCAodWludDMyX3QpZXJhc2VzaXplLCAmcmVtKTsKPiAtCj4gIAlpZiAobGVu
ID09IDAgfHwgZXJhc2VzaXplID09IDAgfHwgZXJhc2VzaXplID4gbGVuCj4gLQkgICAgfHwgZXJh
c2VzaXplID4gVUlOVF9NQVggfHwgcmVtKSB7Cj4gKwkgICAgfHwgZXJhc2VzaXplID4gVUlOVF9N
QVgpIHsKPiAgCQlwYXJzZV9lcnIoImlsbGVnYWwgZXJhc2VzaXplIG9yIGxlblxuIik7Cj4gIAkJ
cmV0ID0gLUVJTlZBTDsKPiAgCQlnb3RvIGVycm9yOwo+ICAJfQo+ICAKPiArCWRpdl91NjRfcmVt
KGxlbiwgKHVpbnQzMl90KWVyYXNlc2l6ZSwgJnJlbSk7Cj4gKwlpZiAocmVtKSB7Cj4gKwkJcGFy
c2VfZXJyKCJsZW4gaXMgbm90IG11bHRpcGxlIG9mIGVyYXNlc2l6ZVxuIik7Cj4gKwkJcmV0ID0g
LUVJTlZBTDsKPiArCQlnb3RvIGVycm9yOwo+ICsJfQo+ICsKPiAgCXJldCA9IHJlZ2lzdGVyX2Rl
dmljZShuYW1lLCBzdGFydCwgbGVuLCAodWludDMyX3QpZXJhc2VzaXplKTsKPiAgCWlmIChyZXQp
Cj4gIAkJZ290byBlcnJvcjsKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
