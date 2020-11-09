Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19851C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:28:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A97020663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZApkfjZn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJgWPOdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A97020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3B7m4NJNbRKnLTKL2bBWyG0pIubeldGVkoj/R2Dl0BM=; b=ZApkfjZnHm+8vDMycAuHdIDiy
	/KCqVxWeUbOGnHnrZoDLAGjt6V5+wfrvJ00OioSWSsx3eVe7sq01yHel8nB91Jhpsx6RjlXk7u68s
	NuiwWcU8Q+MfSj6Pr/psiemXCPQzoAvYxsjfkcWj/TzyaHAomUCelus3DxbG5vruUzVF0bHtXZxrm
	gSg/vSsycdMhoR5pahdXzxKf6Oyt7f1DI/8srsDZb5YzPnMwWk3q+wzKc4yIgp16+YZ1ABb8AolxG
	RtgVx3RINTG+EO1LAL2A2pB0FdUtuiKIXd0eTyCBMVMXex3LMxFPJEhpVJ3hQG/Y1Q/8r4RiGzZXX
	8RNBziFow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBsq-0003HM-8z; Mon, 09 Nov 2020 18:27:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoe-00017e-Qo
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:23:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id j7so2559019wrp.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=CJgWPOdfZfDFX6jowwB55bCXH/oVH+oRW/NOmFaMU7wqCfffw9BI6AX0cZLLRnoQ83
 f1Q3pJnStHDKmia5wsQ1jG/5yLT5iyXJHSbfVxF2652p73ZossGiaeADkwfMVV3VPzKl
 y3WUZ3gkpVEtts++2sjN4KN/Ate1Zx1Llx1URhWTAmp8q9vb5It/GiVpx1x00v8thRr+
 Jg0NrctCAawSlL0MlhXVbqG4J9tngKUVGjMD35l1hjxw7aj066anrVGw76eLOV6PPGpJ
 +3NJvWcQwSa1y2r2ZhJVX092wzbs8xv/E5ZSMs+rZSbQxaMrOoi1cDjRQZHpsP5bhVsw
 Wctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynyF2LluxBEO2JLmlcMvxixiCa/MBQSn7HUEDQ95Ad8=;
 b=RGeMhbhnbOthyREWEcvatWWBXs8i5cf8/VpYu4Q09kD2bgOJKhg2bfqkDB5tV9dKkC
 xVw+vvw/klBUHxqR8Jzk8BswE4a+FDQ0YNW/apKAh3Y2xFz2eMw9zgZJJCjWUf58NUMJ
 Udzx7kHUGEcRldiSw1bw9E21jEnypztk8U4Wt+MpcykhV3fvftpUrErq6EMoA7t9Rcv1
 XlqeCpxnEERSx1aZPhkBEXwHxiJzkiwQTW0SR+98jVUUp82R1SSx77bnPArvgGQ7DuK+
 Hu2czK+iE3noqImOfnfZlrQDUq35NslXsc3742ovFdRX2WRS+LDiSGOLwYwbtGA6cXAL
 pVsQ==
X-Gm-Message-State: AOAM531cABj2+VLGn55Zr9o2FKiU8c1R4kpF7zGADGDauTMxUNfFTYLr
 3A+onWBxu8qFUY3vPigV1qsCGA==
X-Google-Smtp-Source: ABdhPJzYJ6GXTplhTN/922OmWLnE6Yxzwd1FCSkYbQl6bOCvGF6TFsl11Dt619RBL63ntiSfCz1t1g==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr2948571wrp.339.1604946175640; 
 Mon, 09 Nov 2020 10:22:55 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:54 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 23/23] mtd: devices: powernv_flash: Add function names to
 headers and fix 'dev'
Date: Mon,  9 Nov 2020 18:22:06 +0000
Message-Id: <20201109182206.3037326-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132257_057040_AFF7B591 
X-CRM114-Status: GOOD (  16.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/powernv_flash.c:129: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:145: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:161: warning: Cannot understand  * @mtd: the device
 drivers/mtd/devices/powernv_flash.c:184: warning: Function parameter or member 'dev' not described in 'powernv_flash_set_driver_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/powernv_flash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6b..6950a87648151 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -126,6 +126,7 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 }
 
 /**
+ * powernv_flash_read
  * @mtd: the device
  * @from: the offset to read from
  * @len: the number of bytes to read
@@ -142,6 +143,7 @@ static int powernv_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
+ * powernv_flash_write
  * @mtd: the device
  * @to: the offset to write to
  * @len: the number of bytes to write
@@ -158,6 +160,7 @@ static int powernv_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
+ * powernv_flash_erase
  * @mtd: the device
  * @erase: the erase info
  * Returns 0 if erase successful or -ERRNO if an error occurred
@@ -176,7 +179,7 @@ static int powernv_flash_erase(struct mtd_info *mtd, struct erase_info *erase)
 
 /**
  * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
- * structure @pdev: The platform device
+ * @dev: The device structure
  * @mtd: The structure to fill
  */
 static int powernv_flash_set_driver_info(struct device *dev,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
