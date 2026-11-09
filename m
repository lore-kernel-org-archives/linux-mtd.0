Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076360A3830
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiSP1aSC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pS+jG+Pf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W4uGSdwZU2aUp9dVxpp74q0k6HPgMtEdtub9eceI1w8=; b=fiSP1aSCanvm2TiDUemg3ABrvs
	u+RpamIAEVgrBFcNHOF3M3HyBm/OmwM8vjGWPyROeEc9C+lCKAlpAGu8qfmGg6MSBjAzWMxrFFxCB
	vhlH1sKcrRSqJd7kaIKuYnnulpDk8z7Pe9yIbyyUSeTzAZtUGUfX3aPFDaKsv1i2MRJWiol4qYUGx
	0Pw3PXOP+zsEAose+O8hWhafhBvyDx4fQCmz0Xb2SiYWxHViRjXXcd7dgllKVaLjEzogwpKNUCj22
	HK/FJKmixQb47g9Wl19NWuk1rp+BZH1SPf5h8KVB+pxPfu1I0yP2JA28osoFTr8/rzXRXHLlF9NPp
	5+mcnTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF6-00000001ZU4-1Nfc;
	Mon, 09 Nov 2026 19:41:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF1-00000001ZQt-3rNh
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491971ac844so1242507f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253278; x=1794858078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRO3Gw4B7BUYegkURbfJRBwxO65C99A7i3r/+iHeW/k=;
        b=pS+jG+PfWsTCv0qx3Rgl7qSNceViVXe4W/QCkvSnJBpbtCpSOnn5FURPrlQ1t36y3P
         a4hxQRZsxbG5EQYAx+HgA55ruBCa0f9hKqlMYTxUBVrIXMICo5ZkZ7zsMPPdb806w27s
         SIXnQIEn5SvS0cO5ZxLHiizKk1EdWw0/tBjBx0/C8A5DE8shsBlMlY0W41HA+lHMltwF
         79+ojieT5KRDETmq+cXILb8jf3Hpa9Cbav7IGVX+GwT3NA5ZdMSkAJJKrNMmXx24xOoL
         Kxk+GC8Ydmv/E5t/Fw+/h1i0WanyxajgLNMg5VtaVCeFpEkn8FNTANz0VpG9U2bt7Zpz
         JP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253278; x=1794858078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRO3Gw4B7BUYegkURbfJRBwxO65C99A7i3r/+iHeW/k=;
        b=ZIkK+piZRkIAXs1mxiDkFUPYJ+jpEIlJhrnNfXeQko4hin6KDGyqTdDluiz4TkWsU2
         N9+aMIvnMhEg8YtCaj20Xwtyz6QjEEvd4ENr9jSwBolBaGrG2fHBylvBCWQAzfFms3LM
         7JOPXwrHsnXLLBoI11VQ7NZp9AB9pibAqvEHAwDFBty3qyiUUa+kxSI2ZGYdmKHMu8O8
         3KdW6O+dtbLa04TsHE7+5JM9Z2Lt3aVFUqE6v62FKSzc/8hHscNAZPTGIZoUX6RVrPjZ
         /vFBGvc6tAmtvWiP6TYwnlBLjOHYzK2ef5/o7ru7pE8QLvXyrUAZRrdS4WPryF4m0kpk
         y15Q==
X-Forwarded-Encrypted: i=1; AL+hErFO3viqircd/YB/E1os1JfwcFUyq0NtGqx1qi/Wsq9Z12O5moDmnXU8V7JCnBZtW3A2Qt3V9+yvh8Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z8u2wsiSWNqtLGIbdvqOAvxrVfK/4w/gImQu9zGA2G8LYbtiliK
	hq8D6D58ecDXXi1y3NbxE7ZIUAG2cSOr5P/gc6xhwTF4sZzv6R1bgwlA
X-Gm-Gg: AYBFou3YvzREzehHJksH2c/FgFAhHMFsYmyfed+Jxheyd4u1dJSNEBDjTSvQDsxNEIT
	peSvUAVV7HG7mn1Z1GVE4T/0QJGzF+UhpPhRrQ6lQPIbJS5VCbNTo6RgY4wqRVnDk1pZ2xAP6AZ
	6Ehq4l7YyuyqYmk2HJafOkZRV+iCQLg0ycBMaJvCUTi9DmSbJroHdV/MqO8bQtX0l7Az0tR645D
	ywCyYttnH+NTyZ4cmM99RwOMt7JAH8Mc1khL+4AztzHZBM7+aXXGy/xDPcFH4kBXhz0tkDzF9DB
	0ravDHR/DhbJuVIt/Ttil279ZdbMCD4Jhnzr1rJWkdaSfbXYisxPkdLKhmQ5Fnz23n7QAMDPgky
	aE1xs65aza3dgV64q12uUR9FXBLe69Mc86Lg03rvjpP5paU8TlmNyZ060xnwsJZ5ARU5Ji9rty4
	g87uCORBlbiklbEq/WA/rHf0anwcSiavpwIyoKHD4+l+/qtb4nj4SDapNEo1fB02grS6rUCURU5
	lUoKlpUprrOKt/Kullw+UgEZ+fWXV6vd+MNdWdA79NWhBHiBJZXpy0zvVMYiehTKCWG0y4Ip3+L
	UY5F6zNNLYoGELH8PYXuRop37BeelXpToyrOUShl5eEDgjrNCjnqDfwCUg==
X-Received: by 2002:adf:e00b:0:10b0:490:9fe2:6a37 with SMTP id ffacd0b85a97d-4982ecf6412mr609375f8f.17.1794253278240;
        Mon, 09 Nov 2026 11:41:18 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:17 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:04 +0100
Subject: [PATCH 3/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_write() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-3-1e8601e2db84@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_114119_984027_319A373F 
X-CRM114-Status: GOOD (  13.85  )
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

Note: in comparison to the local version, the generic function runs
additional code when the 'nandc->props->qpic_version2' flag is not
set, but that does not affect the behaviour of the current driver,
because the respective flag is set since commit 52efc89ccf66 ("spi:
spi-qpic-snand: set 'qpic_version2' flag").

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index cf75c142303f..a825bdb93a8a 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1063,12 +1063,6 @@ static int qcom_spi_read_page(struct qcom_nand_controller *snandc,
 	return 0;
 }
 
-static void qcom_spi_config_page_write(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-}
-
 static void qcom_spi_config_cw_write(struct qcom_nand_controller *snandc)
 {
 	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1113,7 +1107,7 @@ static int qcom_spi_program_raw(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size1, data_size2, oob_size1, oob_size2;
@@ -1194,7 +1188,7 @@ static int qcom_spi_program_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -1275,7 +1269,7 @@ static int qcom_spi_program_oob(struct qcom_nand_controller *snandc,
 	/* override new oob content to last codeword */
 	mtd_ooblayout_get_databytes(snandc->qspi->mtd, snandc->data_buffer + data_size,
 				    oob_buf, 0, snandc->qspi->mtd->oobavail);
-	qcom_spi_config_page_write(snandc);
+	qcom_nandc_config_page_write(snandc);
 	qcom_write_data_dma(snandc, FLASH_BUF_ACC, snandc->data_buffer, data_size + oob_size, 0);
 	qcom_spi_config_cw_write(snandc);
 

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
