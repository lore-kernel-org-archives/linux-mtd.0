Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9443EC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu+ycLZO4ic9J4pxgU2w+LX2qAh+pX3HusPgn70K6e0=; b=m2QaoxOALcibfh
	9OfYrHqMpiaxPblBD32+/Z3ZIXwGqaIdpW1XmzbF6/qWG6ZF7Ndh5vCamwoDXI6NOVqM85J0FCDpA
	ujuho/c95Lvf6wvkhTt+kh/VgKM5KZMflU7n/p7s9+EmRHuXXp2x0/kWksFIV5j6Ia51iaQO/i3s3
	tbYTliL59+Q1mQ3w1Oj1hUz9I9T4gMKFoBqEPO0L7omImONk6Eq6B4vkUDjL6B4kBvXdtoWSIiyGP
	lQHYo3AlO5ZgvBatoBcvGc2w34N943gS5kiSwgbgN6/F14Bk5XETo8Kn9CgQFT1iiDOKEl18IfEeX
	HGxtk2dXqFQYolRat6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMwR-0000000E9bq-28N2;
	Tue, 20 Feb 2024 10:01:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMwO-0000000E9aP-0Ht1;
	Tue, 20 Feb 2024 10:01:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47CEF20015;
	Tue, 20 Feb 2024 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708423290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLJjwyWcAA92P8/mQkEbJc7X1g1TkiGOhieOujelkek=;
	b=JScQNfoGuwPh8Gycp9Jpo1bd6uRBdCwt/WKZNDRY7e0EmTjtWumU/Yx97kLCbNEaDK5pX+
	pZwKsKvwpVc8lUCbhFU4E6d1/vp4WLOOfjgFITNityg37EtyDYp110ov3AKj3RSVQt81r7
	Ui4YT40hStXZXm2WIMVgt+Mg361jvx++g5j4mqcl+LI3yoW0S7E5GiWr6GUk/PPLvlr73h
	5ngIgQDodDQwGjtVdBMNggpB7Lpb1yHaD2p6qIrMHpaNZSyv9UvLHuWHT1Eh2jmPiJRYDL
	zjUor/AtVDNL/6zT5hQPGfqD4Yo1ItaLpUaTU/kbpN5LbcGLAZkgj8EMco6+Pw==
Date: Tue, 20 Feb 2024 11:01:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 11/12] mtd: rawnand: brcmnand: exec_op helper
 functions return type fixes
Message-ID: <20240220110128.3cadbcc2@xps-13>
In-Reply-To: <20240207202257.271784-12-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
	<20240207202257.271784-12-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_020132_398052_B9F13648 
X-CRM114-Status: GOOD (  19.54  )
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

