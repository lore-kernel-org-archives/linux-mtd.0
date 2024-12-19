Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971E8E7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G88K7NHPOPGRKC9RVyW0mExaXgS33eNKd1mm1pJRBbQ=; b=wfxc8T0bhmYJwv
	ypna5zeUKEHjiQkgcVOzYdkIWtOnlkZoFk37ewRMMZqXUThCf5KDhl6K+y7/oHDq+RcfV41lLKaaI
	GW9XsG6AE5na1akCGRFKxmz/3f8uD2vNvJT1ajpyIabjgWQB9dH7bI0iiCIKqrPO21I7zXs0VTLJr
	EmW4OgX2gSg/cOs2gdk4P1E4GgkhZOgID7tOqwG5aou6xZn9uZL8g2jqea6TUm7eUgp0hZowGWTw4
	1XhqnIJ6Wiv9OgVr140BQxcWNbZPOlYnHnL/hbcX1+TuqShxNdluxCrVVyGiHUODKCynd0G9gMO5u
	DbB7YCM4j1384Gx8WluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCzo-00000001RFx-34qP;
	Thu, 19 Dec 2024 09:39:04 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCzm-00000001RE4-0PkR
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 09:39:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 835C5240006;
	Thu, 19 Dec 2024 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734601137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IpanWpJe/wGGQ+1iErUMawi8OQL0a5bJWkGJjHidT3w=;
	b=Qm2eu0hgUVKJmekn5dAx8tlaonQA11lphWj0SoA9CCHP/6QLOgsiQ/iuk8img2Kxg1rAjM
	LK51GLCX95ymOrxUOrJ16xOkr5c6ql+/iuq/768dPztxajFgAHxDnesgp/ujSO3+921RbQ
	Ox950nJ9lAE9iNXgoJZl2FUdTBN3Z+OFHDQ+DpvV+2nJ82Mm51T7QbfKJT1fVCkJD1RtpL
	K3TyxV7ZqTY5c7VqZKcFi7Bdg6b85YiUiCDRlMUiaLAv1TrmZoAGV+kT5Ql9BBPiuSieHz
	SSLr3ZQ6+TPtsqNeMP2kaBuIQDILxP8vojUyBfz3m8QNgauzlm/d0eaHkXHrvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Renjun Wang <renjunw0@foxmail.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of
 struct flash_info
In-Reply-To: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
	(Tudor Ambarus's message of "Thu, 19 Dec 2024 09:20:04 +0000")
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 10:38:56 +0100
Message-ID: <87r064c8r3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_013902_284570_7AA020D6 
X-CRM114-Status: GOOD (  10.80  )
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

T24gMTkvMTIvMjAyNCBhdCAwOToyMDowNCBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFdlIHVzZSB0aGUgc2l6ZSBhcyBhbiBpbmRpY2F0b3Ig
d2hldGhlciB0byBwYXJzZSBTRkRQIG9yIG5vdC4gV2UgZG9uJ3QKPiBpbnRyb2R1Y2UgYSBkZWRp
Y2F0ZWQgbWVtYmVyIGZvciBTRkRQIHBhcnNpbmcgYmVjYXVzZSB3ZSdkIGxpa2UgdG8ga2VlcAo+
IHRoZSBzdHJ1Y3Qgc2l6ZSBhdCBhIG1pbmltdW0sIGFzIGl0J3MgdXNlZCBmb3IgZXZlcnkgZmxh
c2ggZGVjbGFyYXRpb24uCj4gSWRlYWxseSB3ZSB3b24ndCBoYXZlIGZsYXNoIGVudHJpZXMgYXQg
YWxsLCBidXQgdGhlcmUgYXJlIHN0aWxsIGZsYXNoCj4gcGFyYW1ldGVycyB0aGF0IGFyZW4ndCBk
ZWZpbmVkIGJ5IFNGRFAsIHRodXMgd2UgbmVlZCB0byBzdGF0aWNhbGx5Cj4gc3BlY2lmeSB0aGVt
LgoKVEJIIEknZCBiZSBwZXJmZWN0bHkgZmluZSAoYW5kIHByZWZlcikgYSBkZWRpY2F0ZWQgbWVt
YmVyLCBiZWNhdXNlCmNvZGUgY2xhcml0eSBpcyBJTU8gbW9yZSBpbXBvcnRhbnQgdGhhbiBtZW1v
cnkgZm9vdHByaW50IHRvZGF5LgoKSG93ZXZlciBmb3Igbm93IEkgYW0gdG90YWxseSBhZ3JlZWlu
ZyB3aXRoIGNoYW5nZXMgY2xhcmlmeWluZyB3aGF0IHdlCmN1cnJlbnRseSBkbywgc286CgpSZXZp
ZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCk9uZSBt
aW5vciBuaXQgYmVsb3cgdGhvdWdoOgoKPiArICogQHNpemU6ICAgICAgICAgICB0aGUgc2l6ZSBv
ZiB0aGUgZmxhc2ggaW4gYnl0ZXMuIFRoZSBmbGFzaCBzaXplIGlzIG9uZQo+ICsgKiAgICAgICAg
ICAgICAgICAgIHByb3BlcnR5IHBhcnNlZCBieSB0aGUgU0ZEUC4gV2UgdXNlIGl0IGFzIGFuIGlu
ZGljYXRvcgo+ICsgKiAgICAgICAgICAgICAgICAgIHdoZXRoZXIgd2UgbmVlZCBTRkRQIHBhcnNp
bmcgZm9yIGEgcGFydGljdWxhciBmbGFzaC4KPiArICogICAgICAgICAgICAgICAgICBJLmUuIG5v
bi1sZWdhY3kgZmxhc2ggZW50cmllcyBpbiBmbGFzaF9pbmZvIHdpbGwgaGF2ZQo+ICsgKiAgICAg
ICAgICAgICAgICAgIGEgc2l6ZSBvZiB6ZXJvIGlmZiBTRkRQIHNob3VsZCBiZSB1c2VkLgoKdHlw
bywgJ2lmJyAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl4KCkNoZWVycywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
