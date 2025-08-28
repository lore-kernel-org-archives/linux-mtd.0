Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCFCA0EED
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Aug 2025 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM26H6UZJvtWDVq12OFencAHNvSIbXZVC5Qdv5+e0qg=; b=Hd2JuUGkL5Xx/I
	rHL/E0p9bJtIOGSt4QDsb6XThvhMKZQyDIU3kb/eGGNS091m8E1nLo6dd5gbPLpXMgabbQ27oRTu9
	hNEQelUCLJhhi+ZahPN0RPnTM/gj4Z7Vk4Nc80WyXRWbFnoq/l5NrWh5BscTsI2uYgap7b90odY8z
	2rVehSuiEftiSzZvyXWT7zEL8VD5i/M9Cfgd5mEDnrnOh/TLv7jPijlNMrQn5nEIXnOUKJR0GqLuj
	JBJP9c/e8SbxfSBhVhR4li1v3O9WkJdK6WT2m5FfdN7IS00G6i4Go9g/qezPC2QYguywYnfoU5Z2c
	rKLAeA9rCBARGwyn5B7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraVf-00000001IAl-2tsE;
	Thu, 28 Aug 2025 11:09:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZXF-000000015Nx-1rRI
	for linux-mtd@lists.infradead.org;
	Thu, 28 Aug 2025 10:07:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 927EA1A0E3D
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2025 10:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A12360303;
	Thu, 28 Aug 2025 10:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C001C228428;
	Thu, 28 Aug 2025 12:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756375629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=91ORWxWIpy7tFZBe7K+jHWUoZrUew0JlzyK1OWsw8eE=;
	b=y9AajTfejcl8aQvC4580+zcE8zHYldh8sVR9YkI+07cPGLmegG2PjVWZonIEk3w8lwR0qt
	H6eONc2PPbVd1Q8g3sJ3x6ED+jd/o8eTiUCnv15iwVVxBDm/V6CUz5LHYHiscwGJTHW3eQ
	75MDZAhKRyac0y2dhHOLFNYhFaV/NInf4Y9O81JW6zRLpQSf/U23Cu826MjLj8RZouAZrD
	uM3MgE2FV4sx+nIZ4kfAb2TAREaFfFzZaYoo+ZY19YF/ZC+9sRqeykY6R6n723qirwC5Pd
	B03BrVE/zSCd2IxhBI5eLvsQCRA5ReG9Q3JMjDJEcuEFf2+M1rEahBrio5/+SQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <markus.stockhausen@gmx.de>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: AW: [PATCH 2/2] mtd: nand: realtek-ecc: Add Realtek external
 ECC engine support
In-Reply-To: <015a01dc152b$9e90a990$dbb1fcb0$@gmx.de> (markus stockhausen's
	message of "Sun, 24 Aug 2025 21:16:39 +0200")
References: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
	<20250818092725.1977105-3-markus.stockhausen@gmx.de>
	<87ldn8hddb.fsf@bootlin.com> <015a01dc152b$9e90a990$dbb1fcb0$@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 28 Aug 2025 12:07:02 +0200
Message-ID: <87iki769q1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_030713_616205_38956878 
X-CRM114-Status: GOOD (  11.26  )
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

