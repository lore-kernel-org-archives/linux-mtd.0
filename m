Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36460A3834
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jAtuVQoY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qjgBLXL6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PmLNwEQ8D7xk3Q+6R9JSX4Xk1UsT4HCXjSR1fYxJc8w=; b=jAtuVQoY4DYOpZDJ0QpoLNdxJl
	N1X+Go7w0PZVR5bDxPl9MIW7pRIZyfbVWdUOHdFBTtXFzNAD/9HOgVr8yPR+X0qGOA17y8j7ov7/A
	wGzLtSoFhW0n/FTQ8TxVFFtdW56c+0InS+2ScvZhZcI0asZ9ARlEpnvhkODdrLe47oZou6nUodW2O
	oLxevgtksVoSQ+k4wX95fLNkaBoSbKOIEyap5eclvSpoJ8GE4Q1DBvIb6gfff8TKFOvFhIZLm5W8s
	CviZNdU4uWeb/QSzduedsPcqgpU23tL8y2jEC1NJFlp0s8drQc4L9v7jUEQKTlK2SQGjR0a5Uwum4
	4AzYI6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVFA-00000001ZWY-1bfh;
	Mon, 09 Nov 2026 19:41:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVF7-00000001ZTc-0tdI
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 19:41:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so15506955e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 11:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253283; x=1794858083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPj6/SqRUU4G27b4S8AB+m7SzAAWnuPJHVAUoCo488I=;
        b=qjgBLXL6NUCab3K4rJna7e61P/OFk8rocUU90ArUGYBFofwCf/nEcl/a94EuI+exUB
         lG7940QCPcm8IAtkq2xI0t8obNMxWNkZ9IPej6YEcdB5+Msmc9RRNBngObMvwCQjYfG9
         2JtVRnpgVbY3hOHAIWUak2fyOwsrpQFieRYB5FlXkgdxBe1YHMOa9ca9lBDcwGABfgsA
         9qn8QPYC1wBa8nNYqFczArARYnX3ctJngIxqWjHv8GS+FrOEAUChdwRbDdFu8bSip5n/
         Q4Z8lKyztIpgNVq1vnW2Q8G+QjO2IiQAzkRvPIimoGn+rj/COQa9mUXThVOKO9fh7W/X
         W1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253283; x=1794858083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPj6/SqRUU4G27b4S8AB+m7SzAAWnuPJHVAUoCo488I=;
        b=l8aaScKvCMfRgVO5d+oCj0NRKxYARtjmwWXANFj1OSOpGdxyn/WCXlctt0sZkM3IQg
         GBpA3mpkhqbYOkW41MHJVNKPlkgN9F51bO7EN0Y6GwnqMmF+lrGR+q1ZiFizzsbRnrUT
         bPWHJEDL8TCHIJ5A0UUDn7VO6xKSSr8PSAnG7jn8lczO4S7+KOaJyOkG/0Cf/qgbHGwy
         vHsIPOLe8Aay7yxgnqaOgnhe8MNVAKTHmTS+OIoLC0uDl62hVe4h3rOxz5fUMaHPtHeu
         rlT1V+VIpUWr2DkdUacLbs6IEvlKtef2ai6uFLryxMCQuSvme6BkN7Ftqk9QhvI/+pvZ
         vh7g==
X-Forwarded-Encrypted: i=1; AL+hErFECi9IK7Lnh1o0ccin+uSA4DC0p9t+KZ23Jdt8VBnbS15q02XhWsQEmqFakqX9M2tV1nNj0dPSgKs=@lists.infradead.org
X-Gm-Message-State: APuU4Z/b1ZEoyUcU1t3nJFOkbQV/x6wUXjslCf8qjJqVCQkhm/5HPJhv
	qA1Amp7ctodJh1njwfx2HNDsw0JJpzM3CMoTSnqYF8meukTMnfSTucaD
