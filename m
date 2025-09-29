Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A61CCAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1A+TWSSyn1rLsYvb4QLCp++x0IR7Cv2Jh9lgZqvT74s=; b=VXMfwCo6ceAsAd
	goEIT9R+JJYe+5Wu9v44dBk/1IP9an+tUXR8ZxzqGHZlJzJ6+FCphpOds95TCrGF3lcIeBvLWMIIi
	b9EXygJQPLA3QKtlPmjqNBYNNaL0xPrA8vmXfJ1maFxCEEDeV8rHA840AGIJO/VKn0chppLt6Kcuu
	KUAC5ONqBLpH9XVOpmTFvTqGDFz6DhstpniWw1e8wu1ZbkWfr8Sah1r8buB9bbD1+h6RAs6McDii5
	6Kd6HMRU0T+hSSu52Fq5wdfMOvGK2fwebbP08R4SI4RLdYWd17/CJBbE4onAlQYxlpdVscnh4KT/4
	0hdnGq24X5lmhi+gdWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEL-00000002rU0-1zfn;
	Mon, 29 Sep 2025 15:56:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GEI-00000002rRF-1iPO
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 15:55:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ACEE21A1036
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2025 15:55:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E336606AE;
	Mon, 29 Sep 2025 15:55:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D9C8102F1A13;
	Mon, 29 Sep 2025 17:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TPvcvLYB4WgLJY8jyEyevyM09bFYh3JtKjYAaSTCRMo=;
	b=y6CEjFdyA/ikNLoNAf7CXLZj1qhtht00PsZKe9zH2hGrZ22UjlkS9kQHZGh0T/LnxFHo3d
	6dYsM5oypCVEZ1x/r8DYdCfsHZMaILDiQ/3HEkk4XOUKZPy2teckxBY6d4/iNRAQlO416S
	MlAxmBkIxmFSQ5S9nFQq5JQvdzXkOaWtyxhiPBiNY0X2BGFZsceZulBqKVYKcYe2WK5KM4
	MgrlVFxi80Pb7OU+gjYmkHecZDM6kyYJHDkZp6YnasLooK9essHRcuuaWZkRg/OO9MjeRs
	Y2Pxynq1Jz9P7rJVcjqz3MeYEkADLIFu92GC/D6QzWgGqtaPjSB4ZwTaf8eHAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Hovold <johan@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250922152204.15702-1-johan@kernel.org>
References: <20250922152204.15702-1-johan@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: omap2: fix device leak on probe failure
Message-Id: <175916135511.50416.11507699706726091640.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 17:55:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085558_592521_A37F4AFD 
X-CRM114-Status: UNSURE (   6.48  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAxNzoyMjowNCArMDIwMCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+
IE1ha2Ugc3VyZSB0byBkcm9wIHRoZSByZWZlcmVuY2UgdG8gdGhlIGVsbSBkZXZpY2UgdGFrZW4g
YnkKPiBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkgZHVyaW5nIHByb2JlIG9uIGVycm9ycyBhbmQg
b24gZHJpdmVyIHVubG9hZC4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpb
MS8xXSBtdGQ6IHJhd25hbmQ6IG9tYXAyOiBmaXggZGV2aWNlIGxlYWsgb24gcHJvYmUgZmFpbHVy
ZQogICAgICBjb21taXQ6IGZhMWYyNmI0OGZlNDMxOTVhYTBhYzRiYWRmNTY1MTA2MzU5MDMyNmYK
ClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwg
YmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMg
YnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
