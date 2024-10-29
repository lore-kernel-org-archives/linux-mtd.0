Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574A1D3E2DE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yjjOVYnFjo52qdOoVXb3K/2AlZKliu1imAZDpjkPHrA=; b=WTdOrIBkFxsNqD
	EWXEEFEbtgsfxgCfjfkk4oMd3G8vkFNoWuhJDiiuH2dwlagot3kWFsk/ZVWl4ERnFzJAOvn3WMcn4
	XNP3EU+Q2VgoCUULdED5L59sLoLsw58CEilgr/d/3a6JecY1JrLZfGZOtan9VmJp9nC3Ce3LGb6XM
	G0j5Fq7wn5VPuBqPwgVwLs2RD+332XN80nAyb2Cb4L5m4IJU6K3IXI7rBDfg2KhhftTQeTCsP5Vjf
	RfbGXmKgtq97A2vL/lexI9g6n+22COk96zECoiGx705JEXUSQpiS5jO7Sypb1QbLSgTnTb9WA8G+G
	4/Y70lddBO0WKUHVb7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hA7-0000000DbaE-18fh;
	Tue, 29 Oct 2024 08:01:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h9q-0000000DbWI-3W0s
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 08:00:56 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso5222805e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 01:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730188853; x=1730793653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n4x9GYxa/84hlNl/zX8+weX12yrLQSNbbEjP2vC+SU=;
        b=fWOiSYYe9ZXFbObwwjRF0I33KvjOSFRPSsKpntzi84hDZGasMmAF/oUzOkoOihfvAC
         4kSjKxxU8HCJKvFfX5utzi/smUlXQ2CWbPoCY4yN1WB3A8/uzSJT00H2QrVOmrRnvmyP
         JTxIYRLj5prbIU9AfHGThceCaDbPXd12vTbt2tTXRWA0viDtyqpCl9PoauJ0sHPNN/AU
         WiH59+bFY7sd0UjlEuZvsdSF3IL5dHB+Rbkx3DiVmnGqSxDXDq+adJbUwTzx5QMtfDPL
         XAd0YNjEmg1NokM2naKPufAEAH7bcqxE+ZD18UU/lFbFtZlSqBaVr6hzOCGw3zoe+rLn
         Q7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188853; x=1730793653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n4x9GYxa/84hlNl/zX8+weX12yrLQSNbbEjP2vC+SU=;
        b=aqgeeysXJgFVQFVRle6StVZsd/lg2wVXwHE8pR+GRPk83XlDIpX7pH1Oco++U/cLua
         K8eBJvGH5iF20hN3c9FRthCg5GvThe5WcbDzNeRBDicgwVP3Fp0ZzM0wczuD/QnULvV3
         LK/Sn/LGhbJ/FQe1Mm+toQjwf/hX385I27D8B49kbq8J4xcmyN8w1AjnjitpRrEn56Mn
         9eQ6ipicgzrrhDhQBTbA1xXJBtmnPL6LTLiBsS+BUrhlvnf8aTZlT9CqoFOfDXMnyALB
         PocErPnztIT58cFLPhrNi0hRHHNVt+1iesPhkmoVx92Egb+sjuFXmwcciaKKbbwqLBJh
         yuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD1QyEsTFLql9eGyW0ozqlLOtqA5ifUtC5d4KkOv68hIzqhBKNNwkKaEW4IPkAFBBMfAlkL9i6mXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyE28rT1ZsBjF0c9MG56g2l0lFDK5kWZBGJunYHEX4A3DFBGcDS
	xGjw8FegUSChS3PeGX3tkrWciUWNWsRql1apnwnrVl4YyuiCcWVKSSKKf7lJoSw=
X-Google-Smtp-Source: AGHT+IFI0GQq8D7c2huksHpR4S4ZugunHxuqIU3GR4zlJi6+IR1gaYwVJZr1f3llj1rmrlrWDh05mg==
X-Received: by 2002:a05:6512:2243:b0:539:de0d:1e35 with SMTP id 2adb3069b0e04-53b348c1ddemr4380499e87.1.1730188852659;
        Tue, 29 Oct 2024 01:00:52 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a4b40sm135826265e9.24.2024.10.29.01.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:00:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org
Cc: mwalle@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: winbond: add "w/ and w/o SFDP" comment
Date: Tue, 29 Oct 2024 08:00:49 +0000
Message-ID: <20241029080049.96679-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_010055_076872_014B2BDC 
X-CRM114-Status: GOOD (  10.63  )
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

Commit d35df77707bf ("mtd: spi-nor: winbond: fix w25q128 regression")
upstream fixed a regression for flavors of 0xef4018 flash that don't
define SFDP tables. Add a comment on the flash definition highlighting
that there are flavors of flashes with and without SFDP support.
It spares developers searching the entire git log for when we'll better
handle these cases.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 9f7ce5763e71..8d0a00d69e12 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -129,6 +129,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x18),
+		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
-- 
2.47.0.163.g1226f6d8fa-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
