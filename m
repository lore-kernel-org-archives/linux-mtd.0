Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00110C46CD4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfWN4RmNv/EBmg2Yhf2oRYk3E/0cPto1i9+Tosv92jM=; b=EFEWR+3pip8MZh
	XwUTF0ZN/vUOEy4mq370Urf0pNwO7qgdvulYq3pW3cVI8vzqEWyjry6xQ3QdZClLp86CQ0eMbvaAy
	NuBrPY/8lcYgAokEEg1ckAyKMqubBcOs/Hoc/OoqSp0sIUiYpss88EzSmGFkjtNTEVblmQbnkNABg
	IoIsb1NaUcmcu4ke67/rrp5APnPdI3FnG2zPlB6hOsVzZ36+xwBGOPJjkFrW6VdphSOa1LXdJrR9e
	vesD1zme6RRdnAfoMsI/iDd3m+kyrPpnnnDMiMfSu/UZzidS3QcMePNF/rvtpML1I/ajX+GsjWO9Z
	vzcJLfYCZ3DksOe2gpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1d-002AzM-2u;
	Thu, 21 Dec 2023 09:07:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1Z-002AuE-1S
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:07:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d3ad3ad517so2867435ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149643; x=1703754443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=QpqfKONFDOxdKaOg46m4Oj17VBvsqgljsg1Ex8nLIufHbSw4lQPDIP9N3jPomDf7Bn
         SuocTfCaI8vynEN8f+V8ty/5dErDL37nJQe0ISDuzEU7ZIXULigDlWCCvkPHirzrBdol
         oqZnzAI7GSZ7pqltN0RbMeo9VS8Q+sSFsJKP88kxzHeo82d4tY1wQuNHgZ0DRk32BVwP
         Gb/UqGClU4jeZVhhoNw1lZeYFK5ipF3gfz81HvG+hsMVtubuBKNi0t/rGzgr8pmI7CaG
         j8VzkrtIxczVtD9gHW1kUuyy1RYgR34YHlPhT44uidejOoPsau3WxjDu/oZPzFcwwufL
         G1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149643; x=1703754443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=sNagmJFFUVb02c49hj9sbzV2xbsxRC40JTg0ndTY0Nqe1nDHry5oT4oxPMkAfBp4uf
         X+/FjYYZHbNqxzGPRRICeVIfK+AbxCvKKb527FlapVfkdH4yPLk4IweRYAqr/Zp3szgS
         J1Bxvd1X4eJ9WBB32sbk2mCPKuiffsEzKfadvsG0N78dwXXqAHJ0Ov0FKUFIepAELREQ
         iklDZKr1GpemrpjUn0xCxrYnnqS2oirltsd0KSRzID/AbXNrnZicXuQ5lWy0JSQ3EePU
         WLKpmUVZ0uyihf2Vpe/oMcnQmsbIIaTVimpfHqpvcpieK4noxRj/Hj5UgdPvANkQiiPz
         nu+A==
X-Gm-Message-State: AOJu0YypP3499ZfDWAmsUg8S4P7kPQOkQkxpSIWs1tRxKWzo5TW7c589
	KhGUfnJrXeRYlV38WQXwZc1sIaLDbNw=
X-Google-Smtp-Source: AGHT+IFys+/WQjyK9yXWU1O8jWBJj3RXgM4lOYLYDh09dnCYOBeke8Z0t0iYP+pbn+NNj/nHUksAUg==
X-Received: by 2002:a17:903:32c7:b0:1d3:47c6:b908 with SMTP id i7-20020a17090332c700b001d347c6b908mr10037648plr.48.1703149642821;
        Thu, 21 Dec 2023 01:07:22 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090282cb00b001d3d8e30ca5sm1115269plz.91.2023.12.21.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:07:21 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 164B380648;
	Thu, 21 Dec 2023 17:11:31 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v7 4/7] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Thu, 21 Dec 2023 17:06:59 +0800
Message-Id: <20231221090702.103027-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010725_485782_9584E1D8 
X-CRM114-Status: GOOD (  13.29  )
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

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
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
