Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0F1C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgF4NABlQDCKxe39qPga8qz26hVdmwQ/sr2hX3cMAmQ=; b=4034UWpkw80Y6l
	fIvKcBa0vXA5HkXRC4w3U4xtrjknMmPJCd7P0116oMxQ6AbBLd7r6ml1uAOidqul4Tm7TkCRydp0T
	ONvS8Sp200sBJ1F6eu64A5nuim0kXzlIR517j6dUuc+eqIo3RSKF5qNkCQKQdw99G9ITpd9Izomgm
	Lt0z3DtMXJzClJvm5rlwBLoIj0kTNKFf8C7Zv3OkdNDYWjRdn/CvOBKtxiCeKi/b6Nvk+fuukpeg8
	7QmuufBTOA5csY31GJyxfGE1kesRx+UPNvXP3TZ78EUAHzs9vqVvUGG7z+IOS4dLVtTdA23Xy/Nac
	kJNHiZ+U3icsQoxYqs+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaNI-00000000fAa-0mFJ;
	Mon, 26 Feb 2024 12:46:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSW-000000008dK-13NV
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:43:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E96560005;
	Mon, 26 Feb 2024 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNQgoYfi7C6CVKqEeoFf+YPrjABDQDJPO0VckYnKHe8=;
	b=Osh0I3srqRVicQtWgUk9tjWafpkveBVOMK/3dfID2ja4RcVTsHKVgBBXGTXXO7uFMJnfcj
	oUvo3lGOJ2wRtmlY7oKeB13cEOfLeCNkbcN/B7LPy61W7i2/tCXImD97Qfsh2LO3F2bA/r
	878QCo45Sn0xodyBHfmlpEtvYTY1VUuPS6IlBcZhGGMjO07TjeliUzGmWaPfhrxSt66ZtO
	t9T8Oh1djHZwlAStfT47vF18Jk237K/alI6T1Qv00V41Sc66vIYg/Gr3U59S0cdJq+7A3/
	TwA1w0FBFTqB0lx0XWZA5MPtad0Fyqsdt2qb9+uacaPQz/Q9YGsRh9BesjpDxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: hynix: remove @nand_technology kernel-doc description
Date: Mon, 26 Feb 2024 11:43:40 +0100
Message-Id: <20240226104340.489214-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240224014639.16145-1-rdunlap@infradead.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'65a7f244b15684856241d04b8f3287d9124bd1ff'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024344_557624_06CE0DF5 
X-CRM114-Status: UNSURE (   6.36  )
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

On Sat, 2024-02-24 at 01:46:39 UTC, Randy Dunlap wrote:
> Remove the extraneous kernel-doc description for @nand_technology to
> eliminate a kernel-doc warning:
> 
> nand_hynix.c:39: warning: Excess struct member 'nand_technology' description in 'hynix_nand'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
