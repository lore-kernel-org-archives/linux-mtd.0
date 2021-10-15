Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3A0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 07:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B4461108
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 07:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17B4461108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Mox/VGeQwPk1B7GipbGEX7EO7vGZbGjg4kNMPLQrgg=; b=aLPb4FNrXxd2dv
	oivkrPqjsJE2GLtbVtMZFXAeXqPeyQ5PymPjsxgXg+kCfU533pWCc0/Tj7+twjvcSsTJbyVUFcy4d
	tGhrY7oYE76SnkJvM7lZBKs02jp7Gh0kWQoqvGemEh4rlHGpeHqU9SGs6h1/TriS85QQMC2iOZXih
	P8oDgVHJnWQHPoyw0IKc1XCCCSrcFtvskC5qlxQDnEHpOdNWUc9EWv3UkBEii9K5NDMzOgxAltHgd
	jZP/uU5phJlHOl6B/Mt2lHn80xGD0xJir7zqha2bO18LlUhD5nlns60llekDuu5YqJDvz3wdOpU8o
	uFAQjqg+ijxaw4R8NYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbHtk-005jnP-Vo; Fri, 15 Oct 2021 07:45:01 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbHti-005jmM-8w
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 07:44:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7C5C8100018;
 Fri, 15 Oct 2021 07:44:51 +0000 (UTC)
Date: Fri, 15 Oct 2021 09:44:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Han Xu <han.xu@nxp.com>, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
Message-ID: <20211015094450.6350c630@xps13>
In-Reply-To: <9f4ed2c6-7b3d-4933-2247-541855b800ba@geanix.com>
References: <20210522205136.19465-1-han.xu@nxp.com>
 <13c975bc-b37b-8708-9ac7-acdc62ef7108@geanix.com>
 <20210525191308.jlxqvy7khptbuj4z@umbrella>
 <20210526094136.279976a6@xps13>
 <20210526141700.5gygssig4rnzn6mj@umbrella>
 <20210526173123.1787713b@xps13>
 <20210705104654.gko7ettkilrrosi7@skn-laptop>
 <20210706025001.bqvrdye4v3cidm5v@umbrella>
 <9f4ed2c6-7b3d-4933-2247-541855b800ba@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_004458_468066_9CAD6FFC 
X-CRM114-Status: GOOD (  14.80  )
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

SGkgSGFuLAoKc2VhbkBnZWFuaXguY29tIHdyb3RlIG9uIFR1ZSwgMTIgT2N0IDIwMjEgMTE6MTU6
MjcgKzAyMDA6Cgo+IE9uIDA2LzA3LzIwMjEgMDQuNTAsIEhhbiBYdSB3cm90ZToKPiA+IE9uIDIx
LzA3LzA1IDEyOjQ2UE0sIFNlYW4gTnlla2phZXIgd3JvdGU6ICAKPiA+PiBPbiBXZWQsIE1heSAy
NiwgMjAyMSBhdCAwNTozMToyM1BNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+
IEhpIEhhbiwgIAo+IAo+IFsgLi4uIF0KPiAKPiA+PiAKPiA+PiBIaSBIYW4sCj4gPj4gCj4gPj4g
SXMgdGhpcyBzb21ldGhpbmcgeW91IGFyZSB3b3JraW5nIG9uPyBJZiBub3QgSSByZWFsbHkgdGhp
bmsgd2UgbmVlZAo+ID4+IHRvIHJldmVydCB0aGUgY2hhbmdlcyB0byB1LWJvb3QsIHRvIGFsbGln
biB2YW5pbGxhIHUtYm9vdCBhbmQKPiA+PiBrZXJuZWwuICAKPiA+IAo+ID4gSSB3aWxsIHNlbmQg
cGF0Y2hlcyBmb3IgYm90aCBrZXJuZWwgYW5kIHUtYm9vdCB0byB1c2UgbGVnYWN5IGJjaAo+ID4g
c2NoZW1lIGJ5IGRlZmF1bHQsIGFuZCBhZGQgc29tZSBjb2RlIHRvIHRyZWF0IGZldyBNTEMgbmFu
ZCBjaGlwcyBhcwo+ID4gY29ybmVyIGNhc2VzLgo+ID4gICAKPiAKPiBIYXZlIEkgbWlzc2VkIHRo
ZSBzZXJpZXMgcGF0Y2hlcyBmb3IgdGhpcz8gOikKClllcywgdGhpcyBuZWVkcyB0byBiZSBmaXhl
ZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
