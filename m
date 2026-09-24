Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E398C98327
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXerL11Dwme5ykrsLHZuZmLK/Y3u7ZU66XM8icRgtKM=; b=DrMuXdEjzWSY3a
	TOLwaJyN35Bn3NjuZJE/kHGxBTwJvCDKUemELkncd3LfRRSJnHWyI/BTffPLfQZ/hqSJIqTGxg6g2
	elRzFoVkjOf1yG45Zn0HXpQNOt3vIU+6kjL8R3hiE2BGk5yMwwrxcY9ukIfCzgaFyfLQ1r9a8FINT
	bHgPZGnWaMToJbpYKRyYOmDiXMIMf1AwkYYEk0SuKUsrhMBb6pyZ529hwmFOntcGTZxJfBqwvGSVG
	RnnytHmeTFVFtt18UEdjREhVEuHLCwzhgghXcGtJHbx9rPLh9ERd3zzZvaQUuHzhF/X4uYMtT6B46
	SvVf81NswZbB3LRJFRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgU-0000000C6HU-0Ai1;
	Thu, 24 Sep 2026 20:04:46 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgR-0000000C6Fi-1oGr
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:44 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so151421f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280282; x=1790885082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfE5jdaxQZ43i+myqwUtnFt8LRx/0Q0FXN2w5xiH2WY=;
        b=Off8ZuPDgQYi5VypyjBIuzrQq9DURMhsDXiuCT16cG7fBC/+66wDiGJIZ9MUdwzy93
         i/rEPiFpjijaw7DeuJzDWCzoAatVHnoEvxkit9ur+MPHjs6Cte9PJSPFo0QZ48tUdZko
         ep5U5Fmz3QGrvbsxlL9PnPnjN9Gw6xFB0cQShi7VX2xINaqyJGc8KMoZqucr4OxXdHzJ
         0DE4uVb6YGa4R9Be67+VTJwna7Zg1LJFwGya8pAzJbbkTMYUa3UGMLkbDT6wjgijMVai
         D5IZ6/o2sdL6EPzIrs5fnHvKPiXVFO+frF4RvGrumh7qQ0ES+PUqJ6wK+MIgxEougKWg
         MFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280282; x=1790885082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfE5jdaxQZ43i+myqwUtnFt8LRx/0Q0FXN2w5xiH2WY=;
        b=2q9Vqnse6e3bNDhLSbHum4QCx3MmeKA2YMAnb+CadoJ/XhX3cn0fzsi8m4+GZnK1DO
         ceah9T4cVL6pVWJiLnwa+4fl/jyCCWNB/OvWThL+06tRPKSNIHd5V4ulnYBYsjDjsaxb
         XF0qtaMBJQ2UixDiOU72/olIQs5mt5fB+Hc/XUYEUN2vNOfkt4mT2Yj2vJIlMu1fh1Bn
         fktZ5F4/gEMq2Zak9DFUw/stQWyjajU8P+ROzjQtIk0dVlneDmSM868oPEAPTgBuP4Tb
         o2fYIq7K4m9geoESc+eVevB0/GM3c+P5w5kENIgcG8Y1Qj3fqxOFlQ40L6PV7ma3vsQg
         p5Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwgue0T+l1Xu8QKLenUZBfeEDrKli7v/MXqds8nQz2I1dkUoJGo79oqhHu1oNESZAXHGB81sUpxBXg=@lists.infradead.org
X-Gm-Message-State: AFuF++mmZ/QG3WeyZzL9b3g3zKPD0Qde5MCHhD5vKjXgezxYtZN9Ia0H
	Er1/erg4q7SbHtSmRsfcX5VdRzhRBz9ipb+wyxTxE6b/kN/McuII3H8m
X-Gm-Gg: AYBFou14KaEe7uLOLDQBml2ICcmkdTO2K4OQAoavZJZ6yIpjz/KIzXYsId2ew9LMutw
	pB4QUfUCjU0cz7n4yCKp+8dr8XMUiAIlGudbr1meVoDyewW0DhPco28gbwN/NOG/6Qk3+YmBSUq
	pOBp0SGpXaYl/x0L0tsw6Q/Stwyj7UnVDpSXvPyos6v+vldEnh3GNYcqoNSS0htRVxxEHDorEE2
	FoeMP/Cnytb7y0wvw3g7TY0bqDEFsJO3z8I2PQsmLvjfH4RgijIhlGK2SNsgziJtkd4nFFyJwgG
	HeLkWv6CBjVq+9J2cpYleSTZ3Ld9wkFbvC3d1OPSkWnLyJ2Czm5ePiZjjHL7M15jxdB/GnjmLgl
	qW6pOrUtEPS64z6XPTpNA7xKuSl2LoGb8/plD+RE78UIvyGBpDIQ9SPZzs5VGcS9Zq6M3C3QEFQ
	wFnAt98ERYFpFP/be2DTB+Aox8FWtexI4i3xIuF1uXZHRw0qFObeyrEjXjq1TOsoo7UMfJqg/2V
	NC9DFjAym3RMisFLcX1DwASIIw=
X-Received: by 2002:a5d:5e03:0:b0:487:370:c511 with SMTP id ffacd0b85a97d-488717147e2mr6198660f8f.8.1790280281764;
        Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:20 +0200
Subject: [PATCH 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130443_521044_27177D15 
X-CRM114-Status: GOOD (  14.22  )
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

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 99fbf5458083..96a1a5a03de8 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -150,8 +150,8 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 }
 
 /**
- * nandc_set_read_loc_first() - to set read location first register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_first() - to set read location first register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -159,11 +159,10 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
  *
  * This function will set location register value
  */
-static void nandc_set_read_loc_first(struct nand_chip *chip,
-				     int reg_base, u32 cw_offset,
-				     u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+					  int reg_base, u32 cw_offset,
+					  u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -230,8 +229,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
 				read_size, is_last_read_loc);
 	else
-		return nandc_set_read_loc_first(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
+						     read_size,
+						     is_last_read_loc);
 }
 
 /* helper to configure address register values */
@@ -1918,7 +1918,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	if (nandc->props->qpic_version2)
 		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
 	else
-		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 
 	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
