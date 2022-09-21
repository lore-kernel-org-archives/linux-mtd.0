Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1BAC32771
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Sep 2022 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djSULG0Yq8JG0lQvmci3UCXONyDNSfG03uoln8AT3R8=; b=Z7gwxivQCfo8Dn
	BvzhlRj8os1bEA9JcpdHQuiudn6fnf31F0WBNtIRr1mi+vPGMyyV0YQCwl6ZywgwiV9zMf0bhEBxd
	92nY9UplM9VQVmG9Z0rQ6OTvSJ+5eDV9G219SwinHKarEOWt6/dDvznuooXYU6z65xz9fXDpzAUGW
	Izb8q+EAnikOiglHdONB5yP48VaTeqMj6Su54ZhXmPrnjp1ri9XMby6AQXZIGkWQWfdBP1rEdtlkK
	bYZ5FnaO3aVpbjZT9F/zVU5Zujrwdhg4HERFaR0qlHMhSscvMhA4HcNiTGvA2RE8ns9mbXMB0PQVo
	Nl1SZu5xS5bNpuaz0A1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavMR-00A52i-O5; Wed, 21 Sep 2022 08:45:40 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavIM-00A2sR-78
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2022 08:41:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 09DE8FF807;
	Wed, 21 Sep 2022 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663749683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkIYDz0g1aDOn6XHJK7GdoNw26KyCG2dLZgmn/ut9Q8=;
	b=YJK5n+/qK2TnS6XJ2Gmp4n7EtE/tOjmztMshZcUB51PzZR4mosZT5tLStt650DlOB0UL2Z
	WSTh9CDEeROZNuRQKV7HrtP/BkqrVl2GwQ5WBIDYpD/XM3eq+leZR9Wv2BtSapaWWcJJxa
	eWOFhz1BeM5/jFmKQD5PFaHfbFUrzqBauYRGbcyO78oBbzwclh9Dm8JtehTcEoThN0rTrW
	Z8kIeumwURgOLtlmnFUWh9dmjbHoGfrqBQU/RGzgL7ZiacYGVxq1+YcVkWES8AxirZWNlY
	U2v57beoNmzYkTP50h5tLbcT9GMeNypEYHNuhxBLunGCzpuDKkGm2T6oK3bhVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mtd: track maximum number of bitflips for each read request
Date: Wed, 21 Sep 2022 10:41:20 +0200
Message-Id: <20220921084120.733357-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629125737.14418-2-kernel@kempniu.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'65394169bdae073bfb2c6816f5bf095bd7d53e61'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_014126_446005_F2C990A1 
X-CRM114-Status: GOOD (  11.21  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjU3OjM0IFVUQywgPT91dGYtOD9iP1RXbGphR0hGZ2lC
THhKbHdhV1hGaEE9PT89IHdyb3RlOgo+IG10ZF9yZWFkX29vYigpIGNhbGxlcnMgYXJlIGN1cnJl
bnRseSBvYmxpdmlvdXMgdG8gdGhlIGRldGFpbHMgb2YgRUNDCj4gZXJyb3JzIGRldGVjdGVkIGR1
cmluZyB0aGUgcmVhZCBvcGVyYXRpb24gLSB0aGV5IG9ubHkgbGVhcm4gKHRocm91Z2ggdGhlCj4g
cmV0dXJuIHZhbHVlKSB3aGV0aGVyIGFueSBjb3JyZWN0ZWQgYml0ZmxpcHMgb3IgdW5jb3JyZWN0
YWJsZSBlcnJvcnMKPiBvY2N1cnJlZC4gIE1vcmUgZGV0YWlsZWQgRUNDIGluZm9ybWF0aW9uIGNh
biBiZSB1c2VmdWwgdG8gdXNlci1zcGFjZQo+IGFwcGxpY2F0aW9ucyBmb3IgbWFraW5nIGJldHRl
ci1pbmZvcm1lZCBjaG9pY2VzIGFib3V0IG1vdmluZyBkYXRhCj4gYXJvdW5kLgo+IAo+IEV4dGVu
ZCBzdHJ1Y3QgbXRkX29vYl9vcHMgd2l0aCBhIHBvaW50ZXIgdG8gYSBuZXdseS1pbnRyb2R1Y2Vk
IHN0cnVjdAo+IG10ZF9yZXFfc3RhdHMgYW5kIHNldCBpdHMgJ21heF9iaXRmbGlwcycgZmllbGQg
dG8gdGhlIG1heGltdW0gbnVtYmVyIG9mCj4gYml0ZmxpcHMgZm91bmQgaW4gYSBzaW5nbGUgRUND
IHN0ZXAgZHVyaW5nIHRoZSByZWFkIG9wZXJhdGlvbiBwZXJmb3JtZWQKPiBieSBtdGRfcmVhZF9v
b2IoKS4gIFRoaXMgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIHVsdGltYXRlbHkgcGFzc2luZyB0aGF0
Cj4gdmFsdWUgYmFjayB0byB1c2VyIHNwYWNlLgo+IAo+IFN1Z2dlc3RlZC1ieTogQm9yaXMgQnJl
emlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQv
bmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
