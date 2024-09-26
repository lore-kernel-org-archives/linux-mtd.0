Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4F3CDE00F
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shIzYCBPwz5/+gNzpqGbhCXbs/rirNr0LthVh+/GwhY=; b=acNNc/YYTHRSlA
	/apb34bfr69gad7taBQsUY0MvKPxEJ/2iAOmsJa2rcEB5eD665dn3yFmhXaKDjRNVxachYoo7H0oz
	xqYdRUGBeM8mmW3vBiatOpHJ+8hsADuTLvyx5WtDQvx1KBG71UTYiqO+o5UbFlvbJXjpuSJ0NismH
	SFMKD0wVSTGYk9bW/WpD0uE50PIlWXdAZDRaBZbourc+I3UsfQEbj1ZXS2uFTmiFLoUZRHqC7MfTJ
	RTNVmw8Pm0vt8nddLmBE/kqEH0vGwHTIzUuN4fanHfda10XMYoDlUz2SgUWMCPETz3oEDS3g+82Ig
	m03fSnsXHGCI3FAxBDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQm-00000008aQG-1xZI;
	Thu, 26 Sep 2024 14:25:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQh-00000008aMh-37eZ
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:17 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so808948a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360715; x=1727965515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGxTXo990ti5lAyVI8ZehxzUFXPwz6MqQx7qAzjMfhw=;
        b=TK6gqmYfUPT7RaXSlj/mKZdovjf1dsvuiCdwabUW916dGQNADh0lMFeOMQvWXld+po
         EiC9HuFJekitjgUEgKmPwJHOEZhTxHHohV4xGww4+JPZPRarOV3/PskMZuG5FEO8HVrJ
         2JiMovwNKyBcUwhXKKiCjLfgTMc4YUta/wjb9vM3m7PF1nb6flawkkP2hRFlstvxPg0w
         GMcy4XSc4/8xGAjkaC4vCALzsO7GTjnUe72RkcvVBU8hED06Q/cnE6P57JktJthtJrL9
         RNTsoqsiWoi8KrQQdeBfkVntEGN7KCvSeOAbbUCcUcUGZZM/ewgT9le6Pk9mBtrR3UVS
         hNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360715; x=1727965515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGxTXo990ti5lAyVI8ZehxzUFXPwz6MqQx7qAzjMfhw=;
        b=mSvbOwAumFran2F5xboEyuSII0oOcl2lP7TLQ1da0QcJlQDLaCpPUntfk7kL89NIfe
         k+aGx8C+LcolffLHzIkbBKjeEAyAdHzmA/20/NA42xDEkNyffMlaAYJyc3l/88gDCAI5
         Wq2FrPW5Kdr0IRl63vad7TTjsIwtjtXW4ncb0efiwgQtKcUJJZrAGHsfpP7a294zoiLS
         ZsrpV2zg9sowwVQlWv2rtLueEALF6kle8FKe2aEu6pEyPW0N5QHhJn6eAerBdURHh7KZ
         u7EknbEw5Haj9uVlir2cN3p81X50Q38pT2FtIEweM1AYWbbeCeetcJUzONHCJx20ZbxP
         0wXw==
X-Gm-Message-State: AOJu0YzbvXXM0TN1jaMdneWqxB3k6BxRjVDWCTfPOJvVmpTFfpVvzm7x
	L2xRnNeU0LVhuPO9Z77pHeFFAf5LpjA8Nk3EvQC4X4qb04Aa1i6e
X-Google-Smtp-Source: AGHT+IGJwQwDCJBexl9tEe801nzR8/z6arvXHTxHSnx3fsr9XAE3/M0h4vZLwCeKudo7PtJWcCWLpw==
X-Received: by 2002:a05:6a21:78e:b0:1d2:e1cc:649c with SMTP id adf61e73a8af0-1d4d4aaf073mr8517160637.15.1727360714640;
        Thu, 26 Sep 2024 07:25:14 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc985c99sm4374462b3a.180.2024.09.26.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:14 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0432080580;
	Thu, 26 Sep 2024 22:33:02 +0800 (CST)
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
Subject: [PATCH v10 3/6] mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
Date: Thu, 26 Sep 2024 22:19:53 +0800
Message-Id: <20240926141956.2386374-4-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072515_850388_913CC4B8 
X-CRM114-Status: GOOD (  14.16  )
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

Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
mode compared to STR modes. Allow operations to specify the byte order in
DTR mode, so that controllers can swap the bytes back at run-time to
address the flash's endianness requirements, if they are capable. If the
controller is not capable of swapping the bytes, the protocol is downgrade
via spi_nor_spimem_adjust_hwcaps(). When available, the swapping of the
bytes is always done regardless if it's a data or register access, so that
it comply with the JESD216 requirements: "Byte order of 16-bit words is
swapped when read in 8D-8D-8D mode compared to 1-1-1".

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 4 ++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 028514c6996f..31f57b17023f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -113,6 +113,10 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
 		op->cmd.nbytes = 2;
 	}
+
+	/* SWAP16 is only applicable when Octal DTR mode */
+	if (proto == SNOR_PROTO_8_8_8_DTR && nor->flags & SNOR_F_SWAP16)
+		op->data.swap16 = true;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 442786685515..baf6c4b5912b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -140,6 +140,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_SWAP16		= BIT(17),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
