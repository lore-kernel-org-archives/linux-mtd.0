Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AFDC76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgtbFElMO95wHWMRlo/FYQqLcsj5dU+lzK+RXqmRYFU=; b=oIHKpNhLawTQPF
	fIXxviaf8PlR2YUE7YIqYqnzlXkJsA0RVZTxyQSrIwHCWnTCQOm0Txo+8XQ0bJ+gYo4BLUG8L4SR1
	TAkTxFaT3mRfn+KoldiLwfS3BQ3JuluaxhSd3bCijmpN6XO9pmHOxUjMBCMrkbKXeprfno4rT+kue
	oIXn3vMjQhVMTma0cDvrwjjdIpFCXiT9xo5cIZ/uONv0jEcs89QQ6KXccjYfi3n0546ug1hpZvvOi
	e/Zn+PgrsmXaSaym49TFhb5z8XdWEQXeweU7ayuBswxK/ONOwd4yaPahm8Q6IhvPwkyMhVICuf5dn
	P6ixrCnM/3p3zb/EzuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIy7-006T5q-1j;
	Thu, 06 Apr 2023 06:19:35 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIy4-006T33-1N
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:19:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id h31so23148434pgl.6
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un0jH+BvXUy8JZS2TFdi6Y5/mRYagcdDM2S4IrcnSzA=;
        b=p03/t9cAz/lkiGNVmkh1Fn7LBHdOG3dMneGhGPcPKyMfLMuCJTkktKtX9GeAb6fiuG
         eyDC9su2XnvY5zSxuaDVHYKYZf/YR7H4fjMkWvyB01WvUSnFBCCDII0970vREkA2Oi6W
         z+b9NXg6gRUpo6iscUrqhKAoB1b+2P05PHOXSV0n7l3N4l8j/hPjrYALnuO7NpP9JUnZ
         JP4S3+P3HMwNAsQ+EO3V15wNAINtJpPyhd0PsagzBQUfcMnf/OiPdN+SsgE8jhOlv1Vb
         YHeRVFXUmb1Hg5EEQNJwVtzyaQVuU3QNXOgAyT6GZX2aEfkLML/tx0ICUCpo1NjJ4GD8
         v6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un0jH+BvXUy8JZS2TFdi6Y5/mRYagcdDM2S4IrcnSzA=;
        b=2D+rMUpd/I96lE/orzEjLwapoFNI4lvlkVQLaP7fN2Wgu5o7M1U/TeKgMzHEzMsx57
         gFuBny5nXPK0kI+be9byEYNwJnniFxOoQru2qn2bDiisURfWW+DHVVDpmzBZojgkFR1c
         N8N49si4oTZFzathkhG4cFOt56aIQJZUwzz7FxpH2I2ONZxDHYA8/RU4OuB0d5lXg+Sn
         1VMQkgOPyGx+VXDubthC6AvoA2cYyyzz3hkYbsDZGBNqWJsOsDCpUkGImte89FSdpvSG
         AkwBxsbac2602AWlMQ165JvR99oxtm58Bo7iIJtaExZqL9lRpCdGIe1kZPqkAyIHyywe
         bYtg==
X-Gm-Message-State: AAQBX9dfEoHvmYr13hofPaMzGHoQtQDPZpVp1ocfqogWz3H15XT/L2Dx
	Nb3It+4sZRlHjLV6hMsMPl8s23MJa2jFwA==
X-Google-Smtp-Source: AKy350b+UKL7QoNMTvfU7rAW2aFEtFkn7+X7GJucXP6ZlZoQ/vUR+SVqGw55LuhiPnCfCwI67xuBBw==
X-Received: by 2002:a05:6a00:c91:b0:626:f690:e745 with SMTP id a17-20020a056a000c9100b00626f690e745mr6189504pfv.6.1680761969431;
        Wed, 05 Apr 2023 23:19:29 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79152000000b0062dbafd2980sm450542pfi.65.2023.04.05.23.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:19:29 -0700 (PDT)
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
Subject: [PATCH v3 3/8] mtd: spi-nor: Extract volatile register offset from SCCR map
Date: Thu,  6 Apr 2023 15:18:54 +0900
Message-Id: <3bf652eb87759e75503afa9ef713586abfc31736.1680749577.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680749577.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231932_461686_23C5092F 
X-CRM114-Status: GOOD (  14.96  )
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

In use of multi-chip devices, we need to access registers in each die for
configuration and status check. The number of dice in the device and
volatile register offsets for each die are essential to iterate register
access ops.

The volatile register offset for the first die resides in the 1st DWORD
of SCCR map. Allocate the table and copy the offset value.

The table may be allocated when the SCCR map for multi-chip is parsed.
Since we cannot assume SCCR parse is always in ahead of SCCR multi-chip,
we need to check if the table is already allocated or not.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h |  4 ++++
 drivers/mtd/spi-nor/sfdp.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index a9e5e091547d..fd61c4793a10 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -352,6 +352,8 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @n_dice:		number of dice in the flash memory.
+ * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -385,6 +387,8 @@ struct spi_nor_flash_parameter {
 	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u8				n_dice;
+	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e184b67f3c9f..9d43e18d3770 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1226,6 +1226,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 static int spi_nor_parse_sccr(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *sccr_header)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1242,6 +1243,18 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
+	/* Address offset for volatile registers (die 0) */
+	if (!params->vreg_offset) {
+		params->vreg_offset = devm_kmalloc(nor->dev, sizeof(*dwords),
+						   GFP_KERNEL);
+		if (!params->vreg_offset) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+	params->vreg_offset[0] = dwords[SFDP_DWORD(1)];
+	params->n_dice = 1;
+
 	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
 		      dwords[SFDP_DWORD(22)]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
