Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A4CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hj3vZnXtQ/X9Bn3hnbVFow00P6EjIJZE506NTEm3xnQ=; b=w7CsqnDUqlj6fF
	kt3V0Va0NJY4X72up1+NpaB+35pVLdqvL5gx9SLesKuEZbMRYHI8u7gQtEACXjK+WaFUYFhraol1n
	uS3e1aJPUgDGMWHDdu7Z7PfWBFcsJyP8yTTg8xf5SpMhgfnlq4J2Hz7Z8C5dww42It90eqgtN/rob
	j39hJkCGt6x3Wa7inAHZjq9uub0ZsBieqeYO63/PAQT1w7FqFKBVQXnpyA5XV1CcoJXjenxhTZkRU
	OHAqg8LuhFIP5R9R8o+ScmjqDFMEO3PIoIWUSSty4sBTrBXoalLhMVByWpn32pxbYyAm1ZsssNBKl
	RASRd3XCw8amfYUrT/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtW-008ztc-0G;
	Mon, 16 Oct 2023 09:28:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtU-008zsf-1h
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5q27OgCjjc9g/gAlC6E3B0y+4V1yXuQUa+wU/YQEysc=; b=UEsvrrxcdBl1RHqEzhRP+VAVup
	g9huVyfeMcYk8nbcjp6oDUCtlnIYliQ2p5ei5YY9OGuYKP4Y506i5H5siHiCzVsLkSbgV1reBsJDz
	Td6zExZ+qxiPoIWClExRemRoF+LRClIhPuR1Vg8JEVB4HUtSKTyCQzHTsNVl/vHXGwxgaOAnX34bQ
	3cQhn51HKq1GLW8S8FIcxdSFB5ZLPIth1o5peIqX8u6nxvnLExGECh5FEPn7u8o+YTzCH0aWIJUWT
	gwk3EYVRxCOGohgNkD/uuvr22KGhEmLWMXXoBR/0vb4EZTX1GWZXZP/4gR0HM6Nx9XEQ97QkHe3Le
	oOgz7J0g==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtC-005rWg-1B
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E33A40016;
	Mon, 16 Oct 2023 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5q27OgCjjc9g/gAlC6E3B0y+4V1yXuQUa+wU/YQEysc=;
	b=LDbwka66Dk2lVVKRDl8EsS/ClDan9I+G02biDcRBUWAG2uMn93st9T58aYXkRH3SqyeLtl
	rPtRNNJmJ+lEJVW/gHdAu7j8zc5yaGdPfHMPVlMY4Ek/NWL4/XJ4NY/VesLyoVueXZQT4N
	PvD7H7kxSBi+vZD3FpGTxir41fri6Y4w6Pv5+Xmfbt5LJ6SviwFOcmn/hRWamXupd+wzEc
	kmAkRq+AxorAo3GLTSnTjyRfjjM0Oh7PWS1g4MwxQQmR/dI3Aaju6pBmYm1H+QTIqJEj5Q
	r0MVoOs+pBnIDHKSK1s0tFIusY7mLR+5dQu6WGFLSAeBxGcGp3DIrTR24VuEFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 12/20] mtd: maps: lantiq-flash: Convert to platform remove callback returning void
Date: Mon, 16 Oct 2023 11:27:47 +0200
Message-Id: <20231016092747.288539-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008200143.196369-13-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5882bf98089f3a9ecbee5a57ae0aec6f54797855'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102756_150425_2F6C4C2B 
X-CRM114-Status: GOOD (  11.05  )
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

T24gU3VuLCAyMDIzLTEwLTA4IGF0IDIwOjAxOjM1IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZv
cm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9y
cyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4g
cmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGln
bm9yZWQgKGFwYXJ0Cj4gZnJvbSBlbWl0dGluZyBhIHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxs
eSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLgo+IAo+IFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4KPiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8K
PiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBh
ZnRlciBhbGwgZHJpdmVycwo+IGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVfbmV3KCkgd2lsbCBiZSBy
ZW5hbWVkIHRvIC5yZW1vdmUoKS4KPiAKPiBUcml2aWFsbHkgY29udmVydCB0aGlzIGRyaXZlciBm
cm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2FsbGJhY2sgdG8gdGhl
IHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBt
dGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
