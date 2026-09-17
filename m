Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63829C88E72
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgckgXQnuVOdORMyy6DE+8HOkz4M1V4RLj70MEkejvk=; b=XLv+4PY1OSuuEc
	3wnD/m98jWL6chH/ZmigvDEMaNwViJMYjyWemyvZvKzVaAElA2Su/0Vz+K4FpNh/J9687aRj38MWj
	Dln8v3i9Qp3+bMXu99ae1wQWeCBfNrz2upgBIhW3K86+Ez8R+i8riDeMAoaVtcZIrY31w84WJBDFb
	zWTX6qTutHpLD222sRoK6YpMUVyw/ZbDQI0Dwaq9hrWJfFw6pH6ZG4CJiEMnV6ElXYGBZ1AGCmnBx
	7XtJ1T8OB3vyeus/G7rW5p7MEggErkaC8iZlU0xvrkzP6b3syCZQENWzpsNHr4r/4RYMqzUZkHbjN
	9v5M+0/aQYN4YowKQCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Dok-0000000BeO3-06th;
	Thu, 17 Sep 2026 15:14:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Doh-0000000BeN0-15IG
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 15:14:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29E381A08DF;
	Thu, 17 Sep 2026 15:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E60A45FAA3;
	Thu, 17 Sep 2026 15:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C48AA11C7B08A;
	Thu, 17 Sep 2026 17:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789658063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e3P/+/yIGtxO1T/saGf7krdxhKHT0Mu+avVGd5AVK4w=;
	b=JANqcnIZEsvNsQBMEBljCrCt4CemJfCC189GdFFH+1xZiHIlcSqavthYbAo/NkdcgzpEse
	nKoQ17RB2nOnMFeQKAW21Z9wPE7yY1JnCY7/YmJR75K8r+lGg8LArHWpbH6KG4WJ9SCEHw
	z7lmWod1pU5UYmjJ+xEMH5yEA/yd6ueFh3tpqRk/fm0b3QVgsf9tCilolRfkZKZHYex5aW
	nwWBnCupOHmYF0qZM68ynG4hFksMAKv/G0L//SEHcS+JxIZxq+joMXm6FnO5e3jKsRzZN2
	Jj/PWvXR+62y8P3cshdGcIP/G47SI/WqYZVq+2kYf7O2wKNV+/fdqcIRNzf0AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  vigneshr@ti.com,  Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: Call get_wunit() on the master partition
In-Reply-To: <20260917145329.380628-1-rw@kernel.org> (Richard Weinberger's
	message of "Thu, 17 Sep 2026 16:53:29 +0200")
References: <20260917145329.380628-1-rw@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 17 Sep 2026 17:14:21 +0200
Message-ID: <87ik43j4fm.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_081427_452079_18EFC6D6 
X-CRM114-Status: UNSURE (   5.36  )
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

T24gMTcvMDkvMjAyNiBhdCAxNjo1MzoyOSArMDIsICJSaWNoYXJkIFdlaW5iZXJnZXIgKHNpZ21h
IHN0YXIgZ21iaCkiIDxyd0BrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPgo+IFRoZSBjb2RlIGNoZWNrcyB3aGV0aGVyIG1hc3Rl
ciBoYXMgZ2V0X3d1bml0KCkgYnV0IHN0aWxsIGNhbGxzCj4gaXQgb24gdGhlIGNoaWxkLiBGaXgg
dGhpcy4KCkhhIDotKQoKU2hvdWxkbid0IHdlIGFkZCBDYzogc3RhYmxlPwoKPiBGaXhlczogNDZi
NTg4OWNjMmM1ICgibXRkOiBpbXBsZW1lbnQgcHJvcGVyIHBhcnRpdGlvbiBoYW5kbGluZyIpCj4g
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KCk90aGVy
d2lzZSBsZ3RtIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
