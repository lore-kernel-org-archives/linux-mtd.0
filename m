Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C6CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg7AfP7DT7Jz7b5rguXASmDm3K5ex3/W1uBAQUYELoU=; b=EXt4Wir/YKR8sl
	okgi/n2clC8e2WTHas9FnwiAORopGDPlWlFZndS4NkzN2j4RXTtC2VlKylYnds77vm0brOvsKvayO
	gm/WK5LX4nYTFaIrduijoF/ovaNZ0p4MsZZMxLn4eJewDgseWsMEPByQYzzDqyl/zF4U7pesoaIji
	fwmdmzyDh1TgHCg+wqzWOHSJOo7urg8MJvvz7sWG6Pi5KvAJ/4SqnAxgXxrJJC6RaevOBI9NsPMdv
	ROnIOaNS5Jmd8UqZQMgyVhVdsPC53vjPR/tjd84n5FpuKeSKgEBPd0VuYIt+KkBL+pnZDsdb1STlb
	vUmDtidQ4BDi9HMfOy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4ldJ-00Bv6e-Mg; Tue, 04 Jan 2022 15:21:53 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ldH-00Bv5u-2H
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 15:21:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D16C200005;
 Tue,  4 Jan 2022 15:21:47 +0000 (UTC)
Date: Tue, 4 Jan 2022 16:21:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: kyungmin.park@samsung.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: onenand: Check for error irq
Message-ID: <20220104162146.38c41e06@xps13>
In-Reply-To: <20220104145854.1987853-1-jiasheng@iscas.ac.cn>
References: <20220104145854.1987853-1-jiasheng@iscas.ac.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_072151_268296_C55E97CD 
X-CRM114-Status: GOOD (  21.29  )
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

SGkgSmlhc2hlbmcsCgpqaWFzaGVuZ0Bpc2Nhcy5hYy5jbiB3cm90ZSBvbiBUdWUsICA0IEphbiAy
MDIyIDIyOjU4OjU0ICswODAwOgoKPiBBcyBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZXJlIGlzIG5v
IHN1aXRhYmxlIGlycSwgcGxhdGZvcm1fZ2V0X2lycSgpCj4gd2lsbCByZXR1cm4gZXJyb3IgbnVt
YmVyLgoKICAgICAgICAgICAgIGFuCgo+IFRoZXJlZm9yZSwgaXQgbWlnaHQgYmUgYmV0dGVyIHRv
IGNoZWNrIGl0IGFuZCByZXR1cm4gZXJyb3IgaWYgZmFpbHMKCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFuICAgICAgICBmYWlsZWQKCj4gdG8g
Z3VhcmFudGVlIHRoZSBzdWNjZXNzIG9mIHRoZSBwcm9iZS4KCmluIG9yZGVyIHRvCgpBY3R1YWxs
eSBpbiBjYXNlIG9mIGVycm9yIGl0IHdpbGwgbm90IGd1YXJhbnRlZSB0aGUgc3VjY2VzcyBvZiB0
aGUKcHJvYmUgc28gSSdtIG5vdCBzdXJlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gc29sdmUgaGVy
ZT8KCkVpdGhlciB0aGUgaXJxIGlzIG1hbmRhdG9yeSBhbmQgeW91IG1heSB3YW50IHRvIGNoZWNr
IGl0cyBwcmVzZW5jZQplYXJsaWVyLCBvciBpdCBpcyBub3QgbWFuZGF0b3J5IGFuZCB5b3UgY291
bGQgdXNlIGdldF9pcnFfb3B0aW9uYWwoKQptYXliZS4KCj4gRml4ZXM6IDI2Nzc3ZDM3MjE2YyAo
Im10ZDogTW92ZSBvbmVuYW5kIGNvZGUgYmFzZSB0byBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQi
KQoKVGhpcyBGaXhlcyB0YWcgaXMgc3RpbGwgd3JvbmcuCgo+IFNpZ25lZC1vZmYtYnk6IEppYXNo
ZW5nIEppYW5nIDxqaWFzaGVuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiBDaGFuZ2Vsb2c6Cj4gCj4g
djEgLT4gdjIKPiAKPiAqIENoYW5nZSAxLiBDaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlLgo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvZ2VuZXJpYy5jIHwgNyArKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL2dlbmVyaWMuYyBiL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9nZW5lcmljLmMKPiBpbmRleCA4YjZmNGRhNWQ3MjAuLmE0YjhiNjVmZTE1ZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvZ2VuZXJpYy5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL2dlbmVyaWMuYwo+IEBAIC01Myw3ICs1MywxMiBAQCBz
dGF0aWMgaW50IGdlbmVyaWNfb25lbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICAJfQo+ICAKPiAgCWluZm8tPm9uZW5hbmQubW1jb250cm9sID0gcGRhdGEgPyBwZGF0
YS0+bW1jb250cm9sIDogTlVMTDsKPiAtCWluZm8tPm9uZW5hbmQuaXJxID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCAwKTsKPiArCj4gKwllcnIgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+
ICsJaWYgKGVyciA8IDApCj4gKwkJZ290byBvdXRfaW91bm1hcDsKPiArCj4gKwlpbmZvLT5vbmVu
YW5kLmlycSA9IGVycjsKPiAgCj4gIAlpbmZvLT5tdGQuZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7
Cj4gIAlpbmZvLT5tdGQucHJpdiA9ICZpbmZvLT5vbmVuYW5kOwoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
