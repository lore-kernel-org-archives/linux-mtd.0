Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40DC7619A
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Apr 2023 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTaD2BjFca3D5UtO9DL5qCZ6v8OFbFHjrSgxCYKLklY=; b=VdeaJorUXIC0eI
	xtgQzKb6Jli7KH2+eMVfBOZ+pt/P5esqiWDqlRZKmUeteCXGkuknn8wtkyNYTXb/029G1PhDp9aNi
	3ThFAlwCcc1NSE2PxuBZkUyusx3SEwkVDsKTOYegNbXXaUr0ki3MbvVlmkfQfAnt5Yx8a8v7tQLsk
	mfRxlhsNb/hSazfBH4fsU3v5NEm6ywksPBZ/IMqOIjJNiCuEDoWYsBlF80a1mCCTIDgAyc+cXoVzf
	sk1KEPiginohOLbphsG6yFa7VboYdKaIErHUaJ/li2W29reuBw3Qy1l9GvXda06jdTP9NL1Flc8jm
	/aEhWq8m/4gS/l2W9K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyV7-00DQqn-1Z;
	Sun, 16 Apr 2023 09:16:49 +0000
Received: from smtp-20.smtpout.orange.fr ([80.12.242.20] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnyV3-00DQoz-12
	for linux-mtd@lists.infradead.org;
	Sun, 16 Apr 2023 09:16:47 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id nyUwp2vt5Vj4inyUxptm50; Sun, 16 Apr 2023 11:16:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1681636601;
	bh=34R78RzbMExczZJuYkzgabitAT4xEBq8BMfJDrQnJw0=;
	h=From:To:Cc:Subject:Date;
	b=Y02O6fSLZ1OStPi3lYi2MwFNS7+N45Is2KC4Lw/JujtlFX0tH/K1484EKHJ4tPkCK
	 4/5MpAxubdix6f5fRmS9RjFQUZm5k7FmUw8ZKWz6S+4cGQcYCy7w5fYKb55an0S9Bd
	 EadVzTi5wIWHW2+5CQoUOSVprmD6R7FBSsmi9PEjljj9bSlOpLJ7n895dvPh8uz7ev
	 IPMHGFozHUg0nMi/dw0z/uTqQyjQUUMpG1WEBjmQHDqtsxUHRMrCTr59OdrPRDtpzE
	 gahhRNTWS4j6Ktfq1RyX+UwsDfJlIH2DB5Sp5jkJgh5+R2ah+k7qEoLlxVqRkx32M4
	 6O6vGGtW5UegQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Apr 2023 11:16:41 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: st_spi_fsm: Use the devm_clk_get_enabled() helper function
Date: Sun, 16 Apr 2023 11:16:36 +0200
Message-Id: <4025ec3980a956b0e776024e88ec960afc457501.1681636580.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_021645_774363_E6E770F7 
X-CRM114-Status: GOOD (  11.65  )
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

Use the devm_clk_get_enabled() helper function instead of hand-writing it.
It saves some line of codes.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/devices/st_spi_fsm.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 54861d889c30..3dbb1aa80bfa 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2046,34 +2046,26 @@ static int stfsm_probe(struct platform_device *pdev)
 		return PTR_ERR(fsm->base);
 	}
 
-	fsm->clk = devm_clk_get(&pdev->dev, NULL);
+	fsm->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(fsm->clk)) {
 		dev_err(fsm->dev, "Couldn't find EMI clock.\n");
 		return PTR_ERR(fsm->clk);
 	}
 
-	ret = clk_prepare_enable(fsm->clk);
-	if (ret) {
-		dev_err(fsm->dev, "Failed to enable EMI clock.\n");
-		return ret;
-	}
-
 	mutex_init(&fsm->lock);
 
 	ret = stfsm_init(fsm);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialise FSM Controller\n");
-		goto err_clk_unprepare;
+		return ret;
 	}
 
 	stfsm_fetch_platform_configs(pdev);
 
 	/* Detect SPI FLASH device */
 	info = stfsm_jedec_probe(fsm);
-	if (!info) {
-		ret = -ENODEV;
-		goto err_clk_unprepare;
-	}
+	if (!info)
+		return -ENODEV;
 	fsm->info = info;
 
 	/* Use device size to determine address width */
@@ -2089,7 +2081,7 @@ static int stfsm_probe(struct platform_device *pdev)
 	else
 		ret = stfsm_prepare_rwe_seqs_default(fsm);
 	if (ret)
-		goto err_clk_unprepare;
+		return ret;
 
 	fsm->mtd.name		= info->name;
 	fsm->mtd.dev.parent	= &pdev->dev;
@@ -2112,13 +2104,7 @@ static int stfsm_probe(struct platform_device *pdev)
 		(long long)fsm->mtd.size, (long long)(fsm->mtd.size >> 20),
 		fsm->mtd.erasesize, (fsm->mtd.erasesize >> 10));
 
-	ret = mtd_device_register(&fsm->mtd, NULL, 0);
-	if (ret) {
-err_clk_unprepare:
-		clk_disable_unprepare(fsm->clk);
-	}
-
-	return ret;
+	return mtd_device_register(&fsm->mtd, NULL, 0);
 }
 
 static int stfsm_remove(struct platform_device *pdev)
@@ -2127,8 +2113,6 @@ static int stfsm_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(&fsm->mtd));
 
-	clk_disable_unprepare(fsm->clk);
-
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
