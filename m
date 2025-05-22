Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DAAC54E65
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=snYfhOzqFnn0x09Z4D7Z5fk0WlKEcQY8QMJUklsDE6k=; b=hOSA/lXDW/7q/3
	EmnPxeTZY75En9ArxfUvHIUe0AaLlIWuyM/smdC7Q+2itBWx0Is9eFW9E3wHqezlpbJYPhrHJ2kGB
	0SNhCSU79VsqxY2+ZSwwGBrOXnO+TcUWMUh0iGnGTxe1Ck+No4+i0R71g4nYzJnyK/kW//g6dmk7r
	F/+2j/DM7DtysXjfi7pD2F7WHItc9DS8T+lngBP4ew5uI4GuB8Up0YREW9Nx0GRBKbOJWoSM4N29M
	VtQi7mnm+UMpWpY1NRalxBk/fMG1GIYChG4uFt1LvXR8vdRSWv+dbsNzld7R03aEui3EAqARKkDr5
	03yAVThm/2sGTmevSDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9nY-00000001kOQ-0ehR;
	Thu, 22 May 2025 17:33:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9nV-00000001kO2-2x5K
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 17:33:39 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad5533c468cso871800766b.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747935216; x=1748540016; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTeoN2ZNwpBqEf481xeP9DNeHeY17srYObiFUpBv5hM=;
        b=Yjz5XPMxRCCt+VoAkPpaFrOdSpI40Ilr97CsH8BCmZs4jeX+Hv3+SrIGHXT1Q40Ibh
         HjlHCjzNALc1Bu5Oj/QqcV6lvNdDQUbu7fLGTniHC22opKelNmS0hm0N3Ykguxg3zfGa
         3nRoanUnVxOJVtb3iSZ+fNlKTPYZhR2GXr/5KBaH8KhEFzfoPUnO5c3JlTbqetGbW3X2
         cxM27PZdFT5YPj8Vagq1rZWIMZCGIYoaSD9PqLkk/5LfCfWWl+mykuRb+PXRHXLaOj4Z
         H7YBEdwPHlWFXKr3z3Nv6hybp6EO0/Aa+DFUdy1XJBEpOxUmTs2IQYyH30OobViRM1Hr
         nqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935216; x=1748540016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTeoN2ZNwpBqEf481xeP9DNeHeY17srYObiFUpBv5hM=;
        b=u05VyTUqFLs6Y8vwBsJ3Fvm9KkwUyQsywkt0Paa5EBoaIoNHnSbEp54J4axT6cwqgh
         lXDd+SfYepwHgEPtTe07z26whVzX2/oRecJWdIv0pRETAfXYdVs2gANI1CKWgh7Nhi8s
         WGUqOgzCYt0hdI0Y2+XBseqrBUnfdfFiRdHmL0RHOUM7ZY+KAqPy3k4fdX7C7iGTV6sP
         q9/Vu/91kxDoDxtPE2006r6EyQvh4v8nHsz9c5fxAA9KJk9ci/F1KGiviX+2JstCJxAe
         WKplHvkff+ZLi7flrAyebdUhSzHmJhEIVVVpsMoyxtOHLELobDsCuStYbIk6AWgm0pSd
         IYeA==
X-Forwarded-Encrypted: i=1; AJvYcCW+QyEDWAwUd8IQpZKryhx6fqEfxTIC7cZVnFvOJtpRKJl5qwFEV9yddGa+TpCh+jl3v7xvBnFE+/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQwcumFVbIRlfIFGOX7K2GeazIn60/xvRagHvtvHWnilc7vLfN
	mQ99p7nRd21qIO9MSFyUrr1cQ+Lk03t5nw9hBRy0M245aCcBT2jT2t8l
X-Gm-Gg: ASbGncvPVBPlvWf0HYSGT8qY4ednwNswSSFleGOUT8QD3ahHYQ1GZJZxhAvVi7b6auG
	XS4ZHDTQLzFQJs4nlsTrgiJuTB0J5531hwx5upzDDkMDBV0jJFu2U/LofJSydUDh4YiNjEzaORz
	73v68L/adxxDIxl4b0UAyOmdE0QcQUkvqkrShivflq5DRFpks7RbXPow8kCpC1oqknRINREiLNK
	GcZLvowdDkT1pF5N0F8/uP+sdmdZ2wRJqBbObYj4GmLxdl0ygWORboxlu28mveevZhBa3yYsVGT
	9KSihUa9/+OjZ3WFyr/ERfhrTV/jXrB5BtRbIRx3w5qVgh+8H+yQxRzr43Z3Ht+XatlVAaqjJEp
	41mZz
X-Google-Smtp-Source: AGHT+IEJfDL3Z6GwGYXoUDscFxORY7Y5IAtF5LadMRdJVetuBsgTokkfHqjuWjdkON4+K8+lf3vDlg==
X-Received: by 2002:a17:907:3fa7:b0:ad5:a12d:6665 with SMTP id a640c23a62f3a-ad5a12d6948mr956070166b.33.1747935215255;
        Thu, 22 May 2025 10:33:35 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d06b532sm1098506966b.43.2025.05.22.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:33:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 22 May 2025 19:33:26 +0200
Subject: [PATCH RFC] spi: spi-qpic-snand: overestimate corrected bitflips
MIME-Version: 1.0
Message-Id: <20250522-qpic-snand-overestimate-bitflips-v1-1-35c65c05068e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOVfL2gC/x3NQQrCMBBA0auUWTvQiW2RbgUP4FZcxGRSB2qaZ
 kIRSu9ucPk2/++gnIUVxmaHzJuoLLGCTg24t40To/hqMK3p294QrkkcarTR47JxZi3ysYXxJSX
 MkhSHjsj40JE7X6BmUuYg3//iAffbFZ7H8QO4AwpVdwAAAA==
