Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D254FC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0C8iCOyEa7s67ucxwOoCFlnXfQ6BsFEfHhisOCLhQpo=; b=teEr8VLQcZAXOG
	+mjePfVF0OvZSIuKOl1jkHsTOzwWtJKREveyXZNIv0/htNoKvw9QXmSRMs/PO9pYuYfUPCkVvktSP
	4n4kSvV2O0q+ko7Ny0meXw5F9oIUdQ412L4dcU1lv5cqfo9qBYN8uP7Sg8zObiEHWQorUVNMQfwgA
	vxMTI/xCvoDVkdCHacsvdHbMsW9HhgVyVrssQxEqbfz+H8Blh54cHAELaOa4LbVFwJGoMkArSt2p6
	nKNQkRAAHH5VxUx6dgIqBYz8wjPHxTBxkhSAeT0zwW+3XaV/SI8J8jTOWHHkiOWXhheANW/FBxGxA
	ENzVY0iPmAYzvK4pepLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUC3z-00AI8u-Ms; Tue, 15 Mar 2022 18:38:32 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUC3H-00AHp0-FV
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 18:37:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 682EE200006;
 Tue, 15 Mar 2022 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647369463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMKN+S1zQ1BUUht7KY+wWKQdkgbIiU82rvmNG3ljECs=;
 b=OoDwvPfSt52I6gQmHQSZbTuJG9t13h3ITcSXCadMS24RJ30nP5pHoy0MciFuogG2e6joqG
 eOnGB/BvknB992TlS7G9IRYxij2vxJM1SXRqZ0dKfHpZYNDOZ8sAL9b2HX20pajXSMg986
 ULieF4r8wkbYIYUHW70vJe/QcRvoVYig0xQ2fyB8gHENSBx1IL2JN2jfBvEqc1WMhfpYAN
 upcWT7ugrz/5vHQ/Jss+3rI4sMFbhcVAXWU/9Y3CAr1PnjuQGbQlQhLApvMjTeDsb4FA5F
 EgCumRYkFhu1dzPmnkwMqZjmzOgeyw9QPvnDG0lz1DyHV+WTr2hhgSG8QSUIjA==
Date: Tue, 15 Mar 2022 19:37:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Message-ID: <20220315193740.23284a20@xps13>
In-Reply-To: <20220315165607.390070-2-ikegami.t@gmail.com>
References: <20220315165607.390070-1-ikegami.t@gmail.com>
 <20220315165607.390070-2-ikegami.t@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_113747_757799_7A394EE6 
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTYgTWFyIDIw
MjIgMDE6NTY6MDUgKzA5MDA6Cgo+IEl0IGlzIGZvciB0aGUgbW9kZWwgbnVtYmVyIDAxLCAwMiwg
VjEgYW5kIFYyLgoKUGxlYXNlIG1vdmUgdGhpcyBjaGFuZ2UgdG8gdGhlIGVuZCBvZiB0aGUgc2Vy
aWVzLiBXZSBkbyBub3QgbmVlZCB0bwpiYWNrcG9ydCB0aGlzIGltcHJvdmVtZW50LgoKQWxzbyB1
c2UgdGhlIGhleGFkZWNpbWFsIHZhbHVlIGluIHlvdXIgZml4IChwYXRjaCAzLzMpIHNvIHRoYXQg
d2UgY2FuCmFwcGx5IGl0IGVhc2lseSB0byBvbGRlciBrZXJuZWxzLgoKPiBTaWduZWQtb2ZmLWJ5
OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21haWwuY29tPgo+IENjOiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5j
b20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGRyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jCj4gaW5kZXggYTc2MTEzNGZkM2JlLi4wMTI1NjU4YTFkMzAgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiArKysgYi9kcml2ZXJzL210ZC9j
aGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+IEBAIC00OCw2ICs0OCw3IEBACj4gICNkZWZpbmUgU1NU
NDlMRjA0MEIJCTB4MDA1MAo+ICAjZGVmaW5lIFNTVDQ5TEYwMDhBCQkweDAwNWEKPiAgI2RlZmlu
ZSBBVDQ5QlY2NDE2CQkweDAwZDYKPiArI2RlZmluZSBTMjlHTDA2NE5fTU4xMgkJMHgwYzAxCj4g
IAo+ICAvKgo+ICAgKiBTdGF0dXMgUmVnaXN0ZXIgYml0IGRlc2NyaXB0aW9uLiBVc2VkIGJ5IGZs
YXNoIGRldmljZXMgdGhhdCBkb24ndAo+IEBAIC00NjIsNyArNDYzLDcgQEAgc3RhdGljIHN0cnVj
dCBjZmlfZml4dXAgY2ZpX2ZpeHVwX3RhYmxlW10gPSB7Cj4gIAl7IENGSV9NRlJfQU1ELCAweDAw
NTYsIGZpeHVwX3VzZV9zZWNzaSB9LAo+ICAJeyBDRklfTUZSX0FNRCwgMHgwMDVDLCBmaXh1cF91
c2Vfc2Vjc2kgfSwKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4MDA1RiwgZml4dXBfdXNlX3NlY3NpIH0s
Cj4gLQl7IENGSV9NRlJfQU1ELCAweDBjMDEsIGZpeHVwX3MyOWdsMDY0bl9zZWN0b3JzIH0sCj4g
Kwl7IENGSV9NRlJfQU1ELCBTMjlHTDA2NE5fTU4xMiwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMg
fSwKPiAgCXsgQ0ZJX01GUl9BTUQsIDB4MTMwMSwgZml4dXBfczI5Z2wwNjRuX3NlY3RvcnMgfSwK
PiAgCXsgQ0ZJX01GUl9BTUQsIDB4MWEwMCwgZml4dXBfczI5Z2wwMzJuX3NlY3RvcnMgfSwKPiAg
CXsgQ0ZJX01GUl9BTUQsIDB4MWEwMSwgZml4dXBfczI5Z2wwMzJuX3NlY3RvcnMgfSwKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
