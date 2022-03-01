Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9068FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 05:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+raCKRAVp8tMSDvzPFS+Vpk/+uuQvrUo/DGG+Q8ghI=; b=m47ARGi2aCocpz
	k0iA/p+SxQf0Q2tFJDiO/hs18W8l/02+S6DSZKvzoAmQnqF7MGSV83C6s6ZMSdxp/8Rdxhee0VYAi
	83TMwEKYIHCZvreoCeAg3PfClssn7GM3NqMfNF0YZdXKJeIBVoZf9hFdZCcQftVHZzrWulBdq88sR
	ywPTLGBUiVAhsLsm9W1qbERLFfCfJaSPYmfCFmTbh7uUypMEkpDCgaLC9hTSQ5ZztsIIBSEMUFzk5
	Voplm1UpsbdClpzVHMiCAwd8V3G55LvEY8socAX4K+fQZ2l2Bi5KtxtVcTgOrGgy6ehzVBO4FT/lM
	oSGf3czVlezX+duejllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOuy8-00EyX8-B3; Tue, 01 Mar 2022 05:22:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOuxv-00EyUA-G6
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 05:22:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id c1so13478773pgk.11
 for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2022 21:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDy7qIGdFlTeRg2l+WTK+X0KhSsHav50gOkgVrtS4x4=;
 b=j/gxOf3ohdeaDPEx0mfULMf4QrFhC3966GRsVxYtkMOKR7pSuVaN/aMc9vCq0G5k1k
 1e8GAQoDWKQnQ9d6wc7EOUkI0VHHjXEsuDt9kB07vztcPFs4i9EsnV2a4lOXu0bdjw+t
 lRvwFfoJ/Z3cSPmMgzPYUBfNNe6VfpmkNzcpUk1u4MUO+R5iTTJKLmtWf3xYwCKKx6wc
 gnwzuCp+NPqL6NLHfLanaTHwuAo8Vcjl0wMxz2Kc7ewRx0nowq3dvr5CoYMiiwkBnnCC
 LsErwHPaZn09gIZr90xTJy4uy7mvK+Fvtyv4Ryp4FoD3OKbfjQY6N3frJE9je1YnuiXL
 ZsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDy7qIGdFlTeRg2l+WTK+X0KhSsHav50gOkgVrtS4x4=;
 b=Q67kq1P34ksGN+PXtcL078imiJ0ovZ5eLkjzLZW2OlPOkP5w3R4b1Wo+dCdmKkXsZS
 bP4aku+gYd/781U7moKhdAuyfdPFJgl3VL0ADORweMofkm+KhCKMmKrH2hOo69w/QBaG
 iASHX0Frd4EyENEZTLtGbkhluKul/4wuQRN7RrgImE9fkGS2As9mLYbyDw+6A86OX9/t
 EReqM6jru+lxDOTZUbZwyORehhWubP7fFV3O7yFu0E8jTLoHP0/wdJbNwc7Foybjwd+S
 cFmyFZu7slYH6Cc1fAdB0KdbuwhtLPv1+8U7cnTTWjPTUmL9wQ+IrPYbinb29Uzm9BzL
 UyTw==
X-Gm-Message-State: AOAM533OByIcb45tXb5/rSOzxcaOxXamfBA520iUx+hXSx1BNnbSMREx
 ns8Yw4eIqVYh+Ym59vng7LTiwjXHtZw=
X-Google-Smtp-Source: ABdhPJxOSIog9RiyPad1qwfZTLg84ZFGCrMNhb7P3Eo6I/xrRk0gXR70dB0xx4GdWLNboyQCUUdW4A==
X-Received: by 2002:aa7:94a3:0:b0:4e0:1c98:1e3b with SMTP id
 a3-20020aa794a3000000b004e01c981e3bmr25525688pfl.72.1646112146444; 
 Mon, 28 Feb 2022 21:22:26 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm11433111pgj.21.2022.02.28.21.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 21:22:26 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v9 1/3] mtd: spi-nor: spansion: Add support for Read Any
 Register
Date: Tue,  1 Mar 2022 14:21:53 +0900
Message-Id: <066371acaad87cb90b5c1e598f608132fc94ef1a.1646109817.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
References: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_212227_562799_7548ADAE 
X-CRM114-Status: GOOD (  13.12  )
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

The Read Any Register instruction (65h) is followed by register address
and dummy cycles, then the selected register byte is returned. This patch
adds a spi_mem_op template for that.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Change in v9:
  - Rename macro per mwalle's series
  - Rely on https://patchwork.ozlabs.org/project/linux-mtd/patch/20220228111712.111737-7-tudor.ambarus@microchip.com/

Changes in v8:
  - Remove controller_ops
  - Remove spansion_read/write_any_reg()
  - Add spi_mem_op macro for Read Any Register
  
Changes in v7:
  - No change

Changes in v6:
  - Add helper functions for controller_ops
  - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
  - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
    function header comment

Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()

Changes in v4:
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  
Changes in v3:
  - Cleanup implementation

 drivers/mtd/spi-nor/spansion.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 34ca3538a0f9..ba0f79bfe859 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -24,6 +24,11 @@
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /* Cypress SPI NOR flash operations. */
+#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ndummy, ndata, buf)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DATA_IN(ndata, buf, 0))
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
