Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94253C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1j71/lZpBg4WEoDPynUJ/IB4keJWR/5IcVh2kACK9CE=; b=zf+y/de6I5Ejzf
	u1mHOh2bk4AAGoy08dnK5l6wlU6oFq+LEhNdZg5vCdahvrIuYE5qumNUqyUX1FYSjyENoryMMm+eD
	nIcD3dPmtLTm+VaPcUSx8KpVwEUs/NHmeS3iGU6NWBCP9kLtN7t7wKcb++NRbV9xGMNDW4KsVgPT8
	F9+k61oSDXQMKrYfmQfnUzYx58v5JrV5yHxztqvcZaWtHZwYH77VQKNkNc1IuEXl5Zwza+nD9QZqf
	Qs0wtgrpjnCfukL47TsiNFpvIZDRrYx4nC0WrpWzImnds19nyTp+yIZYOJsY1lqwJeVMa4Vhg6xgq
	G1L2hSfVyLU06FRDa44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVe-00BmyU-Na; Thu, 21 Apr 2022 06:41:46 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVU-00Bms6-M7
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:38 +0000
Received: by mail-pg1-x530.google.com with SMTP id t4so3867496pgc.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eA9Fy5Z27l80HvEwZeLJ4RtzUIrtM/90b9HA0NlFVU0=;
 b=aDjbFMESTKTEEOIX8WXpYXnnClSHDabS4Kp7pVYFOB6YDtz16s0AwQVka+EdC5e465
 r/vghGMYgjWqE/OA0ligufWNvuNz+040vHEU5amQ2btuTbVexq81J8E6XqckcmSWKPrY
 Dd0Cgtcfzz17uO5/1HxKj0bfKgc9Dw38Bo68s+ugtZOrL7U9SlHH4hRlzL1Wqgl8e0f2
 GAjOh1ZauGaD6DAKV7N/oh937+Gcx0aKlfpuI39ye1YnU0QXCObxcEZRgzTak1TUwOrq
 Sm0WpzqvCoFVURE2/qnmbDz1Sn4YFGsGVg2D51/jas4BGxFvw0T36U2tXOEc/XqAbwPB
 XswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eA9Fy5Z27l80HvEwZeLJ4RtzUIrtM/90b9HA0NlFVU0=;
 b=DwG5cH2M5L9Wz2tbCiGz1o5oj7uSkViItY7lJHJcYhXfpmOth+oD7yN/1zRWpIspEm
 niu/EnbNzsbMTXE8QW1sKzmGS/4GfgOwgDS5ZbO5dg/n/BdweapqSOEO0+A0UHxEXeX3
 io+L5n6vrP09gT8uUALP0X3Rar7sH/IS05sA4umksDq/anRlkSREvdEhWwexNdaZmj/l
 ktimHa3MIodAwG8lM2nQuv6hjKKXuL8zVE06IoXX0OjpkbFawUcN1n9KHiXjni/wlUMb
 R3P255TFCEjRtvY9LeYw7fO4tjcmLb+W4+dVtLvmkIIQA1QiQQFEBz+VlVOmpvfgupIU
 3P8w==
X-Gm-Message-State: AOAM533Np2pMaLEpGGvLUujzzZy4hQBlNclYel4/KexVm+2V/ogSbqZm
 PVfTBkq8PoUM+0dD0kGU7Cy2pb1gqbs=
X-Google-Smtp-Source: ABdhPJxzdQGQfmU91eLyOeWeFexMi+OQtWbIcbFW1wTxxVoFuWfKHuBSuHUftbdI+xScqdykj0bCpQ==
X-Received: by 2002:a63:1117:0:b0:399:2df0:7fb9 with SMTP id
 g23-20020a631117000000b003992df07fb9mr23407411pgl.40.1650523292979; 
 Wed, 20 Apr 2022 23:41:32 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:32 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 4/6] mtd: spi-nor: spansion: Add support for volatile QE
 bit
Date: Thu, 21 Apr 2022 15:40:54 +0900
Message-Id: <61f548acb4ea6924b91e44925e770934180b4323.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234136_750808_20BD500A 
X-CRM114-Status: GOOD (  17.84  )
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

Some of Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Changes in v12:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
  - Use macro directly instead of local variable
  - Use nor->reg_proto instead of SNOR_PROTO_1_1_1
    
Changes in v11:
  - Rebase on top of Tudor's series
    https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
  
Changes in v10:
  - Remove dependencies on other series
  
Changes in v9:
  - Rename function per mwalle's series
  
Changes in v8:
  - Use spi_nor_read/write_reg() functions
  - Use nor->bouncebuf instead of a variable on stack
  
Changes in v7:
  - Add missing macro definitions in v6
  
Changes in v6:
  - Remove multi die package support

Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - Add multi-die package parts support

 drivers/mtd/spi-nor/spansion.c | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c8abe46e63fe..dce5fe7498b1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -16,6 +16,8 @@
 #define CYPRESS_NOR_OP_WR_ANY_REG	0x71	/* Write any register */
 #define CYPRESS_NOR_OP_RD_FAST		0xee
 
+#define CYPRESS_NOR_REG_CFR1V			0x00800002
+#define CYPRESS_NOR_REG_CFR1V_QUAD_EN		BIT(1)	/* Quad Enable */
 #define CYPRESS_NOR_REG_CFR2V			0x00800003
 #define CYPRESS_NOR_REG_CFR2V_MEMLAT_11_24	0xb
 #define CYPRESS_NOR_REG_CFR3V			0x00800004
@@ -114,6 +116,66 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
+ *                                      register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
+					  CYPRESS_NOR_REG_CFR1V,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & CYPRESS_NOR_REG_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	nor->bouncebuf[0] |= CYPRESS_NOR_REG_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width,
+					  CYPRESS_NOR_REG_CFR1V, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
+					  CYPRESS_NOR_REG_CFR1V,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
