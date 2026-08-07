Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB02C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cirygl+uRRsetn/P+JJw6zD2PnULhFhTno3qmL1GFE=; b=siRmIiz/1Dh+C0
	7Yq/UJAVoIiyhZJyAv8mXuj5Q1y5xVt+gMjRJALXeIKu0B5xLpyooej/kQiTfPUDcMGJmuQAjR69R
	ucpUR4WN91QN/H15wGwhxdAot2XHbEqu60lgOcLH4rzhESsi3oKCf6nP0ClPhoeTYerVvzQ8zQT50
	Br5GsZiCTYkaohsI6jF5y6GUTe1SVdKDtrS5Q+aJg131qYsAjFIKvm/UzZTsd7+5ggGFSQg6S9P7k
	ry00w/W99BUJ4Ppy+7H5fhJLR5DuLIIxD/NrOgTe4xWB4NrFmcitTq/m0+IC/QOj2130dz26DqV6C
	eu2kyUBfaJibVuS+Rm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7c-00000008DR8-0JfS;
	Fri, 07 Aug 2026 14:00:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL7X-00000008DOD-36Fr
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:00:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 374354E4113B;
	Fri,  7 Aug 2026 14:00:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 042F9603F0;
	Fri,  7 Aug 2026 14:00:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 066AC11C37961;
	Fri,  7 Aug 2026 16:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6lV9/IV3vY0Q3vFQimwyVCaCzcjeyGIXdqkHQptqsAs=;
	b=TRddY+V6wgS4KZ8eRTVUQ3rg3Yup5zn5SyOY4mWBBzyOYE9Kzg03eNPrVbtCS2haZlRXyj
	roZlAZ5KU7BvY9HZsAqHhDYibllRcCZJB7RMtfki3sM/eLEnowA3F1ATEqSgFpbfMBj2w5
	p31u20hL+4Zy4qzcKScrC0Gxdf1X1YV7qzwxHYDdiuV5PLTU6S+vnwqdcfQqNSqU8kJqNy
	80Ifofrf55FX1yF2iFd9f/WocxuXRRupwLupjoVMOFAoYNggs0DtKrWfGDlWj+rHu0DrMa
	jmOZM3utZFqEPnYxXVBT0hnWOgw6pAJ87c01ZFjAWq1T7pVBr7wml88sZlK+7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, han.xu@oss.nxp.com
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>
In-Reply-To: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
References: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: add debugfs entry for BCH
 geometry
Message-Id: <178611121596.758547.3889962762044128142.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_070023_985981_AA3CA820 
X-CRM114-Status: UNSURE (   4.20  )
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

T24gV2VkLCAyOSBKdWwgMjAyNiAxNDoyMjoyMCAtMDUwMCwgaGFuLnh1QG9zcy5ueHAuY29tIHdy
b3RlOgo+IEV4cG9ydCB0aGUgQkNIIGdlb21ldHJ5IHBhcmFtZXRlcnMgdmlhIGRlYnVnZnMgdG8g
YWlkIGRlYnVnZ2luZyBhbmQKPiBwcm92aWRlIHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24gZm9y
IGxlZ2FjeSBrb2JzLW5nIHRvb2wuIFRoZSBkZWJ1Z2ZzCj4gZGlyZWN0b3J5ICJncG1pLW5hbmQi
IGlzIGNyZWF0ZWQgdW5kZXIgdGhlIHJvb3QgZGVidWdmcyB0cmVlLCBleHBvc2luZzoKPiAKPiBi
Y2hfZ2VvbWV0cnkgIC0gYmxvYiBjb250YWluaW5nIHRoZSBzdHJ1Y3QgYmNoX2dlb21ldHJ5IGZp
ZWxkcwo+IHJhd19tb2RlICAgICAgLSBmbGFnIGluZGljYXRpbmcgcmF3IG1vZGUgc3RhdHVzCj4g
Cj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25h
bmQ6IGdwbWk6IGFkZCBkZWJ1Z2ZzIGVudHJ5IGZvciBCQ0ggZ2VvbWV0cnkKICAgICAgY29tbWl0
OiAxMTNmNjIyMjVlOThmZWJhYmJhMGZlZTAwYWZkMjlkNGVhZjY1YWJiCgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
