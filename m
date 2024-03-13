Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4683CC54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+b6uLQWdBb04aVgx8an25V54/YyYMlOXItW5yrTJdk=; b=togugNDh6O1rFH
	YUgtn89egcJ+60aZq6vQxQ1AmhG6KW57dBTAUXQfTyUjfinZieQTdp/7h5PTUeyGCOv5bKtU2o0wI
	ct7k7XYwjnSi3z/H350j0h1FtAP+Q5Czt0LvWSZh2cvKW8u163Y2anFAfaXDw4nCGVZbkS37vQscS
	WFBaF+YFCIXKGaU4WupJLwK2mUhUho9jvVQHp5Q/owDdYga8QJccoaUr8LXYuf2/4Gys/v6+GFbDO
	jBCUuAeMmsWae/Jzwdod2KxLAd02q+CLRoAftxm3MYJadUrTx1CsBEsYPuBXlUm86foLHAwUAWfzQ
	Mlm5zI+hGHcHo5nU5Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSUy-0000000B3oN-0ZHm;
	Wed, 13 Mar 2024 17:34:40 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkSUu-0000000B3jp-3aZQ
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 17:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710351277; x=1741887277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMAF/BsQMrt/7XHws2t0rHI3xXRwHICqBykoan1yTSI=;
  b=UT9IR4bl0dOPkgd8+zc1M8y65wbvrJ4p5vxYLzCGCYkCcfr9wTtFu4i3
   i5DocaiRbsUT2fYSj5+MOi8ksQhZSx//xqhBsyLnLEXVxnYgF/LZSVcjK
   q13hoxC73WwpbgkgZchBu72j3y3DshwADuP8RYwvyxbA/ElqMwhz8/u0Z
   XeNHP1Zw97NNzjJ089dLmPwBP9P0X3km8Hu/HLcI7HgNwvQ17eOJfLCcu
   0DO12uyhn2jqpeC+ouyjMxCIuwcDQc9BRmC1rRj2u2wHoFPreO4a55muR
   u/XUYrrwCnjK6c7Ot9I+NHE771F0wk1vu3xr7W1x5jIMHx4ezq+7p6a3y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15772888"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="15772888"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="35132858"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 10:34:34 -0700
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: mika.westerberg@linux.intel.com,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>
Subject: [PATCH v2 1/2] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
Date: Wed, 13 Mar 2024 19:34:24 +0200
Message-ID: <20240313173425.1325790-2-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
References: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_103436_965714_D1DFB2EF 
X-CRM114-Status: GOOD (  11.35  )
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

Jump to the error reporting code in mtd_otp_nvmem_add() if the
mtd_otp_size() call fails. Without this fix, the error is not logged.

Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
---
 drivers/mtd/mtdcore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5887feb347a4..c365c97e7232 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -956,8 +956,10 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
 		size = mtd_otp_size(mtd, true);
-		if (size < 0)
-			return size;
+		if (size < 0) {
+			err = size;
+			goto err;
+		}
 
 		if (size > 0) {
 			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
