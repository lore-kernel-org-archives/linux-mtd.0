Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDD8CDE00D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hE/OuJ7pt+58ErsRc1oOhqjFIrzT2MORLZ1tB52uEk=; b=tA4dLmpuo+0Z21
	VVFKRVhGI7aYoOKCHa/IOaSQ41A8YFF61y9Z6ruyilSCuMq17KPdiJIG9uzG1qx5KFmyl9MVpKqoj
	0L3e7lG2Jkmsigcm7NcphcFv6M34F5joQAZq0TdLPnn30YD0ZNo/wUBqiu9WdEfTiCDZotU7GnItu
	TaRcLw/hfn9ftudK3uPpoMuuKrr1nySH4hMB1/1HIxpyFIYPs+s5166LW4FZKNvQZ/mscteHQ3t5i
	vTSf2VoGeRLJTPMmSqQzp7Ugy3w5/bszpeoJEFL7aTBhkAHtuxQMyQrubka1f7hMDPhIlsEZC1uxL
	j4elRFxTw4B0ZGy2dzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQo-00000008aRx-1ZMP;
	Thu, 26 Sep 2024 14:25:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQk-00000008aO6-2b56
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2053525bd90so9836595ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360716; x=1727965516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMuWBEdI2HIbFrXrh9xxcobW8DMR1fI820uWrVQpyfU=;
        b=mFIab70F4dz1Ga1PqW5pUB2jXVC6OLqpfLAEDUGjwFnf7jHY4s5jujN0unxLCYPCrj
         1hqFJi0vL9/fQeCaKRB720ptomlbFSLpZegTMTPfU5uhSHcMxalMjq1NDkR+2YvFImgG
         4a3oNbh7F9ODW05tMNFJFpSJAqnF8W3ppoy06VoG7QNWsse3CpbL0GahbIXwdIUDPzlO
         Nm1OT6z4aan4nYNIY+9JMEecXpr8UZeHeokAlLVtxaiN9Z3jy4aFJjQsZldFTToVffmn
         WUjssxCnV5liYiDXEW1o8lRfymWd8XTIQC3cVEBxXxrTfKECie06jb2dIMU1EFrhxrSg
         Kb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360716; x=1727965516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMuWBEdI2HIbFrXrh9xxcobW8DMR1fI820uWrVQpyfU=;
        b=guyrYCh0tELTBKPj+WraOkSgfr3uTdTepQqgbcFPixy1JZFn1VPO81F84cTO8yV/0i
         JGRK9eJm38pTGWE7lVYWRqyEzsQa8FPQ36/qsF4LM5N4b+qChqAeFBkTh3Vhx+gnpp7+
         +Y0B31olFt/1BQiLzRj4Bc/MDnsYJrHw/gSTGdruCKB8HA0jbTAGTSTbZdiqFwRFVECC
         KeRoFH7yr3MdvCqApTRp9WQOXii4AlaKFqAg+pevVasXRO3eFN30YXOziR0Kg6H/dHj2
         5RY8GfWvwNGLtQLEw73yXtm0bmWpbi8apOagmx8SVNePybeF3TVVXu85rPi2xFQxhlAq
         jxyg==
X-Gm-Message-State: AOJu0YyVCKMZcRDiJFOegUUloEoI5rUsohznS0PZ4sGw/i7xNc5c3zv1
	V1ccLXv3adHWI2PdViEHu16EkDw8uMOoEG2Dyxy8liXSdPO/fAYq
X-Google-Smtp-Source: AGHT+IGEtc58T5kAWxd3ejQeAnShG9qd/qn85zhZjLVapG+1Ibu8ePMvELjY8JENDMiHASpawvBTgw==
X-Received: by 2002:a17:902:cf4a:b0:207:3a46:345 with SMTP id d9443c01a7336-20afc5f2830mr75735065ad.51.1727360716485;
        Thu, 26 Sep 2024 07:25:16 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1856f27sm39332645ad.262.2024.09.26.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:16 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id BA021802C9;
	Thu, 26 Sep 2024 22:33:03 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v10 4/6] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Thu, 26 Sep 2024 22:19:54 +0800
Message-Id: <20240926141956.2386374-5-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072518_782513_0F4C4E58 
X-CRM114-Status: GOOD (  13.89  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

This info flag will be used as a basis to determine whether
there is byte swapping of data for SPI NOR flash in octal
DTR mode.

The controller driver will check whether byte swapping is supported
to determine whether the corresponding operation are supported,
thus avoiding the generation of unexpected data order.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 5b1117265bd2..21727f9a4ac6 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -671,6 +671,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_SWAP16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index da0fe5aa9bb0..d90cbd7331f7 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -130,6 +130,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)	/* Byte sawp of 16-bit in 8D-8D-8D mode */
 
 struct sfdp_parameter_header {
 	u8		id_lsb;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
