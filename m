Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11C6C7EE43
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KCvKX18k6iKUvZSSvHn22v2ZY8gbqlChFdXo6lFB3w=; b=cIhxTfAqRx9GGY
	OgVoSxL/CF0N4VWHDgX7T/5jMMHxEbj2wrZ8Wgnu9j2ZhW+fHNkUghE7g4FR0WWzLw1LVaPqfF/TN
	ncO6ypwtSyc3NhFESCLn7ehKlgTygd1GO8DPvN1DGnrq9/kaaH6v0C440ZyINSyLaZxc3aAaa47MD
	L8AiFOHq6RHLNpt4h/I06bXWSAVUqbE/zKahTeILuaii+0trei6xQ0ayTRiavueLOGdYU4fp8k5lt
	fVF00WOqcrfBad1tWMEhc/iyW5VAbEzUs6XVP5Y8d9BMT/V8BrmbokFactahF2GMX3zIAvt7hcSWq
	Tih7snxZJQKR6IvYRjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePe-003QGk-1r;
	Mon, 12 Jun 2023 10:04:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ePc-003QFR-1Q
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 10:04:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-652328c18d5so3112238b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564274; x=1689156274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0VY0Q3ApyLxdpEDzILGqzd2oQcIxU2jFNLg6s5sntM=;
        b=FHM/3MaciLF7PBJkC0YSctJxq6oQ4DCE98r/ko0iF9WXnPjMRZai7eOKEQU4xGG9Zs
         M45npj6SBvjE9usRpW/cqGXbFyYjNMOuy/M2XSSZUfYq4Mn7XjrCub9+AeI8aG6LLXij
         FMRbFyZkuqkNxl6zHiuUSGoEr/apW9ykjHUbvY4IBtxnjJD1kGIok+sHlAB9tsnZV/HU
         xoqhgAKMZKbqZJkY6NtwH/BqOtn55KuWa1kqIF+fSfvLi42x3xY8vrJhuxL6+Vj7K84G
         2XyjbaHSxzS+CpHzeKlLm4jq7fgoAp7uWDxgoqfAQL2tZEizqFT+hOaC6RYgCM50tMDL
         KFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564274; x=1689156274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0VY0Q3ApyLxdpEDzILGqzd2oQcIxU2jFNLg6s5sntM=;
        b=TX6QDgbEEukdL+kqU1ck1ogcjxhU36p4E+WXstrMCGKUcxaKIN7h3A9tLP1IOgx4EJ
         NsRV5gwbRTgIRPwajUodSQqzTntfXMgGyCDIAUpbcC7Xroxw+4M5yF7xpuhG2wOTT2ev
         JrYW2ygMomuqYtUTqMkriLO8B3WdiS/XklDBLH1P91LUPJ2am1BHWdrt4GFhEKK5x/xS
         6lrvDr0zboaJZ0zQdcm+wtKWYGPd0WLWk3+QxxffPJd4e00ZfyL7DxwPmfeyRHuqaz5B
         15gyiUNlgsVLCfkSJuaraFp7uVPiqbk6pzwM1qxl2qpBGcid1cMzzicswqKHDCxEphY9
         9wpw==
X-Gm-Message-State: AC+VfDx2jJGW/J23U+O8AlfcahxkyxhS8KEu0jKDXk/WvQLxPiBoGdV3
	3T1nkqgToIzuf3QEJ/Bq4NYOexSvai0=
X-Google-Smtp-Source: ACHHUZ7TEN4loybZyX3QyPSzRRQQ3AMVpukZNADpZz5u0fwFg1RN3L2Xl+tuS7Bx7Cof7VS8p/tlTQ==
X-Received: by 2002:a05:6a00:2d88:b0:652:bf4c:b5de with SMTP id fb8-20020a056a002d8800b00652bf4cb5demr9509909pfb.20.1686564274449;
        Mon, 12 Jun 2023 03:04:34 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79211000000b00662610cf7a8sm6723376pfo.172.2023.06.12.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:04:34 -0700 (PDT)
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
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] mtd: spi-nor: spansion: Preserve CFR2V[7] when writing MEMLAT
Date: Mon, 12 Jun 2023 19:04:05 +0900
Message-Id: <15d87d29e53945739e7c2b3f58e2f623e2a77f08.1686557139.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030436_486460_491F2961 
X-CRM114-Status: GOOD (  11.67  )
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

CFR2V[7] is assigned to Flash's address mode (3- or 4-ybte) and must not
be changed when writing MEMLAT (CFR2V[3:0]). CFR2V must be read first,
modified only CFR2V[3:0], then written back.

Fixes: c3266af101f2 ("mtd: spi-nor: spansion: add support for Cypress Semper flash")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/spansion.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f2f4bc060f5e..7804be3a9f2a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -27,6 +27,7 @@
 #define SPINOR_REG_CYPRESS_CFR2			0x3
 #define SPINOR_REG_CYPRESS_CFR2V					\
 	(SPINOR_REG_CYPRESS_VREG + SPINOR_REG_CYPRESS_CFR2)
+#define SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK	GENMASK(3, 0)
 #define SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR2_ADRBYT		BIT(7)
 #define SPINOR_REG_CYPRESS_CFR3			0x4
@@ -162,8 +163,17 @@ static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 	int ret;
 	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
 
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_CFR2V, 0, buf);
+
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
 	/* Use 24 dummy cycles for memory array reads. */
-	*buf = SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
+	*buf &= ~SPINOR_REG_CYPRESS_CFR2_MEMLAT_MASK;
+	*buf |= SPINOR_REG_CYPRESS_CFR2_MEMLAT_11_24;
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_CFR2V, 1, buf);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
