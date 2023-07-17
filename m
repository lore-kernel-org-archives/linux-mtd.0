Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B006EC00528
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Va7KhHa4e/aWiGmN3H+qQ3DfuiSigVGfMLIoriinQ4s=; b=k705VLXD/a4xQG
	a9WZgyz2wCRq4K9NAOm1n+YPmfYm1LnrKpl+6pBfd2bTGdBHn5pFm24xRvWiEeIpCKTydzfO7gwwQ
	nMbOAY792kb5GKH0CmS2rijuxAChqoCkjzDb74ydA9bpE7BikJZU9q/2z1xJ3HSjys7fZeobb7QQ4
	jOVXopYFDht/oH+2q3T6XyNw0nUSmD7PkiTQ1wWNNR/p6ooohKPqKzgchkzcHExxDVgAnOtvTZEs4
	atHlQELgSl4EVKig3e1MrxqbUtc25Oxz6DUpU7csP8R4Rq1mA5eyFk+ra3M1MXz3WLViUtajIEgr5
	oyAGtmCCF+15HnZtS71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCp-004Ygo-01;
	Mon, 17 Jul 2023 16:36:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRCj-004YeU-2E
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:36:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso43486935e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689611768; x=1692203768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BHlMzcHYoIQ/5F2lC99n1rk5D4NCewvebB3dqx2z9A=;
        b=A/W5XRDhCLcF15wQAwDxezJ+NNw+om7iiYhAd64k/dGNhSkEKU2NRPeiPeIpWH1+C4
         RgFCIZf0ICfWgH+H22jw0zzAU5r7OV3MCQWh+hSQzV4foAfybe6Vx5g2BO2iWQgHZ+w1
         QbWCVX9qXxfbCMecyyij6V36Ym+3HIqZ6Z9QULePNMc4ka2o9aoXukLMjaXXlvVgCvxD
         M/ztYFdQV+pZMCydcuLHuYmT0IyYantJEd6Wmn0YReQpfG8ZzGGKrPIRDn1lhom4mpxU
         xwHtKEBYDkea2rnTjAZ644g4vAAqGaW0ICM4kOJLQUqSgeAvqmtEOQMwwfsRc0JEjjWY
         /xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611768; x=1692203768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BHlMzcHYoIQ/5F2lC99n1rk5D4NCewvebB3dqx2z9A=;
        b=PdJhq8HOkt+Tjgp9h+i3C8s0iSvQXI9pa3ZQOG3zXW1sCPzCFY/Y6kpVxETYEK14xl
         TYNzNEgd+wrny1wugfeywBIl0J4jGaoZq54LAjUldWbmSQzdFJFhMf+8dPGXiGMMKoI9
         adtNeVO2LRETHeVzLDHxrm6s43f3YVFZJ+J6EohY5aginJrCoWYkjuBfwJGrNFrvWDh5
         pWYQdb8aY8PWUsodBadBbOl31zctDOMKR0DHj85fPLQfBQO6BJLC7skrFrETMXQ3EwB7
         oq0vpecoi3d7JA7KPL+rNVEaXG3vfKC+tgnsiEMcKpj4NnGtfLp37R1WbfEH3lcNxGgg
         FBNA==
X-Gm-Message-State: ABy/qLYvXicIV78CZ5J4r+t1kBuzsbi7nFBSljUXS33RhyzommR/6Y08
	6mvSy80B2mkWkNZX5Lj/0KODsA==
X-Google-Smtp-Source: APBJJlE8De/7VCFQjN/m+Z6kzJXg7MDef5Bg0VJQgMK60QU9AMr+lhTdH3I9BQOr+2oO/tTFBfa/lA==
X-Received: by 2002:a05:600c:247:b0:3fb:b6fa:9871 with SMTP id 7-20020a05600c024700b003fbb6fa9871mr9299500wmj.14.1689611767777;
        Mon, 17 Jul 2023 09:36:07 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003fb40f5f553sm8401774wmi.31.2023.07.17.09.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:36:07 -0700 (PDT)
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
Subject: [PATCH 4/4] mtd: spi-nor: spansion: make sure op does not contain garbage (2)
Date: Mon, 17 Jul 2023 19:36:00 +0300
Message-Id: <20230717163600.29087-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717163600.29087-1-tudor.ambarus@linaro.org>
References: <20230717163600.29087-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=tudor.ambarus@linaro.org; h=from:subject; bh=MA05hwZg2zr6d+O9X5q1HLg6NFLm0xJVJqTNBEWaguo=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBktW3wRTw4YeCaxFZJEwY09jToFFH2GI3KkwVoZ un8raZaMTyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLVt8AAKCRBLVU9HpY0U 6V5ACADCTsIJ6xwp2xykxCJ4F4a1wBs4RbXl5Dw4ChKIOmWeFsuQxGp+9TopB8e5pBLk5swhaTU KY+obbOAy8ujF5CypB0k9CxxTyGBxaMiSwySSEQZacAWcQviBXILqdJr2GJfNNqwXz7rF/0Q6op szH8UmQZ2UwDRiaVNNdQ81aIqhwT/8Ps/+bO4iRA9f12lXZDA2cikUrG9Yy89EjaoYJwIjplRYd grSzjoxXLO997T/t1fEa7+VA5YbR1pWqeCdd/OTu8mr8La8m35LY500cJ/94MyLNKdIC3OHtFcJ tQK+5AqFBsYOlyrnKWJHo8Dqy3TxY7XixYy8ASrstS7nmxJf
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093609_733077_150E8B46 
X-CRM114-Status: GOOD (  11.81  )
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

Fixes: b6b23833fc42 ("mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c03445e46d56..7485b708158f 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -220,7 +220,7 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 
 static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
 {
-	struct spi_mem_op op;
+	struct spi_mem_op op = {};
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 	u8 cfr1v_written;
 	int ret;
@@ -237,6 +237,7 @@ static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
 		return 0;
 
 	/* Update the Quad Enable bit. */
+	memset(&op, 0, sizeof(op));
 	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1_QUAD_EN;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes, addr, 1,
@@ -248,6 +249,7 @@ static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
 	cfr1v_written = nor->bouncebuf[0];
 
 	/* Read back and check it. */
+	memset(&op, 0, sizeof(op));
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0,
 					  nor->bouncebuf);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
