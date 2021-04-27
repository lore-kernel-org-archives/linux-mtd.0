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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FA3C43460
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:11:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C07C6112F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C07C6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mvyj4YIm8L20Cjn3LOHuTd1PxCECBBrG/6hkjcu1GPs=; b=eBqcWYdbsVaxgGKPDKTWu/YE4
	hxXhFxv4lZzBtmUjccnazcnRy1VcJNVBlA8+kL83sSUNOGk4nGSU0Da3enzqHWB9kT2N1qDVCAesa
	AlCPlxAoglWB1xwV8ui6diqft0qeXb2oMNF+z0KT1GB4caiaNJbXhFVld7LA7l6uzbB1dFHm31cSc
	cABvEStpTIUBkrMkaygMMtgt2ExTGJbFDN/uGy9bpkiGlEXKmdBsCbskN5M41lp5edtRmuiX4jhba
	QFpMaUmnPJxkO8Jxe91QTTQDzkFRadwpZINDJhUa5RPNSzVA6PsUFqPwEsaJiGQjQgPowBv+9GZzr
	CHsypRB2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHsG-000vkx-BN; Tue, 27 Apr 2021 07:11:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqa-000vSm-If
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6X6cQuI6AS/vcnXCbALDKX3RnEEMroVHSFoATv+sePw=; b=sPf8v37EFmsnsnquNd2yQ9lOxz
 IyrpKlToAONyXJ0HXZEXQN21X0FNCBZJduK/qfn5nJfTx3sBCckGdcsl22eZzZLHvsXLpCHKesrG2
 XGX5aL8JIcotwB5bwl6l8e8eTKAcYQ2bphCk5DVEl3vmmJmbepu3j0gBseTPzn/RCrXkFZyy9xa16
 ZI0tSnU0MUk0683XXfFTr7JiTzikdhpCeu/Vk7OAIViDSw/XjZa4s4HQuQq7CguZVlXCBR1A5ID4g
 ELRtaaGOMPdSd8OhupXNLVKxIkKNgQ2s5dp456k+QusmT5pQoAAezufNBNgME7ZJgnRzp17Kq4BKR
 aimVtXRg==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqY-00GUgD-3V
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id p17so4448459plf.12
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6X6cQuI6AS/vcnXCbALDKX3RnEEMroVHSFoATv+sePw=;
 b=dMTroffxqXz028CHfQvj7IsjVXF1pE5KTTZmzHHbaP4MAs2jtonh+yC+Qu0zkvekhE
 Jgh0Ea/10a8y77OfZhWizw5A1dxSSYF/NDCYdJeMGo7YxqedvQqwfxPS4zcnh6ugNgUG
 NaT884VT8DyGgpgKtPuevcBC4hfUG9/OXyblPdKqqlb59Zyv1E4u1gYZPoaB5gTBVgfH
 Rey37USapN3U2o5W45lVZYRw4jZnJDBFxqjzBwU5kaLLmZRpOCV67VPgN5rT0d9nHzwl
 cIK6ksqphEncpshe/Zx64fmZtS8hlUyMD/CNQQ0lu896AEFfaKezTmC0Vuv/p+7Qgi/J
 Y1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6X6cQuI6AS/vcnXCbALDKX3RnEEMroVHSFoATv+sePw=;
 b=GNz5AvsetCW6OWETcaiM5e1mqeE8+x5U3vSojQi1Nev/pCOR8BfgTwrzgerKqKvdNp
 PBozLTKu3HJqpNQioHWNi1IIGH/wgKHLDsFD4IkqxgZnOw+ndsJK8nEyuCeZ1QQ2GSng
 YJeDpsqRReIq2MmWRjzL40yCpVZVts41gW1N05gqJN6KlnKBH61GlfNPXZBBSdGRpsQN
 lb6hbG1XQA8JHNBMtIBBJlnIvaRxmFio2LpmgzFmEdN6V2lhgSA3N2YXEmXYQe3doiDM
 o6vKq8z5DEAqKLbsYGQhSyMFbmv1kDfEQ4CeLfX8iPBlbx2II5dLo6imI3RQGR1g32pW
 VI/w==
X-Gm-Message-State: AOAM533s38XnQmKLOMTOTUq38iEA1IRTiUewRUD0aurZ1ykB67Xrc4Nr
 gaGtX0raYi3mpciYnJBIxY3xQZj+pck=
X-Google-Smtp-Source: ABdhPJyevKjayBAXFjWcE+lOAvJ2pFPmmO/FHohN2WeTm1CG/uknKg8ocuBXGn6C5DJQh7PGsAbxqQ==
X-Received: by 2002:a17:903:310a:b029:ed:2b66:107d with SMTP id
 w10-20020a170903310ab02900ed2b66107dmr9826949plc.12.1619507364073; 
 Tue, 27 Apr 2021 00:09:24 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:23 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 2/6] mtd: spi-nor: core: Expose spi_nor_clear_sr() to
 manufacturer drivers
Date: Tue, 27 Apr 2021 16:08:57 +0900
Message-Id: <e5d04a13796da4d2206bb9a044c3709be32d643e.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000926_165597_6DBFD42D 
X-CRM114-Status: GOOD (  11.93  )
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

spi_nor_clear_sr() needs to be called from manufacturer drivers that
implement the ->ready().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v5:
  - No change
  
Changes in v4:
  - No change
  
Changes in v3:
  - New in v3

 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5de72322ae32..7ab0225473e1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -653,7 +653,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
  * spi_nor_clear_sr() - Clear the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+void spi_nor_clear_sr(struct spi_nor *nor)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4d06c27630fe..596480aef924 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -447,6 +447,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 
+void spi_nor_clear_sr(struct spi_nor *nor);
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
