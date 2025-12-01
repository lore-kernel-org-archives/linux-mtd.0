Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED5D116F8
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Dec 2025 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6Eulf1oZQKA8mt2yHZBMb9j3r3UjpjsXFt/ofbmHsY=; b=hs4+X7XKuAajBm
	Xhv/nTZ/R6ZBfoSJR7+BNc61FOCOksHH1OpZpK/7WfO9qziXQwpTP6my2Tw/Z4NC8t39aCm8tFdFp
	BM1IFQAivN9U0MleJ+IpYsN22a3xsWKp+LPzxL/17v3qn1APd/IswckiSUwcHJQbfIuDwJhyIeMTb
	xkEaB/nuNB+nmI44tFS0rRWZwYUPIPbSOXzwiEXb0Ip7oWnFBu+ULBE1vDsd6JMqcDk9bZ4wYsNBA
	d8y27NoSmkqt2apFaXMkEMJydf3UaacgdV1F5gnpvhoFZqUifOpmAdHvuw2lLA3H7icUBBG+mIbtL
	M0ajroJ3sSBFHCdiF66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ13G-00000003JHB-3xpz;
	Mon, 01 Dec 2025 10:22:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ13C-00000003JGC-4Aaf
	for linux-mtd@lists.infradead.org;
	Mon, 01 Dec 2025 10:22:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1E914E419A8;
	Mon,  1 Dec 2025 10:22:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96908606BB;
	Mon,  1 Dec 2025 10:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBAAE102F0821;
	Mon,  1 Dec 2025 11:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764584552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z8BZ36w3ylFkh+SIuZ+9qB7c5uOL96kHZ5vGOHsvXGE=;
	b=W8+QHhYC5uGkw2u508/xn9iJN+rlSlihdpgA/MGoVhiL44+iMDJOP+CmBGSlGFKa8Z4RBv
	AvM1DTldcEaJyi0U7Bd9solZIdrPjGIPQl2NIvOnk63vclc5D9DnWNyqYlHTOhNflBYuk7
	cVlMJ5c306djEXvxdUUh5RmlXnYhYNo2shDzSmwsrE5TBAm5TRnr2sD50wIhxhjsGfbAny
	vlpbYTIhj0zcIDhxNslze/V++LKhVpuCkI70dR+UoeESTDaNGItqRycSxc+oFtoJfJasbT
	cXJBmC1da+o3OxCu+F/JEEOShLx3AjINn3huyciJvobhWTdQnatZTXaLLWMUAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 6.19
In-Reply-To: <875xatdm4s.fsf@bootlin.com> (Miquel Raynal's message of "Sat, 29
	Nov 2025 14:05:55 +0100")
References: <875xatdm4s.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 01 Dec 2025 11:22:30 +0100
Message-ID: <87h5uacxi1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022236_727903_36E9731F 
X-CRM114-Status: UNSURE (   3.39  )
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

Cj4gVGhpcyBpcyB0aGUgTkFORCBQUiBmb3IgNi4xOS4KClB1bGxlZCBpbnRvIG10ZC9uZXh0LgoK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
