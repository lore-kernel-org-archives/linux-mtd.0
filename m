Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD9FCDB483
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EdcEk/zkTAKIkck8lRM3jq1MlBjoEUUlvcECsUAMF0M=; b=WNRMODxiWPVJKS
	xAFPPPzqBDsUU1uucqylP2T2ewJCumZz4YwmlNYBgE3W4YeEQcbz/HBjm51LgsaD35x0wvaOKPXeu
	ptoBneea6xbOAKRv4V4cJdyyn1rnCqnjbTZJp/pzU8a1i5BkXnBIDrjpT/Q2wmunVuKWgSTK7Mu9Y
	+371k/U0ZpNUWrgdHBIk7wfvdFxedaFwVnJQHqBy2qTy8SG514zgeeocwDwZAo2YWPdOCXL9Z9J3n
	q9n6x7R2QGb6OyFbkDTCl1Nzn9MCozF3vx4E0NjWSeLgEHGMmBCS+oNzQBRaMQ0Lx9cgFndVhSHvf
	g7qVRob4Krxujv39HhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenT-00Bax6-3A;
	Tue, 17 Oct 2023 07:47:23 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsenR-00BawS-2L
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 07:47:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50305abe5f0so7008229e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697528839; x=1698133639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JQ6xELgmoE4Fh5HXfTlqwZoaUxUMP9X9H3TeeWmUuM=;
        b=hHioThW8CktGKDc1K8Zt9j/wSHmzUUVqkqBqIaXwbsVC+H6DdZqXlYu9XT/bIi84n2
         5nmqpcUrxnk5aTYEJFSw2uxw+3V6hlG/POOQ7suGbV4ItlUxM894QRaHvSp2o/fzTmOo
         n9h6weWPHmi0X2UIVE9GfZdrbjaBpOw+vtrO2m+EPxjrXYeEnW3kF7sYVwMkUZOWwwat
         94ilE3fq3EthR57TAi0MWMQDzj2WFhpOUswA4NHzRuM67hRzrvb4snHW3XHAR8UlPHNN
         4PYlpfaMZqlAm6itHCnMfVe4i9YPkldkpkkyH1rv0x42k8Tb045aoWXnq5ZN1XotxoA3
         V6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697528839; x=1698133639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JQ6xELgmoE4Fh5HXfTlqwZoaUxUMP9X9H3TeeWmUuM=;
        b=SFOSTcfIZ++PJ3ltZbJWjKfan259xYPLWYiqxsXnRRK66eiBbDsCFE8NwYIMTIy9lC
         iKAdTZsnURSouin4J6JECsz4sUMx5V1u6xptJBj8MWgL9JLZ8EhZ2ZqgFL3usSR5DnjQ
         qVWLiekeADOGeItBScgxYckIldezff5n7aOUD2UJjNyjrRRYMnkx4xFyPwgUYVxNYDPd
         afs0qew+UDFRgaPMJ1TsUzi5nJVvIef4yWMKSapxukJX3Uv13PtY6LoNpgSq75h7nIZI
         eFRoS/etumIPwvUaR9mqsTuqZq2eQKQfNCGwR+MUKbbBRjO4pLZt9PhdNGRYfFnhR89X
         7Lcg==
X-Gm-Message-State: AOJu0YyqklP2B5731++FRhq7t78ej30CwMoAF+qNhsZeEAtHppbSxGHZ
	JHR9haYrBedau3cBq8wyvh6amB4uOto901jXZhw=
X-Google-Smtp-Source: AGHT+IHlHZwQqrTyGPKmgV2WXL2sNBDNFXFUtV0dJXP0gQZmhVIwlGJmwOUIMXuP/U+neFWoA2X+gQ==
X-Received: by 2002:a05:6512:b9e:b0:500:92f1:c341 with SMTP id b30-20020a0565120b9e00b0050092f1c341mr1508285lfv.54.1697528838907;
        Tue, 17 Oct 2023 00:47:18 -0700 (PDT)
Received: from 1.. ([213.233.104.181])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b0053db1ca293asm718688edb.19.2023.10.17.00.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:47:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 1/2] mtd: spi-nor: micron-st: enable lock/unlock for mt25qu512a
Date: Tue, 17 Oct 2023 10:47:10 +0300
Message-Id: <20231017074711.12167-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=tudor.ambarus@linaro.org; h=from:subject; bh=8ZXAgQ2R8FwdwbDR6I4ATP7ZjR/H4BnBjM7H0wHxwc4=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlLjv+MSSshEngD1lT20bTB3F71hHFmXWd4cUpD GB0cvWpbVeJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZS47/gAKCRBLVU9HpY0U 6QqyB/9D8tw7XWJozUL6TBolhqgyRnicYMVwWevIl9BnVCasS7VUJpWXrEpQhXrMBHsKdHh2/cC SYTTBrcwdzJk2ANtEleoZwkHEC/eKJmKkIT3ITT/HfrqzKSi5UhPxIvWiVMqXKFVEAsgOB/yu4Z yH/OJYjHLaQEzrWx4ic+LL8uF+mNztnEG3Mt64eCheSMm1j6+TqaoLdumdNjC+iMpBTQVViRND7 F9+w8bMUuOe1aQf0HUpZboCODFJmxuMVLdkychq7GP0i0fLKzQIDWXYpuJNjnhVv66xNOF0kSBJ ReSl70MdZn5O4JWdr52n2IKCH8n4uSftlPvwZY8lapktZ2Si
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_004721_782311_A838E880 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mamta Shukla <mamta.shukla@leica-geosystems.com>

mt25qu512a supports locking/unlocking through the SR BP bits. Enable
locking support. Tested with mtd-utils- flash_lock/flash_unlock on
MT25QU512ABB8E12.

Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4afcfc57c896..756391c906e5 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
 		.name = "mt25qu512a",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			 SPI_NOR_BP3_SR_BIT6,
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
