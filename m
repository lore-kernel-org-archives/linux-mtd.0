Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07445C7618D
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daMYeQsNpWVjHpue1CvQGGqNssAuk4SVIhRa1IGGOKQ=; b=VaY0IduameJrFo
	3MEy2+e6fXpDWcmiVlGzWhUjsVrlJu95vjs4FnCkcZ16knicbeSlWCLB+UIuHVraBivNfI71uyhg1
	/8YZWYxM38Y1eZW01Sod/l8JiOE5vrxh46DHKj7x9FKGNibM5UhS63/o6vKfLY6Tv58hkT84lD89U
	SI13f0/p3hNnrBpyB8s4DPKw1RfEnp3G2Io5DxrGRvL8hjTy/bv7YUI93+BC1+VC0rZrzirvspoTk
	svYq8qVjY9W/EJdTyKwTnrBEgxpDbgsMnGVCVE539TM/QS6XTdeo68KghtyuVeEaHhviDYUPbeCgZ
	+WB4tbKrx2wyGanTRKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwv-006ScT-1P;
	Thu, 06 Apr 2023 06:18:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIws-006SaB-0m
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:18:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id ml21so14408768pjb.4
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AF6XRLMpMrC/rHnX59D2IU8B/emr6VxjeWEikNdIws=;
        b=Gy/FDNbSmw9KNj77j3hvIfS76DoSyMTDwMgXW9CLYrVcIMQ9k15VS0Sef/0nuxPji/
         0bdSoEk/+Jn6GeCQxkq7Z7I3Rl/IChvzdR6gf9lqFkWkAhM6LEKl8crAKTKg5pHMmY7U
         2aeUjbhVkloKT1wlbvpuaikFWN1bDZ6ZV3+UVPjdexS1QkhXCHeK5BGHCo9iIPSnZdjJ
         FC4v7zUy3I752PihpTtOPmKd3D168JkKpm5UIwO9OhyTOlheNeUs+RYgapl26gIDhsDl
         NoDsheTwMMSunH0NjGlu5bva1Qn3YGJ8pxUOxHFNhlxijnl8q2FrpZ5QifKmcnMbF+cw
         +SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AF6XRLMpMrC/rHnX59D2IU8B/emr6VxjeWEikNdIws=;
        b=twCXrwPZQ48yQp1JVHzwzTP2oPyMlNMWWuqyVM+5jgr3armI/YUI5oQGxW/YLqOjou
         iFmQAF0gGjrPO0zqxilrUVZBJZBeKHG6begtTR6F6WCSrgMeeit241Qofvuo8Iu3ZdbV
         3p6efXM4k0E0cuE2k38Lq6MsdHDNstFcr4sWuwqdxfPf1S97aCrj2fyU+TtMAgcZY0vX
         VaacVnde/vd0Sv87RrgQh0+7wZHh9Wfet5+pi9oZ5q6h9jLQ8eHB7YXyAWcKYUocv5xk
         YYr3g8CPvXWdiI/T2V3FXOv96iH3gvQ4G3WPWS7NhoUjst9eXhpuO/dFhbu1HBmg1Fdt
         hFVw==
X-Gm-Message-State: AAQBX9eTZvPeFOZ95RqAs/ubEvlTIN21MVRXozsNM6Fky3AHyCnwkwNz
	3X3vC3Bfhm1G2k6AnVAO04cpY4G6U8Ie5Q==
X-Google-Smtp-Source: AKy350Y5+oSVHHHfQ/F37Z6yx9V0prP6cBK490VXkt7WHzDAdD2BKK+fw29oqRJO+Kj0I9DZjDZz9w==
X-Received: by 2002:a17:902:dac1:b0:19c:f80c:df90 with SMTP id q1-20020a170902dac100b0019cf80cdf90mr11715307plx.45.1680761895191;
        Wed, 05 Apr 2023 23:18:15 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm567622pll.86.2023.04.05.23.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:18:14 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for S25FS256T
Date: Thu,  6 Apr 2023 15:17:46 +0900
Message-Id: <641bfb26c6e059915ae920117b7ec278df1a6f0a.1680760742.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231818_277412_1531185A 
X-CRM114-Status: GOOD (  12.17  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
mode for ECC'd NOR flash. Provide a way to clear the MTD_BIT_WRITEABLE
flag in order to enable JFFS2 write buffer mode support. Drop the
comment as the same info is now specified in cypress_nor_ecc_init().

Fixes: 6afcc84080c4 ("mtd: spi-nor: spansion: Add support for Infineon S25FS256T")
Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/spansion.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 4d0cc10e3d85..ffeede78700d 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -384,13 +384,7 @@ static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 
 static void s25fs256t_late_init(struct spi_nor *nor)
 {
-	/*
-	 * Programming is supported only in 16-byte ECC data unit granularity.
-	 * Byte-programming, bit-walking, or multiple program operations to the
-	 * same ECC data unit without an erase are not allowed. See chapter
-	 * 5.3.1 and 5.6 in the datasheet.
-	 */
-	nor->params->writesize = 16;
+	cypress_nor_ecc_init(nor);
 }
 
 static struct spi_nor_fixups s25fs256t_fixups = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
