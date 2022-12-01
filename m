Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D0C47089
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qp4C0zpyR5FskfPPxQG/SRjACmXC1LW5HOyOWI34cU=; b=PC0I4JYKL9cxH+
	yPifx2MzqVzjdY0v1PLlikNlzwm8aBOhjr3Q9j3n1g90JBeRpb0jUqrFxiiAU/cd88mJ33+AuYrmA
	HZicI1NW8GKy9JxxDWrNFrr5xh5nMzv8XIa5QfiArwQcCGxUylScCeZdV/sOhIwNoxJrMd0fUW4zg
	a38pT7Is+wOWg4csKgmRSQdupm+K2qJNLJI0oLxyK+B03KbAScz7byrtadGs85Z2V9E3zwvwo3x1k
	S6+2P2tuWvtzpc6Julu4EJIyvtJE+HuLWgssSwDhTS1Q0EpEdkFct4CcVzjMJM0GPczD471FokiYr
	Mgl6wIJNLAu7geOdQm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r9I-00B99y-2v; Thu, 01 Dec 2022 21:31:16 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0r64-00B8gf-UZ
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 21:27:58 +0000
Received: by mail-qt1-x830.google.com with SMTP id l15so2669589qtv.4
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEyo4vlQR3u2sX38LTBhVX1Aa2arb17/54UJyym5vVg=;
        b=EWk5IELMmlI38n1uhUacmXE6nI16ZieyrjDtXucqKGOoILjkZCVKd7G5MmpoHtVUDR
         FODUAoMPinQwe7s/RYoC24pIP5eSH5ct7ktaljx7Ne+L+GrC7Zw9P1lbpqcNIctg7Oys
         K5MPpKo9YR9fnOMDN/QtxzqAAqAFeoUA8LuDQM/xMlxw4jadGSbkKxbwBV8M2Ypa8+HO
         fyZ56Xplt1NT6SFye1XZpVCIYFEiCmoA7TZeQwcNZKkCy3GQJkYiTY7N8Qzco3MdgL+Z
         BJexh6if4a8RuEKHFOxVaUqXIMFiqiYJ/HMg6j1NhyhdRS/lLtn+FvKyEXmCRrosq6hB
         UQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEyo4vlQR3u2sX38LTBhVX1Aa2arb17/54UJyym5vVg=;
        b=B7HGNsj2p6KRwCmla40ng9b6TTnTKCVqbZ0Aokuc9G58xIlue5RvkZDrjlKcIcQJ8e
         y+xKGD8tSM9HMX1ya/VXtB3s8CKGkHxRGhhg33l+nZAICrcVnQbGoaIydydUffarivPn
         AXWzMMDASKqQD98Ea7qnAS20qe0EuCCCtKeq6JfBO9oW42BTXvKCPxL+UPWNFRIBfjG4
         +WUkc8DkUlYaD7ahBfPt6znt/Pr1pakDLZh5tLHBwUyRAtWB4hPr4I/QYmOgw0yH4WIP
         3oXbepNeEOty8hSUS4Qj+jrJbCODwIBoMRlgP5tHn4mDoYlHtW79uSdgAE5HnI/bCash
         qU+Q==
X-Gm-Message-State: ANoB5plTaqQFu5P90OGcTXA/Hym1ZXNAnEfDdfrQhbt3qc4RHtp4qrL4
	ZOlZnfmtAJrBkA+nhDmvbOCbiw==
X-Google-Smtp-Source: AA0mqf4k5vhbOKyhVfUNFXRGyBkYZpgvQPpouVWk0dqcsycuplAYPA4KGV+Z/aOB9NXAI7JE7i3h3w==
X-Received: by 2002:a05:620a:1098:b0:6ef:a7f:e09d with SMTP id g24-20020a05620a109800b006ef0a7fe09dmr61482350qkk.109.1669930075721;
        Thu, 01 Dec 2022 13:27:55 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id l15-20020a37f90f000000b006fc447eebe5sm4071321qkj.27.2022.12.01.13.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:27:55 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/3] mtd: spi-nor: Add additional octal-mode flags to be checked during SFDP
Date: Thu,  1 Dec 2022 16:27:49 -0500
Message-Id: <20221201212750.267721-3-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201212750.267721-1-nathan.morrison@timesys.com>
References: <20221201212750.267721-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_132757_016383_AA72EC36 
X-CRM114-Status: GOOD (  14.02  )
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

This adds some support for searching a chips SFDP table for:

read commands: 1S-8S-8S
program commands: 1S-1S-8S, 1S-8S-8S

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 drivers/mtd/spi-nor/core.h | 5 +++--
 drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bee8fc4c9f07..2f882608abc6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2359,6 +2359,13 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 					  SNOR_PROTO_1_1_8);
 	}
 
+	if (no_sfdp_flags & SPI_NOR_OCTAL_READ_1_8_8) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_8_8;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_8_8],
+					  0, 16, SPINOR_OP_READ_1_8_8,
+					  SNOR_PROTO_1_8_8);
+	}
+
 	if (no_sfdp_flags & SPI_NOR_OCTAL_DTR_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
@@ -2514,6 +2521,7 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
 					SPI_NOR_QUAD_READ |
 					SPI_NOR_OCTAL_READ |
+					SPI_NOR_OCTAL_READ_1_8_8 |
 					SPI_NOR_OCTAL_DTR_READ))
 		spi_nor_sfdp_init_params_deprecated(nor);
 }
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..7bc1cde049b7 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -514,8 +514,9 @@ struct flash_info {
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)
-#define SPI_NOR_OCTAL_DTR_READ		BIT(6)
-#define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_OCTAL_READ_1_8_8	BIT(6)
+#define SPI_NOR_OCTAL_DTR_READ		BIT(7)
+#define SPI_NOR_OCTAL_DTR_PP		BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e4e87815ba94..e1b7547bf81e 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1089,6 +1089,14 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
 					SPINOR_OP_PP_1_4_4_4B,
 					SNOR_PROTO_1_4_4);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_8],
+					SPINOR_OP_PP_1_1_8_4B,
+					SNOR_PROTO_1_1_8);
+	if (pp_hwcaps & SNOR_HWCAPS_PP_1_8_8)
+		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_8_8],
+					SPINOR_OP_PP_1_8_8_4B,
+					SNOR_PROTO_1_8_8);
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
 		if (erase_mask & BIT(i))
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
