Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B84C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWaupJAl3cmWNpX4YRvIzlk/D0HpvtCqG3g+0GrwYh8=; b=NPzn6ijFxaooGA
	QTiZS5HRWQdOALmEeSQMufOP41m9sAdiBfPzyoKKrXHOvbhnY1VNdlkKZb5t0L3H0XBPC4sRzIi1y
	ieRjkOUtqhL0cea9ZOsX8BgET2vf9u7viPJSS4mwkzsa4MpIYuYct/nmUyETYMGHP+aFSXErxJqdH
	qQs524dtboWyp67+QHFxALe0ha5Q+M77JvTt+de0eB+OdHPI//ytRnXvzXEgYNZJcPaDFgXgaL1Om
	piBTWDgAns3M35isC547NK923tBHmI7t9KRqKMk3AjbYWwZAhQIdR3NQ+URcL/LoYpiEuU9hMPWha
	23HK6sva3uMn8wvaRu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI3-0000000EwLf-2r4J;
	Mon, 29 Jun 2026 14:48:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDI1-0000000EwHZ-0std
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B18EF1A0CF1;
	Mon, 29 Jun 2026 14:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 847D55FF96;
	Mon, 29 Jun 2026 14:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55906106F18C0;
	Mon, 29 Jun 2026 16:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Y2dGtCX571obC1bHJuffzAj/LpJ/YCV6B+7lEKdOS4=;
	b=B85W5nc4ALTzeXLEqY9xRChScRByfCgI22raxm5gdRyi9GFihKGYlhi7zeog25kse2VEuv
	6zyKiEM1Hoqroc/CLUH+p9iX/LMyA/Km1mK3M21dgaYE1TSrt8XR1mW5FUfR5z89Uk6fQd
	KO0KqSElqLJ0QT+EzYlq/NvWPmGh/osf5SFixvv8qPYiC9ACG/J3fXbwYQvG92gCxov6MD
	x+4L9Ti6A3u0uGbhfMo+G/nPWiT2xfH+LVfT7+WHtK4h59yyIdLxeo7l1BLYMWGQn9tkqs
	DuOKTZq6KCfGMvQ81OogPbYMvSg4EskxfagQ0nb8bn0lQuQnLA6CCrxLv1Q+WA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>, 
 "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Sobrie <olivier@sobrie.be>, stable@vger.kernel.org
In-Reply-To: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
References: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: pl353: Fixes and software ECC
 support
Message-Id: <178274452512.266238.15298515792441156646.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:48:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074849_400881_D470C1EC 
X-CRM114-Status: UNSURE (   7.08  )
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

T24gRnJpLCAyOSBNYXkgMjAyNiAxODoyOTo1NSArMDIwMCwgTWlxdWVsIFJheW5hbCAoREFWRSkg
d3JvdGU6Cj4gRm9sbG93aW5nIHRoZSBwcmV2aW91cyByZXBvcnRzIGZyb20gQW5kcmVhLCBoZXJl
IGFyZSBhIGNvdXBsZSBvZiBmaXhlcywKPiBtYWtpbmcgc3VyZSB0aGUgc29mdHdhcmUgRUNDIHN1
cHBvcnQgd29ya3MgZmxhd2xlc3NseSBhbmQgaXMgY29tcGF0aWJsZQo+IHdpdGggVS1Cb290Lgo+
IAo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC9NSTJQMjkzTUIwMjY0
NERDNTUxNUU1NkEyNTM5QzY1NzM5NzY1QUBNSTJQMjkzTUIwMjY0LklUQVAyOTMuUFJPRC5PVVRM
T09LLkNPTS8KPiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsx
LzNdIG10ZDogcmF3bmFuZDogcGwzNTM6IFVwZGF0ZSB0aW1pbmdzIGF0IHRoZSByaWdodCBtb21l
bnQKICAgICAgY29tbWl0OiBlZTYwYmU4OTI5YzdiYWRmMTE5NGUzMTQ5YThhZWY5MzBjZmQ3N2I4
ClsyLzNdIG10ZDogcmF3bmFuZDogcGwzNTM6IE1ha2Ugc3VyZSB3ZSB1c2UgdGhlIG1vbm9saXRo
aWMgaGVscGVycyBmb3IgcmF3IGFjY2Vzc2VzCiAgICAgIGNvbW1pdDogODBlY2FjZDA1NGZmZWI2
MGNkMjhlNDZlZDVjZDZiZDBkMmRlMzE4YgpbMy8zXSBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBGaXgg
ZGVidWcgcHJpbnRzCiAgICAgIGNvbW1pdDogMmI3YmFhZGRmMWJjM2UzOTIwNmEwMzU0NDQ5ZmRj
MzQ5OTQ1Yjg2YgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4Lmdp
dCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90
IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
