Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E5910775E4
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TThZPFrAj6F95bNJ24UTjLuSwetjvxpXrfnFqKmU9rw=; b=elLSmb1NshBTtD
	YjyZbrqxn/qpRuTlt6YNTPcvglj6QB9vX0OotbxvkplKK6WMC+iY3SXnqDfr1U8vzgG22ppQ9mWKn
	BK74vW2SeMdRJ8AjGo8jT0ipdibqZjxP8aQM+35hAXyzP2dGG2gHcgiw3qtEsC4G+20wUQ9SwtxqN
	Kl80a21C8ckAxah6BUllYXLjpJEiEJ6GMAb0ojmhpjt9bTUC16HosXQX8bj3yOBQ19kbxhBsjseJ2
	6igazNrR1xDBjxJ0PejFFaUjIHJSdd7gwVeUlEKhdQTpLnlRbwnvYj+h8KRFJDrINfuW6yI16FxsK
	u6MOevVuINwnI83PhTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uN9-000000091h1-0mYf;
	Wed, 18 Mar 2026 17:07:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uN5-000000091gg-2PAc
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 17:07:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E1ECC5506A;
	Wed, 18 Mar 2026 17:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C746004F;
	Wed, 18 Mar 2026 17:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A542D10450502;
	Wed, 18 Mar 2026 18:07:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773853668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBup5Y/e8Pqt4m+OM8d+NLGsbXAKkPwAnNtzZC7xnUc=;
	b=v+veIcJsIdOAXKZ9UmXUa4QfutZ3nWFH46gR4l8G45SOYuBg2jntNoI/ck73aR0IJ2yBXH
	+RmUsTc4dv0hdTPXyG+wwADNd9yWxvPx5Lb4VFc91qrUJVCGNwsLZkgLB6j/E0Mew90jxI
	CsKtFmaedYNBlsn+LzU5xB3r/CIn/PjmsHm5AStDxlwEG+FNNdm6C9Y0Zhe1xPpWZM/naZ
	5Pc/gHtcvsdy6JYod8dlGjSFVNhkvl4bA9YseGyCxRaO7x/HWVz6bP4dJC8YfHAeiMKjUm
	2b2tAtgg1RP0FillOJXsOdmm/m1xE7yNHEhs6qUTpPXVWsxEwaZOiTUPsEFy5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260317003517.72196-1-rosenp@gmail.com>
References: <20260317003517.72196-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: cmdlinepart: use a flexible array member
Message-Id: <177385366489.728621.13187624746629646236.b4-ty@bootlin.com>
Date: Wed, 18 Mar 2026 18:07:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_100751_753861_97A4010B 
X-CRM114-Status: UNSURE (   6.33  )
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

T24gTW9uLCAxNiBNYXIgMjAyNiAxNzozNToxNyAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VGhpcyBpcyBhbHJlYWR5IGFsbG9jYXRlZCBwcm9wZXJseS4gSXQncyBqdXN0IHVzaW5nIGFuIGV4
dHJhIHBvaW50ZXIuCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBt
dGQ6IGNtZGxpbmVwYXJ0OiB1c2UgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIKICAgICAgY29tbWl0
OiBiODAwMzU5YTRkZmFjYWU5ODNjZDAxZjhjM2YxY2JiNmY0YzlmODE2CgpQYXRjaGUocykgc2hv
dWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhl
IG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2lu
ZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
