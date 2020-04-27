Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B095FC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E32206D6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 20:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSFN/XMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E32206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJO7vEBVuKKrb1F7bwItd3gAq01HEjLVa1UwSPId7xA=; b=tSFN/XMunXM8p6
	ZuewV8aDP0LmMizUEQQO46dbZcqLmseuseboj/aV3Bh18B4W0GYIzoE5hSFta7JcMZXf36HcNrcfB
	ZdNf5GodVPXHjcSxteRASGhZhPUJgT4n0/UMINigy4FvtL5d+wXv7KXZLBGLVyNtqgpvHP5G5S5is
	uDRcsDnh4iJ5BXJp38j5MgXCWmEAh0gFWVRYkQyMoedTGcQDTQ3++9TmiF58i0bHQTRJtfrP7Je4g
	bo13Y6bhxVacGzRFueIf4SIyHziT+Ju7jE9vJzHKDLzxI/3mZNB0crheuHwTKeke1olB00oGIaRGe
	TQHcnDcjHhzrL81SLDFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTA03-0007Op-09; Mon, 27 Apr 2020 20:05:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9zz-0006Ba-CO
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 20:05:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 785C3FF802;
 Mon, 27 Apr 2020 20:05:00 +0000 (UTC)
Date: Mon, 27 Apr 2020 22:04:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 16/17] mtd: rawnand: cafe: Handle non-32bit aligned
 reads/writes
