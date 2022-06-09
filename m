Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E23FC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SilLvSGelUIDhBJo7aS0p+CuOk3r3MrMOlge9G4YTeg=; b=N9CO5HAn5F0xRM
	b59ShL6twlokY7OUBtKxZb58QYqofNAr2o0Wvho8B8tiJnfNC5FDNk7F1BmzeDH4uQJOX0L9efKlG
	nTsjyX2Uskl0x4xoVAmbNsjbrfj0ZOOkmEgQfK527aOoRheo3VcprOrWE5YpmDaj7EzkNSl5Pkob/
	QCg5TV6wNxhzJUgqZU86DhGYgv7kiXRBQstB8JAT5MWv8tFVGRZIIQiyGvEn/5lonfSEtIWgK7k1d
	ESZAaEhgoyjV1MXP0pzIUUU0kIbIbpWhp93A1JBG4GV0PMQV1lqNTrbrw3m8snv/ukn4WtZRvT/wA
	cejY73ls2rVAZUNIHDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE5Q-000W6F-Ud; Thu, 09 Jun 2022 09:04:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE19-000TrD-P0
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 08:59:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 184so5315670pga.12
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bH1TQPcUtgJxpa/5qqHBBvXPIC1Q5xXkPN+Gy7H2aA=;
        b=QvXEkI75qb1URo9QYfZbhtoMyfnETnR/SItXvNU9ih5PTUbYeolOsPtzvQM8DIBgFl
         HpwFzfGGj+j78qrr/uYR/XFBXN3khK4OaIZ0xQWV77pmRG1+PEQmDqNIuBFrTR/oQnjB
         gmku5E4DfX/5xeqnMIGczJh85wHVHL4K+KSLraWg2upXe/ebDfmCy/YMT6Zc6KJOMoML
         xkBgNjaTM4YdkL2Fgja8f1YEX0A39GYa+exGIbCodZ45myseAbuZVzVCodGRng6yuvDz
         Wy6aFrm9sNzv91QFtKsRUUvH6aZbwr4ADYEme2oIMpncUetYvXlNPI+OiRWY17TLFqB8
         2Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bH1TQPcUtgJxpa/5qqHBBvXPIC1Q5xXkPN+Gy7H2aA=;
        b=RjuYLHLUC08rCa7PToGU971E/IjSN89Fwllfituix0psFEw2bbw1dPyGvzJ+b/ee2h
         O4zVt1W1l20IZ9iL6GYMHQEiI86M5Hb5881GrNVund/9sbFnm1gNQVLt1SoIY4/NE16W
         C1PXUMsW9mDslMNr2kb29GVH/gbGCPH8PG8YXEiI36hnPyrc1jqKK+7K+16nRx/cXVq1
         Zdt/Z0NxkjhpbDY+wkPlJDflJusM2+JZdrVjw4IF4cu8h6byK7OM4TP7cv9VylsF3H2h
         RRToxJRhlW7O88E0vhsv+tOPGus1E5xee/7Ax1ivNW9H7v3wGQd0BMtZlq4TkeR80iPO
         MTpA==
X-Gm-Message-State: AOAM531/UmNxrXWLMx6IMWQkyvlTogjft27lCkOAN8X9VyCkbTZvebph
	93FIhzfjeOs+qST/xPg5c2nhS4JzKxM=
X-Google-Smtp-Source: ABdhPJyKZhhAX3WdcGdI4EKgfFfN/x6eJFeQhlRDXNq0/BetZbAVjHYmQQc518RJaHvB7D00lkROsg==
X-Received: by 2002:a62:868c:0:b0:51b:bd62:4c87 with SMTP id x134-20020a62868c000000b0051bbd624c87mr38485612pfd.83.1654765190252;
        Thu, 09 Jun 2022 01:59:50 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
        by smtp.gmail.com with ESMTPSA id ja13-20020a170902efcd00b00168adae4eb2sm575997plb.262.2022.06.09.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:59:50 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	p.yadav@ti.com,
	michael@walle.cc,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v16 4/8] mtd: spi-nor: core: Return error code from set_4byte_addr_mode()
Date: Thu,  9 Jun 2022 17:57:41 +0900
Message-Id: <8a70f096f111823e348793fd3e0fa9c87662212f.1654741889.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_015951_864038_EC3167EF 
X-CRM114-Status: GOOD (  10.56  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The prams->set_4byte_addr_mode returns error code but is not handled
in spi_nor_init().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 70a9570fc2d4..3aa159d29159 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2729,7 +2729,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		nor->params->set_4byte_addr_mode(nor, true);
+		return nor->params->set_4byte_addr_mode(nor, true);
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
