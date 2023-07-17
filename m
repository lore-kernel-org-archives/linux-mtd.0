Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE9CEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpbRGcqYMsBrJ7K2qqQxepk68xB7THE0EcHIaPKBJj0=; b=059B+agEwBgniJ
	Fb05Okj5SChRgEeE3zhb5dcUJVdl5m20LyytZQ4zIrkB4vJwGYrAEh6GFcVggtIB0qrWgIsEyCymd
	qGyaQiXuMeRllBChKl97/hw+qjlzd6km+gXYT0YHF/FKaCRSLhm9FKkN9yTkmyeK86iKakWAWlZGY
	sFljrCvUKTtGL0/1bij88rGdztOk12+HHhRRGyuzI6Hec0G0rSbPP5gU/YyVInVHDiARmv8nSCbGJ
	4sxoDcux1+2ai3yojJpggbV/XP9YpD1qrK5xBJsaGmTUlyzt7iKBO3Nkci1hJEUpuls5jWnPxcAsU
	AjLUjQb4rh0kTBBGmjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCn-004YgG-1W;
	Mon, 17 Jul 2023 16:36:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCh-004Ydq-1j
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:36:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso43545315e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 09:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689611765; x=1692203765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX7yNzoekDNDbN0fPtnQMsaJD27BOR7rmE5NRifPB7Q=;
        b=IND8N0L+fr1Uc16sxI3Z74rnAsa6vA+B5Liol8qBgMc1+TRJwZTOnr+ccwlTc8bh1y
         KLwPZin+wq79ZUg03rlNnfT7kwDvm2gaJBOqTC6BMy84w4SyGBMcTNW2a06hGWi+8Pkv
         gr82EUnXj8PBuORxS6Wd8ROv+5qO2tblAUzGmKJg6Lq9IcbUiens009MPFncOP7j/dSq
         pWANDBAcrJADOIfvYOedxt66E2ZXBqEdD8A7iYrzinzZuSfW+EQdewRZPTOJ5sJWX6RZ
         gl0wYGHmuepN+ijRX52fa1eM7fnFUzsNtfgv9qwONzpUvbSVji0KDBbuFuaS7zffaBGY
         fZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611765; x=1692203765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX7yNzoekDNDbN0fPtnQMsaJD27BOR7rmE5NRifPB7Q=;
        b=mFfd3ugjEDVjnPXTcP3aIDzMOFBczBMALw31BUf9mTtakINDY30gJJ7R/IArz0fOnY
         brSRmLaRPNWK9V8W8iGctFoLDv1lPWvtE41rntLJLoMjVZFMmT5HNRZBvYXtWWE+eX7B
         eILtOTDWXmOGMHKRQ2jUl5PpMwYBdDdXvkqhB8lPeKr2/azH0KqLDeqzHytpCpcPAwuv
         54r/fKqlgoDCMJwZedUgsRz5IQfWQYbCJ6TS2eU34zRibogouJsAZTQ1QXQeMcl4Tr+C
         bnoU1cqOcnEqMGnBiIkPZQeMkNMJD60Utp9ZmvB8hI3Yf8WFKhrEiepK5rhftT0Hm5Iz
         /tUQ==
X-Gm-Message-State: ABy/qLbIVZ/JCIeIbzINHRzBMPWt/mXEi4BJTHWa+TcJUdB9rCOoOIIV
	lpaRl+WI5Vt72XCsC/epGh5WQw==
X-Google-Smtp-Source: APBJJlFe3nHBHHz3eZdTxjP3C3AMs95Vkm8fdGGbxfxNNWXpZnEQmXfqK9SvAkayxV63JlDfgmw1lQ==
X-Received: by 2002:a05:600c:2814:b0:3fc:1fb:79d3 with SMTP id m20-20020a05600c281400b003fc01fb79d3mr9572731wmb.15.1689611765395;
        Mon, 17 Jul 2023 09:36:05 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003fb40f5f553sm8401774wmi.31.2023.07.17.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:36:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	ichard@nod.at,
	Takahiro.Kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] mtd: spi-nor: micron-st: make op does not contain garbage
Date: Mon, 17 Jul 2023 19:35:58 +0300
Message-Id: <20230717163600.29087-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717163600.29087-1-tudor.ambarus@linaro.org>
References: <20230717163600.29087-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449; i=tudor.ambarus@linaro.org; h=from:subject; bh=cc3WX61OcneA4MU73qFbNg5cW6QHECtpXG9atTmOcLU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBktW3wEEw9DE81vexn1H1EkBZM0tvslE7PtjiOU hbBgcsMyliJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLVt8AAKCRBLVU9HpY0U 6XjeB/sG/azfGxCjojb1+N7IjYFym26tF4HdiNtjYzRNM8h/648p41pxigBzob1sA5DpU9adYoA b0E9n4iEpWuCeWd4eQCRXXvex09n1DrVCYEDRZQOwnbNb7Prkpi8Pj8WU8aPfABN4LGWQQHzM8s 0XUQgbdgiwalrS+Xius/U2fijDUJ7AVuicR/5PSAW3zF6k8yKX1czXJN7LRVZh9KJ0vSXETGEZ+ WfLfd0vrzLf67cpBfXAAPK0oAGjI61ArtqTilZc0hLV8pt7m68wIRauLIcJkuvGkW3DHSEWmIqt HkhOn99/TPVJ3jE8QzaQJrSzK4099zQGnmPpi8vz74POXD4O
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093607_606240_74E61A2B 
X-CRM114-Status: GOOD (  11.73  )
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

Initialise local struct spi_mem_op with all zeros at declaration,
or by memset before the second use, in order to avoid using garbage
data for fields that are not explicitly set afterwards.

Fixes: ad624dfd7bb6 ("mtd: spi-nor: micron-st: allow using MT35XU512ABA in Octal DTR mode")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f79e71d99124..8390ed6a47b6 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -49,7 +49,7 @@
 
 static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 *buf = nor->bouncebuf;
 	int ret;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
@@ -64,6 +64,7 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 		return ret;
 
 	buf[0] = SPINOR_MT_OCT_DTR;
+	memset(&op, 0, sizeof(op));
 	op = (struct spi_mem_op)
 		MICRON_ST_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					    SPINOR_REG_MT_CFR0V, 1, buf);
@@ -86,7 +87,7 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 
 static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 *buf = nor->bouncebuf;
 	int ret;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
