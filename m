Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD90C9832F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 07:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z726PBUCF7OTTJDxtEzG4pq7B/Dy0aK6mx8Gaq88VS0=; b=JcOSNaugZXgKSh
	V6fuNU693Hzns7v4ifY8//WFn4mV7qIvw6T59idKGkp5XolpW62xkkTOwSXi/RBdDc6AChQYL+Ehs
	Nz5ipy9BGX6DdAq8G+vyhQuo+lifcQNIDx+b98/xGFXkoqOTUiRTmG/uUVSvrvEV/yTeaCjPz/hWq
	Eygpm4MpUcQZMNLrY2KEPDB39B/UOeX5085SitTUIUjUgAi6UU1FnT5kHZrT1jVhX+MLtqERrcGCL
	8huNJG30fhHfx32ISo/+NiG7j9R4eOeZ5O7xTSTS/+aqYzRnk5jI29/L6wliNG99KgTe62XjK5h/6
	HvsFP95s9FIQArCWXWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5NQ-0000000HVXu-0qTu;
	Mon, 28 Sep 2026 07:02:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5NM-0000000HVXW-3zFB
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 07:02:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c20ce3c118aso426304166b.0
        for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578930; x=1791183730; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=YhY4aV3pYdmN/VVcAdaWysfy6eD1hG26t0ZqDPQ95xxzR9G+c/7c0fM1IMzvUCHM8q
         GTamWHzExDrZJvCNPnymFf8zvz+hH+LSgC+6IZkvWRu+6zbGdY17/I4BZRG6A7ByxNLl
         p+theos7pxaogyxGcJncL8q7gI35cs+A7m3QkPKNK6E4KvHRlFY4dvBK61+wFgADqKxr
         Pm/BMdlbdd39xcoaywUnuGpK/0djbi04+XFzg8PumW2rOSMsyLpB6acHl/OHX6DPfxOW
         3siBkl3kAXVhyR277zhawDBNCM+byFWRrmQt+cxmH+qgh3ILrhADn5cJuLW5gaPMn7Wz
         XBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578930; x=1791183730;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OPkNPJmzSuKsV3tYjzk5WCFitXsvoG1mbaUmgEkFosA=;
        b=dMfIcZyqShowOZtGqeY41eG2kqOLG7D2+59Jx0kFC90SUlJkqJrTDpgbIVNmmOWzTz
         FduqJve5gYDlBVudQZFltWoB88qlNjgrteZEPSm8s1ieGz1KgbDUG1Bzh6SvSMcgCauP
         BxjabNKuhoDmJj2VfvGtQZxkpC7Ndeix4P+jUGLXHyV9LAzhjo2ml+v40exunbD8GR9C
         UDmLvkYEOxYHVtKIcX07voGrznKx8Zup3gpzICwMBbj8KXJItgX5NpvS3bGmGY4yt8pk
         MrVEMSYRi/u5SagHTOUjB+NJJrxdIWvKwma6xe3KaCkPx1I9udcoaq3H20qPVg0sWux2
         a4tw==
X-Gm-Message-State: AFuF++n0vTTAL1HjW59wsqT1w4iTHorjIuI2RoLfSCHqsgddtYSUVJNg
	hYD6hfzgBHpdTwwSOETYgfFRONj8oKu54JvzEMI6JJ7quHH2olEJFzWo
X-Gm-Gg: AYBFou3MEgSrJN82zK0DiVdvNM8Aavj/xuMgHWO72YqPVgzDOj4ryRoNwyiRritV84b
	Wr5DUpWdjt11Uk2QTPUDoBWiUPfeapKK2Qo+6HBGR7BnTcgvEPd//AFd6jr6w14aqoY84lQIog1
	qmhXDmqRQYCzMZtgagcGlfc7RDkYf6p4IAlw3qsYAbW1luEowPSr27JrvE1U1TdgMx3WPOaI/rZ
	YYdHVF12yufZDbKRFW6/j9y4OA7tVVHptZKeM9hXNuQ3RSALcMaJcc7Aflr3FaUQqS95YOFxYTX
	B4L82nfYwrGbv3jr+v6uBQFGxkLM4y6rNRAmfaH2ylxnYr7KFz+9DS6r39PGaWQPMNPCO5jPhtZ
	dp+p5G5omphn1a4ijKBJJeUKvEAeA4GzqwhpynRJofe1pw9C9kNga1RgkOZG2nFZ4ny/Rh2lvu8
	myGCsF/PWse2SOI8p/emQISrO7GVTL9KmuwDIY7FJA+oiZbfFRLvcDeOwUFBw/mNW2dHOaqlBMY
	vQIABYoaLjW0pVvp9OiBq2Nlqk=
X-Received: by 2002:a17:907:9301:b0:c2a:b008:8cc0 with SMTP id a640c23a62f3a-c2ac2382bf4mr1095005966b.28.1790578930459;
        Mon, 28 Sep 2026 00:02:10 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a349a0esm35536952f8f.10.2026.09.28.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:02:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Sep 2026 09:01:53 +0200
Subject: [PATCH] mtd: rawnand: qcom: fix read location register usage in
 config_nand_cw_read()
MIME-Version: 1.0
Message-Id: <20260928-qcom_nandc-config_nand_cw_read-fix-v1-1-98edccaaea0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBCF4avIrB2I01bRq0gJYTLaWXRSE7AF8
 e4NLr9/8d4BRbJKgak5IMuuRZNVdG0D/Aq2CmqsBnLUu5EIN05vb8EiIydbdL3g+euzhIiL/lD
 Ge/+4DcF1NEAd+mSp+TqZn+f5B4jgbIN0AAAA
X-Change-ID: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_000213_013829_A319752D 
X-CRM114-Status: GOOD (  12.67  )
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

On QPIC v2 controllers, when the last codeword is being read, the read
location values must be programmed into the READ_LOCATION_LAST_CW_*
registers. Prior to commit 8c52932da5e6 ("mtd: rawnand: qcom: cleanup
qcom_nandc driver"), the config_nand_cw_read() function did it right,
but since then it always writes the read location values to the
READ_LOCATION_* registers even if the actual codeword is the last one.

Change the function to always configure the registers corresponding to
the actual codeword to restore the correct behaviour.

Cc: stable@vger.kernel.org
Fixes: 8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d7642db2e2df..170af9f26d47 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -328,14 +328,16 @@ config_nand_cw_read(struct nand_chip *chip, bool use_ecc, int cw)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
 	__le32 *reg = &nandc->regs->read_location0;
+	int reg_base = NAND_READ_LOCATION_0;
 
-	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
+	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw)) {
 		reg = &nandc->regs->read_location_last0;
+		reg_base = NAND_READ_LOCATION_LAST_CW_0;
+	}
 
 	if (nandc->props->supports_bam)
-		qcom_write_reg_dma(nandc, reg, NAND_READ_LOCATION_0, 4, NAND_BAM_NEXT_SGL);
+		qcom_write_reg_dma(nandc, reg, reg_base, 4, NAND_BAM_NEXT_SGL);
 
 	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);

---
base-commit: 55c5b6d5f59f59a8c98a7effc3195226cc20175c
change-id: 20260922-qcom_nandc-config_nand_cw_read-fix-e946537a0127

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
