Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531F8C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZ3vL5Qdry/LLZvEQDLE/Nfa+/X1W0BWRT6kNE1u7iw=; b=cMTBq1BVX4vRiJ
	aDGNATBBdBYMkxzrKB2LUHXvKhTBzSItu1vUaH4mpiS6sOdlJma0snrYfrSsdSuTwsARjTS2aVMop
	OZDPxcUsp4Z3f+etAUiB//IIIm4NrEWIyZ77stFUIwlwvrTEo8+vFb2ex63nkkKKgKJQL73OcOhMF
	Pr5Iq9oR5Vh9XUxRpVK/07HzlU64k3+1PfvQNIz2lyiuS3jTOx82rI95iNoBBVLbjUqR4GY+BGk+Z
	obWdxBd9RQB5vTirtf7MvQyodlvF2lNus3YER8hcnazTmvTYdDKft4BXdN+6hUC5rR3O4Ym/60RGt
	F9BkLZOUhkSFmkS0k5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7S-0000000FeSj-11g1;
	Thu, 18 Jul 2024 03:47:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7O-0000000FeQ6-3mlu
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fb8781ef1bso3803065ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274466; x=1721879266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiGhB9iAlrnpuT0nNXOC/VcBouLV1340qQn/2ASaTHE=;
        b=d8ECzLwRnCYagjGx5IhnSim2AJ2ND4yXaWI4YiGefGviVMiLrkpLG0irWCuWpJiKJ6
         FCSkiZ2MHpk44ELDO2kfQCibMjMabgE30HLVoLIWdCLGMwZSFNc8pL0Och/Wsr8xWmM5
         JUECMGLPIixje0XUlHejnMhvsfSv9cXWRv5FuIATSHa9Xmsf9QbFPL2eCR7LhRUScuyw
         MwIKkRtzgvo4YyBi8bz/S7HETjL1igi55LJoRL9LnuKtI2yqPbOjPzuZT3ki6SsaAzWW
         3OxdOYv250NyWgKDKOFkHOT77wN0eFdCNdTJq5Qv1iNyyIVBIKNL3XjYMSwEuV8kN/Tv
         2BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274466; x=1721879266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiGhB9iAlrnpuT0nNXOC/VcBouLV1340qQn/2ASaTHE=;
        b=ERPvpa9R/AvJQ5F7TYfIqttnh8PILeAqd2OF0ABaFtv8SN+sCuG3VYzmaL6nnIg9Si
         UisOl5BYm8Cp0jJhrUYB08t48nUMWmOrehy9Ohm7gE9QUy9gv/nT9PsaBf0yTes3aj0v
         HwZlW6f7eWLmZyuDy95gYchOYhELpPeQNw/zkEWB4Z5h+Ucf4Q1jHSXw6c5c7HPr0oGc
         egWCod4nJPFqprsMn7RGhO5YQPN5hb2qW+j9kIDyuHSxsMJrRFRFQ/gxqd9ZAqgFBamF
         BSAoGwIGHPvfysc/x1H0HJSrOwi90558b9ACDtYDz4wjvw6AhQai28bOQgRCBDgQaSGt
         TSOA==
X-Gm-Message-State: AOJu0Yxf0YFtLC5g68pg6JcJHqJfYON2R2bmDdh9Q1WeGYw9Qo0ZW39J
	Px+H33xi5KmTj2pFjiWglbMkj5Na8CgnaoY8nd4/XkO7YkbVbgsP
X-Google-Smtp-Source: AGHT+IHZgl9U0WUl8+4EuXclgpCb+62yP5nP7OnVXEfj9sPDD1BYRn8ossNcYdB2xJD+qRTSocLQsw==
X-Received: by 2002:a17:902:dacc:b0:1fc:5ed5:ff51 with SMTP id d9443c01a7336-1fc5ed60186mr7628615ad.43.1721274465384;
        Wed, 17 Jul 2024 20:47:45 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc54069156sm15587545ad.242.2024.07.17.20.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:45 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 72F7A805EF;
	Thu, 18 Jul 2024 11:56:56 +0800 (CST)
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
Subject: [PATCH v9 2/6] spi: spi-mem: Allow specifying the byte order in Octal DTR mode
Date: Thu, 18 Jul 2024 11:46:10 +0800
Message-Id: <20240718034614.484018-3-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204746_994906_7FD6A2AC 
X-CRM114-Status: GOOD (  16.59  )
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

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. Therefore, it is necessary
to swap the bytes back to ensure the same byte order as in STR modes.
Fortunately there are controllers that could swap the bytes back at
runtime, addressing the flash's endiannesses requirements. Provide a
way for the upper layers to specify the byte order in Octal DTR mode.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/spi/spi-mem.c       | 3 +++
 include/linux/spi/spi-mem.h | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 17b8baf749e6..abc6792e738c 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -172,6 +172,9 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		if (!spi_mem_controller_is_capable(ctlr, dtr))
 			return false;
 
+		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
+			return false;
+
 		if (op->cmd.nbytes != 2)
 			return false;
 	} else {
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index f866d5c8ed32..c46d2b8029be 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -90,6 +90,8 @@ enum spi_mem_data_dir {
  * @data.buswidth: number of IO lanes used to send/receive the data
  * @data.dtr: whether the data should be sent in DTR mode or not
  * @data.ecc: whether error correction is required or not
+ * @data.swap16: whether the byte order of 16-bit words is swapped when read
+ *		 or written in Octal DTR mode compared to STR mode.
  * @data.dir: direction of the transfer
  * @data.nbytes: number of data bytes to send/receive. Can be zero if the
  *		 operation does not involve transferring data
@@ -124,7 +126,8 @@ struct spi_mem_op {
 		u8 buswidth;
 		u8 dtr : 1;
 		u8 ecc : 1;
-		u8 __pad : 6;
+		u8 swap16 : 1;
+		u8 __pad : 5;
 		enum spi_mem_data_dir dir;
 		unsigned int nbytes;
 		union {
@@ -297,10 +300,13 @@ struct spi_controller_mem_ops {
  * struct spi_controller_mem_caps - SPI memory controller capabilities
  * @dtr: Supports DTR operations
  * @ecc: Supports operations with error correction
+ * @swap16: Supports swapping bytes on a 16 bit boundary when configured in
+ *	    Octal DTR
  */
 struct spi_controller_mem_caps {
 	bool dtr;
 	bool ecc;
+	bool swap16;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
