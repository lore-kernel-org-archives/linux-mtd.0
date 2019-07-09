Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B4EC73C53
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AEB720651
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 17:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVoJanFS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmxakwAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AEB720651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cZP4+oujYdgZ2ggjFC4OspM5AQF3k6s7WVxZkzqBlZE=; b=GVoJanFS6NH90c
	RcNzAkrQoWRrYXnaiI+3xFygogIQ5yD8hOw2Q+Ni/tPtuqOKj/TkUu4p54CCKJwJOwHgQshRVy4vb
	/nb0Tj9ZihIWlq/4Xxc2Nu22AZLOnrJ0kX/vRmDAnC57bQt47NTGTkcRMXtLzJ+x84y8RGPSVLK3d
	2srw+4G7CFAkq0Ddsh0cIzq5mVlFyWSyBv2Sk56ZoiP2NYrVKXKBJzO2bDOaVcgN8GT6wUrajc8P1
	bhhabRkGaNilTqWHig4Gw4WuZm3ggWj1AlzY2wcyH3kamGdClQTvKvJ3BMPj3E68n0PyJe/jnTRDq
	SAK//PiUlyPzKTsyKuRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hktdQ-00073C-4c; Tue, 09 Jul 2019 17:10:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hktdO-00072t-BD
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 17:10:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id f25so9767346pgv.10
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2019 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ifpM3EAgN64j4/v8XS/Ptkch4+ln1w1G1lWE8Wc9fYM=;
 b=FmxakwAmZ5TYjIkJuBavkuSw+Tj/4WkJLVoO2x+zeRI0UkaMlPz1p8FWz0V3v4bPo6
 WCCe1BI7jJADKAgbH6w76n9+sBx8GVjkM7Cfy+Sk89xTVAHtC8Xs+8ENb2v4DR4nYe4h
 ImLT3g1GqTYc1USD+RPcSCfAbZCd7zNnxfuumlytmkl9X/fCeWHJP+RAW4RSfobVmXtz
 HLoMpR+KFPhZT4t6bCxElS7xKBCMjlUKVeyIXMgDFX2F4QB9AfVeKaV84WShdo8Pq+fc
 EVEzTy2zYFNYP7wc3G54Zfr/qCvCr3Sj7N+G6eG4cXTfCG1V6sXejekRHqoWjNT6ztd+
 yhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ifpM3EAgN64j4/v8XS/Ptkch4+ln1w1G1lWE8Wc9fYM=;
 b=FHzLsnTjWH5oFiE7bXWZ25b2MF4dZJtFz2JkJfYYVLvdxjWgddFkT5NuLDnpMREtB7
 iT+2CyfkG7/PRsqgpFsYYg/3HSjOHCbAjX2H4LDpQX5l/WPwUqPu3vD3GNCF9dHAsuMy
 VUPCeBlOoax8N242704hHdVZ0t6znmKQB5N6HR5enEP4wx7/Nw/BYchQ85YOs6kClT5F
 PzHiQU0Q2xlOXxRaynu1bq+9En3Jg537KPfSGXMs8J5BNAb/iYPmkGrUe5TNc/qL8R0x
 6cPp+Ocu56HRXXI7cO2r9w8iTgHFcI4mVwOSGhCP6JE/3/upM6mbKiBT7vElKW0PJwyB
 wpYA==
X-Gm-Message-State: APjAAAVy2S6TYaf4Wqn7xFBrDMyzY3i3aixzPtWwcuYcPRF3kvG1xiI7
 Msi/kFpabAEXozNHDie+M1o=
X-Google-Smtp-Source: APXvYqwI6OhBSy+CIUwvTTyNQkZ+HAV8Wsk2UIGniEMu9ZKPOoJyMhZNDQBoyY6k6cHFIFp7MjGGlQ==
X-Received: by 2002:a17:90a:bc0c:: with SMTP id
 w12mr1127013pjr.111.1562692229637; 
 Tue, 09 Jul 2019 10:10:29 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
 by smtp.gmail.com with ESMTPSA id h6sm21016042pfn.79.2019.07.09.10.10.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 10:10:29 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: narmstrong@baylibre.com, miquel.raynal@bootlin.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: oxnas: Add of_node_put()
Date: Tue,  9 Jul 2019 22:40:16 +0530
Message-Id: <20190709171016.13370-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_101030_387934_3A29C91E 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a goto from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put under a new goto to put
the node at a loop exit.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/nand/raw/oxnas_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/oxnas_nand.c b/drivers/mtd/nand/raw/oxnas_nand.c
index 30c51f772de6..c43cb4d92d3d 100644
--- a/drivers/mtd/nand/raw/oxnas_nand.c
+++ b/drivers/mtd/nand/raw/oxnas_nand.c
@@ -116,7 +116,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 				    GFP_KERNEL);
 		if (!chip) {
 			err = -ENOMEM;
-			goto err_clk_unprepare;
+			goto err_release_child;
 		}
 
 		chip->controller = &oxnas->base;
@@ -137,12 +137,12 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 		/* Scan to find existence of the device */
 		err = nand_scan(chip, 1);
 		if (err)
-			goto err_clk_unprepare;
+			goto err_release_child;
 
 		err = mtd_device_register(mtd, NULL, 0);
 		if (err) {
 			nand_release(chip);
-			goto err_clk_unprepare;
+			goto err_release_child;
 		}
 
 		oxnas->chips[nchips] = chip;
@@ -159,6 +159,8 @@ static int oxnas_nand_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_release_child:
+	of_node_put(nand_np);
 err_clk_unprepare:
 	clk_disable_unprepare(oxnas->clk);
 	return err;
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
