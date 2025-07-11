Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33E9C83F1A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jul 2025 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jLbbRcNVA6Rx6bw3lywDlPtj8XG+wERQWTVD/VEcz5g=; b=37mgB4MC9iUz4q
	B4Ab+dtVOWm5dS4V+7WXsBoN9W34EsehL4F+KzmIpKCldXZNBtrvKoWghse7Si79On6wvgwDl879a
	EBmVlxMTd4hlYkxE5vD2NCGSCM+59oHlXwy9lFxS7UC/tTG3BQh46wRk7n51zKEODft7pJLWdr8Ql
	ZJ2xfbdc1cbQerrdXT2vLCi7rwdP+3Cu5zn2brJPhJdWHpF0D7RGMO5NXDEZeOjqMAEKXAyGheOT9
	G4NRL/UzER/bS9/RkIVMBcE6PxPW4ZAQp3Np25QIAKTZK7qWOL6XCDzhDUpo/kWfRJ2abtKSOFz0j
	h7N177ggHNNReFJ8TkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHHR-0000000FMyY-2Lme;
	Fri, 11 Jul 2025 17:11:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGgV-0000000FIYR-34d2
	for linux-mtd@lists.infradead.org;
	Fri, 11 Jul 2025 16:33:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a582e09144so1538723f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2025 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752251594; x=1752856394; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1r7lOXR2bkUYaFtDJ7CylYLTgBc/fYyMcmc/+yJZ30=;
        b=bVGdN1oTTIDJn6F/zkXU+nN76ofByLqCHdfWcHMVJSXCaLo3rwxpBU7PSWdXpgBrbv
         fRCLrXjo237ccMGcyWXDYciw1ZhWllJ+OEZWDaBDnQLwe5MH4qNpJmow9TL0CPv/rQoR
         SZ9oGt75zaeB/LjKhq1PWF232YAN62WUdOR88cg+zvSp9UB6DwetZCIWP47KoSQd+iaG
         /ffUnJCB6hVF9YE40lm0F41PFw3lDZ8x14kqqDWPE3PVr1boC/F+GMXDxEireKoCegRC
         pUPGIrwv+FO/nq1UprCyv/defim4ASpBSUe22F+aSROhTKSscyVUYUN1hVsW/jBbpWYQ
         LrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752251594; x=1752856394;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1r7lOXR2bkUYaFtDJ7CylYLTgBc/fYyMcmc/+yJZ30=;
        b=QrudWMRG0YKdcNI6HClgz5AYxQqR9EAb131eCViKCRIxav2n7E/q9/3Zil1lNuNTwL
         d74aVkscSa88Hs+xUgm4KC+9DDKBx++hnWOjZLKCPerhQMIoQHhnkkm1sc4AgXeh832h
         7+kSs8s901fmC6EdW9AQwktraH8S/vvBy4tTzhf4B1jUVsr7aRVPO9ShzC5zf++pyUbx
         Z02X3CwxSD4STeR9yYDYxFCt4SEUUGJxgwWvBQ80zGqigPRtOxNYFzpW+bn2Wuu9VIhJ
         dDHuQYUjyjilnWU6xuG8bTPklvqKe4aGOGl3XW9yIFrPNe5zGoKzo9jjKKknb9S6lxs+
         j1DA==
X-Forwarded-Encrypted: i=1; AJvYcCVRZ20KyE/cg6kNlLuYn2zFY0mn066Y9xGHnou1FsCSMNO9NU44ZEgiABKo9p6V9ifZd1Rse+CqAm0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIgWfbuV7+Z8id45R0EY8mIFxyBwuhMrA4ksU1sgl7l+RJ/MEG
	ECdqwqIjmp0pujkVcdzp6SyKr6fAINMFxkA0m0+3kqrVss+z5mP/lu6CcAk6tw==
