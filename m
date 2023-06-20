Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F57CEB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZJcuxcQYbjfC9eLvlMuzDuysZkz01wFePrymjos1uE=; b=wj25CV3eUKnNtu
	YxAYAkw8ZsprunDe+lXgrQXAiys/hqjRCEIfPgzv6yTsw49tED7n/EXecZZfBwEuUmcEXXw0FC0hE
	FPYan1oUs5JUoa/sqk2RSORgz3QKBBEvSwFTE8km7RxHEP1+t+xyrDWIFLYMehV/S9U/He1xIeMY9
	bCzypr2oaaHHSqAu8Vw4OE/FmuOSCIykqXv/9oy6PG+1N3/WfQuK9tT/4YCrKsVAbSq6Ra51N0JpO
	Yu2OMnxZe6jQOvviKaEUB4/9Mj2Ln7kovSD8JDzENng7V88B/MZDgvpn+RLrLAvhCEsPe3QGap3T+
	hVcBQKu/Ciwa46HWmjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbHF-00BMdx-2o;
	Tue, 20 Jun 2023 13:20:09 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbHD-00BMd4-1n
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 13:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687267207; x=1718803207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ioFas3xTWzb8p1vfOgeqS8+ZIZhYvxBAQPoT1srDwhE=;
  b=WHUMFzbRT/OpItdvOO/eZZYgtbO55Y8rA81CcfsxAtaShB+FyiydIEE/
   vyTYsUYJsy0m1GiiJK0hVuWGvQxqh7EGN/1AtU7xeIajKEeyslb0ydaS6
   2K6um9XI2xnNYmWjNiWM3Um5VTIgnGc6I5ul6msIcn2BQzBXpDoRFmfeN
   GI2Q9T/tOlU2MgvwStmFDzbzczwvJ5jWbFr2ApeaSuZLVRgz2rIU1RtNq
   OOatewkdp71+0kHRldHpM4ZjJA7DriEYIBM0opigwvo14ECxclGHZh45/
   Aa0oaV5ktP3QFstxFIiiFGbus8AxCwIjCYHK3UemnKz3dQFwgkCWVnwjn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349588300"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="349588300"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691427007"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="691427007"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:20:04 -0700
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
Subject: [PATCH 2/2] mtd: call external _get and _put in right order
Date: Tue, 20 Jun 2023 16:19:05 +0300
Message-Id: <20230620131905.648089-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620131905.648089-1-alexander.usyskin@intel.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_062007_640746_6AE43312 
X-CRM114-Status: GOOD (  15.30  )
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

MTD provider provides mtd_info object to mtd subsystem.
With kref patch the mtd_info object can be alive after
provider released mtd device.
Fix calling order in _get and _put functions to allow
mtd provider to safely alloc and release mtd object.

Execute:
1) call external _get
2) get_module
3) add internal kref
in the get function and opposite order in the put one.

The _put_device callback should be the last in put
as the master struct memory may be freed in this callback.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/mtdcore.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 84bd1878367d..a5bc60013edf 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1227,21 +1227,20 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
-	if (!try_module_get(master->owner))
-		return -ENODEV;
-
-	kref_get(&mtd->refcnt);
-
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
-
-		if (err) {
-			kref_put(&mtd->refcnt, mtd_device_release);
-			module_put(master->owner);
+		if (err)
 			return err;
-		}
 	}
 
+	if (!try_module_get(master->owner)) {
+		if (master->_put_device)
+			master->_put_device(master);
+		return -ENODEV;
+	}
+
+	kref_get(&mtd->refcnt);
+
 	while (mtd->parent) {
 		if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd->parent != master)
 			kref_get(&mtd->parent->refcnt);
@@ -1338,13 +1337,14 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (master->_put_device)
-		master->_put_device(master);
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
-		kref_put(&master->refcnt, mtd_device_release);
+	/* must be the last as master can be freed in the _put_device */
+	if (master->_put_device)
+		master->_put_device(master);
 }
 EXPORT_SYMBOL_GPL(__put_mtd_device);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
