Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E36C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF6C60F4A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACF6C60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRgadec2RIrx+uoybXR2LN02btR4v7bHA4UPB+YYjrQ=; b=4KTEU8kVRT8bSbeekUf65wqnW6
	tb7xhd7cVhPGiM6cE1J/h3aK5+sXibZ26C7zVIO4h2WvvTmGlBwbbZvfm4I7mY/Q8l9jPpIDj39UV
	eAUeZ1+oI7QWM3Xi8wIGHNE3qqE0mou4+rhKjyWQo2XZc5QbMitUsOFODjDsF1q1S67elxFoyum/W
	KeDWOAvv9Awti1kfTLgiQ+LLrFiHyZIuoie+8utl9SkRAti9rakGRHjd0HYUH3+OZGbKQ9BpoDXbK
	X9mHuQ+K+RY/5LsUSyGZgtBP9sBHPgEmiExGuC7spSJfEmZ/TSaBjJFYbhC1iTCxPGA01Pwu/PPjy
	fEJV/EdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1sI-00AhR3-3Q; Fri, 20 Aug 2021 10:35:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1sC-00AhPa-6a
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 10:35:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KAZX6w104323;
 Fri, 20 Aug 2021 05:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629455733;
 bh=kDWvlbjEYm+ZPP7kxDBAMIyz5QxNzRAE46pJTRwzxAs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HMlE6qvQFDOCM27LSlRTWFn7N2sfgD69kACQ2vWG1jQcxgg1t2reyADYQ7lN0QBHm
 QdWoQX1E8jNkH8kQXMhKed4Qe2cBM/EY6yQEZ5aEgNAkirRKPLZzf583vKOgDZKyyC
 oELIBRjThei7qH/OfuNeJXh1Vg/OmEO0Zqm7tmGM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KAZXHp007024
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 05:35:33 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 05:35:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 05:35:32 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KAZSkE049156;
 Fri, 20 Aug 2021 05:35:29 -0500
Subject: Re: [PATCH 06/13] mtd: spinand: Add macros for Octal DTR page read
 and write operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-7-a-nandan@ti.com> <20210806205424.51511388@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <88915cc5-a2b7-4971-f9a1-a98bd944d5e7@ti.com>
Date: Fri, 20 Aug 2021 16:05:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806205424.51511388@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_033540_368350_311D6B65 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjI0IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MzEKPiArMDAwMDoKPiAKPj4gRGVmaW5lIG5ldyBQQUdF
X1JFQURfRlJPTV9DQUNIRSBhbmQgUFJPR19MT0FEIG9wIHRlbXBsYXRlcyBmb3IgT2N0YWwKPj4g
RFRSIFNQSSBtb2RlLiBUaGVzZSB0ZW1wbGF0ZXMgd291bGQgdXNlZCBpbiBvcF92YXJpYW50cyBh
bmQKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3aWxsIGJlCj4gCgpZZWFo
LCBvayEKCj4+IG9wX3RlbXBsYXRlcyBmb3IgZGVmaW5pbmcgT2N0YWwgRFRSIHJlYWQgZnJvbSBj
YWNoZSBhbmQgd3JpdGUgdG8KPj4gY2FjaGUgb3BlcmF0aW9ucy4KPj4KPj4gRGF0YXNoZWV0OiBo
dHRwczovL3d3dy53aW5ib25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1
TjAxSldfRGF0YXNoZWV0X0JyaWVmLnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFu
ZGFuIDxhLW5hbmRhbkB0aS5jb20+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvbXRkL3NwaW5h
bmQuaCB8IDEyICsrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggYi9pbmNs
dWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPj4gaW5kZXggZWJiMTliMmNlYzg0Li4zNTgxNmI4Y2Zl
ODEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+PiArKysgYi9p
bmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPj4gQEAgLTEyMiw2ICsxMjIsMTIgQEAKPj4gICAJ
CSAgIFNQSV9NRU1fT1BfRFVNTVkobmR1bW15LCA0KSwJCQkJXAo+PiAgIAkJICAgU1BJX01FTV9P
UF9EQVRBX0lOKGxlbiwgYnVmLCA0KSkKPj4gICAKPj4gKyNkZWZpbmUgU1BJTkFORF9QQUdFX1JF
QURfRlJPTV9DQUNIRV9PQ1RBTElPX0RUUl9PUChhZGRyLCBuZHVtbXksIGJ1ZiwgbGVuKSBcCj4+
ICsJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRF9EVFIoMiwgMHg5ZDlkLCA4KSwJCQlcCj4+ICsJ
CSAgIFNQSV9NRU1fT1BfQUREUl9EVFIoMiwgYWRkciwgOCksCQkJXAo+PiArCQkgICBTUElfTUVN
X09QX0RVTU1ZX0RUUihuZHVtbXksIDgpLAkJCVwKPj4gKwkJICAgU1BJX01FTV9PUF9EQVRBX0lO
X0RUUihsZW4sIGJ1ZiwgOCkpCj4+ICsKPj4gICAjZGVmaW5lIFNQSU5BTkRfUFJPR19FWEVDX09Q
KGFkZHIpCQkJCQlcCj4+ICAgCVNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTUQoMHgxMCwgMSksCQkJ
CVwKPj4gICAJCSAgIFNQSV9NRU1fT1BfQUREUigzLCBhZGRyLCAxKSwJCQkJXAo+PiBAQCAtMTQw
LDYgKzE0NiwxMiBAQAo+PiAgIAkJICAgU1BJX01FTV9PUF9OT19EVU1NWSwJCQkJCVwKPj4gICAJ
CSAgIFNQSV9NRU1fT1BfREFUQV9PVVQobGVuLCBidWYsIDQpKQo+PiAgIAo+PiArI2RlZmluZSBT
UElOQU5EX1BST0dfTE9BRF9PQ1RBTElPX0RUUihyZXNldCwgYWRkciwgYnVmLCBsZW4pCQlcCj4+
ICsJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRF9EVFIoMiwgcmVzZXQgPyAweDAyMDIgOiAweDg0
ODQsIDgpLAlcCj4+ICsJCSAgIFNQSV9NRU1fT1BfQUREUl9EVFIoMiwgYWRkciwgOCksCQkJXAo+
PiArCQkgICBTUElfTUVNX09QX05PX0RVTU1ZLAkJCQkJXAo+PiArCQkgICBTUElfTUVNX09QX0RB
VEFfT1VUX0RUUihsZW4sIGJ1ZiwgOCkpCj4+ICsKPj4gICAjZGVmaW5lIFNQSU5BTkRfUFJPVE9f
QlVTV0lEVEhfTUFTSwlHRU5NQVNLKDYsIDApCj4+ICAgI2RlZmluZSBTUElOQU5EX1BST1RPX0RU
Ul9CSVQJCUJJVCg3KQo+PiAgIAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gCgpUaGFua3MsCkFwdXJ2YSBOYW5kYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
