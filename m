Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA9FCD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDwNWBco4QjMT7/hiKRAMGRCn8bbgfEvL2PyJYot3sQ=; b=wr4sL/ytEzfvGq
	ca1/90DAHug69gNB7UG24+0XkcUZrbuGGuKq6Ht7dbtMSvEJD51d5Ma9xn9GdmM9U+kpQ9ho4+rR7
	/TwQed5VIFwGol+otyayIW8x7e/B15iKCXiD64sc0whOa/7c+TANuqEjCtcj6hZmz3hGfK/YhrJel
	SBeU6+E/kI8SNR3EasEA9cKIPy1G9Z9s3PJpYxfXqzBHiWOuULhwp9bC3W37hp0PijhQPvhcd7lf5
	EQ8uqRk+PGbkCCAqqQLMyJfAJgcQLlnneG6ha8gvtcZDgsaK0XOaQRiECnjAs7KutKJctjQhkD7q2
	B/j7DYdp1lYvdwUSicqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAFO-00000003bHO-2mBr;
	Wed, 27 May 2026 09:08:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAFL-00000003bGl-1qUn
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:08:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A041C2C646;
	Wed, 27 May 2026 09:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C0B1601A1;
	Wed, 27 May 2026 09:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37E9410888BA2;
	Wed, 27 May 2026 11:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779872893; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kK4DTYkH4mVqwbeUHZEIbZsf6OS+5cQBMBpoc2DcWR8=;
	b=I6SVVkiOFww4QVTTTD7F7O1TYjm+ySSBsQfX6Y8/mfPsdhbzIkTo3Gsn2+jPEsG73kI9Xf
	zws+RC/t3v8l2NQgg/kDgN2g8Las5DBzhE1WmzZIj8TkkVKoTFuf7K7ttWTG8c4n5aKNHc
	W7PwTT0/MR7498W1CGFyHhYduvN66YAF+PctgU0zUDl5RlczG6MucMRePGOSwdQ/wlDUS/
	VIx+d9mXKXH6n4dxKLH0LB5HFTajOvUh6OyPzq88WBmJsBAUTINdVjzlThwEsq/z3hJq4V
	1MnYpnvnw12nbHO+Y67l43wR+OhWjHa0VDDX3obB4kvgpnJ5OVh1wHdbZxnXOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Florian Fuchs <fuchsfl@gmail.com>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Adrian McMenamin <adrian@newgolddream.dyndns.info>, 
 Artur Rojek <contact@artur-rojek.eu>
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com>
References: <20260518114521.81564-1-fuchsfl@gmail.com>
Subject: Re: [PATCH v3 0/3] mtd: maps: vmu-flash: Fix build and runtime
 errors
Message-Id: <177987289003.3980206.15138963212721838518.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:08:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020815_640783_7B77B393 
X-CRM114-Status: UNSURE (   7.53  )
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

T24gTW9uLCAxOCBNYXkgMjAyNiAxMzo0NToxOCArMDIwMCwgRmxvcmlhbiBGdWNocyB3cm90ZToK
PiBUaGlzIHNtYWxsIHNlcmllcyBmaXhlcyBidWlsZCBhbmQgcnVudGltZSBlcnJvcnMgaW4gdGhl
IHZtdS1mbGFzaCBkcml2ZXIKPiAoZW5hYmxlZCBieSBDT05GSUdfTVREX1ZNVSkgYW5kIHRoZSBy
ZWxhdGVkIG1hcGxlLmguIFRoZXNlIGNoYW5nZXMgd2VyZQo+IHZlcmlmaWVkIG9uIHJlYWwgRHJl
YW1jYXN0IGhhcmR3YXJlIHdpdGggYSBwaHlzaWNhbCBWTVUuIFRoZSBWTVUgY2FuIG5vdwo+IGJl
IHN1Y2Nlc3NmdWxseSBwcm9iZWQsIHJlYWQgYW5kIHdyaXR0ZW4gd2l0aCBNVEQgdG9vbHMgbGlr
ZSBtdGRpbmZvIGFuZAo+IG10ZF9kZWJ1Zy4gUHJldmlvdXNseSwgdGhlIGRyaXZlciBmYWlsZWQg
dG8gYnVpbGQgb3IgY3Jhc2hlZCBkdXJpbmcKPiBwcm9iaW5nLgo+IAo+IFsuLi5dCgpBcHBsaWVk
IHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8zXSBtYXBsZTogZml4IGJ1aWxkIGVycm9yIGR1ZSB0
byBtaXNzaW5nIGluY2x1ZGUgb2YgbGludXgvZGV2aWNlLmgKICAgICAgKG5vIGNvbW1pdCBpbmZv
KQpbMi8zXSBtdGQ6IG1hcHM6IHZtdS1mbGFzaDogZml4IGZhdWx0IGluIHVuYWxpZ25lZCBmaXh1
cAogICAgICBjb21taXQ6IDc5ZDE2NjE1MDJjNmU0YjZmNjI2MTg1Y2VmNzJjZjJmYTc4MTE2ZTEK
WzMvM10gbXRkOiBtYXBzOiB2bXUtZmxhc2g6IGZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
aW4gaW5pdGlhbGl6YXRpb24KICAgICAgY29tbWl0OiAzNTdlM2I4ZTNhODc2OWJhMzZlYjhlYzVl
MDUzZTQ4MjVmMWE5MzI5CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