Message-ID: <20200427220459.32a26073@xps13>
In-Reply-To: <20200427082028.394719-17-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-17-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_130503_566598_2D7AD351 
X-CRM114-Status: GOOD (  17.47  )
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
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDEwOjIwOjI2ICswMjAwOgoKPiBUaGUgc3BlYyBz
YXlzIHRoZSB3cml0ZS9yZWFkIGJ1ZmZlcnMgc2hvdWxkIGJlIGZpbGxlZC9yZWFkIDMyYml0cyBh
dCBhCj4gdGltZS4gV2hpbGUgbW9zdCBvZiB0aGUgdGltZSB0aGUgcmVhZHMvd3JpdGVzIGFyZSBh
bGlnbmVkIG9uIDQgYnl0ZXMsCj4gd2Ugc2hvdWxkIG1ha2UgdGhlIGltcGxlbWVudGF0aW9uIG1v
cmUgcm9idXN0IHRvIG5vbi11c3VhbCBOQU5ECj4gb3BlcmF0aW9ucy4KCldlbGwsIGlmIEkgZGlk
bid0IGdldCBjb25mdXNlZCBieSB0aGUgcHJldmlvdXMgY2hhbmdlcywgSSB0aGluayB0aGVzZQph
cmUgdXNlZCBieSAtPmV4ZWNfb3AoKSBhbmQgYXQgYm9vdCB0aW1lIHRoZXJlIGFyZSAyQiAoSUQp
LCAzQiAoSQpkb24ndCByZW1lbWJlcikgYW5kIDVCIChmdWxsIElEKSBhY2Nlc3NlcyB0aGF0IGFy
ZSBwZXJmb3JtZWQuIFRoZXNlIGFyZQpub3QgMzItYml0IGFsaWduZWQuCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25h
bmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gaW5kZXggMjY0OTUwODVm
Mjg1Li45NTVkYzc4YzU3YmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2Fm
ZV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+IEBAIC0x
ODQsMTAgKzE4NCwxOCBAQCBzdGF0aWMgdm9pZCBjYWZlX3dyaXRlX2J1ZihzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBjb25zdCB2b2lkICpidWYsCj4gIHsKPiAgCXN0cnVjdCBjYWZlX3ByaXYgKmNh
ZmUgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gIAo+IC0JaWYgKGNhZmUtPnVz
ZWRtYSkKPiArCWlmIChjYWZlLT51c2VkbWEpIHsKCkFyZSB5b3Ugc3VyZSB1c2VkbWEgd2lsbCBu
b3QgYmUgdHJpZ2dlcmVkIGluIHRoZSBjYXNlIG9mIHVuYWxpZ25lZAphY2Nlc3Nlcz8gSSBkaWRu
J3QgY2hlY2sgYnV0IGl0IGNvdWxkIGJlIG5pY2UgdG8gdmVyaWZ5IHRoYXQgdGhpcyBmbGFnCmlz
IG9ubHkgc2V0IGJ5IHJlYWQvd3JpdGVfcGFnZSgpIGhlbHBlcnMgZm9yIGluc3RhbmNlICh3aGlj
aCBvbmx5CmhhbmRsZSAzMi1iaXQgYWxpZ25lZCBkYXRhKS4KCj4gIAkJbWVtY3B5KGNhZmUtPmRt
YWJ1ZiwgYnVmLCBsZW4pOwo+IC0JZWxzZQo+IC0JCW1lbWNweV90b2lvKGNhZmUtPm1taW8gKyBD
QUZFX05BTkRfV1JJVEVfREFUQSwgYnVmLCBsZW4pOwo+ICsJfSBlbHNlIHsKPiArCQltZW1jcHlf
dG9pbyhjYWZlLT5tbWlvICsgQ0FGRV9OQU5EX1dSSVRFX0RBVEEsIGJ1ZiwKPiArCQkJICAgIGxl
biAmIH4weDMpOwo+ICsJCWlmIChsZW4gJiAweDMpIHsKPiArCQkJdTMyIHRtcCA9IDA7Cj4gKwo+
ICsJCQltZW1jcHkoJnRtcCwgYnVmICsgKGxlbiAmIH4weDMpLCBsZW4gJiAweDMpOwo+ICsJCQlj
YWZlX3dyaXRlbChjYWZlLCB0bXAsIE5BTkRfV1JJVEVfREFUQSk7Cj4gKwkJfQo+ICsJfQo+ICAK
PiAgCWRldl9kYmcoJmNhZmUtPnBkZXYtPmRldiwgIkNvcHkgMHgleCBieXRlcyB0byB3cml0ZSBi
dWZmZXIuXG4iLAlsZW4pOwo+ICB9Cj4gQEAgLTE5NiwxMCArMjA0LDE3IEBAIHN0YXRpYyB2b2lk
IGNhZmVfcmVhZF9idWYoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1bnNpZ25l
ZCBpbnQgbGVuKQo+ICB7Cj4gIAlzdHJ1Y3QgY2FmZV9wcml2ICpjYWZlID0gbmFuZF9nZXRfY29u
dHJvbGxlcl9kYXRhKGNoaXApOwo+ICAKPiAtCWlmIChjYWZlLT51c2VkbWEpCj4gKwlpZiAoY2Fm
ZS0+dXNlZG1hKSB7Cj4gIAkJbWVtY3B5KGJ1ZiwgY2FmZS0+ZG1hYnVmLCBsZW4pOwo+IC0JZWxz
ZQo+IC0JCW1lbWNweV9mcm9taW8oYnVmLCBjYWZlLT5tbWlvICsgQ0FGRV9OQU5EX1JFQURfREFU
QSwgbGVuKTsKPiArCX0gZWxzZSB7Cj4gKwkJbWVtY3B5X2Zyb21pbyhidWYsIGNhZmUtPm1taW8g
KyBDQUZFX05BTkRfUkVBRF9EQVRBLAo+ICsJCQkgICAgICBsZW4gJiB+MHgzKTsKPiArCQlpZiAo
bGVuICYgMHgzKSB7Cj4gKwkJCXUzMiB0bXAgPSBjYWZlX3JlYWRsKGNhZmUsIE5BTkRfUkVBRF9E
QVRBKTsKPiArCj4gKwkJCW1lbWNweShidWYgKyAobGVuICYgfjB4MyksICZ0bXAsIGxlbiAmIDB4
Myk7Cj4gKwkJfQo+ICsJfQo+ICAKPiAgCWRldl9kYmcoJmNhZmUtPnBkZXYtPmRldiwgIkNvcHkg
MHgleCBieXRlcyBmcm9tIHJlYWQgYnVmZmVyLlxuIiwgbGVuKTsKPiAgfQoKUmV2aWV3ZWQtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