SGkgTWFya3VzLAoKT24gMjQvMDgvMjAyNSBhdCAyMToxNjozOSArMDIsIDxtYXJrdXMuc3RvY2to
YXVzZW5AZ214LmRlPiB3cm90ZToKCj4+IFZvbjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gCj4+IEdlc2VuZGV0OiBTb25udGFnLCAyNC4gQXVndXN0IDIwMjUgMTg6
NTEKPj4gLi4uCj4+ICsvKgo+PiArICogVGhlIFJlYWx0ZWsgRUNDIGVuZ2luZSBoYXMgdHdvIG9w
ZXJhdGlvbiBtb2Rlcy4KPj4gKyAqCj4+ICsgKiAtIEJDSDYgOiBHZW5lcmF0ZSAxMCBFQ0MgYnl0
ZXMgZnJvbSA1MTIgZGF0YSBieXRlcyBwbHVzIDYgdGFnIGJ5dGVzCj4+ICsgKiAtIEJDSDEyOiBH
ZW5lcmF0ZSAyMCBFQ0MgYnl0ZXMgZnJvbSA1MTIgZGF0YSBieXRlcyBwbHVzIDYgdGFnIGJ5dGVz
Cj4+Cj4+IFdoYXQgaXMgYSB0YWc/IEkgYmVsaWV2ZSBpdCBpcyBSZWFsdGVrIHdvcmRpbmcgYW5k
IHdlIG5lZWQgdG8gZmluZCBhCj4+IG1vcmUgZ2VuZXJpYyB0cmFuc2xhdGlvbi4KPgo+IEkgaGF2
ZSBubyByZWFsIGlkZWEuIFRoZXkgc2ltcGx5IGNhbGwgaXQgInRhZyIuIFRvIGJlIG1vcmUgcHJl
Y2lzZQo+Cj4gLSB0YWcgKGxvd2VyY2FzZSk6IG1lYW5zIDYgb29iIGJ5dGVzIGZvciBvbmUgNTEy
IGJ5dGUgYmxvY2sKPiAtIHN5bmRyb21lOiBtZWFucyAxMCBFQ0MgYnl0ZXMgZm9yIG9uZSA1MTIg
Ynl0ZSBibG9jay4KPiAtIFRBRyAodXBwZXJjYXNlKTogbWVhbnMgMTYgb29iIGJ5dGVzICh0YWcr
c3luZHJvbWUpCgpPay4gQmFzZWQgb24geW91ciBmZWVkYmFjaywgSSBiZWxpZXZlIHRoYXQgbWln
aHQgYmUgd2hhdCB3ZSBtb3JlCmNvbW1vbmx5IGNhbGwgImZyZWUgYnl0ZXMiLiAiZnJlZSIgYXMg
aW4gImF2YWlsYWJsZSBmb3IgdGhlIHVzZXIiLiBJbiB0aGUKT09CIGFyZWEgeW91J2xsIG1vc3Rs
eSBmaW5kOgotIDIgYnl0ZXMgcmVzZXJ2ZWQgYnkgTVREIHRvIHN0b3JlIGJhZCBibG9jayBtYXJr
ZXJzCi0gQnl0ZXMgYXZhaWxhYmxlIGZvciB0aGUgdXNlciAoZW5kIHVzZXIsIG9yIG1vcmUgY29t
bW9ubHkgdXBwZXIgbGF5ZXJzCiAgYW5kIGZpbGVzeXN0ZW1zLiBqZmZzMiBkb2VzIHVzZSB0aGVz
ZSBmcmVlIGJ5dGVzLCB3aGVyZWFzIFVCSSBkb2VzIG5vdC4KICAgICogeW91ciAidGFnIiBhbmQg
IlRBRyIsIGRpZmZlcmVuY2UgaXMgcHJvYmFibHkgdGhhdCAidGFnIiBpcyBub3QgRUNDCiAgICAg
IHByb3RlY3RlZCAoc3ViamVjdCB0byBiaXRmbGlwKSB3aGVyZWFzICJUQUciIGlzIHBhcnQgb2Yg
dGhlCiAgICAgIHByb3RlY3RlZCBhcmVhIGFuZCB3aWxsIGJlIGNvcnJlY3RlZCBpZiBuZWVkZWQu
Ci0gQnl0ZXMgbm90IGF2YWlsYWJsZSBmb3IgdGhlIHVzZXIsIGllLiBFQ0MgYnl0ZXMsIHdoaWNo
IHdlIGFyZSBiZWluZwogIHJlYWQvd3JpdHRlbiBhdCBhIGZpeGVkIG9mZnNldCBieSB0aGUgRUND
IGVuZ2luZS4KCj4gRG8gSSBuZWVkIHRvIGRlY2xhcmUgdGhlIEJCTSBhcmVhIHNvbWVob3cgYWRk
aXRpb25hbGx5PwoKTm8sIHRoZXkgYXJlIG5vdCB1c2VyIGFjY2Vzc2libGUgbm9yIEVDQyBieXRl
cy4gVGhleSBhcmUgbm90IGV4cG9zZWQgYnkKdGhlIG9vYmxheW91dCBjYWxsYmFja3Mgd2UgYXJl
IGRpc2N1c3NpbmcuCgo+IFRoYW5rcyBmb3IgdGhlIG90aGVyIGZlZWRiYWNrLiBXaWxsIGltcGxl
bWVudCB0aGF0IGluIHYyLgoKQ2hlZXJzIQoKR29vZCBsdWNrLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
