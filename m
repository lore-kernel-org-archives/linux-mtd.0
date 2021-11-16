Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA76C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:24:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E2561B4C
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 08:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86E2561B4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdMbJEPPgU93co9oBoq90ukOAh6UCQ9WWC1teYKND4U=; b=lsaTUXcO6Y4LVh
	I6bGHKwjN1is/gnEd8kbzgPRU+NF56kKKL6DY22P7HLXsTkGxGSqPOO14LYWqaQBGb0ZitIIvBJ7u
	Ldq0KOFLz4KQ4INZ0fCOAf6ZhvtzPdDyx3qkr/8X1YppIasIJLq2saIWrJKfx4+I8fqb23iZ1VG09
	eBOTbFXT1mJReGzZI3W35Xmb+asadU7+DHgN0e1iQ+zK4uXW6JURA11bmu8GQ1+UrbTILaKHPq55r
	T56gtWkdGjoCOoKXaEnI1Rwze82yDVtAxET1Ut5k6Q8z/+CdqsFH25lcxKXMZ+QcWlmsvwZeq5O/1
	XwgcfiKz/P9G5DdIE4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmtkt-000ghM-Kc; Tue, 16 Nov 2021 08:23:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmtkr-000gg1-9j
 for linux-mtd@lists.infradead.org; Tue, 16 Nov 2021 08:23:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 70E661C0009;
 Tue, 16 Nov 2021 08:23:44 +0000 (UTC)
Date: Tue, 16 Nov 2021 09:23:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Rob Herring
 <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH 3/3] spi: dt-bindings: zynqmp: Describe dual
 stacked/parallel memories modes
Message-ID: <20211116092343.43f5b9d5@xps13>
In-Reply-To: <YY6LVhcplIWwMly7@sirena.org.uk>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
 <20211112152411.818321-4-miquel.raynal@bootlin.com>
 <YY6LVhcplIWwMly7@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_002349_502737_B710797E 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

SGkgTWFyaywKCmJyb29uaWVAa2VybmVsLm9yZyB3cm90ZSBvbiBGcmksIDEyIE5vdiAyMDIxIDE1
OjQyOjE0ICswMDAwOgoKPiBPbiBGcmksIE5vdiAxMiwgMjAyMSBhdCAwNDoyNDoxMVBNICswMTAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IAo+ID4gRGVzY3JpYmUgdGhlIHR3byBkdWFsIG1lbW9y
aWVzIG1vZGVzIHdoaWNoIGFyZSBhdmFpbGFibGUgb24gdGhlIFp5bnFNUAo+ID4gUVNQSSBjb250
cm9sbGVyOiBzdGFja2VkIGFuZCBwYXJhbGxlbC4gIAo+IAo+IFNob3VsZG4ndCB0aGlzIGJlIGEg
cHJvcGVydHkgb2YgdGhlIGNvbnRyb2xsZWQgZGV2aWNlIHJhdGhlciB0aGFuIHRoZQo+IGNvbnRy
b2xsZXI/CgpJIGhhZCBhIGhhcmQgdGltZSBwaWNraW5nIHRoZSByaWdodCBsb2NhdGlvbiwgSSBi
ZWxpZXZlIHdlIGNvdWxkCmxpdmUgd2l0aCB0aGVzZSBwcm9wZXJ0aWVzIGJlaW5nIGZsYXNoIGJh
c2VkLiBJIGp1c3QgcHJvcG9zZWQgdG8gZHJvcApvbmUgb2YgdGhlc2UgdHdvIHByb3BlcnRpZXMg
ZW50aXJlbHkgKG9yIG1ha2UgaXQgYSBnZW5lcmljIHByb3BlcnR5KSBpbgp0aGUgZGlzY3Vzc2lv
biB3aXRoIFByYXR5dXNoIGluIHRoZSBjb3ZlciBsZXR0ZXIsIGxldCB1cyBrbm93IHdoYXQgeW91
CnRoaW5rLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
