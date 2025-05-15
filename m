Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4B0C3ABDD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukBO/xwh441hekYLZGwe8SnFSABt3lTvP9PTcSF+2hs=; b=ZeLXKAXJMbNltH
	79qxEDWAy578CcHXchXFo6lpMC2L3gXVnnwRn9bqbMVngxim8is65QkagMHLj7Q1EiXm5jJHRWh8b
	EES+ZkC0FPGbzJ496h2H9AP+5+efQ5b+1440aU65kxEV884RpPMLAsqPKxFHZrmR7bKrlYku4Vu4b
	YmdBW/AADd8X8/OXNn/gi39St6asalhQt9qaN5TxloTpNMnoM4ccwO7K3AvlfIsFMxnPlBRhDsW+w
	gWCpXVdZGkkTGqMgdhWxyOpzxaxFhl2j5XEzytao+0lD9+RDAfp01zh0J9A2Nm3aqg8JKnb+Ou4UJ
	2CmQVBylMBNFkb8rlz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdx6-00000001e3f-3gOK;
	Thu, 15 May 2025 19:09:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdmm-00000001che-47mO
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 18:58:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so1077171f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 May 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335507; x=1747940307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vN4zS8Ov4vOND0MqD7gEwYhjgQ4bApUSGr8+gPK0fio=;
        b=nhs0lCi+Osf7axVWZaKlSWtYoCJKFBjNtS90W1k2zZ2alZUaS3HDc358Hgo/1UvtJz
         TKXYaNVyenI5DxeEJCOCYPWPRY/U+0iboS7j/18N0SaxWbzojf7px7/cZZYlnOw36E0B
         +XXv58bYRDQYrPDC3QgIHLBTeizRP4gEdsrfy/nW5kDp9VNG779oA4r3IGclfgkPZeBt
         QZOAV/4yWR+Uag6sxx9gXSciRDuA2bYC9kSggZFBxwGgAgI7SySPy1A1DxWvuYjLn6YW
         qyBt6XxdPa4BOQ5IQ6ZBxbfbyW37qwPGYC3nFSvU6zr3pWcvxdk+sxMtIqXPFwgnf+vq
         OoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335507; x=1747940307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN4zS8Ov4vOND0MqD7gEwYhjgQ4bApUSGr8+gPK0fio=;
        b=fvVvx4H7incfv8ABnbnq7pyleTsYxvFur98nJQjacwTyJnjVFcSyZwpvMwxObEy5D/
         GZWrNahIqmuVaXr3+NIk7cxSlVopp788YkWJR+g3rryEor05MB/+b8H1X8Epb0b8x1Y8
         w6U9IGMXUnlO03mQH7XIhy46WRZC2BFo5QN2ZVSQIhIDjigE/h3Tvt1+EPmXzJ0//QGH
         0d4qWC57WqsGrlCYSRhv1AdG3YsC36MCIrNFY8dSY+Jd/LN5/e6yF/SIikm/KS3TlTs5
         StntM6YvGHKDawD/bHvwij7Pi/C9PqLjgZZS5X6+ubMjPQeZ/JS+weLZdPAWbbRdnxal
         tTaA==
X-Forwarded-Encrypted: i=1; AJvYcCWLSZ05WLBdepu6Qac2MkpVa7MdZ9lWNFjHNOk/h5LR1+P5klwhnBYhRxNQF+4wfrg6vPA1bqDOYPc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBuhA/6HDlIzUJuPn4MQvUihLRJrDzXGNtEvXbnqsLDA5T++Bh
	sYD5Re3yJChBRZqfIxRvDNwjKkPBj343+eKTNx9N6UxmBHNQwRdevSKp
X-Gm-Gg: ASbGnctdK/wfDxKFJhBVtWcCKIQtE6AB+XbEZdKb+s0fcv4j+vY1U525CGxEUBbqNpg
	+YtfgZ0jKMbulx97UwrV1AMrFA1UKrduCGH7IDbC2nsG750p4Mc84cURruVMQ4W0HsYQHWOWJiq
	Cf3XeSceArGpFdDtEkK506zOE3UzgtdRo3c6wbxY8j1YGVBe7HaymxEwR+GYxazU69F+u+1GLB7
	q519lYu2hsEUcpMhe9KYmreuRIC0xbe7qfOtHpvnWvoKEWr9Op1wovdG0ofuQjFjESQoEX77OVY
	zT9iogsfym38GbjQpvx0f5X2CjpwhDx+BdVFwS1hAyGe925wxFr+Soph8N/LDOd60jJ/+fKY/PA
	35f6W
