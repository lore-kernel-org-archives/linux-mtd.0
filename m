Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F551CDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6KRF3I1qtxZJuNssbNIQkTPG/VnpuWSee81R9eROY0=; b=nLh6pjyP0mkOwN
	KFEa8pjA1P9aGAg1OcoznbngGdDQ8GnZykFbvz1MQ+z5Km8aE2P2w+VDpuwcIaLEip2XIegtZW7/i
	XQuuVrhm7vTeu5b1rKPuR9op2kxAPUuz9QznpI5emmDY1ew7vxZk6vejAH69N6LizblPCnQiGVJO9
	cdmAN2PRCXCku1Ud6cizzmsMtsJ8vmLMfzDvRneEGrlIc0jHyaTz6gTfG8UX+59EG3R+Ln8lKjS8n
	DgAQcChKgrZ5nzRHuVMPp7Aa0WCwq0KI4ZCIoUDMdYpATmjRMHnzhlqK/GZxPDHo2HAIMfNVYhbJy
	gW3bvopK6YCWDwe5PteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpnp-0000wu-0V;
	Thu, 12 Oct 2023 07:08:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpnm-0000v6-18
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 07:08:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EE46C000E;
	Thu, 12 Oct 2023 07:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697094488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cayfJuQq3NXYzj1/eaV9Gu3hreC8uKdYtTQAop1dAvc=;
	b=iU+ayrS4MhjJtxriO7JYbpC7IhF9LIexIviPpRR1v24GJJsoL2uFDhTGqW84m/GWZWFELo
	hJ6g6ws5FAepcBx9pLKOGnkgSC+XtKd2m/mzLBcn524KoSOZshMOFdC0sLv3qiNwOTCXU1
	mtbhZD/ggsZJaRIevk9owPL/XCQaHZ1baSguNDMOGgA+KfzlZdPAunMvKmbIeBhHI49t1c
	bC6B5Ry/M9X0Mu52tuin1KWCuH3R1Pc4TVtjYDHI13+q16BG+ie8ZPTTzrO+yuzjTqWN+b
	FM8DIA6qTkW0VUgjZ7Q6JbBErMt7fbIpHrLn/RfYxFqCPv/V7G0VtooLkhjF1Q==
Date: Thu, 12 Oct 2023 09:08:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 2/4] mtd: rawnand: NAND controller write protect
Message-ID: <20231012090805.7af1e8e0@xps-13>
In-Reply-To: <trinity-85483437-5787-42fc-8cf6-157a3f7324dc-1697071270308@3c-app-mailcom-lxa05>
References: <trinity-85483437-5787-42fc-8cf6-157a3f7324dc-1697071270308@3c-app-mailcom-lxa05>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_000810_524281_345E13BE 
X-CRM114-Status: GOOD (  18.05  )
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

SGkgZHJlZ2FuQG1haWwuY29tLAoKZHJlZ2FuQG1haWwuY29tIHdyb3RlIG9uIFRodSwgMTIgT2N0
IDIwMjMgMDI6NDE6MTAgKzAyMDA6Cgo+IEFsbG93IE5BTkQgY29udHJvbGxlciB0byBiZSByZXNw
b25zaWJsZSBmb3Igd3JpdGUgcHJvdGVjdCBwaW4KPiBoYW5kbGluZyBkdXJpbmcgZmFzdCBwYXRo
IGFuZCBleGVjX29wIGRlc3RydWN0aXZlIG9wZXJhdGlvbgo+IHdoZW4gY29udHJvbGxlcl93cCBm
bGFnIGlzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQG1haWwu
Y29tPgo+IAo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjI6IG5vbmUKPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCA0ICsrKysKPiAgaW5jbHVkZS9saW51eC9tdGQvcmF3
bmFuZC5oICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCA0N2NjMmMzNTE1M2IuLjM4ZWQwY2Vk
NWI4ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTM2Nyw2ICszNjcsMTAg
QEAgc3RhdGljIGludCBuYW5kX2NoZWNrX3dwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIAlp
ZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlJPS0VOX1hEKQo+ICAJCXJldHVybiAwOwo+IAo+ICsJ
LyogY29udHJvbGxlciByZXNwb25zaWJsZSBmb3IgTkFORCB3cml0ZSBwcm90ZWN0ICovCj4gKwlp
ZiAoY2hpcC0+Y29udHJvbGxlci0+Y29udHJvbGxlcl93cCkKPiArCQlyZXR1cm4gMDsKPiArCj4g
IAkvKiBDaGVjayB0aGUgV1AgYml0ICovCj4gIAlyZXQgPSBuYW5kX3N0YXR1c19vcChjaGlwLCAm
c3RhdHVzKTsKPiAgCWlmIChyZXQpCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3Jh
d25hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+IGluZGV4IDMxYWNlZGE4NjE2
Yy4uZjAzYjlkN2Y0OGI4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+IEBAIC0xMTExLDYgKzExMTEs
NyBAQCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyB7Cj4gICAqCQkJdGhlIGJ1cyB3aXRob3V0
IHJlc3RhcnRpbmcgYW4gZW50aXJlIHJlYWQgb3BlcmF0aW9uIG5vcgo+ICAgKgkJCWNoYW5naW5n
IHRoZSBjb2x1bW4uCj4gICAqIEBzdXBwb3J0ZWRfb3AuY29udF9yZWFkOiBUaGUgY29udHJvbGxl
ciBzdXBwb3J0cyBzZXF1ZW50aWFsIGNhY2hlIHJlYWRzLgo+ICsgKiBAY29udHJvbGxlcl93cDoJ
Y29udHJvbGxlciByZXNwb25zaWJsZSBmb3IgTkFORCB3cml0ZSBwcm90ZWN0LgoKCQkJVGhlIGNv
bnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIGhhbmRsaW5nIHRoZSBXUCBwaW4KCj4gICAqLwo+ICBz
dHJ1Y3QgbmFuZF9jb250cm9sbGVyIHsKPiAgCXN0cnVjdCBtdXRleCBsb2NrOwo+IEBAIC0xMTE5
LDYgKzExMjAsNyBAQCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyIHsKPiAgCQl1bnNpZ25lZCBpbnQg
ZGF0YV9vbmx5X3JlYWQ6IDE7Cj4gIAkJdW5zaWduZWQgaW50IGNvbnRfcmVhZDogMTsKPiAgCX0g
c3VwcG9ydGVkX29wOwo+ICsJYm9vbCBjb250cm9sbGVyX3dwOwo+ICB9Owo+IAo+ICBzdGF0aWMg
aW5saW5lIHZvaWQgbmFuZF9jb250cm9sbGVyX2luaXQoc3RydWN0IG5hbmRfY29udHJvbGxlciAq
bmZjKQo+IC0tCj4gMi4zNy4zCj4gCj4gCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
