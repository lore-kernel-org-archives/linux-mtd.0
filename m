Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB8C83F03
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jul 2025 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6p1nWzncJH60iLWi98X8XIkM3txaKIjSvG84Wo9tBHE=; b=GRMZgc0IPPyAim
	PtkfNw8D3/HUYF1+/r5dSI9f7aaefqAtwQlqtiqlvdej0zzRUaZ6k0/bL3/DANju/3FbPv7e8lRyo
	rstMFVUHS9tNbnxYVlAsRRdWI/AOoBf6QfzJKWjAJlE7sv086Wi9wwUuHZqah/rj5wAY9yfj8RBgo
	RC4fLlypjMDVusVwCVsIthfbMqOfldHyFuXnu4EVgh7tJ5pD4LvyX3BG7Fs+2UKT0KnOQOquwqseO
	Ip60UlVXlS4Yi6Ev2j80AjiwBWDuM9NSwVBqxhFSdF1XdisvvjUZ+oTVQ6K3vK5N+gu7kKq1FFXpf
	fyuoULxc5sP/ycJF0VwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbjN-0000000DjHI-1ANC;
	Fri, 04 Jul 2025 08:25:13 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFo-0000000Dd8m-0vvq
	for linux-mtd@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615680; x=1783151680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yOOYW/owvwXZgS2+HcQ7G4ePe8nCZzpY+QwYaMpoeI0=;
  b=WngI8cDbBZHfkCYJ5r/ln5I/iuk8bnfzzngfHd4TR9GGUEKQdoC9/Btg
   +TQnI/iefnjLm1qjDydGdtaBBH/IFFrWxOZUZawts6WbX9f+pggaVrxzw
   JKh/CFGqWUPRQbZ0nYqGy9P4JwLY1o7PqSOWJ34BWENhYgMSDHxTQ6ci0
   EQr7QFt3OpZTKQ66fNeUcjR1562kwyWaHE4QMCfhzIqgMdJYYlsxP18/M
   /1v3+yPAgTnlbUcVC4gT6mrbq/xrO3KnotRYlrkwY9f3xCZUF9e4n6Xz3
   316xJTzeJeAGAHnyCe5iZkM2AhCyaCUzQSWrhmMFVCOP9BquyRo25mthd
   A==;
X-CSE-ConnectionGUID: AifO02SNSEawyoeTD2H0GQ==
X-CSE-MsgGUID: 4WPNmXsbTSWsDoUZBYRqbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194116"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:40 -0700
X-CSE-ConnectionGUID: /AI2m1pvTg66r4GBAEPbDA==
X-CSE-MsgGUID: IR5aMR1DS2eGmRE/uCOv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616572"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:37 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1F96F44424;
	Fri,  4 Jul 2025 10:54:35 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/80] mtd: rawnand: gpmi: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:34 +0300
Message-Id: <20250704075434.3220589-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005440_297335_56F705D6 
X-CRM114-Status: UNSURE (   9.99  )
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
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f4e68008ea03..8c1bf09bdbae 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -188,7 +188,6 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 	return ret;
 }
@@ -758,7 +757,6 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 
 	ret = 0;
 err_out:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
@@ -2664,7 +2662,6 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	this->bch = false;
 
 out_pm:
-	pm_runtime_mark_last_busy(this->dev);
 	pm_runtime_put_autosuspend(this->dev);
 
 	return ret;
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
