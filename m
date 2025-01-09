Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7EE77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5xdRbK5AOunx/dAKxAqMJIfJ7nthALaBRPogeljYZy4=; b=GZ/+KpZuV35XP1
	oJN/W0mihPFsRwofjT/S5rShcV+DU3rLLokAukkxQa/J+8P6hoBQANgbfemtwLCkoNqBApoSO6/cY
	DKpWCECXEma20VrGeFUzdPVwa7SAIspAKKjWMv7akJ2oGgMhBmZMK1SmSdQm9k9Rd4Wb6jWLzSVzN
	u8O+cj1XVAIsFFIsFFzP2Mf1hQPb2NymI88D91UyIJbFj0NgvkYvsryPqQXQ+sYJ38j0yVtC+4JSJ
	MDDxV0VkIPYr/+Oi6xMnEwSvLISp6ZhdrAv2qYR4OE8I/dBr7SQ+9rMkWUpxIGLyJITotr+aBilt1
	ScosPazxvzK7HFrIjbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnRG-0000000B7RR-10Be;
	Thu, 09 Jan 2025 07:58:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVnRD-0000000B7Qq-3fHt
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 07:58:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso463253e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2025 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736409522; x=1737014322; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnZP0PSO9gLeR2UA6K/C1ZXfipw4GVw1JGk9X062c0I=;
        b=V0FfkeUVcZ26M/61erpdStET7hre9DRyT/7AUViUbOZbhDyWIFeoLP/5mAGGYxO32a
         6V1nDTI5IMmf8eiFl3sqFhcktWK3Fnzar+kDhNTvre4mJ9MK2HN/gDj+zL3tlOpAnEi9
         K62JgsRGJ5+I/rK1d0+hA11VHShdFLDJoQBSl/JtflpMBNLF6KYmh+W/mTzW5yRMhUTv
         6iFqnysVqYE3DYj14vHK4rle04guPceRkyEc0ZpIztq9rdkk0OdK2ewatfPnQXYYsw4m
         VwFMDb4a6JaURnf9x4axEHYJ9uVok/vTBm423oF45e4vNh0QJH1j4cwernzqKCWXueOj
         Ejvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736409522; x=1737014322;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnZP0PSO9gLeR2UA6K/C1ZXfipw4GVw1JGk9X062c0I=;
        b=HjBTeNOgvOjd+qusOot0MiWL9AWs7q/gfDtPwEaxPQ1LyvP/TFvwMuSCSy3Hh6r53A
         7DHXIJePA+QaZ2A5HENbwv3+lQXp/8vSg0C3HwVi3VV0ueelm7+J3WSozJ8qCe7lFRTH
         eiqupl+nEAUd9nTtvi+N5ZEjRzDYLxbXr/7YafaUD8TrfDBo+z+9lufpxzuOLX/JgNoq
         BDV/EKJmJiuIMS4OfIvtKf6EgWKhhxKSt0rTDMxGvtsUNMJ1Avtgz2BvLEY0mjMFwRBF
         oGLVD7Wf1FY/HyMOMOg9Ck2pS6eHanw13RCRtFOzeL/SUV4xYMDJariRtlvNL/PYHdra
         sEiw==
X-Gm-Message-State: AOJu0YxmDcYu7ObiU8ApA/nFWGCZiVTOsMoQLfO0BCnxOlVpImt3KOz7
	CrjdUUkeoTzZXmj6ue4+p9qd6/euqqIxxN0Za4mrvcx9FVc3s5JM7NcwQiqx
X-Gm-Gg: ASbGncug5gbZnJOq3pR61O4cSTjldEGeYOxeQO7JU52fBsG6GHueivRMkuY0gy5T+Mn
	fR9grOJdgCwPu7Ua06aPhdqXqJU87reJ7MEN2fhRORDd5Ob/eUf5Tk+VddxMzQI4ccdqSmI1fDd
	wDyA+Pah8M600tpPGO6yic2nYNoZsndVhP7QpWBXzkxy23QuhEDvelBUZ6ZMvoZOChHPeI3+Z6B
	gXDXQ/OUAGiDKYDh5SV4Rx9IYRrla84S0MmDRTh+FgUKlrMbkNOQouwuk4nHW1Aatnn84kmnlAC
	jRotXf2ZsLwxX7+TPF5Mj5Rh6g==
X-Google-Smtp-Source: AGHT+IHQdXBRjl53ZE3Au6MCvT/MDSuTdCNw+tMoAVNX4Ml0jMaxOjFDZ5z6jGCueTvhcyVbEZ8SMQ==
X-Received: by 2002:a05:6512:3d18:b0:542:2a28:e30f with SMTP id 2adb3069b0e04-542845d315emr1652301e87.31.1736409521339;
        Wed, 08 Jan 2025 23:58:41 -0800 (PST)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be499e5sm116185e87.5.2025.01.08.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:58:39 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 09 Jan 2025 08:58:31 +0100
Subject: [PATCH v2] mtd: rawnand: davinci: add ROM supported OOB layout
MIME-Version: 1.0
Message-Id: <20250109-davinci-nand-v2-1-06bc5a3d177a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKaBf2cC/3XMywrCMBCF4Vcps3YkF7OoK99Dupjm0g7YRBIJS
 sm7G7t3+R843w7FZ/YFrsMO2VcunGIPdRrArhQXj+x6gxLKCClGdFQ5WsZI0aEdvaKgQtA0Q78
 8sw/8Prj71Hvl8kr5c+hV/tY/UJUo0ZlZW6uFkRd9Wzbix9mmDabW2hfvNVbhqAAAAA==
