Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1366C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CsaE68+yznXOVZt1BndOZYhECY17EHvSLhIwW8wEWSw=; b=pYUvV2dyxpaROv
	TJufKB4mN2UkXCfY6Zt60uCDh62crFx5fyHneq0ugrlm0J/0Eic/oLpPIvr8bsUt4EduWCFlqtvZD
	QFgBzzOzxlHC48+g/Ng8TPqNHZBTdyprW0kEZdNkvS19s5hpZzYcebuGWGciz6PkOOXGkDAwY6Vad
	p9jJbdRMuM5TOQfpVyZ6SMX7Jo2SqJVBHGKjNwr4JsL2k+/bojggBqemlm6HsyNNZtHH/JDTJDI/H
	JFOblaQNrr+4dFaMOntJC/yDEusJqXW/Q8TIpSWz4SZJZH8a0z6HBEf9zYE07NPA6z02ziXavAOrL
	9RNUyBtJ/O6wr7icThTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyp1-00000000JcC-3usk;
	Wed, 20 Mar 2024 16:29:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyoz-00000000JbA-0vdm
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 16:29:46 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so604071fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2024 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710952183; x=1711556983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSz7fQzVFVXAFxgeYQXEQZk+nVYjVrCMtbK7Jhjtun0=;
        b=UcN06aahmVPODfPc3cGpkP3o1crnAK+Iz309fOFd//HnL4P/fmIW9v9vNQtCr06Dnx
         uY/2A5B2qyCH/7R2WBkA40TKozd+YZQTR9WvZslZv4D4w02MCmjP2QFtwRsCbgv3MziK
         vXGWDmMxeiKjth+Kpt4Lou5Vxxh7pDbAtxlWBu0q4ORPgrqphfLrMPnbH0n7uOd2DoBj
         VrejXbVz9QHDqDMLbnzepyD1iE4eNPEoL0Yj/0bLHMZCfl0Vi/nyk1vhSppHk8W8dIGd
         4Xd3AiEyDhZ+uFJGG8DYEDaaP2hoEmDcwUrk3oLo48n4wh0ZDIX65ZCoi60P7umqNXI9
         V7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710952183; x=1711556983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSz7fQzVFVXAFxgeYQXEQZk+nVYjVrCMtbK7Jhjtun0=;
        b=ZMf4+7TI5iRf0Ts5+HqpKCjNAUVk1Jsz2D/AN2YMi3RuTi/V/+x6LnHOPad9rbg0xo
         1texb5vOEitA4MAw3eb0DPGin2S6L8TMcRB9ILawKixkkN+P3EnVL1xA1EcNDLW+Z7Aa
         gzP+aG3s1tiXbhhP+h4Vug2GAbEnz/CHR4DyZFAeiUgL5cD/7xuh8JZatUGef5OLd/ui
         mSm7dtW6rtou0A9ZM7F2sykaxAYvbaO6A79EwXC7GcZiphzT8Dnd1jK6v3uXiYc5t8f3
         2FxJ/pae3+fO+FXIsWdogf5ATYUiNAkSYr9M8T88vDvIXMl9yAcQRwwB4dYcKKoOq2th
         77/w==
X-Forwarded-Encrypted: i=1; AJvYcCUSBHCy8HfSQvVsO8VttZP6HMxtx2DWjPoDX5AGBi6cttNtt3B2gSO6S/+XnpWoRcWL1oC0Gc3LlYh5QfNCsPrvcB6dOCHvr1PxRNASKg==
X-Gm-Message-State: AOJu0YzZjhouz2XN9lI+sPnRm1ff7ASgqeD3mfjIPSiVHwq2GKbnkybQ
	aSUfqmTC1FRkk+SNAJgPxQAhYCAAzdtG44GRZnrQtqJqzvEnoLHF
X-Google-Smtp-Source: AGHT+IGrXcBnTFuQK24EEr9sarEyN5j7+SUWW/AjM5t6F29uCnPCJezOmOuBx2kavAu6gDq7MHe+NA==
X-Received: by 2002:ac2:5f9a:0:b0:513:5fb0:c5ad with SMTP id r26-20020ac25f9a000000b005135fb0c5admr12638319lfe.17.1710952182786;
        Wed, 20 Mar 2024 09:29:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id fc18-20020a05600c525200b00414105c4cd9sm2692710wmb.21.2024.03.20.09.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:29:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: limit OTP NVMEM Cell parse to non Nand devices
Date: Wed, 20 Mar 2024 17:29:25 +0100
Message-ID: <20240320162927.5015-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_092945_284930_90897C46 
X-CRM114-Status: GOOD (  15.43  )
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

MTD OTP logic is very fragile and can be problematic with some specific
kind of devices.

NVMEM across the years had various iteration on how Cells could be
declared in DT and MTD OTP probably was left behind and
add_legacy_fixed_of_cells was enabled without thinking of the consequences.

That option enables NVMEM to scan the provided of_node and treat each
child as a NVMEM Cell, this was to support legacy NVMEM implementation
and don't cause regression.

This is problematic if we have devices like Nand where the OTP is
triggered by setting a special mode in the flash. In this context real
partitions declared in the Nand node are registered as OTP Cells and
this cause probe fail with -EINVAL error.

This was never notice due to the fact that till now, no Nand supported
the OTP feature. With commit e87161321a40 ("mtd: rawnand: macronix: OTP
access for MX30LFxG18AC") this changed and coincidentally this Nand is
used on an FritzBox 7530 supported on OpenWrt.

Alternative and more robust way to declare OTP Cells are already
prossible by using the fixed-layout node or by declaring a child node
with the compatible set to "otp-user" or "otp-factory".

To fix this and limit any regression with other MTD that makes use of
declaring OTP as direct child of the dev node, disable
add_legacy_fixed_of_cells if we have a node called nand since it's the
standard property name to identify Nand devices attached to a Nand
Controller.

With the following logic, the OTP NVMEM entry is correctly created with
no Cells and the MTD Nand is correctly probed and partitions are
correctly exposed.

Fixes: 2cc3b37f5b6d ("nvmem: add explicit config option to read old syntax fixed OF cells")
Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5887feb347a4..6872477a5129 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -900,7 +900,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
 	config.owner = THIS_MODULE;
-	config.add_legacy_fixed_of_cells = true;
+	config.add_legacy_fixed_of_cells = !of_node_name_eq(mtd->dev.of_node, "nand");
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
 	config.ignore_wp = true;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
