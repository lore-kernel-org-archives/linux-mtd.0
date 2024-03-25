Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0585BC54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZIryfZb/0q5SkZmyLtTMlHIQWxz7esExPSFM8Ga5Ilw=; b=CU9ojbRuKDLsRj
	c/gPZInurAyC/woL0m2izao9yzYw5La2ohidXvQCxWvvKJc5nEnCnIQC67PrQZUL52peEPxfPbIQF
	ZtTNe1M9xcGGZ2k3Z7L1pksQ1ng8Jhs82z2qe5sbcu4vevcoM1pEnfK7NmJQV6T/C3f4aLY9qgQqi
	gdGAFQx0btmP2sFiyfsi+h7gZUCujfbfY5udahsSKNfe1n8+aWe5P475rPpOV1pIs/X8Ae9UPk9qP
	lE2+FityFMIQOTzlFoy+8yhDAB/TDrrmLYn12fPid3qv0pTPJCTO8k/wu3lfAW6K48rb98buyMAZ+
	+DngBUjbzIQhH14uFLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolzo-00000000Q2O-1tL5;
	Mon, 25 Mar 2024 15:12:20 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolzY-00000000Pr9-1CXB
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 15:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711379524; x=1742915524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CITzPrsB7IGveTJu7Ocldseg84+Ybt3DqMP9qIhYMac=;
  b=aR6cYnurRr37QCvj93IzGc3ADB39l28WSBDXsBfI0bL37zmiDb/FErUM
   LBIsZcLX0GwZ93IrqqEIUcG2o+ZMBW8Bx9BC9zg8bbY4kAwpEy2a5eMxu
   ciUj91nbYGp9zPGExfa2woSfKFIguRww/HOnNgQw8Ah6g3780FrNw9IjB
   x4zwqrFNUm6oGwedivjkdC3eArXHYayes3VdArdOYtFO0qX0XdrdPQeVd
   iBFZwKZl3Z4V8VT3+IG//bk3js4Czvam9Y0tJR4DCsTwuiOPSxFTCmxz+
   9afmsTtfpMWyzGj1FbanTy75y6zvPcTQv7YYunOTdvq2UMC95fVovQdI7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6983832"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6983832"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="937070562"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="937070562"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2024 08:11:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 44E7A3C5; Mon, 25 Mar 2024 17:11:55 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mtd: core: Align comment with an action in mtd_otp_nvmem_add()
Date: Mon, 25 Mar 2024 17:11:50 +0200
Message-ID: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_081205_219359_5FD6EB9A 
X-CRM114-Status: GOOD (  12.47  )
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

The comment is related to the non-error case, make it more clear
by inverting the condition. It also makes code neater at the end.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/mtdcore.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9e18422fdc77..d0c231600f84 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1015,10 +1015,9 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 err:
 	nvmem_unregister(mtd->otp_user_nvmem);
 	/* Don't report error if OTP is not supported. */
-	if (err != -EOPNOTSUPP)
-		return dev_err_probe(dev, err,
-				     "Failed to register OTP NVMEM device\n");
-	return 0;
+	if (err == -EOPNOTSUPP)
+		return 0;
+	return dev_err_probe(dev, err, "Failed to register OTP NVMEM device\n");
 }
 
 /**
-- 
2.43.0.rc1.1.gbec44491f096


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
