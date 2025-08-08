Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E1C87FCB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0vMeZYzz3Zu5TbzZ/T7NTqre/e0IcApsb6aiGhKMdlg=; b=kvdnF8wfNEfDvy
	DP8JCZjyStIDKX5EVc6pV/Ls63GtaNcakg3XGt+wKfLqu0DohVbTRM29o5NluG9Fx6OGhUhdTtBO8
	MivBP/QGx970IJ/wE/tSuO2DoHH8ntfFLhqtSEaTIIk+ePGbULdOew1h0YzG6+3zCxYLn9nNlVsGl
	vLcP4Ovajt7zTaR5B0N8d2v2ACqJDVGReo+I8Cv7wTQzAlhA5Tzqs9ntntLPu1ppQPlnxA4eY1uZl
	TJuxMN/i9y9e1deJ9QwQnzZf2ehSUY+0E5uLQilD+VdfLgX8PWfBbUkC7EYn0On5pxJ0XM4lppR3P
	/MxXOYdxLG760z9g+Blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQgP-00000003Nyn-2BCC;
	Fri, 08 Aug 2025 17:15:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQgN-00000003NyP-3cM6
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 17:15:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b7910123a0so2087713f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754673306; x=1755278106; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPbiefG2OWimN6RVlxfEZ9aDoY/LizcSfvAZkPKTOf4=;
        b=YDObqPXV/HvVnPN2ttTXWwOHb89pT+PfODQGI+kfpmf4zLTms6Jsl+NzaWt3lMtYWd
         ENPlRf23o+H7YvHrmTpY96T/hEQnqzwGsd/UM3SdZvaKA95VrebBepJnyDN9KRuGgPK2
         VgFe2wTpJCBJxDEDzdBRPI5wYcWcJm+GTVj1VXhC6u2Wa1kUFF0HKYZQcXFGJBBB83no
         AwSomjWHA1DCb23gjgWQP6vgYlsPOeCs8G+2g7AQLig40PME5G8PxZF4pgD1xKlSbc/v
         s2M5YZ9WBzvglFhvMFydsXxn4jeFN0J8QdUa8O+xza6/EpP8Pg8qDHXDobdNq6a01hdq
         Y1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754673306; x=1755278106;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPbiefG2OWimN6RVlxfEZ9aDoY/LizcSfvAZkPKTOf4=;
        b=euMArxZnZj0NNWjskJ5FpPnHCYIzdn2xPgmLxai6FbHMWx2cd+5QMnPXFaLRY0M8dj
         fFDBPy0tPV8v959beMh/56ve2msdVB7Wy4lLx1C0pdW/65rz8clDwjbqqsmBtAcCWhxM
         pC9E0Y4mCM5WXnXLF/gK6xnidH8C3xK6xH+blPpT+OC0pccj2wz0D5g5HTF9jklhJ6mt
         uXuzdcjBeHPyqm24odfT0xilOtV3FkrurKKfwZ84g5Yg7Kgj1ZxwuR4MjIChEfH2HE7n
         rTcf4ZOleFpBhLnNi7KPD11PAwK+6vrDgPbcD389yn87nEjWDL85bi0rcCt+odOeUgXm
         7epg==
X-Forwarded-Encrypted: i=1; AJvYcCUE4o3hULL8Xkyw+Ne22kNwlfrgrMtLXtpl2wncdOZ5ub10bdzDC1yjDWgcXdZ4dR1or7EpjtCwi8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzre4mC1wb7O7nAUOan2vgQH5QjS828hmfsUWREXJoxmi6Qv2hU
	xnl7jfdsYZcsV8+cafGcG6MgidKzEYZw7gMwLxvxd50k7ADp3jvfeR/I
X-Gm-Gg: ASbGncuCHJzLErzFyPLlmwCPcetR22/2CXEUGpe9XqAVfpXh47MnDaNrOFNlFG83YCs
	hxhysWVKwgHinpg1tiTaDaVlsrOk/AtVyP88g6gGX233bBK5lO3NG+wsAphacJ49Pft8mNecWP3
	DzWwo+iBXDrsv2O5yzsO4TnOjqWo4S6meSerQGJtkMBnb2LBnGjywyh/ByhWLM70oTWe2uCt4Hj
	gwgASq0ag41MLWBc0xHDYTH6t4vf5ESNeKXP2XMPCkLXoRN45Uk76JZrKY4wCWWx11X6A0TjXOf
	7XTsoPNJf/Z8t1ZJKQVDEVfXeFlJ+ERcXQQfbID66mf3ElOzNscSbYAGV4DjeO/ir+MgEofX/2R
	oxDgbxuMFKX1+xQrAdTDXM1My3nNhpooA6QGWl3vBkS+OWaup+yD5pSexjB2VXw==
X-Google-Smtp-Source: AGHT+IHr2LVmYrP8y88MwtQsopBm0qhYmXUyUQcFF43HBCPAiZE/3OaipPy+JWDrsbyZXlsy6D9/WQ==
X-Received: by 2002:a05:6000:2406:b0:3b7:95fa:ac4 with SMTP id ffacd0b85a97d-3b900b7aed8mr3106389f8f.32.1754673306175;
        Fri, 08 Aug 2025 10:15:06 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b8fc6ef28esm6308907f8f.60.2025.08.08.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:15:05 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 08 Aug 2025 19:15:01 +0200
Subject: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
MIME-Version: 1.0
Message-Id: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJQwlmgC/x2MUQqDMBAFryL77UKaElt7FRHR7Gu7UFKbRSmId
 zf4OQwzGxmywuhRbZSxquk3FbjUFcX3mF5glcLknQ/u7gL/Zo1saUzCxcsHvBgGxMiC1rfXWyP
 BTVT6OeOp//Pd9ft+AMSK76hrAAAA
X-Change-ID: 20250805-qpic-snand-handle-use_ecc-de929376d50b
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_101507_912080_4BB4EBEA 
X-CRM114-Status: GOOD (  11.11  )
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

During raw read, neither the status of the ECC correction nor the erased
state of the codeword gets checked by the qcom_spi_read_cw_raw() function,
so in case of raw access reading the corresponding registers via DMA is
superfluous.

Extend the qcom_spi_config_cw_read() function to evaluate the existing
(but actually unused) 'use_ecc' parameter, and configure reading only
the flash status register when ECC is not used.

With the change, the code gets in line with the corresponding part of
the config_nand_cw_read() function in the qcom_nandc driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7b76d2c82a5287df13ee6fcebc4abbe58ca861ee..119003c4784890458a41c67fa8bc17d721030b0d 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -494,9 +494,14 @@ qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int c
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 
-	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
-	qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
-			  NAND_BAM_NEXT_SGL);
+	if (use_ecc) {
+		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
+		qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
+				  NAND_BAM_NEXT_SGL);
+	} else {
+		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1,
+				  NAND_BAM_NEXT_SGL);
+	}
 }
 
 static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)

---
base-commit: 13d0fe84a214658254a7412b2b46ec1507dc51f0
change-id: 20250805-qpic-snand-handle-use_ecc-de929376d50b

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
