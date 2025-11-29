Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB47CFD2F6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Kxfhj7tFuEpJ2E6I9GiaA/LYYaTy7CtqRsQ4Nm14E8=; b=VTHgYvnFVIS0/w
	Ia95cx8CMDBoy/xE7U8XuPYZRqxJiDtIAOMukFNDYHbF2nckRenjGBd8GNJNdqoJMtF4zE5Ab1BER
	Ajc/BzawpQNqUEuym9MqGAhcVAyOE0oSPy+vO5Z4cTiLHdvGK42V7sdRvxOaK9AGjWHlfNHAx4XnN
	pJeF8tSgoF7a91hSQH22MG82peXbCaf5gEUIEmRVT2TiZNi/oou2I4bRROvB4d0G9AUNz0ltfrV3t
	iYkdU8TZXhxIwut0TEJUSpK8QEqSJeM826X4F006QQUvDqVJ3LiCwqfawn/IEZODKH2NHpya84VTX
	27sndSdKT3BzLPYJ6YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPICv-00000001SjU-1jD5;
	Sat, 29 Nov 2025 10:29:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPICs-00000001Sim-39tr
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 10:29:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1813656f8f.2
        for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2025 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764412172; x=1765016972; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XB8ojDLPmRPjgdbiNqqeSPVDfEQQay9vSxKvQQfS0ls=;
        b=BHfTIWfKqQsKdiUntVjN8rggYkjGAvzVh64Q/Ka6o7cMwmsrmu12X+p9JNrp0NkYRD
         0bBRqIG/4tWtDaMNBIXLHD+6fTEG3EN20dqnvEpGHOe4AMfn1x2J3s7HJVBwcKp+qsWW
         oit/UCAwUjiho8N+KtxQQfjmvHIZcWOWkwjloG95Wl60v0o4GVDkteMlQz3z2+/lZmPq
         E34FRnh2QGJMlv4oReDfGU9OLjlBI1yS5t5eYeLC0o6Y8kYIcI3ZdkpVyDu5VIM5yDJ9
         6EvYWklbiAM56Wcece7cvnt/IFBicFwawbtOd9hepsImvl12S2r6iZgq18fe4f8CN+eg
         j0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764412172; x=1765016972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB8ojDLPmRPjgdbiNqqeSPVDfEQQay9vSxKvQQfS0ls=;
        b=Nd1Zt/FJ8Lp6lUbvL3u7xLW+dQeblkQMnliTrSSFlLVXOzo9BJxWtAbwbNw3raIoXD
         F5Z6sv38UolJGPoXTdJumeqe2VyRhiToZ9WYlll8Q3vrXFF3q8VTVB7GR6WAgBS9wB6c
         BMHfLYcthOtT/8blyENhbzeT1T62H4eCu7R07yLr1OyV43pcpA2oWPfs5km0kMFHxTxB
         ghZiLO2OfDRwSEM0UGWLEbPsgx/F2tScKiyQWGbJ9nr82IPXnKv/spSCYTX4DyYGwIaD
         YDsHvE7t8RPUW4bbxSFSGLECs9w5KZg4QsKyhDrK0D4gaRqm6G3kQt1w1/K+EsHemrTi
         EGiw==
X-Forwarded-Encrypted: i=1; AJvYcCUz+MI/Os3oahZ9pM2kyyf8DurKcOF2CUkqtamwgow/Gg/kEfZcxIAjjeVGexsRYuKrme7sLR9eMSU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqziPE0N/EyMxqsfVTQhDc6nQhqvrwSeSddh9wqSI7sEnwop+P
	WytjksZkmi9e1owjw4TocjwgPpErOtIW8dtahf71Gq3Bl4Vjb/R1DG0H