X-Change-ID: 20250109-davinci-nand-c9e2af2ff3ab
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@combitech.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=d0tJxhEDAeUt2VXbOzMJeEAz14hNE4fDb/B1ZBEHMNg=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnf4Gp5PoQlxX6ch0FpCIaffnt2ccwKb7gHWniJ
 BnjbZD98LaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ3+BqQAKCRCIgE5vWV1S
 MgGbEACxcndLfUYpL6eKNKDenSk9RvBqM2hvCeSE5wPudKDAHGagsE+Lsu4Rom/BBfo7yeFeDII
 eWU9U3NfAhJb6pxQ1ri/+aipyYvx1l+SQun3aKRTev0pJ4/XiBix3Imzkd63x02swyzhxtmlbLZ
 9EiKPY/uIpVuzyPjQPYaLnyEWuf8Ve8CXDFhAvH9W3gazIWOlQJg5izSvOI4ej9OOpIeJ2BOzsj
 bxx5kBSJbaoQH6S5tQK/kmupdvAP011OYt+neqGtHZTczveslOB6I30OPbA+2EZliLZU89Lh4Tj
 2KY9HTnT4+j6chFIXWWXXW/IQZjfUR9duVqrvn/9BLHshtb+TJ1ykHrJ2JQezB1JzOUbi7DWsdM
 LJvnuaKDYT3PGrxQ74mV5UXRHX2gpr4SXC8qPPbPNogrdArtt/HWgGBrzZSbhf+mkEE3D8tBmEo
 HNsJ7chiFPnf2Q5htTUVZIQ5Dwo5cAqWwAgGMIvlyUG6hfL0dCG9vuk7DtO+ym03sLEvCuxoVNR
 q4qvPcIQPF8idcD158akm2cuLCQryNPjC86/F+zmsEWb7nE1iTuuT3PGY5zp3I5PS1hPM3DWcUD
 V9TWfeolcLze/Q8yYDKPOu12KrG5CpyAiHhBoF99TIyaevrXQ9Q55x+sPxTV3ZIDBvpQT/pQRRL
 zCjh7tydc0CODNA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_235843_918914_77A1886D 
X-CRM114-Status: GOOD (  16.77  )
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

From: Marcus Folkesson <marcus.folkesson@combitech.com>

Add support for the OOB layout used by the ROM bootloader.
The same layout is used by both Keystone [1] and OMAPL138/DA850 [2]
which currently is the only users of davinci-nand.

Only select this layout if the `nand-is-boot-medium` property is set.
This to avoid breaking any existing devices out there.

[1] https://www.ti.com/lit/ug/spruhj3/spruhj3.pdf
[2] https://www.ti.com/lit/an/sprab41f/sprab41f.pdf

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Changed email used in signed-off-by tag
- Link to v1: https://lore.kernel.org/r/20250109-davinci-nand-v1-1-d5b3cc305143@gmail.com
---
 drivers/mtd/nand/raw/davinci_nand.c | 45 +++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 1f8354acfb50b2f4d155cdfc03afcf2863539f66..09119a8db0210cb14236dd2f8872c18fcb9be7d8 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -479,6 +479,44 @@ static const struct mtd_ooblayout_ops hwecc4_small_ooblayout_ops = {
 	.free = hwecc4_ooblayout_small_free,
 };
 
+static int hwecc4_ooblayout_large_ecc(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+	int nregions = total_ecc_bytes / 10; /* 10 bytes per chunk */
+
+	if (section >= nregions)
+		return -ERANGE;
+
+	oobregion->offset = (section * 16) + 6;
+	oobregion->length = 10;
+
+	return 0;
+}
+
+static int hwecc4_ooblayout_large_free(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
+	int nregions = total_ecc_bytes / 10; /* 10 bytes per chunk */
+
+	/* First region is used for BBT */
+	if (section >= (nregions - 1))
+		return -ERANGE;
+
+	oobregion->offset = ((section + 1) * 16);
+	oobregion->length = 6;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops hwecc4_large_ooblayout_ops = {
+	.ecc = hwecc4_ooblayout_large_ecc,
+	.free = hwecc4_ooblayout_large_free,
+};
+
 #if defined(CONFIG_OF)
 static const struct of_device_id davinci_nand_of_match[] = {
 	{.compatible = "ti,davinci-nand", },
@@ -638,9 +676,12 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 				mtd_set_ooblayout(mtd,
 						  &hwecc4_small_ooblayout_ops);
 			} else if (chunks == 4 || chunks == 8) {
-				mtd_set_ooblayout(mtd,
-						  nand_get_large_page_ooblayout());
 				chip->ecc.read_page = nand_read_page_hwecc_oob_first;
+
+				if (chip->options & NAND_IS_BOOT_MEDIUM)
+					mtd_set_ooblayout(mtd, &hwecc4_large_ooblayout_ops);
+				else
+					mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
 			} else {
 				return -EIO;
 			}

---
base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
change-id: 20250109-davinci-nand-c9e2af2ff3ab

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
