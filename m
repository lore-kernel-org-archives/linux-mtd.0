Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEC410775E7
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzDV0YZnrn5rTiZ4HNrVyaLsPJN/CTmm5ft6TyEpETE=; b=kmEw43a30S0y1W
	4VGxABmlINqS3XCVqzpl63tfA736xgkzG7paMrt8KXVnPHN4R0tgpxkgf2fUo9pW6D4uyweJlW0wQ
	3tQoNYSbmm5xPD3AggpRoZ5RIKPCwz/cCPcdgGGfdZpMAS28oDLz1UsVq7zq8L5NtVSKpmoQXCnSj
	mUCYO7J2OtIhtr27wC1RNThoxWqOWba/CY95bP7FgrWrOYaHzPZJlwEtJKIFrWWak2gGnyDSX6dfW
	xlb1X0XL4GHPd7GThpeSnMMXlUIQLykd+xN9isu3jmpnkhaNHDCRG+D/SrvdzzOCMbDK1LzYgzaoS
	UOn2YIYHY6IZzlxQAmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uOB-000000091xN-0dBC;
	Wed, 18 Mar 2026 17:08:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uO8-000000091vL-0QED
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 17:08:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 235BA4E426F7;
	Wed, 18 Mar 2026 17:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE7F66004F;
	Wed, 18 Mar 2026 17:08:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C622710450566;
	Wed, 18 Mar 2026 18:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773853732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=61pzuZAesu8ByYmZ3JVbHhLqQagjhiutVr/a7z1VX0s=;
	b=mmR/YhO5bFc7mEsvuSvurqneMV03AQCiashHkKviUjPrsdQnwjZ81DT6UzXQ3F5b1uHQIj
	uda+A3MaAA6V/NxriRneIzSQ5M9f10Q1NUZQcrkj3fG/wtJ8okOn9ZeJ9hgM8OEg3jPp6l
	foafZ1t+PHiWwXnQzgFTa8WaN+AjE96mhFoJ2vlj/GhMRLSx3srDKJ7AhhuO7/PH1n6it7
	fo725SkLefQAZeC86fHauhzpffoTeY2BgfSZFy3ZVsamtitkqmunAM9g6CGqdxjAq6CBK3
	Jo6yo68fLUI4tsOo7qrlB5HxeuJ+YzIl7UktAysn3bOXixKHAvjwcHiQxOMN/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260317171722.431171-1-miquel.raynal@bootlin.com>
References: <20260317171722.431171-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Rename spi_nor_spimem_check_op()
Message-Id: <177385373173.729501.31849828929172479.b4-ty@bootlin.com>
Date: Wed, 18 Mar 2026 18:08:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_100856_272092_4C18DFFC 
X-CRM114-Status: UNSURE (   7.33  )
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

T24gVHVlLCAxNyBNYXIgMjAyNiAxODoxNzoyMiArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBUaGlzIGhlbHBlciByZWFsbHkgaXMganVzdCBhIGxpdHRsZSBoZWxwZXIgZm9yIGludGVybmFs
IHB1cnBvc2VzLCBhbmQgaXMKPiBJL08gb3BlcmF0aW9uIG9yaWVudGVkLCBkZXNwaXRlIGl0cyBu
YW1lLiBJdCBoYXMgYWxyZWFkeSBiZWVuIG1pc3VzZWQKPiBpbiBjb21taXQgNTAwOGMzZWMzZjg5
ICgibXRkOiBzcGktbm9yOiBjb3JlOiBDaGVjayByZWFkIENSIHN1cHBvcnQiKSwgc28KPiByZW5h
bWUgaXQgdG8gY2xhcmlmeSBpdHMgcHVycG9zZTogaXQgaXMgb25seSB1c2VmdWwgZm9yIHJlYWRz
IGFuZCBwYWdlCj4gcHJvZ3JhbXMuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL2ZpeGVz
LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNwaS1ub3I6IFJlbmFtZSBzcGlfbm9yX3NwaW1lbV9jaGVj
a19vcCgpCiAgICAgIGNvbW1pdDogMTZkZWMwMTRkYjBmNGFjNmY4MDkwZGVhMGJkZmNiMWVjZWJj
MTJjYQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
