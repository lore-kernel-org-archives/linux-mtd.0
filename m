Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B135C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBhx4VeJtH3rwwwETClaCpJ/CK4tvpEyR4zJtobDDhM=; b=v1FM2nz7cuqFIf
	WJ7m78VBK/PXELVm19jmnjVxt6H1v2e6E/Sc9G9UvcTUfuEQT+dgHcS7hxwqG6ylqOp0wcR8iqRGW
	794+0ycolj0NyR3R7AoaRlAxePS5agx/1NWDNQ+He3cFrDgGxt/2VQ6uuaKjebfhwGF8C/mRh3bPo
	yXTyo0uWLIGJTqV2Noat6IHg51s152mciln57jFwHbH+UufRuTvtEFATWGqLmNERqtl6WxAXLWgCk
	z+oFy/b60NQKMC/7zmDZIjz87glZaNrXisheyWwC8Hku0JS/mcUlk60a4Jsmb9/0/wbp28AMjapZA
	xZUzC5RgzuafVZQezZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Urs-00Dhgw-2S;
	Mon, 13 Nov 2023 11:12:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Uro-00Dhfo-1X
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 11:12:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 471AF1BF20A;
	Mon, 13 Nov 2023 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699873949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjaXYAH/Px7CQua7UCmvaRDQCUXCfGDS+Si6m1raM/o=;
	b=lSskbgElUn9w2Tg4fB6CHJkPwTGZxeXO7kTKjn81Hpjih+23Zk23ufBVxWdODBQFed5WsO
	pM8/K/ynVYNzxQJNo5ZNNqz2BYBxtoH6vpWtGEgQd3Tq2AnPR8MbTTfhXg4Xb1vpyC6dA/
	4MwRc1WyBGs9Njf+9PaCEUkiCyQcp1hvZLn9zz4bDWHBNqK8ubAOaMaU2vfZX40B2JF79V
	396wArXKGIptQ5+VffnyisfxXNU0wlqXT08rGGMO3sggkyAmZrZlqAY02jVvbQTc5y900A
	/AjrLti5j0Ha9xWrBVhh6vNTPpi1qtqtn3NpLArNF1JUGk7ogyecpAOfgCHPBQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/4] mtd: rawnand: txx9ndfmc: Drop if block with always false condition
Date: Mon, 13 Nov 2023 12:12:28 +0100
Message-Id: <20231113111228.464551-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102220246.3336154-9-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'354dbdcbdd79ec417f6c35f55b1fe6310e7dd431'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_031232_646009_0B3C24F7 
X-CRM114-Status: UNSURE (   7.42  )
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

T24gVGh1LCAyMDIzLTExLTAyIGF0IDIyOjAyOjUwIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IHR4eDluZGZtY19yZW1vdmUoKSBpcyBvbmx5IGNhbGxlZCBh
ZnRlciB0eHg5bmRmbWNfcHJvYmUoKSBjb21wbGV0ZWQKPiBzdWNjZXNzZnVsbHkuIEluIHRoaXMg
Y2FzZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YSgpIHdhcyBjYWxsZWQgd2l0aCBhCj4gbm9uLU5VTEwg
YXJndW1lbnQgYW5kIHNvIHBsYXRmb3JtX2dldF9kcnZkYXRhKCkgd29uJ3QgcmV0dXJuIE5VTEwu
Cj4gCj4gU2ltcGxpZnkgYnkgcmVtb3ZpbmcgdGhlIGlmIGJsb2NrIHdpdGggdGhlIGFsd2F5cyBm
YWxzZSBjb25kaXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQs
IHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