SGksCgp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBXZWQsICA3IEZlYiAyMDI0
IDEyOjIyOjU2IC0wODAwOgoKPiBGcm9tOiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNv
bT4KPiAKPiBmaXggcmV0dXJuIHR5cGUgZm9yIGV4ZWNfb3AgcmVzZXQgYW5kIHN0YXR1cyBkZXRl
Y3QgaGVscGVyIGZ1bmN0aW9ucwoKUGxlYXNlIG1ha2UgYSBjb3JyZWN0IHNlbnRlbmNlIChGaWMs
IGRldGVjdD8sICcuJykuCgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQGxpbmFyby5vcmc+Cj4gQ2xvc2VzOiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBl
cm1haWwvbGludXgtbXRkLzIwMjMtRGVjZW1iZXIvMTAyNDIzLmh0bWwKPiBGaXhlczogM2M4MjYw
Y2U3NjYzICgibXRkOiByYXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBpbXBsZW1lbnRhdGlvbiIp
Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+
IAo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjU6IE5vbmUKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gRml4
IHRoZSBjb21taXQgaWQgaW4gdGhlIGZpeGVzIHRhZwo+IAo+IENoYW5nZXMgaW4gdjM6IE5vbmUK
PiBDaGFuZ2VzIGluIHYyOgo+IC0gQWRkZWQgdG8gcGF0Y2ggc2VyaWVzCj4gCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAxNSArKysrKysrKystLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBpbmRleCA4YzE0ODlmZjdiZDYu
LjdjZTJiMjY3Njc2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwo+IEBAIC02MjUsNyArNjI1LDcgQEAgZW51bSB7Cj4gIC8qIE9ubHkgZm9yIHY3LjIgKi8K
PiAgI2RlZmluZQlBQ0NfQ09OVFJPTF9FQ0NfRVhUX1NISUZUCQkxMwo+ICAKPiAtc3RhdGljIHU4
IGJyY21uYW5kX3N0YXR1cyhzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCk7Cj4gK3N0YXRpYyBp
bnQgYnJjbW5hbmRfc3RhdHVzKHN0cnVjdCBicmNtbmFuZF9ob3N0ICpob3N0KTsKPiAgCj4gIHN0
YXRpYyBpbmxpbmUgYm9vbCBicmNtbmFuZF9ub25fbW1pb19vcHMoc3RydWN0IGJyY21uYW5kX2Nv
bnRyb2xsZXIgKmN0cmwpCj4gIHsKPiBAQCAtMTc0OSw3ICsxNzQ5LDcgQEAgc3RhdGljIGludCBi
cmNtbmFuZF93YWl0ZnVuYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJCQkJIElOVEZDX0ZM
QVNIX1NUQVRVUzsKPiAgfQo+ICAKPiAtc3RhdGljIHU4IGJyY21uYW5kX3N0YXR1cyhzdHJ1Y3Qg
YnJjbW5hbmRfaG9zdCAqaG9zdCkKPiArc3RhdGljIGludCBicmNtbmFuZF9zdGF0dXMoc3RydWN0
IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gIHsKPiAgCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAm
aG9zdC0+Y2hpcDsKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQoY2hpcCk7
Cj4gQEAgLTE3NjAsNyArMTc2MCw3IEBAIHN0YXRpYyB1OCBicmNtbmFuZF9zdGF0dXMoc3RydWN0
IGJyY21uYW5kX2hvc3QgKmhvc3QpCj4gIAlyZXR1cm4gYnJjbW5hbmRfd2FpdGZ1bmMoY2hpcCk7
Cj4gIH0KPiAgCj4gLXN0YXRpYyB1OCBicmNtbmFuZF9yZXNldChzdHJ1Y3QgYnJjbW5hbmRfaG9z
dCAqaG9zdCkKPiArc3RhdGljIGludCBicmNtbmFuZF9yZXNldChzdHJ1Y3QgYnJjbW5hbmRfaG9z
dCAqaG9zdCkKPiAgewo+ICAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZob3N0LT5jaGlwOwo+
ICAKPiBAQCAtMjQ5MiwxMSArMjQ5MiwxNCBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2V4ZWNfb3Ao
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCj4gIAlpZiAoYnJjbW5hbmRfb3BfaXNfc3RhdHVz
KG9wKSkgewo+ICAJCXN0YXR1cyA9IG9wLT5pbnN0cnNbMV0uY3R4LmRhdGEuYnVmLmluOwo+IC0J
CSpzdGF0dXMgPSBicmNtbmFuZF9zdGF0dXMoaG9zdCk7Cj4gKwkJcmV0ID0gYnJjbW5hbmRfc3Rh
dHVzKGhvc3QpOwo+ICsJCWlmIChyZXQgPCAwKQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsKPiArCQkq
c3RhdHVzID0gcmV0ICYgMHhGRjsKPiAgCj4gIAkJcmV0dXJuIDA7Cj4gLQl9Cj4gLQllbHNlIGlm
IChicmNtbmFuZF9vcF9pc19yZXNldChvcCkpIHsKPiArCX0gZWxzZSBpZiAoYnJjbW5hbmRfb3Bf
aXNfcmVzZXQob3ApKSB7CgpUaGlzIGlzIGFub3RoZXIgY2hhbmdlLCBwbGVhc2UgbWFrZSBpdCBp
biBhbm90aGVyIHBhdGNoLiBBbHNvIHdoaWxlIHlvdQphcmUgYXQgaXQsIHRoZXJlIGFyZSBwcm9i
YWJseSBvdGhlciBjaGVja3BhdGNoIHdhcm5pbmdzIHRoYXQgY2FuIGJlCmZpeGVkLCBpZiB5b3Ug
d2FudC4KCj4gIAkJcmV0ID0gYnJjbW5hbmRfcmVzZXQoaG9zdCk7Cj4gIAkJaWYgKHJldCA8IDAp
Cj4gIAkJCXJldHVybiByZXQ7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
