Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDC1C54E71
	for <linux-mtd@archiver.kernel.org>; Tue, 20 May 2025 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxwrBjYzY4YSCTzviNgoHE0Q9jhZm/xQ6DdvuVH49so=; b=l8wuevRdqmmGl0
	fB3/dTZaYVbti2TXTpizezemQ46WNkCCq/6jjTWE+ju3NBi36TTKerWVvSMkLvaZkFUtoKEAHL/oz
	54w+eQoe8Ta87EObIcoRsQ7BfwiF+vwQY/9wsxwO/UPLh5ryhZv+liuBS8+nzX3EK/KVsOQSvbwm2
	iiBNK9jHrUrQiANpJWJkNGWAn8ZbM5SIJ6hSZsdUPfLKDVdxY89FPUoKbN4XuMFo28fepnNnqombL
	Jew2z0jH2Mb6cuG/EbUiWfRwNFaZPi76gfL9Jbpt5AYiyXAHWd0D0jb2/SOl3cwm/JFX63eAjt8px
	ZYjpAKBufE+HV7Wofxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSTC-0000000DuQ5-3Nir;
	Tue, 20 May 2025 19:17:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKn-0000000DtVR-0dgL
	for linux-mtd@lists.infradead.org;
	Tue, 20 May 2025 19:09:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a375888197so1288274f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 May 2025 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768143; x=1748372943; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e2K6MoWsuqULzUu6YkUYRAAATfxs31Smc/0Z0m7qtI8=;
        b=YeSP+/+wUM+Vs1tl+ZaKVe0ZdgwkjF2BT7auOFGAi0QDYBCqKhriZXbEM5q04XSCjX
         cpR279uRQPzWoOnQvkugNuExxYJZXDU9P1slLbBCes8rf9FIXEdSFK3oeHxSpmee+xkz
         n86gvJokUJ0HmNX8Beeq5e0iRXS5uPNOsBET2NUpyZgR7qvglFosjtuS4bRNKiJFLm69
         QqdVhmfn3MsqYDIwH/nGCQDQevXGIdxbdYPJ1B0cJI/EnvJRMkLd+7TpkHFGnF80j9l1
         5IzMMVGed5F2aZn5JnFXfHT1pP6nQKhgwCuH/QQ4P8RXiqMpSGom4SNPzIbaUHLwhTAs
         NlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768143; x=1748372943;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2K6MoWsuqULzUu6YkUYRAAATfxs31Smc/0Z0m7qtI8=;
        b=b9MhWS2Kxsf8HKvSbYeIiaxyuvGJLJpZ1CofvitPsPOhBeNxWDV+JKM7btDB71lKS5
         euUHAP4Exd4uoxK4K0Wc5ZP/FK6AES1wKBA6/P4WVuDwmAVvPIjdgK5LoRoSVW3zirgH
         Uh1PCH2e74S2fGPqg2EZC3E++GwDOZfddn7tYlBKjGLEJOkDBhHbj1uDgVqz6RSWpA85
         pSz+cUZq8lKRrwsSLfyAgZkQLQWCqPnQ/9uao9AX7DXq3Loy/4Vyp0mn+ekHQ/n7/PO8
         SqR8n00u5ZBapbbdVRrnXZFRraOfxaW9oaeVj7g0T1EnbNmxKciUIUTKy5RfqiyKot2l
         7s4w==
X-Forwarded-Encrypted: i=1; AJvYcCUf4qNuOOTd7jP5Kau6NE9uOdus1MG3O7+Pp6hCOTOqAkXnfmDvTM+MCBdrDIS8HasZ9eajNe986hs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKXLusMX8/Gbc4MUv759HZjH4FiRFsbM3qfnquwhKU1j9rN5hL
	1ZL2xV2+4LlRXTTCdqgEBrAZnXgJqLZsQoGODhPG3TMYs5i+v1ejG8GL
X-Gm-Gg: ASbGnctg3Rq4y3QOP++0O7HcXnzEWeTSSe/kjrTxr7NlZIxZcRg1JWhTNIpeJj1+fXS
	EpkKbv1GTh0RaJUnyUcN8wTAhu5vwU6x9LIEHg06Ff26SrCqlXwAV0IggtG+5Zayh+IhgIk+kTx
	6XYJaDzxD51F1u6ctfZbcIv5r8N9kXRC56Hv8gFDcdLTrnZbL1DhH8bptpis2/5+URFvn2bSZqr
	WetgZg9x0sUg+UDZf6NFTd4+KX2/vlzF8TG3QEO+mkGjq3JLCgc+5N/+GdVX0hWc6fU6wa559Nb
	On5FdGBTrgU+j4PjwF4HDm9gBh6Z3q/LpQZtR8hXr/OpfwKje0JKThttTuiFHLdeGJtDPi4ZUW9
	x1VMt
X-Google-Smtp-Source: AGHT+IH3V6A6ySleXz4Mm/IFzFSTFv6ap6SC5pohNVPeEh9z8mi2hHYoVR4dCF/KVQ7Uv17+2clYrg==
X-Received: by 2002:a05:6000:1449:b0:3a3:7638:d754 with SMTP id ffacd0b85a97d-3a37638d82bmr5517381f8f.21.1747768142935;
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm44130955e9.7.2025.05.20.12.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:02 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 20 May 2025 21:08:56 +0200
Subject: [PATCH next] spi: spi-qpic-snand: remove superfluous parameters of
 qcom_spi_check_error()