X-Gm-Gg: AYBFou0mDJjOpE1xaAgWywGPbuEH0e6894SMsx/ygn06jAJ8VdteChAH7Is/qiure4i
	2gESydXSHe7S2U/0JbFnQYIIntlY9+qRB4wyLiHY0IFi6ied3opw3Kno2wOwoRRLGKwGWIgCGsg
	VPfNoDrO67ColHiUyIP9rfei/ptJN86Vo9X9nt1lKG4Q/Ytaxp5GWHFBHMm8dDee/9HVUcnY45U
	sKZ9D3cPa/MTvB/KbLUJ63n44JWFLCf9mSXxcUJHVFpiPPkdnriYzkwCoYAT2dTL9IjEyKY3I1K
	kodBbxKycBIAHLJvyY58vf8E8Hl0TfawXDhri2S8JBcW8lbqY7ufVgNhvp8eXvldBofpwe3T3t1
	UyIxQ3bAGB/EUujC6fjjW0fbfAHAjZAfTTHRKglXnKfBzbkdqslfV/jsflFCCQG8S8xFPZ1wQBn
	NmICj8Vu+fDgiRw4EGPe5uxjNFaYcej+v5eZv3ZJWI2WXhYutK1h62aTRIGAlamy9va1isYV+ri
	1mQvvZA4QdBCHSnimxaUB0nFiQUqbT3dORIB0lBwg0Uc103izOUOfrDAL9M6VS+H1r6LKA5Bdfe
	7IffAAJROpQ1SifZAx5UkplfYPM10xIVbCIuWQtXbqaeldtJTOZkd0HhHtN5BS5O6DBoOhvz44n
	p5lM=
X-Received: by 2002:a05:600c:354a:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ba022ca866mr5590405e9.0.1794253283177;
        Mon, 09 Nov 2026 11:41:23 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:22 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:08 +0100
Subject: [PATCH 7/7] spi: spi-qpic-snand: use the common
 'qcom_nandc_read_stats' structure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-qpic-snand-use-common-functions-v1-7-1e8601e2db84@gmail.com>
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
X-CRM114-CacheID: sfid-20261109_114125_279291_CC1A9C49 
X-CRM114-Status: GOOD (  13.21  )
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

The 'qcom_nandc_read_stats' structure defined in the 'nand-qpic-common.h'
header and the locally defined 'snandc_read_status' structure are
identical type wise and both are serving the same purpose.

Drop the local structure and use the global one instead to reduce
duplication.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 4105a04afcdb..6c5878f3f8b6 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -64,12 +64,6 @@
 #define BAD_BLOCK_MARKER_SIZE		0x2
 #define OOB_BUF_SIZE			128
 
-struct snandc_read_status {
-	__le32 snandc_flash;
-	__le32 snandc_buffer;
-	__le32 snandc_erased_cw;
-};
-
 /*
  * ECC state struct
  * @corrected:		ECC corrected
@@ -610,7 +604,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 
 static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 {
-	struct snandc_read_status *buf;
+	struct qcom_nandc_read_stats *buf;
 	struct qpic_ecc *ecc_cfg = snandc->qspi->ecc;
 	int i, num_cw = snandc->qspi->num_cw;
 	bool flash_op_err = false, erased;
@@ -621,14 +615,14 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 	snandc->qspi->ecc_stats.corrected = 0;
 
 	qcom_nandc_dev_to_mem(snandc, true);
-	buf = (struct snandc_read_status *)snandc->reg_read_buf;
+	buf = (struct qcom_nandc_read_stats *)snandc->reg_read_buf;
 
 	for (i = 0; i < num_cw; i++, buf++) {
 		u32 flash, buffer, erased_cw;
 
-		flash = le32_to_cpu(buf->snandc_flash);
-		buffer = le32_to_cpu(buf->snandc_buffer);
-		erased_cw = le32_to_cpu(buf->snandc_erased_cw);
+		flash = le32_to_cpu(buf->flash);
+		buffer = le32_to_cpu(buf->buffer);
+		erased_cw = le32_to_cpu(buf->erased_cw);
 
 		if ((flash & FS_OP_ERR) && (buffer & BS_UNCORRECTABLE_BIT)) {
 			if (ecc_cfg->bch_enabled)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
