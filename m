Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3208AC4828E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THxrqkuPRX9pB1335z9hE2afyci+d0gxoaY7uupxuAM=; b=aBz+M36s9Kgx6Y
	k3094UFk5K4nIcJHzkqcJstkg72F4AXCcR3l7OkrPukd2SVaczvLXyPMhTn2h57pmhY3x+df66s0w
	gulktloLARG8hOWimmpsm38ZVj+W+bXo3vaJbwkU0GWBVvofccA1Eyb6xal1S13VGVGIKt37JFBMh
	VUe+gnXL5LJ47k/1nmqRCclPnb/cXTrgSF6i1XnTOxQFDOpmGpmqvorRUo/+qLl28Hv7wMNaU5DZq
	QeOo/lEAyP+iHhPokPJRE5Uciv2ULbky+72SaEz082qxieveJGczx3NuOTs7jK0XPslA33uXYR8N8
	EioDFcKI2XCO8Egspt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc9-00000007K7Q-3ng2;
	Thu, 01 Feb 2024 09:44:09 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc3-00000007K3U-48gh
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:05 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so518658a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780642; x=1707385442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX3qCR87ShJzSFEO09hnM6Dt1AniELSDas/gjVmTSx4=;
        b=hwhfguDRIlNZd1awRDZNZmONIEtt2UrPMoHj6HhkdmIKs/9ww8KDSjuo1tzZoNhNZh
         ZKB1Hl9E/6tKkV7PYLmR/JsG1bDDp9jAvH4Osnx1l4RmBl7lLcKU44dzU7nbKrMFxoKQ
         pvZ9/TXJyxgWHscjylDgYlptAc5tytUrh/NK2Sbzdb7mMMJIlUK0AiKCSI+Hgn20KxKn
         2V49ei8hw6n9CtFAsHqwD4F3fK/sDNx9m6XBsYtD5KFy8oayy/Xht7sFDyFrbxyLMmVB
         Sgcu7MrVNVvzJ45FZ25+q8K7hs8Wm5RWmoGAnYRz/pMaEqrmOKld0dV6l+69R2R+d4/v
         mvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780642; x=1707385442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX3qCR87ShJzSFEO09hnM6Dt1AniELSDas/gjVmTSx4=;
        b=uzdlQ924JStteUk2eUsg8vXcxqw2l5cS6Qm20nMDoSDZ+WT//X0jKqLEsLfImmitE/
         grQJKWpP9zlmkoDT0+IujHpG7wNbxBBi+VEQyUlbD26gIgobUueJWNYgz+vjddhB+9Nl
         2IZrWa7Val8bI0kW355Fc0qd0yN8YV2hvZ4LskyoyNp7yjZE6cufAZsPUdMdGiP4y2Vr
         awHqm7JKr9YiZ3Bcyh8eCvDwINHFy1chQZ1hkBrB3IV4ag8W4q+2DkFiaXpscsv/4wBk
         +0y+bk8FKxWsllMY/Sfd7hqw6mhEb5SDw1WuqyphNsqxkNlbAV+Z2+064V+t0J4DY29O
         bcug==
X-Gm-Message-State: AOJu0YzJDJAm/mxahTZsWX/KsB48w/U9wlmVIgwi7+O/sGHT9xbcTq9I
	du1RMA1EWV5eWa0xgg3d/oM8Prxqb9H0hNtEdM0tG5vq4deeTP/D4e8wn1SR
X-Google-Smtp-Source: AGHT+IHn1cT1IA4UY+ilMQdMTmlRHMLizfmhuyhI8NCRHCr1Z7VCKuSQs1oa+Laz4dcyQiIuwm4+tw==
X-Received: by 2002:a05:6a20:2e14:b0:19c:a2ef:c45e with SMTP id be20-20020a056a202e1400b0019ca2efc45emr3561671pzb.37.1706780642211;
        Thu, 01 Feb 2024 01:44:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUAqFSeWY9NRe8ii0n+H9c4ZKRI+H1HS/lD5djRBbkC75t3m0xksOCzLlj5Kiq5G7G5AMVteyMqI5qge3Vko1CH9YPTmqc/gINAxJ7oxGqYddXNapeYOaACvt+B/vuLQAEMOgjE5P8PFo2EA05LxNMsDtSebMEL8TRMWOnipAI26oz+QL8PPLO3P7O8Sq4kKhcrGxCUojYPyBv1tU256jJ37qW0WZYa42NaTdDOcofvZi0pTa5s/RHoF2X8v9chPGCacJufAN8Ri9Hyw7kPqdstHZAzVWqBE1kwd8NlTFWQCTjfkQSjCr4P/IEzbsDM9P40Cw==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b001d705b43724sm2471110ple.169.2024.02.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:01 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id B405380DCE;
	Thu,  1 Feb 2024 17:50:02 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 4/9] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Thu,  1 Feb 2024 17:43:48 +0800
Message-Id: <20240201094353.33281-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014404_049625_672BA42A 
X-CRM114-Status: GOOD (  14.24  )
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

This info flag will be used as a basis to determine whether
there is byte swapping of data for SPI NOR flash in octal
DTR mode.

The controller driver will check whether byte swapping is supported
to determin whether the corresponding operation are supported, thus
avoiding the generation of unexpected data order.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 57713de32832..1bdb82c1328c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -677,6 +677,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_SWAP16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index da0fe5aa9bb0..6089d5bc1e4f 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -130,6 +130,7 @@ struct sfdp_bfpt {
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
