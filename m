Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B638C41513
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAe6pqla6+Qox4rRtGqYhNksKQsOjm1/rz9PXo9lORA=; b=yr1Uub+Enl8TsV
	JPG9ZPxN1mFeNRetEbxDThM6k7HSYmTs5XYZoAstknaaOvqbYN4RRidjdiaJLIMmx7lpcB9t449tn
	JRhEKyhPz5TXBVn1ENNjHv9UD0KhHd2LaE8LtHL7fIF/aof+rDkpecehNDguKgihQZKYDzCcWMLdO
	9te+NO/aYv3YvqeqXlcRXPTMB/aNxNIYLPWpbLijHkd2O0a+qneuvWdgMZIfhog7etQfVVfSVEfsm
	otNw8UlskuZhJXWpbNUFkEO8tax4NEwUqcdnDBf8QMCNfPYXMRJVHVyvWCGXlxh8IkG8xEnFb629y
	suJ5pZ8wVaGkyKnkE4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7ak-0000000GsVE-23sO;
	Mon, 03 Jun 2024 13:19:14 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7ah-0000000GsUT-0C26
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 13:19:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30E74C0003;
	Mon,  3 Jun 2024 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717420744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWTAgpYCIu49JLdIyprRH1Zu4acqXIrkyC2difOhhhM=;
	b=eYHNDE/7/U/qh4LarIt8BnyirHTGA6S+fDK3gaZYjJgV0NYPn3moTUkgEyb4k9iSoaifd0
	R8X8NIkjxcU3xiGKRl+v6V9p3JMbH1Jg3sKENAL6xIyEBeKHNUJ+B2EFQZ32roQBC9MmR4
	IA9E35QFDoT8k6luSZ3MrfR22mLrUlNm2HSFVZJtPBA5yqi5oYUjSmM8PO9IpXS1lC19mr
	ZXWXmDNtePlR1x52h9XrAj+z4q0h0A4boIcqXa+qEmXhjR/MH1u9e1XQhOc8p7BLXrvyDQ
	8HgtRocYje9zcb3ch8I6vRhLsYJh9yL+XFUTukDZb7Iu+WqfLysVmcFxsbeLsg==
Date: Mon, 3 Jun 2024 15:18:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] Documentation: mtd: spinand: macronix: Add support for
 serial NAND flash
Message-ID: <20240603151854.4db274a6@xps-13>
In-Reply-To: <2024060337-relatable-ozone-510e@gregkh>
References: <20240603073953.16399-1-linchengming884@gmail.com>
	<2024060337-relatable-ozone-510e@gregkh>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_061911_253872_0AA76E5C 
X-CRM114-Status: GOOD (  13.94  )
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

SGksCgpncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZSBvbiBNb24sIDMgSnVuIDIwMjQg
MDk6NTg6MjMgKzAyMDA6Cgo+IE9uIE1vbiwgSnVuIDAzLCAyMDI0IGF0IDAzOjM5OjUzUE0gKzA4
MDAsIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5n
bWluZ2xpbkBteGljLmNvbS50dz4KClRoZSB0aXRsZSBwcmVmaXggY29udGFpbnMgIkRvY3VtZW50
YXRpb246ICIsIGJ1dCBJIGRvbid0IHNlZSBhbnl0aGluZwpyZWxhdGVkIGluIHRoZSBkaWZmLgoK
PiA+IAo+ID4gTVgzNVVGezEsMiw0fUdFNEFEIGFuZCBNWDM1VUZ7MSwyfUdFNEFDIGhhdmUgYmVl
biBtZXJnZSBpbnRvIAo+ID4gTGludXgga2VybmVsIG1haW5saW5lLiAgIAo+IAo+IFRyYWlsaW5n
IHdoaXRlc3BhY2UgOigKPiAKPiA+IENvbW1pdCBJRDogImMzNzQ4MzlmOWI0NDc1MTczZTUzNmQx
ZWFkZGZmNDVjYjQ4MWRiZGYiLiAgCj4gCj4gU2VlIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlvbiBm
b3IgaG93IHRvIHByb3Blcmx5IHJlZmVyZW5jZSBjb21taXRzIGluCj4gY2hhbmdlbG9nIG1lc3Nh
Z2VzLgo+IAo+ID4gRm9yIFNQSS1OQU5EIGZsYXNoIHN1cHBvcnQgb24gTGludXgga2VybmVsIExU
UyB2NS40LnksCj4gPiBhZGQgU1BJLU5BTkQgZmxhc2ggTVgzNVVGezEsMiw0fUdFNEFEIGFuZCBN
WDM1VUZ7MSwyfUdFNEFDIGluIGlkIHRhYmxlcy4KPiA+IAo+ID4gVGhvc2UgZml2ZSBmbGFzaGVz
IGhhdmUgYmVlbiB2YWxpZGF0ZSBvbiBYaWxpbnggenlucS1waWNvemVkIGJvYXJkIGFuZAo+ID4g
TGludXgga2VybmVsIExUUyB2NS40LnkuICAKPiAKPiBXaGF0IGRvZXMgNS40LnkgaGF2ZSB0byBk
byB3aXRoIHRoZSBsYXRlc3QgbWFpbmxpbmUgdHJlZT8gIElzIHRoaXMKPiB0ZXN0ZWQgb24gb3Vy
IGxhdGVzdCB0cmVlPwo+IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
