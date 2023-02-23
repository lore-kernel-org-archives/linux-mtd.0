Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CBC636D7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgvWxJMupcMIs26ZeK78MVtEWe7uG/dtk8q93/ze1IQ=; b=qk9I6Rkja4uf02
	hXemp9AOrIIiwl5dK7f1L6NpN8EuvctIb8V+bkBsMvfnl6QSslf2PiLQQJG6eowvSpQlLNdgVrjka
	67Mq4/rEkKAVps1+dqManfjPtUlnemWqA/2e8GywCYx2+jNXx+sC89FAGOQUKDSkWpw7rPEmAof5F
	cJv/6fmvbn+Fkuzx6ZOCEsORaNmgNTrOcDHH3S/KkzK2Fvx952ebmfXuMWTKXuoG+kk3bpukOHC31
	LtzuzWkoqWgPcqervf4ZCr1fN3x8Paci94HZd3/fFht1/YB2P8sSUJ5kBbsfYkcVU71w5gQtpxrEb
	zEHyWodTRO/g0ktcLFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7yr-00FjFd-Pd; Thu, 23 Feb 2023 09:33:37 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7yp-00FjCa-7G
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 09:33:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 82FD9C0002;
	Thu, 23 Feb 2023 09:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677144811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rN9p287HytYO86kw7dwNdI0Ko49T4WBXRSHaJLmtyDI=;
	b=S2mDr6hIE++cmTW9FK4VBN71adl6Pr07e7pnzn+bGKzbbRfNExA8+wGoCSHL+X/BaFDeQC
	olMeZs+DKGycUvEWpWcRyTz8aTzfQJcvbTwNmcAzYl28MygO1/f9/TCNOCKUUOck1FYVgX
	3kACAWH1RuDyRCQEMVEQjcRzWtWip4lB+yvhWp1e91QVry6py4HL3gl0WQJmGuH5MXWGS4
	e5pLihoaoHyuQWaeotF99m73Y1Efv5bYYGI6Bxl2cT7Zy4cW9e1QwE7kDAgXHNKJl+kLTF
	2B+SOfuXlrlOZno+Mht839JD92GJD+Zc5fwUIeMJRYJFM/YzP5/o2jf4UE7M3w==
Date: Thu, 23 Feb 2023 10:33:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for v6.3
Message-ID: <20230223103329.4131e596@xps-13>
In-Reply-To: <ac2b5000-8828-a9c1-ec1b-f91bce78910b@linaro.org>
References: <ac2b5000-8828-a9c1-ec1b-f91bce78910b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_013335_431899_CE3A2AB1 
X-CRM114-Status: UNSURE (   5.85  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCA2IEZlYiAy
MDIzIDExOjM5OjA5ICswMjAwOgoKPiBIaSwgTWlxdWVsLCBSaWNoYXJkLAo+IAo+IFRoaXMgUFIg
Y29udGFpbnMganVzdCBzbWFsbCBmaXhlcyBvbiBTUEkgTk9SLiBZb3UnbGwgbm90aWNlIHRoYXQg
SQo+IG1lcmdlZCAnbXRkL2ZpeGVzLWZvci02LjItcmM0JyBpbnRvIHNwaS1ub3IvbmV4dCB0byBz
cGFyZSBMaW51cyBvZgo+IHNvbHZpbmcgYSBjb25mbGljdCBvbiB0aGUgaW5jbHVkZSBoZWFkZXJz
IGluIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jLgoKUHVsbGVkIGludG8gbXRkL25leHQsIHRo
YW5rcyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
