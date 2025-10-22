Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B004CCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DolfOGexCWWEs1Tj78Ig1KE7EzO3TpzVlVGWqWfVyPE=; b=rSfG43Njqp0JHp
	rMPuxk0uNkFATlzFBjok7Wx7GlMUGS2GlDu+Di7Ko8iayPIwEfx/gvBNe7j2GB4dVOPWa/ZbWwwBs
	cs4EUNazCNRPMq4e3WOYMKEz7sUVeR6mI5F1qEWZK0ED52cbrswjA0th8HswHaVyWHx9FwEXTXTXo
	0xVNp+UT9ZDf4VxXXIc7gZ/an4O63Qk+nOsp9umY0XN87VeChby8S1KYV8AvUSUzXwenc3aif6DYY
	BPGOfh6urjSjvnq6CtZ8pqrPh6KVWIXDnxNq24jbMb2zsUrGsc15j18ZAfJtVY8CSkpT7guSsuI/c
	IWTM4sX/sXXPoYJnfSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVac-00000002LIP-0Hom;
	Wed, 22 Oct 2025 09:57:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVaV-00000002LGE-43fc
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B37934E41270;
	Wed, 22 Oct 2025 09:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A09B606DC;
	Wed, 22 Oct 2025 09:56:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7905D102F2393;
	Wed, 22 Oct 2025 11:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Mtx1L8tYK7+JW04tAce2FfiuUr+6sR6Y/hOzxnnM4o=;
	b=qD9PO6nKPXkIG3JFkpn2ANISk0CRHDMNKe+/OUUs0Yfa07JuzreWnum/bRJhgkfa7zTlJn
	5cEDXcBFXFKboaOhOzCKk77rfRhgz5Kfbdlb+X+o0QhsexkPwwBtLV93m8Gb3ZtE8maCTp
	0NhGLq4Sy5nUFL7HM7G7i+tngma6yx9hnEO8QQq84mJLZnbLbNXb5QJ6HPgXd4ZJ7kUQ02
	sS1oO0PDGrFo0nWPWiAV8vcqferkWkFVPQYaXilvvfrM5rjbes2NmhJZIuPKXwzJzYLUKD
	N6VCumi8BNz8t/sFbCpmIff2QL8X+evXncirp75u5lZpGh5vbF8llH+Ysq8YVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aN-XoqpP2Jz75pjj@stanley.mountain>
References: <aN-XoqpP2Jz75pjj@stanley.mountain>
Subject: Re: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL
 bug in probe
Message-Id: <176112701142.140484.4160274079611139729.b4-ty@bootlin.com>
Date: Wed, 22 Oct 2025 11:56:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025700_136749_266562D9 
X-CRM114-Status: UNSURE (   5.51  )
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

T24gRnJpLCAwMyBPY3QgMjAyNSAxMjozMDoxMCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGUgZG1hX2FsbG9jX25vbmNvaGVyZW50KCkgZnVuY3Rpb24gZG9lc24ndCByZXR1cm4gZXJy
b3IgcG9pbnRlcnMsIGl0Cj4gcmV0dXJucyBOVUxMIG9uIGVycm9yLiAgRml4IHRoZSBlcnJvciBj
aGVja2luZyB0byBtYXRjaC4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpb
MS8xXSBtdGQ6IG5hbmQ6IHJlYWx0ZWstZWNjOiBGaXggYSBJU19FUlIoKSB2cyBOVUxMIGJ1ZyBp
biBwcm9iZQogICAgICBjb21taXQ6IDkyMjVmMDJmZjIwMTgzN2UxNDQzMDc2ZjM3YTNjMDA4MTQw
ZDE4MzUKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
