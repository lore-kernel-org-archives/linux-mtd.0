Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A59C87FCB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7RCG+r/XtSENQId8Jw/OdNj6lRm/q7uH+9G1DXxiZGc=; b=AY8LYV51P5rV+X
	9lwuUBcO9uP9mUNAV6Vut63KlkZvjGxIaHvjHUmEoIVRFl44eKjpjtNhb8Z57QVoF34CoktDpR0+z
	zog6XTj5AhbaOhoDgSGLTNeBCJonidPs9pCh/vI2Ns8Ddjt1fybhcYvxFypGa6t4FJO5Afvdym6Ad
	vF0xxLDiHB3/THRC21Oegl87uXDOVmDuDJpbIcNcFSTgFOW4BDl6vv3AFcCM1YAgcZcIsKuYretuu
	QWCzjlrToyhgYycjGS/KlJ/ntkhgjW1YYGFUsGpjyOtdsWIvN+T2L4v4Xp5Da2GCPBYg+xx7DXXGN
	n3TSQYG3/rtf752v8xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLBZ-0000000DO8L-2AbN;
	Tue, 05 Aug 2025 17:10:49 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKAo-0000000DEKR-3RZM
	for linux-mtd@lists.infradead.org;
	Tue, 05 Aug 2025 16:06:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b792b0b829so4604412f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2025 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754409957; x=1755014757; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTznWYpI8gKk1kphD2wAHrnft5gKOpMBilNRiI/5gM8=;
        b=d++DZeAvCwiJAKAumylOG5PvcOesXbzOLgeJ6sGGJWzi92zMpdZ5K3bUrbz2WgVKDb
         RmgKrocLUTXktDodrkUYAIVXq+EVUDxpt/0xyj34Ve0H4ngj0oprGFUk0kAP6KscafHE
         /ER3ZF58dgJWm5jpuEOw5EiFFIQOkT11fw/vEF7Jb9QkQPnwPLrFXB8IEBJau9hAYPL2
         Ubeom2DmjxOhwFdYnjIEHDQ86kvWVpLTB3N88vbGBY8N53SnJsJePRy2t1aqzWo08WTy
         wXda8aWEszJe2PA3vWVPlaD1XrjwTpU9eRMvGfnYkQ4TR79rWdNElAOhwNVOAZXlHuWm
         fBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754409957; x=1755014757;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTznWYpI8gKk1kphD2wAHrnft5gKOpMBilNRiI/5gM8=;
        b=YdGnnCPc3qX5wQ4jXcpoOaUJrNnEQD8MtaspkQydNAOCln0VMbkbkltQKn/XeMGq+0
         n7nNcuAGUwAXVWb9ut4K+bw+KKr9yZkcWXnCsDMGoCdL2L6whAV1J03oc81FZnE+hSt0
         CdJ5UUQolemQxRdRZ1L1B1buaNf66JiA5wXzsqgchMcXxI0kLuEKu6h8oCpOz5R/sjcY
         qIu0gpqQpyBSqb8WSfW2Br6MAmPKcRrnWrt5gyu51fgRVXPq8bNig0vpWdsv8TUp4TJf
         mEoVLB0DMAJkguNiKNfWHPeARzdwXJNsN8VYuwKqz9h4yx4t3lmXJb+/yPhDIInYkZRJ
         BybQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcptabzyjZtkDJU139WV/jv5IHO21DL9+BXOa9vkKI0O7Y+IrqoAbN0hpIMBNB7XHF2sltcYu69Mw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOFDkEOIwUtdcgqk6rH1fs2kMtzr7EAylG2gZXnFPYpRAbzaO6
	cJVKRPmsh4I2hbpzPh+uS0XMHV2oN9+p7NoDCbycapriiU4eN51X4Bi9
X-Gm-Gg: ASbGncsrzP9OYCTmDCXK4kt19Rr25sD6bcjCg+mpf1+NgsI0P7SjC4RSt5lkNgdO3Wy
	evx2sU4D6lwJkrBfJEaZEmFurpdHYyCWTc0DoPOHhAkbsPgl33fGg7Q9/1389kmdGQ851V150sP
	/VyDPHRiD0uuSvbZ15NLwaiWt3Kwpyz58X2j1LvON6HOmFbQZxZsPtoRf1GvwdbPmgAsWY5OmF6
	aRN5mTKNxoPfZ3fwlmwkra3WjMVWgSPga8DBBo+qmLlKduD4w8sLLhYf9tEcd+Agy8zDaDS/uay
	1IjHa2EmI0zuJQ2ZLCdzbvgXo1z6zR4RctNPm50UAcnZh1FMBsNRBOQ2lF2Wd5bv1UZTW9cKl1l
	jcXIRp9jdEKKNY9AaFke5EFQX54nlDzm+ICtgJof6ydJwzoeaFpU=
