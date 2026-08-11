Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48856C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 04:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46PAZE3+GZQG2lz6vasVN0GDMu7R5PlU7oviIiYPVyg=; b=FRBl7Z4cuH0S7c
	8p9SsxINzUvEmeBdsFzONMbKHmQUBIhZGbrzX/vQqgGhozw58TLAxHA+9B8lmrjLvSv8qy6pOpBSk
	gs7tKNednqKAKeStQQNOGwgiqlGsJB+BbRoT4p9V0kAw0DlpVV77kKj9P4CzuOlO8n5iqJizUERCv
	XIwdaR9TOJfJ4wC93IF7DmYBFn6dXbExE046IkDJblJ5YrGnxRfkCtRG148vqxn18V5jmhH2VaVR0
	mW0jY4n2KcHduzNhAWN8Mep6i05cDSWN820gj+P0DOI21eyNMITo9nk8vtjacvU2hfGClUc1MIg7g
	NeRsd6db1C4eqGhqdK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdsU-0000000DFEa-1be0;
	Tue, 11 Aug 2026 04:14:14 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdsR-0000000DFDf-36ra
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 04:14:13 +0000
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49839a3dd;
	Tue, 11 Aug 2026 12:14:01 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: [PATCH v2] mtd: spi-nor: scope the exclusive RWW lock
Date: Tue, 11 Aug 2026 12:13:49 +0800
Message-Id: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
References: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9fef07002203a1kunm3038573ccf371
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUsaVkNPS0IeHx0fHxhNSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=JFLZ96SdvX1KS98OSuUfXksu69enBfi9qs1wYdw3DXKqzr9kkoVdmKlKev29rnBK9sBv86s5RxYSbpbWcBjMhx3FFUg1JoMTBNLQ8Z7rpaLPq/1AYDsrURxqR+QOeH2PYqi5jpmHDXZ5jCwAINdV+/3YSE83Q2ETIQd22/b3Uh8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=YBfIz6+uNJCCf9NNN7opXSjgJhc46dkV8CxB1hCFr7Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_211411_959970_46570B70 
X-CRM114-Status: GOOD (  11.43  )
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

spi_nor_rww_start_exclusive() is used as the wait_event_killable()
condition for RWW access. When RWW is busy, it can return false while
still holding nor->lock, which blocks spi_nor_rww_end_exclusive() from
clearing the RWW state.

Use guard(mutex) here so nor->lock is released before the condition
returns, while the state flags still hand off ownership to the caller.
This keeps the mutex scope aligned with the other RWW start helpers.

Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Changes in v2:
- Replace the analysis-style explanation with a short maintainer-facing
  description of the busy-path lock hold.
- Keep the fix focused on using guard(mutex) so the mutex is released on
  both paths.

drivers/mtd/spi-nor/core.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..8bc117b46e02 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1310,7 +1310,7 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
-- 
2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
