Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD833CCF9E5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6GubTNHK+VjgR9irklJcXm3SLFYGzyoNbEphZSJ7xTY=; b=JfVMZEoENqjlKF
	EHKlwyDSs20cXiEv01CNVT12nH9Xs6alcOm5Dxd1Pisx6NBHRYmdByhqdfK75h3xFyxAzfArPDRf5
	CJgCgMHPlcBwow24jHU7IcrAqPNtwAySJy9dTDdomwz46xqQKPJHMMJTT7bm3gdg4X2uRqPxPK3An
	Nu7v7N8OqrtNu12CKE3D0edQ8Ov7iXJHLDXaw+6ZYdvlxVX82Jg+X5thcg01ytzV6y3kCI2vTfKmD
	bZaAb1NAen0ikTc9cPRmDxuvSNdk6IT1zfIpn4v5gLlW8GfBkDgGgou5m2PHPEX1LCsKMBMn8gUP0
	hfRmP94bJVQwAWbJrwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLaZ-0000000DnT5-2tiO;
	Mon, 27 Oct 2025 11:40:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLaW-0000000DnS9-2FQh
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 11:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565236; x=1793101236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1Y803tfH++q3iTQw4K8OppCnXwDpAUwOBj5XmSPZLxw=;
  b=L6n+mCCiVMElBBHNEwGY6HNrOiEUZLBRsAKEc5mZmCBLlVogc9jKJLvd
   Te2q4ORVmWfegt2x5Um9r3AD82nAhzzi99adVM1K8oxA1T7snfC4+cF9d
   8TUeMzmE55kiyfho23HXuHHs0jYWv+rsjCtaVc1HskJqfh1WUyjb6dFIM
   V8/qS4bSn2xkw/b6L+WxoaSf313oefjao8SIfuGMSRhD4gvXlLzYNl3gB
   C5zO961Yd2EDPXX+hhIWM6gqzLP+cj/t1qvzM7j0ThkqoWj0IVgHEpakf
   ik+rGkcO4AZIKjQ9BbR2TxWXkYipYJbbVTUI58qDOwbUlSZKs5STJXpXv
   w==;
X-CSE-ConnectionGUID: RCwMnTtRT7G1V412O0JOZQ==
X-CSE-MsgGUID: BdZXCTg5TRGBdoAlEcGhtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66254932"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="66254932"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:40:36 -0700
X-CSE-ConnectionGUID: LHkXLvlYSzqMZvlILnyZRw==
X-CSE-MsgGUID: ea//5+ppTnmJyF7SbDmzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184719428"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:40:34 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 906A5121E63;
	Mon, 27 Oct 2025 13:40:32 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLaS-00000001deg-2GDC;
	Mon, 27 Oct 2025 13:40:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	imx@lists.linux.dev
Subject: [PATCH 1/1] mtd: rawnand: gpmi: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:40:32 +0200
Message-ID: <20251027114032.390754-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_044036_583037_7D08C909 
X-CRM114-Status: UNSURE (   7.45  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index a750f5839e34..51f595fbc834 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -191,7 +191,6 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
@@ -761,7 +760,6 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = 0;
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
@@ -2667,7 +2665,6 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	this->bch = false;
 
 out_pm:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
