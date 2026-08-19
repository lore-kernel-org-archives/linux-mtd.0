Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD0CC5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 14:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RBEu8T4B9VkndzSyL0V64rLFDFd4mjuImJxyaFtUz4=; b=LJbmXGbujkzsXG
	xjCs/oRc/JUlShR2qJI3uDfsTLtky6rnYrhCAj+xE3P+cu95u3UIuECFwDRcbro0Pst01/1FFwa05
	3tJmotCGYZi1xr3emSAHbScPLYj5cWFw++KrhrjUcc3dAPGyIhmL42clOwJCUAdHOZOK3L9BE9sRi
	q8tcZ0bsTj+7qrykT7OXy9CVJwLSI5JUTa8q4RfOJ+AuJLYr7wuPkF7v2EaCNZa34DIP8zNaMOQ1E
	zcN5JopWvh2WYJMuOufOubAshHxhPxkL7BgHpn/HARo4GYRnkdLrsuKDobr3uQF0Ht0OI5xfvfD0H
	iHqnTrirQv9AVDy9q1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgtj-00000009vpH-1H7k;
	Wed, 19 Aug 2026 14:04:07 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgtW-00000009vFE-1PJI
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 14:04:05 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a93dedeb;
	Wed, 19 Aug 2026 22:03:43 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v4 0/2] mtd: spi-nor: core: Fix RWW wait locking
Date: Wed, 19 Aug 2026 22:03:35 +0800
Message-Id: <20260819140337.36775-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
References: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
MIME-Version: 1.0
X-HM-Tid: 0aa01a55c2a103a1kunm0db6d2d0140e23
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEhPVk1CGkxMGUkaTEoeT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gIMQ6qd/Ob7wmjOjFLStVHr5f/anG1TNz3ut/EaRzsEslpEX9d87r8wsnIObv4GaTg7zCN0wPYPdwX90qMLAXqpiHGpeNfrPf5DQQvWFa8bGvqbY6gIQOchXYR5ecK5P1njj1LoCKvO/FpqkU4fOvs9vxyKTNR3F5uEnh6fp3gY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=NAFliVJdCx2HCK/wB7WQHg3vR4GfL1qd0xIF3s5+vxE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_070354_596423_676CD5E7 
X-CRM114-Status: UNSURE (   5.40  )
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

The RWW wait helpers must not block while evaluating the wait
condition. In the current code, spi_nor_rww_start_exclusive() can leave
nor->lock held on a false return. Also, if a killable RWW wait is
interrupted after spi_nor_prep(), the controller setup must be undone.

Patch 1 switches the four RWW start helpers to conditional scoped mutex
guards so the wait condition never sleeps and the mutex is always
released before returning.
Patch 2 unprepares the controller on interrupted waits in the three
spi_nor_prep_and_lock() helpers.

Runyu Xiao (2):
  mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
  mtd: spi-nor: core: Unprepare after interrupted RWW wait

 drivers/mtd/spi-nor/core.c | 93 ++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 39 deletions(-)

base-commit: 2b533e775aec580cf60074417f4ca00ac9cf3580
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
