Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB826CFA755
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMVehQ0XMVfW9xxtph/sr1sRsTYNw3NRf1BEooBaRRY=; b=HZy1LZeayx2k1A
	KwvUTOKEWgQ4R6tqWUQLt6UZy+j52ILVylI1lHooBEZBynVc7csEbb7ASK2BmspzrdmecV9CBojA4
	D+XJVdYKCLhCww6FWeNPGBaDRA/unQ9UAG7T59nb/S3oZ/gjJwryoheinr5qmrntwZozGXaZWuLO7
	1G9tiIcwK9tKs1vOeOjdza8JY8LgiRlxynKgyV+9mR6fETJR9gSW2TYSxPNDt4+VbH4S4z60JFFFW
	OlH+P9sPOHZthQ7dQRDD5tQf752dXkC9p79HM2YmXzdFMYVnn06RENYStyHOlNqgOZqlqbiPdLKFZ
	evqlg4mK161LbRoMtEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sweuu-0000000BhsN-2tEp;
	Fri, 04 Oct 2024 09:48:08 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sweoc-0000000Bfwm-0lNu
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 09:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034898; x=1759570898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+EgMj4clI2O5vns96g1HzGSv2l/7QU0g4MAW4k0tphs=;
  b=SXxJPVDBd9yftEW9pgZu896lNpwr2+hDezN2+vvRiMqd6apIJANkKI0N
   tWm/NlgXuKf5xib6TM+6HE2yn1dBdmGfEGlpP6MllgCYKw+NHgrt6VucH
   OmOrTE46Oj4VIqMDF18e1iqwPYFJV3ItM17DbGY2YYnF3eYJuWM86Qf9T
   AQFfJp8zk2MqCeyRf1pBdhAWzmKpJNBEwNpmvW+TNxjq7ILlq22vKPAZO
   mYQWSPNFUx26hp5qP60e+ZhUnyn/g2Xh5wKSLF2Tu9UsvTnZdre8FpE2C
   Teog3pXoCq+QY+i/dx0AzPvF+/h1Zcqbb/4OXmYLCrK8IANbT0L/0besd
   g==;
X-CSE-ConnectionGUID: wSQ/BLc9SeWDxCHqeZUU1w==
X-CSE-MsgGUID: BVonEEr6RP6MK2o/OVOEhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52656251"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="52656251"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:37 -0700
X-CSE-ConnectionGUID: 7radM3aSR5yobmIGgrfzwA==
X-CSE-MsgGUID: A590qf2ARjCzMq+Ze47j+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74975086"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DAFEF1203FA;
	Fri,  4 Oct 2024 12:41:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoX-000TcQ-2q;
	Fri, 04 Oct 2024 12:41:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 29/51] mtd: rawnand: gpmi: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:33 +0300
Message-Id: <20241004094133.113844-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_024138_254661_D7B4CDAC 
X-CRM114-Status: GOOD (  11.46  )
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index e1b515304e3c..1a8fe322f5d6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -187,7 +187,7 @@ static int gpmi_init(struct gpmi_nand_data *this)
 
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
-	pm_runtime_put_autosuspend(this->dev);
+	__pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
 
@@ -739,7 +739,7 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = pm_runtime_get_sync(this->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(this->dev);
+		__pm_runtime_put_autosuspend(this->dev);
 		return ret;
 	}
 
@@ -758,7 +758,7 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	ret = 0;
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
-	pm_runtime_put_autosuspend(this->dev);
+	__pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
 }
@@ -2664,7 +2664,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 
 out_pm:
 	pm_runtime_mark_last_busy(this->dev);
-	pm_runtime_put_autosuspend(this->dev);
+	__pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
 }
@@ -2780,7 +2780,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 		goto exit_nfc_init;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(this->dev, "driver registered.\n");
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
