Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365CAC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 03:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQcll0qG1eqk9J7Frse1sU/Drm7D1eK0r1Zanz8GRWo=; b=uCv277qNtQeYvO
	p+/ZbCx7m5aWpvTsSXhoR9vJ0Cw35MSNC871fnwc46ofPk2XwZ6WlKUsM2OgLxC36PaXPC2mEcXfb
	OtGOI4q4M58Q39i6pD/MU68pRwd0bRQKkSK4DewMITuj7T7ABkFv5qPazG0ne8Rlk0A/uSX7h4bZh
	58zCON/cFMCqtXGZDaXnEaIS0gwdBUg17ic/Vf20LIn/wpCU6ccyNGCYcEF0KA4MVB1mshpuI1Ssy
	LskX7WagqHGLNoYyom3qJvUy/7mVfJ7lBPt2qd53tr2kAxSOL3zpsIRb7+ZzD2VONSRitSJ+QuD7E
	Zxyk6ClDgQX0vKR1FqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4DbN-008Jxq-6J; Mon, 03 Jan 2022 03:01:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Dax-008Jvv-8Q
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 03:01:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso9768584wmi.0
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jan 2022 19:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXNaCmB23l/v2SBkvx4jJIGXGemsehmfOVCATDay3ag=;
 b=Jc39l714mUnC6C71RckghH7B3nzIZLbhMQeM0gMoxDyYQi0Gj7qpZlTgLb6JzaYooK
 IPPHwZ0v14fTzwNAiUgPbXz4abv45FHv6KfKuWZXm2Z6lKklWCdXZ0AO72nyuXXlhbN5
 /4d5GD8SNFryQV2ToR6haL3qQH3k1pnjCqZ2sO9I7PzMGEPhYtFI6+yyS/KnlmcJvXCU
 Mtxmi9sTVzeo3ZLzcVIesoBITbk011rG5kh9CtZLlHQuEbGvlaI0U7EgbsnwH1Zwg9gl
 luUSSPqU/S1hyDxgqcWo9t2QemifPJrDVhyC9pGwsN1IaADq+/GmgdZ8rIPQcALqH5Wf
 sCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXNaCmB23l/v2SBkvx4jJIGXGemsehmfOVCATDay3ag=;
 b=ryDA5AgfJlPcjsXCQRoHJgPr6z5dU/ggX92b2wsNCG6TnJbMQxDZLrTeYRI2luw1OA
 sBO7r0dDqxW5OGjPGC1vDf6MgFD9Bsokdef75uJwtukn6bKlMicVgKcWZyTMOOPnAolE
 0EKztvWDKDgeDKUevKJDcbAQXrdE8sMmjXgVm7Jy4HFca9N3PldpwkyJDprOn4pFJa+G
 JHitL/L46+A7gw8BI1ql2cnTjPSooJHwqfXQLScXCaopGzgHK6NuJvuvPWR1h5PCwOcq
 rjffuEDcXBZbt6cMuoT6CzDlryz2c49ojGduIGH2gRL1NaE4xpcN/WGg46QtLHckgkK+
 nEgA==
X-Gm-Message-State: AOAM533/tWXJKfxLXp8ydEpXkFvXD2cFuuL5QdZOcEH8szrF/wXPOHYQ
 whw/JZjFPOa0fOW3TIEZaiEQsg==
X-Google-Smtp-Source: ABdhPJzRE1vniyLVYKzNOXBAw0GWwbCneCIPO9y+HCoI9YIhgwyoj6Cn1+dmB8FYvzwRxjGMwLSgNA==
X-Received: by 2002:a05:600c:2103:: with SMTP id
 u3mr36391606wml.6.1641178869846; 
 Sun, 02 Jan 2022 19:01:09 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 19:01:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il,
	bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] mtd: parsers: qcom: Don't print error message on
 -EPROBE_DEFER
Date: Mon,  3 Jan 2022 03:03:16 +0000
Message-Id: <20220103030316.58301-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_190111_318964_F681EFB2 
X-CRM114-Status: GOOD (  12.13  )
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

Its possible for the main smem driver to not be loaded by the time we come
along to parse the smem partition description but, this is a perfectly
normal thing.

No need to print out an error message in this case.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/mtd/parsers/qcomsmempart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 06a818cd2433f..b2a57fe8479fa 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -75,7 +75,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	pr_debug("Parsing partition table info from SMEM\n");
 	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
 	if (IS_ERR(ptable)) {
-		pr_err("Error reading partition table header\n");
+		if (PTR_ERR(ptable) != -EPROBE_DEFER)
+			pr_err("Error reading partition table header\n");
 		return PTR_ERR(ptable);
 	}
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