MIME-Version: 1.0
Message-Id: <20250520-qpic-snand-superfluous-params-v1-1-86dd4963e90f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEfTLGgC/x3MywrCQAwF0F8pWRvo9OHrV8RFaG81oOk4caRQ+
 u8dXJ7NWcmRFE7XaqWEn7rOVhAOFQ1PsQdYx2Jq6qav+9DyJ+rAbmIje45I0yvP2TlKkrczzp3
 giBancKFyxIRJl/9/I8Pypfu27W52QoF1AAAA
X-Change-ID: 20250513-qpic-snand-superfluous-params-e84ae6e3e719
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120905_197437_A13CD5CE 
X-CRM114-Status: GOOD (  17.62  )
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

The qcom_spi_check_error() function determines the errors of a previous
page read operation solely by using the cached register values in the
register read buffer. The data pointed by the 'data_buf' and the 'oob_buf'
parameters are not used for that at all.

Remove the superfluous parameters of the function along with the related
local variables to simplify the code. Also, remove the variables from the
caller functions which became unused due to the change.

Note:
Althought the similar parse_read_errors() function in the 'qcom_nand'
driver has the same parameters, but that function passes down the
pointers to check_for_erased_page() at the end of the function.

It is not clear, that a similar call is missing here, or the superfluous
parameters are simply leftovers of the development process. Nevertheless,
if additional code is needed, the parameters can be added back later.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7207bbb57802ce53dfab4d9689113e7f9ba8f131..b5960df106ffa2eea10890901828b6a730750588 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -587,7 +587,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	return ret;
 }
 
-static int qcom_spi_check_error(struct qcom_nand_controller *snandc, u8 *data_buf, u8 *oob_buf)
+static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 {
 	struct snandc_read_status *buf;
 	struct qpic_ecc *ecc_cfg = snandc->qspi->ecc;
@@ -604,15 +604,6 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc, u8 *data_bu
 
 	for (i = 0; i < num_cw; i++, buf++) {
 		u32 flash, buffer, erased_cw;
-		int data_len, oob_len;
-
-		if (i == (num_cw - 1)) {
-			data_len = NANDC_STEP_SIZE - ((num_cw - 1) << 2);
-			oob_len = num_cw << 2;
-		} else {
-			data_len = ecc_cfg->cw_data;
-			oob_len = 0;
-		}
 
 		flash = le32_to_cpu(buf->snandc_flash);
 		buffer = le32_to_cpu(buf->snandc_buffer);
@@ -636,11 +627,6 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc, u8 *data_bu
 			snandc->qspi->ecc_stats.corrected += stat;
 			max_bitflips = max(max_bitflips, stat);
 		}
-
-		if (data_buf)
-			data_buf += data_len;
-		if (oob_buf)
-			oob_buf += oob_len + ecc_cfg->bytes;
 	}
 
 	if (flash_op_err)
@@ -794,15 +780,12 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 				  const struct spi_mem_op *op)
 {
 	struct qpic_ecc *ecc_cfg = snandc->qspi->ecc;
-	u8 *data_buf = NULL, *data_buf_start, *oob_buf = NULL, *oob_buf_start;
+	u8 *data_buf = NULL, *oob_buf = NULL;
 	int ret, i;
 	u32 cfg0, cfg1, ecc_bch_cfg, num_cw = snandc->qspi->num_cw;
 
 	data_buf = op->data.buf.in;
-	data_buf_start = data_buf;
-
 	oob_buf = snandc->qspi->oob_buf;
-	oob_buf_start = oob_buf;
 
 	snandc->buf_count = 0;
 	snandc->buf_start = 0;
@@ -883,21 +866,18 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 		return ret;
 	}
 
-	return qcom_spi_check_error(snandc, data_buf_start, oob_buf_start);
+	return qcom_spi_check_error(snandc);
 }
 
 static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 				  const struct spi_mem_op *op)
 {
 	struct qpic_ecc *ecc_cfg = snandc->qspi->ecc;
-	u8 *data_buf = NULL, *data_buf_start, *oob_buf = NULL, *oob_buf_start;
+	u8 *oob_buf = NULL;
 	int ret, i;
 	u32 cfg0, cfg1, ecc_bch_cfg, num_cw = snandc->qspi->num_cw;
 
 	oob_buf = op->data.buf.in;
-	oob_buf_start = oob_buf;
-
-	data_buf_start = data_buf;
 
 	snandc->buf_count = 0;
 	snandc->buf_start = 0;
@@ -965,7 +945,7 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 		return ret;
 	}
 
-	return qcom_spi_check_error(snandc, data_buf_start, oob_buf_start);
+	return qcom_spi_check_error(snandc);
 }
 
 static int qcom_spi_read_page(struct qcom_nand_controller *snandc,

---
base-commit: 5b31d2d81a4bcdd9915e7b152fb3cdc3dc7f4ecb
change-id: 20250513-qpic-snand-superfluous-params-e84ae6e3e719

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
