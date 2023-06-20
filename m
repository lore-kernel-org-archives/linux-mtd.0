Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691ACEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JDKUu2vpDXPTS5VZ+V7STM8ywOCHEtI7sQTXiJ6NvO4=; b=KeOW5gSzr8HZCf
	JN/ulUTrF31lwUR2BFjHc4Y6Xo2rLoNqTCN2P6Uvj9oyBCjI5M0fvnW1M4XOYfo1L26X/hm8JFKfr
	FbG+R9719PPN1Ti9zUVX3b3xczbhjCjtN8go2CmA/Z36rU7r7T+ZkuZ/BM4W075/uVkLhaQvTuHC6
	TvQD963TNGscPChl6rRpgMYVJ4TE8MFncHNcoFBGPRGbdcXmYQcYjbmBl+mNre3dnT55vjD1OLBqZ
	DtE/XeHPmBIOpuEzjtfFh7WqVl4wlDLypk92PyQ8faTx2TVioz/JtQ/Rwj2GDVxNS/W8Q4dxhAabH
	CmvXPjQ0XQav0kp/p81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbHB-00BMc8-1g;
	Tue, 20 Jun 2023 13:20:05 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbH9-00BMav-0g
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 13:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687267203; x=1718803203;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=//6nDkfKtxwUrmAE9sDBlISnk9pJuZNcILsoeTfza6o=;
  b=BkTUIWHys+LNEB88k4rZDY6gekiHSBDZHO+bYh1iYXYYNqbhAAD4zaDW
   8zkf0Rw62SdSMiusgZzJrOzbqispFRShitcAvWayPE/8dteDozKeAW3y9
   5njXOWcmNJuKK4tmRDrReMPuHQ3je8CIpda7fnDRrrUns9C/Dr3ecdRVq
   m2+VrdInU4kov2iSjVFuteue7zxUadXCtympAEv0bJQmNklD6ipCKGAYe
   PJtVmusiKKznWuJBJ75b1KWjDFAGIkfD5wysb6c/E5zmKLl7zhHmu1C6e
   j0XpICmyc1bpCkmhX2xTpXp8hsEagQDhF3BuyYoWXHA/icLhdBLs5xVPX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349588266"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="349588266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691426914"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="691426914"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:19:58 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 0/2] mtd: prepare for dynamically removed devices
Date: Tue, 20 Jun 2023 16:19:03 +0300
Message-Id: <20230620131905.648089-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_062003_376766_51C1883C 
X-CRM114-Status: UNSURE (   9.02  )
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

Prepare mtd subsystem for devices that can be dynamically removed,
like memory on PCIE card.
Use refcount to prevent crashes when underlying device
removed unexpectedly and reshuffle __get and __put functions
to allow underlying device to clean it memory according to refcount.

Alexander Usyskin (1):
  mtd: call external _get and _put in right order

Tomas Winkler (1):
  mtd: use refcount to prevent corruption

 drivers/mtd/mtdcore.c   | 86 ++++++++++++++++++++++-------------------
 drivers/mtd/mtdcore.h   |  1 +
 drivers/mtd/mtdpart.c   | 14 ++++---
 include/linux/mtd/mtd.h |  2 +-
 4 files changed, 56 insertions(+), 47 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