X-Gm-Gg: ASbGncvlAGJkSFxokb9A9IQxH1j2Es2QKIKKLh5eUNKwN3K9eZlQLDRMfE5K1uHGIiS
	BpR4Vz+oPKE+LvpFCPoB3/I8CfWvmKlfxsrO3gq2XrSANZ5GNEyy89OjCC/FfJXNU/vn0qmEvDV
	51XBBaVYS8CdzanPETYbZosQq065cpsvB3kq4KMa+HLkgO1PqFOV/9Gop9bD/iezEeD6Vut27QQ
	3mOr5GwxHjOAtPtZyFqRjzG037OI3j/KE+YZO4RiNvbnUo58VG2zbE0PAMw7qj5GpEa4pcu706x
	Pwh1U82vp5lXYlWZY/jzTjnextF5NjqIwIx2/ngczO36fYtGWrTmAK5PNvVjXSdT7Ntx+/GemsD
	vHgF+tAR/e58N19JuNyKwtegb6PtNBkENys67MY35C/hYU0GzQNE=
X-Google-Smtp-Source: AGHT+IEZlhPktMwwW0Jbf3RqoTX/NKhZqR5TJTdFaddNSu4Crn0tbA5n062K8UspEDbchBqtVVg+fw==
X-Received: by 2002:a05:6000:40ca:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3b5f2db14eamr3033408f8f.2.1752251593613;
        Fri, 11 Jul 2025 09:33:13 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d4b5sm4969860f8f.53.2025.07.11.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 09:33:13 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 11 Jul 2025 18:32:52 +0200
Subject: [PATCH] spi: spi-qpic-snand: simplify bad block marker duplication
MIME-Version: 1.0
Message-Id: <20250711-qpic-snand-simplify-bbm-copy-v1-1-dd2608325f72@gmail.com>
X-B4-Tracking: v=1; b=H4sIALM8cWgC/x3MwQqDMAwA0F+RnBeIAXHsV4YHjVEDa60NDEX67
 ys7vsu7wTWbOryaG7J+zW2PFe2jAdnGuCraXA1M3FHfEh7JBD2OcUa3kD62XDhNAWVPFz5ZhJS
 IWXqoRcq62Pnv30MpP0IL7B1uAAAA
X-Change-ID: 20250710-qpic-snand-simplify-bbm-copy-82cc0e0022c7
To: Mark Brown <broonie@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_093315_776563_EB3DC65C 
X-CRM114-Status: GOOD (  13.25  )
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

Due to the expectations of the SPINAND code, the driver duplicates
the bad block markers during raw OOB reads.

It has been implemented by using two if statements, and due to the
opposite conditions one of conditional codepaths always runs. Since
the effect of both codepaths is the same, remove the if statements
and use a single line solution instead.

Also add a note about why the duplication is required.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index b711c8be42c1f76029497b0c17d00cd8e52f5aa2..94c4d76cee34420d1dc3894aadad0086c6f22d96 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -597,10 +597,16 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 
 	bbpos = mtd->writesize - ecc_cfg->cw_size * (num_cw - 1);
 
-	if (snandc->data_buffer[bbpos] == 0xff)
-		snandc->data_buffer[bbpos + 1] = 0xff;
-	if (snandc->data_buffer[bbpos] != 0xff)
-		snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
+	/*
+	 * TODO: The SPINAND code expects two bad block marker bytes
+	 * at the beginning of the OOB area, but the OOB layout used by
+	 * the driver has only one. Duplicate that for now in order to
+	 * avoid certain blocks to be marked as bad.
+	 *
+	 * This can be removed once single-byte bad block marker support
+	 * gets implemented in the SPINAND code.
+	 */
+	snandc->data_buffer[bbpos + 1] = snandc->data_buffer[bbpos];
 
 	memcpy(op->data.buf.in, snandc->data_buffer + bbpos, op->data.nbytes);
 

---
base-commit: 7d61715c58a39edc5f74fc7366487726fc223530
change-id: 20250710-qpic-snand-simplify-bbm-copy-82cc0e0022c7

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
