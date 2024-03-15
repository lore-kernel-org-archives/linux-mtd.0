Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E254C54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vrmp2ZiAdqWRtvpdHD9NgNP4UHFSe6XQHNVsKGxWank=; b=1acOtQ8+R2+yC6
	6Te7Qgh8LtCr6WYpcPaYGWg05klwb8ncPG4UyGJa51ecrABfcNzT5ALRlEkNRgqA0QgpvRnaYOTPk
	CpCudXOPVO03WBm7QfI7zoRMtUKKU0jNJr3VPWSnEjTQzSisEWg8f/TJqIi2ccaCv4fdrSnqd5eXe
	1/6tM+yBO0NQtK6HmhWPU0kLZs7FD2UinLSt9p1tejHbkeygQW25/PfbvA5K6j3aWydCn8P7BDN/T
	/IOqGsjagdOVo6pJ/aVylqbQi9uzTuzGcEqG7sUW+djRuzGZNigJgPUInoA4dW5rEpG9HIopnAJUk
	+eJ5zxt+7HDIfRDUZVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6S3-000000009Nf-0dpz;
	Fri, 15 Mar 2024 12:14:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6S0-000000009Mm-0NCL
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 12:14:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A999FE000A;
	Fri, 15 Mar 2024 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710504853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ys6zmTNnRRaNwkqda5/UM+chtWuSEH0RXOVuVZYrg58=;
	b=QEcHXLpj7xesh3WJZz+kKm0Su5uv/szxg1thn5Thka2YeoIfbkGozq3Ro+EW+61Yo4wmCz
	tNTlZDDHZgHN8WE/eKGD/cV9ebjBn/YWIULQbbjluIi3ceM5kv/YZTt6bPN8r1BaArydy0
	8kwsT5wZHxj+fyLnd8N1L3q9p01AqD8O/+WIgJSMaaw+x2QETDaFg85LYvz86BgK0iY6Oq
	Otq9YscJTeC+QfWDdaGvMMDCTmPOU4w3xbKto01Q4FPF8gr6DI2fq+QictEQIoOmNThUW+
	HT155BeK2V/mFdVRrMlQxQW3psqHYKestGmMWZTkyDTaW/oVGrj4aWJrQUlZ/A==
Date: Fri, 15 Mar 2024 13:14:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Palacios
 <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
Message-ID: <20240315131412.488167c1@xps-13>
In-Reply-To: <529774b9-20be-485d-b218-2452ce536770@gmail.com>
References: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
	<20240315122314.10c88c2e@xps-13>
	<529774b9-20be-485d-b218-2452ce536770@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_051416_283847_7D2ECC91 
X-CRM114-Status: GOOD (  12.29  )
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

SGkgTWF4aW0sCgprb3JvdGtvdi5tYXhpbS5zQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDE1IE1h
ciAyMDI0IDE0OjQ1OjQ3ICswMzAwOgoKPiBIaSwKPiAKPiBPbiAxNS4wMy4yMDI0IDE0OjIzLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSXNuJ3QgaXQgZG9uZSBsaWtlIHRoYXQgb24gcHVycG9z
ZT8gUmVhZC1yZXRyeSBpcyBub3QgYSBtYW5kYXRvcnkKPiA+IGZlYXR1cmUuICAKPiAKPiBXb3Jr
cyBpdCBhcyBkZXNpZ25lZD8gSSdtIG5vdCBzdXJlIGFib3V0IGl0Lgo+IEkgd291bGRuJ3QgcnVs
ZSBpdCBvdXQsIGJ1dCBpdCdzIGEgbGl0dGxlIHdlaXJkIHRoYXQgdGhlIGh5bml4X25hbmRfcnJf
aW5pdCgpIGZ1bmN0aW9uCj4gaXMgdXNlZCBhcyBpZiBpdCBjYW4gcmV0dXJuIGFuIGVycm9yIGJ1
dCBuZXZlciByZXR1cm5zLgo+IAo+IFByb2JhYmx5ICBjaGVja2luZyAgb2YgdmFsdWUgcmV0dXJu
ZWQgZnJvbSBoeW5peF9uYW5kX3JyX2luaXQoKQo+IHNob3VsZCBiZSByZW1vdmVkIGluIGh5bml4
X25hbmRfaW5pdCgpCgpJdCBpcyBpbmRlZWQgY29uZnVzaW5nLiBJJ2xsIHRha2UgaXQuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