X-Google-Smtp-Source: AGHT+IF59ZHvQRzBDwGpTzr3onUTfd7fsdZeTn+qh3y2jNptGBAMnHdW0F4KfYB9nYA7aauukxGcGQ==
X-Received: by 2002:a05:6000:3107:b0:3a1:fd60:887 with SMTP id ffacd0b85a97d-3a35c84a6b1mr835097f8f.45.1747335507298;
        Thu, 15 May 2025 11:58:27 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a857sm335778f8f.32.2025.05.15.11.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:58:26 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 15 May 2025 20:58:05 +0200
Subject: [PATCH 1/2] spi: spi-qpic-snand: use CW_PER_PAGE_MASK bitmask
MIME-Version: 1.0
Message-Id: <20250515-qpic-snand-use-bitmasks-v1-1-11729aeae73b@gmail.com>
References: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
In-Reply-To: <20250515-qpic-snand-use-bitmasks-v1-0-11729aeae73b@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_115829_025150_D848C8C0 
X-CRM114-Status: GOOD (  11.66  )
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

Change the code to use the already defined CW_PER_PAGE_MASK
bitmask along with the FIELD_PREP() macro instead of using
magic values.

This makes the code more readable. It also syncs the affected
codes with their counterparts in the 'qcom_nandc' driver, so it
makes it easier to spot the differences between the two
implementations.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7207bbb57802ce53dfab4d9689113e7f9ba8f131..bc45b834fadc5456eda1fe778e5ca8b16177465e 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -483,7 +483,8 @@ static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
 	snandc->regs->cmd = snandc->qspi->cmd;
 	snandc->regs->addr0 = snandc->qspi->addr1;
 	snandc->regs->addr1 = snandc->qspi->addr2;
-	snandc->regs->cfg0 = cpu_to_le32(ecc_cfg->cfg0_raw & ~(7 << CW_PER_PAGE));
+	snandc->regs->cfg0 = cpu_to_le32((ecc_cfg->cfg0_raw & ~CW_PER_PAGE_MASK) |
+					 FIELD_PREP(CW_PER_PAGE_MASK, 0));
 	snandc->regs->cfg1 = cpu_to_le32(ecc_cfg->cfg1_raw);
 	snandc->regs->exec = cpu_to_le32(1);
 
@@ -544,8 +545,8 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	snandc->regs->addr0 = (snandc->qspi->addr1 | cpu_to_le32(col));
 	snandc->regs->addr1 = snandc->qspi->addr2;
 
-	cfg0 = (ecc_cfg->cfg0_raw & ~(7U << CW_PER_PAGE)) |
-		0 << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0_raw & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, 0);
 	cfg1 = ecc_cfg->cfg1_raw;
 	ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
 
@@ -687,8 +688,8 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	qcom_clear_bam_transaction(snandc);
 	raw_cw = num_cw - 1;
 
-	cfg0 = (ecc_cfg->cfg0_raw & ~(7U << CW_PER_PAGE)) |
-				0 << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0_raw & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, 0);
 	cfg1 = ecc_cfg->cfg1_raw;
 	ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
 
@@ -808,8 +809,8 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->buf_start = 0;
 	qcom_clear_read_regs(snandc);
 
-	cfg0 = (ecc_cfg->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
 
@@ -904,8 +905,8 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	qcom_clear_read_regs(snandc);
 	qcom_clear_bam_transaction(snandc);
 
-	cfg0 = (ecc_cfg->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
 
@@ -1015,8 +1016,8 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 	int num_cw = snandc->qspi->num_cw;
 	u32 cfg0, cfg1, ecc_bch_cfg;
 
-	cfg0 = (ecc_cfg->cfg0_raw & ~(7U << CW_PER_PAGE)) |
-			(num_cw - 1) << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0_raw & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1_raw;
 	ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
 
@@ -1098,8 +1099,8 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 	int num_cw = snandc->qspi->num_cw;
 	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
 
-	cfg0 = (ecc_cfg->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
 	ecc_buf_cfg = ecc_cfg->ecc_buf_cfg;
@@ -1175,8 +1176,8 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	int num_cw = snandc->qspi->num_cw;
 	u32 cfg0, cfg1, ecc_bch_cfg, ecc_buf_cfg;
 
-	cfg0 = (ecc_cfg->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE;
+	cfg0 = (ecc_cfg->cfg0 & ~CW_PER_PAGE_MASK) |
+	       FIELD_PREP(CW_PER_PAGE_MASK, num_cw - 1);
 	cfg1 = ecc_cfg->cfg1;
 	ecc_bch_cfg = ecc_cfg->ecc_bch_cfg;
 	ecc_buf_cfg = ecc_cfg->ecc_buf_cfg;

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
