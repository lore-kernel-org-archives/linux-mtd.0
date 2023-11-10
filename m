Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C2EC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 01:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQ2P5I8oCMliAyHJYEmb1cnEvmExRntN2S1cy+BoqTU=; b=DVK2gDOQx1u3YA
	+bM3UvjN0RHyuyfiGlflghtkGf18oV39NXRhjH1xWm5UUHag2YjpOsI7N+X7xyv6zAHYWhyszyDZu
	nFT/6eWmimlcDp1lkYSG6LGxW9ydoAMvByHOZMHrC8dx6hFNafMrpMVhSpDgEUO6M2LwTytC5nH6V
	c/vgrCCUkWt/kx9wJvGvHqBeoeGT40kpP+wZimfPCrOqaLFdFk5iV4PiHdp2zJdjiVgcjmmaOP6xY
	Fj5BtJO6bQ7Hd22WaBcCTaljhcZ+CIls8xEY9EuJMIuunzC4vIgZ0UvQClkwhoKAWV4EJa8eh5Vij
	KzGhH+wJm/suMCwzrlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCp-007ZiO-0d;
	Fri, 10 Nov 2023 01:21:07 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1GCn-007Zgz-0F
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 01:21:06 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1f03db0a410so844522fac.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 17:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699579263; x=1700184063; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=il4/PY5BDyM7db87KIoCyHawc+72HGUS4y4nNXmHSKk=;
        b=VnBzgTxzWsZ3PV6YUrNdL/cAqLT6u54BozDp2Y6qnzeNvJfn/SPOT32I/WWahFttV6
         S81wngQcKTT/Oo5l8EtDors8UIP73x4AWG+J0x42Kv/6D2JRWa+jFDjhzNDZKmu/9WDR
         gxZfJfIcpX1r/bAI4ezefJYBvf5lmRhAHdw8Put2Kd6J0mKxInTNro66/EpuFPM8e2Df
         jlKaQM+dNfQ5Lqb/5rrPHzjzOBwZcACqfmY+ob7aS6aUDjBlaB2OpuQHr+P+bQ94c0ff
         vCsAPLe2Ook0g3MZUliFxbyrZAUxxEuaoHyT78RykNOjEdR4CLxsYUfz1oenYhReIW1n
         l0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699579263; x=1700184063;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=il4/PY5BDyM7db87KIoCyHawc+72HGUS4y4nNXmHSKk=;
        b=Cyxk0wa554MnCJHe9RLll3mw5Z32oS0FYZAiA9Dh5ghpo0UjELj2Wm8B0cCEnsPssE
         uLkE+NIEssKM8DF2eJAhgTRNQ6ze5y2KG62NvBqjiPpPVh/lMQxkrIopnVH7XThIVoD8
         UUsIVW0J3x7hAUrNbCXIoivn1jAXOH+j7k5IyJyqZ8PiGOKGqNalQ6sVTf/Fgr4IakBW
         7ZjFOuMoGVPQzANvVfoF0FIZ2ZlwVcpLd2oExgsqSxF3ZETkjUxbesUpDcsuXPnklhn2
         QDQLx3Ep7NTzGBywi3SVV+sMfGLoHRPAX/Lsfx+w0sZaItnJt6itqHQ3B+CKI9giXS87
         j7/Q==
X-Gm-Message-State: AOJu0Yw4vtBZfxd1DRu2nuMgxtfK9Oe+gxN0Y0j2qGWrt+2utb5xCX5g
	Zng1h1Dqoeoj43B93Xfn+IeYiv2Y4Jk=
X-Google-Smtp-Source: AGHT+IE1xmXRMITxzdhlRxXmG+DIYAh1fn3e82CMOF2IfVM/7aCg4z9BbMbCFr/BBoMkqovnsBtQUw==
X-Received: by 2002:a05:6870:34a:b0:1ea:2506:3e90 with SMTP id n10-20020a056870034a00b001ea25063e90mr7305843oaf.35.1699579263199;
        Thu, 09 Nov 2023 17:21:03 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00125100b0069102aa1918sm11253492pfi.48.2023.11.09.17.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:21:02 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v4 4/4]  mtd: spinand: macronix: Add continuous read support for Macronix Flash
Date: Fri, 10 Nov 2023 09:20:35 +0800
Message-Id: <20231110012035.11313-5-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
References: <20231110012035.11313-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_172105_112096_D98E4C43 
X-CRM114-Status: UNSURE (   8.80  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read flag for those flash with continuous read
feature.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3dfc7e1e5241..69c9c9dfe672 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -127,7 +127,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
@@ -137,7 +137,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF1G24AD",
@@ -215,7 +215,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G14AC",
@@ -245,7 +245,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AC",
@@ -255,7 +255,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1G14AC",
@@ -285,7 +285,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1GE4AC",
@@ -295,7 +295,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
