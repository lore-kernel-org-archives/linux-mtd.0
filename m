Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F68EC5517A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8B420663
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKzNrkNy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnIv3xHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8B420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VPmFi9keU8XXLwJ1mHvrMWnqQc9Fy1yV2x++bxjPY7Q=; b=fKzNrkNyv4ec5bqXBnqhcZh4r
	rnlg0OGHKe5pFp6/vFe4hPIoVSHZtKxSxjdtcrGlwbr31PiSA4eZ3VggqPK+ulZk3sFmFPCGTJolL
	KYt0lvUR5SCCWr1NsF3+9ZcDjsea06HHeqErw0yAU1BJKMjPkthF9WqimMbJV5L78iPngzMjJH2gS
	FQvk2E1VSMz7c1zJcYMKbj73QEJ06l6v15u8W+2aGoSOCsuPoboW6uV/rOYgMihZM3ucrM8sziqmj
	TFJOXLr+77pvCvKeqHEK2LZ1gaKeguy/YVB+vkvw9soCkB9Zq1534PDHk8XYm4y9rThvT3ar1+XTK
	L3mjXB8Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBrF-0002XC-4C; Mon, 09 Nov 2020 18:25:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBoU-0000ya-Kx
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id w1so9828614wrm.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
 b=hnIv3xHQzK4vGHqLPgeKIlXEoxGlX40FuncVJiGSRcaWOMt6IjHpgKwD0EH4POESnm
 6mZYdUgIB4Krx0LuV3VIHbnNSdX5+/gJ5wBJc8HvoZyix/37Nusji2mRqtPKGmx/rjX6
 E7M1WhQJT0Ei+AXyGJNPeI8WDJo8itEjTgi3KFI7vl8zNWYxwwREaS7T+Dqz209xE4yk
 oualc01T7JcNNjacXTYXNZkakn8qfoZfdRkbLFOBrr1S5tx8sI3hnHVjxCnIvSVMNaSJ
 yAIrr8SLVSIbBnLA6mhM5UPNkBEyz+/E9zS8ei+kHp0IHvHIdRh0SItSjLN17df7FUMG
 J2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
 b=uXqUQ88JJs8sUKWjvvVKDVMRq5OTjz+FUSMOeGwQQQnb9moYTqJcx1kM5mipdx+QFJ
 cBw81L8sTi6U/0rIPBu3BxU1/dFVlRr8lHQY0qkL1SvDgYBtknsshnpmWxUKXFKj9IZR
 rNVv6BATYn4ol/KZRU6lVfRgWLSVd+hYRCjq3wDzOT/ELDdg9BkpZGqfjuNWPBrc4IL6
 +sbdy7TXI2G6CGO132yduhyZqDihrQye0ieZwrL27ZfanjOZ6WQK4pWNDydVxE6/++w6
 WdaTlb/4dT2AzpV4vTCJkfqVo8v7a3SALHqpAfgSiWG7A/8FhGV+Tp0VQlqGeg62f3el
 V5rA==
X-Gm-Message-State: AOAM530oBOdF5Rcinoq8F4I22GjsHKPlurV8/xHGm/8IiNkkg8BPYsu9
 Sfe4FIpgWYASShVoZyo06ChX4g==
X-Google-Smtp-Source: ABdhPJyeWbF4IXe3J+rChMedpclviC8/eufVt3JW57d/2S+UA46Kq8Z4Wfo6mzD+v6wBNgAyYwk7sg==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr20826857wrw.201.1604946165213; 
 Mon, 09 Nov 2020 10:22:45 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 17/23] mtd: rawnand: s3c2410: Add documentation for 2
 missing struct members
Date: Mon,  9 Nov 2020 18:22:00 +0000
Message-Id: <20201109182206.3037326-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132246_836794_7541D1C3 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: linux-samsung-soc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Ben Dooks <ben@simtec.co.uk>,
 Kukjin Kim <kgene@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Correct 'controller' typo while we're at it.

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index cb2d1b4e278cb..f0a4535c812aa 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
 
 /**
  * struct s3c2410_nand_info - NAND controller state.
- * @mtds: An array of MTD instances on this controoler.
+ * @controller: Base controller structure.
+ * @mtds: An array of MTD instances on this controller.
  * @platform: The platform data for this board.
  * @device: The platform device we bound to.
  * @clk: The clock resource for this controller.
@@ -145,6 +146,7 @@ enum s3c_nand_clk_state {
  * @clk_rate: The clock rate from @clk.
  * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
+ * @freq_transition: CPUFreq notifier block
  */
 struct s3c2410_nand_info {
 	/* mtd info */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
