Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9DCC3DA64
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUomaKkt8tk3v14teOTAz8eQre1JXjLPBAXH47jO5Ik=; b=MeSxVMbl9MgzW7
	0O/NyjHjewpQ31dSPTx57VYWKO7rXtn2Cg60zeSHnZji6hHMukO+KyqU2oBjRo9N1A5EVHGbazGsr
	N0h2zDU3+jcRxhS3QPJPXmoqkacfzaBb7VK+TRaUWosSXyL3/CXYeJVsPorPl24swPf5XY9jra2wh
	Q81K5QpEV9ZajbxjNgbEPOnnaIZkDNpDDBGh3djgdQj/lNqSpmqXXjCbO5VrycMVXR35ZxE87XjVF
	nDLUlRA7xklU0cuuOB/SBe9VVktCar/OMf39saMXCyIgVOwdl6coObEVdrC5JRkG2gKC+1MBdXRcd
	/Dey3Or77EHTqQOSy6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7Y-0000000FeYb-2vgp;
	Thu, 18 Jul 2024 03:47:56 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7S-0000000FeSh-3bG6
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:53 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3d93df6b54dso176119b6e.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274469; x=1721879269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5/8Zslr1MP/58mqMHISewZsB2/gBp8DHMSTzEl4QGQ=;
        b=bN7B5E5mONncXCIS2MleE0GtZM+pxZWvdwIN3GsQdZWSwS6RWvU3elqv4q+/q/tkWi
         AzfvqYYwbS7MIpriAoEUbfbUoFoofiAGXDHSJsQtjbfiB3iBzyqHEXrk3DmHb8ZZXm3N
         eriRBPrVJ17lj6G9FCD9lH/aYwBlg+GitoCkLYzCs5O3aOLS84OcpjfHk9drQm3EPdhh
         2ju74plT2V/qfwkg2w/dUJ6YjHT6YvXOlEZjv100P9eI+82b/qLvdv9X8/sK91/Ek/2E
         rp2U/RdUK5OEM1kVO1TL71mJEam2MUEvkub11+YHTNkRKN31WU3M1oN5916/AHMl7IVa
         2GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274469; x=1721879269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5/8Zslr1MP/58mqMHISewZsB2/gBp8DHMSTzEl4QGQ=;
        b=tz/xMs+ZHTPedFEXyuDXFNLrndn5s0mBvNPwuV7howSly05sbsFCy3/AZKDyp5/XuA
         BT2LZtYUbnMYeXEpTzQcy+FNLQk5EyJwZIUU7DBD08rLiprF9WZmZpIV/uNp8bVYlXLz
         EW7uMP/a2hEGszwe2XLwIJJALr0La4bh7R1q5wDt5mmIn7/KTHO6r/aBSHZrczNxRtUZ
         T40L71KQej45WniUW5Dvxq70GhYFZcVrria6qOiKOCeh1JL7ZxrH4Xgyl7ZH5ogxzMHP
         McHGtE57aIjDB1UZQ5GsHYvRoG94aD/aiFOidwYtgzLdUxGlFhqZ/tq+dCyqkjbrUHf0
         O4Zg==
X-Gm-Message-State: AOJu0YyK3J8hirYDxHtpDRzGWNgQXIMdZLRnRPUDJUFgAufDItsAnHV/
	8Tn8pGAFtA5Q5d5Dlq0mHGZI+A08oLxWQeNAQ30ytQuDZBcsqcSF
X-Google-Smtp-Source: AGHT+IFDF7qxwjD4lvstL6IWj4cD8QTRaRA0qpVS05uPxYjJp1QrxnbuNQ84hOkxLbR9ckqWdNl1uw==
X-Received: by 2002:a05:6808:14d2:b0:3d9:385d:8754 with SMTP id 5614622812f47-3dad77941a9mr2005728b6e.47.1721274469600;
        Wed, 17 Jul 2024 20:47:49 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc9965sm8940189b3a.199.2024.07.17.20.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:49 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id D2E46805EF;
	Thu, 18 Jul 2024 11:56:59 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
Date: Thu, 18 Jul 2024 11:46:14 +0800
Message-Id: <20240718034614.484018-7-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204751_038065_7FC5BC6B 
X-CRM114-Status: GOOD (  10.87  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

Adding Manufacture ID 0xC2 in last of ID table because of
Octal Flash need manufacturer fixup for enabling/disabling
Octal DTR mode.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f039819a5252..1a8ccebdfe0e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -200,7 +200,9 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l3255e",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-	}
+	},
+	/* Need the manufacturer fixups, Keep this last */
+	{ .id = SNOR_ID(0xc2) }
 };
 
 static int macronix_nor_octal_dtr_en(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