X-Google-Smtp-Source: AGHT+IEuAmY2hBCqfJhKsYJ4UaGLmKzibXtdG11M9cj+JUXZxQVLIU+zZH6KGP+B1ZvtubgSN9I7wg==
X-Received: by 2002:a05:6000:2f82:b0:3b7:8dd7:55ad with SMTP id ffacd0b85a97d-3b8d94c477dmr11899577f8f.39.1754409956882;
        Tue, 05 Aug 2025 09:05:56 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c48105csm19813177f8f.64.2025.08.05.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:05:56 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 05 Aug 2025 18:05:42 +0200
Subject: [PATCH v2] spi: spi-qpic-snand: fix calculating of ECC OOB
 regions' properties
MIME-Version: 1.0
Message-Id: <20250805-qpic-snand-oob-ecc-fix-v2-1-e6f811c70d6f@gmail.com>
X-B4-Tracking: v=1; b=H4sIANYrkmgC/4WNQQ6CMBBFr0Jm7Zi2CBZW3sOwKNMCk0iLrSEaw
 t2tXMDle8l/f4PkIrsEbbFBdCsnDj6DOhVAk/GjQ7aZQQlViWsp8bkwYfLGWwyhR0eEA79R29J
 qQaRrLSCPl+iyPsL3LvPE6RXi5/hZ5c/+Ta4SJaqmN5Lqobm46jbOhh9nCjN0+75/AYPiDUy8A
 AAA
X-Change-ID: 20250731-qpic-snand-oob-ecc-fix-8d3d80cc8680
To: Mark Brown <broonie@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_090558_871563_07EC097A 
X-CRM114-Status: GOOD (  16.50  )
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

The OOB layout used by the driver has two distinct regions which contains
hardware specific ECC data, yet the qcom_spi_ooblayout_ecc() function sets
the same offset and length values for both regions which is clearly wrong.

Change the code to calculate the correct values for both regions.

For reference, the following table shows the computed offset and length
values for various OOB size/ECC strength configurations:

                              +-----------------+-----------------+
                              |before the change| after the change|
  +-------+----------+--------+--------+--------+--------+--------+
  |  OOB  |   ECC    | region | region | region | region | region |
  |  size | strength | index  | offset | length | offset | length |
  +-------+----------+--------+--------+--------+--------+--------+
  |  128  |     8    |    0   |   113  |   15   |    0   |   49   |
  |       |          |    1   |   113  |   15   |   65   |   63   |
  +-------+----------+--------+--------+--------+--------+--------+
  |  128  |     4    |    0   |   117  |   11   |    0   |   37   |
  |       |          |    1   |   117  |   11   |   53   |   75   |
  +-------+----------+--------+--------+--------+--------+--------+
  |   64  |     4    |    0   |    53  |   11   |    0   |   37   |
  |       |          |    1   |    53  |   11   |   53   |   11   |
  +-------+----------+--------+--------+--------+--------+--------+

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - use switch statement to handle section numbers
  - reject negative section numbers as out-of-range
  - Link to v1: https://lore.kernel.org/r/20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com
---
 drivers/spi/spi-qpic-snand.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 0cfa0d960fd3c245c2bbf4f5e02d0fc0b13e7696..53205d5037dc4fd58a69063532b20ab10c652694 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -210,13 +210,21 @@ static int qcom_spi_ooblayout_ecc(struct mtd_info *mtd, int section,
 	struct qcom_nand_controller *snandc = nand_to_qcom_snand(nand);
 	struct qpic_ecc *qecc = snandc->qspi->ecc;
 
-	if (section > 1)
-		return -ERANGE;
-
-	oobregion->length = qecc->ecc_bytes_hw + qecc->spare_bytes;
-	oobregion->offset = mtd->oobsize - oobregion->length;
+	switch (section) {
+	case 0:
+		oobregion->offset = 0;
+		oobregion->length = qecc->bytes * (qecc->steps - 1) +
+				    qecc->bbm_size;
+		return 0;
+	case 1:
+		oobregion->offset = qecc->bytes * (qecc->steps - 1) +
+				    qecc->bbm_size +
+				    qecc->steps * 4;
+		oobregion->length = mtd->oobsize - oobregion->offset;
+		return 0;
+	}
 
-	return 0;
+	return -ERANGE;
 }
 
 static int qcom_spi_ooblayout_free(struct mtd_info *mtd, int section,

---
base-commit: 926406a85ad895fbe6ee4577cdbc4f55245a0742
change-id: 20250731-qpic-snand-oob-ecc-fix-8d3d80cc8680

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
