Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A8C77B75
	for <linux-mtd@archiver.kernel.org>; Tue,  9 May 2023 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpB1m+rRrNleJp/Y/sCUVJOem/MTm9C7JRB0unOr2VI=; b=C7qT9TN8JrpaJN
	kAlPhVaLas+O3OFTJOHTTX5YcHQC0wFvFWQTax5s6Vn6zSGqCsNaZxi2jppYkIxyoDslZ15K7ppYo
	NrJm5p+lrQMDXqx9+mgyJ8DuXAn/rIwXmtu+AF40FAuIM6pcJZraeo2p7EdwrBHiG3x61RSLkBBJR
	bGk/SdjbrIoJyg8xreajrLm40GL9uFOysm+7HGC19MINqSsapET8+bdcP6Wsi5qbc23LJKAl+D8/e
	78CgV0VyMvsCCGQXYorZnp6xd+MKzQ3z+Hzt39kAHKosrjWd74XFNMkOJ0dgbib7IwPClZibm3KeI
	KwB3a7p6jQeObxZC0e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSxf-00471p-0y;
	Tue, 09 May 2023 19:25:23 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSxa-00470M-0P
	for linux-mtd@lists.infradead.org;
	Tue, 09 May 2023 19:25:21 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f14ec8d72aso5058388e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 May 2023 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683660313; x=1686252313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8mwiEqJrqUKLjr+CTYZwgPnU7EpYWeys0Xhrb5/CYI=;
        b=NrSG6Zy5wwtEkL+Y3N0rFVqtodQL4ZNgPGFOhh/K0SWS41MfCfdDNJf5pk+BS1eAtC
         E3xuWLmd/6IZCQoaC8S140aUPtr3I8JtjOHi59AZ3sDRdFNZBmauG+jAbCB95tiAEFCm
         a3ZmYyUCbW9USPPgji0Ru+nJQNndC7qRMKGjK//AZ3dbNgH9uCIDJHDvs9QLlq9WREMI
         MWLJ2opAMKkQeVfB2QaJ7ZJkVkEAzWhWHRfXFqCSvSVUoOZs6w3lXYoInOtXym1IKJKy
         CUXfuFmKLFmeaSfOFGO+s4MglzDkREEkac6ypBBq4OkxLEQ1HMmFmre0Um/T0Pg+i1Yu
         TA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683660313; x=1686252313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8mwiEqJrqUKLjr+CTYZwgPnU7EpYWeys0Xhrb5/CYI=;
        b=MlnOYwbDTjHSxDw3VAUxgqObDpkXvPIm127rscGJDxv7ChiEkmAe3cOfzfBmSeEAZC
         CZRishxZaFEj81jWFiy0mGBIDKzfP2j+K6imaFqreJKSub7INfKyhFV+q/VbEVl9fx8o
         RjPQI8Yha/sGoivAgUxO3Jynx57AvzgmoNhvqYB5zoBpOZkpGrCTdJ8K3/XrrvZf9Nyg
         aEa1ayZ38mrSTVbCvoux8SSzzWzoqTvE6HNJfYgajxHkz3ggds/d1mLzfgJzdKXr3NCY
         JQrjd49g/3KstpF6cu2mH7+I4qoiUiZ8DBP2IB/QC9rsGGYbsKQBWKk/6naav9bdPGc1
         uNMg==
X-Gm-Message-State: AC+VfDxzQ648Gw3fMjLduOpADjTc0S1rrvxc/6Afy11Uy2yIdft92whF
	MVxdQxwFk67bUQOVWs1K/ymcZQ==
X-Google-Smtp-Source: ACHHUZ6zZgyh0wuaR1VlvC1ggGYZmX+KkqMgwByqSu+OQdCtGDpZb9QCFralrQ03BSjXYkOlcUaVag==
X-Received: by 2002:a2e:8190:0:b0:2ad:8ca0:dbeb with SMTP id e16-20020a2e8190000000b002ad8ca0dbebmr1116636ljg.18.1683660312756;
        Tue, 09 May 2023 12:25:12 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id 19-20020a05651c009300b002a6007383a0sm1681131ljq.135.2023.05.09.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:25:12 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spi-nor: spansion: make sure local struct does not contain garbage
Date: Tue,  9 May 2023 19:25:06 +0000
Message-ID: <20230509192506.947094-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230509192506.947094-1-tudor.ambarus@linaro.org>
References: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
 <20230509192506.947094-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_122518_164938_9957DECF 
X-CRM114-Status: GOOD (  11.46  )
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

Following error was seen with um-x86_64-gcc12/um-allyesconfig:
+ /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27

Set the spi_mem_op fields at the time of declaration so that all
uninitialized members be initialized to default value.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 6afcc84080c41 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index d44ffaac1dba..257d05ed4146 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -492,7 +492,10 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
 			  const struct sfdp_bfpt *bfpt)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_ARCFN, 1,
+					  nor->bouncebuf);
 	int ret;
 
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
@@ -500,10 +503,6 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 		return ret;
 
 	/* Read Architecture Configuration Register (ARCFN) */
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_ARCFN, 1,
-					  nor->bouncebuf);
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
-- 
2.40.1.521.gf1e218fcd8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
