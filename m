Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D812C54EEB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:01:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F21206A5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:01:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tvAlbTZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F21206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHT99wevw1boXXhOspueU8Ex0v8ajMvWYS0+BLPqL0E=; b=tvAlbTZDI2VZbV
	iQSR9MEizIRQUFVzylH1BIWbidRBKm7HdCVgpHK4+B0JaPPhUTyw9qwn7bCI+MhioKwI8ItSmdjkZ
	JysyhNFFZFtWcGA6HYwdBlPU50xGynhqu/aZ5cDR1zVSktbqLgbwvkPuTOgwp6lr9tEsdte4VoSCM
	cIl41pphMCVe2PCNGjrdIrRcd9UUJXNC7m+FwCct4kdQDfYpxh61AudjmLKTwgGM5iTA1CiFT1im0
	31TLiC5j2Gmt9qInOY1bY3dRXX6B6ejbqO6eYZPhtfyoPuHdhveysTlKT6i8aI8wPaUb2EKpbdP/5
	vWUkxb3UQeBDWjLG3CTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9w8-0005E1-VZ; Mon, 27 Apr 2020 20:01:05 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9w3-00056j-HY
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 20:01:01 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 45D3B200006;
 Mon, 27 Apr 2020 20:00:57 +0000 (UTC)
Date: Mon, 27 Apr 2020 22:00:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 15/17] mtd: rawnand: cafe: Adjust the
 cafe_{read,write}_buf() prototypes
Message-ID: <20200427220055.723a4de6@xps13>
In-Reply-To: <20200427082028.394719-16-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-16-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_130059_751966_68CC5282 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjI1ICswMjAwOgoKPiBSZXBsYWNlIHRo
ZSB1aW50OF90IHBvaW50ZXIgYnkgYSB2b2lkIHBvaW50ZXIgYW5kIG1ha2UgdGhlIGxlbmd0aAo+
IHVuc2lnbmVkIHNvIGl0IG1hdGNoZXMgd2hhdCdzIHBhc3NlZCB0aHJvdWdoIHRoZSBuYW5kIGlu
c3RydWN0aW9ucy4KPiAKCk5pdDogSSBwcmVmZXIgTkFORCB0aGFuIG5hbmQgaW4gcGxhaW4gRW5n
bGlzaC4KCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KCkJ1dCB3aGF0ZXZlciwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvY2FmZV9uYW5kLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2NhZmVfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPiBpbmRleCA1
YjM4ZDQ5NmQ5MjMuLjI2NDk1MDg1ZjI4NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9jYWZlX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5j
Cj4gQEAgLTE3OSw3ICsxNzksOCBAQCBzdGF0aWMgY29uc3QgY2hhciAqcGFydF9wcm9iZXNbXSA9
IHsgImNtZGxpbmVwYXJ0IiwgIlJlZEJvb3QiLCBOVUxMIH07Cj4gICNkZWZpbmUgY2FmZV9yZWFk
bChjYWZlLCBhZGRyKQkJCXJlYWRsKChjYWZlKS0+bW1pbyArIENBRkVfIyNhZGRyKQo+ICAjZGVm
aW5lIGNhZmVfd3JpdGVsKGNhZmUsIGRhdHVtLCBhZGRyKQkJd3JpdGVsKGRhdHVtLCAoY2FmZSkt
Pm1taW8gKyBDQUZFXyMjYWRkcikKPiAgCj4gLXN0YXRpYyB2b2lkIGNhZmVfd3JpdGVfYnVmKHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbikKPiArc3Rh
dGljIHZvaWQgY2FmZV93cml0ZV9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3Qgdm9p
ZCAqYnVmLAo+ICsJCQkgICB1bnNpZ25lZCBpbnQgbGVuKQo+ICB7Cj4gIAlzdHJ1Y3QgY2FmZV9w
cml2ICpjYWZlID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKGNoaXApOwo+ICAKPiBAQCAtMTkx
LDcgKzE5Miw3IEBAIHN0YXRpYyB2b2lkIGNhZmVfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbikKPiAgCWRldl9kYmcoJmNhZmUtPnBk
ZXYtPmRldiwgIkNvcHkgMHgleCBieXRlcyB0byB3cml0ZSBidWZmZXIuXG4iLAlsZW4pOwo+ICB9
Cj4gIAo+IC1zdGF0aWMgdm9pZCBjYWZlX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
IHVpbnQ4X3QgKmJ1ZiwgaW50IGxlbikKPiArc3RhdGljIHZvaWQgY2FmZV9yZWFkX2J1ZihzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCB2b2lkICpidWYsIHVuc2lnbmVkIGludCBsZW4pCj4gIHsKPiAg
CXN0cnVjdCBjYWZlX3ByaXYgKmNhZmUgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7
Cj4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