X-Gm-Gg: ASbGncvd8gl21EEOxK0scCKnvg4su2v13tkMp/b39AR2a3LFwS/g0ZoaI/dGZ+lPM2s
	0cRbO20d+GDYV4DmsY4YOqOg7y+TbkwTULrFva61zeWcXxCE8y37lJqrPKOED0YV/2psjQITzdl
	BA8dPvjS/G/iFsVMLKn2qWdNgy7aHIdwZfg6Xr2ss26j7sYWmnG3faacGb+oEPGhubGBHqVOCcX
	/RDdZ0zdKxjYBUfyoVW6Ulj+CUXCQNujcznOISvBXRPV8SOnkvA7uLRL/mREHwT9AuPOHb4fxWH
	h2KqoibkRzIl7BJ9NzeV6bLEyWjAnDwnguh1chKlyz/LeILuzMmMRHYn/g6KnnOQoqMDFpr3DEQ
	Q0aUx7EGUN7ZvouOhXVVviCmPMKK1/9xWJAUro0gUsPTDmr2HKpm96M7eUWnxd3cJcfgYEWFTl7
	31y8J8HkOSrfL4FtNFKN9mJDfstnmrnegxvN1v9mKv5SRPl5gyIOE=
X-Google-Smtp-Source: AGHT+IFF8NfCPDZoCDRvd2e/3m3f9IuNEk2//VmqY35vg4vwN/ox68TOxm1dPHp0YHoIW6ze/wYpJw==
X-Received: by 2002:a05:6000:4026:b0:42b:2c54:d9ba with SMTP id ffacd0b85a97d-42cc1cbd449mr38035756f8f.20.1764412172508;
        Sat, 29 Nov 2025 02:29:32 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30b8sm14740128f8f.7.2025.11.29.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 02:29:32 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 29 Nov 2025 11:29:27 +0100
Subject: [PATCH] spi: spi-qpic-snand: remove superfluous
 qcom_spi_set_read_loc() calls
MIME-Version: 1.0
Message-Id: <20251129-qpic-snand-superfluous-readloc-v1-1-b84ca17095d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAbLKmkC/x3NwQrCMAyA4VcZORtYy6biq4iHkGYaGG1NqAhj7
 76y43f5/w1cTMXhMWxg8lPXkjvCZQD+UH4LauqGOMY5hHjHb1VGz5QTeqtiy9pKczShtBZGvnG
 cZoojTVfokWqy6P8cPF/7fgAo3rvCcAAAAA==
X-Change-ID: 20251128-qpic-snand-superfluous-readloc-c7c245a20a46
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_022934_814474_16A06B17 
X-CRM114-Status: GOOD (  12.56  )
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

Before configuring the registers related to page read, both the
qcom_spi_read_page_ecc() and the qcom_spi_read_page_oob() functions
are calling qcom_spi_set_read_loc() to set the read location for the
first codeword.

However the qcom_spi_set_read_loc() function puts the passed value
into the register write cache only, from where those gets written
to the corresponding register later via DMA.

Yet, the qcom_spi_set_read_loc() is also gets called within the
internal loops, and during the first iteration the read location
register values written by the initial call gets overwritten in
the register cache.

This means that the values written by the first calls are never
getting used in practice, so remove the calls as those are
superfluous.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7681a91d67d563fd21fcbd69d223b6e846e97787..0334ba738bef2811e3458d20ce69bd3a213cb20b 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -850,8 +850,6 @@ static int qcom_spi_read_page_ecc(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
-
 	qcom_clear_bam_transaction(snandc);
 
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
@@ -941,8 +939,6 @@ static int qcom_spi_read_page_oob(struct qcom_nand_controller *snandc,
 	snandc->regs->ecc_bch_cfg = cpu_to_le32(ecc_bch_cfg);
 	snandc->regs->exec = cpu_to_le32(1);
 
-	qcom_spi_set_read_loc(snandc, 0, 0, 0, ecc_cfg->cw_data, 1);
-
 	qcom_write_reg_dma(snandc, &snandc->regs->addr0, NAND_ADDR0, 2, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
 	qcom_write_reg_dma(snandc, &snandc->regs->erased_cw_detect_cfg_clr,

---
base-commit: cb5c2eb459f4c98d584eaf3d3ea7c3612385d081
change-id: 20251128-qpic-snand-superfluous-readloc-c7c245a20a46

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
