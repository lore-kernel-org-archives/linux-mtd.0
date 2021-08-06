Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15F5C432BE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDBC6113B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FDBC6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7fuOkYBCO16KvVsWpydBTLAyUK6ZNgjqyO0I+G+EyU=; b=mK/hVflayfyyTf
	+B6b+xavUARNuwfaYVravTet1E8OuVieRyfPT9At3T52Q7VrwU0G4uz9m7VdTErs07vy0bc8kF0Pp
	dEDqAOkHb9fwPpTsgB3yW6hCutWZqmN8YbwC9UJpVzr+d6tCrh+CQGwDVpxDPTRQymEUvFXvZG1zU
	okJ98ywJBHyPmpKtyNUzSoTO8lfXWR/vUWZY6ukOhmQQRL8UWy/E5AIcOQr8fdJyAr89Pf0npTISL
	Knath9CqR+6d9UT8KhfbN9SKLOTzaKgvvNgHFkulDMWxj43yHFIQumskuBwnwuVi2CXnuG2D62Bwe
	sGAS3QGVGgKKwv67zTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4zH-00DByS-RW; Fri, 06 Aug 2021 18:54:31 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4zE-00DBxr-Eb
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:54:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 33ABB100004;
 Fri,  6 Aug 2021 18:54:24 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:54:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 06/13] mtd: spinand: Add macros for Octal DTR page read
 and write operations
Message-ID: <20210806205424.51511388@xps13>
In-Reply-To: <20210713130538.646-7-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-7-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_115428_665867_EDF83C2E 
X-CRM114-Status: GOOD (  12.63  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjMxCiswMDAwOgoKPiBEZWZpbmUgbmV3IFBBR0VfUkVBRF9GUk9N
X0NBQ0hFIGFuZCBQUk9HX0xPQUQgb3AgdGVtcGxhdGVzIGZvciBPY3RhbAo+IERUUiBTUEkgbW9k
ZS4gVGhlc2UgdGVtcGxhdGVzIHdvdWxkIHVzZWQgaW4gb3BfdmFyaWFudHMgYW5kCgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHdpbGwgYmUKCj4gb3BfdGVtcGxhdGVzIGZvciBkZWZp
bmluZyBPY3RhbCBEVFIgcmVhZCBmcm9tIGNhY2hlIGFuZCB3cml0ZSB0bwo+IGNhY2hlIG9wZXJh
dGlvbnMuCj4gCj4gRGF0YXNoZWV0OiBodHRwczovL3d3dy53aW5ib25kLmNvbS9leHBvcnQvc2l0
ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1TjAxSldfRGF0YXNoZWV0X0JyaWVmLnBkZgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRk
L3NwaW5hbmQuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+IGluZGV4IGViYjE5YjJj
ZWM4NC4uMzU4MTZiOGNmZTgxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5h
bmQuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+IEBAIC0xMjIsNiArMTIy
LDEyIEBACj4gIAkJICAgU1BJX01FTV9PUF9EVU1NWShuZHVtbXksIDQpLAkJCQlcCj4gIAkJICAg
U1BJX01FTV9PUF9EQVRBX0lOKGxlbiwgYnVmLCA0KSkKPiAgCj4gKyNkZWZpbmUgU1BJTkFORF9Q
QUdFX1JFQURfRlJPTV9DQUNIRV9PQ1RBTElPX0RUUl9PUChhZGRyLCBuZHVtbXksIGJ1ZiwgbGVu
KSBcCj4gKwlTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EX0RUUigyLCAweDlkOWQsIDgpLAkJCVwK
PiArCQkgICBTUElfTUVNX09QX0FERFJfRFRSKDIsIGFkZHIsIDgpLAkJCVwKPiArCQkgICBTUElf
TUVNX09QX0RVTU1ZX0RUUihuZHVtbXksIDgpLAkJCVwKPiArCQkgICBTUElfTUVNX09QX0RBVEFf
SU5fRFRSKGxlbiwgYnVmLCA4KSkKPiArCj4gICNkZWZpbmUgU1BJTkFORF9QUk9HX0VYRUNfT1Ao
YWRkcikJCQkJCVwKPiAgCVNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTUQoMHgxMCwgMSksCQkJCVwK
PiAgCQkgICBTUElfTUVNX09QX0FERFIoMywgYWRkciwgMSksCQkJCVwKPiBAQCAtMTQwLDYgKzE0
NiwxMiBAQAo+ICAJCSAgIFNQSV9NRU1fT1BfTk9fRFVNTVksCQkJCQlcCj4gIAkJICAgU1BJX01F
TV9PUF9EQVRBX09VVChsZW4sIGJ1ZiwgNCkpCj4gIAo+ICsjZGVmaW5lIFNQSU5BTkRfUFJPR19M
T0FEX09DVEFMSU9fRFRSKHJlc2V0LCBhZGRyLCBidWYsIGxlbikJCVwKPiArCVNQSV9NRU1fT1Ao
U1BJX01FTV9PUF9DTURfRFRSKDIsIHJlc2V0ID8gMHgwMjAyIDogMHg4NDg0LCA4KSwJXAo+ICsJ
CSAgIFNQSV9NRU1fT1BfQUREUl9EVFIoMiwgYWRkciwgOCksCQkJXAo+ICsJCSAgIFNQSV9NRU1f
T1BfTk9fRFVNTVksCQkJCQlcCj4gKwkJICAgU1BJX01FTV9PUF9EQVRBX09VVF9EVFIobGVuLCBi
dWYsIDgpKQo+ICsKPiAgI2RlZmluZSBTUElOQU5EX1BST1RPX0JVU1dJRFRIX01BU0sJR0VOTUFT
Syg2LCAwKQo+ICAjZGVmaW5lIFNQSU5BTkRfUFJPVE9fRFRSX0JJVAkJQklUKDcpCj4gIAoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
