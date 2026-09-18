Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C826FC982DD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ipUP51gOQobxhLZpi7YG9Ram9uoVJPu2QV5jtxK1gQ=; b=HUyiHLUNvMYXOQ
	o3ao5flsZxpHD+ZQRrk0woC9XgsrsnA0+ecDb+h42Owh+c6FNlwRv11y2FHholHOW2ujGX6+A9OYw
	qM+oM2s3xnHwa2ivm6DOcQQpSYJ2SrSCIe1uHdFV85fdyIMqqB2EcTh5niz7yeybBJ0UjIJDOADRJ
	YMGdMoN1CRcaAXt6TcagefkNZsVYuo361ieK4ks2E/wLnXTexH7px6GdyoQmSYRS2QxhWLOhKav2A
	uyhZnLk1gF6sLaN32n7GDt+qcybgWw3MFZZt2lCDLrb00PSPEeFEP84m+lf3XggKCR21SUTiXktnC
	jfSdf0CB3Mq9CBUQclPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ee7-0000000FSGB-01WH;
	Fri, 18 Sep 2026 19:53:19 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ee5-0000000FSFa-1PQv
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 19:53:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874fso401542f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2026 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789761195; x=1790365995; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Djb0xkVRmjxoEZ1HgTSwJ708yN2LZl+WunF0a6oqDtU=;
        b=rGaemcpnUm0rJ28vqQrVUWmcbzR+TmlXZFuIMKRWQ+uBnN3wvYWkATVxDWWERGSDT/
         XsDM0AempxQ640tGExSJ+wlRP1H4gJZoqPlqRD4Yhe0npoHcF6DDBOAlukpNZoI154gI
         LgA9FkEBrYWnS4QnG+s9AwDXO9vr1ud01TwWoVGZaEial+nU14Sn4NvYd0UcUhlBAzuJ
         vHVeknhVg9VhN0EWoG25yBbh3F/XLXk1Yg2xJTqdWiQE4783C80U/tDF5e85GocMugGB
         k67JnoPStW2s1p5J/gMw+zCv+/Lq0Y5gbU8+wPIFPulpS4frxZtDBWty53ZSIQrCQCFi
         R7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789761195; x=1790365995;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Djb0xkVRmjxoEZ1HgTSwJ708yN2LZl+WunF0a6oqDtU=;
        b=Qz2qtiu9bJfMKdaw0t+jMud+wrKZd00zMYdt8YjHJ/bfjG753hro2uplCTG7du1vq0
         qf7ImFxfvFhSWhZmL7EFLQ0jJjTCT2JBX56DcB0go9fJef0XIvOXiAknOVWfGK4v7iQp
         qGfuTDt4T6bBmu+PVhnh0JtGvhbWagladts86ykfC4F7j+h4e4GKvd8f5/thAKhHIT0q
         klSlxN4jzjwHg9DhQ3VKS4I7XRZ8BFvF8+8Bb3x58NPC77Mfq/800fGUfArtPomWAc3g
         4W87l5KJm+1e/Zh4AJdx5NYfHFDhpeE+Ub/ORPrTqpg8TSXvw61QxrjF0lqBVV0BY02H
         lkow==
X-Forwarded-Encrypted: i=1; AKwUvBx1NKf4uW0gcwvk4u2Fmwl0+DRK66n3UUvS0iJDFDcoQjjetOdosapG1Z/BOSGKTCVgx/ux2K5t7Yk=@lists.infradead.org
X-Gm-Message-State: AFuF++naLZrzOOJF2t0JXfkijWTaTG2Kms0mOos/kPJlScwMzcGBSml5
	/hUNc2ygQT91KF4P7yISHb3UuAdB+j87WkdHTT5TDWClJwI7qT5c6DKj
X-Gm-Gg: AYBFou0GjeyPbBOUO/b7jjB74YUFyRMd8k6bMknZbu8JiWG39zFAFcJ++UMfT08X9EY
	sZmkuAhl8yGQ1HKxgLcLms4KJxd7g0DanZNw+oPekfIuL4GpEjRX06Yp6ZMUBm+9ybljrBI4fHp
	9HpYm4xncFMf1XHGaAnAzNkcRg2qqKFoYvut+m5oaBiPAPxiGEaGh8O5ql2lctvZzWxS3R7GipO
	NU6mff1VjbNVeCfxCZ1NTDxDnGpw2r89KDVlRcgPg1wf0Nti1M5HyLpOzk09oH6oE/4nrBeFHeB
	noszULCLWIblHIsMTrUCZacuCbnCRIo2r6q1hg0HV4Lg6EV1AwcTY5bs2gr8mhnsukQYtCglShC
	xE5NBZnwwT2n3ICto0bvdOby4QErmnNEa4s5THlPviNU+5+9OCbczcv5eM8YxeyaifurD8efTMl
	DgGpC8HMrzyuNiZSnJR+QwzUiX2TMp+3YvQ/4vq70ov97Sxo3KtlwzwnPuOkHpLaDX4wKRmJtJQ
	sFVy+Yh2vPVkcMVy+nCGaLmsPOzzeOrP7WT1A==
X-Received: by 2002:a05:6000:420b:b0:484:3147:49c9 with SMTP id ffacd0b85a97d-4871d98cfe0mr5479150f8f.2.1789761194562;
        Fri, 18 Sep 2026 12:53:14 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-487244608a3sm1010447f8f.8.2026.09.18.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:53:14 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 18 Sep 2026 21:53:08 +0200
Subject: [PATCH] spi: spi-qpic-snand: add qcom_spi_config_page_read()
 helper
MIME-Version: 1.0
Message-Id: <20260918-qpic-snand-config_page_read-v1-1-a686c4657857@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3NQQrCMBCF4auUWTuQFDXUq4iUOJnG2UzTSRWh9
 O4Gdfm9xf82qGzCFS7dBsYvqTJrgz90QI+omVFSM/SuP7vBB1yKEFaNmpBmnSSPJWYejWNCdwq
 UjsF5Gu7QCsV4kve3fr39bLw828n6H/f9A0Nr4g2CAAAA
X-Change-ID: 20260917-qpic-snand-config_page_read-057cd4701c9b
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-spi@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_125317_403902_A5A52C73 
X-CRM114-Status: GOOD (  11.22  )
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

Move the register write sequence needed for configuring a page read
into a separate function to reduce code duplication.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 45 +++++++++++++++-----------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 9e626ffbe63a..aaa40753d274 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -501,6 +501,17 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 						   read_size, is_last_read_loc);
 }
 
+static void qcom_spi_config_page_read(struct qcom_nand_controller *snandc)
+{
+	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
+			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
+			   NAND_ERASED_CW_DETECT_CFG, 1,
+			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+}
+
 static void
 qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int cw)
 {
@@ -564,13 +575,7 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 	__le32 *reg = &snandc->regs->read_location0;
 	int num_cw = snandc->qspi->num_cw;
 
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	if (cw == (num_cw - 1)) {
 		reg = &snandc->regs->read_location_last0;
@@ -763,14 +768,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, raw_cw, 0, 0, ecc_cfg->cw_size, 1);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	data_size1 = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 	oob_size1 = ecc_cfg->bbm_size;
@@ -875,14 +873,7 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_clear_bam_transaction(snandc);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -963,13 +954,7 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+	qcom_spi_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;

---
base-commit: ca01ebd9e2ed0ea7ed4a068bcd666b0f394581ac
change-id: 20260917-qpic-snand-config_page_read-057cd4701c9b

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
