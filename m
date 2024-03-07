Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDC6C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7LSNRTXVov49Cv9MrrCp7xPZenwnSaqrSgYtwVjk1A=; b=geIsqBy04sdXf4
	WuEQ2TOhcIoyxMmzIb9Tig1STmMBCu7P7zv9q2UJ4lyvsrgWxkApwEeoOAFb/FxsEBSJ/EL+Jtr1u
	bo02Ovr8flp2H5riXQ/NIuimSO1uVvh13XyWW0ceHSnZlSQluAI9OYs67tMnTtd7HH10z6J1/fXPY
	T+P29PxoSNKvjBv/9V6JlFjX5BvT4VZGqg0c8fBM3wACvkAtqFzVUy52SAIWekuV452QmSAlzj+LR
	twawvqBqPZtWyZdJdoh/rz/Uidt/9RjGh4M9UdyjYqI6+fz9oPyIkpnjYBOMuLXzDyX7HA5gu6i5p
	db39PypWrP/H6fYpINlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQO-00000004evx-1bO4;
	Thu, 07 Mar 2024 13:04:40 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riDQL-00000004eum-2Cvs
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 13:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709816678; x=1741352678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ydcV8KjuRh1M2V0fUWpxwuVFVEPey+xI15J/nZoDhU4=;
  b=XK1WlkU3ErSdriQ9dd5Nc6SOOA66veelwjbo/dUOsOaEllTVpSkR0eEr
   Y68DnsgkBgBp9gqDbIS+p02/xmL3VsF+0Z60skEaTiWBB/eypgHgQ6nlv
   sLjJugIsr+rx3LGw1LiKNxXxcQCp+veBUHhQK1uleoGlFxtC16t23dL1h
   eZcHmRWYDA4ePylbVWC+kUnAZEbyw6Ab99l/QHD/Oco6d5Qt+8qs/Smow
   E3GHbLGH72Ih6kQK/Bdtl2iunnBeLoyZefQ+2kITnVM3pbxW8FIS7QMGd
   rT7nw8B+ojz+yz7D5fZDKbom9VRd2aWUGUyZPDVHtO3qcyVvsNl/T1oaq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5068063"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="5068063"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="14592316"
Received: from unknown (HELO localhost) ([10.237.72.159])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:04:35 -0800
From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
Date: Thu,  7 Mar 2024 15:04:17 +0200
Message-ID: <20240307130418.3131898-2-aapo.vienamo@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_050437_624202_3C05FE7D 
X-CRM114-Status: GOOD (  12.10  )
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
