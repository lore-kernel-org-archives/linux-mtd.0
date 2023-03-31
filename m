Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A5CC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2iUO04IJONGCtNCO6/NDYRG6PPjAOLt8YqtCs58sU0=; b=SZA+MOMFlbxzov
	1pipr0pLNElJQav7jGlTMPdMUpGmv8wMFLEiaxTBjU/+XVUF2SvnQRPTdak+CrFgQ8dp1Td/kp91O
	q6ycgpJEu7+Uh/PerahhrZUJ+pNPfE47VnUDW87FqcvJqkU6NRzgYC2hFMvX2mTEgFNM2Rq6pzeTk
	BM7mm1YcNJ/zNtZpInaBO48FmYtM3SuxTAnOAAJgF82YMvYhDzYNaB17PIlMbgIPgPZXXj8tNOX3B
	mPGsQGNO30TFu+s2fCTIKFIL8Zly+33xwoFcGItdaMd4ByLCJKK30rYG6SAqkTdlC0mtEGad2qo3E
	ZcUX3LVnwdbB2d9/3PMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9T3-006D5f-2O;
	Fri, 31 Mar 2023 07:46:38 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9So-006CtY-2w
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id j11so27759285lfg.13
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9Da587yD3PbmNzuxHtISgYGF/c0UcFhpnI3XbozKYY=;
        b=WhIeT8yZ1o/ma+upJnPbKC6jjyndWr1Ue5kWJNwBwKCjyWbvGEeCs9c1isnCfUWXbo
         ik1rsQyVrAl3P3CeWG12vErnNGjWnmydHmntxh5euiXiIFA4GCTTQt+39UbeRFa3yyIK
         WCGwByscPFXVujWHZrezChIos/u/HDXINpuz/NSktS4FRmsYbSg4gPowhzZRuMPI7EfI
         1p+N9x4Gap83fwS0JdgdLyjK7EPMthPjGHtpEMFrYcvKHOEHjZWSPUmhDvHbSyt0ZFIt
         kV1iIFj888cJSCrIVKBmDPWC1qs1E3rvFt7wWyq+I5K6zexUil7gi3L66+cuykDw/9Na
         IrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9Da587yD3PbmNzuxHtISgYGF/c0UcFhpnI3XbozKYY=;
        b=lwo75jxzUW8nc/WCbseJPGA8ai13zZXuJH/fS5Tq0MWaWvzRTBS3jsTczsNqQHfq46
         e0l+FtNVOiP/9m3iuYD3c3pT/v718YY3pk/xcTINC+595F2Bz71ZMmKHQlU+Xt1iNMhK
         Xb9I/8N2h8nKl6I6whTmhIselrbA+ic4qHs/tRFFbNHAqAru+TtS3MMpqjLqROheBFfi
         HoQNel0FsoIP0PuGC0kLdZCgmBIGx8CvHnmOU3j7gi0g7LumN7LBUVIqc/KCu0m88S94
         yIOKjs+uwo3mGHHhkpcB4mAyW06M5J5ridH8piku+fV8juBe3h/PuwRWibERdhTUARsT
         acag==
X-Gm-Message-State: AAQBX9eCKxxtMh/3AYsCUv6dQur1KDz8CPuRA/yciOtzfZEa3dNElGLc
	DlnlZJkZACDaU0SCWGc3PT3xEQ==
X-Google-Smtp-Source: AKy350YJLEL832UqMybhUSYSx+FATBh6zndVnXbgwbG39t6H/inKwVnOuDFfIzBwqmKGJlN13Ag7xg==
X-Received: by 2002:ac2:57d0:0:b0:4e9:ad85:aa09 with SMTP id k16-20020ac257d0000000b004e9ad85aa09mr7356576lfo.68.1680248776742;
        Fri, 31 Mar 2023 00:46:16 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 05/10] mtd: spi-nor: core: Make spi_nor_set_4byte_addr_mode_brwr public
Date: Fri, 31 Mar 2023 07:46:01 +0000
Message-Id: <20230331074606.3559258-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004623_027167_EFE321B1 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

This method can be retrieved at BFPT parsing time. The method is
described in JESD216 BFPT[SFDP_DWORD(16)], BIT(28) and BIT(20).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4c9264e427ff..75d28224ec62 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -579,7 +579,7 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable)
+int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 067945c10023..8953ddeb8625 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -650,6 +650,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
 int spi_nor_set_4byte_addr_mode_en4b_ex4b(struct spi_nor *nor, bool enable);
 int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor,
 					       bool enable);
+int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
-- 
2.40.0.348.gf938b09366-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
