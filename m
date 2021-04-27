Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030BAC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:15:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E1B6113D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E1B6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2bQ1WttdxQry7OE9zkeV+KDd5lnxk2yh0zPLjXeiOus=; b=pA+L481U9Fsfmhl+fu9SD6Jql
	CgbykDcpJVQtZ04iDhddgaE1NAapqwT6ZwcXkLKqfQ7w5/EPJeUmXRl0FlFgjCJcInaFezALohUDg
	roq0bfdptijrztT8/CMx0onXLZX+kXTMgu4pfX/HC6TX7Yw2Xrvqn+ZjBWMIbfwVP6VBjvqYDYUzW
	OvHvoXsxWhL1f7HJsNpe68RaIlEJmmnl5GwaFPs8uX2ocPmMgNkKi6zY4ms2JFq10j2CRazf8LMUs
	P/Ek6Pbib8AygKqa8gmV0zqfOsTeq7CNhDAP6fip9AWojZ4kSBUeYAlcNSRMF7pKDdVdWpTdJ9Rwh
	Scikl1/9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHvr-000wI1-TG; Tue, 27 Apr 2021 07:14:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqj-000vUR-Ny
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rsJi8hKlYDZIitHEEue7CAARFKVfgqG/xoWHcXoMSJA=; b=YbNFGnPw8IduOcwXcICYRsFYah
 CpGY/0rakrFyu86oG+nWZ9sze7khYZzXDjamjeKVvNpYpt8gItH3GcHeAMC6UoR9NYXIm7K4XSKTD
 BfBPhNO15sCEM0VwVu0kdjqb6MPyVy0hgvrUKjaxVKcflaONXkZUdDTJkxHzxLxl2M3B89tfBPPIy
 OieWI798ry1dkMwWnMsr6RxVZo6dUnNS25Qw8H8ndQqx7MhqWc9Sx2SxIJVZ9a5NEofVYczGN9rT3
 7dr/rdcGX3TesWTliMHD9bxV1Q6HJTOkNl5Gq4SzFTSMcHJTKgUDk5R881ejek7d2g6MkNZyvAVBa
 EVAGm0Zg==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqh-00GUh7-7m
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t22so6470465pgu.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsJi8hKlYDZIitHEEue7CAARFKVfgqG/xoWHcXoMSJA=;
 b=fPww58c30w7fFFWPFry3uIBPGKVeQ4kRte1hoI4i3C4D76hozz3e+o3vSpICa+MZc4
 wSzzjDbcbFkjjr1iuRfAj3je10Mw1NPKfm3xKeJaydvxM1mm+n7SB/GV6+rW5HWulvRm
 uyDYE06H4aSTE88u/oxx4vI9cvlIsfM7JQI4AU2UGf3RR5pFrNRcyrtjZv7vggoFe1Bp
 tWnOC549xZK9uUX1ooLnq9jPLjoFLtqpqsC6fRKllojDSWVpQQy28meAgsFTqFtP7Prw
 ZYs3hTizp90JZL0IuD7jQeYzkbbzu7UbS7HIQNahpRFU57PSbR7XU+bmcdW+xz1iYFBP
 n3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsJi8hKlYDZIitHEEue7CAARFKVfgqG/xoWHcXoMSJA=;
 b=ZRyZ04ESQh59uNhGezb4qNvS5i7tjcx93jzCM3jYl9xQj5bw1K/tGld8LKCcIq0Rk+
 /dAznY34P6vDFDkv8Ze7/LICK5XN/qDckPJguSIKaxkvylybZEXPX//ihZXHLcbVcj/D
 Tfj0BnjDry+ukZ9+YsUHhMkWgqXL+rtE4y2e8gKdXWBZMyvG+JcwhC6EuS6810yL3icn
 TIe2scATXfxsFQagPTVEHQjMZEs6BhlTP7ZLorO5+44+lXlV1FKAzoWh2H4zGZuAnjkO
 jkDWCFmU7WzLaQ+Dz+pm3P+n1qsGvlv06RAti3+NmkWE/+r8bodtHJPytD7ZRklzN9+t
 /4qQ==
X-Gm-Message-State: AOAM5319WCirlgIxrxIkCoc62jlaE6SS8oRsaG5WaTAIn9mrDpFW0QDB
 H9tT7DpvEwO2HhSMAAxID8P67bLTUG0=
X-Google-Smtp-Source: ABdhPJxGZR4PfnjCdpYKXyU7ZgIZPra9U0khEidZddUNKSL0hTbl9zsAVLxdm17Y4GDAVGF02IjYUQ==
X-Received: by 2002:aa7:96bb:0:b029:254:e8ed:2897 with SMTP id
 g27-20020aa796bb0000b0290254e8ed2897mr20946626pfk.24.1619507373990; 
 Tue, 27 Apr 2021 00:09:33 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:33 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 5/6] mtd: spi-nor: spansion: Add status check for multi-die
 parts
Date: Tue, 27 Apr 2021 16:09:00 +0900
Message-Id: <565b7e8adf8de81b037dae148a38980b880f844f.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000935_300303_AE70051A 
X-CRM114-Status: GOOD (  17.25  )
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
Changes in v5:
  - No change
  
Changes in v4:
  - Reword 'legacy' to 'default' in function header comments

Changes in v3:
  - New in v3

 drivers/mtd/spi-nor/spansion.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 0eac092f6c95..79d3249ed0aa 100644
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
