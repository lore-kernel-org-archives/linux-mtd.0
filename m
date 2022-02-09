Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E799C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2YggJgsC+rV7JwcY0iFX8tQyEzq197nUFKAOiPtXdY=; b=tt9JInPceCo2SX
	oc8u4ZwuTY4GW32Apw1yfUejPzd0Hty7kkrzUQhlYuc8ZB0SEJy+VwD6b1jh6Y4ZvpwJ6Ha4CUemR
	6xCeFx9sfEeSs9NNg+555uBaIE9qG/lex0azbIMU2Yz7hgBK4O8DtwRZaAeYJtTdbmVYnfHLy+hPd
	7NDgtDWGJvWs4V9OJFsgAFsITwjKVvbgihAl9ULwCgcUzLHlqa4IDt4Y9SYrNt9SuxCiTsxnV5tOl
	h+6L7j7EEDZnVAVt01stIRqzefxLB5UNVz/o+pYTXEp4hEcO7n6XO+t7FIokX6jUDLzuCJw6ve0I0
	ePFt2E8H2EQi8B8i0DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHj2H-00GqAG-Lm; Wed, 09 Feb 2022 09:13:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHj0W-00GpZK-Lk
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 09:11:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id k17so1721298plk.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 01:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IIn1rqLLSlScrX2MZYyHWPdPZR7J7H/LDpJtS5YjgFw=;
 b=hCTlv6jpOw2wlgXKnKuXaJrxzXgo7HLyAGe1sl30cgY6A05qLbjXOuKdpAl3X8Ha6V
 mp+mzo8Iuh6TkxgvecAjE0lksDMo4k9GNrMCh+N38IPYUd0SzDR8PZCBkvhYyn8bxR1X
 5q5g0cxvQKijeIFBTGGrSp0ZaG7LNyZm8CnY3QA+23shZmGjGuplnAxBQPkZAFzuE2+n
 289J7AMxCH3RI6u6hju7cCeXzGqazY1JiOv+Wb4z6Qh1drrCytpDcp724KmFtRR5rTea
 93MVIxlwHQJ4uHtA3QpMcFA0qnJxX8/GzuDJjxV73s4t29rJmNG/rfZ4lUOkKCyH0SJV
 we/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IIn1rqLLSlScrX2MZYyHWPdPZR7J7H/LDpJtS5YjgFw=;
 b=sDbBZtCdsqmAYo3ZLwFC7LqC1AlZCfWaMIiQzfmXN0Mg7llx5kHK4DZlWXdbh8etdv
 DxqDA4yaoFgWtIYSCrBJex8I4Ry4lHI4U0kwp9MHaFZifS+EaQRNTB7zImsMvCdOvfxC
 lG9pA7atVsz/x70qVK80txC6yantjoSO1k63pcViBk8fS1FGV7Rsyehgjoq2uYItsX/f
 2Xrfb37T+pQwWpOJi2ejdKy0J5MdHr0UsLWV0IyvN0KPeFajE14CuZag0jYLPVVHvzmG
 nd1rfUzdxjHAPcw+Im1/R7oJuYtBg7LntLAdTWXEJOxgMupmDwrg521FkGA3KqhYBTe6
 jIAg==
X-Gm-Message-State: AOAM531mv+pLi9wb1SY0pOJTVDH5UdQQLdFBO7mfUQ+v5mK8X3qYXchK
 M1UaNc5GvQ5Q67JrHY8sdZAMIfbFH1cE3Q==
X-Google-Smtp-Source: ABdhPJxOboUPIzGqFGyA4LWXTbSNjE+YdWq2Fva66Vl/5Nln609ZXfrBF71knW4G65yeiMgRzA7bPA==
X-Received: by 2002:a17:90b:3eca:: with SMTP id
 rm10mr2313120pjb.211.1644397884025; 
 Wed, 09 Feb 2022 01:11:24 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id v2sm5270643pjt.55.2022.02.09.01.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:11:23 -0800 (PST)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v2 4/4] mtd: spinand: macronix: Add continuous read support
 for MX35LF2GE4AD
Date: Wed,  9 Feb 2022 17:10:22 +0800
Message-Id: <20220209091022.30155-5-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_011124_736147_7CC916F2 
X-CRM114-Status: GOOD (  11.55  )
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

Add continuous read flag for MX35LF2GE4AD

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f31f1381a62..02fb8f37947d 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -126,7 +126,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
