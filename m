Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B204EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrZnUzrfBTU03Pl6GS/d74z9BsFTxk6ONtM+HNE4h5A=; b=N1DkWdEWKvyQgQ
	57USsQsJAl+rFluXNXWgDcHXPFpYGq5C0QqeosbDAZkY8u29+pyOYigsjq8Rcogaf4l6Zok7Il5tR
	vzlRb9a+EoBl8RwsbPGE4/ZaZAc5BvAskQosQ7WjzPS5zE0Q1iRJm7hC9YcP3WbemnwPwnqhWTndn
	lYXATDokFKejUP0b1ZSq7HnuvfMPBhj6XHim4OPCOqkth/8Kiv0GJ7vdCLnxyI3R38nPCNlGprQX7
	ts6P4Z9U9Ax9MZRq5Uc8z3vpBCJzumn1JppJEZTlhBFL5PHdhkJJ01jgxpW0evn9pRK9cUvFk9eJU
	O3i1MlYXIGbHA4RvKqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJab9-000AEt-3C;
	Wed, 12 Jul 2023 14:13:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJab7-000ACe-0A
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E691FF80B;
	Wed, 12 Jul 2023 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aoe77zogQM/JrZN9fDZ1l1iMzgvgYHaA8MVLV9JAUKk=;
	b=GdyrsJlPFThQRGJTzYM+sokK1vvdoex5J069c3HVdVCnIIwKddwPy7Tuw2PYrKWSDcp60k
	8SMmkgrcG103vgSvMsJ768newar5I0vK+ia8c1Jez01z6UlLj6E+6dQCRJveyqvy5vFaXw
	UmEc3yPS/cdXVbIWJApQdBFJGrGkZzEtWMp6sFNpbRK6dFs5594j6iRHpyUg/poVBDMlMk
	Xb3GdovSUBH0XCSfRvUSmulFHbYWVAYidheRK7Kq86Duu2ScMb4sgf4m7kAWpU8DFbWNrz
	CnodeuM8sHq83ecPUI5HhmEr6mlI6vMqyHg56y6wMchZvf2CHG8E6gsuvNWWfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/18] mtd: lantiq-flash: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:34 +0200
Message-Id: <20230712141334.354864-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-14-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6145e07e9c77a99cfe98f10b6544beef8026ce28'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071341_240975_BE91AD1C 
X-CRM114-Status: UNSURE (   6.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2023-07-07 at 04:06:18 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
