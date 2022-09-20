Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AAECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGD6covgij+qMPySwgH3KOUxDamVbac/YC8y7HxogeA=; b=MBpqurghEPkX7y
	gh7uAWXQWNtX/AfRNi33zK2LkRZEOaWQpg0npEOWuuxdqvWwD74fgVo3OY5Ond6CoX0oNzlP4LRXq
	tmFHlLKEnexayPujt9Cjn6pSfH4JLh23hlhfcHPW/T8Uowa8Pmfmc2RLTvHAvovs8XeWeMLbhWtsR
	M7AjYN+gybF5pvn4ml3P9sJSKLw34PQME6mm6lUyMgjHD5mr5A5TrgntEB4lpeQHOt0YjcFmxU6Db
	MzevhrtJigS4PKjpwlIUem8jTtQnLpumYqo6B+VuJNelnHOQaAFm6a7A5cWaIfl4453koeO3rqDzu
	WBUkNvBCjzVqRYp//hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYno-001wvj-Ig; Tue, 20 Sep 2022 08:40:25 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhu-001rXu-RN
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:34:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CD3D1200011;
	Tue, 20 Sep 2022 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOwFYv/H167Jq2tKcIfit4SwJjZQJhU3ar7V8zFQDPQ=;
	b=EWrXbC1zQQDNP2M18sF/5bzyfkcEx9v+VeaDYW+GLm3+sy1vAxB1PW2tX5yfbOvB44sOGN
	tAJYW/R2nMfSYfYnv8lGGQjJ8FOQrVRM6cu+jf999nwUzLs/SI+Q+0RHzEGYT6vyD0zkGP
	4U+5DRpJj0n+x5x5JJjqp8zLHxUEqkZVtVI32//lnWREf6FP2mBSjxy9g0ue1eBgppga4y
	zffEcmmCgNp8mN9oMm7uQPLmY1dQQ4AMuFah2aQHPhPnVmnzqQT62QjynDm1pzrTzHUNQ+
	+To4K8idIR2vcYBK5txzTr0XQe0c6DmCqiTov89abKCzHl47ZzaVKCCZGY7+vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: orion: Use devm_clk_get_optional()
Date: Tue, 20 Sep 2022 10:34:15 +0200
Message-Id: <20220920083415.601259-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a5bde48e3e1165dd65d1d1c1739e03ace1bef5d3.1659907229.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd50a0d3f26f8f1841b4375df35871f1273eb5686'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013419_119955_401C8264 
X-CRM114-Status: UNSURE (   6.64  )
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

On Sun, 2022-08-07 at 21:20:51 UTC, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> 
> While at it, use dev_err_probe() to further simplify the code. This is also
> less verbose if clk_get() returns -EPROBE_DEFER.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
