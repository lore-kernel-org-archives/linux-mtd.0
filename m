Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A231C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U1lJ8IULFFJivu3fF6nAZyhq/sawfHI9TIo7pghK94=; b=bsHFKaHr5mZBtT
	LP53RHagOJENXOnCMmeaO3OoRfv4102gphxFyqfdbuDaEs3Ry/BziRtwaODO/8ZlPwu5iPMbUQwoX
	IoBKBC0Y3JxMPJYq9j898EJccbO99bvwqk1zT9KuLGRPNDrvcu8EVv/NGxBbodwyd4qpDU45lMUwp
	VmqfMtnClqzC3d/kuDrmP5dOBSI4hbPTT2nRk0X8MLCJIEvXgIoz1HDDYE/mbD5CzqYBNpuETq3EC
	opvIK7AGWLb4JQqgEDr/59jZhAi8UxpRiW+AARtdPZHm67w9G9bl8njXfHsqYid0PgwluWUP+noIW
	nPrr1Z882DBoQdNdR9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLbZ-000UBM-9Y; Thu, 06 Oct 2022 07:47:41 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogLbV-000U9I-Ag
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 07:47:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6BAD62000C;
	Thu,  6 Oct 2022 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665042451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8pkyBJA5JrizUTo/1Xl3lpdJ31+1JnIMLqVBaslfhqo=;
	b=HYZWRevxTVkiCxrr0UvJAvwRggrGwNnww+vvqX869KtTR/n+Bq/pxHxIvJIj5MQX8JM7BY
	9tyIb4rSiSWvf6QD4sWWPrr89yuZ6EZ6AKJ30c0CXdXXQ7xMG4ydI2TqrUzN//iRQZne4F
	RXTBfQQNxlSNSBsYMFJkwgnpyZNVNI9Mrdenv/yt0jVBl+LgyQ/GfoPQIvbc2wWSsJKEUE
	EAQdUKqVbrDOSRr8nonU8+JUbYnn5l99hucj2vHsM79IJR8ina+mY0pbuG214bDH+bdamL
	VKER5djhHqEPIuB71ibbiKco9vJubonSBdGjFonA/BJx4mcAM0vLeV2pJmLf5Q==
Date: Thu, 6 Oct 2022 09:47:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: mpc5121: Replace NO_IRQ by 0
Message-ID: <20221006094729.61ff9b24@xps-13>
In-Reply-To: <4e3ca3e0077ea124ea210c312e6e620f0f9e8bca.1665034065.git.christophe.leroy@csgroup.eu>
References: <4e3ca3e0077ea124ea210c312e6e620f0f9e8bca.1665034065.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_004737_694401_0EC7999C 
X-CRM114-Status: GOOD (  16.00  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldSB3cm90ZSBvbiBUaHUs
ICA2IE9jdCAyMDIyIDA3OjI5OjEyICswMjAwOgoKPiBOT19JUlEgaXMgdXNlZCB0byBjaGVjayB0
aGUgcmV0dXJuIG9mIGlycV9vZl9wYXJzZV9hbmRfbWFwKCkuCj4gCj4gT24gc29tZSBhcmNoaXRl
Y3R1cmUgTk9fSVJRIGlzIDAsIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMgaXQgaXMgLTEuCj4gCj4g
aXJxX29mX3BhcnNlX2FuZF9tYXAoKSByZXR1cm5zIDAgb24gZXJyb3IsIGluZGVwZW5kZW50IG9m
IE5PX0lSUS4KPiAKPiBTbyB1c2UgMCBpbnN0ZWFkIG9mIHVzaW5nIE5PX0lSUS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+
CgpEZXNlcnZlcyBGaXhlcyBhbmQgQ2M6c3RhYmxlIHRhZ3MsIGlzbid0IGl0PwoKPiAtLS0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21wYzUxMjFfbmZjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tcGM1
MTIxX25mYy5jCj4gaW5kZXggODAwZDc3NGFlZDhlLi5mNjgzNDljYjc4MjQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L21wYzUxMjFfbmZjLmMKPiBAQCAtNjYzLDcgKzY2Myw3IEBAIHN0YXRpYyBpbnQg
bXBjNTEyMV9uZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApCj4gIAl9Cj4gIAo+
ICAJcHJ2LT5pcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChkbiwgMCk7Cj4gLQlpZiAocHJ2LT5p
cnEgPT0gTk9fSVJRKSB7Cj4gKwlpZiAoIXBydi0+aXJxKSB7Cj4gIAkJZGV2X2VycihkZXYsICJF
cnJvciBtYXBwaW5nIElSUSFcbiIpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
