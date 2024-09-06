Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E509CE7B1D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUIsf1QfiJ3CLYzXnL2C3vM8M2jJoFnYdDEzK5Am0XU=; b=12LRwLYLiuBQ9F
	IVLaYpOlarQ7VqnRrONnWp7Kc1NYGD96Ws1xJHLr6do9Pef8wnWm2nHK0V3Ob8NQzZ2ZpX5gfg9IG
	hXsfqGoOdHbHdYbE+GggytZ1yHiZ4+fiCgkglokosEEGD8vRCQIFsdHuoJ1iGuQLhw2w/x7QnH2RS
	QjxGFx1TsaRL89+NQP5fCXXdL0zVmwwe77T3RQ+qQdd+pIqz1YixKn7qn8TR1MoTNla5D3IXik23N
	cLuhH78wFNKmZ6gPMZnlYdYWGkZQed6yHPKVlV+EqRgPuszUXeWPoIw479jxcFIl/lkS41BgFHTk6
	3NJCgLp5cTrvZ9kLHxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVv-0000000CfMy-3igO;
	Fri, 06 Sep 2024 15:04:43 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaTr-0000000CeZc-1gsm;
	Fri, 06 Sep 2024 15:02:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51E09E0002;
	Fri,  6 Sep 2024 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HIKijsQiNLzzayJuxmCb5Etw5tZpEr5NFYgsRiaNiEA=;
	b=NYHqm4qw5UZInQSc4Uid1bUyHYeWv+AqTqUfm1t4wi4vGVFpB2KrLxe3RE7nT1ZVW+rKoa
	+xtwakLUfZ6Cylf4Lp6Kr6+wN24/4Ddt0WBOtnFl9PZKatmkwWngCU/+8hPJ7r801j4dmO
	BqbF3uG0rywnQVTIu1hix2Nq2MaiKnQhL7zen5kE0a/p+p9po3mdqDAp9ZZolhnlJLhVyo
	ktT5UW36arJTvrCuk202VtU8JCiZaTpCu3sBjLUXDCUAUi/LSPqXSZ1U4jrTveEDflnnZG
	0HvmiUKYk9cBfDPjIL1lBGXOAIQchXHh6sD18g1hxWCTMi4jOsLG1EA4Z2mMBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH next 2/2] mtd: rawnand: mtk: Fix init error path
Date: Fri,  6 Sep 2024 17:02:28 +0200
Message-ID: <20240906150228.734063-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826153019.67106-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dee90d2fae9a92fc3bfdf7020586ddafb688b2d2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080235_597985_ED647DD6 
X-CRM114-Status: UNSURE (   8.75  )
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

On Mon, 2024-08-26 at 15:30:19 UTC, Miquel Raynal wrote:
> Reviewing a series converting the for_each_chil_of_node() loops into
> their _scoped variants made me realize there was no cleanup of the
> already registered NAND devices upon error which may leak memory on
> systems with more than a chip when this error occurs. We should call the
> _nand_chips_cleanup() function when this happens.
> 
> Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