X-Change-ID: 20250521-qpic-snand-overestimate-bitflips-64112df41c38
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_103337_749117_5383697F 
X-CRM114-Status: GOOD (  12.85  )
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

The QPIC hardware is not capable of reporting the exact number of the
corrected bitflips, it only reports the number of the corrected bytes.
However the current code treats that as corrected bitflips which is
quite inaccurate in most cases. For example, even if the hardware reports
only one byte as corrected, that byte may have contained multiple bit
errors from one up to the maximum number of correctable bits.

Change the code to report the maximum of the possibly corrected bits,
thus allowing upper layers to do certain actions before the data gets
lost due to uncorrectable errors.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
The patch tries to address Miquel's concerns [1] about the corrected bit
error reporting capabilities of the QPIC hardware.

[1] https://lore.kernel.org/all/87h61e8kow.fsf@bootlin.com

nanbiterrs test result after the change:

  # insmod mtd_test; insmod mtd_nandbiterrs dev=4
  [   40.685251]
  [   40.685278] ==================================================
  [   40.685803] mtd_nandbiterrs: MTD device: 4
  [   40.691566] mtd_nandbiterrs: MTD device size 7602176, eraseblock=131072, page=2048, oob=128
  [   40.695528] mtd_nandbiterrs: Device uses 1 subpages of 2048 bytes
  [   40.703789] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
  [   40.713655] mtd_nandbiterrs: incremental biterrors test
  [   40.716118] mtd_nandbiterrs: write_page
  [   40.722126] mtd_nandbiterrs: rewrite page
  [   40.725878] mtd_nandbiterrs: read_page
  [   41.103196] mtd_nandbiterrs: verify_page
  [   41.106915] mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
  [   41.111001] mtd_nandbiterrs: Inserted biterror @ 1/7
  [   41.118007] mtd_nandbiterrs: rewrite page
  [   41.123850] mtd_nandbiterrs: read_page
  [   41.127458] qcom_snand 79b0000.spi: the number of corrected bits may be inaccurate
  [   41.130538] mtd_nandbiterrs: Read reported 4 corrected bit errors
  [   41.138060] mtd_nandbiterrs: verify_page
  [   41.144265] mtd_nandbiterrs: Successfully corrected 1 bit errors per subpage
  [   41.148217] mtd_nandbiterrs: Inserted biterror @ 3/7
  [   41.155260] mtd_nandbiterrs: rewrite page
  [   41.161076] mtd_nandbiterrs: read_page
  [   41.164687] qcom_snand 79b0000.spi: the number of corrected bits may be inaccurate
  [   41.167750] mtd_nandbiterrs: Read reported 4 corrected bit errors
  [   41.175324] mtd_nandbiterrs: verify_page
  [   41.181511] mtd_nandbiterrs: Successfully corrected 2 bit errors per subpage
  [   41.185456] mtd_nandbiterrs: Inserted biterror @ 5/7
  [   41.192516] mtd_nandbiterrs: rewrite page
  [   41.198301] mtd_nandbiterrs: read_page
  [   41.201949] qcom_snand 79b0000.spi: the number of corrected bits may be inaccurate
  [   41.204990] mtd_nandbiterrs: Read reported 4 corrected bit errors
  [   41.212568] mtd_nandbiterrs: verify_page
  [   41.218720] mtd_nandbiterrs: Successfully corrected 3 bit errors per subpage
  [   41.222714] mtd_nandbiterrs: Inserted biterror @ 7/7
  [   41.229739] mtd_nandbiterrs: rewrite page
  [   41.235548] mtd_nandbiterrs: read_page
  [   41.239168] mtd_nandbiterrs: Read reported 4 corrected bit errors
  [   41.242252] mtd_nandbiterrs: verify_page
  [   41.248407] mtd_nandbiterrs: Successfully corrected 4 bit errors per subpage
  [   41.252406] mtd_nandbiterrs: Inserted biterror @ 8/7
  [   41.259413] mtd_nandbiterrs: rewrite page
  [   41.265238] mtd_nandbiterrs: read_page
  [   41.268858] mtd_nandbiterrs: error: read failed at 0x0
  [   41.271937] mtd_nandbiterrs: After 5 biterrors per subpage, read reported error -74
  [   41.280512] mtd_nandbiterrs: finished successfully.
  [   41.284587] ==================================================
  failed to insert /lib/modules/6.15.0-rc5+/mtd_nandbiterrs.ko
  #
---
 drivers/spi/spi-qpic-snand.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 17bcd12f6cb932fdf2d968692359a0301ce4acdc..137d60081754db04ceb5db64e6f250f6477021db 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -638,6 +638,21 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 			unsigned int stat;
 
 			stat = buffer & BS_CORRECTABLE_ERR_MSK;
+
+			if (stat && stat != ecc_cfg->strength) {
+				/*
+				 * The exact number of the corrected bits is
+				 * unknown because the hardware only reports
+				 * the number of the corrected bytes.
+				 *
+				 * Assume the worst case scenario and use
+				 * the maximum.
+				 */
+				dev_warn(snandc->dev,
+					 "the number of corrected bits may be inaccurate\n");
+				stat = ecc_cfg->strength;
+			}
+
 			snandc->qspi->ecc_stats.corrected += stat;
 			max_bitflips = max(max_bitflips, stat);
 		}

---
base-commit: e7f3d11567c2c79c4342791ba91c500b434ce147
change-id: 20250521-qpic-snand-overestimate-bitflips-64112df41c38

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
