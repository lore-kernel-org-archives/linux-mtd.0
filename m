Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58022C77B7C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TLhSWpaYCInrk8/b6x25qMz0LgZ0V7+17h2RLaC9L4=; b=KQCb7DC6d8QNtR
	BSN4FQ5wE5GV2lDqoJ3ke+elo9IOj3EUfXf/01Q9eGqCSobtIVDB5MPOfY7wvxw7uRvAP+tEghMgd
	OKysjpdNZaNL6m0CvmKd7wHHRfGHk0C5A1vbjS6PCy1iW453MCWcZC+l3cOeulUCTKm31+7jkdpHl
	IbrEh4EwquXzGdyhr2ClYGsqDXy2tKmbqwm+VoLghiuxlve7HTFPbiYKzQujgJ66uwYWs58AgVozf
	fmuHQXxuwcenuFC3C9VMdfMO1ttLnZzy6Bl7LehSBL0YVCLCsP613486x1fah5wTmRpWTIQ0VbGG/
	QGzPly5P2tIOIgJBpP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTB1-0048GJ-1t;
	Tue, 09 May 2023 19:39:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTAz-0048Ft-0n
	for linux-mtd@lists.infradead.org;
	Tue, 09 May 2023 19:39:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso7128278e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 May 2023 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683661145; x=1686253145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjRYRiygujOMdMi47FokaOkwwmbe8xeOyySyfPzkKoQ=;
        b=K5uDrOlg7wxrIEEUXL4IqqMSaHYVxpFE5MzreB7nMcV6sNxaWyJ1UWS6WaKfQ4xy30
         pzO3w4CtkAUdImbT56U6IMXRqrp++x6pYKFf8c5MybpthgYVA7pLlrCCCdFyXncftFQm
         YXdxgd1+VRvMyKGPOi1qGFaYRXAtJrLCsuBj4iAxzlFKrljjDLFwuJSbxZFaI4pZ6M0Z
         q5RDclDFdMotV66m+REhh5HoLOS7XHgk4321f2W4QuEwzaI9NfjLxqXu0VpgYUQGnjVV
         8DBGEiUc9zDM1rQXJTIrQ0rd4MQffMpNsko32I2jYDaTRiq31NeWjgWQtsfntYtPjPwW
         24EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683661145; x=1686253145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjRYRiygujOMdMi47FokaOkwwmbe8xeOyySyfPzkKoQ=;
        b=VjBSco1sz9ZHqdj5M2yj0fN3LDH0oWbvUJcmH29fRqp99AENhxf3HHukT5/ryMYF2w
         6QgtOGiarre4cadNS371hMhFrqO/1CoJZqhXz/7UMKtzNPOr62P7m+IH6kn0upmC98yq
         nxeUro9eXwJkJdR9K1zsOTIE49a4/sSZE/fsrR5Xplws3cwKYdoxqlzJ1BdzzeDHe2ym
         u39KszIyNah83mOjj8QwvJa0sgeqfdUjnh2fmxMehz2ZqLmVce2mT6EW7C1iKP5gkic9
         UAfu435cQKB3JaOqjGLP3EajE4bD5YTtPrBd7JxsH1U5Q90ci3gj/Ky3pXOOFrYw5/Um
         /o6w==
X-Gm-Message-State: AC+VfDwFAL9BNVSSBRwfgTh0fmHcSRHWiauTkrQ6q43cqdlGab3nDTzo
	vx6n+u/FH6MizFPo51/UBCpAEg==
X-Google-Smtp-Source: ACHHUZ5Lvym173rLLRPpv6EOhKVBpcCF7Lyy6agBSy8BhlZ89X4wwH0J2i0lMBJI0BDe090uWrX9kg==
X-Received: by 2002:ac2:546b:0:b0:4ed:b329:5d85 with SMTP id e11-20020ac2546b000000b004edb3295d85mr972332lfn.15.1683661145049;
        Tue, 09 May 2023 12:39:05 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b004eb42f5367bsm453943lfb.19.2023.05.09.12.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:39:04 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com
Cc: pratyush@kernel.org,
	michael@walle.cc,
	richard@nod.at,
	vigneshr@ti.com,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	geert@linux-m68k.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2] mtd: spi-nor: spansion: make sure local struct does not contain garbage
Date: Tue,  9 May 2023 19:39:00 +0000
Message-ID: <20230509193900.948753-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
References: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_123909_326699_38DCFC96 
X-CRM114-Status: GOOD (  12.62  )
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

Following errors were seen with um-x86_64-gcc12/um-allyesconfig:
+ /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27

Initialise local struct spi_mem_op with all zeros at declaration in
order to avoid using garbage data for fields that are not explicitly
set afterwards.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: c87c9b11c53ce ("mtd: spi-nor: spansion: Determine current address mode")
Fixes: 6afcc84080c41 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2:
- init both local vars with all zeros at declaration
- squash patches as the blamed commits were just introduced in this
  merge window.

 drivers/mtd/spi-nor/spansion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15f9a80c10b9..36876aa849ed 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -361,7 +361,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
  */
 static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 addr_mode;
 	int ret;
 
@@ -492,7 +492,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
 			  const struct sfdp_bfpt *bfpt)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	int ret;
 
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
-- 
2.40.1.521.gf1e218fcd8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
