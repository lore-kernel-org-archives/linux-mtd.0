Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3122AD116F1
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXlDnw67HVI423Z4qb+pr3xsp7aKK0XXNDoCjl0AevQ=; b=HOsxcUNRZg8Bsd
	eq5hHNoWvfAmxvI6FQboddaEKyvvwIaLjC6xqOCePEqu0k/whu14xT9vHEpnPMVI3k0SBayB4nNf5
	78DTD3eKDsX0ZuOwiJaq3TQFUY1hmUG+7xqEee6u4MNz8yDo1BOL7l2/I+bSrfpeguU5Mev9HC9ku
	qx81kHCepl/fjGGBwcZa31JQ5BI8+4FI4oTMKacP+iK6Wd0y5Ze5mX6WU68Dd3Rg8xGxub5m+WZzH
	evyyrSB9et4UyMwWyINxdackp9Y77OsdMCBY5AJslfdQA0mJvoN0ku36CeBHZ62p3B17EM+3Y1l8l
	zsA7n/dO6kfyYldk5crg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQI-00000001XVh-3n30;
	Sat, 29 Nov 2025 12:51:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKQG-00000001XTu-3KCd
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:51:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6259E4E41976
	for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2025 12:51:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38C6C60706;
	Sat, 29 Nov 2025 12:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1018D119106A0;
	Sat, 29 Nov 2025 13:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420690; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JeSgtrKyFx/WmtfzmzzOCSI+PNe0RIm3fCZTKTq6hcs=;
	b=ko5yyKLDIyaYRb/GJpV2O3IZlA8NELzqEcC74tys6WL4Rf3nAVBL8Tq9Z7hg3BtEUYkXyo
	rzKV2+ghfjgGCyBKupokZ6+WvBJNkJBtquGrXkO1IJpIrnmanHlGY0u61OeU0afoXKhbAJ
	QP0p8rDZzRwUTdecQ+SN6DOyVmDT46rXTN/Q7x6qGNySqSwzGrLihHHeCmqaj+o1HRcULY
	COYfWUdBIOfETdWl3ww03XNdO1j6hLswuhkF3o8qIFiPiX75HkDdv3fEDximz0dcgpJ8IQ
	zC4aX0wOLQXVT13SoB0sYxnq9ZYZD3NFU7//ukkMSS+QHGdUHYufWcLu1djrZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251124123124.4201-2-thorsten.blum@linux.dev>
References: <20251124123124.4201-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] mtd: sm_ftl: Fix typo in comment in sm_read_lba
Message-Id: <176442068994.77093.16245051868377075008.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:51:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_045132_992642_905F503E 
X-CRM114-Status: UNSURE (   5.89  )
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

T24gTW9uLCAyNCBOb3YgMjAyNSAxMzozMToyNSArMDEwMCwgVGhvcnN0ZW4gQmx1bSB3cm90ZToK
PiBzL2lzL2lmLwo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiBzbV9mdGw6IEZpeCB0eXBvIGluIGNvbW1lbnQgaW4gc21fcmVhZF9sYmEKICAgICAgY29tbWl0
OiAyMTU4ODkwYTFhZjE5ZTEzZWQyMjJjZGEzNjIzYzhhMTFkM2VjM2I0CgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
