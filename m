Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465CBCA100C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHruH9q7Xb20VwpIvsDqBYxP2CrBkHjdXDNl5afU+ng=; b=XbnD7hK4qeAyNv
	bf3bfjsnorKCPiu0FWP2k+pYHIEmVFH3MtzVy8BM1HX3HsTYeCU7v50b9l8orwwwkVwJFlAdjUJxp
	cSPBDR23LSCutW4M0hPTjcAgUkKPWb1n1Ji79Gx7tXreFqsE34pPCJxsaqbES7pSCE42H+wqzfaYo
	TCavnkdQmN57UoaB2gwzMQUvhLQv88jzarqQR/K49j8N+ry8FqnIQQQwge0ftAl6F2AIBBN3QuX6T
	ldvfIWECKdXtMbZrnDhpJVh+iNASlxjmeJfYNefGELfaxkLf7D/Y3uTbnzVmz0sTRIwx1w8eVTeAV
	XvArMwn99t93IsQp0VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ag-0000000CzT2-1XYx;
	Mon, 01 Sep 2025 15:10:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fO-0000000CTIC-3hpY
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92FE0C8F1E0
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 12:29:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DEBA60699;
	Mon,  1 Sep 2025 12:29:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 675AC1C22D5F0;
	Mon,  1 Sep 2025 14:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EOpDKz6P/sDOp2AbrMdlL77ikcy1M92sguX8hf0Bttw=;
	b=kkklwgM/rzi6uKPzHuuQkfZAdR4YO4NnicnrtHnvzT0Sk1MtC28c5O+wQiMgGDIueRlJsl
	/hZByz561jF6Uvd5hvi1LckrzwJ1mAPijo3XQOPDIqgtWuw60H06AY2hodRLI1p/FVSoxf
	ol6nU1kuiG+dB3NfjQ00jOk9jM/jx/nF8C4/gyl7FMU/ytalbwWWS3V6ku7PkVJQ0pMglR
	+ghTr5EopxLr4uinCMLDts5A7sCbVYsQPkDcjYdb0zh4mvlYp0lQvSuTcpEueasw+ncOpK
	2iI01ClItWiE9j92+2crX5V528j4fem9NUqvjzuzO1iipbCDMPWuWy3nRjQvjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250731095247.2165158-1-colin.i.king@gmail.com>
References: <20250731095247.2165158-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] mtd: lpddr: Remove space before newline
Message-Id: <175672978422.48892.3067345209625386625.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052947_094794_F586BD7B 
X-CRM114-Status: UNSURE (   5.39  )
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

T24gVGh1LCAzMSBKdWwgMjAyNSAxMDo1Mjo0NyArMDEwMCwgQ29saW4gSWFuIEtpbmcgd3JvdGU6
Cj4gVGhlcmUgaXMgYW4gZXh0cmFuZW91cyBzcGFjZSBiZWZvcmUgYSBuZXdsaW5lIGluIGEgaGFu
ZGZ1bCBvZiBwcmludGsKPiBtZXNzYWdlcy4gUmVtb3ZlIHRoZSBzcGFjZXMuCj4gCj4gCgpBcHBs
aWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IGxwZGRyOiBSZW1vdmUgc3BhY2Ug
YmVmb3JlIG5ld2xpbmUKICAgICAgY29tbWl0OiA0YjdlYTM3ZWJiNmVhNTk3MjRmNjllMzg4OGU3
YjI3NjAxNGUxN2U4CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
