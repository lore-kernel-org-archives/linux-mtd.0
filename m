Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB395CDE00E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXU2uWX/i5EAGvENQks/B1aAu1FsnPR2podXW5HiGhs=; b=oTewLIWmSRuYVz
	ly9MZ6fwG8KylkG6mRbw+7nR1/zSljBm2bgXLRFsyzcrHwHcIqm6mDqELvVL8YCuxBMdJSMiLPu4Q
	IUrb/OubcZd/k9XqLNSPUFohVb/2/J8oIUF3+fTCtLUivNY6uUMU89fohtqxIzfiHJ3jQV5Px45IM
	XVGQdmDmwEd45KtJhsVqJPobPB1EcNJhoVwCSQfHQSJZX1yqvIwLyOZzW7KQn6Xxh7apZSy/JqmYN
	+Kx0dCItVnY9Wt/b25tF/8e5QlB7a9Qvi319LKw/JtO5pcDIgRfkQ19NrvVzywtFHd30i2BDn5VoW
	JbNwlhxvGBK3ySj6GuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQl-00000008aPL-0aJS;
	Thu, 26 Sep 2024 14:25:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stpQh-00000008aMe-2n3z
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:25:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-717934728adso814927b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360715; x=1727965515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/MUwzKscwhtX7s3jSH4IlHx8F0q+vgLMrLzXFhkBRw=;
        b=LzBVGAfhlOzljhgBd/8DRBtCEZwUUITUoCIDIZfyd5irYYIJhQtjLbLRHS7FYXWx7R
         lgJYNKkC5p7W0r2UoADVdCa1XKDtqrnA4NoaLPDibDRj/CwGUvbtqJiomHiH6eyUvHYF
         p5GT+of+JY/CtbX/mWXyC1kkg0f8VZUOI1/9PblRX3gfoQjUhg/D75EwKpg8gm7+DeQM
         LMuyAEzZm2+dnUMPxKhZsacpHbzzVvXsI9U8D/Zzad4UYfuU7b+OauNz7FaIZVr+TqEV
         6jA8vW2EkMWTqdrFuDwnakm5r9K8O6ZwVRnaFGUu/piZSar1rRpgvhoSkFdsZW9+IZ89
         2LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360715; x=1727965515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/MUwzKscwhtX7s3jSH4IlHx8F0q+vgLMrLzXFhkBRw=;
        b=ZhwZYWRSyb3JLEuOWYkUs1902JSx9U/Uem5l3USiJquvU5nf1nZij51l2nsbQNoeTS
         0frjAaV4W1Z1qgeTCd8svNLdpCZWfJA2Pvr5cido2dHLaa4jXrjsWw7sMBFNXYLIclCZ
         uG++ZtbzTPUktPwSSSN4vxxS3yy6Eau0C+3LVcniB1ofHujjYrH16EzoGMML0RJ6OVC1
         bn9W+fD8IyVJo49TxYdUqnSS8OMx3xN0XzY7SRyRq+vK8zBe8Q2VjTl+TP4mAUiSXG6y
         wNaaoSoaIC5+EthgKor2I3B0F6ulTSj303tjBmo/z1IxGOntOVL0gO9FEyVbIjh6z6oA
         bM1w==
X-Gm-Message-State: AOJu0YySmc+QjIPrk5rr/uiEz089u4EsKQ37xztfe5pec13CZJf7/g/j
	kUxgvFLtvU3tnK38u9R2bJW6nRZlVEi1HO08QZQPzw8i9MhCL9CT
X-Google-Smtp-Source: AGHT+IGS0nM82au/EzeP06wausitoOEDIM3uRThhNjvR3ugckuZHWCaNJRiYUN2+/U97e/3zZ/d4TA==
X-Received: by 2002:a05:6a00:9284:b0:718:db7c:3a49 with SMTP id d2e1a72fcca58-71b0ac993b2mr8763854b3a.27.1727360714488;
        Thu, 26 Sep 2024 07:25:14 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732c8sm4360707a12.71.2024.09.26.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:25:14 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2374780529;
	Thu, 26 Sep 2024 22:33:01 +0800 (CST)
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
Subject: [PATCH v10 2/6] spi: spi-mem: Allow specifying the byte order in Octal DTR mode
Date: Thu, 26 Sep 2024 22:19:52 +0800
Message-Id: <20240926141956.2386374-3-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_072515_774096_EA7646F4 
X-CRM114-Status: GOOD (  17.07  )
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
runtime, addressing the flash's endianness requirements. Provide a
way for the upper layers to specify the byte order in Octal DTR mode.

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
Acked-by: Mark Brown <broonie@kernel.org>
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
