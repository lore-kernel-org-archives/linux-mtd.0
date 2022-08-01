Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B7DC19F2C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Aug 2022 02:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2hTtd4fAgdemJ7VuWuqvFh7b0qBjhI6QiFeGYBNdNzo=; b=B0QT20vpmaYHOm
	ltPgNK50VlNx9wi6mmPXB1uMJdAlb/OFj8voIrhrSBljrgl18KEAaWhtW8fnlxV5o67dGTqWFPAIC
	7wATYMMLK1jyMfPNp0Na2VjiGirf0Sb8alCDqaQPU093xMFMbdIW0ndge5tCxQPEhiOkgdASffF/+
	K67V7t0/ABUPXuEUPHWeuWJdSZOqamnVvmKuXY0JU/9v0L8GVUpx/4ipJf9wKX19tw1uOPI2w7dH5
	Fb5FLs8uP7HneVuEeJ+9pDBu+pAzbP1J80ivLBQ81LaouSklA3L9zfRfKTR5yng/A+gOGLWv1yTDy
	5/F+e/iIeLj3xzyeO+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oILcs-000yPA-Dt; Mon, 01 Aug 2022 02:57:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oILcp-000yMW-6Y
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2022 02:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659322666; x=1690858666;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VDLr2sFET7CoU2K76oqFi33BMQjtx9TBBb+e5PhJaXU=;
  b=fDhmcR4Ea3sJ/dKVFC3BEbYaO1tsuEXqIrXZJgTL46DC68N+Mk1fnuQC
   MnaA7BQ0pie8A/B5OBgzDco4nzhfWgBN3il6Ff3oYZH4bPkPR1p4iDXhT
   YgVVKcc+H9yc6B9lAGe/Vj3XtkkPL91RY2Cjvfqx5rj2oFwGRkD7V4S1a
   DzcFx0WHrG9L0W85aRRXaEEWdeu3sGqqp17kMOwuhJr7Oc0W0rZldeZeG
   1LBYUiiJ02xAbdiMQuaGOdGxipQJj581x1eonfDHDBQa7PYJ9Jv1k59p3
   BkgzGjMD9AXIwv0yhkWPBvJHrx1N+rXqYikglJhKBc5Kb2legYY9vE9Rj
   A==;
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="184522739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2022 19:57:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 31 Jul 2022 19:57:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Sun, 31 Jul 2022 19:57:42 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <novikov@ispras.ru>, <vasilyev@ispras.ru>, <kirill.shilimanov@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: rawnand: intel: Remove macro that is already defined in the core
Date: Mon, 1 Aug 2022 05:57:40 +0300
Message-ID: <20220801025740.47191-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_195747_376116_111C0FA5 
X-CRM114-Status: UNSURE (   7.84  )
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

NAND_DATA_IFACE_CHECK_ONLY is already defined in
include/linux/mtd/rawnand.h. The intel driver includes
<linux/mtd/rawnand.h>, so remove the duplicate definition from the intel
driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 7c1c80dae826..fbf6731420d6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -99,8 +99,6 @@
 
 #define HSNAND_ECC_OFFSET	0x008
 
-#define NAND_DATA_IFACE_CHECK_ONLY	-1
-
 #define MAX_CS	2
 
 #define USEC_PER_SEC	1000000L
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
