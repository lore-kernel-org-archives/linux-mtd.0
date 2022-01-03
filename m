Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3382AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrKAyG7myygaM+xSl0Qqg9weDpeekilVNC1E4oQX9jc=; b=VdwRU8yUiqI+N+
	g/eedzGUgflU3b9j1thu67YrBK6ItByRS7bnnBn+JCFxmd/TqqLl7TqY2KELKAnDzRZSf++oQuF8S
	fMA/6q7hmUlRtO5vpQdHP5femimg8Ql2pcZMS1RnVn7+AfMCM2bvS54rc2vXfB9wtQ2bChspU1h69
	aG7LkWBehBFO6QjQHwY4Vp29PcRJy2FTMOkp8zVd1vHnpR9diWtm170tn3+e8Tyf/9+jgCIXT0l7D
	sfP6ErJ4zJX6sj6H7ImgtmQszjsCIzIqAbPiCKS/1TP8m1rRoiT7FcC32LHjrY3RQVBZJcyt7a+sY
	oiFtIFrXweb4pcwBP8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QeN-009b5Y-Tu; Mon, 03 Jan 2022 16:57:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Qd7-009aVF-Hk
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 16:56:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7D4312000C;
 Mon,  3 Jan 2022 16:56:07 +0000 (UTC)
Date: Mon, 3 Jan 2022 17:56:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list), linux-wireless@vger.kernel.org
 (open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)),
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: Re: [PATCH 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Message-ID: <20220103175606.71a4eb93@xps13>
In-Reply-To: <20211223002225.3738385-5-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-5-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_085617_776176_FFE16522 
X-CRM114-Status: GOOD (  20.75  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMjIgRGVjIDIw
MjEgMTY6MjI6MjAgLTA4MDA6Cgo+IEluIG9yZGVyIHRvIGluaXRpYWxpemUgYSBnaXZlbiBjaGlw
IHNlbGVjdCBvYmplY3QgZm9yIHVzZSBieSB0aGUKPiBicmNtbmFuZCBkcml2ZXIsIG1vdmUgYWxs
IG9mIHRoZSBEZXZpY2UgVHJlZSBzcGVjaWZpYyByb3V0aW5lcyBvdXRzaWRlCj4gb2YgYnJjbW5h
bmRfaW5pdF9jcygpIGluIG9yZGVyIHRvIG1ha2UgaXQgdXNhYmxlIGluIGEgcGxhdGZvcm0gZGF0
YQo+IGNvbmZpZ3VyYXRpb24gd2hpY2ggd2lsbCBiZSBuZWNlc3NhcnkgZm9yIHN1cHBvcnRpbmcg
QkNNQSBjaGlwcy4KClRCSCBJJ20gbm90ZSBhIGJpZyBmYW4gb2YgdGhlIGlkZWEuIEknbSBub3Qg
c3VyZSBnb2luZyBiYWNrIHRvCnN1cHBvcnRpbmcgcGxhdGZvcm0gZGF0YSB0aGlzIHdheSByZWFs
bHkgaXMgYSBnb29kIGlkZWEuLi4gVGhlcmUgYXJlIHNvCm11Y2ggdGhpbmdzIHRoYXQgYXJlIHdl
bGwgZGVzY3JpYmVkIHdpdGggRFQgdGhhdCB3ZSBub3cgcmVseSB1cG9uIHRoYXQKSSBhbSBub3Qg
ZW50aXJlbHkgY29udmluY2VkIGJ5IHRoZXNlIGNoYW5nZXMgOi0vIFRoZSBtb3ZlIGlzIGdlbmVy
YWxseQppbiB0aGUgb3RoZXIgZGlyZWN0aW9uOiBnZXR0aW5nIHJpZCBvZiB0aGUgbGVnYWN5IHBs
YXRmb3JtIGRhdGEuCgo+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVs
bGlAZ21haWwuY29tPgoKQ2hlZXJzLApNaXF1w6hsCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMjAgKysrKysrKysrKystLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggMzVmOGQ4ZTAyZDRhLi42
MGE3ZjM3NWRmODMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKPiBAQCAtMjc2MCw3ICsyNzYwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBuYW5kX2NvbnRy
b2xsZXJfb3BzIGJyY21uYW5kX2NvbnRyb2xsZXJfb3BzID0gewo+ICAJLmF0dGFjaF9jaGlwID0g
YnJjbW5hbmRfYXR0YWNoX2NoaXAsCj4gIH07Cj4gIAo+IC1zdGF0aWMgaW50IGJyY21uYW5kX2lu
aXRfY3Moc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4p
Cj4gK3N0YXRpYyBpbnQgYnJjbW5hbmRfaW5pdF9jcyhzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9z
dCkKPiAgewo+ICAJc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwgPSBob3N0LT5jdHJs
Owo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gY3RybC0+ZGV2Owo+IEBAIC0yNzY5LDE2ICsyNzY5
LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9pbml0X2NzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpo
b3N0LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKmRuKQo+ICAJaW50IHJldDsKPiAgCXUxNiBjZmdfb2Zm
czsKPiAgCj4gLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihkbiwgInJlZyIsICZob3N0LT5j
cyk7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJZGV2X2VycihkZXYsICJjYW4ndCBnZXQgY2hpcC1zZWxl
Y3RcbiIpOwo+IC0JCXJldHVybiAtRU5YSU87Cj4gLQl9Cj4gLQo+ICAJbXRkID0gbmFuZF90b19t
dGQoJmhvc3QtPmNoaXApOwo+ICAJY2hpcCA9ICZob3N0LT5jaGlwOwo+ICAKPiAtCW5hbmRfc2V0
X2ZsYXNoX25vZGUoY2hpcCwgZG4pOwo+ICAJbmFuZF9zZXRfY29udHJvbGxlcl9kYXRhKGNoaXAs
IGhvc3QpOwo+ICAJbXRkLT5uYW1lID0gZGV2bV9rYXNwcmludGYoZGV2LCBHRlBfS0VSTkVMLCAi
YnJjbW5hbmQuJWQiLAo+ICAJCQkJICAgaG9zdC0+Y3MpOwo+IEBAIC0zMTc5LDcgKzMxNzIsMTYg
QEAgaW50IGJyY21uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVj
dCBicmNtbmFuZF9zb2MgKnNvYykKPiAgCQkJaG9zdC0+cGRldiA9IHBkZXY7Cj4gIAkJCWhvc3Qt
PmN0cmwgPSBjdHJsOwo+ICAKPiAtCQkJcmV0ID0gYnJjbW5hbmRfaW5pdF9jcyhob3N0LCBjaGls
ZCk7Cj4gKwkJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRuLCAicmVnIiwgJmhvc3QtPmNz
KTsKPiArCQkJaWYgKHJldCkgewo+ICsJCQkJZGV2X2VycihkZXYsICJjYW4ndCBnZXQgY2hpcC1z
ZWxlY3RcbiIpOwo+ICsJCQkJZGV2bV9rZnJlZShkZXYsIGhvc3QpOwo+ICsJCQkJY29udGludWU7
Cj4gKwkJCX0KPiArCj4gKwkJCW5hbmRfc2V0X2ZsYXNoX25vZGUoJmhvc3QtPmNoaXAsIGRuKTsK
PiArCj4gKwkJCXJldCA9IGJyY21uYW5kX2luaXRfY3MoaG9zdCk7Cj4gIAkJCWlmIChyZXQpIHsK
PiAgCQkJCWRldm1fa2ZyZWUoZGV2LCBob3N0KTsKPiAgCQkJCWNvbnRpbnVlOyAvKiBUcnkgYWxs
IGNoaXAtc2VsZWN0cyAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
