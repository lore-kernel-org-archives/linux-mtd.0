Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605B60A3831
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sEKXA5IH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQC5mdTZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TddFaihGYp0qrd8C+kwX2mVdXbe0Qg/CddR0x+VICvA=; b=sEKXA5IHNEmwlz8aXXrVzGZxlq
	uJg7uZKnAFbaM2zKNkHW9TKCWG09egq3YN9iknXdjguWsq2e0jJNVdEf1v4iqDtiKKJkqBucY1rFN
	4hehOnruTz7eIeAzSpp/e2JEt6EZ+TAZ21cg8fJwNd9ptsf+wvrsRG0bKfoHSd0Arr2jKA5eNE1i4
	jXMO4+RWmdPRSeS0vLzkckNjeUcBMDbZH2COL5VsMCrj9pD1X2Syn6widiqIHXvHExli+bh1u/2SO
	cZ+t1ELOqa53IOfrPlyNeD8I4Zdj9fSgZadxgLUBjDxDrJZPqt17/f02KGWsRiUerHgrxm2QRpIwb
	7QyZhJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF6-00000001ZTv-0sX1;
	Mon, 09 Nov 2026 19:41:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF1-00000001ZQr-3fMB
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so13824415e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253277; x=1794858077; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjB/gteyhKa5P+vqzk8KHckJQMIF77fWcQQmU9RJfl8=;
        b=nQC5mdTZuNW2lKLPWck/gq/70KnvNFSA9HaeccDs89GqVNIGquL20y1+Y2AEq9xKZV
         z1TOOSoUqiLpVv6QRxzURsMfAr7EzDyWQwxdjbk5/k6oH/tzLjH9Uw47lUmXPdFM+cia
         0tv/lgDwCObXvqHVSQn5ECUvZi5AytqRQSZHuItJjuVTBNgSt3UYfvrja54lFpf/yfQZ
         qTWdiVtaJlyuf7ZSkR9WmlIAReXgIAlW1P2hUWgZNiW69fYfJZtSe8XuY2iALeutLRQ7
         bYBMWzJllUH71VzOKfDpBuFHA7ZMGYVN046TjO1VQnH2sgjYJVgYAwADZOpOM/qnMEQM
         kQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253277; x=1794858077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjB/gteyhKa5P+vqzk8KHckJQMIF77fWcQQmU9RJfl8=;
        b=kAKFK7NOcapzrdujEQuIa8bHzb2XtET58mdxG645J1wZ8ifVrRYv4vdaWlPgFcEBFm
         UBqFH+GuFcB1KSQ8BRXXXOxQHm+IBMgXVZdw4SSGxZjrynujkMyl9d9zpoGS+Ij8S/h4
         zA2Z8GLEY0uWh6GVoMqI9R6n4C5rWFKnQ3FtTrjwCXCQp7JoFulB1zRT1kD/vEj/G2Bx
         TPLtcGp8Tc/o9GWlpNb17Uoii5T3+QOsFA9zcEjdq2Z/PZKRoZr4why29DXOjUcdUXYx
         i3lSekOQfY0MaJ63lXwF42oBPGT0O4ULMt118couNNjRhgIexgdSp+weEPjNpvvTISfh
         ISAw==
X-Forwarded-Encrypted: i=1; AL+hErHNTVBER4JMGaLjFxkHevB2QMLhj//Om8dhzSC4X7LzMXklyCDE6GoFWeI1hYehNK6jOZQBlYJB+Uk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9j5i3vtzwR8fWFgbMyISuGxRLI539Wop9J0ytDUCsIl20CRTRq
	gR++WTtVdH4oc/m4x/Yg+ZSVnMfTOrClTHLfU8812aBEQ4PvZGgfBPo2
X-Gm-Gg: AYBFou213hMwKu/aliZBZlpfbDimU0hxru7mUcwcoUHiBFNtjJNSueFKKlsE++huStn
	HJtZEdcZlWnYetcJiIXlk8DyQMGU+Hznj0dQIBAjAEOlGxkg8/goqhPqYAcXOzEAN7pZoEkPsFy
	Y/F3nNz4mH3wjzTNrD0OO6Ou6L8C6sDwpj+8rSO8jg4IPgXKZVE6FZcLYLUn4eSAXafoX2AfAcJ
	VA5La4Z4byK6A9jM8NGK1317+DKB6fE5VYy4rUolog0JN8wDLN1Z3NiZBpH8zkuFdhIVMHHjZoS
	UHN/dpurfo91a2PGjpy+1RsJoZU0tZn6cNy6fYF3Re7RSp7yj692F+JkfzmdhHgN8kwPv/IwLsB
	OvE+KvrrUEmXKUbQyAHEdv+8fm7kVkmKfhui0cH4sQdubAIRAUndo8kVarMxfZdlbBKoVeZMEQb
	/HUI4AB9MWvri2KAdCba1y8QRQAoZh/R+fPdEvl8kd+fcghJOlGrvjUphIiyY+sZmABz63iiTJO
	noLyq3pfO0Mqej6H1/zKdWqKH/R88ByDoPchlBknOZ9rNtkL1ZJ8LcPVa3McH1TEi8QfmJxMBhA
	U76ngwVaKNyV6H+OQ4ijsunraA41TdkQwB2o8cGz9DsWEZ2QAW2k/LSenQ==
X-Received: by 2002:a05:600c:4752:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ba0235ba4amr3951945e9.33.1794253277139;
        Mon, 09 Nov 2026 11:41:17 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:16 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:03 +0100
Subject: [PATCH 2/7] spi: spi-qpic-snand: use the common
 qcom_nandc_config_page_read() function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-2-1e8601e2db84@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_114119_933666_77D160F9 
X-CRM114-Status: GOOD (  13.58  )
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
 drivers/spi/spi-qpic-snand.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 981e16221b59..cf75c142303f 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -518,17 +518,6 @@ static void qcom_spi_set_read_loc(struct qcom_nand_controller *snandc, int cw, i
 						   read_size, is_last_read_loc);
 }
 
-static void qcom_spi_config_page_read(struct qcom_nand_controller *snandc)
-{
-	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1,
-			   NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
-}
-
 static void
 qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int cw)
 {
@@ -588,7 +577,7 @@ static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
 static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *snandc,
 						bool use_ecc, int cw)
 {
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 	qcom_spi_config_cw_read(snandc, use_ecc, cw);
 }
 
@@ -758,7 +747,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_spi_set_read_loc(snandc, raw_cw, 0, 0, ecc_cfg->cw_size, 1);
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	data_size1 = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 	oob_size1 = ecc_cfg->bbm_size;
@@ -863,7 +852,7 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->exec = cpu_to_le32(1);
 
 	qcom_clear_bam_transaction(snandc);
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;
@@ -944,7 +933,7 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_config_page_read(snandc);
+	qcom_nandc_config_page_read(snandc);
 
 	for (i = 0; i < num_cw; i++) {
 		int data_size, oob_size;

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
