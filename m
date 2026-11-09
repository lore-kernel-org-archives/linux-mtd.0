Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8EB60A3833
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aV5vCPyr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fid2NMIb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yQQMOCa8Oad1e3G53s8TR5GVehy6G+Bv1FTpSSLRlTQ=; b=aV5vCPyrsxI4253HJ1LBw4Nf9X
	iqW1fljmkI5e9FbvnhIdAWkhCpeH3GfIfPM7lm0QxqM5l9/ITaOUpFF1pFvctfhD653j38RzXI5FD
	XtNygjPLoNZbXsWPbm//9PlQD55g3Hj7mi0oU93KvvHeLR89X8VXDr3CtRaAV/BXTFxtkpWsXtzOs
	ZCj99YLBwlLGwgJj4gFBN6q6j0pQRAZnAIgzxSkV+Z9KCMX+c5/n8o8CSUt21Gdd3B22nmQO64poR
	sa+TegUF9VxjNqblUsoOubxSMY76tUGIIYyRx1Yh8SAMvU5CzBdn0bzfJWQhN89wb9CAcFi/ajM62
	Gi54MsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF6-00000001ZUD-1rl9;
	Mon, 09 Nov 2026 19:41:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF3-00000001ZRu-1N4W
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so10917415e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253279; x=1794858079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXRH5duEyw3mUcCWcjPhOLWXWgyqrG4tmCM1l7tyASA=;
        b=fid2NMIbyqy8d1EhzyD6sdP8Z2zoFna+ohybGANX6tlJA4QGruixw97eic8iIoPz9q
         uPKcAuY5P2uQqKzB9CS5rS9Q8fBaYMeq0g2EI1R5V3i+4H8/YLGeplLP0jMGvd9o9OFT
         n5zUL8rFBPKsY3KgbmKuVumV+SJGsueXqW2VHd1AgeQw10S1JIC5bNMrjfi9herFQzGM
         uXYuPJBl1XgMDekF5KXfA/x8lv5N/J6Eu0nOGehs4M47zE6+DLQuCk4XJWXG8jUd5zrR
         nUv9zX2YeeIhIQBdz9+Jbc9bNjRxB5BV/AO2s8q+0ZvbhVqUeYTMpRra7qqZE25Ve1ku
         6/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253279; x=1794858079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXRH5duEyw3mUcCWcjPhOLWXWgyqrG4tmCM1l7tyASA=;
        b=iGcqoMMd2szzA002uKnSBC/m1ru3NphjnR4pBGn1d0DqJWxZnaePWD4HhmAbKeOpAA
         DncuPRwbbnWT9MTMKxP9ba4AeRbstSKzWUgdRk8PdxwT9f0OvDC7PSGSc6n/VP1ZLzHD
         mZtKJQkk8AbMA0H4qK1Y/5ZTKdUTg2qq0clTI+f8wRc5dQKby+yWKfudU4zJ+IWFiYum
         s7SprJdfJQWbPaE3aOcQ1gg7in7Zb7XfD030Ge/fa9xRiSZgDT3WVWTJt90ogNPshX6g
         XNnyDtoKXZ+8k2G2cKTELRAA90+BiBOuiZ5kgxTM0eDv5WheFpBlqsdFKYJ7tpyhe59b
         UYVg==
X-Forwarded-Encrypted: i=1; AL+hErFkhXAhl/zGPFruyxeJ48hQ/YVUuu0km9gHfCN1qGfhLRaYVXhkotn41J+vtKq7a03fNXxPu2xrC/0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/zjV1z5QlmXSkl9VMfodtX9M5s1mBu41cLaPuYuJkrpKvVWsKF
	+xzJ4Dmr0LETd2R5oQdOckc3UiGm8AH9GOg6+eFd6AqsJ35yysq11/GvcMCBGQ==
X-Gm-Gg: AYBFou3lcjjehIbgDvt97rBjy31WumEjxYUYnczARBOxG7g9x3n6lDGQ0qA+Pw+c7IV
	ZMhIW5b6NpV7KMs5UIY+3RC9RmTegzp5Bu4fqo1PMiNTnRH/Ez1pY47JPbKzlJ/rPDxBD/NCIxh
	yU0LT0z7hzEg5iIMhXm5sLUygIT8uDT4kwh0FGTt3lVZqucR8uUNI/s034KtbUk/9iMvD4gBPU5
	g9UuKF0yX+kcIiP6S52TfkVnDWhbMuFRKUmjI16rYhLX5iDMKOWjPpNeggd9b7QA85vXdbedMiC
	0XVbiBlhLU9aZDYezUmmF4skrmbUvmrByiUenb424vTBz4W0bZVcBdC2MrJQLMLN0ijDzT9EqJe
	eregk9OI/UgO6Ln4/6Iyc4xJ73X3yiXPix8KcUYjGK20LHyFChJjdTLIO6ec29m7PAflI5XB23T
	qRTvGtm1sOxt9m0JFet2O8xYnS8ZCNdlnb1vvysc/JVvEf/pLdSMWlYgQfCk8z4ic4zg9U7KE5T
	X5AJz24UmfX9HsiEpJplkhgSM8OxtLwXHf2XmH5OdWur6noH5uzoRo9t4ukKt5T/VL2Wcfw1MOd
	LUiIFzJkaQygHVLtlCEzrhZNpQjZmzGVvW2ITnDL+KPtUXA334uVPobzOzM=
X-Received: by 2002:a05:600c:350a:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0233d868mr4333885e9.10.1794253279437;
        Mon, 09 Nov 2026 11:41:19 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:19 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:05 +0100
Subject: [PATCH 4/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_cw_write() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-4-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_114121_388312_22248B29 
X-CRM114-Status: GOOD (  10.95  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index a825bdb93a8a..6774a0a5db2a 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1063,17 +1063,6 @@ static int qcom_spi_read_page(struct qcom_nand_controller *snandc,
 	return 0;
 }
 
-static void qcom_spi_config_cw_write(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_write_reg_dma(snandc, &snandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
-			   NAND_BAM_NEXT_SGL);
-}
-
 static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 				const struct spi_mem_op *op)
 {
@@ -1144,7 +1133,7 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 		qcom_write_data_dma(snandc, reg_off, oob_buf, oob_size2, 0);
 		oob_buf += oob_size2;
 
-		qcom_spi_config_cw_write(snandc);
+		qcom_nandc_config_cw_write(snandc);
 	}
 
 	ret = qcom_submit_descs(snandc);
@@ -1214,7 +1203,7 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 			}
 		}
 
-		qcom_spi_config_cw_write(snandc);
+		qcom_nandc_config_cw_write(snandc);
 
 		if (data_buf)
 			data_buf += data_size;
@@ -1271,7 +1260,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 				    oob_buf, 0, snandc->qspi->mtd->oobavail);
 	qcom_nandc_config_page_write(snandc);
 	qcom_write_data_dma(snandc, FLASH_BUF_ACC, snandc->data_buffer, data_size + oob_size, 0);
-	qcom_spi_config_cw_write(snandc);
+	qcom_nandc_config_cw_write(snandc);
 
 	ret = qcom_submit_descs(snandc);
 	if (ret) {

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
