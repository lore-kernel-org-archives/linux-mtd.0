Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398EDC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:59:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A014764F69
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 06:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A014764F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3FRQuMRuwYnIWzAiBDNKhEbSN4recTNk5dsWsHVWbI=; b=lr7FAOd60/ntlmWIRw3ThCA9p
	7CrLOA7nTblY4tF/qLTaD4l5CvgE2MwoUBSV2utWztId1uaKqTjZrLSSOLKUhYD/Uu9B+LCXXTXB1
	50/6J6Lx5qomOzZqJmXUep03O0Bq+z0LxI100mfbnSQPlSFdOhcIiQRdUc7ArdXUFAhKiE231dRPK
	l7GtPoVGx70D9UylpfRDm1khqsEpfD2Wfi2gIXsCxpf5xGYD0xzyMW9F2kHp9HqIidTXprJpThXOr
	Bwetm4pd3UfLaVSWQHcMQYLgmwew6cmRpCKH9UhFgJzZMbxGEnxzqgSWrF0YZPw+i1Qam+0igYyOj
	em8kI9ukQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN95v-006kLy-Cb; Fri, 19 Mar 2021 06:58:51 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN95g-006kHG-F7
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:58:39 +0000
Received: by mail-pg1-x534.google.com with SMTP id n11so3050608pgm.12
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yHH1vdfwbcRbKBolNPXvtpwqypEwoTjxM2CXH/C+xiY=;
 b=n3qKLu/sB5fxXLsNKg5H3oE7EAuYwlWkMaVk9r9Vh61UYFXUld30V8BkK8y5tf0TMt
 IFtV+E0VdJCB99H2qs4/211sC+JTgFELtOBwl8E9Da+AdWc7U3qHMqqF3fnIivy7ExbC
 CL6k5Sc4mgYsVPMVXJf3p2zfe177PyjIRrv4ApR7Y/2fY16iKlD5qLZTZn2W7cHgwofe
 0v0M6yCNCKZyj941BiYug0ZjQQE54sET5wcDISVYlZ8fv5lDPSRu7ILNv1XGVfSk4Suj
 16bA87tAfPro7UZV4nXOQkKXd2uJwLHP7tSrbI+USE/dGF//3dLWFxqRG//uwbdPHHVQ
 0lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHH1vdfwbcRbKBolNPXvtpwqypEwoTjxM2CXH/C+xiY=;
 b=YbVV85RGDuorHszeQG4rdy/RrznW+oegmk74A198S+ADj8nzjX5W+7QAqOEM6dSSHi
 jufz6DaPO1ihKH089vM5WGuWU550hN1k7APN2l0X2wGHB15kX3qrD0uMbkZHuK4MznXA
 nyLDOfEC0bpI12aJiWlEx4b6BSpoVZLShcPWcL7mLphHKjVP541BfoDdKEpglIgqntOC
 9489DsLTNv+X7wfcRdnSofXcjg8ZyvwzTkxBkrkObyy8qWMMFcSqAGQYCSBDqlN38n1f
 mX3N47Btm+dSBiBAUdg+uaTYp0TghNLc+qb2VCFMayQDZzq6aukPL7y4h1N7V5H1xQ8W
 HKBQ==
X-Gm-Message-State: AOAM533oFj5Ou2n2gepeBRqca2i+99vtN0nubYSfjuBPNDTM1X1Zs+4r
 lbNYuszgBBg8OqOSHku9aMH38Gz6YsXLgw==
X-Google-Smtp-Source: ABdhPJw4HFY12k/wN6O+l2d2sF5Lcbe+lEjT8cX9mt4Wt0Udg0bL/+ariMFNX7mN5ORaUXd18yb2VQ==
X-Received: by 2002:aa7:9804:0:b029:1f1:5340:77c1 with SMTP id
 e4-20020aa798040000b02901f1534077c1mr7715954pfl.72.1616137114625; 
 Thu, 18 Mar 2021 23:58:34 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s62sm4399721pfb.148.2021.03.18.23.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:58:34 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 5/6] mtd: spi-nor: spansion: Add status check for multi-die
 parts
Date: Fri, 19 Mar 2021 15:58:22 +0900
Message-Id: <11d5b49f3710fa6a753389012d8a2b56d2791e59.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065837_791811_0F811C2F 
X-CRM114-Status: GOOD (  16.76  )
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

The multi-die package parts from Spansion/Cypress require to check
the status register value in each die to detemine the device is
ready. This patch adds a helper that queries status of each die by
Read Any Register command. The device specific ->ready() hook will
call this helper with the number of dummy cycles and die size.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v4:
  - Reword 'legacy' to 'default' in function header comments

Changes in v3:
  - New in v3

 drivers/mtd/spi-nor/spansion.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index fdbf43bccc21..04ad8f83dae0 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,6 +10,7 @@
 
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1V		0x00800000
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -183,6 +184,51 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
 	return 0;
 }
 
+/**
+ * spansion_mdp_ready() - Query the Status Register via Read Any Register
+ *                        command for multi-die package parts that do not
+ *                        support default RDSR(05h)
+ * @nor:	pointer to 'struct spi_nor'.
+ * @reg_dummy:	number of dummy cycles for register read
+ * @die_size:	size of each die to determine the number of dies
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
+{
+	int ret;
+	u32 base;
+	u8 sr;
+
+	for (base = 0; base < nor->params->size; base += die_size) {
+		ret = spansion_read_any_reg(nor,
+					    base + SPINOR_REG_CYPRESS_STR1V,
+					    reg_dummy, &sr);
+		if (ret)
+			return ret;
+
+		if (sr & (SR_E_ERR | SR_P_ERR)) {
+			if (sr & SR_E_ERR)
+				dev_err(nor->dev, "Erase Error occurred\n");
+			else
+				dev_err(nor->dev, "Programming Error occurred\n");
+
+			spi_nor_clear_sr(nor);
+
+			ret = spi_nor_write_disable(nor);
+			if (ret)
+				return ret;
+
+			return -EIO;
+		}
+
+		if (sr & SR_WIP)
+			return 0;
+	}
+
+	return 1;
+}
+
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
