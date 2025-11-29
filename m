Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33DACFD2F6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdE3VUfbYcuOmr4LNVAQjN2x7B6YhQrOI8laXs62LfM=; b=r1khEqZO1sGc2V
	N2OEp2TI2ECaCLTkmbfbDilihP+pMYmoqZT2HNplBSBxJnzfOr9RdmR5lNbvLeGyO0WJShIwPGzNm
	bcPhimKlTXOceGDTVytSR5lKRYPzIoQB4DLXdjG8qB74XvvSw9deFHkTjeWd+UvjyamwP7BzmeqP9
	PHnaqeNXlpKUHzk5JN3nAlcIt7jWzBea/EXRcohPFiVG1bKNsOrtbl0qMjSDvNZVkE3YYVNCNczGi
	5q1UA6v0kaCyrdLC00MA8nQd/dJosPxrbgxi+s8xlraJbJVc05YE7n1HvBjuIFajXp2yXmjo5Yofe
	JlFUptu7evJQGeCSp1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKGN-00000001Ws1-3Uck;
	Sat, 29 Nov 2025 12:41:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKGK-00000001WrU-0U2G
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:41:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 904D3C10190
	for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2025 12:40:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E76460706;
	Sat, 29 Nov 2025 12:41:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0217119105D5;
	Sat, 29 Nov 2025 13:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SGCJVlezrcYpbSJZl2lVwDRaAMws/AnzxRY5HC06ZSI=;
	b=IEs+85iADSK6YBTFkvubGew5BtYfm5+p7kKhM2EvSPmSUyR5QYpCXgPztuzLXeHPt7zEPr
	54nSln5sUDyWHInXNuZU/TpCpxFXVuD2XklK/0tsYuUkLQEMKkS20vruXe+t08CsjgD85/
	7FY1iyFr7Kc8W+0YsPHMaA0s+kpivKkMWSd8NfkEfY1NH7Xsw6De/FKnGm8Cgobeej4aJh
	JyWs17MU2obpWakCB9FBnFNBqAWrVpR3Co8Gq9rzktZppVHdN6vXCnp7ySCfZVGVPjBrve
	mh2JugcKRGgVAoaad3y4sh9cIyqNUcjZ0nce8Yk6Efz0alnzMN1Jrp/650s6sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 kernel test robot <lkp@intel.com>, 
 Markus Stockhausen <markus.stockhausen@gmx.de>
In-Reply-To: <20251119193357.127469-1-miquel.raynal@bootlin.com>
References: <20251119193357.127469-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: nand: realtek-ecc: Fix Kconfig dependencies
Message-Id: <176442006424.43289.2392875005061752943.b4-ty@bootlin.com>
Date: Sat, 29 Nov 2025 13:41:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_044116_669567_AB1D4806 
X-CRM114-Status: UNSURE (   7.54  )
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

T24gV2VkLCAxOSBOb3YgMjAyNSAyMDozMzo1NyArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGUgZHJpdmVyIHVzZXMgRE1BIGJ1dCBkb2VzIG5vdCBtYXJrIGl0IGFzIGEgcHJlcmVxdWlz
aXRlIGluCj4gS2NvbmZpZy4gQXMgaXQgaXMgYWxzbyBkZWZpbmVkIHdpdGggQ09NUElMRV9URVNU
LCBhdXRvYnVpbGRlcnMgY29tcGxhaW4KPiBhYm91dCBjZXJ0YWluIHN5bWJvbHMgbm90IGJlaW5n
IGF2YWlsYWJsZSB3aGVuIGxpbmtpbmcgb24gYXJjaGl0ZWN0dXJlcwo+IHdpdGhvdXQgRE1BIHN1
cHBvcnQgKD8pIGxpa2Ugc2guCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoK
WzEvMV0gbXRkOiBuYW5kOiByZWFsdGVrLWVjYzogRml4IEtjb25maWcgZGVwZW5kZW5jaWVzCiAg
ICAgIGNvbW1pdDogNDFiZGVjMTMzZGMwYjc5ZTE1MmY4ZGRhMGJmMmY3MWE1YWJiNTgzOAoKUGF0
Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpw
YXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0
aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
