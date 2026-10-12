Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A99CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LB6zeRO6USwUe91BQIaeHEA9NBy8FHN+O3ZypU30DWU=; b=lMbyCkbQGMrLv+
	brhFN8LBlH1k0KtcU5SYPeGwawin6E0ykO6hfDTl395bTjoObDdzzD4SF/myfdniDmon7A0PEdqPe
	/BZdBag3eW9A+X+ef/QSTbkQXAQORRxQGyuhmWx6CiZjja3MeLT+0ymShmoFe+2tQ/kHqTB/jiG9b
	TTjmYAcvHRezqUjVc1iZiZwxnygT+06w0hqrNWBCH2RRmD2KJUhjyv46rBY67N8xv4kzJysHAntOT
	oZuoqkIlMNG5nR7KzM8e5xCIyjn+8trKPj1tcEczE26VyUSnFLvx/7RFmTuJEUL9IwMuLAi1k8Gze
	poNmMEhDEmmluVMLMbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeF-0000000BDJZ-1ifp;
	Mon, 12 Oct 2026 18:21:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeC-0000000BDGQ-3AFf
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F27A4E41201;
	Mon, 12 Oct 2026 18:21:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23C5B601A6;
	Mon, 12 Oct 2026 18:21:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D09F211D709B8;
	Mon, 12 Oct 2026 20:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Dr0yQMx5y+NsGfJT3kSR05BKOMIq8JUY/zpObj0CJo=;
	b=l+ilHUZsV1BqHGrOIYBxy5nBft91wnYnQfF9b5RwQeRG47J8P9B5+05AmCIw9eLvbdXXzv
	oYIIJ1PGFLmnII+wZlOG16Uei2FTjXr6K1yVWEe1QloYd8cfq7h7+Lw1YIpmSLm26BIdDt
	pjsBA+blffQ+r2pVyHi/2tlpqzNLcuY+E+U7GLVw+YUEi6tRMdYMDMVMJ6/23Mzl+ojono
	+s8Jb3xkIsM7w8rsubZa/agVuyvtdk4kao/kdN6R7qbrazSFTj2epuKMFgUJ2RiMO9dwke
	KZRGMiD21QsyGz5fcfzon1e8ujK5YDOwIU+ouy5AkcHB3QK9bOVhtsY6Xs4Hfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261010125925.175440-1-ghahramani.navid@gmail.com>
References: <20261010125925.175440-1-ghahramani.navid@gmail.com>
Subject: Re: [PATCH] mtd: spinand: heyangtek: Reserve both bad block marker
 bytes
Message-Id: <179182927372.590599.5644167946753406275.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:13 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112117_321653_F1C52DE3 
X-CRM114-Status: UNSURE (   4.95  )
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

T24gU2F0LCAxMCBPY3QgMjAyNiAxMzo1OToyNSArMDEwMCwgTmF2aWQgR2hhaHJlbWFuaSB3cm90
ZToKPiBLZWVwIHRoZSB0d28gYnl0ZXMgcmVhZCBieSB0aGUgU1BJLU5BTkQgYmFkLWJsb2NrIGNo
ZWNrIG91dCBvZiB0aGUgZnJlZQo+IE9PQiByZWdpb24uIFRoaXMgaXMgYSBzZXBhcmF0ZSBNVEQg
Zml4LCBjb21waWxlZCBidXQgbm90IGV4ZXJjaXNlZAo+IHRocm91Z2ggT09CIHdyaXRlcyBvbiBo
YXJkd2FyZS4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6
IHNwaW5hbmQ6IGhleWFuZ3RlazogUmVzZXJ2ZSBib3RoIGJhZCBibG9jayBtYXJrZXIgYnl0ZXMK
ICAgICAgY29tbWl0OiAzMGRhYWYzZTc4OTdiNGE4ZDliNzJlNWIwYzg2ZGQ2ZTJhNGQ3ZDg1CgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
