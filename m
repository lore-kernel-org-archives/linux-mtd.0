Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1W57UY+5NwmlETFA7An3ydIGTqnx87RuDzATrJDxY+M=; b=Dcgtazv9WxvxCj
	H6GNXf/i135InLIwUgA+E+FSxexo8vfUjYr1K9e5FN9/lU1dTAsIggbwu+fDlBOirs57uWN2iUxIt
	ob/DVNXevg7PYs/k/8ptH3+XcJClfIwb6Dwooy6kYXK6cX99qjxRdapaSDBFBrYAJ0hf6ewiAgdfl
	cDBaNkzJwY8dBlIWEstmjerZc3L+HeId0DgQlvqBfJnhcV/sUG2k7uDI8WcRKvLTBbyHDieji1Qk/
	BZ2LuUNV3lkVAzO8Ys4WDqoI2A5TFy+VKewSBTObZk37JucldHd0E7QSu4fmsCXYcnErK711KZFom
	tQyzC9EMIMs8c1NTXNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK8x-00Fhvz-Ua; Mon, 18 Apr 2022 05:41:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK8t-00Fhug-JM
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:41:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id 12so11531846pll.12
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2022 22:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXaluecYJ89S09Ps/kpYtWYhsVX//J5lyUFTJFlXW4s=;
 b=cHhlnFr3zvgOtQMkI/SfFbOHu5HU92ye4YBl8Mhk3QAPxOoPRrEvOEAtJYUbOhkLBK
 zrZGseY/XaTbV62u/YUjxG/gi89J/Gx0FShJkyDYs2qMtHLqaf4vAT9bRX17t4Io3e6m
 09ezV2sUoncx4FhQfOyiXRoaoebAfWi1n/x+qJBn6dXNBDDJAswrTJE/o2WN7L/kxyWo
 +tv+gZtDMx9E5a23PMcEMxAvb2fzENITTfLMVj2SIULG5NJggPqjjsqMaxxOM01+KPo5
 IvAJgwd5TOjubn/G3vofEVjVH4mOduyd52krKbBSJz3wKP/48t7eLZs3PgtuiKvPjhrX
 g70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXaluecYJ89S09Ps/kpYtWYhsVX//J5lyUFTJFlXW4s=;
 b=69s9botLASy2xJuzfFLVZiS593Ek1Of+ktUyGjrsFOIu2nMpExpdNUOeXrAy3n6xsj
 w9xGtyhzG5tVFAeFXgfUNTO0EbvrNmFtTmIwjEiWBCBnS/eFs2R9rKmhTco0zLGZ6TbL
 3QUynYT84T2oTLa3inQ8wRYIM/P2Jb18B7RcHPozBY1eYJJmIf+GkPANV6+oXutlrqJe
 vAF82PHHNjlhbedCpeDb8AIYsxP+B8H/98c3bWcn5dhkLUp+tSlhcEFkE1SmaGxiU+oY
 Xyknp09VZg1wYvK3qmLjeieFvAXzmHgHrIINaOuXDOxfK63dpeTRcSLd5v1AriSSKaFR
 q7RQ==
X-Gm-Message-State: AOAM530VKCIJ4asW0qBIfv9bGs1Mx9rTNaCCJwy7Q84RLTaOp34NssCp
 7XkphA0evL7e4dF8DObPeSW2j1/Kpjg=
X-Google-Smtp-Source: ABdhPJxFO/4Qq9hPdq1U3Qm2PrhI3BDsDRcW8cOEVBqTCmvrpDUdZtx8PXzpirMmx2dzxOf9Z8Wz8Q==
X-Received: by 2002:a17:902:b212:b0:158:f491:8618 with SMTP id
 t18-20020a170902b21200b00158f4918618mr6643632plr.36.1650260502250; 
 Sun, 17 Apr 2022 22:41:42 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm10810873pfv.29.2022.04.17.22.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 22:41:42 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v11 2/3] mtd: spi-nor: spansion: Add local function to
 discover page size
Date: Mon, 18 Apr 2022 14:41:15 +0900
Message-Id: <7695c40251f2fa13f42259ca28150d41b72e7cf0.1650259501.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_224143_679473_90E8F147 
X-CRM114-Status: GOOD (  16.46  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
Move that to a newly created local function.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  - Add addr_width param

 drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6bcd25180af4..493240ebfd70 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -177,6 +177,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_set_page_size() - Set page size which corresponds to the flash
+ *                               configuration.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @addr_width:	address width used in Read Any Register op
+ *
+ * The BFPT table advertises a 512B or 256B page size depending on part but the
+ * page size is actually configurable (with the default being 256B). Read from
+ * CFR3V[4] and set the correct size.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
+{
+	struct spi_mem_op op =
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_width, SPINOR_REG_CYPRESS_CFR3V,
+					  nor->bouncebuf);
+	int ret;
+
+	ret = spi_nor_read_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
+		nor->params->page_size = 512;
+	else
+		nor->params->page_size = 256;
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -231,28 +262,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 				     const struct sfdp_parameter_header *bfpt_header,
 				     const struct sfdp_bfpt *bfpt)
 {
-	/*
-	 * The BFPT table advertises a 512B page size but the page size is
-	 * actually configurable (with the default being 256B). Read from
-	 * CFR3V[4] and set the correct size.
-	 */
-	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
-					  nor->bouncebuf);
-	int ret;
-
-	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-	ret = spi_mem_exec_op(nor->spimem, &op);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
-		nor->params->page_size = 512;
-	else
-		nor->params->page_size = 256;
-
-	return 0;
+	return cypress_nor_set_page_size(nor, 3);
 }
 
 static const struct spi_nor_fixups s28hs512t_fixups = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
