Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D364C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 08:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wMYIeqYoALwBakCTGWJBDC/1SX8lIAXDisMxmxUQmH8=; b=ktNyvNqLwvsq3u
	kxbkYeN5WV64QrK7HKxO7rcAYh5/OiJuHuxktNz1GDrEXBtsgN1vUY+rEzaMdFT365YN0ACbxIMu9
	SRjA9KSX0b4lDYbdN5oJqQWxGi3HzdwfkneaaE5BvBheICjmRBo9hTZxq0SofiiCsbzItsd+DOGjL
	opJRYY3kK0vTZ+egZxA+ryE8R4Byc67PAQCs3F4g89GQJmS8O3BsvwmiPb6dWgknX0l8Ig8M+c2ad
	Ohg8fPLqrosYN3vsT3A8FALm5vx/6YDoZOxeZIjShExm9L1giH6ru7C8BmEc72DXrUmG+SElLwN0e
	B1hPenBnIvmWwCheBRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2qO9-003yOP-Sm; Thu, 30 Dec 2021 08:02:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2pr0-003mRR-U1
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 07:28:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id i8so12274916pgt.13
 for <linux-mtd@lists.infradead.org>; Wed, 29 Dec 2021 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=RKI4ET+iCqJlA6R62xSNDJorzIrtHu2cmC4OCM8LiWw=;
 b=NDpX5ELcjr1P9wcmuoV6GhzJFItimAOMX1lisYxg3e34EwvBr2khPJ3CMxYU0/ZfH7
 d4qv0WfoUlfwjamMLZY29u9rUrkkibqm8NmO6geAFZ7aWw5FPD9CoSy2ck9tUOh0Tsz/
 iS/FdJS/2U7/8IfDI4fn0SnCh8feZM/yzSsPAs+QQqJ+nHWmr8uIC/14IpGKczPHoJ8k
 C4Zjn1MTPygXKHVbUbYdVmRwl5t2Gq6tRspTtxITsVZO11p5DdEjexK+5Ww+WdcMaOiR
 oViQYxxNY2ISYHIYKR53+oaytrGGlBt7k8/BTjJFDfXzb/J1Nxvh2Vd2CZe4uTRH9hX7
 hubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RKI4ET+iCqJlA6R62xSNDJorzIrtHu2cmC4OCM8LiWw=;
 b=oq4HXmLLRwX7sGGRV5XMOBxfmtRWvSqZgBLRFSvk+8kXkIEbbgflcvNnOJO4sjqwF6
 vW9CetkYIbYMNOuuPcglYyKzH6bBOnuTsIstLQqTn0SgUVwLgj3WGstVSbJc8uo/qNFB
 NI26rNw5cnnJxOJHJSwD53CKXVYHxBeysB1186RffMW73dt5ORuA0v/OAw74rMPq6HMw
 Y93tQDyvSbZQlsiaHpY49hOXShwo5EWtciW6000ljBOE+F5q1sNS51QRwekKqbQdUXE0
 PG4jXJKhgr8ZQ7UU3qpdIbXsC1WmfRdohkU+kllX+KshFugRRR5JEJNUESkRUp2k/qnF
 B18g==
X-Gm-Message-State: AOAM533sou2GZRvX5h4p7DIM0o1h74D3eEs1/rivGqBIsHcXJYeoLW8S
 0uyaXVzXjd7n59Tfo5xklz0=
X-Google-Smtp-Source: ABdhPJxbUBHp+gZYhLfCCG6ZTBRD2ffqyoCqNOtymjfmXL2VINZ0mDSsUZgwsx1JYKCNkmbZGl8EkQ==
X-Received: by 2002:a63:330a:: with SMTP id z10mr4950887pgz.350.1640849276683; 
 Wed, 29 Dec 2021 23:27:56 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id e24sm27176161pjt.45.2021.12.29.23.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 23:27:56 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: ingenic: Fix missing put_device in
 ingenic_ecc_get
Date: Thu, 30 Dec 2021 07:27:51 +0000
Message-Id: <20211230072751.21622-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_232803_010390_8107F857 
X-CRM114-Status: GOOD (  11.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If of_find_device_by_node() succeeds, ingenic_ecc_get() doesn't have
a corresponding put_device(). Thus add put_device() to fix the exception
handling.

Fixes: 15de8c6 ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index efe0ffe4f1ab..9054559e52dd 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -68,9 +68,14 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 	struct ingenic_ecc *ecc;
 
 	pdev = of_find_device_by_node(np);
-	if (!pdev || !platform_get_drvdata(pdev))
+	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	if (!platform_get_drvdata(pdev)) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
 	ecc = platform_get_drvdata(pdev);
 	clk_prepare_enable(ecc->clk);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
