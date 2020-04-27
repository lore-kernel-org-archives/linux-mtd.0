Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34D6C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4A2206CD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 13:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFjm78zI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4A2206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqDvv+JDZB2Pe/3lmwwLjhbPM7GmTmIwoWzDOR3iVNM=; b=VFjm78zIooNp6X
	8m9o5ia4EBX+G33ii2dMVa8dOuj/JrBxX8hYwGJjlyq+axeOJpZxisoNUMy5uRHkvhUYbYeLRe/mo
	FqdlaGbSGc1QyvQWeMfHhbF8BX0EPsQsCifOSGUe18L2aEQLwqt0CaNUgCbTeuvYNfEQ8TEwDbt+z
	TkLmFiYY+QqekyceF8NHclr6sqNgZLK26kc+DlwYRB6jZYIs2wEexbaH4ksX1yUpxvf8xPxFA3N7R
	7FgaqMG0r47Nh3KDQx2sJ5QVkmxlaLtoHL30RhmCVQEG9Djqzdbop5MT40TczQ+BogRmd/cybpmTD
	40ep9YjHL5Nie05UqJSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT3dt-0002qh-OZ; Mon, 27 Apr 2020 13:17:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT3dq-0002pM-Ry
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 13:17:48 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AA026C001F;
 Mon, 27 Apr 2020 13:17:41 +0000 (UTC)
Date: Mon, 27 Apr 2020 15:17:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Victor Fusco <victor@cartesi.io>
Subject: Re: [PATCH] mtd: physmap: Fix mtd device size
Message-ID: <20200427151739.20422167@xps13>
In-Reply-To: <20200319144129.24849-1-victor@cartesi.io>
References: <20200319144129.24849-1-victor@cartesi.io>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_061747_038019_8DDB008B 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmljdG9yLAoKVmljdG9yIEZ1c2NvIDx2aWN0b3JAY2FydGVzaS5pbz4gd3JvdGUgb24gVGh1
LCAxOSBNYXIgMjAyMCAxNDo0MToyOQorMDAwMDoKCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgbXRk
IGRldmljZSBzaXplIGNhbGN1bGF0aW9uIHdoZW4gdGhlcmUgaXMgbm8gZ3BpbwoKcy9tdGQvTVRE
LwoKUy9ncGlvL0dQSU8vCgo+IGRlZmluZWQuIFRoZSBwcmV2aW91cyBzaXplIGNhbGN1bGF0aW9u
IGNvdWxkIHJldHVybiB2YWx1ZXMgbG93ZXIgdGhhbgo+IHRob3NlIGRlZmluZWQgb24gdGhlICdy
ZWcnIGZpZWxkIG9mIHRoZSBEZXZpY2UgVHJlZSwgcmFzaW5nICdhdHRlbXB0IHRvCgpzL3Jhc2lu
Zy9yYWlzaW5nLyA/Cgo+IGFjY2VzcyBiZXlvbmQgZW5kIG9mIGRldmljZScgZXJyb3JzIGR1cmlu
ZyBkZXZpY2UgYWNjZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpY3RvciBGdXNjbyA8dmljdG9y
QGNhcnRlc2kuaW8+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1jb3JlLmMgfCAx
MiArKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUu
YyBiL2RyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1jb3JlLmMKPiBpbmRleCA4ZjdmOTY2ZmE5YTcu
LjI3Y2M2YWMwMWVhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tYXBzL3BoeXNtYXAtY29y
ZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbWFwcy9waHlzbWFwLWNvcmUuYwo+IEBAIC01MjAsMTcg
KzUyMCwxOSBAQCBzdGF0aWMgaW50IHBoeXNtYXBfZmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqZGV2KQo+ICAJCWlmICghaW5mby0+bWFwc1tpXS5waHlzKQo+ICAJCQlpbmZvLT5t
YXBzW2ldLnBoeXMgPSByZXMtPnN0YXJ0Owo+ICAKPiAtCQlpbmZvLT53aW5fb3JkZXIgPSBnZXRf
Yml0bWFza19vcmRlcihyZXNvdXJjZV9zaXplKHJlcykpIC0gMTsKPiAtCQlpbmZvLT5tYXBzW2ld
LnNpemUgPSBCSVQoaW5mby0+d2luX29yZGVyICsKPiAtCQkJCQkgKGluZm8tPmdwaW9zID8KPiAt
CQkJCQkgIGluZm8tPmdwaW9zLT5uZGVzY3MgOiAwKSk7Cj4gLQo+ICAJCWluZm8tPm1hcHNbaV0u
bWFwX3ByaXZfMSA9ICh1bnNpZ25lZCBsb25nKWRldjsKPiAgCj4gIAkJaWYgKGluZm8tPmdwaW9z
KSB7Cj4gKwkJCWluZm8tPndpbl9vcmRlciA9IGdldF9iaXRtYXNrX29yZGVyKHJlc291cmNlX3Np
emUocmVzKSkgLSAxOwo+ICsJCQlpbmZvLT5tYXBzW2ldLnNpemUgPSBCSVQoaW5mby0+d2luX29y
ZGVyICsKPiArCQkJCQkgICAgICAgICBpbmZvLT5ncGlvcy0+bmRlc2NzKTsKPiArCj4gIAkJCWVy
ciA9IHBoeXNtYXBfYWRkcl9ncGlvc19tYXBfaW5pdCgmaW5mby0+bWFwc1tpXSk7Cj4gIAkJCWlm
IChlcnIpCj4gIAkJCQlnb3RvIGVycl9vdXQ7Cj4gKwkJfSBlbHNlIHsKPiArCQkJaW5mby0+bWFw
c1tpXS5zaXplID0gcmVzb3VyY2Vfc2l6ZShyZXMpOwoKSSBkaWRuJ3QgY2hlY2sgdGhlIGRyaXZl
ciBidXQgYXJlIHlvdSBzdXJlIGluZm8tPndpbl9vcmRlciBhbmQKbWFwc1tpXS5tYXBfcHJpdl8x
IGRvIG5vdCBuZWVkIHRvIGJlIGluaXRpYWxpemVkPyBBbHNvIGFyZSB0aGVzZSBmaWVsZHMKc3Rp
bGwgbmVlZGVkIGlmIHlvdSBzdG9wIHVzaW5nIHRoZW0/IChqdXN0IGFza2luZykKCj4gKwoKRXh0
cmEgbmV3IGxpbmUKCj4gIAkJfQo+ICAKPiAgI2lmZGVmIENPTkZJR19NVERfQ09NUExFWF9NQVBQ
SU5HUwo+IAo+IGJhc2UtY29tbWl0OiA1MDc2MTkwZGFkZWQyMTk3ZjYyZmU5MmNmNjk2NzQ0ODhi
ZTQ0MTc1CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
