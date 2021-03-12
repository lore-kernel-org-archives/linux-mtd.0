Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69729C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:46:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E3D64F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E3D64F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m17OAUxHF9Af4YUG+uNdQY5umW1BZHCls3ya08WY+t8=; b=jD9ik4QhIAqMwQw9/GG6BjQMp
	2rHF4Q3tboBMjX8ZXzxZJhIMtvzeb3lMWDD+FjHlS2WZKuh426SIFhLQuhGfrP7zXP3h4P4V5FpHZ
	2uuzUOBx1TJBTC4uj4x7GJYCobMacml6UPqyBEdLzqnZ/VbSyRmfAO2AlKUAPChQc4Dl5/XALLp13
	qjWDl3YINxI04X4cwP1MjLq9a9H0eb4B9/ocmGQqZMayZT48H8zKbeWWGELsiRJNaUMHAKUgpoeUT
	0YYiKFNX6HrcvM0BFOvqO0yujI6NLfPYYT+kl9LI76Ef3x57sYQa4grHatd6J8l2gttUtMZ6IAbGw
	/VGAuSCQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeMR-00B3st-Bb; Fri, 12 Mar 2021 09:45:35 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeM4-00B3nc-BR
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:45:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3026166pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NTULoEO6jG4Ps2W9q3zfN0YZgKAhI73Diw5Zc1QScXg=;
 b=oDShGEbLsKB6R6aaU51HGTcoQKZrkk2JSiQetLhazqg15sCwzpxBFn0nHKm6oodXJC
 Kc+PcCX+mE1F13q5QIke13+pahP8lNML/FGXiHhbg3oGnAUITDcp86t4h8tfoKe1jI+o
 bgjb4s/HBiTjg9YgxcNcMoyLG30n41fsPkz6Vy4tb6drAoy2y+dOhkv1v5K91wi76wg6
 Wx7R1Mbq8At1AXFYAM4mQ4rwb0ZhBC5AZtEhvmNgrnsw3HS4Av7XmFbDTwnlagUebyGf
 FXBnwo68gjPxiYyQ85RuQ8vvmbb5knOxVS/JQfWuQ8NH8tpHJBLisUfpFu+cFTKdmql1
 KcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NTULoEO6jG4Ps2W9q3zfN0YZgKAhI73Diw5Zc1QScXg=;
 b=EAnAsd+y06pDPiOv0lKMmBAiaF2A7an+Y7Dt9WCuBWZ+EkMpyOhyY/O1kyCb1pSvXV
 8BU6swCObmIvNDk/GYNtsS9Qo+vn2vMfHjoQW1k7/+txTbdPiA7+JH1/SxnyCiJYCXg8
 shWTk5Od7G5jFvgchP3YSVuIB64NKsnAWsfwq47tF2WMJgSoZwnvhmOXioudEWmW6ilE
 skfL+eQJYzyDKIgJL+JGK6s2sOMLLb7HYkLXP5WrwU4NHfHCynafwxCXWsytgfPWJ/Bv
 O04Fl3iQxbHgSGcVI86s15txVFH8LQ51kl8uPvwCkhwmCqBH/48cUzrsPER9LztznCyh
 96UQ==
X-Gm-Message-State: AOAM533U9FOUyt7oRIKkXQNhW9JfU3KpAJ3lKCSenjU3dUsv/CFiRDBY
 oaZ8X2PoowxM5dFyc6PrIo6P039vmKlOKQ==
X-Google-Smtp-Source: ABdhPJzWqGjAgaNwvf4/WiMeCiYCRPGvNoWohvJK34HZc+aRKl/JsRb3vvbPa5mIStgiEYn0bafZxA==
X-Received: by 2002:a17:902:8604:b029:e6:60ad:6921 with SMTP id
 f4-20020a1709028604b02900e660ad6921mr11087783plo.15.1615542310680; 
 Fri, 12 Mar 2021 01:45:10 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s15sm4867039pfe.108.2021.03.12.01.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:45:10 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 5/6] mtd: spi-nor: spansion: Add status check for multi-die
 parts
Date: Fri, 12 Mar 2021 18:44:58 +0900
Message-Id: <1fa9ac4c5f3d66dea51549458a1d32823b06bb10.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094512_668933_762E6010 
X-CRM114-Status: GOOD (  16.18  )
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
---
Changes in v3:
  - New in v3

 drivers/mtd/spi-nor/spansion.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b5b5df4836c6..5742212fde2e 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,6 +10,7 @@
 
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_STR1V		0x00800000
 #define SPINOR_REG_CYPRESS_CFR1V		0x00800002
 #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -179,6 +180,51 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy,
 	return 0;
 }
 
+/**
+ * spansion_mdp_ready() - Query the Status Register via Read Any Register
+ *                        command for multi-die package parts that do not
+ *                        support legacy RDSR(05h)
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
