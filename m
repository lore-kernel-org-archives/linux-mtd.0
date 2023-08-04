Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D7C04E69
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2WTNmW1+1A0vy27dHsYe7TWXIk8rRgVGa0zlUZ38xg=; b=gw8//FJkfBT67F
	Ws/gHD/KzV/qf4SAp6mqq12lRXNTxPap1IaeTdEc9OUSmGz6acFeBXFbK7By7/dh3jqye1cdWxvYz
	JidSsSbFUsXPsSnAzGMx6MniU3/LwzJiAOddyID25t5xfifJ+7gHk4OQ6LIkpNb92StLgcXSYgxBK
	z8ximKcBc31POwEAzZiVO+L1CvgvRFsZiamJtedXJuCZBCw6v/JYUOa4sdiDXprvIpDVCa52JbX4v
	OPo13TzEzuFT1A1ufb/s/iQUOhzTDuZSXhAksfaISmuQ6na345T321QeEN3JW2nAwDNPBpl/cdxwp
	+MmSlZNO08GqFb1MgUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWT-00C493-19;
	Fri, 04 Aug 2023 09:55:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrWO-00C45Y-2q
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 09:55:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc0d39b52cso12989275ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2023 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691142897; x=1691747697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t+Uj9ERXCfcFiUtSV8wHP7g+imdDsj0ohqCPF61vEE=;
        b=EgCKjJHir+RebOIlM2oGVM+uzT7W1McBgA+DCYBl3/D/kX4lWjS3wwZikdOpoDT6ir
         5jsMP6ojOa6NLhlZ72DDxsxQ2J1FY0VNuf/GNqCpYEh6F7KYGyJfv0w2/KPLxTpBPRQC
         CTBt0l3qAsYbqygpT3CMLTXU7WbQH/J8tEJD1AXxEjqN7e5GJcbNCUFq6WwuIlPQIKbX
         XrTvpxkVdSONBU0XL3NA6kRjN5Oge3i3zGmoQrjqd0OWDx6GPJmoJCJZQLREOi9ZPrzu
         hpLE6fM4qGNHqCt04EH/1EhFLFVyxeC+GEyNHskSUxFlvWha+6Nz9uUNePIm5GeYFNA8
         8c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691142897; x=1691747697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t+Uj9ERXCfcFiUtSV8wHP7g+imdDsj0ohqCPF61vEE=;
        b=VIjqMkN0K4DXJslUHxp71PAry2mdHCYDF1ZuXQ0HwlUbgqbtZ1O4Q07lwQmkMbCp/O
         t45+xlInmaKOol6Vd4I2mE8LsHNvfx6Aj5Af0ylWzty5ljAZeNXM1KhzdZuuuf6tsHDm
         Dy+KoTbw8m80j8f3/v/ZXFATdtQfYyvGfgcTih8To3KpCZfA3/v6ydOWmBIxcoEh9Usp
         KBxzN3XzxF1ZzL6cLZSNhvd87xaHizMtF/wA93fkxHB19pbCCqT5ulFvdoROaa8emvdB
         bIa/ZjbJL9nsfECCiSbubYP4uzfNEUxzHfjpU2KJBWIWQfoXDJ6dRMP+wl58H22aMpFl
         +Ejg==
X-Gm-Message-State: AOJu0YyKHci5MLkLhHQxLo4MYYB5jVmrLYoJjL/BKTunJIQadE6qpDFw
	/bAA4kSJHJYLaLq3UevqBK4=
X-Google-Smtp-Source: AGHT+IF+whYWqJFdFzFh21RMRtJwvDAyl0cuvhadZpZfp6o4tpsP/7itrTwc/lVoNFSvkkfAZQparg==
X-Received: by 2002:a17:903:2015:b0:1b8:918d:ac48 with SMTP id s21-20020a170903201500b001b8918dac48mr626486pla.56.1691142897198;
        Fri, 04 Aug 2023 02:54:57 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001bc21222e34sm1327881plg.285.2023.08.04.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:54:56 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id DB11A80606;
	Fri,  4 Aug 2023 17:53:44 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v3 5/5] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Fri,  4 Aug 2023 17:54:09 +0800
Message-Id: <20230804095409.278419-6-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025500_915929_DE17368B 
X-CRM114-Status: GOOD (  11.53  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..2241207556bf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -650,6 +650,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_DTR_SWAB16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..eba760941d43 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -123,6 +123,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31) /* Byte order of 16-bit words in 8D-8D-8D mode */
 
 struct sfdp_parameter_header {
 	u8		id_lsb;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
