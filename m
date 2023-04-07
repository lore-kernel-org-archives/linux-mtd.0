Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2782FC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuW3tXyWBPqWepko1l6P/2nlU/TCzSNYOUiMGs5/u2w=; b=zyppa7XsuI7nnd
	TCpwkAcQXUW59oPG9V1rH2yKc29N05Y7wiKIhdam/E+h6iwM5cAF4gHPI3TyqwbQxtNNLqmSGq1dk
	idQK/tqA202t+7CugZTLfU0lt8j67jtij3utT/TwlF/d8sMgjnGLkuOYf3ZBbZrkKkTojWFMYaVZu
	P3yPfB5Qy1HKYxgioUc1LRP0YEbiU99YhnU9ACDVNMCroVYfBe5Y6iX1RqJEk39XF6eTE0eLuxf1I
	qv/bgUN1h1kpyqGG1BAbUcnhPX5bNma2hTi2VGeVbbeyfHpvHOvi+kxayB6UL/6kdq4i8mzM2dvGW
	AwAWj1currAFIJtyJVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfKN-009FIk-2q;
	Fri, 07 Apr 2023 06:12:03 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfKL-009FGO-1I
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:12:02 +0000
Received: by mail-pj1-x1034.google.com with SMTP id q102so39045668pjq.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680847912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJLtG/tkrNIXbfs8/q/byLZwPYtHQNYA62hewYhLI40=;
        b=NiPptowFkFaovJYuhIjVAuKTm8Osn+xahRnH60kJx6hRTA8SEcq+MiBTwmnCLvGrRN
         gMjK7YKDpbFi+cdIUJcy4QLLFAX8peqtU+HxrRLUwU14GQjC5JIr6W0oNdJAJXaHzsZt
         +WEOXHTeqWAXJIL9YCaU0bvFiRgtFkfQ+3fZd9+XV2ZTcMer3pzfGSmx5z6bwMLkiHEF
         S1ZUiGt9uU+vGB1Y+5j8GRZ2zlbMjN9Vl6GzvYzDLrd2xB7JBz4jBZJa4SUGVAE6If7j
         nCC0xMmd1NujTkXUx+3IjDIbfxYhT9Kh9dUzWTfQnU3BQsxkFqXKJ8ihuhoZL0P3VVzm
         Jvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680847912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJLtG/tkrNIXbfs8/q/byLZwPYtHQNYA62hewYhLI40=;
        b=qamvAniXMo/teNGByFbymoMKRdUvT4zXU1uVSHcwZSStahUHapyNG1k9Hvq5/vAryK
         TvNK5Xa6yoinkJrB6MRLhblbYyEIiiyjOXCpjozAnmhKFp628IVqe1y6gFzx0qzTLm1M
         TcN6MZyiizD4PZgSbawr89H8fDM9y8ovMjAWZ3CQifynJj9FpfyybKWTXaETHacCHpen
         0En5NrHEmQzrKgjsFxOG2FncpwWK/2YDOd2h+HsWm/lhkeeUDXRnwiN812+76rpwm+Wo
         yQ5Ex4bfSepKByK2YMv9zD8G7QE7wPNbxfHnjraUSzc9RUoA4hNIO+YCZPO23zroY+Id
         r0/A==
X-Gm-Message-State: AAQBX9ejL/OXLw5WUE4ss4zgJNMAkMjt2TkS8TghJjWjiaz3QBV9p7DX
	TsrJgeBqp7RNp0nZ0roK2qViWECWxOU=
X-Google-Smtp-Source: AKy350beaFG7fOpAKl3Cw7sZdDFRngto/xWfjMrQ3PnflaNWa+tOhtey87nuubqFJB8kxYvvFWjszw==
X-Received: by 2002:a17:902:e5cb:b0:1a1:e112:461c with SMTP id u11-20020a170902e5cb00b001a1e112461cmr9429477plf.30.1680847912070;
        Thu, 06 Apr 2023 23:11:52 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c24100b001a2beda73e1sm2272527plg.166.2023.04.06.23.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:11:51 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 2/2] mtd: chips: cfi_cmdset0002: Fixups for Infineon(Cypress) S26Hx
Date: Fri,  7 Apr 2023 15:11:27 +0900
Message-Id: <9bffcf1a61b3adc1eeb19db1b13c0c372ac1eef0.1680663252.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_231201_445728_A6E82997 
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

Infineon(Cypress) S26HL-T/S26HS-T family has AMD/Fujitsu command set in
Hyperbus mode. The parts have on-die ECC that program granularity is 16
bytes data unit where we cannot word-program nor bit-walking. Fixups for
these ECC related requirements are added to cfi_nopri_fixup_table[] as
the parts do not have primary extended table.

The parts do not support DQ polling so we need to use status_reg.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 25 +++++++++++++++++++++++++
 include/linux/mtd/cfi.h             |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 67453f59c69c..b4e1b0d516b1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -124,6 +124,10 @@ static int cfi_use_status_reg(struct cfi_private *cfi)
 	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
 	u8 poll_mask = CFI_POLL_STATUS_REG | CFI_POLL_DQ;
 
+	/* DQ polling is not supported in Cypress chips (S26Hx) */
+	if (cfi->mfr == CFI_MFR_CYPRESS)
+		return 1;
+
 	return extp && extp->MinorVersion >= '5' &&
 		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
 }
@@ -450,6 +454,23 @@ static void fixup_quirks(struct mtd_info *mtd)
 		cfi->quirks |= CFI_QUIRK_DQ_TRUE_DATA;
 }
 
+static void fixup_s26hx_writesize(struct mtd_info *mtd)
+{
+	/*
+	 * Programming is supported only in 16-byte ECC data unit granularity.
+	 * Byte(word)-programming, bit-walking, or multiple program operations
+	 * to the same ECC data unit without an erase are not allowed.
+	 */
+	mtd->writesize = 16;
+	mtd->_write = cfi_amdstd_write_buffers;
+
+	/*
+	 * Unset MTD_BIT_WRITEABLE to activate JFFS2 write buffer for ECC'd NOR
+	 * flash.
+	 */
+	mtd->flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
+}
+
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */
@@ -460,6 +481,10 @@ static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x235d, fixup_sst39vf_rev_b }, /* SST39VF3201B */
 	{ CFI_MFR_SST, 0x236c, fixup_sst39vf_rev_b }, /* SST39VF6402B */
 	{ CFI_MFR_SST, 0x236d, fixup_sst39vf_rev_b }, /* SST39VF6401B */
+	{ CFI_MFR_CYPRESS, 0x6a1a, fixup_s26hx_writesize }, /* S26HL512T */
+	{ CFI_MFR_CYPRESS, 0x6a1b, fixup_s26hx_writesize }, /* S26HL01GT */
+	{ CFI_MFR_CYPRESS, 0x7b1a, fixup_s26hx_writesize }, /* S26HS512T */
+	{ CFI_MFR_CYPRESS, 0x7b1b, fixup_s26hx_writesize }, /* S26HS01GT */
 	{ 0, 0, NULL }
 };
 
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d88bb56c18e2..29668241b44e 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -374,6 +374,7 @@ struct cfi_fixup {
 #define CFI_MFR_MICRON		0x002C /* Micron */
 #define CFI_MFR_TOSHIBA		0x0098
 #define CFI_MFR_WINBOND		0x00DA
+#define CFI_MFR_CYPRESS		0x0034
 
 void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup* fixups);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
